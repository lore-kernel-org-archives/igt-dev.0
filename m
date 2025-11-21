Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663CCCFA477
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 03:57:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7A110E802;
	Fri, 21 Nov 2025 03:57:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H+mZknRD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD09D10E7F8
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763697448; x=1795233448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cz/t3rMUIuBUQHaempLQa5qYuty18UUjkJoXLl7Nqx0=;
 b=H+mZknRDnfNLFfaEIUH84wt+zTt1rRN/r7B3GJ+C5smFCEcOMCdsH6l/
 kA05rs9t48O53Agz+Zi8Xvq4yBC1uUtLi0W/0A9dXMS6/l2FfVkGEjifg
 U8EhZ7EBrBVyMtyKLSnR7cN+aZdh2eizrt9BaZZe7JrkY2mSC0hSpnghl
 mDyMCSyExnHp/OOhcedket7zvzei5hZSLkoih5rDt5d3pEuljA5DYMoE/
 cwcA1b9N+DUtpsIhM20YXZ+nQ4gRb+b7Q9bYyH7kkM7ED2kqaDzxkodrV
 2BYy5ghDsNUGbPGaVFE9gZEkOjsqLhwPr/LwgIz0N+3/c7rgnhc+GGGj5 A==;
X-CSE-ConnectionGUID: s9x7xskOR9aIQwVz5iENCg==
X-CSE-MsgGUID: Aueake3hSP2apqH3njpRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65484681"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="65484681"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:27 -0800
X-CSE-ConnectionGUID: X9/Ml8mCSj6N1iYq/s0YaA==
X-CSE-MsgGUID: X08G7N1cQ3+dYu8MsFjHkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; d="scan'208";a="191433518"
Received: from nvishwa1-desk.sc.intel.com ([172.25.29.139])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2025 19:57:25 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.gowtham.ch@intel.com, priyanka.dandamudi@intel.com,
 kamil.konieczny@linux.intel.com
Subject: [PATCH v2 19/19] tests/intel/xe_exec_queue_property: Update
 invalid-property test
Date: Thu, 20 Nov 2025 19:57:31 -0800
Message-ID: <20251121035715.767226-40-niranjana.vishwanathapura@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
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

Given we have new multi-queue exec_queue properties, update
the invalid-property test accordingly.

Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/intel/xe_exec_queue_property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_queue_property.c b/tests/intel/xe_exec_queue_property.c
index 4dfcf09e2..e1be1c9de 100644
--- a/tests/intel/xe_exec_queue_property.c
+++ b/tests/intel/xe_exec_queue_property.c
@@ -189,7 +189,7 @@ static void invalid_property(int xe)
 
 	/* This will fail as soon as a new property is introduced. It is
 	 * expected and the test will have to be updated. */
-	for (int i = 3; i < 16; i++ ) {
+	for (int i = 5; i < 16; i++ ) {
 		ext.property = i;
 		igt_assert_eq(__xe_exec_queue_create(xe, vm, 1, 1, &instance,
 						     to_user_pointer(&ext), &exec_queue_id), -EINVAL);
-- 
2.43.0

