Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D08CE77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 20:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B0710E0A1;
	Thu,  9 Jan 2025 20:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRgWi4Y8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E65410E0A1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 20:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736453458; x=1767989458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BIQCH0au6MahHU9RJEh5mbekqgm64Kdw9m+4Qt6otY8=;
 b=kRgWi4Y8By8C5+z2h0wNxLRlB2OOOCA2Ja1CLwqOEkH3rrjRiEowjmFf
 S8nk7vSFYET2nvAM/juXp3ry5HnyoW8erx9Z6kT12bE18+6bVZPyRn727
 2sDYi+P+kBeN9mPvDdzpX6Kr1pbpv6vQ5+XkamOQXyIpNawfhVpIbOCzU
 x+JVM1SPi/bCVQq8pxoF6RxZzeBtJRvQnZCuCvwB11s3zQb3hzRata7Sj
 tlkUtoMc7/Xl44nAUGZntRryaD1TuLeF7N7IDsQEV+nBCKRusqbf71Oi2
 p8hr/DA7tvUwz6PXIWmwzkfD711MBUStaqdJDDsCVuVTM9VY341em5SSb A==;
X-CSE-ConnectionGUID: vE2F9UzdT6m6UdkTMG29sg==
X-CSE-MsgGUID: A9j2IBorRjioJMPJYIxwaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47312946"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47312946"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:10:58 -0800
X-CSE-ConnectionGUID: 14yuQTE7Qta/n9ZxV/ADCw==
X-CSE-MsgGUID: p2d6X/E/S2e+9WwbxcbysQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="108421188"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 12:10:57 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v3 1/2] tests/chamelium/kms_chamelium_edid: Fix hotplug
 detection with connector reprobe
Date: Fri, 10 Jan 2025 01:39:10 +0530
Message-ID: <20250109200911.1243517-2-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250109200911.1243517-1-ramanaidu.naladala@intel.com>
References: <20250109200911.1243517-1-ramanaidu.naladala@intel.com>
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

Ensure connector is reprobed and detected as disconnected before
plugging in the port.

v1: Merging two patches into a single patch. (Kunal)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index e572a6468..d2d85cad5 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -419,12 +419,12 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 	chamelium_reset_state(&data->display, data->chamelium, port,
 			      data->ports, data->port_count);
 
-	/* Catch the event and flush all remaining ones. */
-	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
 	igt_flush_uevents(mon);
 
 	/* First plug in the port */
 	chamelium_set_edid(data, port, edid);
+	igt_assert(chamelium_reprobe_connector(&data->display, data->chamelium,
+		   port) == DRM_MODE_DISCONNECTED);
 	chamelium_plug(data->chamelium, port);
 	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
 
-- 
2.43.0

