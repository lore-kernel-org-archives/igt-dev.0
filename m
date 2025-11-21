Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7197CFC26F
	for <igt-dev@archiver.kernel.org>; Fri, 21 Nov 2025 12:24:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E30310E0F6;
	Fri, 21 Nov 2025 12:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iRW8wTk/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D5710E030
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Nov 2025 12:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763727885; x=1795263885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/dEuRBXe8RKiJeLAFzBjIA6hU+XKm/zvdJA2bEu25jU=;
 b=iRW8wTk/tcD+s3LgjLXhzG3in+8pxyQfm51QvY2Z5blWxQ9X//Au8eZF
 I2bVzu03/4M3D9FfM3LlIiL4t9ecB2TR9ZT3smqyie04FZVfzWgXuGDm5
 bQNooDT0GSS41V8VXn/b5XRjlFjJo+JJTlUW4q5z5amrS8gUcqosC3VYE
 5aSmkvO6TaBVQ6fGzGn8WI/TfGwmjSTVhZwOy7qI6HBQpoZyCvzUYH5I2
 iLPWZiXbmm6YjIFvmKCXk4BDcT1JPTXudTxXJtfwgjgRPiRM98wH6B2Bj
 PVYEJKsrULVuGFn+wD/MNGkr28L/A1hUxmZGPsGVCzDV+l0oiAXYwJPZO w==;
X-CSE-ConnectionGUID: buPCUyNQTUaoeIUapNmtxQ==
X-CSE-MsgGUID: Dg1luO7sTNC+GcfDgDmB9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77289567"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="77289567"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 04:24:44 -0800
X-CSE-ConnectionGUID: cLjDvcP5QQaRKdG/GUzzVw==
X-CSE-MsgGUID: zMNfZgXhQUmCUtjlJNa65A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; d="scan'208";a="215047347"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 04:24:43 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com,
	Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 2/6] intel-ci: Add sharpness filter tests to i915
 blocklist
Date: Fri, 21 Nov 2025 18:01:30 +0530
Message-Id: <20251121123134.1099006-3-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251121123134.1099006-1-swati2.sharma@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
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

Blocklist the new sharpness filter tests for i915:
 - kms_sharpness_filter
 - kms_chamelium_sharpness_filter

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/i915.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/i915.blocklist.txt b/tests/intel-ci/i915.blocklist.txt
index 083b660c7..96d69ca79 100644
--- a/tests/intel-ci/i915.blocklist.txt
+++ b/tests/intel-ci/i915.blocklist.txt
@@ -172,6 +172,8 @@ igt@kms_frontbuffer_tracking@plane-fbc-rte
 igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
 igt@kms_fbc_dirty_rect.*
+igt@kms_sharpness_filter@.*
+igt@kms_chamelium_sharpness_filter@.*
 
 ###############################################
 # Test was written with the idea that edid read shouldn't take an
-- 
2.25.1

