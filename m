Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 778F7AFECE
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Aug 2022 13:55:46 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Wed, 10 Aug 2022 15:55:29 +0200
Message-Id: <20220810135530.992455-3-ryszard.knop@intel.com>
In-Reply-To: <20220810135530.992455-1-ryszard.knop@intel.com>
References: <20220810135530.992455-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] runner/tests: Fix JSON test data
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

JSON files contained extra (invalid) commas which json-c was able to
handle, but Jansson, Firefox and Python parsers are unhappy with.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 .../json_tests_data/aborted-after-a-test/reference.json   | 6 +++---
 runner/json_tests_data/aborted-on-boot/reference.json     | 4 ++--
 runner/json_tests_data/dmesg-escapes/reference.json       | 8 ++++----
 runner/json_tests_data/empty-result-files/reference.json  | 4 ++--
 runner/json_tests_data/graceful-notrun/reference.json     | 6 +++---
 .../incomplete-before-any-subtests/reference.json         | 2 +-
 .../notrun-results-multiple-mode/reference.json           | 2 +-
 runner/json_tests_data/notrun-results/reference.json      | 2 +-
 8 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/runner/json_tests_data/aborted-after-a-test/reference.json b/runner/json_tests_data/aborted-after-a-test/reference.json
index 0776f758..3f4a3fc0 100644
--- a/runner/json_tests_data/aborted-after-a-test/reference.json
+++ b/runner/json_tests_data/aborted-after-a-test/reference.json
@@ -49,7 +49,7 @@
 	"out":"Aborted after: successtest (first-subtest)\n\nKernel tainted (0x200)\n",
 	"result":"fail",
 	"err":"",
-	"dmesg":"",
+	"dmesg":""
     }
   },
   "totals":{
@@ -130,7 +130,7 @@
       "notrun":0,
       "fail":1,
       "warn":0
-    },
+    }
   },
   "runtimes":{
     "igt@successtest":{
@@ -139,6 +139,6 @@
         "start":0,
         "end":0.014
       }
-    },
+    }
   }
 }
diff --git a/runner/json_tests_data/aborted-on-boot/reference.json b/runner/json_tests_data/aborted-on-boot/reference.json
index 75f19466..5e9b905a 100644
--- a/runner/json_tests_data/aborted-on-boot/reference.json
+++ b/runner/json_tests_data/aborted-on-boot/reference.json
@@ -43,7 +43,7 @@
 	"out":"Aborted after: startup\n\nKernel tainted (0x200)\n",
 	"result":"fail",
 	"err":"",
-	"dmesg":"",
+	"dmesg":""
     }
   },
   "totals":{
@@ -124,7 +124,7 @@
       "notrun":0,
       "fail":1,
       "warn":0
-    },
+    }
   },
   "runtimes":{
   }
diff --git a/runner/json_tests_data/dmesg-escapes/reference.json b/runner/json_tests_data/dmesg-escapes/reference.json
index 91c57310..4798db52 100644
--- a/runner/json_tests_data/dmesg-escapes/reference.json
+++ b/runner/json_tests_data/dmesg-escapes/reference.json
@@ -19,8 +19,8 @@
         "end":0
       },
       "err":"Starting subtest: first-subtest\nSubtest first-subtest: SUCCESS (0.000s)\n",
-	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n",
-    },
+	"dmesg":"<6> [3216186.095083] Console: switching to colour dummy device 80x25\n<6> [3216186.095097] [IGT] successtest: executing\n<6> [3216186.101115] [IGT] successtest: starting subtest first-subtest\n<6> [3216186.101159] String with a\nnewline\n<6> [3216186.101159] String with a\ttab\n<6> [3216186.101159] String with an explicit\\x00NUL\n<6> [3216186.101159] The character \\x13 should be nonprintable\n<6> [3216186.101159] Escaped backslash is \\\n<6> [3216186.101159] Kernel shouldn't output this but cutoff escape \\x1\n<6> [3216186.101159] More cutoff \\x\n<6> [3216186.101159] One more \\\n<6> [3216186.101160] [IGT] successtest: exiting, ret=0\n<6> [3216186.101299] Console: switching to colour frame buffer device 240x75\n"
+    }
   },
   "totals":{
     "":{
@@ -61,7 +61,7 @@
       "notrun":0,
       "fail":0,
       "warn":0
-    },
+    }
   },
   "runtimes":{
     "igt@successtest":{
@@ -70,6 +70,6 @@
         "start":0,
         "end":0.014
       }
-    },
+    }
   }
 }
diff --git a/runner/json_tests_data/empty-result-files/reference.json b/runner/json_tests_data/empty-result-files/reference.json
index f81ffb81..7c3a052a 100644
--- a/runner/json_tests_data/empty-result-files/reference.json
+++ b/runner/json_tests_data/empty-result-files/reference.json
@@ -14,7 +14,7 @@
 	"err":"",
 	"dmesg":"",
 	"result":"incomplete"
-    },
+    }
   },
   "totals":{
     "":{
@@ -55,7 +55,7 @@
       "notrun":0,
       "fail":0,
       "warn":0
-    },
+    }
   },
   "runtimes":{
   }
diff --git a/runner/json_tests_data/graceful-notrun/reference.json b/runner/json_tests_data/graceful-notrun/reference.json
index c95bdfec..2c9888e4 100644
--- a/runner/json_tests_data/graceful-notrun/reference.json
+++ b/runner/json_tests_data/graceful-notrun/reference.json
@@ -39,7 +39,7 @@
 	"err":"",
 	"dmesg":"",
 	"result":"notrun"
-    },
+    }
   },
   "totals":{
     "":{
@@ -106,7 +106,7 @@
       "notrun":2,
       "fail":0,
       "warn":0
-    },
+    }
   },
   "runtimes":{
     "igt@successtest":{
@@ -115,6 +115,6 @@
         "start":0,
         "end":0.014
       }
-    },
+    }
   }
 }
diff --git a/runner/json_tests_data/incomplete-before-any-subtests/reference.json b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
index 2a4bd456..ed2a3753 100644
--- a/runner/json_tests_data/incomplete-before-any-subtests/reference.json
+++ b/runner/json_tests_data/incomplete-before-any-subtests/reference.json
@@ -39,7 +39,7 @@
 	"err":"",
 	"dmesg":"",
 	"result":"notrun"
-    },
+    }
   },
   "totals":{
     "":{
diff --git a/runner/json_tests_data/notrun-results-multiple-mode/reference.json b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
index 3f8b7fb0..9820ecae 100644
--- a/runner/json_tests_data/notrun-results-multiple-mode/reference.json
+++ b/runner/json_tests_data/notrun-results-multiple-mode/reference.json
@@ -101,6 +101,6 @@
         "start":0,
         "end":0.014
       }
-    },
+    }
   }
 }
diff --git a/runner/json_tests_data/notrun-results/reference.json b/runner/json_tests_data/notrun-results/reference.json
index 800de38c..f419f7a1 100644
--- a/runner/json_tests_data/notrun-results/reference.json
+++ b/runner/json_tests_data/notrun-results/reference.json
@@ -120,6 +120,6 @@
         "start":0,
         "end":0.014
       }
-    },
+    }
   }
 }
-- 
2.37.1
