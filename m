Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAEE10E6EE
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Mar 2022 15:20:49 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Mar 2022 17:20:16 +0200
Message-Id: <20220323152016.19033-4-petri.latvala@intel.com>
In-Reply-To: <20220323152016.19033-1-petri.latvala@intel.com>
References: <20220323152016.19033-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [igt-dev] [PATCH i-g-t 4/4] runner_tests: json tests for all
 prune-mode options
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 .../dynamic-subtests-keep-all/0/dmesg.txt     |   7 +
 .../dynamic-subtests-keep-all/0/err.txt       |  36 ++++
 .../dynamic-subtests-keep-all/0/journal.txt   |   2 +
 .../dynamic-subtests-keep-all/0/out.txt       |  19 ++
 .../dynamic-subtests-keep-all/1/dmesg.txt     |   5 +
 .../dynamic-subtests-keep-all/1/err.txt       |   2 +
 .../dynamic-subtests-keep-all/1/journal.txt   |   2 +
 .../dynamic-subtests-keep-all/1/out.txt       |   5 +
 .../dynamic-subtests-keep-all/2/dmesg.txt     |  11 ++
 .../dynamic-subtests-keep-all/2/err.txt       |   8 +
 .../dynamic-subtests-keep-all/2/journal.txt   |   4 +
 .../dynamic-subtests-keep-all/2/out.txt       |  10 +
 .../dynamic-subtests-keep-all/README.txt      |   3 +
 .../dynamic-subtests-keep-all/endtime.txt     |   1 +
 .../dynamic-subtests-keep-all/joblist.txt     |   3 +
 .../dynamic-subtests-keep-all/metadata.txt    |  13 ++
 .../dynamic-subtests-keep-all/reference.json  | 171 ++++++++++++++++++
 .../dynamic-subtests-keep-all/starttime.txt   |   1 +
 .../dynamic-subtests-keep-all/uname.txt       |   1 +
 .../0/dmesg.txt                               |   7 +
 .../dynamic-subtests-keep-requested/0/err.txt |  36 ++++
 .../0/journal.txt                             |   2 +
 .../dynamic-subtests-keep-requested/0/out.txt |  19 ++
 .../1/dmesg.txt                               |   5 +
 .../dynamic-subtests-keep-requested/1/err.txt |   2 +
 .../1/journal.txt                             |   2 +
 .../dynamic-subtests-keep-requested/1/out.txt |   5 +
 .../2/dmesg.txt                               |  11 ++
 .../dynamic-subtests-keep-requested/2/err.txt |   8 +
 .../2/journal.txt                             |   4 +
 .../dynamic-subtests-keep-requested/2/out.txt |  10 +
 .../README.txt                                |   3 +
 .../endtime.txt                               |   1 +
 .../joblist.txt                               |   3 +
 .../metadata.txt                              |  13 ++
 .../reference.json                            | 123 +++++++++++++
 .../starttime.txt                             |   1 +
 .../dynamic-subtests-keep-requested/uname.txt |   1 +
 .../0/dmesg.txt                               |   7 +
 .../dynamic-subtests-keep-subtests/0/err.txt  |  36 ++++
 .../0/journal.txt                             |   2 +
 .../dynamic-subtests-keep-subtests/0/out.txt  |  19 ++
 .../1/dmesg.txt                               |   5 +
 .../dynamic-subtests-keep-subtests/1/err.txt  |   2 +
 .../1/journal.txt                             |   2 +
 .../dynamic-subtests-keep-subtests/1/out.txt  |   5 +
 .../2/dmesg.txt                               |  11 ++
 .../dynamic-subtests-keep-subtests/2/err.txt  |   8 +
 .../2/journal.txt                             |   4 +
 .../dynamic-subtests-keep-subtests/2/out.txt  |  10 +
 .../dynamic-subtests-keep-subtests/README.txt |   3 +
 .../endtime.txt                               |   1 +
 .../joblist.txt                               |   3 +
 .../metadata.txt                              |  13 ++
 .../reference.json                            | 123 +++++++++++++
 .../starttime.txt                             |   1 +
 .../dynamic-subtests-keep-subtests/uname.txt  |   1 +
 runner/runner_json_tests.c                    |   3 +
 58 files changed, 819 insertions(+)
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/0/dmes=
g.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/0/err.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/0/jour=
nal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/0/out.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/1/dmes=
g.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/1/err.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/1/jour=
nal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/1/out.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/2/dmes=
g.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/2/err.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/2/jour=
nal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/2/out.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/README=
.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/endtim=
e.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/joblis=
t.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/metada=
ta.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/refere=
nce.json
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/startt=
ime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-all/uname.=
txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
0/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
0/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
0/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
0/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
1/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
1/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
1/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
1/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
2/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
2/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
2/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
2/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
README.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
endtime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
joblist.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
metadata.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
reference.json
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
starttime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-requested/=
uname.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/0=
/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/0=
/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/0=
/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/0=
/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/1=
/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/1=
/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/1=
/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/1=
/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/2=
/dmesg.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/2=
/err.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/2=
/journal.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/2=
/out.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/R=
EADME.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/e=
ndtime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/j=
oblist.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/m=
etadata.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/r=
eference.json
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/s=
tarttime.txt
 create mode 100644 runner/json_tests_data/dynamic-subtests-keep-subtests/u=
