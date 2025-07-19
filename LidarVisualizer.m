classdef LidarVisualizer < matlab.System
    properties(Access = private)
        globalMap   
    end

    methods(Access = protected)
        function setupImpl(obj)
            obj.globalMap = [];
        end

        function stepImpl(obj, ptCloudXYZ)

            if ~isempty(ptCloudXYZ)
                obj.globalMap = [obj.globalMap; ptCloudXYZ];
            end
        end

        function resetImpl(obj)
            obj.globalMap = [];
        end

        function releaseImpl(obj)
            coder.extrinsic('assignin', 'pcshow', 'figure', 'title');

            figure('Name', 'Mappa Totale LiDAR');
            pcshow(obj.globalMap);
            title('Global LiDAR Map');

            assignin('base', 'globalLidarMap', obj.globalMap);
        end
    end
end
