Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A006EB09
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Aug 2021 09:10:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Fri,  6 Aug 2021 14:40:28 +0530
Message-Id: <20210806091028.296829-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_setmode: Fix to get a valid config
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
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Imre Deak <imre.deak@intel.com>, Ankit Nautiyal <ankit.k.nautiyal@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

CRTCs in this test will be modesetted one-by-one, we won't
get a failure sice each connector has its own CRTC.

Cc: Imre Deak <imre.deak@intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_setmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
index 89220b83e..11bce1da0 100644
--- a/tests/kms_setmode.c
+++ b/tests/kms_setmode.c
@@ -361,7 +361,7 @@ static void setup_crtcs(const struct test_config *tconf,
 	}
 	for (i = 0; i < resources->count_encoders; i++)
 		if (encoder_usage_count[i] > 1 &&
-				!!(tconf->flags & TEST_SINGLE_CRTC_CLONE))
+				!!(tconf->flags & (TEST_SINGLE_CRTC_CLONE | TEST_TIMINGS))
 			config_valid = false;
 
 	*crtc_count_ret = crtc_count;
-- 
2.32.0
