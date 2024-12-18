Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5C3E7718A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6514410E473;
	Wed, 18 Dec 2024 21:37:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XDxBRSfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12E3710E24C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 21:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734557819; x=1766093819;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZvqQgVMi1JaPNRDZPGk59MO8Hli2aaWjdN/lPvf2Lq0=;
 b=XDxBRSfegSsronAZH5mw/3QqLrpn3mv1sRbYAnW+dqHL37o8DPyhvHMR
 IY7Qt1vRGgHzc9yQDy2h7qUkMgiu/j7M/ysyc9xo0IyNt09jhqr6/JUA4
 tBHty1H8oHHaclV4JnaA+5x1tY/OJLdVEW+6MVcomlkXxK2yRtOuTgLuS
 0YbY5HLb92PGuKlnpoigIfzUS3G+duUXXGvMN+Py0zpGRHMR9IFaYW+Yb
 OLGEeZ3ou37wXOYkyLVeO0MUtXl3nB65SU3LCRwdGw2XdY0jnPg9k1iAK
 bggR0RQU9tsztPL3hrZT9zSTOyRw/ibjtNOi/riz0qujCVRoAUefxY83R Q==;
X-CSE-ConnectionGUID: /UZQ2KXjSsSZOrQYfxWqgA==
X-CSE-MsgGUID: TLWdUVEUTLO0UuvBBuoAkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="34379757"
X-IronPort-AV: E=Sophos;i="6.12,245,1728975600"; d="scan'208";a="34379757"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
X-CSE-ConnectionGUID: dPO4igsLSlieLythlD/CXg==
X-CSE-MsgGUID: UvB9YJUPSIqJs1lrlAhU6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="128973917"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 13:36:58 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 2/7] lib/intel_pat: extend for xe3
Date: Wed, 18 Dec 2024 13:36:49 -0800
Message-Id: <20241218213654.2734573-3-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
References: <20241218213654.2734573-1-clinton.a.taylor@intel.com>
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
Reviewed-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
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

