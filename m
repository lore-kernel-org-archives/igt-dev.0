Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA0C71135
	for <igt-dev@archiver.kernel.org>; Mon, 16 Jun 2025 08:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A72610E2FB;
	Mon, 16 Jun 2025 08:54:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwCo/z2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD6D410E2F8
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Jun 2025 08:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750064080; x=1781600080;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZtcYqce4JPbX0+FtDkAQIadxWAp91+gX7HQO8wpadIE=;
 b=kwCo/z2kMyv2zk90DeLXkp0IynTKowixcHOtEf458e50Dp+fg/W6zQ+s
 PPtZyY5kEE7GNIQ9R1S/RNmjjzVDQ+9pbiO7f0ytb1oKAnxU9/TTAYh09
 /F5cm3dantdnyQwjZpfuCr6LwyESe1CEYRU2d45rpJ08o7Gw8BeIlfeK5
 +B36XMyLq2iw6xR2PUNnzDvdY/BTQ4u/mfTqbKJiWGlTynKESHcY16w/M
 xcnN1QIVfT52BmXtrvTTiTa4+Dp5bEqjj0dZ7uRswNbae/C0qNs0eglgy
 oKVHBwy9XNJgyfYRJyk9RYq27cCljUG3NEA9QshmXZwEkw90FY4YINH3J g==;
X-CSE-ConnectionGUID: 8WoyPg11QR2ruUVTPWimyw==
X-CSE-MsgGUID: 5TDvP+AmTUuu8zRlkAzDsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63615239"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="63615239"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:40 -0700
X-CSE-ConnectionGUID: 2xfD+Ki9S6u+H1glXGlirg==
X-CSE-MsgGUID: 3F1/a1TDQ+KUuBy1ryUL8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; d="scan'208";a="153285705"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 01:54:38 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: matthew.auld@intel.com, kamil.konieczny@intel.com, lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_exec_atomic: Fix incorrect GEM
 create flag
Date: Mon, 16 Jun 2025 10:54:17 +0200
Message-Id: <20250616085417.20178-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250616085417.20178-1-lukasz.laguna@intel.com>
References: <20250616085417.20178-1-lukasz.laguna@intel.com>
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

