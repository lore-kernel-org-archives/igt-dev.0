Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D19889A60
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Jul 2021 12:18:55 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 19 Jul 2021 17:49:53 +0530
Message-Id: <20210719121953.14449-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20210719121953.14449-1-bhanuprakash.modem@intel.com>
References: <20210719121953.14449-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/kms_invalid_dotclock: Update to
 use renamed DSC api
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
List-ID: <igt-dev@lists.freedesktop.org>

As HDMI also supports DSC, *dp_dsc* is renamed to *dsc* since it
is no longer DP specific.

This patch will update to use renamed API.

Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Navare Manasi D <manasi.d.navare@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_invalid_dotclock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
index e02a94914a..95136d366d 100644
--- a/tests/kms_invalid_dotclock.c
+++ b/tests/kms_invalid_dotclock.c
@@ -57,7 +57,7 @@ can_bigjoiner(data_t *data)
 		igt_debug("Platform supports uncompressed bigjoiner\n");
 		return true;
 	} else if (intel_display_ver(devid) >= 11) {
-		return igt_is_dp_dsc_supported(data->drm_fd, connector);
+		return igt_is_dsc_supported(data->drm_fd, connector);
 	}
 
 	return false;
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
