Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF71EA4E08
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 14:01:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8900110E4FE;
	Mon,  2 Mar 2026 14:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DfLbunTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49FAE10E4FF
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772460092; x=1803996092;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kJXEYrGbFmf/nUk7Z7SAZl/8MlWy/EM6ZkqoJ50cCdU=;
 b=DfLbunTSVKf6kIJtMBos0qbhLFkBtFbAj+9KchAwzAXODzE4QuvqQ4T2
 WRENljn/qSjLKLbzH45z/rLdihPC7+/2CixyyU4MXqMuVk3oLMiidPDtj
 NglN/Dd8HEYuVimxSklbBhzH2dBaC9A5od5bQNdfdRW4Y0bCYP2ZFwB7g
 4aorkgXfBRzOzsyBpXAwIfw8f+Gf3/LmiyxN5Mb7jsFZn6XPAjO04yfnz
 8Gby9uHDeU7d1CZqG0+4vheCCMBcoi9bdKKHviiWlBR2lr4AoWI/v9i+a
 vr2iAXYDdTLGBIOUOBxdhzrOEy9jja1E0RkwoBck8LSeoTtvGv/mOcCpq g==;
X-CSE-ConnectionGUID: 2CeIYmUBTGKNp2F+dYfiwg==
X-CSE-MsgGUID: sGwCZ0y4QZml8+lFURkfzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="84170712"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="84170712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:01:32 -0800
X-CSE-ConnectionGUID: P4k/eNx7QvCgd9iGeDCL/w==
X-CSE-MsgGUID: tu4wuKs3Qvutq4rfcJmqpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="214126800"
Received: from dut6245dg2frd.fm.intel.com ([10.80.54.109])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 06:01:32 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	thomas.hellstrom@intel.com
Cc: nishit.sharma@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v2 i-g-t 1/2] drm-uapi/xe: Add support for No Overcommit flag
Date: Mon,  2 Mar 2026 14:00:09 +0000
Message-ID: <20260302140010.1009564-2-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260302140010.1009564-1-sobin.thomas@intel.com>
References: <20260302140010.1009564-1-sobin.thomas@intel.com>
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

Align with kernel commit 369cc8804985 ("drm/xe/uapi: Introduce a flag to
disallow VM overcommit in fault mode"). This adds support for the No
Overcommit flag in IGT to match the kernel UAPI behavior.

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 077e66a68..12a9da045 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -983,6 +983,8 @@ struct drm_xe_vm_create {
 #define DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE	(1 << 0)
 #define DRM_XE_VM_CREATE_FLAG_LR_MODE	        (1 << 1)
 #define DRM_XE_VM_CREATE_FLAG_FAULT_MODE	(1 << 2)
+#define DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT  (1 << 3)
+
 	/** @flags: Flags */
 	__u32 flags;
 
-- 
2.52.0

