Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A90D2504D
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 08:49:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF9310E316;
	Mon, 12 Jan 2026 08:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yu5fq24R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B84810E325
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 08:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768207741; x=1799743741;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bYsGLXCfHpy+QB1aUJNmGtfaVI6/sQ09ussMpGkVuE4=;
 b=Yu5fq24RO/KScbuqdLdHRRP80MzZboQZjfoW1bAXcpwAqd+NxoaSec5E
 D7gv7Rd6MFy6eS0eTKabopvcUtbu1p8bL6HRQ5so9lWhyFma0pZEEwlCN
 fdn0+t7Tifrsk2VrGDQc2EutOG8WOpNPA1bgIEJ3Av0H160vzW8Kxxn7D
 j3IrLu8Yv/s+J32Qveg9TTbFbHI3i1n/Sg8kJagTN/5VBRGk59UgZ3sn5
 krDc+0drabXOgjmxWlh5mDosXRr8EiRh97BnmBO0GSXc0ucB5zt6wMLkQ
 1B47WHZ5Zc7mPtO/L6iUmp80HEEIhRMzucKuMoEaToYOtob7GBEHuGQwr g==;
X-CSE-ConnectionGUID: GpiYD3HjT2aA2UxtY42f1g==
X-CSE-MsgGUID: 7aI8BUrfTpexLXlqkWvEIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69461974"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69461974"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:49:01 -0800
X-CSE-ConnectionGUID: wu69GPtdRZy229Vf1uRDKg==
X-CSE-MsgGUID: JNeNw3s0SuKxsdxdxhXh0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="208562179"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:49:00 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, swati2.sharma@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_joiner: Add check to validate mode
Date: Mon, 12 Jan 2026 14:14:55 +0530
Message-ID: <20260112084455.157949-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112084455.157949-1-karthik.b.s@intel.com>
References: <20260112084455.157949-1-karthik.b.s@intel.com>
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

Add check to validate mode to ensure that invalid paramerters are not sent
to create fb call.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel/kms_joiner.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
index 2aa43e474..bf817a453 100644
--- a/tests/intel/kms_joiner.c
+++ b/tests/intel/kms_joiner.c
@@ -378,6 +378,7 @@ static void test_invalid_modeset_two_joiner(data_t *data,
 			} else {
 				mode = *igt_output_get_mode(output);
 			}
+			igt_assert(kmstest_mode_is_valid(&mode));
 
 			igt_output_set_crtc(output,
 					    igt_crtc_for_pipe(output->display, data->pipe_seq[i + j]));
-- 
2.43.0

