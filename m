Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA8E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 19:18:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B0510EC0F;
	Wed, 11 Dec 2024 19:18:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZEV/4fR7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2910010EC0F
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 19:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733944683; x=1765480683;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a7mSeZCbI5d49jE28cIjmn7c7Aosj7ue9PxZ92F9cRc=;
 b=ZEV/4fR7fLLYNo3x1qSLDMMQ2P5cR+nd2rFbxgCOkz3kFzkcvIVfvDe9
 g+YvgHvUeHFv8xiG9AxNYhLK8XrA6nCantIOW33X423Dw0Uk+cenXh6Lw
 ruxRVVjslVUW0i7QNIxlegh3toVRF1ifgJs31jnu2DG/KRTL8C+XrBdv3
 KqvqQ9QcdnA816zJUJUuPHeaTUQ/5jcazJlkaDpmB8UFHQZdrLpU7h1cQ
 MU043vuZhUJvthQKqVmPGP6spYuGAA3+PMqD87VyMk5MfiW7/6wKhUeUk
 sVG7YWamSaZmsCngVGjqecMNV68H8noXxJesQeiSXZwbDamkcvNh1aRz2 g==;
X-CSE-ConnectionGUID: ITG+AbgtQrOhSNBfoTUcEg==
X-CSE-MsgGUID: GsjoBmXBTI+J9puHMmGymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38027328"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="38027328"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:18:03 -0800
X-CSE-ConnectionGUID: lSn1uJHPRrSBj6KDBAyuMA==
X-CSE-MsgGUID: Ham5KB6vQbKOUVO4ZCRreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126883759"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:18:01 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 2/2] lib/xe_eudebug: Fix and update event filters
Date: Wed, 11 Dec 2024 20:17:41 +0100
Message-Id: <20241211191741.36973-2-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211191741.36973-1-christoph.manszewski@intel.com>
References: <20241211191741.36973-1-christoph.manszewski@intel.com>
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

At some point (before upstreaming) the eudebug uapi changed and
the 'DRM_XE_EUDEBUG_EVENT_MAX_EVENT' definition was dropped. Use an
existing event number for filtering out all events and add missing
filters for events introduced along the way.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 lib/xe/xe_eudebug.h | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/lib/xe/xe_eudebug.h b/lib/xe/xe_eudebug.h
index 9aadbe847..823c7f6ea 100644
--- a/lib/xe/xe_eudebug.h
+++ b/lib/xe/xe_eudebug.h
@@ -114,17 +114,21 @@ typedef void (*xe_eudebug_trigger_fn)(struct xe_eudebug_debugger *,
  */
 #define XE_EUDEBUG_DEFAULT_TIMEOUT_SEC		60ULL
 
-#define XE_EUDEBUG_FILTER_EVENT_NONE		BIT(DRM_XE_EUDEBUG_EVENT_NONE)
-#define XE_EUDEBUG_FILTER_EVENT_READ		BIT(DRM_XE_EUDEBUG_EVENT_READ)
-#define XE_EUDEBUG_FILTER_EVENT_OPEN		BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
-#define XE_EUDEBUG_FILTER_EVENT_VM		BIT(DRM_XE_EUDEBUG_EVENT_VM)
-#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
-#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION	BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
-#define XE_EUDEBUG_FILTER_EVENT_VM_BIND		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
-#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
-#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE  BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
-#define XE_EUDEBUG_FILTER_ALL			GENMASK(DRM_XE_EUDEBUG_EVENT_MAX_EVENT, 0)
-#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)	((1UL << (_e)) & (_f))
+#define XE_EUDEBUG_FILTER_EVENT_NONE			BIT(DRM_XE_EUDEBUG_EVENT_NONE)
+#define XE_EUDEBUG_FILTER_EVENT_READ			BIT(DRM_XE_EUDEBUG_EVENT_READ)
+#define XE_EUDEBUG_FILTER_EVENT_OPEN			BIT(DRM_XE_EUDEBUG_EVENT_OPEN)
+#define XE_EUDEBUG_FILTER_EVENT_VM			BIT(DRM_XE_EUDEBUG_EVENT_VM)
+#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE		BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE)
+#define XE_EUDEBUG_FILTER_EVENT_EXEC_QUEUE_PLACEMENTS	BIT(DRM_XE_EUDEBUG_EVENT_EXEC_QUEUE_PLACEMENTS)
+#define XE_EUDEBUG_FILTER_EVENT_EU_ATTENTION		BIT(DRM_XE_EUDEBUG_EVENT_EU_ATTENTION)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND			BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_UFENCE		BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_UFENCE)
+#define XE_EUDEBUG_FILTER_EVENT_METADATA		BIT(DRM_XE_EUDEBUG_EVENT_METADATA)
+#define XE_EUDEBUG_FILTER_EVENT_VM_BIND_OP_METADATA	BIT(DRM_XE_EUDEBUG_EVENT_VM_BIND_OP_METADATA)
+#define XE_EUDEBUG_FILTER_EVENT_PAGEFAULT		BIT(DRM_XE_EUDEBUG_EVENT_PAGEFAULT)
+#define XE_EUDEBUG_FILTER_ALL				GENMASK(DRM_XE_EUDEBUG_EVENT_PAGEFAULT, 0)
+#define XE_EUDEBUG_EVENT_IS_FILTERED(_e, _f)		((1UL << (_e)) & (_f))
 
 int xe_eudebug_connect(int fd, pid_t pid, uint32_t flags);
 const char *xe_eudebug_event_to_str(struct drm_xe_eudebug_event *e, char *buf, size_t len);
-- 
2.34.1

