กำหนดให้พื้นที่ที่เดินได้มีขนาด 300*220 pixel

## reg [11:0] enemyPos [7:0]

enemyPos[n] = {from[0:1], to[2:3], distanceFromSpawnPoint[4:12]}



enemyPos[0] = {0, 1, 7'd45}

แปลว่า ศัตรูตัวที่ 1 หันหน้าออกจากทิศเหนือ มุ่งหน้าไปทางทิศใต้ ห่างจากจุดกำเนิดทิศเหนือไป 44 pixel

enemyPos[5] = {2, 0, 7'd33}

แปลว่า ศัตรูตัวที่ 6 หันหน้าออกจากทิศตะวันตก มุ่งหน้าไปทางทิศเหนือ ห่างจากจุดกำเนิดทิศตะวันตกไป 32 pixel

enemyPos[9] = {x, x, 7'd0}

แปลว่า ศัตรูตัวที่ 10 ไม่มีตัวตนในแผนที่ (ยังอยู่ในจุดเริ่มต้น ไม่ถึงคิว) x หมายถึงค่าใดๆ ระหว่า 0-3


## reg [9:0] gunPos [7:0]

gunPos[n] = {direction[0:1], distanceFromSpawnPoint[2:10]}

gunPos[0] = {0, 7'd45}

แปลว่า กระสุนลูกที่ 1 วิ่งไปทางทิศเหนือ ห่างจากทิศเหนือ 44 pixel

gunPos[5] = {2, 7'd33}

แปลว่า กระสุนลูกที่ 6 วิ่งไปทางทิศตะวันตก ห่างจากทิศตะวันตก 32 ยรปำส

gunPos[9] = {x, x, 7'd0}

แปลว่า กระสุนลูกที่ 10 ไม่มีตัวตนในแผนที่ (ยังอยู่ในจุดเริ่มต้น ไม่ถึงคิว) x หมายถึงค่าใดๆ ระหว่า 0-3

อธิบายทิศทาง
  0 
  |
2-.-3
  |
  1

## reg [17:0] charPos

charPos = {direction[0:1], x[2:10], y[11:17]}