Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8749EE77199
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:56:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF2710E7A9;
	Tue,  7 Jan 2025 20:56:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HZiO5MET";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 347D110E79B
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736283376; x=1767819376;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HeUHHgE1Fz17+MeNJ/oT8vyI291PuPRrvovYKJH9GfQ=;
 b=HZiO5METLb71bDDe+C5Ugp0dsfoOPiGsrbMSuiE/mnsxjcY+1/QfytiZ
 IFWEePVQidNyKBj2/etLtwNTgXW3KBzn3Bvf4on6dYbtNnIJc0/qHx8FX
 xbleBc+bpv8irFDuHzfznelGs2rBNvXEfBneLG8ohTFH+k5REXkBLDYxu
 EC+AhhEq9LFSRF+7Rg2XLhFYmmRC7EpRPlg245uoSSTUiU/Yg9aSNRHSb
 /iCCA5GfBSU13eHKhMQJPCIEwjOsftqaZz/NrEKC5YQ1AQyuUmDU6vIaA
 sXeVARL+KH311JtopRc7n5Cntk/PsdbWJbsJ7zuyFxIg7mbJFkfM02u7s w==;
X-CSE-ConnectionGUID: 3jnzGvVXS4aqlfmCNaM8GQ==
X-CSE-MsgGUID: 1Ezf4Kq6SCqYAiIZ3IWzgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36707007"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36707007"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:56:16 -0800
X-CSE-ConnectionGUID: 5cyxOT3FRGmqWrXgAFGtng==
X-CSE-MsgGUID: ysuFUFg8QdK1qOBrF2vJAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103727725"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:56:14 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 1/3] tests/chamelium/kms_chamelium_edid: Remove
 unnecessary hotplug detection in EDID test
Date: Wed,  8 Jan 2025 02:24:32 +0530
Message-ID: <20250107205434.969797-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107205434.969797-1-ramanaidu.naladala@intel.com>
References: <20250107205434.969797-1-ramanaidu.naladala@intel.com>
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

Remove redundant hotplug detection assertion from
test_suspend_resume_edid_change. Hotplug detection is unnecessary
after modeset disable.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index e572a6468..ff2a19e48 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -419,8 +419,6 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
-	/* Catch the event and flush all remaining ones. */
-	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
 	igt_flush_uevents(mon);
 
 	/* First plug in the port */
-- 
2.43.0

