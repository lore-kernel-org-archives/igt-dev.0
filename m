Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D321C83F0A
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 19:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237AD10E77F;
	Wed,  2 Jul 2025 19:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMvfMYDA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318A110E062
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 19:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751484784; x=1783020784;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3HW7XZKKfJLG3Pb+ff2MFXBIYygY0/F3zpsYrHuDtIo=;
 b=XMvfMYDAZ1a+7Wdgh2d63NqwQxWT5DdNju5Cxhk/SK2WwKbVyWPGhbI4
 /GL894mqog5AgCPlRpq8XzZaRoprpq9ZJCrBrBLHSC5N5zexPU4Hm/arK
 ziCt8UfDHeKV69szOq3wjsrEFk659Tuz/uOuGtzW3o+TM2GXC52TM/KwA
 Gj3XQqbabXzMfOujyst6DcVcid0/Bed31Lw2NndnPwmuJR3CsNDtPE22k
 1zeK73IMfSlrin26+Q9x9Vf6KU6BygUajdLK/j1QcY4Vym0CytvI3B1wv
 eU5up2XQ/l5XBCE4XbfrRdxJfnCs+LzVCu7L6QtdpybvlgUX1EAfpVADa g==;
X-CSE-ConnectionGUID: OqTVlbxrTzqxRyfDxLyVvA==
X-CSE-MsgGUID: CT5P1h5bQq2FCFoyhrLbeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="53028474"
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="53028474"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:04 -0700
X-CSE-ConnectionGUID: YiZ2T8A5SJOxLkfDh0YRIA==
X-CSE-MsgGUID: d53Ylxl9QnOCEf0IxZm2tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,282,1744095600"; d="scan'208";a="154241556"
Received: from mdroper-desk1.fm.intel.com ([10.1.39.133])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 12:33:03 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.d.roper@intel.com,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 4/7] lib/xe: Ensure GT loops iterate over all GTs
 properly
Date: Wed,  2 Jul 2025 12:32:59 -0700
Message-ID: <20250702193254.2613121-13-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702193254.2613121-9-matthew.d.roper@intel.com>
References: <20250702193254.2613121-9-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

There's no guarantee that GT IDs will be consecutive on future
platforms.  Ensure that the GT loops visit each GT in the GT ID mask,
rather than [0, num_gt - 1].

v2:
 - s/ffs/ffsll/  (Zbigniew)
 - Replace BIT() with 1ull shift.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_query.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
index 9a2ceb4c8..d18ca2b56 100644
--- a/lib/xe/xe_query.h
+++ b/lib/xe/xe_query.h
@@ -77,8 +77,9 @@ struct xe_device {
 	for (__class = 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
 	     ++__class)
 #define xe_for_each_gt(__fd, __gt) \
-	for (__gt = 0; __gt < xe_number_gt(__fd); ++__gt)
-
+	for (uint64_t igt_unique(__mask) = xe_device_get(__fd)->gt_mask; \
+	     __gt = ffsll(igt_unique(__mask)) - 1, igt_unique(__mask) != 0; \
+	     igt_unique(__mask) &= ~(1ull << __gt))
 #define xe_for_each_mem_region(__fd, __memreg, __r) \
 	for (uint64_t igt_unique(__i) = 0; igt_unique(__i) < igt_fls(__memreg); igt_unique(__i)++) \
 		for_if(__r = (__memreg & (1ull << igt_unique(__i))))
-- 
2.49.0

