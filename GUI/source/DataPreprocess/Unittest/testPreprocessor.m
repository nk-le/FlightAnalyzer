%% Get ts from datasample
[info] = SensorInfo();
dataHandle = load("flight_data_parsed_09-Sep-2022.mat");
dataTable = dataHandle.data_table;

%% Translate the topics into time series
dataTable = Topics2Ts(dataTable, "ATTITUDE", info.vn200.att);
dataTable = Topics2Ts(dataTable, "ATTITUDE_RATE", info.vn200.rate);
dataTable = Topics2Ts(dataTable, "VELOCITY_NED", info.vn200.vel);
dataTable = Topics2Ts(dataTable, "POSITION", info.vn200.pos);
dataTable = Topics2Ts(dataTable, "LIDAR_GROUND", info.lw20.ss);
dataTable = Topics2Ts(dataTable, "LIDAR_GROUND", info.lw20.d);


















