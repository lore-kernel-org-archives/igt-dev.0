Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from farmhouse.coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A011710E3FC
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jun 2022 12:25:40 +0000 (UTC)
From: Luca Coelho <luca@coelho.fi>
To: igt-dev@lists.freedesktop.org
Date: Wed, 15 Jun 2022 15:25:31 +0300
Message-Id: <20220615122533.658564-3-luca@coelho.fi>
In-Reply-To: <20220615122533.658564-1-luca@coelho.fi>
References: <20220615122533.658564-1-luca@coelho.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/4] tests/kms_sysfs_edid_timing: fail if
 probing a single connector takes too long
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Luca Coelho <luciano.coelho@intel.com>

There's no point in just warning if probing a single connector takes
too long.  If a test finds any issues, it should just fail.

Convert the warning into an assertion.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_sysfs_edid_timing.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/kms_sysfs_edid_timing.c b/tests/kms_sysfs_edid_timing.c
index 028a5323c0b2..ea0e169e6ed9 100644
--- a/tests/kms_sysfs_edid_timing.c
+++ b/tests/kms_sysfs_edid_timing.c
@@ -81,11 +81,11 @@ igt_simple_main
 			  mean.max, mean.max / 1e3, mean.max / 1e6,
 			  mean.mean, mean.mean / 1e3, mean.mean / 1e6);
 
-		if (mean.max > (THRESHOLD_PER_CONNECTOR * 1e6)) {
-			igt_warn("%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
-				 de->d_name, THRESHOLD_PER_CONNECTOR,
-				 mean.max / 1e6, mean.mean / 1e6);
-		}
+		igt_assert_f(mean.max < THRESHOLD_PER_CONNECTOR * 1e6,
+			     "%s: probe time exceed %dms, max=%.2fms, avg=%.2fms\n",
+			     de->d_name, THRESHOLD_PER_CONNECTOR,
+			     mean.max / 1e6, mean.mean / 1e6);
+
 		igt_assert_f(mean.mean < (THRESHOLD_TOTAL * 1e6),
 			     "%s: average probe time exceeded %dms, max=%.2fms, avg=%.2fms\n",
 			     de->d_name, THRESHOLD_TOTAL,
-- 
2.36.1
