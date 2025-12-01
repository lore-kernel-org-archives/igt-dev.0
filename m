Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D740D116F3
	for <igt-dev@archiver.kernel.org>; Mon,  1 Dec 2025 22:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36110E4A9;
	Mon,  1 Dec 2025 22:31:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FncorMeL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0A710E4A9
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Dec 2025 22:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764628291; x=1796164291;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=NrFco0+gOlhVsUQ3GqZ368xl54eC5ivCpt3Dym/VnuU=;
 b=FncorMeLtLPO1kRiYeUreusukzwh9wfIJiFugUIpZooFexdKCCp3ZWr/
 CZJMSNuK4fl/5gM5znX3Wufg4GmrHWT35/s1seSyvXs2zib8WxJNviHlM
 7fa1xgGrnw6SjuWwNqF15Jj4kBMAAMZifWdM/xI26327UoLxD/DF1nGDd
 wFnUg0vG8f2m7Q3bbF7wmIJlN0y4fS10jo22V6vR7dq9OqNC0C3cdLtqM
 K8AXQHz6Pif0SBm5TYf8IFIDidMTApMik/4Klz8zZZNDFvWXXc5B92EMg
 ky2NGg2zLqf4vn8i1M3dhWFpW3tAegz8/AN/0s7hsASQAkfdqYJHOtOm0 A==;
X-CSE-ConnectionGUID: mGePusS0S+yEelnHwM1LXQ==
X-CSE-MsgGUID: IdH2l0QjRiOR/hQWKr4p7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66468969"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="66468969"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:31:30 -0800
X-CSE-ConnectionGUID: alIq+TqzQDmUBwEzRQJHtA==
X-CSE-MsgGUID: YYvJ/FmyT5m7lbAp1KHJ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="199129341"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 14:31:30 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v2 2/2] tests/intel/xe_exec_queue_property: Use single
 invalidate property
Date: Mon,  1 Dec 2025 14:31:26 -0800
Message-Id: <20251201223126.863042-2-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251201223126.863042-1-matthew.brost@intel.com>
References: <20251201223126.863042-1-matthew.brost@intel.com>
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

Rather than using a loop hardcoded with an invalid property range, use a
single high value invalidate property. This will avoid this test
continually breaking as we add more properties in the KMD.

v2:
 - Use single invalidate property (Matt Roper)

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4dfcf09e26..1b7ed5abb2 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -172,6 +172,7 @@ static void basic_get_property(int xe)
 static void invalid_property(int xe)
 {
 	uint32_t valid_property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY;
+	uint32_t invalid_property = 32;	/* Picking some high value */
 	struct drm_xe_engine_class_instance instance = {
 			.engine_class = DRM_XE_ENGINE_CLASS_VM_BIND,
 	};
@@ -187,13 +188,10 @@ static void invalid_property(int xe)
 	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 					     to_user_pointer(&ext), &exec_queue_id), 0);
 
-	/* This will fail as soon as a new property is introduced. It is
-	 * expected and the test will have to be updated. */
-	for (int i = 3; i < 16; i++ ) {
-		ext.property = i;
-		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
-						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
-	}
+	/* Invalid property should fail */
+	ext.property = invalid_property;
+	igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
+					     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
 
 	/* Correct value should still pass */
 	ext.property = valid_property;
-- 
2.34.1

