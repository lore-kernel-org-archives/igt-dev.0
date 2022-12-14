Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A1710E4C8
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 23:25:29 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 15:28:19 -0800
Message-Id: <20221214232819.1973714-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/pxp: PXP debugfs path
 promoted to global
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

As per recent kernel side update in preparation for
MTL, PXP is not a global i915 subsystem so let's update
the debugfs path to try both the legacy and new paths
before we fail.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/i915/gem_pxp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
index ffad9b5a..cd402c7c 100644
--- a/tests/i915/gem_pxp.c
+++ b/tests/i915/gem_pxp.c
@@ -848,6 +848,14 @@ static void trigger_pxp_debugfs_forced_teardown(int i915)
 	char str[32];
 
 	fd = igt_debugfs_open(i915, "gt/pxp/terminate_state", O_RDWR);
+	/*
+	 * At MTL onwards, we promoted PXP to be a global i915 subsystem,
+	 * so try again with a top-level path if we failed at the gt path.
+	 * If we still fail, then we assert out.
+	 */
+	if (fd < 0)
+		fd = igt_debugfs_open(i915, "pxp/terminate_state", O_RDWR);
+
 	igt_assert_f(fd >= 0, "Can't open pxp termination debugfs\n");
 	ret = snprintf(str, sizeof(str), "0x1");
 	igt_assert(ret > 2 && ret < sizeof(str));

base-commit: c001793d5f22deb01918b6ba52af829794582df1
-- 
2.34.1
