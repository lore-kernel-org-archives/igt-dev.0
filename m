Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADDED637D0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 23:03:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A6B510E29C;
	Wed, 13 Nov 2024 23:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RpK1gao+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 600BC10E29B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 23:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731538986; x=1763074986;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=idpM2MYyVB7sdL5vzGYagnHAbF4UZAkrNkwcm1AokKQ=;
 b=RpK1gao+GlcsrTXhobaQ1FaH4lISRyEh6EnpZl44ri0ghYAcleWySXHm
 GYnOAFLtdIU4bsRfhVPjR1txXE4qfJTF1E9zt5PJIhmyJx8ETUhJOeUTG
 evZgp3hW13Xu1qL0nzd/qsp9g3iA70BHrb428utCkleU2Kmh2xMR8lH2B
 f6z6lb2J58L61d6YG+B9aQzg+4/OVUHW7dHWUzhHAlr4SIVk5amR3ecL7
 NrpWy9yu5Z88YqsXDB6EFgzibdZ8mXp2pNGCQH5AQyKGrNXGtOlHYk63c
 qKncJhA0mjQdrtO/GAFUCzWo0p/eT9Lebk0MQXFQ9/ZHhRpWjrpgLF3ik g==;
X-CSE-ConnectionGUID: 0igcbXRSTDaz2Atd2Az+wA==
X-CSE-MsgGUID: 5tJCTC+3Sjm1HMO7BKXgpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53999374"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="53999374"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
X-CSE-ConnectionGUID: bexLCLqFSamn6XGHY+RTRQ==
X-CSE-MsgGUID: Mub+5smwTTCDvrrFebS92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; d="scan'208";a="93074714"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 15:03:05 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/9] XE3: lib/intel_pat: extend for xe3
Date: Wed, 13 Nov 2024 15:02:55 -0800
Message-Id: <20241113230301.655499-5-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241113230301.655499-1-clinton.a.taylor@intel.com>
References: <20241113230301.655499-1-clinton.a.taylor@intel.com>
MIME-Version: 1.0
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

From: Matthew Auld <matthew.auld@intel.com>

Xe3 should use the same pat_index modes as Xe2. Also matches the kernel
side.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Clint Taylor <Clinton.A.Taylor@intel.com>
---
 lib/intel_pat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 7f175b057..156b1ee5d 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -19,7 +19,8 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 {
 	uint16_t dev_id = intel_get_drm_devid(fd);
 
-	if (intel_get_device_info(dev_id)->graphics_ver == 20) {
+	if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
+	    intel_get_device_info(dev_id)->graphics_ver == 20) {
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
-- 
2.25.1