name.txt

diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/0/dmesg.txt b=
/runner/json_tests_data/dynamic-subtests-keep-all/0/dmesg.txt
new file mode 100644
index 00000000..c87b4271
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/0/dmesg.txt
@@ -0,0 +1,7 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest debug-log-checking
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-1
+14,1161,23426155240164,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-2
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D98
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/0/err.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/0/err.txt
new file mode 100644
index 00000000..3c280788
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/0/err.txt
@@ -0,0 +1,36 @@
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-1 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:11 __real=
_main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-2 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:5 __real_=
main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking failed.
+No log.
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/0/journal.txt=
 b/runner/json_tests_data/dynamic-subtests-keep-all/0/journal.txt
new file mode 100644
index 00000000..aa8cef0c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/0/journal.txt
@@ -0,0 +1,2 @@
+debug-log-checking
+exit:98 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/0/out.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/0/out.txt
new file mode 100644
index 00000000..286da3f3
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/0/out.txt
@@ -0,0 +1,19 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:11 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:5 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/1/dmesg.txt b=
/runner/json_tests_data/dynamic-subtests-keep-all/1/dmesg.txt
new file mode 100644
index 00000000..d6e16a46
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/1/dmesg.txt
@@ -0,0 +1,5 @@
+6,1164,23426155304955,-;Console: switching to colour dummy device 80x25
+14,1165,23426155304968,-;[IGT] dynamic: executing
+14,1166,23426155308644,-;[IGT] dynamic: starting subtest empty-container
+14,1167,23426155308671,-;[IGT] dynamic: exiting, ret=3D77
+6,1168,23426155308822,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/1/err.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/1/err.txt
new file mode 100644
index 00000000..6247e714
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/1/err.txt
@@ -0,0 +1,2 @@
+Starting subtest: empty-container
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/1/journal.txt=
 b/runner/json_tests_data/dynamic-subtests-keep-all/1/journal.txt
new file mode 100644
index 00000000..3e4ce5c4
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/1/journal.txt
@@ -0,0 +1,2 @@
+empty-container
+exit:77 (0.014s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/1/out.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/1/out.txt
new file mode 100644
index 00000000..704734dc
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/1/out.txt
@@ -0,0 +1,5 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: empty-container
+This should skip
+No dynamic tests executed.
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/2/dmesg.txt b=
/runner/json_tests_data/dynamic-subtests-keep-all/2/dmesg.txt
new file mode 100644
index 00000000..046ef579
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/2/dmesg.txt
@@ -0,0 +1,11 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest normal
+6,1160,23426155184895,-;Dmesg output for normal
+6,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest normal-dyn=
amic-subtest
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest incomplete
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-i=
ncomplete
+6,1160,23426155184895,-;Dmesg output for incomplete
+14,1161,23426155240164,-;[IGT] dynamic: starting subtest resume
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D0
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/2/err.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/2/err.txt
new file mode 100644
index 00000000..1eae6061
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/2/err.txt
@@ -0,0 +1,8 @@
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/2/journal.txt=
 b/runner/json_tests_data/dynamic-subtests-keep-all/2/journal.txt
new file mode 100644
index 00000000..9469e227
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/2/journal.txt
@@ -0,0 +1,4 @@
+normal
+incomplete
+resume
+exit:0 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/2/out.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/2/out.txt
new file mode 100644
index 00000000..3063844b
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/2/out.txt
@@ -0,0 +1,10 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+This is some output
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/README.txt b/=
runner/json_tests_data/dynamic-subtests-keep-all/README.txt
new file mode 100644
index 00000000..78bbf47c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/README.txt
@@ -0,0 +1,3 @@
+A test with dynamic subtests with prune-mode=3Dkeep-dynamic should
+generate separate subresults for the dynamic tests without the
+subtests.
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/endtime.txt b=
/runner/json_tests_data/dynamic-subtests-keep-all/endtime.txt
new file mode 100644
index 00000000..5c7608b5
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/endtime.txt
@@ -0,0 +1 @@
+1560163492.410489
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/joblist.txt b=
/runner/json_tests_data/dynamic-subtests-keep-all/joblist.txt
new file mode 100644
index 00000000..4fdcc5f1
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/joblist.txt
@@ -0,0 +1,3 @@
+dynamic debug-log-checking
+dynamic empty-container
+dynamic normal,incomplete,resume
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/metadata.txt =
b/runner/json_tests_data/dynamic-subtests-keep-all/metadata.txt
new file mode 100644
index 00000000..fad45f10
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/metadata.txt
@@ -0,0 +1,13 @@
+abort_mask : 0
+name : dynamic-subtests
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 1
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
+prune_mode : 2
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/reference.jso=
n b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
new file mode 100644
index 00000000..b2b71628
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/reference.json
@@ -0,0 +1,171 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"dynamic-subtests",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-0=
6) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1560163492.266377,
+    "end":1560163492.4104891
+  },
+  "tests":{
+    "igt@dynamic@debug-log-checking":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: thi=
s-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_asse=
rt()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runn=
er\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_sta=
rt_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.0=
55s)\nStarting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/l=
ib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic=
.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..=
\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic su=
btest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0=
.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.109
+      },
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtes=
t: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure func=
tion __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904)=
 CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 faile=
