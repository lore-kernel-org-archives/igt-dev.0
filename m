Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA29710E2BF
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jan 2023 10:57:20 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 26 Jan 2023 12:53:37 +0200
Message-Id: <20230126105338.419418-3-petri.latvala@intel.com>
In-Reply-To: <20230126105338.419418-1-petri.latvala@intel.com>
References: <20230126105338.419418-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/3] runner: Refactor abort-checking to a
 helper function
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

Abort-condition checking at runtime will later use the helper
differently.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 9d3623b4..5b4e84d1 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -348,21 +348,21 @@ static const struct {
 	{ 0, 0 },
 };
 
-static char *need_to_abort(const struct settings* settings)
+static char *_need_to_abort(int abort_mask, int log_level)
 {
 	typeof(*abort_handlers) *it;
 
 	for (it = abort_handlers; it->condition; it++) {
 		char *abort;
 
-		if (!(settings->abort_mask & it->condition))
+		if (!(abort_mask & it->condition))
 			continue;
 
 		abort = it->handler();
 		if (!abort)
 			continue;
 
-		if (settings->log_level >= LOG_LEVEL_NORMAL)
+		if (log_level >= LOG_LEVEL_NORMAL)
 			errf("Aborting: %s\n", abort);
 
 		return abort;
@@ -371,6 +371,11 @@ static char *need_to_abort(const struct settings* settings)
 	return NULL;
 }
 
+static char *need_to_abort(const struct settings *settings)
+{
+	return _need_to_abort(settings->abort_mask, settings->log_level);
+}
+
 static void prune_subtest(struct job_list_entry *entry, const char *subtest)
 {
 	char *excl;
-- 
2.30.2
