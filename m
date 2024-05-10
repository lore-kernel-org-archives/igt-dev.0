Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67882C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 11:27:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02CEF10E933;
	Fri, 10 May 2024 11:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eNxzVg/4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4458C10E933
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 11:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715340426; x=1746876426;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sSMwDinLhMmbo4EI+R0li2vYtFTXKi9dWhP7e4IPyx8=;
 b=eNxzVg/4tbEoz4lAWk5zvWox0bRMxVLLfvmRAy2BZlgqL93lddwWhEgk
 jqyc+v2aF/m5/tnJgcTgKamOG1CmM0ZqMhuaFrTrUFpCl9C6jHbovUQR3
 ULdM1GZah5RNtNxLI6Q84oSKBKUpxvP3WNrL2Tru+rAdkazF1GHSb3Ujb
 QkxvkmtnWVdicmsgQNKjJFITWuh3+oRQx7YSLwWhf1+id7U570aq+Vz9j
 /Zt1kGnMWUnR9EcluCQ4gCkWXnoM/BR19GPJMXFlSZv3WDlGgVgtLZ1bh
 mFraRfoDy3Bwv/h/oMZdrYZIZUOtihjZr0L4u77EDNZTcd1gr8GRojYmn Q==;
X-CSE-ConnectionGUID: zRZU4UQoQ8u5uI/2yEqENA==
X-CSE-MsgGUID: ICcnTeFhSimObdx55kB5pg==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11526998"
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="11526998"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:27:06 -0700
X-CSE-ConnectionGUID: H3o5XoOTRt66SGke9vsmsg==
X-CSE-MsgGUID: t1VcfctqQRu2vzR9iunK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,150,1712646000"; d="scan'208";a="29606730"
Received: from kholubow-mobl.ger.corp.intel.com (HELO
 vgovind2-mobl3.intel.com) ([10.252.51.238])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 04:27:03 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, bhanuprakash.modem@intel.com,
 juha-pekka.heikkila@intel.com, jani.saarinen@intel.com
Subject: [PATCH i-g-t v2] tests/intel/kms_big_fb: Fix width calculation while
 creating the intel buf
Date: Fri, 10 May 2024 14:26:50 +0300
Message-Id: <20240510112650.116711-1-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

This commit partially reverts bfa3db0cd9e9a - restores the changes done
to the width calculation.

v2: Add patch decription (Kamil / JP)

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/igt_draw.c           | 2 +-
 tests/intel/kms_big_fb.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 2c01d7b02..97a7e6b37 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -650,7 +650,7 @@ static struct intel_buf *create_buf(int fd, struct buf_ops *bops,
 	uint64_t region = driver == INTEL_DRIVER_XE ? vram_if_possible(fd, 0) : -1;
 	uint64_t size = from->size;
 
-	width = from->width;
+	width = from->stride / (from->bpp / 8);
 	height = from->height;
 	if (driver == INTEL_DRIVER_XE)
 		size = ALIGN(size, xe_get_default_alignment(fd));
diff --git a/tests/intel/kms_big_fb.c b/tests/intel/kms_big_fb.c
index f7f303d41..1e45d8e42 100644
--- a/tests/intel/kms_big_fb.c
+++ b/tests/intel/kms_big_fb.c
@@ -199,7 +199,7 @@ static struct intel_buf *init_buf(data_t *data,
 	tiling = igt_fb_mod_to_tiling(fb->modifier);
 	bpp = fb->plane_bpp[0];
 	size = fb->size;
-	width = fb->width;
+	width = fb->strides[0] / (bpp / 8);
 	height = fb->height;
 
 	name = gem_flink(data->drm_fd, fb->gem_handle);
-- 
2.34.1