d.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:=
20904) CRITICAL: Test assertion failure function __real_main3, file ..\/run=
ner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: fa=
lse\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-=
INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) ig=
t_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynam=
ic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dy=
namic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_mai=
n()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDy=
namic subtest this-is-dynamic-1: FAIL (0.055s)\nStarting dynamic subtest: t=
his-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function=
 __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CR=
ITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\=
n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:209=
04) CRITICAL: Test assertion failure function __real_main3, file ..\/runner=
\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: fals=
e\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-IN=
FO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_=
core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:=
20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynam=
ic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()=
\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynam=
ic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking fai=
led.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.18=
4895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n<6> [23426=
155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> =
[23426155.293846] [IGT] dynamic: exiting, ret=3D98\n<6> [23426155.294003] C=
onsole: switching to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@debug-log-checking@this-is-dynamic-1":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: thi=
s-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_asse=
rt()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runn=
er\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_sta=
rt_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.0=
55s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.055
+      },
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtes=
t: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure func=
tion __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904)=
 CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 faile=
d.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:=
20904) CRITICAL: Test assertion failure function __real_main3, file ..\/run=
ner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: fa=
lse\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-=
INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) ig=
t_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynam=
ic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dy=
namic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_mai=
n()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDy=
namic subtest this-is-dynamic-1: FAIL (0.055s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.18=
4895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n"
+    },
+    "igt@dynamic@debug-log-checking@this-is-dynamic-2":{
+      "out":"Starting dynamic subtest: this-is-dynamic-2\nStack trace:\n  =
#0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\=
/dynamic.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\=
n  #3 ..\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDy=
namic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking:=
 FAIL (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.053999999999999999
+      },
+      "err":"Starting dynamic subtest: this-is-dynamic-2\n(dynamic:20904) =
CRITICAL: Test assertion failure function __real_main3, file ..\/runner\/te=
stdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: false\nD=
ynamic subtest this-is-dynamic-2 failed.\n**** DEBUG ****\n(dynamic:20904) =
DEBUG: This print is from 2\n(dynamic:20904) CRITICAL: Test assertion failu=
re function __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynami=
c:20904) CRITICAL: Failed assertion: false\n(dynamic:20904) igt_core-INFO: =
Stack trace:\n(dynamic:20904) igt_core-INFO:   #0 ..\/lib\/igt_core.c:1607 =
__igt_fail_assert()\n(dynamic:20904) igt_core-INFO:   #1 ..\/runner\/testda=
ta\/dynamic.c:5 __real_main3()\n(dynamic:20904) igt_core-INFO:   #2 ..\/run=
ner\/testdata\/dynamic.c:3 main()\n(dynamic:20904) igt_core-INFO:   #3 ..\/=
csu\/libc-start.c:342 __libc_start_main()\n(dynamic:20904) igt_core-INFO:  =
 #4 [_start+0x2a]\n****  END  ****\nDynamic subtest this-is-dynamic-2: FAIL=
 (0.054s)\nSubtest debug-log-checking failed.\nNo log.\nSubtest debug-log-c=
