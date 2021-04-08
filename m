Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45FD36E40D
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 22:26:35 +0000 (UTC)
From: "Navare, Manasi D" <manasi.d.navare@intel.com>
Date: Thu, 8 Apr 2021 22:26:31 +0000
Message-ID: <44e841ff418c488a9998817113b2cfd5@intel.com>
References: <20210408002158.1318976-1-khaled.almahallawy@intel.com>
 <20210408215111.1324847-1-khaled.almahallawy@intel.com>
In-Reply-To: <20210408215111.1324847-1-khaled.almahallawy@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2] tools: Fix running
 intel_dp_compliance if it is found in the search path($PATH env variable)
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Almahallawy, Khaled" <khaled.almahallawy@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Latvala, Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

If there is a Gitlab issue around it please mention that in the commit message.
Else this looks good to me

Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>

Manasi

-----Original Message-----
From: Almahallawy, Khaled <khaled.almahallawy@intel.com> 
Sent: Thursday, April 8, 2021 2:51 PM
To: igt-dev@lists.freedesktop.org
Cc: Latvala, Petri <petri.latvala@intel.com>; Navare, Manasi D <manasi.d.navare@intel.com>; Almahallawy, Khaled <khaled.almahallawy@intel.com>
Subject: [PATCH i-g-t v2] tools: Fix running intel_dp_compliance if it is found in the search path($PATH env variable)

When intel_dp_compliance binary location is part of PATH environment variable, running it from the shell without relative or full path, cause the following assertion failure because chdir:

$:~# intel_dp_compliance
(intel_dp_compliance:3070) CRITICAL: Test assertion failure function enter_exec_path, file ../tools/igt_compliance_utils.c:56:
(intel_dp_compliance:3070) CRITICAL: Failed assertion: ret == 0
(intel_dp_compliance:3070) CRITICAL: Last errno: 2, No such file or directory
(intel_dp_compliance:3070) CRITICAL: error: -1 != 0 Stack trace:
  #0 ../lib/igt_core.c:1726 __igt_fail_assert()
  #1 [enter_exec_path+0x8b]
  #2 ../tools/intel_dp_compliance.c:843 main()
  #3 ../csu/libc-start.c:342 __libc_start_main()
  #4 [_start+0x2e]
Test (null) failed.
**** DEBUG ****
(intel_dp_compliance:3070) CRITICAL: Test assertion failure function enter_exec_path, file ../tools/igt_compliance_utils.c:56:
(intel_dp_compliance:3070) CRITICAL: Failed assertion: ret == 0
(intel_dp_compliance:3070) CRITICAL: Last errno: 2, No such file or directory
(intel_dp_compliance:3070) CRITICAL: error: -1 != 0
(intel_dp_compliance:3070) igt_core-INFO: Stack trace:
(intel_dp_compliance:3070) igt_core-INFO:   #0 ../lib/igt_core.c:1726 __igt_fail_assert()
(intel_dp_compliance:3070) igt_core-INFO:   #1 [enter_exec_path+0x8b]
(intel_dp_compliance:3070) igt_core-INFO:   #2 ../tools/intel_dp_compliance.c:843 main()
(intel_dp_compliance:3070) igt_core-INFO:   #3 ../csu/libc-start.c:342 __libc_start_main()
(intel_dp_compliance:3070) igt_core-INFO:   #4 [_start+0x2e]
****  END  ****
FAIL (-1.000s)

This patch fixes this issue.

v2: (PATH_MAX - 1) and dirname (Petri)

Signed-off-by: Khaled Almahallawy <khaled.almahallawy@intel.com>
---
 tools/igt_compliance_utils.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/tools/igt_compliance_utils.c b/tools/igt_compliance_utils.c index d6a2e4e529d9..0faf3fc874e6 100644
--- a/tools/igt_compliance_utils.c
+++ b/tools/igt_compliance_utils.c
@@ -29,7 +29,7 @@
 #include <stdlib.h>
 #include <signal.h>
 #include <termios.h>
-
+#include <libgen.h>
 #include <sys/stat.h>
 
 #include "igt_dp_compliance.h"
@@ -39,22 +39,14 @@ struct termios saved_tio;
 
 void enter_exec_path(char **argv)
 {
-	char *exec_path = NULL;
-	char *pos = NULL;
-	short len_path = 0;
+	char exec_path[PATH_MAX];
 	int ret;
 
-	len_path = strlen(argv[0]);
-	exec_path = (char *) malloc(len_path);
-
-	memcpy(exec_path, argv[0], len_path);
-	pos = strrchr(exec_path, '/');
-	if (pos != NULL)
-		*(pos+1) = '\0';
-
-	ret = chdir(exec_path);
+	memset(exec_path, 0, sizeof(exec_path));
+	ret = readlink("/proc/self/exe", exec_path, sizeof(exec_path)-1);
+	igt_assert(ret != -1);
+	ret = chdir(dirname(exec_path));
 	igt_assert_eq(ret, 0);
-	free(exec_path);
 }
 
 static void restore_termio_mode(int sig)
--
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
