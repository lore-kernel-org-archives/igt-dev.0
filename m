Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D88C43458
	for <igt-dev@archiver.kernel.org>; Sat,  4 Jul 2026 05:19:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F5510E011;
	Sat,  4 Jul 2026 05:19:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgS+vR0u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76DF410E011
 for <igt-dev@lists.freedesktop.org>; Sat,  4 Jul 2026 05:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783142342; x=1814678342;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IqbBYdoLmCXDtiCgryX8838Cuv5AizDWg/io84yDHt0=;
 b=BgS+vR0uP7l6J4To2GCs1llM64q8RdFoaNLbSwVkGtle3o/UL1LGr5k8
 +RDyLS6c1kg9DHpXqGeZ9MqU/srVnokJLToWTar+aVrol+ZFq32bxCXjs
 B0rde6PMxbfuSW0vOTVYUg8V5s1N+sVbv5GjkfZysN8C+XYF685Xsv/aI
 ZNW5qGgLIajVH1BXdnZ1s+5C6LTV5qHS/sPL2gI7PX7qmuOWUQB8jSCeC
 rHtskdsEBNQ1cGpk95sYoakel9pXNhN7KZzh7hz130UtSTA5+8ZMFhdAF
 GESuhBho5BIqxmIvUeiQiO3ezZNntrdO9xaH1YM3hws6xYd+UBiYV4MwM A==;
X-CSE-ConnectionGUID: mK7kbCCyS/OKQkaDTEPOhg==
X-CSE-MsgGUID: SVUyhH6+SD+y6VEg3zRaLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="87783268"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="87783268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 22:19:02 -0700
X-CSE-ConnectionGUID: zJIyOT90Q/uo8IAnukBggA==
X-CSE-MsgGUID: XlDwMl5zSHiT+U6IKxYtGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; d="scan'208";a="291391464"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2026 22:19:00 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] kms/vrr: Trigger modeset for non-preferred override
 mode
Date: Sat,  4 Jul 2026 10:49:24 +0530
Message-ID: <20260704051925.2165079-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
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

Ensure a modeset is triggered when overriding to a mode that is
not marked as PREFERRED or DRIVER. This guarantees that the new
refresh rate mode is properly programmed into hardware instead
of relying on an existing state.

Observed fastset failures when the preferred mode has a low clock
and switching to a higher clock mode via fastset, which led to
test failures. Forcing an atomic commit in such cases avoids these
issues.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7397

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_vrr.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 82eb8554a..d583d3cc3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -948,6 +948,10 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	data->range.max = data->switch_modes[HIGH_RR_MODE].vrefresh;
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
+	if (!(data->switch_modes[HIGH_RR_MODE].type &
+	    (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)))
+			igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	/* Search for a low refresh rate mode. */
 	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_LINK_OFF)))
 		return true;
-- 
2.43.0

