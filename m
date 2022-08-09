Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52229949C3
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:13 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:24 +0200
Message-Id: <20220809125037.1231032-6-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 05/19] runner: Remove unused headers
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

Using CLion's automated code inspection, most unused includes were found
and removed. Some warnings remain as CLion is unable to track code usage
across certain attributes, but the vast majority of unneeded headers are
now gone.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 runner/job_list.c          | 2 --
 runner/resultgen.c         | 1 -
 runner/results.c           | 2 --
 runner/resume.c            | 2 --
 runner/runner.c            | 1 -
 runner/runner_json_tests.c | 1 -
 runner/settings.c          | 1 -
 7 files changed, 10 deletions(-)

diff --git a/runner/job_list.c b/runner/job_list.c
index 520a98da..3d6ef002 100644
--- a/runner/job_list.c
+++ b/runner/job_list.c
@@ -1,12 +1,10 @@
 #include <ctype.h>
 #include <errno.h>
 #include <fcntl.h>
-#include <linux/limits.h>
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include "job_list.h"
diff --git a/runner/resultgen.c b/runner/resultgen.c
index 6ecf325b..1d92d303 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -5,7 +5,6 @@
 #include <string.h>
 #include <sys/mman.h>
 #include <sys/stat.h>
-#include <sys/types.h>
 #include <unistd.h>
 
 #include <json.h>
diff --git a/runner/results.c b/runner/results.c
index 3eb7cb15..31510a05 100644
--- a/runner/results.c
+++ b/runner/results.c
@@ -1,8 +1,6 @@
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 
 #include "resultgen.h"
 
diff --git a/runner/resume.c b/runner/resume.c
index eb8074e3..10cf253c 100644
--- a/runner/resume.c
+++ b/runner/resume.c
@@ -2,8 +2,6 @@
 #include <fcntl.h>
 #include <stdio.h>
 #include <string.h>
-#include <sys/stat.h>
-#include <sys/types.h>
 
 #include "settings.h"
 #include "job_list.h"
diff --git a/runner/runner.c b/runner/runner.c
index 4855ad64..62c2671c 100644
--- a/runner/runner.c
+++ b/runner/runner.c
@@ -1,5 +1,4 @@
 #include <stdio.h>
-#include <string.h>
 
 #include "settings.h"
 #include "job_list.h"
diff --git a/runner/runner_json_tests.c b/runner/runner_json_tests.c
index 7253c906..6b94bc1e 100644
--- a/runner/runner_json_tests.c
+++ b/runner/runner_json_tests.c
@@ -1,5 +1,4 @@
 #include <sys/types.h>
-#include <sys/stat.h>
 #include <fcntl.h>
 
 #include <json.h>
diff --git a/runner/settings.c b/runner/settings.c
index bb63a9f4..313a0c95 100644
--- a/runner/settings.c
+++ b/runner/settings.c
@@ -10,7 +10,6 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
-#include <sys/types.h>
 #include <sys/stat.h>
 #include <sys/utsname.h>
 #include <unistd.h>
-- 
2.37.1
