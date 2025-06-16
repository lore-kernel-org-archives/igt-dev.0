Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8CDC71136
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 14:23:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE00110E3C6;
	Mon, 16 Jun 2025 14:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iYHEV3vd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDEE10E3C6
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 14:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750083791; x=1781619791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZtcYqce4JPbX0+FtDkAQIadxWAp91+gX7HQO8wpadIE=;
 b=iYHEV3vdhMED6Il77Oj3aYEr9UuIpW8NjfStkgpxbZV1DwadDAdfZa0E
 sGobeIrH2BOnAU5dUMzue4/9f9qyv6ELl1rruNp+j1GuCXyCm2zWv7klV
 UKJsJ79/tmVK+7yyij9aLZJeHF+bU9i1i0rW4NFdctOFIwRTUHGJFVEZ6
 su4Je+mqOZXteJOLO+2hEiYmIUgw5Ky8zuAoJv3ylKThbHBdWrRpOraJh
 czp4VW6klHPpajsBAVzYy8Vb/SKX8U8l2MFxwVIzRO2hQUKkRhu/yLPeR
 eJoXdGPdHm8dvq4hm3TF5Ao2+ymURH/RtkecdUmPhTRIpTvxENRtYRQ3O Q==;
X-CSE-ConnectionGUID: RIJMAZJbRYO52PK9PjSmfg==
X-CSE-MsgGUID: //cKJTHZQjm/sPd5slVHlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="54847216"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="54847216"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:11 -0700
X-CSE-ConnectionGUID: 97lCRNGjSM2aDxaVHAusnQ==
X-CSE-MsgGUID: 9dMFJ84VQoWUCENK5+ZI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="152324573"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 07:23:09 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_exec_atomic: Fix incorrect GEM
 create flag
Date: Mon, 16 Jun 2025 16:22:59 +0200
Message-Id: <20250616142259.19124-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250616142259.19124-1-lukasz.laguna@intel.com>
References: <20250616142259.19124-1-lukasz.laguna@intel.com>
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

Replace I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS with the correct
DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM.

Suggested-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_exec_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index 825d7d190..39c739b64 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -85,7 +85,7 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 	bo_size = xe_bb_size(fd, bo_size);
 
 	bo = xe_bo_create(fd, vm, bo_size, placement,
-			  I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS);
+			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
-- 
2.40.0

