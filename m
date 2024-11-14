Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7A4D41D46
	for <igt-dev@archiver.kernel.org>; Thu, 14 Nov 2024 12:06:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEE810E2AB;
	Thu, 14 Nov 2024 12:06:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HX3x65Eh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502E110E2AB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Nov 2024 12:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731585989; x=1763121989;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JBAB3dzi4KT2OxDECY4o+IKU8l6FjhkSXSJZQVgYwCc=;
 b=HX3x65EhDUphiJwdiiE7VbL4OuYmS9yNeZ4lrSVz37w+yDgAzd1DG0AP
 xf70SHNmwOFFNM1ZVRIGdGs9CpIQm1I4FjyIta4auY/+ItV1j3r2+VT7i
 thwYsuBRwkiq21M42zFQmjQ06hAibVTmP9QCcSDMofPf7gxoSxRGVckS3
 F/7KWKO28YFMu36Q83RXltioClEQyUb7vSys4V6lkVA0VtNICf6c/sbBz
 4RLJMjtUTGR60PVudVzDiXbp6Q8auC02DkvNy7NySDblwc/PCzv+xOHTy
 CwfWvQsmO4IPCdgII9lOzdIPMfa6p+b5ihvwTEOTBivuQ68F36Vw5R7eD g==;
X-CSE-ConnectionGUID: FPP0MoZmRsixX2QRoaVwuQ==
X-CSE-MsgGUID: C0KhFSNZR2+lmac7nc/i7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="19129872"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="19129872"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:29 -0800
X-CSE-ConnectionGUID: ExUEEHeSSW2guZZdgLn9kw==
X-CSE-MsgGUID: 89pOcTSdQMyWbTo94hmQxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="87737948"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 04:06:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/3] tests/xe_gpgpu_fill: Add command line switch to
 dump the surface
Date: Thu, 14 Nov 2024 13:06:14 +0100
Message-Id: <20241114120616.70229-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
References: <20241114120616.70229-1-zbigniew.kempczynski@intel.com>
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

When implementation for new platform is added and shader + pipeline
needs to be adopted there's useful to dump the surface data.

0xC4 pattern makes distinction from 0x4C written by the shader very
hard so change it to 0x88 makes dump more clear.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/xe_gpgpu_fill.c | 43 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_gpgpu_fill.c b/tests/intel/xe_gpgpu_fill.c
index 24fab519cc..4e1785432b 100644
--- a/tests/intel/xe_gpgpu_fill.c
+++ b/tests/intel/xe_gpgpu_fill.c
@@ -36,9 +36,11 @@
 #define HEIGHT 64
 #define STRIDE (WIDTH)
 #define SIZE (HEIGHT*STRIDE)
-#define COLOR_C4	0xc4
+#define COLOR_88	0x88
 #define COLOR_4C	0x4c
 
+static bool dump_surface;
+
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
@@ -89,26 +91,57 @@ static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
 	uint8_t *ptr;
 	int i, j;
 
-	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4, region);
+	buf = create_buf(data, WIDTH, HEIGHT, COLOR_88, region);
 	ptr = xe_bo_map(data->drm_fd, buf->handle, buf->surface[0].size);
 
 	for (i = 0; i < WIDTH; i++)
 		for (j = 0; j < HEIGHT; j++)
-			buf_check(ptr, i, j, COLOR_C4);
+			buf_check(ptr, i, j, COLOR_88);
 
 	fill(data->drm_fd, buf, 0, 0, WIDTH / 2, HEIGHT / 2, COLOR_4C);
 
+	if (dump_surface) {
+		for (j = 0; j < HEIGHT; j++) {
+			igt_info("[%04x] ", j);
+			for (i = 0; i < WIDTH; i++) {
+				igt_info("%02x", ptr[j * HEIGHT + i]);
+				if (i % 4 == 3)
+					igt_info(" ");
+			}
+			igt_info("\n");
+		}
+	}
+
 	for (i = 0; i < WIDTH; i++)
 		for (j = 0; j < HEIGHT; j++)
 			if (i < WIDTH / 2 && j < HEIGHT / 2)
 				buf_check(ptr, i, j, COLOR_4C);
 			else
-				buf_check(ptr, i, j, COLOR_C4);
+				buf_check(ptr, i, j, COLOR_88);
 
 	munmap(ptr, buf->surface[0].size);
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	switch (opt) {
+	case 'd':
+		dump_surface = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+
+const char *help_str =
+	"  -d\tDump surface\n"
+	;
+
+
+igt_main_args("d", NULL, help_str, opt_handler, NULL)
 {
 	data_t data = {0, };
 	igt_fillfunc_t fill_fn = NULL;
-- 
2.34.1

