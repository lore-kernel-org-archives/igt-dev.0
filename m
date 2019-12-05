Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9716F4E4
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2019 13:02:55 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  5 Dec 2019 15:02:46 +0200
Message-Id: <20191205130246.21695-2-petri.latvala@intel.com>
In-Reply-To: <20191205130246.21695-1-petri.latvala@intel.com>
References: <20191205130246.21695-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner/json_tests: Test handling of
 unprintable output from tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0341561395=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0341561395==
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

A simple test output with numbers from 1 to 255, both in plain text
form and as a single byte with that particular value.

Note that the json spec doesn't require \u-encoding for characters
other than '"', '\' and the range U+0000 to U+001F, the raw
non-\u-encoded UTF-8 in the reference.json file for bytes 128 and up
is what libjson-c outputs for those codepoints and is valid.

The validity of the json file can be verified with iconv, i.e.

 $ iconv -f UTF-8 reference.json -o /dev/null && echo it is utf-8

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 .../unprintable-characters/0/dmesg.txt        |   5 +
 .../unprintable-characters/0/err.txt          | 258 +++++++++++++++++
 .../unprintable-characters/0/journal.txt      |   2 +
 .../unprintable-characters/0/out.txt          | 259 ++++++++++++++++++
 .../unprintable-characters/README.txt         |   2 +
 .../unprintable-characters/endtime.txt        |   1 +
 .../unprintable-characters/joblist.txt        |   1 +
 .../unprintable-characters/metadata.txt       |  12 +
 .../unprintable-characters/reference.json     |  72 +++++
 .../unprintable-characters/starttime.txt      |   1 +
 .../unprintable-characters/uname.txt          |   1 +
 runner/runner_json_tests.c                    |   1 +
 12 files changed, 615 insertions(+)
 create mode 100644 runner/json_tests_data/unprintable-characters/0/dmesg.t=
xt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/err.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/journal=
.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/0/out.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/README.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/endtime.t=
xt
 create mode 100644 runner/json_tests_data/unprintable-characters/joblist.t=
xt
 create mode 100644 runner/json_tests_data/unprintable-characters/metadata.=
txt
 create mode 100644 runner/json_tests_data/unprintable-characters/reference=
.json
 create mode 100644 runner/json_tests_data/unprintable-characters/starttime=
.txt
 create mode 100644 runner/json_tests_data/unprintable-characters/uname.txt

