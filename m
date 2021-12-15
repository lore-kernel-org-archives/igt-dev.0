Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD80610E1BE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Dec 2021 10:35:47 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 15 Dec 2021 12:35:06 +0200
Message-Id: <20211215103506.17273-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_core: Ensure subtest result is skip
 if all dynamic subtests skip
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Jari Tahvanainen <jari.tahvanainen@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Even though the best practices for dynamic subtests is to not execute
the dynamic subtest at all instead of skipping, there are a couple of
tests that to the opposite, without an easy way to construct them
along best practices. Accomodate this with fixing the handling of
skipping dynamic subtests so that the result of the containing subtest
becomes a skip also if all dynamic subtests skip, not just when there
are no dynamic subtests.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
---
 lib/igt_core.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index ec05535c..7c906675 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1471,7 +1471,14 @@ void igt_skip(const char *f, ...)
 	}
 
 	if (in_subtest) {
-		/* Doing the same even if inside a dynamic subtest */
+		if (in_dynamic_subtest) {
+			/*
+			 * Don't count skipping dynamic subtests, for
+			 * the purposes of getting the result of the
+			 * containing subtest.
+			 */
+			_igt_dynamic_tests_executed--;
+		}
 		exit_subtest("SKIP");
 	} else if (test_with_subtests) {
 		skip_subtests_henceforth = SKIP;
-- 
2.29.2
