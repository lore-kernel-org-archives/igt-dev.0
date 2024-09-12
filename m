Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1270FEED608
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 13:36:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C0310EB86;
	Thu, 12 Sep 2024 13:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SiPXZiGn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E93310EB86
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 13:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726148215; x=1757684215;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4agulZ7Skje7opEaQr4h9jL4SkueUGV+eid4YSdb7P0=;
 b=SiPXZiGni7VezxzQ0a0vS4MFg8sppNlBuALUaJWwdUO7MUYaomliF3d2
 l5Qd22hnsLSOrOmgtk/dTKh12RW7/zII+6Z4I5jqlUD/XeXgB4/uz47+S
 c3HZ6FhsgnFGQgu5uOVZccTuY77A97IjJS4L692xfpE0xsV0OMMX8UUs6
 swwiBW+5/wEkK8h4lFfKD9C+lh3SZk73tQ9FHtxiD4PJRmo+trUmaj1ia
 e1Tm53gJdTbTwalxzbIx+7PomBtvovBHc/AUgIxiEosYp2PdWoY25fFqq
 qBYQ/36rCzU9lJj3gxR/Fw7sCU99OA0TwBLrxldjVU6fx5ZClfOlbeBj7 g==;
X-CSE-ConnectionGUID: MNfNQvn/Sb2TOjX4FaaGMA==
X-CSE-MsgGUID: DE3EwE50T8GpfdmXa6pyPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24484261"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24484261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:36:55 -0700
X-CSE-ConnectionGUID: /9iDnsMTRlqYmt4b4GtbCA==
X-CSE-MsgGUID: 5yAbMDmgS1iNf4c1wPLmpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="68221040"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.32])
 by orviesa007.jf.intel.com with ESMTP; 12 Sep 2024 06:36:54 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, karthik.b.s@intel.com, jeevan.b@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH i-g-t 4/4] tests/kms_content_protection: Make
 mst_cp_enable_with_retry() void
Date: Thu, 12 Sep 2024 19:04:21 +0530
Message-ID: <20240912133421.718496-5-suraj.kandpal@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240912133421.718496-1-suraj.kandpal@intel.com>
References: <20240912133421.718496-1-suraj.kandpal@intel.com>
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

Change the return type for test_mst_cp_enable_with_retry to void
since it really does not need to return anything back now that
the color change and enablement verification happen inside the
function itself.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/kms_content_protection.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index f17d9f2e8..59dca54df 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -662,7 +662,7 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, i
 	}
 }
 
-static bool
+static void
 test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs,
 			      int retries, int content_type)
 {
@@ -704,8 +704,6 @@ test_mst_cp_enable_with_retry(igt_output_t *hdcp_mst_output[], int valid_outputs
 	} while (retries && !ret);
 
 	igt_assert_f(ret, "Content Protection not enabled on MST outputs\n");
-
-	return ret;
 }
 
 static void
@@ -764,7 +762,7 @@ test_content_protection_mst(int content_type)
 
 	igt_display_commit2(display, COMMIT_ATOMIC);
 
-	ret = test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
+	test_mst_cp_enable_with_retry(hdcp_mst_output, valid_outputs, 2, content_type);
 
 	if (data.cp_tests & CP_LIC)
 		test_cp_lic_on_mst(hdcp_mst_output, valid_outputs, 0);
-- 
2.43.2

