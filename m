Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14899CE837D
	for <igt-dev@archiver.kernel.org>; Mon, 30 Sep 2024 18:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AF410E24E;
	Mon, 30 Sep 2024 18:19:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lj8ZPODx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A8DE10E24E
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Sep 2024 18:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727720343; x=1759256343;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zqkm1HRiMl+3Wd0AxhWPTDVWlZ4r0wcxwSp9NDMa+IU=;
 b=Lj8ZPODxKoOY12bhCINroqd0DPUsn5BFSeOpEBxcP6VfJAHGiFKpQyhU
 lzfh+HRAkQlTI1LzPQQLDxYq0sdFciQMCvDyg2Z14HacnKUtR/7YMa4v3
 tojH9UgYVE5NV9RMUqHhW8YGG8Q0N73GArwfEtnpeg2Y3oDHbcmPoyAx5
 u3mCjqmnG9LmR44DjDib5UvpUTa4gaaA3uLOI/zEeLjHBSoYugXwgKSzR
 iKoYqj6wPuvLbtgw/VzReJgtQCWFT8pIa6eM53VTbKv/HFv6RtzBJ+KPs
 OQyG2Xt3qi8VBGw8k6YutYJQV3u5VZs1KVgrSMwsnV4IXQqcvRsBtRopb Q==;
X-CSE-ConnectionGUID: WicKlIW0TzuojqMasHARkA==
X-CSE-MsgGUID: 0/d70y9WSn26gID7I997dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="27004300"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="27004300"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 11:19:02 -0700
X-CSE-ConnectionGUID: A5qyn25TTemPOEZ3W0cBng==
X-CSE-MsgGUID: pI3M2zZzRKmTR8mDTDCMlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; d="scan'208";a="73702698"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa010.fm.intel.com with ESMTP; 30 Sep 2024 11:19:02 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_pm_lpsp: Add display version check on
 external panel
Date: Mon, 30 Sep 2024 23:48:39 +0530
Message-Id: <20240930181839.49977-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

LPSP for external panel support from Gen13+ onwards.
Skip the test if only external panel connected on less
then gen13 platforms.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_pm_lpsp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
index f9ac508fb..889da42de 100644
--- a/tests/intel/kms_pm_lpsp.c
+++ b/tests/intel/kms_pm_lpsp.c
@@ -227,6 +227,8 @@ igt_main
 		enum pipe pipe;
 
 		for_each_connected_output(display, output) {
+			drmModeConnectorPtr connector = output->config.connector;
+
 			if (!i915_output_is_lpsp_capable(data.drm_fd, output))
 				continue;
 
@@ -238,6 +240,10 @@ igt_main
 				if (pipe != PIPE_A)
 					continue;
 
+				if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+					igt_require_f(intel_display_ver(data.devid) >= 13,
+						     "LPSP support on external panel from Gen13+ platform\n");
+
 				data.output = output;
 				data.pipe = pipe;
 
-- 
2.25.1

