Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED53BCD042E
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 01:30:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C6610E45E;
	Tue,  6 Jan 2026 01:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RHiKKvNP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B7310E44B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 01:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767663024; x=1799199024;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AOcc5QBRk0whwYvDhF/SA5KM+4jzAQGnqHTDViVtStk=;
 b=RHiKKvNPgmXdMRWrRQKVhJe/IUwnSwYQZhAxVjtvA0ZeYgR9x65UJao+
 XJ1GdEHvGVVdgqUFJCizj88ZfbhobL0cFQQeZFFyZvmJBLVzRAdfSK/aL
 A8/lrJgamgJ5JGziE0jCjBcZw1/MibzmIRoBgMjy+5R0v10GopQNYlg/R
 QltkTD/czuRvCI95rBqqGGJfTGDVSBo9JvvHwcG+wH+pKY9KL5yELibPm
 xQrgquIAldfjpfial+Hw+iIVmpNLhd1ecozlJ5dGt+UB+0/eJjj3S1zjU
 r2DpqFBVn36gLY/reh8G4Xpx/q4WtrrEJMNuRX1yM6mwN2vG783khuQiF w==;
X-CSE-ConnectionGUID: 4Hjvg8s0SJajo0eli+544Q==
X-CSE-MsgGUID: wcd2FoesSyGSeknieIVbmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="80483741"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="80483741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:24 -0800
X-CSE-ConnectionGUID: irkMzoBjRvO0TH95m6QmUA==
X-CSE-MsgGUID: 1Qxvi1mhSpu6rI918ktYkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201756989"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 17:30:24 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com,
	stuart.summers@intel.com
Subject: [PATCH 3/3] drm-uapi/xe: Remove multi-queue KEEP_ACTIVE flag
Date: Mon,  5 Jan 2026 17:30:20 -0800
Message-ID: <20260106013018.2851521-8-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
References: <20260106013018.2851521-5-niranjana.vishwanathapura@intel.com>
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

The KEEP_ACTIVE feature is being reverted, update uapi.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 include/drm-uapi/xe_drm.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index bb69f9b30c..077e66a682 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -1280,9 +1280,6 @@ struct drm_xe_vm_bind {
  *    then a new multi-queue group is created with this queue as the primary queue
  *    (Q0). Otherwise, the queue gets added to the multi-queue group whose primary
  *    queue's exec_queue_id is specified in the lower 32 bits of the 'value' field.
- *    If the extension's 'value' field has %DRM_XE_MULTI_GROUP_KEEP_ACTIVE flag
- *    set, then the multi-queue group is kept active after the primary queue is
- *    destroyed.
  *    All the other non-relevant bits of extension's 'value' field while adding the
  *    primary or the secondary queues of the group must be set to 0.
  *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
@@ -1331,7 +1328,6 @@ struct drm_xe_exec_queue_create {
 #define   DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE		3
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
 #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
-#define     DRM_XE_MULTI_GROUP_KEEP_ACTIVE			(1ull << 62)
 #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
 	/** @extensions: Pointer to the first extension struct, if any */
 	__u64 extensions;
-- 
2.43.0

