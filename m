Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0596D3B7EF
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 08:23:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C8D10E5DC;
	Mon, 25 Nov 2024 08:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2F+ZiH/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7237A10E5DB
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732522999; x=1764058999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KIuwadryFmHintyP6/jFDI+os1GX+9BImu3xhtHfKd4=;
 b=D2F+ZiH/kC0PjPBHhKsELlpfI6HM0BIfYy9HTdF5BLs4MH6+foZ2ZUCa
 V/yN7WkGkZPPlHJWE4LDwkVPMWCXC4f0Tw5HlpjxWfWYYwHBrBP8Ylxo1
 1hxNm9xbldxLFXxcAPkFmZf6SvT8R2IKS1bfdcdufaZbnVrRIEQpGsJN3
 l6uKtZXivF6B13NzFGykEH9Hf87r2dFwgWnTpEBGhIIQegT5zlBuZ7fRz
 rYpdKQfYP4NiUXjOEwHOD2GN5bbN7BFDGwNqF8pVh2gb5WDzQNtqP3D55
 eSg6rs3QCe7l3nJhBVpzl9n++GBf7sg6QUIm42mgUsVPBnzIHvjI8AyGh A==;
X-CSE-ConnectionGUID: RBo6RACPTs+Xa3YVxJKCFA==
X-CSE-MsgGUID: 4GV8UKoQTfKZyUmszXJARA==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20206657"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="20206657"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:18 -0800
X-CSE-ConnectionGUID: KmJaU7Q8QFK0AFTNC2WbgA==
X-CSE-MsgGUID: rdPPw/DuS5SttkJ6+MyScg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="96118827"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.224])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 00:23:17 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v7 3/6] tests/xe_gpgpu_fill: Add offset-16x16 subtest
Date: Mon, 25 Nov 2024 09:22:55 +0100
Message-Id: <20241125082258.74889-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
References: <20241125082258.74889-1-zbigniew.kempczynski@intel.com>
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

