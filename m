Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75794E7717E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BB010F1D6;
	Fri,  6 Dec 2024 21:30:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JBRbhu+W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752B410F1D2
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 21:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733520604; x=1765056604;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ZvqQgVMi1JaPNRDZPGk59MO8Hli2aaWjdN/lPvf2Lq0=;
 b=JBRbhu+W1QxG5WMOCcO8ZGM5FRQvWf9BhCOZvF996R/ZdHmmcoKfr/7A
 fxzCQo364tUVzUyyu0BVHqclxqhl77DzEMmu0bwrBLXN6r0QFNpJ5jnsG
 UYwb1lTZKkIZuoAWD2tLvH6ZJdWyJCvSQ/lRaIUBtMH153qLGIE0C6vD5
 xDfOJro+Fc8/keNqo1gpRyzGVrjEi9Iy6ByAO03zD12P1qowfQ/8u0JGo
 dEQdH4aHZKiWjwJXSkhm3s9ux0j5424QbWl8u4eDY/An6J1yBB1zGhRlk
 46U0KsOlMVlu1P/U3VCe1LMxQOOECFr+evyLKyLWq5GbbxAdX8CVYqEax Q==;
X-CSE-ConnectionGUID: FTUvmFoYS3GDq0B5UjWfhw==
X-CSE-MsgGUID: gKWx/KRhQIG2nNy+jYPqsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="51304469"
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="51304469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
X-CSE-ConnectionGUID: b90qG7mfTJK00anZM2SUkg==
X-CSE-MsgGUID: P1uWzxvET1GEvT8fvnIi4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,214,1728975600"; d="scan'208";a="95306723"
Received: from cataylo2-desk.jf.intel.com ([10.165.21.140])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 13:27:53 -0800
From: Clint Taylor <clinton.a.taylor@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 2/8] XE3: lib/intel_pat: extend for xe3
Date: Fri,  6 Dec 2024 13:27:42 -0800
Message-Id: <20241206212748.2101217-3-clinton.a.taylor@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
References: <20241206212748.2101217-1-clinton.a.taylor@intel.com>
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

