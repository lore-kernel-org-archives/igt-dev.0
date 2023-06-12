Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C931610E053
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jun 2023 16:53:10 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 12 Jun 2023 18:53:02 +0200
Message-Id: <20230612165302.28718-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib: Add kmsg for igt_abort
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Include a dmesg telltale for when the test run aborts.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index cd9c2002d..4aaaeddbc 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -2202,6 +2202,9 @@ void __igt_abort(const char *domain, const char *file, const int line,
 
 	igt_is_aborting = true;
 
+	igt_kmsg(KMSG_ERR "%s[%d]: Abort in function %s, file %s:%i, %s\n",
+		 command_str, getpid(), func, file, line, expression);
+
 	igt_log(domain, IGT_LOG_CRITICAL,
 		"Test abort in function %s, file %s:%i:\n", func, file,
 		line);
-- 
2.39.2
