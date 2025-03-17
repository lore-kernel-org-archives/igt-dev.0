Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F524C282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 17:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A6110E27B;
	Mon, 17 Mar 2025 17:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlDECXAj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3970710E27B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 17:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742233014; x=1773769014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HswIxdYxL6UXEKUn0jNzYDnKAEnnE4v265fd6pwHpok=;
 b=nlDECXAjAVV8a0bZ5cWtYje90KhniZvOwHcxC6oT1QUwdL7Aw92GOFqW
 3gFjn2s6C9maqBnXDphehro6DSJyWN4zNF23C5EBGdQNyXgmlU8pp6/4T
 m91a0gmLsREP/d+2/aHHwZn/qb2w+bRy171IavIEtgdwhKYl+upnzc3Ce
 Fzv4GUFDFjVxlIEE61uIBXijE2UYhzvM4Sm7pTJW0W/6gWOA5JAZHCI/q
 zJBcy/pfJUxJNS33ucbinJKK5Bc0s96DBxP0FjPNj6RjOuHOMg1Hs2/7n
 i8ufCKECq2426V3Qi4RG1pgT9qxFX0Q6GEwJS3V0mE9lVAEU6I56Qyq0T w==;
X-CSE-ConnectionGUID: 6vuzMmGoQLOnTuLhiWF5Ig==
X-CSE-MsgGUID: /lSS3/ryQZSLW9IVYtKXAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="47116537"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="47116537"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:36:54 -0700
X-CSE-ConnectionGUID: R4BX+1niR+OS7ux5n11rVA==
X-CSE-MsgGUID: 6V1FWFKISguHytyUNxmp4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121738283"
Received: from ba_tws-123.gar.corp.intel.com (HELO
 spottumu-desk.iind.intel.com) ([10.190.216.156])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:36:52 -0700
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sai.teja.pottumuttu@intel.com, ashutosh.dixit@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_oa: Keep OA user buffer size dynamic
Date: Mon, 17 Mar 2025 23:00:28 +0530
Message-Id: <20250317173028.3186378-1-sai.teja.pottumuttu@intel.com>
X-Mailer: git-send-email 2.34.1
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

non-zero-reason OA test has a hardcoded user buffer size for
any kernel OA buffer. This makes the test act differently for
different sizes. Thus make the user buffer size to be in line
with the kernel OA buffer being allocated.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 9bc62c5b9..fbf4034aa 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -2480,7 +2480,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
 		.num_properties = ARRAY_SIZE(properties) / 2,
 		.properties_ptr = to_user_pointer(properties),
 	};
-	uint32_t buf_size = 3 * 65536 * report_size;
+	uint32_t buf_size = 3 * oa_buffer_size ?: buffer_fill_size;
 	uint8_t *buf = malloc(buf_size);
 	uint32_t total_len = 0;
 	const uint32_t *last_report;
-- 
2.34.1

