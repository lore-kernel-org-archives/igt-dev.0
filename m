Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB3CD116F1
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 18:21:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2A110E454;
	Mon,  1 Dec 2025 18:21:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BdCask++";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB4310E453
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764613279; x=1796149279;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=yt5/+EoAvpXMeTbGGZ7snJYGFJZ5MFYBzjjO2WEUAUY=;
 b=BdCask++16ao1PEs9/6WdROrAUjm+3LX4NrRngUxIaKj+Ko4DcncYWpm
 tJy7JkR8RxIVP77/6Ba9qCH8NL4J5Qmx8E/5smZoghxXCKllHZOK+x+7I
 ANrPJP0ptjFJ32dlWKQFlcKeRQ/d0hPaavEegr02cLSgER9PoTsztPSE9
 LflFHOQCSpNd4OfAp4TJNuAUbICF/j6kosS3DGxpKzxiIGsAAMBiD/Hsv
 kH+uuj0jQtA/US6+dJ2KThmdN8NA8XW1W8LlrML8sGdZY+mgIrUC5nTjD
 S0lM8pCN4uyx2dj+mUpqcIvShpAqAjsWf3JYcvUT0UxSYlTONPgCbCu6X g==;
X-CSE-ConnectionGUID: ub9VTaaSQHWoYf4KsTYiPQ==
X-CSE-MsgGUID: CzjYSb+8SEizGtyWncHMvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="89210574"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="89210574"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:21:19 -0800
X-CSE-ConnectionGUID: tqAXDdb3Ryyj1CPDfG9IFg==
X-CSE-MsgGUID: vXvsMprVRwKQ7Z4g/2fHPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="193968530"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 10:21:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 2/2] tests/intel/xe_exec_queue_property: Sync to latest KMD
 properties
Date: Mon,  1 Dec 2025 10:21:14 -0800
Message-Id: <20251201182114.851967-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201182114.851967-1-matthew.brost@intel.com>
References: <20251201182114.851967-1-matthew.brost@intel.com>
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

DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE was added in b80961a86b40
("drm/xe/uapi: Add DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE"), update
invalidate property test to reflect latest KMD exec queue properties.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4dfcf09e26..7a2fbdeec8 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -172,6 +172,7 @@ static void basic_get_property(int xe)
 static void invalid_property(int xe)
 {
 	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
+	uint32_t max_property = DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE;
 	struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
@@ -189,7 +190,7 @@ static void invalid_property(int xe)
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
-	for (int i = 3; i < 16; i++ ) {
+	for (int i = max_property + 1; i < 16; i++ ) {
 		ext.property = i;
 		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
-- 
2.34.1

