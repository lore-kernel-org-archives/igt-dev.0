Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9D96E321
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jan 2020 09:17:50 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 14 Jan 2020 11:17:42 +0200
Message-Id: <20200114091745.4555-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] lib: Don't dump log buffer when dynamic
 subtest failure is inherited
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

A subtest with dynamic subparts will automatically fail if any dynamic
subparts fail. Failing a subtest will dump our log buffer, which is
useful in normal cases, but when it's just the actual subtest
inheriting the failure from a dynamic subtest, nothing in the log
buffer is of any use for the failure.

Dynamic subtest parsing will stuff all output after the last dynamic
subtest into that last dynamic subtest's output, and in the case of
that last dynamic subtest itself being a 'SUCCESS', that extra output
from dumping the log buffer will cause an innocent dynamic subtest to
be incorrectly marked as a 'WARN' result.

Issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/66
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 lib/igt_core.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index c705be1e..0a006894 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -370,6 +370,23 @@ static void _igt_log_buffer_dump(void)
 {
 	uint8_t i;
 
+	if (in_subtest && !in_dynamic_subtest && _igt_dynamic_tests_executed >= 0) {
+		/*
+		 * We're exiting a subtest with dynamic subparts and
+		 * we're reaching this function because a dynamic
+		 * subpart failed which automatically translates to
+		 * the subtest failing. There cannot be anything in
+		 * the log buffer that is of any use to anyone; The
+		 * dynamic subpart that failed has already printed out
+		 * the real reason for the failure, and dumping the
+		 * buffer at this point will only cause the last
+		 * executed dynamic part be incorrectly marked as
+		 * 'WARN' by igt_runner.
+		 */
+		_igt_log_buffer_reset();
+		return;
+	}
+
 	if (in_dynamic_subtest)
 		fprintf(stderr, "Dynamic subtest %s failed.\n", in_dynamic_subtest);
 	else if (in_subtest)
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
