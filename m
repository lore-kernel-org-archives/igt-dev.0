Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7898AF5581D
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D86510E50E;
	Mon, 20 Apr 2026 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJ+0jQWZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0BE10E50E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776685027; x=1808221027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oEgGW+YqX8Sxy9WxFEBLkErw7VDFbvj5q2+fZV7VygI=;
 b=HJ+0jQWZ222r3uCDhtXKenneTgr7iNKtg9UWj9tgeT/c89KuLK5ApIQ8
 8fiB2w6vzDU/8zDs97m6HWhVnfXW6tePBotnLAnP+xX54jeSnb/RQI1ZA
 SGhBEcV80tvuAsnZFW29cTG7cJFHG9q3m0J+LhqutbtJugf95ngN9VunK
 VaDW9wMSb/OKE4inFSXGupphuthR6nVyE6O8FPv8HJYn9CzSTjmYUhd2M
 Sl84KTv9S/MC13t/Nks4MYUe9zm5SodCJg8iCHYoNwn2H/mTV8dUfnRFQ
 5oNbJmVIiTS0LKMHefftB4xDIAZd8fZAbfFnitbHdJNUtXcfPAjcs6gzH g==;
X-CSE-ConnectionGUID: 1ocOKPJGSlm6MVMQOMV7kw==
X-CSE-MsgGUID: 7hrjz7jxR5uHspxKgFxVzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89064535"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="89064535"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 04:37:06 -0700
X-CSE-ConnectionGUID: HdzSU+ZjQP6UFZRkTFrtsQ==
X-CSE-MsgGUID: +soyOfCeRfCF/4Ys4BSr0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="228550998"
Received: from linux-meteor-lake-client-platform.iind.intel.com
 ([10.223.55.75])
 by fmviesa007.fm.intel.com with ESMTP; 20 Apr 2026 04:37:04 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, jani.nikula@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 3/6] Revert "tests/intel/kms_pm_dc: Update test duration to
 4 seconds"
Date: Mon, 20 Apr 2026 16:58:23 +0530
Message-ID: <20260420112826.35220-4-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420112826.35220-1-mohammed.thasleem@intel.com>
References: <20260420112826.35220-1-mohammed.thasleem@intel.com>
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

This reverts commit 4eba89501947cf67d34475b4493489334a292f23.

v3: Fix compilation issues. (Jani)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_dc.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 1eade8f1f..a9f00f21c 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -538,12 +538,10 @@ static int has_panels_without_dc_support(igt_display_t *display)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL);
-	time_t duration = (4 * SEC);
-	time_t delay;
-	igt_crtc_t *crtc;
+	time_t start = time(NULL), duration = 2, delay;
 	bool pkgc_flag = false;
 	bool flip = true;
+	igt_crtc_t *crtc;
 
 	igt_display_t *display = &data->display;
 	igt_plane_t *primary;
-- 
2.43.0

