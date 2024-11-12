Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6E6D42BBF
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 19:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821510E625;
	Tue, 12 Nov 2024 19:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SgHOZ68t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E165F10E625
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 19:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731438451; x=1762974451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mFlrWtSU1rma7tBvXza7LYZcxmDmMkv44Yrwt8twmIw=;
 b=SgHOZ68t4SD9dIkIVrUQvLAcSPLnRmvuN35b0dHpUxztp9IeNLqlsR5C
 qqimVzYo30lQnElGVPpGVl/sWAyIOgby5XU3z8ZfrTZ67Ffmtzin02Jqc
 JCZCvCj8IKDlDmW0Z5SXfvW6rHI6FikGk0zwnYFSdudSdJS7LwzEFwj9m
 zUB3jMMVxmQ0HuyqEqN+MA/As2jIpS3QDO0Ou2+A5ac857DamyWV9dTgz
 VV73eUK723tuBzEl4R4DVqd5kX3ulGnOkkXUCvwBsVqbtmRd2iWirM5WY
 hyUX4f6CEjBfEGklv2s/Rd4AUdogVMg2Oozc+iHuQkzpx9+5tMRpAogsX w==;
X-CSE-ConnectionGUID: TW90qDBmT/Gh7MU/mhA0Aw==
X-CSE-MsgGUID: YKhCAAPpQUyCd/W5qPK9Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42685979"
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="42685979"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 11:07:30 -0800
X-CSE-ConnectionGUID: ZkRBRGJCSQOXmA7+NLwy8g==
X-CSE-MsgGUID: 8ouT84AcTBOllRRu1Twvng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,148,1728975600"; d="scan'208";a="88013198"
Received: from spottumu-desk.iind.intel.com ([10.145.152.200])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2024 11:07:28 -0800
From: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	sai.teja.pottumuttu@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_oa: Adapt tests for 128MB OA buffer size
Date: Wed, 13 Nov 2024 00:29:01 +0530
Message-Id: <20241112185901.2326879-1-sai.teja.pottumuttu@intel.com>
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

The support for larger OA buffer size of 128MB is being introduced
into xe. Thus make the changes required to adapt xe_oa tests for
the increased OA buffer size.

Note that buffer-fill and enable-disable tests had a hardcoded buf_size
assuming OA buffer size to be 16MB and report size to be 256B, the
patch corrects this by allocating a buffer of OA_BUFFER_SIZE itself.

Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
---
 tests/intel/xe_oa.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 33e978a48..9ea7e73d2 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -63,7 +63,7 @@
 #define PIPE_CONTROL_PPGTT_WRITE	(0 << 2)
 #define PIPE_CONTROL_GLOBAL_GTT_WRITE   (1 << 2)
 
-#define MAX_OA_BUF_SIZE (16 * 1024 * 1024)
+#define MAX_OA_BUF_SIZE (128 * 1024 * 1024)
 #define OA_BUFFER_SIZE MAX_OA_BUF_SIZE
 
 #define RING_FORCE_TO_NONPRIV_ADDRESS_MASK 0x03fffffc
@@ -2364,7 +2364,7 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
+	int buf_size = OA_BUFFER_SIZE;
 	uint8_t *buf = malloc(buf_size);
 	int len;
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
@@ -2590,7 +2590,7 @@ test_enable_disable(const struct drm_xe_engine_class_instance *hwe)
 		.properties_ptr = to_user_pointer(properties),
 	};
 	size_t report_size = get_oa_format(fmt).size;
-	int buf_size = 65536 * report_size;
+	int buf_size = OA_BUFFER_SIZE;
 	uint8_t *buf = malloc(buf_size);
 	size_t oa_buf_size = MAX_OA_BUF_SIZE;
 	int n_full_oa_reports = oa_buf_size / report_size;
-- 
2.34.1

