Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8A1CCFA19
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 04:17:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 263DC10E308;
	Thu, 26 Sep 2024 04:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WEIwLXK3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F9E10E035
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 04:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727324222; x=1758860222;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=0x3gyEOop43UpKtZoaI3lQxnJ+zJVMhuU+YxTnPAmAU=;
 b=WEIwLXK3cOUp3yNVqxY1+qz2U5jB6D6Gr7adyyf/r3LEPzYXE+vbySnC
 1+B93WLpZeRl0Q8R/fL48IOsF0CIMTq5ZKGpNx3wDKuw8ei92saOJFiKG
 cj1f5XhKEVhG8q7x8VECuHWH9MYjHFC2elm0sZbdUajlA1+ZK8veYfvrc
 juAbe+yFB7D5XsMup2D4OohoXkjw/YY0YZA66nwXca2ezKOgB5GUrxtot
 dnk7tyjavZG1Pt2KhJaShUZpS0djMjLofCPwJk/CkHPNZURQODpEwcgN8
 Ka7haEuHrhHtKnmnQowBsuBMUgeAqYeipR2PcyRe9SsoiKfoyT1Ba412u w==;
X-CSE-ConnectionGUID: aCHxUSOmQJOHNePdCNS6aA==
X-CSE-MsgGUID: 4QkSSr1ETYKBsNwckJAFOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26554161"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26554161"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:02 -0700
X-CSE-ConnectionGUID: N5OP0hfHSLu0VJpcPmOyvw==
X-CSE-MsgGUID: SfGrQpSiRQ652YmTFioRjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76773023"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:02 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 5/5] lib/igt_gt: Stop passing fd == -1 in
 igt_open_forcewake_handle()
Date: Wed, 25 Sep 2024 23:16:51 -0500
Message-ID: <20240926041651.412396-5-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240926041651.412396-1-lucas.demarchi@intel.com>
References: <20240926041651.412396-1-lucas.demarchi@intel.com>
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

If something like -1 is needed, then
igt_open_forcewake_handle_for_pcidev() should be used.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 95df4acb9..9641a6610 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -493,6 +493,7 @@ void igt_stop_hang_helper(void)
 
 /**
  * igt_open_forcewake_handle:
+ * @fd: drm fd - i915 or xe
  *
  * This functions opens the debugfs forcewake file and so prevents the GT from
  * suspending. The reference is automatically dropped when the is closed.
@@ -509,8 +510,10 @@ int igt_open_forcewake_handle(int fd)
 
 	if (is_xe_device(fd))
 		fn = "forcewake_all";
-	else
+	else if (is_i915_device(fd))
 		fn = "i915_forcewake_user";
+	else
+		return -1;
 
 	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
-- 
2.46.1

