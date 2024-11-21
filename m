Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B531ED6ED17
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CDDB10E909;
	Thu, 21 Nov 2024 12:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RKHQyNWO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 307B010E909
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192405; x=1763728405;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIuwadryFmHintyP6/jFDI+os1GX+9BImu3xhtHfKd4=;
 b=RKHQyNWOFahnWxAdDchIh9Roil4YymCLMcDMtRedJIez/nyDkfGj0v7r
 WYEdJu1bqTaHZ1xzvzuia0T4QBsgWqP4jj1EUBXfO3Gd0BOzOxJR7PtVq
 XEuW59cRDbP3wLZrgvG/LCgJDpYIMRRjOaPuVoFDOWeF8nmHxLWnKiez7
 +bjDZQXNwXGSUlH81iW8EPIc8PxDuD275zup5AA+BPiBE51ZM8kGhmcly
 diL6pQV8BvJh+qAw0CzcqxvyRG6jWyyDgpADt4dwZi3ZavUBMzLzeB1vq
 FNEoQ68eEOFNTKd2GkJ7Kvh7r2TYVB5i3HEnnLYHQVMVAzLld8TY2AMxT w==;
X-CSE-ConnectionGUID: zLjt5BYnRGSoVjbILYm1+Q==
X-CSE-MsgGUID: cq2AvTtfTjumG/Gge4m/yQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32152188"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32152188"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:25 -0800
X-CSE-ConnectionGUID: XTeyA4U0S7mnRJ2IkZAjIA==
X-CSE-MsgGUID: uYZ2aW2bSTygNwpb7EvIrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="95043570"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:23 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v4 3/6] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Date: Thu, 21 Nov 2024 13:33:05 +0100
Message-Id: <20241121123308.98158-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
References: <20241121123308.98158-1-zbigniew.kempczynski@intel.com>
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

