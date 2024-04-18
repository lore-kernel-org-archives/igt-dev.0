Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E36C04FF8
	for <igt-dev@archiver.kernel.org>; Thu, 18 Apr 2024 15:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A89110FCCC;
	Thu, 18 Apr 2024 15:17:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WpJ0dS1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838F410F8BA
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2024 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713453455; x=1744989455;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Lp9t6/GBFYrSnE/T3qHrD8Ymodm16lcHkUMI/oXtSgA=;
 b=WpJ0dS1SQp6aDzGGdf5R+dY2JSP6h+vv8XSvNsA8Fn/D9kpK/okOjBNw
 VoGZKBUahf8OA+9LFl7NMFEtkYzmL4Kj4ijGfZRz62t+zxASqO1cCWQDD
 /kfpw4eW8GMh5DddCCO1q9Wy2OGlWBVTo+fBeTUHYutfh8W2aosPYVZ/7
 Lwb8K6427hAW/RGyd3FesiIq5t2uj1/fpNlUMdLREsPis1jvbd0Ujpcyt
 oajeTvKakwop5PHDvFHip8XtYWn8Jvtz0MccyHkPq1ewY79ioUllz788b
 GVEt5hIycjX4yuRZbL4rgggYzp+KSjmYWxBIjsIbsAA3BJFdZMTvYM1Gn w==;
X-CSE-ConnectionGUID: OeSJCzYcTgiCfl3IGwK6nQ==
X-CSE-MsgGUID: h4lEM1qVSCO+K0Im5/0WxQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="26465808"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="26465808"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 08:17:35 -0700
X-CSE-ConnectionGUID: hu2hwtjiQHSGSPgNSfxyWQ==
X-CSE-MsgGUID: qUeRDM2ZTYy3Exr8Y/MFaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000"; d="scan'208";a="23463261"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2024 08:17:33 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/7] tests/intel/kms_big_joiner: add missing commit
 after reset
Date: Thu, 18 Apr 2024 20:58:13 +0530
Message-Id: <20240418152817.2352850-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240418152817.2352850-1-kunal1.joshi@intel.com>
References: <20240418152817.2352850-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

add missing commit after reset

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_big_joiner.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
index 88923be6b..f325a9839 100644
--- a/tests/intel/kms_big_joiner.c
+++ b/tests/intel/kms_big_joiner.c
@@ -267,6 +267,7 @@ static void test_joiner_on_last_pipe(data_t *data, bool force_joiner)
 
 	for (i = 0; i < len; i++) {
 		igt_display_reset(&data->display);
+		igt_display_commit2(&data->display, COMMIT_ATOMIC);
 		output = outputs[i];
 		igt_output_set_pipe(output, data->pipe_seq[data->n_pipes - 1]);
 		mode = igt_output_get_mode(output);
-- 
2.25.1

