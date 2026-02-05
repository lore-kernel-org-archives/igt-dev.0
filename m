Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8D0EA7960
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 04:31:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E30010E7AF;
	Thu,  5 Feb 2026 04:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtFzIi6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1CF10E7AF
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 04:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770265859; x=1801801859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H0BLAhquP+7j7MGCzfFzgmDkGJ+HXA8vxAzzqvP4Y+c=;
 b=PtFzIi6zifSepvI2wmVKp/nuzEhzDEUcd2hMUmUbE2RvZpU7parpUorH
 Hl+WEr6tb0h5R9NNEz3nsoj2YC9R1OHTB0wvfDB6vVMI5ddNpDHqchZtj
 bkRE3+/WcBUSsEvnVG/mTnZPhuBFODxSfAZClJJTB0SFteFN2t+N9IryM
 EmEo0Zxh8JdV1PhKAMNfOUIE4DCe4dBpoS/JPNaCI3ZiG9U/OgsUz96Ep
 bT5opEMtCvqQO+Mvz3TTDb/jtNaaG42hNMkEC9zr3LrV6GFgJE28i65G+
 0D05rhfilNzRTngA8WZWMKzKwI11iD7L3eoPlu4uR+EOs4ge35r0hlxLl A==;
X-CSE-ConnectionGUID: npSlVYpJTpafaSV+G8J2Ig==
X-CSE-MsgGUID: sJYc1gWCRauCGdZ6VZaFEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="75312479"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="75312479"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 20:30:59 -0800
X-CSE-ConnectionGUID: uXntLNvaRn21LtcEaP0l1Q==
X-CSE-MsgGUID: sK0+oXQ5TyCabcH72/N28w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214897815"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by orviesa004.jf.intel.com with ESMTP; 04 Feb 2026 20:30:57 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, ramanaidu.naladala@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v2 2/2] tests/kms_plane: Skip unsupported modifiers
Date: Thu,  5 Feb 2026 10:11:28 +0530
Message-Id: <20260205044128.1052937-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260205044128.1052937-1-pranay.samala@intel.com>
References: <20260205044128.1052937-1-pranay.samala@intel.com>
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

Skip modifier subtests that are not supported.

v2: Avoid code duplication (Ramanaidu)

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a7b1bf25d..0aca68faa 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1467,6 +1467,11 @@ static void run_test(data_t *data, void (*test)(data_t *, enum pipe))
 	igt_crtc_t *crtc;
 	int count = 0;
 
+	igt_require_f(igt_display_has_format_mod(&data->display,
+						 DRM_FORMAT_XRGB8888,
+						 data->mod),
+						 "Modifier not supported\n");
+
 	for_each_crtc_with_single_output(&data->display, crtc, data->output) {
 		igt_display_reset(&data->display);
 
-- 
2.34.1

