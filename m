Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA70CA1002
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 17:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3399910E1B4;
	Fri, 29 Aug 2025 17:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XMVl0TBM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE85410E168
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756487721; x=1788023721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V65+m/3A7r0X2c96BUN0SkEEtqBlVUOTM8j9MOI5zcA=;
 b=XMVl0TBMTMSACjGxadg+3jCx8shZYCcA0ldwU9uFI9hhdRe52xPkL8c2
 Zvwdt4Jve/x2Goh/VtmaaYrUFAC8RAbpVXXsmKg+OBkxg0zz0Rrh1HJmC
 NesnnZmbQDGWgPfRPADZuW20izoBbu46SzK7Ewgk2o42vXcM5csgMgm+I
 4T6wcqURT5ZOf7jdeuFLJzTDwdbSKAsHUVmVou3IAEeejqt6jfHbOs/BO
 jvfAaXvKebEu3HKfC7goNrbE0y9j+5kz9R/mFsuHqYX8RInKigKlSzUkm
 krpfhYF2DiLa5jfrOYZiYiZ4j1ZG46EvjKr0kfLnILgG5OuGsfXhAgkss A==;
X-CSE-ConnectionGUID: Faqne/5XSpuZ5WBi7rp3NQ==
X-CSE-MsgGUID: c8qpo2T8SRyXRqIV49OI8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70212406"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="70212406"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:21 -0700
X-CSE-ConnectionGUID: Y0jq3crhQoCP7fbFI8jDIQ==
X-CSE-MsgGUID: GlD7AN6QTu+Ag+ihmbtO7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170816743"
Received: from orsosgc001.jf.intel.com ([10.165.21.142])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 10:15:19 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 sushma.venkatesh.reddy@intel.com
Subject: [PATCH i-g-t 3/4] lib: Update BMG/PTL device info
Date: Fri, 29 Aug 2025 10:15:05 -0700
Message-ID: <20250829171506.3148434-4-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
References: <20250829171506.3148434-1-ashutosh.dixit@intel.com>
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

Toggle has_oam for BMG/PTL.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_device_info.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 349cf1b483..a853f9ab46 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -521,6 +521,7 @@ static const struct intel_device_info intel_battlemage_info = {
 	.display_ver = 14,
 	.has_4tile = true,
 	.has_flatccs = true,
+	.has_oam = true,
 	.is_battlemage = true,
 	.codename = "battlemage",
 	.cmds_info = &xe2_cmds_info,
@@ -532,6 +533,7 @@ static const struct intel_device_info intel_pantherlake_info = {
 	.display_ver = 30,
 	.has_4tile = true,
 	.has_flatccs = true,
+	.has_oam = true,
 	.is_pantherlake = true,
 	.codename = "pantherlake",
 	.cmds_info = &xe2_cmds_info,
-- 
2.48.1

