Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE19E77183
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:14:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C406B10EAC7;
	Wed, 18 Dec 2024 05:14:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TcKtyJNT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20C0210E17D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498839; x=1766034839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c76sxTrc9oCOBOD7w8UbjYKHFIFfxrdgveO23Or0amQ=;
 b=TcKtyJNTL3aeWNoDbAKMOq8KfUwYtBMaGdIXquCvPIXpQUXw7vOKK3NL
 1scjZLTD/mEXH2SLsjujInqa7hH03xxYExaCnplfDFnAf77lvzXB+8Fzd
 O2QMstJ0T1LyFEjdAe268NdgNKeRchwluJisWky4H/CqwpDBevBKa1sPP
 kNMxqjlCt8hq9EDMTQu8Ym45Z2FV+DDnHYq4C2a9Xj3tBq4R6t3Uyi2Sy
 u+hA5D+VYIkjvosDkVZFI9vPEIgcrlnXUh5wbXMMNEipTUp1XgMP0V3Tv
 pK06WCj+QQ3n90n/elqDhHhaaR8kdzq6kgn/ESNXMyvuTAE+3+gYyMTKk w==;
X-CSE-ConnectionGUID: X03jmNoxRyCcK1cpS1GvWQ==
X-CSE-MsgGUID: G6dbf7mWR7OPreiCIpQPZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45649500"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45649500"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
X-CSE-ConnectionGUID: AXpzQaJnRp+LoXGKi4ziJw==
X-CSE-MsgGUID: +QqQZkQsR+isvYwrxFlL6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102588180"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/4] lib/igt_sysfs: Fix close when rebinding
Date: Tue, 17 Dec 2024 21:13:22 -0800
Message-ID: <20241218051324.2696557-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218051324.2696557-1-lucas.demarchi@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
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

This function could be de-multiplexed and use single functions to each
action (e.g. igt_kmod_unbind already exists). However, with the aim of
simply fixing the bug, make sure the fd is closed with
__drm_close_driver(), otherwise the cached fd is not invalidated and
later drm_open_driver() fails because the driver is considered already
opened.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index eaf8fd882..9427767b0 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1530,7 +1530,7 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		 * We need to close the client for a proper release, before
 		 * binding back again.
 		 */
-		close(xe_device);
+		__drm_close_driver(xe_device);
 
 		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
 		close(sysfs);
-- 
2.47.0

