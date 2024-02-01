Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF8D3C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 10:30:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8D310EB66;
	Thu,  1 Feb 2024 10:30:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C8710EB4E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 10:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706783434; x=1738319434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EqJ37XBJXV25oYgmOJIBukVxf3QAhh3AvreArfvBwW8=;
 b=lUcw880Ztgu7G2OBg3U9aTzFTbqnB2tYbhSXs8OabFDg9qvsZMwXvIgT
 3gK7QiZEmpHgaoSVz67ud5qvsvA4EdRmfbcLOArWygMnOOY4PIfouKgZo
 5+X0KCyqB2abUnSKDLAT04M7BYTe0hY4brn8n1cAYaqmtsIjRL39mqPIz
 +sf5fOJxFBwTw2m8b0JMZCDbejpQ9TZDQGgg7s0YbWmrv6nYxScbd0MQ2
 V1Ky7NR8jGkgLoKKjC13RglcnslrLalWJTDWuvdRMegHepvWBm11kRA/f
 pAfOiNx353SlYDLCPlRzmx6foy2Ns+8pPpulBMOkSjWCkt63tvIdIX4gb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="2798473"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; 
   d="scan'208";a="2798473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="30834680"
Received: from abojovix-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.0.176])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:30:33 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Date: Thu,  1 Feb 2024 10:30:16 +0000
Message-ID: <20240201103017.321466-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201103017.321466-1-matthew.auld@intel.com>
References: <20240201103017.321466-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Xe2 compression is handled via PAT indexes and flat CCS, even on
igpu. Ensure the device has flat CCS support on such hardware, to
determine if these tests are valid.

v2: (Zbigniew)
 - There is at least one uncompressed test also, which is valid
   regardless of CCS. Move the skip deeper.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_ccs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a..3430db2d2 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -532,6 +532,7 @@ static void block_copy_test(int xe,
 			    struct igt_collection *set,
 			    enum copy_func copy_function)
 {
+	uint16_t dev_id = intel_get_drm_devid(xe);
 	struct drm_xe_engine_class_instance inst = {
 		.engine_class = DRM_XE_ENGINE_CLASS_COPY,
 	};
@@ -540,6 +541,9 @@ static void block_copy_test(int xe,
 	uint32_t vm, exec_queue;
 	int tiling;
 
+	if (AT_LEAST_GEN(dev_id, 20) && config->compression)
+		igt_require(HAS_FLATCCS(xe));
+
 	if (config->compression && !blt_block_copy_supports_compression(xe))
 		return;
 
-- 
2.43.0

