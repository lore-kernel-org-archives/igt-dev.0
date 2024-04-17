Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BABCC001CC
	for <igt-dev@archiver.kernel.org>; Wed, 17 Apr 2024 14:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C601135CA;
	Wed, 17 Apr 2024 14:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PoJlpYoT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0541135C0
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2024 14:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713364787; x=1744900787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jM2Zz3UBUId6kqG6Wm2UKipkQpUSebNdNFZ6UgBXJ9M=;
 b=PoJlpYoTNTgDurpbxvtkcWqmLZeZBaT4UCYf7nyWfNv/MWyzPajxu9gC
 NbHCZJRuLP5jqLW4P14LyeXlZpX08YJD9/Si2E9hrFl+/wSHskazDc1KL
 p6OHSEMipG52y6BdBVF0nSEKdNkkiKgBPS1jhD97IivTHYgmNxizsGI7b
 8q1/rzLvU8nhtQB1p1hjTuspmXbFIsQ3juNJ/fjlgXoVjgw479d6fSgs5
 H4vViMIpN1NPRHP+6uDxrpTyN4sQHdqE1PjzuETieQIKcX7GWc9vF8YNY
 Yi0eVcm0xP9zJBGBV7KOE7FfwNZMix0JU3J2qOX4sId5o5IsdK8MMIs/Y g==;
X-CSE-ConnectionGUID: Ke+3O1hjTtKlDMD6h98rpQ==
X-CSE-MsgGUID: WZuCC8RsTGWp0hupx0jPsg==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="9083671"
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; 
   d="scan'208";a="9083671"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:47 -0700
X-CSE-ConnectionGUID: pmzaAWI+QKaDloeEnXIx/A==
X-CSE-MsgGUID: UeX4AjLsRhCggYVpAeXuVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,209,1708416000"; d="scan'208";a="53859899"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 07:39:45 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 6/6] HAX: Test force joiner on BAT
Date: Wed, 17 Apr 2024 20:03:25 +0530
Message-ID: <20240417143325.720515-7-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
References: <20240417143325.720515-1-bhanuprakash.modem@intel.com>
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

Expectation: All pipe-D tests should skip.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_cursor_legacy.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index a430f735a..10dd481c9 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1838,6 +1838,7 @@ igt_main
 		"atomic-transitions",
 		"atomic-transitions-varying-size"
 	};
+	igt_output_t *o;
 
 	igt_fixture {
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -1850,6 +1851,10 @@ igt_main
 		 * fetch is enabled, so switching PSR1 for this whole test.
 		 */
 		intel_psr2_restore = i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
+
+		for_each_connected_output(&display, o)
+			igt_force_and_check_bigjoiner_status(display.drm_fd, o->name, true);
+
 	}
 
 	igt_describe("Test checks how many cursor updates we can fit between vblanks "
-- 
2.43.2

