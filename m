Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EDBC0218A
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jan 2025 16:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC7610E57B;
	Mon, 27 Jan 2025 16:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IIBHWdoA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4202B10E57B
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2025 16:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737994325; x=1769530325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uEKX3xvI744WoNOPu6nn6QT59lM2J2BGAxJ58/++VgI=;
 b=IIBHWdoAyqqERzzmEBXkaHXuRaPtYuP0WmA0D9WIPBPcQAL140KsGMA0
 1WVGXwN80TmZHzmn77R12cX+vAOMu2RWF3qIzoPZ8/w6jBTU9qHw1HMsF
 shbALp4ze7NC2KiItB2DZW4mksBmNRXCZ7iM8Ry4pL9ksT8M5xdC2oSva
 HlEE44oxABLY8DKohLbq+S/qZztq4SHq8k74VDOwxnz7FMj6TBBb88on9
 306F6P8LuxESDK4zbQ8CVp7GWH/B3WfYCt44CjmtG1XY2Ypm7OI1fOC/3
 edaDsnQEcV2FykFDFgruvwnXZclbG9bba5aZbXyzoZzwzkxR9i+8PMWgo A==;
X-CSE-ConnectionGUID: KvjseYCdREeOnd+aqkqj+g==
X-CSE-MsgGUID: 3WSKqGKzSnmpCQR/xk5lyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="41298854"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="41298854"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 08:12:05 -0800
X-CSE-ConnectionGUID: 5iJS8+sJTWmXQ6Rcrrn9Vw==
X-CSE-MsgGUID: 8GPhxZj8Rw6UAe7DDapAGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108925837"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 08:12:04 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, karthik.b.s@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_pm_rpm: Restrict cursor tests to
 I915 driver
Date: Mon, 27 Jan 2025 21:57:35 +0530
Message-Id: <20250127162736.3451740-2-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250127162736.3451740-1-jeevan.b@intel.com>
References: <20250127162736.3451740-1-jeevan.b@intel.com>
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

change accounts for the limitations of gem_set_tiling, which
no longer works on recent platforms and will not be supported
on Xe drivers, so updated the tests to run only for i915 driver.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_pm_rpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
index 990c50915..24f527c2a 100644
--- a/tests/intel/kms_pm_rpm.c
+++ b/tests/intel/kms_pm_rpm.c
@@ -1189,6 +1189,8 @@ static void cursor_subtest(bool dpms)
 	struct igt_fb cursor_fb1, cursor_fb2, cursor_fb3;
 	uint32_t crtc_id;
 
+	igt_require_i915(drm_fd);
+	gem_require_mappable_ggtt(drm_fd);
 	disable_all_screens_and_wait(&ms_data);
 
 	igt_require(default_mode_params);
-- 
2.25.1

