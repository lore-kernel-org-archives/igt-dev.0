Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ED1D6ED19
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:33:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F17210E402;
	Thu, 21 Nov 2024 12:33:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMz/EJGb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C23D10E402
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192419; x=1763728419;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JQ7iZw7p7O3m+Sj8cs3ILztUTWkD0AD3ixbDrF7VAmA=;
 b=OMz/EJGbuNoWMBFOVTHphlGen7jVza9I+IUeufSOOqAybQXxi0kGGE8B
 mQEHXKF9s31vlVbId/vL15XNCcEqDcj7s4+vpcHfceV4jQiQwjXV2elmN
 aiu/m56/ieVGpjSwso+d3bjOqL2bfAe9J5LMuSa9rZCPq7JHHkfUQVSct
 TxQPkl5A0CO/tnOTY5DZv2smMmcF0w/WP703HCA707grE45UERQabDiZJ
 aNG9Rm1wqkJquRIPz/uAeyxgGZkISbME5rQ7HxAyGhB4ppyo2jbUFA+TH
 BDVB/AuLlwEnr+pAj4L+xGJxxm7/P1q7YHwgwqZYpfdJ7AZAAnGyLvvAV g==;
X-CSE-ConnectionGUID: zPZoGMlOSLKI1l+yj+f5mg==
X-CSE-MsgGUID: OZBvosw6RHCiMIKsd4Fumw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43697409"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43697409"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:39 -0800
X-CSE-ConnectionGUID: tmSA6XqrRpqjsa8CDDPODg==
X-CSE-MsgGUID: wA/KYkhzTU+mHbqLgNl+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95298387"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:38 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v4 6/6] tests/gem_gpgpu_fill: Add offset-16x16 subtest
Date: Thu, 21 Nov 2024 13:33:08 +0100
Message-Id: <20241121123308.98158-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add subtest which verifies rectangle filled by pattern starts at
offset <x,y> == <16,16>.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index ec34e95844..cfebc8f665 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -58,6 +58,10 @@
  * Feature: compute
  *
  * SUBTEST: basic
+ * Description: run gpgpu fill
+ *
+ * SUBTEST: offset-16x16
+ * Description: run gpgpu fill with <x,y> start position == <16,16>
  */
 
 #define WIDTH 64
@@ -239,9 +243,16 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 		}
 	}
 
+	igt_subtest("offset-16x16") {
+		gpgpu_fill(&data, fill_fn, 0,
+			   surfwidth, surfheight,
+			   16, 16,
+			   surfwidth / 2,
+			   surfheight / 2);
+	}
+
 	igt_fixture {
-		igt_collection_destroy(region_set);
-		free(region_info);
 		buf_ops_destroy(data.bops);
+		drm_close_driver(data.drm_fd);
 	}
 }
-- 
2.34.1

