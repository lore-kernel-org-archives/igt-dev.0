Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C04AEE01F3
	for <igt-dev@archiver.kernel.org>; Wed, 11 Sep 2024 05:50:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2133410E96A;
	Wed, 11 Sep 2024 05:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JLiZ40K+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968A510E96A
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Sep 2024 05:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726033845; x=1757569845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mKnUz6R1eIJRjeYawg7QeDT7Be1Qv793h6XC9HT33E4=;
 b=JLiZ40K+8P2+PGrXasxk/EM5Cej05zxF22EZxmczdcEz7w4mYJ0357xN
 64i19EQn7DmZABXtGiRK9mjyHdOXcpb8V+XZBXg5JOfjFX7LZDY/mlWku
 qkpVPc70N4JCvW9LrTyUrnGzucPzx5jN9u9GQ01nMsN+SAcmatbZDyV+0
 XUA4cUIGJqkmpA0J83UHQbw0QEGKbRDhxzLvaFYUbHYFbq5wcPTIqcOCK
 RHQ1tDdh3P8Lveknv4GM6w0iYf50Eaj2JV6yVwFNth42uGxMjkUzO1Swf
 /DbqTcsHxJ29FL+Puf7frSK2pPbknmQ0OPOvf8i2Y4XUdGcskZbxXa7X5 A==;
X-CSE-ConnectionGUID: 8/Y63eIiRJS1I4GEx7DYkw==
X-CSE-MsgGUID: +bdOITLxTreDC0zNZ7ptiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="25009414"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="25009414"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:45 -0700
X-CSE-ConnectionGUID: 1L6XBk7WTlu54UpvrFuWQQ==
X-CSE-MsgGUID: 1WHUOfy8SeOg8wDVjfrFMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="67540738"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 jhogande-mobl1..) ([10.245.244.65])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 22:50:44 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 4/5] test/intel/kms_pm_dc: Add psr_sink_error_check
 to PSR tests
Date: Wed, 11 Sep 2024 08:49:57 +0300
Message-Id: <20240911054958.1023925-5-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240911054958.1023925-1-jouni.hogander@intel.com>
References: <20240911054958.1023925-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Currently we are ignoring possible errors detected by the sink in our
testcases using PSR. Fix this by add psr_sink_error_check to each of them.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 tests/intel/kms_pm_dc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 07b140ce5..c87e1d408 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -407,6 +407,7 @@ static void test_dc_state_psr(data_t *data, int dc_flag)
 	igt_require(!psr_disabled_check(data->debugfs_fd));
 	igt_assert(psr_wait_entry(data->debugfs_fd, data->op_psr_mode, NULL));
 	check_dc_counter(data, dc_flag, dc_counter_before_psr);
+	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	cleanup_dc_psr(data);
 }
 
@@ -693,6 +694,7 @@ static void test_pkgc_state_psr(data_t *data)
 	igt_wait((cur_value = read_pkgc_counter(data->debugfs_root_fd)) > prev_value,
 		  timeout_sec * 1000, 100);
 	igt_assert_f(cur_value > prev_value, "PKGC10 is not achieved.\n");
+	psr_sink_error_check(data->debugfs_fd, data->op_psr_mode, data->output);
 	psr_dpms(data, DRM_MODE_DPMS_ON);
 	cleanup_dc_psr(data);
 }
-- 
2.34.1