hecking: FAIL (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting dynamic subte=
st this-is-dynamic-2\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=3D9=
8\n<6> [23426155.294003] Console: switching to colour frame buffer device 2=
40x75\n"
+    },
+    "igt@dynamic@empty-container":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: empty-container\nThis should skip\nNo dynamic tes=
ts executed.\nSubtest empty-container: SKIP (0.000s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"skip",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: empty-container\nSubtest empty-container: S=
KIP (0.000s)\n",
+      "dmesg":"<6> [23426155.304955] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.3=
08644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.30867=
1] [IGT] dynamic: exiting, ret=3D77\n<6> [23426155.308822] Console: switchi=
ng to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@normal":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-=
subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest =
normal: SUCCESS (0.100s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.10000000000000001
+      },
+      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dy=
namic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSu=
btest normal: SUCCESS (0.100s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg =
output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic su=
btest normal-dynamic-subtest\n"
+    },
+    "igt@dynamic@normal@normal-dynamic-subtest":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-=
subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest =
normal: SUCCESS (0.100s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.055
+      },
+      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dy=
namic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSu=
btest normal: SUCCESS (0.100s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg =
output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic su=
btest normal-dynamic-subtest\n"
+    },
+    "igt@dynamic@incomplete":{
+      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\nThis is some output\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"incomplete",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incom=
plete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-i=
s-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
+    },
+    "igt@dynamic@incomplete@this-is-incomplete":{
+      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\nThis is some output\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"incomplete",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incom=
plete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-i=
s-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
+    },
+    "igt@dynamic@resume":{
+      "out":"This is some output\nStarting subtest: resume\nSubtest resume=
: SUCCESS (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.109
+      },
+      "err":"Starting subtest: resume\nSubtest resume: SUCCESS (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting subtest resum=
e\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=3D0\n<6> [23426155.294=
003] Console: switching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":3,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":2,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":3,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":3,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":2,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":3,
+      "warn":0
+    },
+    "igt@dynamic":{
+      "crash":0,
+      "pass":3,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":2,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":3,
+      "warn":0
+    }
+  },
+  "runtimes":{
+    "igt@dynamic":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.27400000000000002
+      }
+    }
+  }
+}
\ No newline at end of file
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/starttime.txt=
 b/runner/json_tests_data/dynamic-subtests-keep-all/starttime.txt
new file mode 100644
index 00000000..b30b32ee
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/starttime.txt
@@ -0,0 +1 @@
+1560163492.266377
diff --git a/runner/json_tests_data/dynamic-subtests-keep-all/uname.txt b/r=
unner/json_tests_data/dynamic-subtests-keep-all/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-all/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/0/dmesg=
.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/0/dmesg.txt
new file mode 100644
index 00000000..c87b4271
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/0/dmesg.txt
@@ -0,0 +1,7 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest debug-log-checking
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-1
+14,1161,23426155240164,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-2
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D98
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/0/err.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/0/err.txt
new file mode 100644
index 00000000..3c280788
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/0/err.txt
@@ -0,0 +1,36 @@
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-1 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:11 __real=
_main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-2 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:5 __real_=
main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking failed.
+No log.
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/0/journ=
al.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/0/journal.t=
xt
new file mode 100644
index 00000000..aa8cef0c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/0/journal.txt
@@ -0,0 +1,2 @@
+debug-log-checking
+exit:98 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/0/out.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/0/out.txt
new file mode 100644
index 00000000..286da3f3
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/0/out.txt
@@ -0,0 +1,19 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:11 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:5 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/1/dmesg=
.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/1/dmesg.txt
new file mode 100644
index 00000000..d6e16a46
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/1/dmesg.txt
@@ -0,0 +1,5 @@
+6,1164,23426155304955,-;Console: switching to colour dummy device 80x25
+14,1165,23426155304968,-;[IGT] dynamic: executing
+14,1166,23426155308644,-;[IGT] dynamic: starting subtest empty-container
+14,1167,23426155308671,-;[IGT] dynamic: exiting, ret=3D77
+6,1168,23426155308822,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/1/err.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/1/err.txt
new file mode 100644
index 00000000..6247e714
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/1/err.txt
@@ -0,0 +1,2 @@
+Starting subtest: empty-container
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/1/journ=
al.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/1/journal.t=
xt
new file mode 100644
index 00000000..3e4ce5c4
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/1/journal.txt
@@ -0,0 +1,2 @@
+empty-container
+exit:77 (0.014s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/1/out.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/1/out.txt
new file mode 100644
index 00000000..704734dc
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/1/out.txt
@@ -0,0 +1,5 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: empty-container
+This should skip
+No dynamic tests executed.
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/2/dmesg=
.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/2/dmesg.txt
new file mode 100644
index 00000000..046ef579
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/2/dmesg.txt
@@ -0,0 +1,11 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest normal
+6,1160,23426155184895,-;Dmesg output for normal
+6,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest normal-dyn=
amic-subtest
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest incomplete
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-i=
ncomplete
+6,1160,23426155184895,-;Dmesg output for incomplete
+14,1161,23426155240164,-;[IGT] dynamic: starting subtest resume
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D0
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/2/err.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/2/err.txt
new file mode 100644
index 00000000..1eae6061
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/2/err.txt
@@ -0,0 +1,8 @@
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/2/journ=
al.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/2/journal.t=
xt
new file mode 100644
index 00000000..9469e227
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/2/journal.txt
@@ -0,0 +1,4 @@
+normal
+incomplete
+resume
+exit:0 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/2/out.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/2/out.txt
new file mode 100644
index 00000000..3063844b
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/2/out.txt
@@ -0,0 +1,10 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+This is some output
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/README.=
txt b/runner/json_tests_data/dynamic-subtests-keep-requested/README.txt
new file mode 100644
index 00000000..78bbf47c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/README.txt
@@ -0,0 +1,3 @@
+A test with dynamic subtests with prune-mode=3Dkeep-dynamic should
+generate separate subresults for the dynamic tests without the
+subtests.
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/endtime=
.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/endtime.txt
new file mode 100644
index 00000000..5c7608b5
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/endtime.txt
@@ -0,0 +1 @@
+1560163492.410489
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/joblist=
.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/joblist.txt
new file mode 100644
index 00000000..e9860199
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/joblist.txt
@@ -0,0 +1,3 @@
+dynamic debug-log-checking@this-is-dynamic-1
+dynamic empty-container
+dynamic normal,incomplete,resume
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/metadat=
a.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/metadata.txt
new file mode 100644
index 00000000..c7f14fa4
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/metadata.txt
@@ -0,0 +1,13 @@
+abort_mask : 0
+name : dynamic-subtests
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 1
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
+prune_mode : 3
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/referen=
ce.json b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.=
json
new file mode 100644
index 00000000..c33c7ce7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/reference.json
@@ -0,0 +1,123 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"dynamic-subtests",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-0=
6) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1560163492.266377,
+    "end":1560163492.4104891
+  },
+  "tests":{
+    "igt@dynamic@debug-log-checking@this-is-dynamic-1":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: thi=
s-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_asse=
rt()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runn=
er\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_sta=
rt_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.0=
55s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.055
+      },
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtes=
t: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure func=
tion __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904)=
 CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 faile=
