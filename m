Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AF5C5AD05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:53:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A16D610E463;
	Fri,  7 Aug 2026 22:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YeevUPOJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA0510E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142880; x=1817678880;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lMX3d7MdoTKaMn6nFNjlgZt4yp9bE0xDvLY2DPWUlfY=;
 b=YeevUPOJzO70M7lM6xtyC6RWOLsid+G0BVMPaiOXVEy+dkqafqVCYN4+
 H5hMaeObw+dhR7ypfoBn91OR+mzZJDL7gAoAc3jgYvIaByMoXbZApDaop
 sbljneHNDwDK+ElgVpAM8ULizJk5qdUj4wyNIpaxd1cE401u2QvNujSGj
 4eBlKZe6w7hIwtYf2kUdgy7RUVq5OlL7pQsu3uUFuVJxLgJxnk8/Idv2/
 E0/3vRY7QU8RGf/prJd12bAPRxrBX/PlDePtbcMkdN0Ckp0FIgCRLd0EJ
 Hd2CT+QqMiyAHAQr559PDQja7OTP/+/zfmHB36IZ2So3w/KVS/zZWT9U2 w==;
X-CSE-ConnectionGUID: wGietiFtSsy0Q9UCemc2+Q==
X-CSE-MsgGUID: MxNGfgsBQ4SoLaOf923hvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835807"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835807"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:47:59 -0700
X-CSE-ConnectionGUID: 7/WFElPWTsW7WGqi3eqr9g==
X-CSE-MsgGUID: ctB4V0zBTWGczRsY8m9h9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655426"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:47:58 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 07/16] tests/kms_pipe_crc_basic: limit #crtcs tested
 during suspend
Date: Sat,  8 Aug 2026 00:47:37 +0200
Message-ID: <20260807224746.3554064-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Limit execution of suspend tests to first and last active CRTC unless
using `extended` flag. This helps with reducing default execution time
of the test which can lower number of hitting CI timeout.

v1->v2
- move constraint before crtc_output_combo_valid() (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_pipe_crc_basic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e1415452..f1f89f11f8 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -127,6 +127,16 @@ enum {
 	TEST_HANG = 1 << 3,
 };
 
+static bool suspend_constraint(unsigned flags, igt_crtc_t *crtc)
+{
+	if (!extended && (flags & TEST_SUSPEND) &&
+	    crtc->crtc_index != active_crtcs[0] &&
+	    crtc->crtc_index != active_crtcs[last_crtc_index])
+		return true;
+
+	return false;
+}
+
 static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 			  igt_output_t *output, unsigned flags)
 {
@@ -425,6 +435,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if (simulation_constraint(crtc))
 					continue;
 
+				if (suspend_constraint(tests[i].flags, crtc))
+					continue;
+
 				if(!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
-- 
2.45.2

