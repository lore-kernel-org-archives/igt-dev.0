Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F140C47DD9
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 16:52:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBA910EA24;
	Fri, 19 Jan 2024 16:52:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F085710EA49
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 16:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705683177; x=1737219177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KRnNK43r60t/TcXpULGTldifDtwT+JSgo0WZpy4PHRQ=;
 b=BEHWIDRvNFHxNiJYATfTgvWikIvwStOZ46Ms+DwGogmrGxtdrz1+p9hf
 rdXsShVZ7yZkYYba5wCv4cmArV/Az2r49dlwh+GnRJSeOJyxxT0WiLmYs
 9s94/RSrv7tEMPjpCN/Lb3ux7U7Jfbbc+I7DDOYwEq9/Y1Kx6fEF9QPFK
 iS6WEpBi6j8YdurUruzXsFnn65JqTSDd433zWOfVKF+vALWCWWQaF5X9R
 F4ytsNgLTA7Ir0HqNXMyB4HoIvEf5tTO7mJqBP90MWXJd1LQDzrdgw5lS
 TtkAQ2aO5ZeJV954VXBqfuxpu9pjNvYID399kdiGDtjLRNa/oi40Yi+Jq A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="671963"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="671963"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="819113413"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="819113413"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.158])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 08:52:52 -0800
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/2] tests/intel/xe_gt_freq: Fix freq_low_max test
Date: Fri, 19 Jan 2024 22:34:47 +0530
Message-Id: <20240119170448.1889777-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119170448.1889777-1-badal.nilawar@intel.com>
References: <20240119170448.1889777-1-badal.nilawar@intel.com>
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
Cc: rodrigo.vivi@intel.com
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