diff --git a/runner/json_tests_data/unprintable-characters/0/dmesg.txt b/ru=
nner/json_tests_data/unprintable-characters/0/dmesg.txt
new file mode 100644
index 00000000..6aac2735
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/0/dmesg.txt
@@ -0,0 +1,5 @@
+6,951,3216186095083,-;Console: switching to colour dummy device 80x25
+14,952,3216186095097,-;[IGT] successtest: executing
+14,953,3216186101115,-;[IGT] successtest: starting subtest first-subtest
+14,955,3216186101160,-;[IGT] successtest: exiting, ret=3D0
+6,956,3216186101299,-;Console: switching to colour frame buffer device 240=
x75
diff --git a/runner/json_tests_data/unprintable-characters/0/err.txt b/runn=
er/json_tests_data/unprintable-characters/0/err.txt
new file mode 100644
index 00000000..34d19985
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/0/err.txt
@@ -0,0 +1,258 @@
+Starting subtest: first-subtest
+1:=01
+2:=02
+3:=03
+4:=04
+5:=05
+6:=06
+7:=07
+8:=08
+9:=09
+10:
+
+11:=0B
+12:=0C
+13:=0D
+14:=0E
+15:=0F
+16:=10
+17:=11
+18:=12
+19:=13
+20:=14
+21:=15
+22:=16
+23:=17
+24:=18
+25:=19
+26:=1A
+27:=1B
+28:=1C
+29:=1D
+30:=1E
+31:=1F
+32:=20
+33:!
+34:"
+35:#
+36:$
+37:%
+38:&
+39:'
+40:(
+41:)
+42:*
+43:+
+44:,
+45:-
+46:.
+47:/
+48:0
+49:1
+50:2
+51:3
+52:4
+53:5
+54:6
+55:7
+56:8
+57:9
+58::
+59:;
+60:<
+61:=3D
+62:>
+63:?
+64:@
+65:A
+66:B
+67:C
+68:D
+69:E
+70:F
+71:G
+72:H
+73:I
+74:J
+75:K
+76:L
+77:M
+78:N
+79:O
+80:P
+81:Q
+82:R
+83:S
+84:T
+85:U
+86:V
+87:W
+88:X
+89:Y
+90:Z
+91:[
+92:\
+93:]
+94:^
+95:_
+96:`
+97:a
+98:b
+99:c
+100:d
+101:e
+102:f
+103:g
+104:h
+105:i
+106:j
+107:k
+108:l
+109:m
+110:n
+111:o
+112:p
+113:q
+114:r
+115:s
+116:t
+117:u
+118:v
+119:w
+120:x
+121:y
+122:z
+123:{
+124:|
+125:}
+126:~
+127:=7F
+128:=80
+129:=81
+130:=82
+131:=83
+132:=84
+133:=85
+134:=86
+135:=87
+136:=88
+137:=89
+138:=8A
+139:=8B
+140:=8C
+141:=8D
+142:=8E
+143:=8F
+144:=90
+145:=91
+146:=92
+147:=93
+148:=94
+149:=95
+150:=96
+151:=97
+152:=98
+153:=99
+154:=9A
+155:=9B
+156:=9C
+157:=9D
+158:=9E
+159:=9F
+160:=A0
+161:=A1
+162:=A2
+163:=A3
+164:=A4
+165:=A5
+166:=A6
+167:=A7
+168:=A8
+169:=A9
+170:=AA
+171:=AB
+172:=AC
+173:=AD
+174:=AE
+175:=AF
+176:=B0
+177:=B1
+178:=B2
+179:=B3
+180:=B4
+181:=B5
+182:=B6
+183:=B7
+184:=B8
+185:=B9
+186:=BA
+187:=BB
+188:=BC
+189:=BD
+190:=BE
+191:=BF
+192:=C0
+193:=C1
+194:=C2
+195:=C3
+196:=C4
+197:=C5
+198:=C6
+199:=C7
+200:=C8
+201:=C9
+202:=CA
+203:=CB
+204:=CC
+205:=CD
+206:=CE
+207:=CF
+208:=D0
+209:=D1
+210:=D2
+211:=D3
+212:=D4
+213:=D5
+214:=D6
+215:=D7
+216:=D8
+217:=D9
+218:=DA
+219:=DB
+220:=DC
+221:=DD
+222:=DE
+223:=DF
+224:=E0
+225:=E1
+226:=E2
+227:=E3
+228:=E4
+229:=E5
+230:=E6
+231:=E7
+232:=E8
+233:=E9
+234:=EA
+235:=EB
+236:=EC
+237:=ED
+238:=EE
+239:=EF
+240:=F0
+241:=F1
+242:=F2
+243:=F3
+244:=F4
+245:=F5
+246:=F6
+247:=F7
+248:=F8
+249:=F9
+250:=FA
+251:=FB
+252:=FC
+253:=FD
+254:=FE
+255:=FF
+Subtest first-subtest: SUCCESS (0.000s)
diff --git a/runner/json_tests_data/unprintable-characters/0/journal.txt b/=
runner/json_tests_data/unprintable-characters/0/journal.txt
new file mode 100644
index 00000000..86a30e07
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/0/journal.txt
@@ -0,0 +1,2 @@
+first-subtest
+exit:0 (0.014s)
diff --git a/runner/json_tests_data/unprintable-characters/0/out.txt b/runn=
er/json_tests_data/unprintable-characters/0/out.txt
new file mode 100644
index 00000000..c597674a
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/0/out.txt
@@ -0,0 +1,259 @@
+IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: first-subtest
+1:=01
+2:=02
+3:=03
+4:=04
+5:=05
+6:=06
+7:=07
+8:=08
+9:=09
+10:
+
+11:=0B
+12:=0C
+13:=0D
+14:=0E
+15:=0F
+16:=10
+17:=11
+18:=12
+19:=13
+20:=14
+21:=15
+22:=16
+23:=17
+24:=18
+25:=19
+26:=1A
+27:=1B
+28:=1C
+29:=1D
+30:=1E
+31:=1F
+32:=20
+33:!
+34:"
+35:#
+36:$
+37:%
+38:&
+39:'
+40:(
+41:)
+42:*
+43:+
+44:,
+45:-
+46:.
+47:/
+48:0
+49:1
+50:2
+51:3
+52:4
+53:5
+54:6
+55:7
+56:8
+57:9
+58::
+59:;
+60:<
+61:=3D
+62:>
+63:?
+64:@
+65:A
+66:B
+67:C
+68:D
+69:E
+70:F
+71:G
+72:H
+73:I
+74:J
+75:K
+76:L
+77:M
+78:N
+79:O
+80:P
+81:Q
+82:R
+83:S
+84:T
+85:U
+86:V
+87:W
+88:X
+89:Y
+90:Z
+91:[
+92:\
+93:]
+94:^
+95:_
+96:`
+97:a
+98:b
+99:c
+100:d
+101:e
+102:f
+103:g
+104:h
+105:i
+106:j
+107:k
+108:l
+109:m
+110:n
+111:o
+112:p
+113:q
+114:r
+115:s
+116:t
+117:u
+118:v
+119:w
+120:x
+121:y
+122:z
+123:{
+124:|
+125:}
+126:~
+127:=7F
+128:=80
+129:=81
+130:=82
+131:=83
+132:=84
+133:=85
+134:=86
+135:=87
+136:=88
+137:=89
+138:=8A
+139:=8B
+140:=8C
+141:=8D
+142:=8E
+143:=8F
+144:=90
+145:=91
+146:=92
+147:=93
+148:=94
+149:=95
+150:=96
+151:=97
+152:=98
+153:=99
+154:=9A
+155:=9B
+156:=9C
+157:=9D
+158:=9E
+159:=9F
+160:=A0
+161:=A1
+162:=A2
+163:=A3
+164:=A4
+165:=A5
+166:=A6
+167:=A7
+168:=A8
+169:=A9
+170:=AA
+171:=AB
+172:=AC
+173:=AD
+174:=AE
+175:=AF
+176:=B0
+177:=B1
+178:=B2
+179:=B3
+180:=B4
+181:=B5
+182:=B6
+183:=B7
+184:=B8
+185:=B9
+186:=BA
+187:=BB
+188:=BC
+189:=BD
+190:=BE
+191:=BF
+192:=C0
+193:=C1
+194:=C2
+195:=C3
+196:=C4
+197:=C5
+198:=C6
+199:=C7
+200:=C8
+201:=C9
+202:=CA
+203:=CB
+204:=CC
+205:=CD
+206:=CE
+207:=CF
+208:=D0
+209:=D1
+210:=D2
+211:=D3
+212:=D4
+213:=D5
+214:=D6
+215:=D7
+216:=D8
+217:=D9
+218:=DA
+219:=DB
+220:=DC
+221:=DD
+222:=DE
+223:=DF
+224:=E0
+225:=E1
+226:=E2
+227:=E3
+228:=E4
+229:=E5
+230:=E6
+231:=E7
+232:=E8
+233:=E9
+234:=EA
+235:=EB
+236:=EC
+237:=ED
+238:=EE
+239:=EF
+240:=F0
+241:=F1
+242:=F2
+243:=F3
+244:=F4
+245:=F5
+246:=F6
+247:=F7
+248:=F8
+249:=F9
+250:=FA
+251:=FB
+252:=FC
+253:=FD
+254:=FE
+255:=FF
+Subtest first-subtest: SUCCESS (0.000s)
diff --git a/runner/json_tests_data/unprintable-characters/README.txt b/run=
ner/json_tests_data/unprintable-characters/README.txt
new file mode 100644
index 00000000..046605ea
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/README.txt
@@ -0,0 +1,2 @@
+Any nonprintable output in stdout and stderr should yield a json file
+that is still valid UTF-8.
diff --git a/runner/json_tests_data/unprintable-characters/endtime.txt b/ru=
nner/json_tests_data/unprintable-characters/endtime.txt
new file mode 100644
index 00000000..635f6ae9
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/endtime.txt
@@ -0,0 +1 @@
+1539953735.172373
diff --git a/runner/json_tests_data/unprintable-characters/joblist.txt b/ru=
nner/json_tests_data/unprintable-characters/joblist.txt
new file mode 100644
index 00000000..81f914a7
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/joblist.txt
@@ -0,0 +1 @@
+successtest first-subtest
diff --git a/runner/json_tests_data/unprintable-characters/metadata.txt b/r=
unner/json_tests_data/unprintable-characters/metadata.txt
new file mode 100644
index 00000000..c501ae0e
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/metadata.txt
@@ -0,0 +1,12 @@
+abort_mask : 0
+name : normal-run
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 0
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
diff --git a/runner/json_tests_data/unprintable-characters/reference.json b=
/runner/json_tests_data/unprintable-characters/reference.json
new file mode 100644
index 00000000..d3add1eb
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/reference.json
@@ -0,0 +1,72 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"normal-run",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-0=
6) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1539953735.1110389,
+    "end":1539953735.1723731
+  },
+  "tests":{
+    "igt@successtest@first-subtest":{
+      "out":"IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: first-subtest\n1:\u0001\n2:\u0002\n3:\u0003\n4:\u=
0004\n5:\u0005\n6:\u0006\n7:\u0007\n8:\b\n9:\t\n10:\n\n11:\u000b\n12:\f\n13=
:\r\n14:\u000e\n15:\u000f\n16:\u0010\n17:\u0011\n18:\u0012\n19:\u0013\n20:\=
u0014\n21:\u0015\n22:\u0016\n23:\u0017\n24:\u0018\n25:\u0019\n26:\u001a\n27=
:\u001b\n28:\u001c\n29:\u001d\n30:\u001e\n31:\u001f\n32: \n33:!\n34:\"\n35:=
#\n36:$\n37:%\n38:&\n39:'\n40:(\n41:)\n42:*\n43:+\n44:,\n45:-\n46:.\n47:\/\=
n48:0\n49:1\n50:2\n51:3\n52:4\n53:5\n54:6\n55:7\n56:8\n57:9\n58::\n59:;\n60=
:<\n61:=3D\n62:>\n63:?\n64:@\n65:A\n66:B\n67:C\n68:D\n69:E\n70:F\n71:G\n72:=
H\n73:I\n74:J\n75:K\n76:L\n77:M\n78:N\n79:O\n80:P\n81:Q\n82:R\n83:S\n84:T\n=
85:U\n86:V\n87:W\n88:X\n89:Y\n90:Z\n91:[\n92:\\\n93:]\n94:^\n95:_\n96:`\n97=
:a\n98:b\n99:c\n100:d\n101:e\n102:f\n103:g\n104:h\n105:i\n106:j\n107:k\n108=
:l\n109:m\n110:n\n111:o\n112:p\n113:q\n114:r\n115:s\n116:t\n117:u\n118:v\n1=
19:w\n120:x\n121:y\n122:z\n123:{\n124:|\n125:}\n126:~\n127:=7F\n128:=C2=80\=
n129:=C2=81\n130:=C2=82\n131:=C2=83\n132:=C2=84\n133:=C2=85\n134:=C2=86\n13=
5:=C2=87\n136:=C2=88\n137:=C2=89\n138:=C2=8A\n139:=C2=8B\n140:=C2=8C\n141:=
=C2=8D\n142:=C2=8E\n143:=C2=8F\n144:=C2=90\n145:=C2=91\n146:=C2=92\n147:=C2=
=93\n148:=C2=94\n149:=C2=95\n150:=C2=96\n151:=C2=97\n152:=C2=98\n153:=C2=99=
\n154:=C2=9A\n155:=C2=9B\n156:=C2=9C\n157:=C2=9D\n158:=C2=9E\n159:=C2=9F\n1=
60:=C2=A0\n161:=C2=A1\n162:=C2=A2\n163:=C2=A3\n164:=C2=A4\n165:=C2=A5\n166:=
=C2=A6\n167:=C2=A7\n168:=C2=A8\n169:=C2=A9\n170:=C2=AA\n171:=C2=AB\n172:=C2=
=AC\n173:=C2=AD\n174:=C2=AE\n175:=C2=AF\n176:=C2=B0\n177:=C2=B1\n178:=C2=B2=
\n179:=C2=B3\n180:=C2=B4\n181:=C2=B5\n182:=C2=B6\n183:=C2=B7\n184:=C2=B8\n1=
85:=C2=B9\n186:=C2=BA\n187:=C2=BB\n188:=C2=BC\n189:=C2=BD\n190:=C2=BE\n191:=
=C2=BF\n192:=C3=80\n193:=C3=81\n194:=C3=82\n195:=C3=83\n196:=C3=84\n197:=C3=
=85\n198:=C3=86\n199:=C3=87\n200:=C3=88\n201:=C3=89\n202:=C3=8A\n203:=C3=8B=
\n204:=C3=8C\n205:=C3=8D\n206:=C3=8E\n207:=C3=8F\n208:=C3=90\n209:=C3=91\n2=
10:=C3=92\n211:=C3=93\n212:=C3=94\n213:=C3=95\n214:=C3=96\n215:=C3=97\n216:=
=C3=98\n217:=C3=99\n218:=C3=9A\n219:=C3=9B\n220:=C3=9C\n221:=C3=9D\n222:=C3=
=9E\n223:=C3=9F\n224:=C3=A0\n225:=C3=A1\n226:=C3=A2\n227:=C3=A3\n228:=C3=A4=
\n229:=C3=A5\n230:=C3=A6\n231:=C3=A7\n232:=C3=A8\n233:=C3=A9\n234:=C3=AA\n2=
35:=C3=AB\n236:=C3=AC\n237:=C3=AD\n238:=C3=AE\n239:=C3=AF\n240:=C3=B0\n241:=
=C3=B1\n242:=C3=B2\n243:=C3=B3\n244:=C3=B4\n245:=C3=B5\n246:=C3=B6\n247:=C3=
=B7\n248:=C3=B8\n249:=C3=B9\n250:=C3=BA\n251:=C3=BB\n252:=C3=BC\n253:=C3=BD=
\n254:=C3=BE\n255:=C3=BF\nSubtest first-subtest: SUCCESS (0.000s)\n",
+      "igt-version":"IGT-Version: 1.23-g0c763bfd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"warn",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0
+      },
+      "err":"Starting subtest: first-subtest\n1:\u0001\n2:\u0002\n3:\u0003=
\n4:\u0004\n5:\u0005\n6:\u0006\n7:\u0007\n8:\b\n9:\t\n10:\n\n11:\u000b\n12:=
\f\n13:\r\n14:\u000e\n15:\u000f\n16:\u0010\n17:\u0011\n18:\u0012\n19:\u0013=
\n20:\u0014\n21:\u0015\n22:\u0016\n23:\u0017\n24:\u0018\n25:\u0019\n26:\u00=
1a\n27:\u001b\n28:\u001c\n29:\u001d\n30:\u001e\n31:\u001f\n32: \n33:!\n34:\=
"\n35:#\n36:$\n37:%\n38:&\n39:'\n40:(\n41:)\n42:*\n43:+\n44:,\n45:-\n46:.\n=
47:\/\n48:0\n49:1\n50:2\n51:3\n52:4\n53:5\n54:6\n55:7\n56:8\n57:9\n58::\n59=
:;\n60:<\n61:=3D\n62:>\n63:?\n64:@\n65:A\n66:B\n67:C\n68:D\n69:E\n70:F\n71:=
G\n72:H\n73:I\n74:J\n75:K\n76:L\n77:M\n78:N\n79:O\n80:P\n81:Q\n82:R\n83:S\n=
84:T\n85:U\n86:V\n87:W\n88:X\n89:Y\n90:Z\n91:[\n92:\\\n93:]\n94:^\n95:_\n96=
:`\n97:a\n98:b\n99:c\n100:d\n101:e\n102:f\n103:g\n104:h\n105:i\n106:j\n107:=
k\n108:l\n109:m\n110:n\n111:o\n112:p\n113:q\n114:r\n115:s\n116:t\n117:u\n11=
8:v\n119:w\n120:x\n121:y\n122:z\n123:{\n124:|\n125:}\n126:~\n127:=7F\n128:=
=C2=80\n129:=C2=81\n130:=C2=82\n131:=C2=83\n132:=C2=84\n133:=C2=85\n134:=C2=
=86\n135:=C2=87\n136:=C2=88\n137:=C2=89\n138:=C2=8A\n139:=C2=8B\n140:=C2=8C=
\n141:=C2=8D\n142:=C2=8E\n143:=C2=8F\n144:=C2=90\n145:=C2=91\n146:=C2=92\n1=
47:=C2=93\n148:=C2=94\n149:=C2=95\n150:=C2=96\n151:=C2=97\n152:=C2=98\n153:=
=C2=99\n154:=C2=9A\n155:=C2=9B\n156:=C2=9C\n157:=C2=9D\n158:=C2=9E\n159:=C2=
=9F\n160:=C2=A0\n161:=C2=A1\n162:=C2=A2\n163:=C2=A3\n164:=C2=A4\n165:=C2=A5=
\n166:=C2=A6\n167:=C2=A7\n168:=C2=A8\n169:=C2=A9\n170:=C2=AA\n171:=C2=AB\n1=
72:=C2=AC\n173:=C2=AD\n174:=C2=AE\n175:=C2=AF\n176:=C2=B0\n177:=C2=B1\n178:=
=C2=B2\n179:=C2=B3\n180:=C2=B4\n181:=C2=B5\n182:=C2=B6\n183:=C2=B7\n184:=C2=
=B8\n185:=C2=B9\n186:=C2=BA\n187:=C2=BB\n188:=C2=BC\n189:=C2=BD\n190:=C2=BE=
\n191:=C2=BF\n192:=C3=80\n193:=C3=81\n194:=C3=82\n195:=C3=83\n196:=C3=84\n1=
97:=C3=85\n198:=C3=86\n199:=C3=87\n200:=C3=88\n201:=C3=89\n202:=C3=8A\n203:=
=C3=8B\n204:=C3=8C\n205:=C3=8D\n206:=C3=8E\n207:=C3=8F\n208:=C3=90\n209:=C3=
=91\n210:=C3=92\n211:=C3=93\n212:=C3=94\n213:=C3=95\n214:=C3=96\n215:=C3=97=
\n216:=C3=98\n217:=C3=99\n218:=C3=9A\n219:=C3=9B\n220:=C3=9C\n221:=C3=9D\n2=
22:=C3=9E\n223:=C3=9F\n224:=C3=A0\n225:=C3=A1\n226:=C3=A2\n227:=C3=A3\n228:=
=C3=A4\n229:=C3=A5\n230:=C3=A6\n231:=C3=A7\n232:=C3=A8\n233:=C3=A9\n234:=C3=
=AA\n235:=C3=AB\n236:=C3=AC\n237:=C3=AD\n238:=C3=AE\n239:=C3=AF\n240:=C3=B0=
\n241:=C3=B1\n242:=C3=B2\n243:=C3=B3\n244:=C3=B4\n245:=C3=B5\n246:=C3=B6\n2=
47:=C3=B7\n248:=C3=B8\n249:=C3=B9\n250:=C3=BA\n251:=C3=BB\n252:=C3=BC\n253:=
=C3=BD\n254:=C3=BE\n255:=C3=BF\nSubtest first-subtest: SUCCESS (0.000s)\n",
+      "dmesg":"<6> [3216186.095083] Console: switching to colour dummy dev=
ice 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.=
101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101=
160] [IGT] successtest: exiting, ret=3D0\n<6> [3216186.101299] Console: swi=
tching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":1
+    },
+    "root":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":1
+    },
+    "igt@successtest":{
+      "crash":0,
+      "pass":0,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":0,
+      "incomplete":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":0,
+      "warn":1
+    }
+  },
+  "runtimes":{
+    "igt@successtest":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0,
+        "end":0.014
+      }
+    }
+  }
+}
\ No newline at end of file
diff --git a/runner/json_tests_data/unprintable-characters/starttime.txt b/=
runner/json_tests_data/unprintable-characters/starttime.txt
new file mode 100644
index 00000000..ae038f18
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/starttime.txt
@@ -0,0 +1 @@
+1539953735.111039
diff --git a/runner/json_tests_data/unprintable-characters/uname.txt b/runn=
er/json_tests_data/unprintable-characters/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/unprintable-characters/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 3443bd2b..1d2fc3eb 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -163,6 +163,7 @@ static const char *dirnames[] =3D {
 	"dmesg-warn-level-piglit-style",
 	"dmesg-warn-level-one-piglit-style",
 	"dynamic-subtests",
+	"unprintable-characters",
 };
=20
 igt_main
--=20
2.19.1


--===============0341561395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0341561395==--
