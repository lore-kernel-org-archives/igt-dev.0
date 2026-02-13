Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37384EF48ED
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 08:50:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8F410E7BC;
	Fri, 13 Feb 2026 08:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WGUIL+/Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F28410E7B1
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 08:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770972626; x=1802508626;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UW1AfzWAtBdibzpyplbDCOrm2pUGJWuws23hcCm/iFw=;
 b=WGUIL+/Y62+7mzNnfNAF80QhvrUiP4/pF1Muk3hnv+BW66+V5E9Wfaxf
 puYTOwOFfH4gUbXn/tzLVr4PL0vGZtP0psbIs+LFetxAJsSi6UA2sKIaE
 XdMtVfkm/9yFZUMo3cafRm77F/m+dZYaKpqdCwgOw2FUhaMRDds4rLtwe
 Q6JArmwRxW2J3TEPfZxQa61cNFChbWTTWxy1yIy6k5S5OH9rM9l/OyX4q
 4b5WzQlmBG4G71f7rDlaSHaS0X835se9/98M8nGabjUbgOEJjWmyXKPyY
 WAvebs+BzRzQ6nNOTp19W0pVmkOO+Y8zyJOqW/HFwCvrhrb5ggOqTkah4 Q==;
X-CSE-ConnectionGUID: 5yX4uZpWQTihOwq9Go9L+A==
X-CSE-MsgGUID: FGyNBBYGRgidzMJx3XuDzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71181720"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="71181720"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 00:50:26 -0800
X-CSE-ConnectionGUID: LtM8JWhUSYCEDX1cJ1ZlSg==
X-CSE-MsgGUID: HiU5aWiWSVatdOd4kYAd0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="211774836"
Received: from administrator-system-product-name.igk.intel.com (HELO
 dev-417.igk.intel.com) ([10.91.214.181])
 by fmviesa007.fm.intel.com with ESMTP; 13 Feb 2026 00:50:25 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, mohammed.thasleem@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 2/4] tests/kms_flip: run suspend tests on one pipe
 per output
Date: Fri, 13 Feb 2026 09:49:28 +0100
Message-ID: <20260213084930.252273-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260213084930.252273-1-michal.grzelak@intel.com>
References: <20260213084930.252273-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

It is not necessary to test suspend on same output but different pipe.
In case of suspend tests, limit number of dynamic subtests run per
output when any pipe has already been tested.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_flip.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8bda82627..d09813f02 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1844,6 +1844,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
@@ -1876,6 +1880,10 @@ static void run_test(int duration, int flags)
 			    n != 0 && n != (resources->count_crtcs - 1))
 				continue;
 
+			/* Limit the execution to 1 CRTC (first) for suspend tests */
+			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
+				continue;
+
 			memset(&o, 0, sizeof(o));
 			o.count = 1;
 			o._connector[0] = resources->connectors[i];
-- 
2.45.2

