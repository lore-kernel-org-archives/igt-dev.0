Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89824E65D2C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 07:29:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AD9110E049;
	Fri, 22 Nov 2024 07:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCIArvZv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DA610EAE4
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 07:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732260567; x=1763796567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIuwadryFmHintyP6/jFDI+os1GX+9BImu3xhtHfKd4=;
 b=QCIArvZvoS0X+E8hQyFYEazJ9gn7KMtA33wznieMq0HIV2tuHunN0LSG
 O4aIsruT/efKX3TE8SVCnfwrzn4F4cZ/0Ii/KoGH4hI4YJrabDnS6phjL
 G2y33/sH9/5UdZEQtmufVeISLqG8Z6BKkfEBrt0UFaFieCZqxD7Idwetc
 rRpxTP6n6M8p/QsoVUpdbyeWbAfy9jUiE0hTS1S/lj++xIcWFmoagKmM2
 1+7rtfGLkdVf/xcPs2p6LKv0ITnA9TRlyJPA8IumzgrwyJCOEvNkBPlLU
 wP8uuPxEwUMz8FNvTIQ9NSWylqOPWHuS9HX57ihzbhnruTnCJSsTx/xsa Q==;
X-CSE-ConnectionGUID: 9jsof7QyR0uvyLC8tYUNxQ==
X-CSE-MsgGUID: jlY6p8xFTZ2JQfMrxeBZzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32558900"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="32558900"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:26 -0800
X-CSE-ConnectionGUID: eH6hyDyPRh60VmvfbY7OCA==
X-CSE-MsgGUID: ABY0pnHRSYS5Z4H5h0xvvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="90868217"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 23:29:25 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v6 3/6] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Date: Fri, 22 Nov 2024 08:29:01 +0100
Message-Id: <20241122072904.164247-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
References: <20241122072904.164247-1-zbigniew.kempczynski@intel.com>
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

Add subtest which verifies rectangle filled by pattern starts at
offset <x,y> == <16,16>.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_gpgpu_fill.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index 82625bb7c0..e1ecff8233 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -87,6 +87,10 @@ static void buf_check(uint8_t *ptr, int width, int x, int y, uint8_t color)
 /**
  * SUBTEST: basic
  * Description: run gpgpu fill
+ *
+ * SUBTEST: offset-16x16
+ * Description: run gpgpu fill with <x,y> start position == <16,16>
+ *
  */
 
 static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region,
@@ -189,6 +193,14 @@ igt_main_args("dW:H:X:Y:", NULL, help_str, opt_handler, NULL)
 			   surfheight / 2);
 	}
 
+	igt_subtest("offset-16x16") {
+		gpgpu_fill(&data, fill_fn, 0,
+			   surfwidth, surfheight,
+			   16, 16,
+			   surfwidth / 2,
+			   surfheight / 2);
+	}
+
 	igt_fixture {
 		buf_ops_destroy(data.bops);
 		drm_close_driver(data.drm_fd);
-- 
2.34.1

