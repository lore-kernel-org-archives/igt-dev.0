Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2416C3DA7F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jul 2024 10:03:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EE4710E95B;
	Fri, 26 Jul 2024 10:03:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lxAAeZrt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59DA10E95B
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jul 2024 10:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721988235; x=1753524235;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GJbh7lpLZdvdIX9pkgTsG8aszNyGBq7VFQJBlAAgQrI=;
 b=lxAAeZrt8Y49rYEUY3bY2OT+aMXB4pMNFPxESM8YZ+6wiNRCDLyA3cAP
 BS8D8dAqkgcqs+WOW3EPIdZNBbU/vcJnxpI5ZTYC7B6sLU9jpD8poouHt
 KM6VkJq0Fae8+i+CX5t15HhaunToiYxNrYNPJB6UGCt/VmHje57EfKmMG
 CHgvg5V7MSHwb6MB3dlAUQtpzLrUDA4iWF6sMC6Yxc/gBpa/La/uLPapb
 5PON6wrMVy2pBmsoNBb+TlR2NwgQ12mR62GxkfiaThy757b6eG2DE/NU2
 0ZNY223bm7kD9YM6TlRFM/IVXdGlgGnEEgzKtJVmYxBgFrfUXsdItQNKP w==;
X-CSE-ConnectionGUID: ptRDQohaReG4L8e10rj3PA==
X-CSE-MsgGUID: vLt8V+cKQi+cSzQS5qWwXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11144"; a="22689730"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="22689730"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 03:03:55 -0700
X-CSE-ConnectionGUID: qVuGP6KFRjOEPhvT8/di0w==
X-CSE-MsgGUID: 7uPLFgP1T6+NqmRTIoU7JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="58008672"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2024 03:03:53 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, suraj.kandpal@intel.com, kamil.konieczny@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 2/4] tests/intel/kms_pm_dc: Update test duration to 4
 seconds
Date: Fri, 26 Jul 2024 15:37:49 +0530
Message-ID: <20240726100751.918038-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
References: <20240726100751.918038-1-ramanaidu.naladala@intel.com>
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

Certain features can prevent timely entry into the C10 state,
causing inconsistent results. So increase test time to get
accurate results.

v2: Split the patch into two. (Kamil)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel/kms_pm_dc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 3d37d4a25..09d362694 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,7 +592,7 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
+	time_t start = time(NULL), duration = 4, delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
-- 
2.43.0

