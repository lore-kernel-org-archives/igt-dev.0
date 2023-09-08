Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  8 Sep 2023 12:44:45 +0200
Message-ID: <20230908104438.125454-25-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
References: <20230908104438.125454-19-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 06/17] lib/ktap: Make sure we fail on
 premature cancel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>,
 intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

After loading a kunit test module that executes some kunit test cases, we
evaluate overall result of an IGT subtest that corresponds to that module
based on an error code returned by kunit_parser_stop() helper, obtained
from a .ret field of a ktap_args structure.  That code is now assigned to
that structure field right before completion of the KTAP parser thread
start routine.  If the thread is canceled for some reason then the return
code will be undefined.

Initialize the return code on KTAP parser startup with a value that
indicates a failure, then change it to success when so indicated by result
of KTAP parsing.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/igt_ktap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/igt_ktap.c b/lib/igt_ktap.c
index 123a40d183..84fb13218f 100644
--- a/lib/igt_ktap.c
+++ b/lib/igt_ktap.c
@@ -579,9 +579,7 @@ igt_ktap_parser_start:
 igt_ktap_parser_end:
 	results.still_running = false;
 
-	if (failed_tests || !found_tests)
-		ktap_args.ret = IGT_EXIT_FAILURE;
-	else
+	if (found_tests && !failed_tests)
 		ktap_args.ret = IGT_EXIT_SUCCESS;
 
 	return NULL;
@@ -598,6 +596,7 @@ struct ktap_test_results *ktap_parser_start(int fd, bool is_builtin)
 	ktap_args.fd = fd;
 	ktap_args.is_builtin = is_builtin;
 	ktap_args.is_running = true;
+	ktap_args.ret = IGT_EXIT_FAILURE;
 	pthread_create(&ktap_parser_thread, NULL, igt_ktap_parser, NULL);
 
 	return &results;
-- 
2.41.0
