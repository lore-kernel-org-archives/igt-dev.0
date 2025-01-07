Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90815E77198
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 20:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A55810E7AE;
	Tue,  7 Jan 2025 20:56:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0fvSQnt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D6810E7AE
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 20:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736283378; x=1767819378;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SixmEnoMmUVqgOXisndNLB/1A3Peea5BwPh1p6cuvSc=;
 b=c0fvSQnttXJt1kc4jHeHDJyTZB+05rIdU1Xi+08GZ/WThPB/ZIhy+xqX
 ix7Z1edylbRvJsOUy98sLtL1bO+I7FzWncsIFIXV4MGTTNnYp5RKhVUoJ
 ZEq5f6CgVPPlIUuZRe4o9gHazIIuHcDOhwpiJzQb/tPQm5BMQnzoEL131
 cafUiSXSejpbGgnKw5nP+yKBjXp+2CxISMGQ0N2TbqLrSHIV/GHQYedM4
 ueFkY8ChHuLXf1gCbC9CPjtJRTfq5T9wxKgLn5GcEhmrB2pHb4mKCthe2
 WfyFtgd+4tq9ox++gqK7GnspwYr6HbvcD3kNgjYtJY9G2F0NlhhzfCsGi w==;
X-CSE-ConnectionGUID: E1BHS7FPTv6AQjwf1bphxQ==
X-CSE-MsgGUID: HK08St2lRgGIghOYQKpfaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36707012"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; d="scan'208";a="36707012"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 12:56:18 -0800
X-CSE-ConnectionGUID: pw+l1nJ+T0+y8zyYcRknXA==
X-CSE-MsgGUID: QQq8Rh/ETXWXsqDWYuHZ0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="103727736"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 12:56:16 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/chamelium/kms_chamelium_edid: Add
 connector check before plug
Date: Wed,  8 Jan 2025 02:24:33 +0530
Message-ID: <20250107205434.969797-3-ramanaidu.naladala@intel.com>
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

Add a check to reprobe the connector before plugging it back in.
This ensures the connector is in the disconnected state before
plugging it back in.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/chamelium/kms_chamelium_edid.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
index ff2a19e48..649b89678 100644
--- a/tests/chamelium/kms_chamelium_edid.c
+++ b/tests/chamelium/kms_chamelium_edid.c
@@ -423,6 +423,10 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
 
 	/* First plug in the port */
 	chamelium_set_edid(data, port, edid);
+
+	igt_assert(chamelium_reprobe_connector(&data->display, data->chamelium,
+		   port) == DRM_MODE_DISCONNECTED);
+
 	chamelium_plug(data->chamelium, port);
 	igt_assert(igt_hotplug_detected(mon, CHAMELIUM_HOTPLUG_TIMEOUT));
 
-- 
2.43.0

