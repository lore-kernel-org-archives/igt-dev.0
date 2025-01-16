Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F090C02188
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 00:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E35210E864;
	Thu, 16 Jan 2025 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c2mMcp9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 455ED10E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 00:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986812; x=1768522812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7SraApm4bNPdCBPyafgQPrc8LUcKhAAP7kBtjTavVw4=;
 b=c2mMcp9Baqsis7iwLLi0nLMxfmvRFtAbPDfiD4MbatvlGAGm6HRa8FVX
 w12CG8vzH87fBMNQdtKDO/gYRgNcOgLBxK7J4wp86HHLHUG/AQN0pBMdh
 v8eukVNn4X8rzJQPpG2/MuWEpT8kHNx2I85+aGJcIwogKyDjbx0PA6uw3
 Tg6AD7PCosECQ8m1asmQO4lP420nkdxIF6qCD3V1nzT9PNywGzau2PI62
 qlLXNFTigD2JR47brhSxaTT0jpapHWkq82JewyE9AtnkZ7esRP3+y7OhX
 7XVD2ZOB2kHw7hofjCxwLnpLkF6buVCZpd7anTIeMEXX6N/N+g0q1p5xx g==;
X-CSE-ConnectionGUID: WQSvg+zVTCunRp0mjuvrNQ==
X-CSE-MsgGUID: e7TIYIuaRlmMN4UjNds25Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37374274"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="37374274"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:12 -0800
X-CSE-ConnectionGUID: Q8y/qBkbS4SW1VbvDBEndg==
X-CSE-MsgGUID: kvgFEgCqTzGBy44NSg9h4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105146800"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:12 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t v2 5/9] tests/intel/xe_exec_queue_property: Update first
 invalid property value
Date: Wed, 15 Jan 2025 16:19:36 -0800
Message-ID: <20250116001951.4159243-6-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
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

A new property was added with ID 2, so the invalid property testing
should start from ID 3.

No new tests are added to test the new property as that will be
covered by the PXP tests.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 25a7e7abb..885d5bcc9 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -183,7 +183,7 @@ static void invalid_property(int xe)
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
-	for (int i = 2; i < 16; i++ ) {
+	for (int i = 3; i < 16; i++ ) {
 		ext.property = i;
 		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
-- 
2.43.0