d.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:=
20904) CRITICAL: Test assertion failure function __real_main3, file ..\/run=
ner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: fa=
lse\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-=
INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) ig=
t_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynam=
ic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dy=
namic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_mai=
n()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDy=
namic subtest this-is-dynamic-1: FAIL (0.055s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.18=
4895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n"
+    },
+    "igt@dynamic@empty-container":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: empty-container\nThis should skip\nNo dynamic tes=
ts executed.\nSubtest empty-container: SKIP (0.000s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"skip",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: empty-container\nSubtest empty-container: S=
KIP (0.000s)\n",
+      "dmesg":"<6> [23426155.304955] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.3=
08644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.30867=
1] [IGT] dynamic: exiting, ret=3D77\n<6> [23426155.308822] Console: switchi=
ng to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@normal":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-=
subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest =
normal: SUCCESS (0.100s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.10000000000000001
+      },
+      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dy=
namic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSu=
btest normal: SUCCESS (0.100s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg =
output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic su=
btest normal-dynamic-subtest\n"
+    },
+    "igt@dynamic@incomplete":{
+      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\nThis is some output\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"incomplete",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incom=
plete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-i=
s-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
+    },
+    "igt@dynamic@resume":{
+      "out":"This is some output\nStarting subtest: resume\nSubtest resume=
: SUCCESS (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.109
+      },
+      "err":"Starting subtest: resume\nSubtest resume: SUCCESS (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting subtest resum=
e\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=3D0\n<6> [23426155.294=
003] Console: switching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    },
+    "igt@dynamic":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    }
+  },
+  "runtimes":{
+    "igt@dynamic":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.27400000000000002
+      }
+    }
+  }
+}
\ No newline at end of file
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/startti=
me.txt b/runner/json_tests_data/dynamic-subtests-keep-requested/starttime.t=
xt
new file mode 100644
index 00000000..b30b32ee
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/starttime.txt
@@ -0,0 +1 @@
+1560163492.266377
diff --git a/runner/json_tests_data/dynamic-subtests-keep-requested/uname.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-requested/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-requested/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/0/dmesg.=
txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/dmesg.txt
new file mode 100644
index 00000000..c87b4271
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/dmesg.txt
@@ -0,0 +1,7 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest debug-log-checking
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-1
+14,1161,23426155240164,-;[IGT] dynamic: starting dynamic subtest this-is-d=
ynamic-2
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D98
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/0/err.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/err.txt
new file mode 100644
index 00000000..3c280788
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/err.txt
@@ -0,0 +1,36 @@
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-1 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 1
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:8:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:11 __real=
_main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+Dynamic subtest this-is-dynamic-2 failed.
+**** DEBUG ****
+(dynamic:20904) DEBUG: This print is from 2
+(dynamic:20904) CRITICAL: Test assertion failure function __real_main3, fi=
le ../runner/testdata/dynamic.c:13:
+(dynamic:20904) CRITICAL: Failed assertion: false
+(dynamic:20904) igt_core-INFO: Stack trace:
+(dynamic:20904) igt_core-INFO:   #0 ../lib/igt_core.c:1607 __igt_fail_asse=
rt()
+(dynamic:20904) igt_core-INFO:   #1 ../runner/testdata/dynamic.c:5 __real_=
main3()
+(dynamic:20904) igt_core-INFO:   #2 ../runner/testdata/dynamic.c:3 main()
+(dynamic:20904) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_m=
ain()
+(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]
+****  END  ****
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking failed.
+No log.
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/0/journa=
l.txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/journal.txt
new file mode 100644
index 00000000..aa8cef0c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/journal.txt
@@ -0,0 +1,2 @@
+debug-log-checking
+exit:98 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/0/out.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/out.txt
new file mode 100644
index 00000000..286da3f3
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/0/out.txt
@@ -0,0 +1,19 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: debug-log-checking
+Starting dynamic subtest: this-is-dynamic-1
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:11 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-1: FAIL (0.055s)
+Starting dynamic subtest: this-is-dynamic-2
+Stack trace:
+  #0 ../lib/igt_core.c:1607 __igt_fail_assert()
+  #1 ../runner/testdata/dynamic.c:5 __real_main3()
+  #2 ../runner/testdata/dynamic.c:3 main()
+  #3 ../csu/libc-start.c:342 __libc_start_main()
+  #4 [_start+0x2a]
+Dynamic subtest this-is-dynamic-2: FAIL (0.054s)
+Subtest debug-log-checking: FAIL (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/1/dmesg.=
txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/dmesg.txt
new file mode 100644
index 00000000..d6e16a46
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/dmesg.txt
@@ -0,0 +1,5 @@
+6,1164,23426155304955,-;Console: switching to colour dummy device 80x25
+14,1165,23426155304968,-;[IGT] dynamic: executing
+14,1166,23426155308644,-;[IGT] dynamic: starting subtest empty-container
+14,1167,23426155308671,-;[IGT] dynamic: exiting, ret=3D77
+6,1168,23426155308822,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/1/err.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/err.txt
new file mode 100644
index 00000000..6247e714
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/err.txt
@@ -0,0 +1,2 @@
+Starting subtest: empty-container
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/1/journa=
l.txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/journal.txt
new file mode 100644
index 00000000..3e4ce5c4
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/journal.txt
@@ -0,0 +1,2 @@
+empty-container
+exit:77 (0.014s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/1/out.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/out.txt
new file mode 100644
index 00000000..704734dc
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/1/out.txt
@@ -0,0 +1,5 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: empty-container
+This should skip
+No dynamic tests executed.
+Subtest empty-container: SKIP (0.000s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/2/dmesg.=
txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/dmesg.txt
new file mode 100644
index 00000000..046ef579
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/dmesg.txt
@@ -0,0 +1,11 @@
+6,1157,23426155175691,-;Console: switching to colour dummy device 80x25
+14,1158,23426155175708,-;[IGT] dynamic: executing
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest normal
+6,1160,23426155184895,-;Dmesg output for normal
+6,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest normal-dyn=
amic-subtest
+14,1159,23426155184875,-;[IGT] dynamic: starting subtest incomplete
+14,1160,23426155184895,-;[IGT] dynamic: starting dynamic subtest this-is-i=
ncomplete
+6,1160,23426155184895,-;Dmesg output for incomplete
+14,1161,23426155240164,-;[IGT] dynamic: starting subtest resume
+14,1162,23426155293846,-;[IGT] dynamic: exiting, ret=3D0
+6,1163,23426155294003,-;Console: switching to colour frame buffer device 2=
40x75
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/2/err.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/err.txt
new file mode 100644
index 00000000..1eae6061
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/err.txt
@@ -0,0 +1,8 @@
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/2/journa=
l.txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/journal.txt
new file mode 100644
index 00000000..9469e227
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/journal.txt
@@ -0,0 +1,4 @@
+normal
+incomplete
+resume
+exit:0 (0.130s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/2/out.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/out.txt
new file mode 100644
index 00000000..3063844b
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/2/out.txt
@@ -0,0 +1,10 @@
+IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x86_64)
+Starting subtest: normal
+Starting dynamic subtest: normal-dynamic-subtest
+Dynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)
+Subtest normal: SUCCESS (0.100s)
+Starting subtest: incomplete
+Starting dynamic subtest: this-is-incomplete
+This is some output
+Starting subtest: resume
+Subtest resume: SUCCESS (0.109s)
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/README.t=
xt b/runner/json_tests_data/dynamic-subtests-keep-subtests/README.txt
new file mode 100644
index 00000000..78bbf47c
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/README.txt
@@ -0,0 +1,3 @@
+A test with dynamic subtests with prune-mode=3Dkeep-dynamic should
+generate separate subresults for the dynamic tests without the
+subtests.
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/endtime.=
txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/endtime.txt
new file mode 100644
index 00000000..5c7608b5
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/endtime.txt
@@ -0,0 +1 @@
+1560163492.410489
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/joblist.=
txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/joblist.txt
new file mode 100644
index 00000000..4fdcc5f1
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/joblist.txt
@@ -0,0 +1,3 @@
+dynamic debug-log-checking
+dynamic empty-container
+dynamic normal,incomplete,resume
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/metadata=
.txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/metadata.txt
new file mode 100644
index 00000000..a0a49263
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/metadata.txt
@@ -0,0 +1,13 @@
+abort_mask : 0
+name : dynamic-subtests
+dry_run : 0
+sync : 0
+log_level : 0
+overwrite : 0
+multiple_mode : 1
+inactivity_timeout : 0
+use_watchdog : 0
+piglit_style_dmesg : 0
+test_root : /path/does/not/exist
+results_path : /path/does/not/exist
+prune_mode : 1
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/referenc=
e.json b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.js=
on
new file mode 100644
index 00000000..e53daa5a
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/reference.json
@@ -0,0 +1,123 @@
+{
+  "__type__":"TestrunResult",
+  "results_version":10,
+  "name":"dynamic-subtests",
+  "uname":"Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-0=
6) x86_64",
+  "time_elapsed":{
+    "__type__":"TimeAttribute",
+    "start":1560163492.266377,
+    "end":1560163492.4104891
+  },
+  "tests":{
+    "igt@dynamic@debug-log-checking":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: debug-log-checking\nStarting dynamic subtest: thi=
s-is-dynamic-1\nStack trace:\n  #0 ..\/lib\/igt_core.c:1607 __igt_fail_asse=
rt()\n  #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n  #2 ..\/runn=
er\/testdata\/dynamic.c:3 main()\n  #3 ..\/csu\/libc-start.c:342 __libc_sta=
rt_main()\n  #4 [_start+0x2a]\nDynamic subtest this-is-dynamic-1: FAIL (0.0=
55s)\nStarting dynamic subtest: this-is-dynamic-2\nStack trace:\n  #0 ..\/l=
ib\/igt_core.c:1607 __igt_fail_assert()\n  #1 ..\/runner\/testdata\/dynamic=
.c:5 __real_main3()\n  #2 ..\/runner\/testdata\/dynamic.c:3 main()\n  #3 ..=
\/csu\/libc-start.c:342 __libc_start_main()\n  #4 [_start+0x2a]\nDynamic su=
btest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking: FAIL (0=
.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"fail",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.109
+      },
+      "err":"Starting subtest: debug-log-checking\nStarting dynamic subtes=
t: this-is-dynamic-1\n(dynamic:20904) CRITICAL: Test assertion failure func=
tion __real_main3, file ..\/runner\/testdata\/dynamic.c:8:\n(dynamic:20904)=
 CRITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-1 faile=
d.\n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 1\n(dynamic:=
20904) CRITICAL: Test assertion failure function __real_main3, file ..\/run=
ner\/testdata\/dynamic.c:8:\n(dynamic:20904) CRITICAL: Failed assertion: fa=
lse\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-=
INFO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) ig=
t_core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:11 __real_main3()\n(dynam=
ic:20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dy=
namic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_mai=
n()\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDy=
namic subtest this-is-dynamic-1: FAIL (0.055s)\nStarting dynamic subtest: t=
his-is-dynamic-2\n(dynamic:20904) CRITICAL: Test assertion failure function=
 __real_main3, file ..\/runner\/testdata\/dynamic.c:13:\n(dynamic:20904) CR=
ITICAL: Failed assertion: false\nDynamic subtest this-is-dynamic-2 failed.\=
n**** DEBUG ****\n(dynamic:20904) DEBUG: This print is from 2\n(dynamic:209=
04) CRITICAL: Test assertion failure function __real_main3, file ..\/runner=
\/testdata\/dynamic.c:13:\n(dynamic:20904) CRITICAL: Failed assertion: fals=
e\n(dynamic:20904) igt_core-INFO: Stack trace:\n(dynamic:20904) igt_core-IN=
FO:   #0 ..\/lib\/igt_core.c:1607 __igt_fail_assert()\n(dynamic:20904) igt_=
core-INFO:   #1 ..\/runner\/testdata\/dynamic.c:5 __real_main3()\n(dynamic:=
20904) igt_core-INFO:   #2 ..\/runner\/testdata\/dynamic.c:3 main()\n(dynam=
ic:20904) igt_core-INFO:   #3 ..\/csu\/libc-start.c:342 __libc_start_main()=
\n(dynamic:20904) igt_core-INFO:   #4 [_start+0x2a]\n****  END  ****\nDynam=
ic subtest this-is-dynamic-2: FAIL (0.054s)\nSubtest debug-log-checking fai=
led.\nNo log.\nSubtest debug-log-checking: FAIL (0.109s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest debug-log-checking\n<6> [23426155.18=
4895] [IGT] dynamic: starting dynamic subtest this-is-dynamic-1\n<6> [23426=
155.240164] [IGT] dynamic: starting dynamic subtest this-is-dynamic-2\n<6> =
[23426155.293846] [IGT] dynamic: exiting, ret=3D98\n<6> [23426155.294003] C=
onsole: switching to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@empty-container":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: empty-container\nThis should skip\nNo dynamic tes=
ts executed.\nSubtest empty-container: SKIP (0.000s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"skip",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: empty-container\nSubtest empty-container: S=
KIP (0.000s)\n",
+      "dmesg":"<6> [23426155.304955] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.304968] [IGT] dynamic: executing\n<6> [23426155.3=
08644] [IGT] dynamic: starting subtest empty-container\n<6> [23426155.30867=
1] [IGT] dynamic: exiting, ret=3D77\n<6> [23426155.308822] Console: switchi=
ng to colour frame buffer device 240x75\n"
+    },
+    "igt@dynamic@normal":{
+      "out":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1-amd64 x=
86_64)\nStarting subtest: normal\nStarting dynamic subtest: normal-dynamic-=
subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSubtest =
normal: SUCCESS (0.100s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.10000000000000001
+      },
+      "err":"Starting subtest: normal\nStarting dynamic subtest: normal-dy=
namic-subtest\nDynamic subtest normal-dynamic-subtest: SUCCESS (0.055s)\nSu=
btest normal: SUCCESS (0.100s)\n",
+      "dmesg":"<6> [23426155.175691] Console: switching to colour dummy de=
vice 80x25\n<6> [23426155.175708] [IGT] dynamic: executing\n<6> [23426155.1=
84875] [IGT] dynamic: starting subtest normal\n<6> [23426155.184895] Dmesg =
output for normal\n<6> [23426155.184895] [IGT] dynamic: starting dynamic su=
btest normal-dynamic-subtest\n"
+    },
+    "igt@dynamic@incomplete":{
+      "out":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\nThis is some output\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"incomplete",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.0
+      },
+      "err":"Starting subtest: incomplete\nStarting dynamic subtest: this-=
is-incomplete\n",
+      "dmesg":"<6> [23426155.184875] [IGT] dynamic: starting subtest incom=
plete\n<6> [23426155.184895] [IGT] dynamic: starting dynamic subtest this-i=
s-incomplete\n<6> [23426155.184895] Dmesg output for incomplete\n"
+    },
+    "igt@dynamic@resume":{
+      "out":"This is some output\nStarting subtest: resume\nSubtest resume=
: SUCCESS (0.109s)\n",
+      "igt-version":"IGT-Version: 1.23-g9e957acd (x86_64) (Linux: 4.18.0-1=
-amd64 x86_64)",
+      "result":"pass",
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.109
+      },
+      "err":"Starting subtest: resume\nSubtest resume: SUCCESS (0.109s)\n",
+      "dmesg":"<6> [23426155.240164] [IGT] dynamic: starting subtest resum=
e\n<6> [23426155.293846] [IGT] dynamic: exiting, ret=3D0\n<6> [23426155.294=
003] Console: switching to colour frame buffer device 240x75\n"
+    }
+  },
+  "totals":{
+    "":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    },
+    "root":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    },
+    "igt@dynamic":{
+      "crash":0,
+      "pass":2,
+      "dmesg-fail":0,
+      "dmesg-warn":0,
+      "skip":1,
+      "incomplete":1,
+      "abort":0,
+      "timeout":0,
+      "notrun":0,
+      "fail":1,
+      "warn":0
+    }
+  },
+  "runtimes":{
+    "igt@dynamic":{
+      "time":{
+        "__type__":"TimeAttribute",
+        "start":0.0,
+        "end":0.27400000000000002
+      }
+    }
+  }
+}
\ No newline at end of file
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/starttim=
e.txt b/runner/json_tests_data/dynamic-subtests-keep-subtests/starttime.txt
new file mode 100644
index 00000000..b30b32ee
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/starttime.txt
@@ -0,0 +1 @@
+1560163492.266377
diff --git a/runner/json_tests_data/dynamic-subtests-keep-subtests/uname.tx=
t b/runner/json_tests_data/dynamic-subtests-keep-subtests/uname.txt
new file mode 100644
index 00000000..a7aef6f7
--- /dev/null
+++ b/runner/json_tests_data/dynamic-subtests-keep-subtests/uname.txt
@@ -0,0 +1 @@
+Linux hostname 4.18.0-1-amd64 #1 SMP Debian 4.18.6-1 (2018-09-06) x86_64
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 882225c8..7253c906 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -163,6 +163,9 @@ static const char *dirnames[] =3D {
 	"dmesg-warn-level-piglit-style",
 	"dmesg-warn-level-one-piglit-style",
 	"dynamic-subtests-keep-dynamic",
+	"dynamic-subtests-keep-subtests",
+	"dynamic-subtests-keep-all",
+	"dynamic-subtests-keep-requested",
 	"dynamic-subtest-name-in-multiple-subtests",
 	"unprintable-characters",
 	"empty-result-files",
--=20
2.30.2
