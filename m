Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20517CCD183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Oct 2025 16:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B308C10E0C7;
	Thu, 16 Oct 2025 16:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1kNXM6I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2375B10E0C7
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Oct 2025 16:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760630756; x=1792166756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jHc6lnzRYP0JcmJ3wzChiaKYlQ3JRXAG/e4ZacrR1a4=;
 b=R1kNXM6IcZJMSklj6aWc0XnS2Rl1jzTEibHMyeGK4uF/aOpfZw2HNVlN
 XNeJ8eD1VD0+7p7kcit+ukJkkrJuFoc2QxmDwtSX7kHbXZZGxd2rsKSc4
 XZhv43xffH+iNi56aCp1poB4tarsCsTdHI/jGMTZa7sWr/GAU/2X4ov1r
 CDXtaiXin5GqYv7S5AgM86+38bOVZgmIS92bM69rlMK8tqsTpcN1JcMmj
 R8OERE8xy8m9QtI8/fdDJF8ArpbEMsVjuJY29y/DhHg8Vz3L6I6sHWILn
 zjbZ052+VCwZSIXBuzqIaQ4mRbERrIq8Gc1iY4TIuAunPQJNLL48nG+O+ Q==;
X-CSE-ConnectionGUID: B7b1zlsZRueTmXg2BdsWbQ==
X-CSE-MsgGUID: ePCB63OiReaVaa2HH8KolA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="66663599"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="66663599"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:05:55 -0700
X-CSE-ConnectionGUID: Yj3PuKJIQ0ac9FJe4FUnTg==
X-CSE-MsgGUID: UJ6+E7wvS7OZSR2Pwn5TRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; d="scan'208";a="186761952"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.225])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2025 09:05:53 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t 1/1] lib/drmtest: Fix device opening with DRIVER_ANY
Date: Thu, 16 Oct 2025 18:05:43 +0200
Message-ID: <20251016160544.122657-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
References: <20251016160544.122657-1-kamil.konieczny@linux.intel.com>
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

When using IGT_FORCE_DRIVER with DRIVER_ANY, honor user choice
when forced driver is excluded in DRIVER_ANY or it is not
listed in known modules.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/drmtest.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index a1fb0b5ba..5d0b39471 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -341,19 +341,30 @@ int __drm_open_device(const char *name, unsigned int chipset)
 	if (__get_drm_device_name(fd, dev_name, sizeof(dev_name) - 1) == -1)
 		goto err;
 
+	/*
+	 * When using forced driver with DRIVER_ANY honor any driver name,
+	 * also those excluded from DRIVER_ANY or those that are not listed
+	 * in known modules.
+	 */
 	forced = forced_driver();
-	if (forced && chipset == DRIVER_ANY && strcmp(forced, dev_name)) {
-		igt_debug("Expected driver \"%s\" but got \"%s\"\n",
+	if (forced && chipset == DRIVER_ANY) {
+		if (strcmp(forced, dev_name)) {
+			igt_debug("Expected driver \"%s\" but got \"%s\"\n",
 				  forced, dev_name);
-		goto err;
+			goto err;
+		} else {
+			goto opened;
+		}
 	}
 
 	modulename_to_chipset(dev_name, &chip);
 
-	if ((chipset & chip) == chip) {
-		log_opened_device_path(name);
-		return fd;
-	}
+	if ((chipset & chip) != chip)
+		goto err;
+
+opened:
+	log_opened_device_path(name);
+	return fd;
 
 err:
 	close(fd);
-- 
2.51.0

