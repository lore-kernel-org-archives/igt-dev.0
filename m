Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E4EC47422
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 14:44:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFECB10E837;
	Thu, 18 Jan 2024 14:44:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B99310E837
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 14:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705589085; x=1737125085;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KRnNK43r60t/TcXpULGTldifDtwT+JSgo0WZpy4PHRQ=;
 b=GyQ78/5USasknocY4HkJU7V29h046WDyRoZ1XY3cfnOiIfvsh5dDXScy
 I/T2lXvf6zvV9XrLDu5I6MqnmMPd0UYAHI85c7jR3QfyjiPgAsBMtckbV
 UHWv6U73z9+e7LlIir5TDJQ87hCENTaz5bXeygNhRb1zUK6uxoN5RTgNZ
 M4txqflRfotDhV4Dn8/sw6M5LXAkLaSEs5MX/mHBpdKJCLHiqNaEGuu/j
 ZsbobK6aW4Lu0gtECF4YaMuHmoEyTqq4sRhTOSpXaWgqZfDu6MaDFY1o+
 AZBz8fw51CYz0HhbbwhS3UAx8yftaiMPT8DeEIz5Z9MexoO+WFKLcCFm8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="400129996"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="400129996"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="903844461"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="903844461"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 06:44:43 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] test/intel/xe_gt_freq: Fix freq_low_max test
Date: Thu, 18 Jan 2024 20:26:35 +0530
Message-Id: <20240118145636.1775115-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240118145636.1775115-1-badal.nilawar@intel.com>
References: <20240118145636.1775115-1-badal.nilawar@intel.com>
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

freq_low_max test is intended to validate GuC PC (SLPC) behaviour
when max freq set to less than min freq. As workloads are not being
run validating cur freq is enough.

v2: Validate act freq as well when gt is not in C6 (Vinay)

Fixes: acaaca0bf317 ("tests/xe: Add Xe IGT tests")
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 4334a8a41..bf63e4298 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -263,7 +263,9 @@ static void test_freq_low_max(int fd, int gt_id)
 	igt_assert(set_freq(fd, gt_id, "max", rpn) > 0);
 	usleep(ACT_FREQ_LATENCY_US);
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-	igt_assert(get_freq(fd, gt_id, "act") == rpe);
+
+	if (!xe_is_gt_in_c6(fd, gt_id))
+		igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
-- 
2.25.1

