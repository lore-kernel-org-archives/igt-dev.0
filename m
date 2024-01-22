Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2ECC47DD9
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 15:43:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79B10F43A;
	Mon, 22 Jan 2024 15:43:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A11210F432
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 15:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705938208; x=1737474208;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PEajsBF56Lid4+LmBz39xaMfMUylZ8BnwiQaHUZWYcU=;
 b=b1iVD0ZG1OjbbQXAeWDVN/EIfDSGM7XyieB3pLwb1FSzdL/+DwIP3rYQ
 4CqIG3fAwgIds+bwsJZvd16/mHX2tRU1Xjtx1k3R3UdI3njRGa1+EjU59
 unvEQUzclAqBhkrIVI0vJK+UVqzVZ1kphH+I+s+Y8wvknf2tK1sDKYhQC
 DevB6ZL/Tsl+BkzCvJvtIpkOsBDjzpUs7Cdq+6odeD1S3EpGMFo49lSMo
 tY2/VvM411SAobHaRVQP5WZyFPJqaKDlycNeOvmyVDtbaqUMTnMN4iCRj
 oP4ID5OP8cdIU9QAirPvlZ401VPJNULXtubt/CadqXzefKDCp7l1f/jJQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="1099441"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1099441"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="929022797"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="929022797"
Received: from boherlih-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.18.185])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:43:25 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/xe: Boost prefetch size to 4KB
Date: Mon, 22 Jan 2024 15:43:02 +0000
Message-ID: <20240122154302.54660-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Lucas De Marchi <lucas.demarchi@intel.com>

For Xe2, the prefetch for RCS is 4KB, so boost it.

BSpec: 60223
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/xe/xe_ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
index 39605a019..0979eec6d 100644
--- a/lib/xe/xe_ioctl.c
+++ b/lib/xe/xe_ioctl.c
@@ -48,7 +48,7 @@
 
 uint32_t xe_cs_prefetch_size(int fd)
 {
-	return 2048;
+	return 4096;
 }
 
 uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
-- 
2.43.0

