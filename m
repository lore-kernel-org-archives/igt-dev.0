Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F236E10E12A
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jan 2022 12:20:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon,  3 Jan 2022 17:48:42 +0530
Message-Id: <20220103121842.1706254-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Add debug prints for
 invalid configs
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
List-ID: <igt-dev@lists.freedesktop.org>

Subtest will throw SUCCESS even though tests are not executing
for invalid config. For debugging purposes, adding prints to
invalid configs can differentiate from NOT_RUN.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 18d81ee4f3..3620496cf6 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -666,6 +666,9 @@ static void test_one_combination(const struct test_config *tconf,
 
 	if (config_valid == !(tconf->flags & TEST_INVALID))
 		test_crtc_config(tconf, crtcs, crtc_count);
+	else
+		igt_info("%s %d connector combination is not valid.\n",
+			 tconf->name, connector_count);
 
 	cleanup_crtcs(crtcs, crtc_count);
 }
-- 
2.32.0
