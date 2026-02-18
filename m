Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0E3E9A04A
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 08:09:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 614EF10E583;
	Wed, 18 Feb 2026 08:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIX4TPg6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD3610E585
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 08:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771402186; x=1802938186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QItW09etgIdjzI5eAvNg+flHbFJ/OKnEMt1/9r9o6Bw=;
 b=JIX4TPg6VGcDLECzOlkpmmzmuiUGwwL0UDydniJ5OVjgVFfjhmsWi+qD
 0sNSLCROu/Te2X06qj3oJgQzJEIKTdHSdhluhzwFSUlx3LGibQAscZfIn
 TWQLnmrvR93vLZ0Y22kak3Qq4g7fOrKC96iDo5PEtarr5XMkPjCNSPTTT
 20LPbIvv/YXdOFKiXspxcZL8lG/+/PSjRPpuM0MicG7aiSl0Xkl2RsBJu
 k7dLlK/62nm5Ja6Pds0x5G4U6BeF8K+ax1O34D7u4ZpHCO3I8wP33A4Vs
 J5Qw3kZl47ZCBaT+P3Y8uy2JALPm+llJeuUO/1Q5TWk9RYVgBC8PAGtnK Q==;
X-CSE-ConnectionGUID: 6MhkKXnsTMiMZbeKbP5oFg==
X-CSE-MsgGUID: Vxmw+zKISMuQsu3KdRBR3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72385304"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72385304"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:46 -0800
X-CSE-ConnectionGUID: zz2TUO0TSr2zZx71H7OqNg==
X-CSE-MsgGUID: KXs5PR8/SdeoUWEs1MEc4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="237129386"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 00:09:44 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 sebastian.brzezinka@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v1 2/2] tests/kms_vrr: Add connector type filtering for LOBF
Date: Wed, 18 Feb 2026 13:34:35 +0530
Message-ID: <20260218080511.2534901-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260218080511.2534901-1-mohammed.bilal@intel.com>
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
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

LOBF is supported only on eDP connectors for display ver < 35.
From display ver >= 35 onwards, both eDP and DP connectors are
supported. Add connector type checks in output_constraint() to
skip unsupported connector types based on the display version.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/kms_vrr.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index e46e98727..cc43ce587 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -1007,6 +1007,30 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	}
 
 	if (flags & TEST_LINK_OFF) {
+		unsigned int display_ver =
+			intel_display_ver(intel_get_drm_devid(data->drm_fd));
+		uint32_t connector_type =
+			output->config.connector->connector_type;
+
+		/*
+		 * LOBF is supported only on eDP for display ver < 35.
+		 * From display ver >= 35 onwards, both eDP and DP are supported.
+		 */
+		if (display_ver < 35 &&
+		    connector_type != DRM_MODE_CONNECTOR_eDP) {
+			igt_info("%s: LOBF requires eDP on display ver %u.\n",
+				 igt_output_name(output), display_ver);
+			return false;
+		}
+
+		if (display_ver >= 35 &&
+		    connector_type != DRM_MODE_CONNECTOR_eDP &&
+		    connector_type != DRM_MODE_CONNECTOR_DisplayPort) {
+			igt_info("%s: LOBF requires eDP or DP connector.\n",
+				 igt_output_name(output));
+			return false;
+		}
+
 		if (!igt_has_lobf_debugfs(data->drm_fd, output)) {
 			igt_info("i915_edp_lobf_status not present for %s\n",
 				 igt_output_name(output));
-- 
2.48.1

