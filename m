Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB92D6ED17
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 12:33:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 158FD10E2FD;
	Thu, 21 Nov 2024 12:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CdlKQl9d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC2110E2FD
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 12:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192410; x=1763728410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o8ySv+ezCjvAzmlqikc3Mu5ti6IfebuFd929BPYaQEE=;
 b=CdlKQl9dFW6mn7T+VIevjTeIKe046gNeDmkAtFl0E2Q6gbdefgjGhFA3
 KZBI+Sg9GCGXEGCU66GOqwZ4GhCb98+it4wrTXHu7y1Rny2Psw8XV+JG9
 QYx5NfmIxmgNkuPDQ9QDyfUn6qvywwld1FCpt0KNGC8cz4v0ozbN04gZR
 g2iqZypEBigJaEQIj1nLzv9+5Wur3VJDFed5PvXEbmmrrdFsceOgpg7DL
 3Y7l5S0fydjPf8MEU6deqcxl0iZTcWke6yEOD9mqSKRJ0naMHVQXd7pSK
 XuPJQ9C5N87blhtEwZcpmkkMUfFnQtFU5PybgNRupzWseGE9OpRswAQOT A==;
X-CSE-ConnectionGUID: ubSkTe8TTGGIXcriRQoxgw==
X-CSE-MsgGUID: ahQrowm3T+GtGhd9sf7vlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="43697397"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43697397"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:30 -0800
X-CSE-ConnectionGUID: zmxsLx9nRNOAeM9SttD5lw==
X-CSE-MsgGUID: PMTGkPZXS9e9+Q5Nv92R4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="95298324"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:33:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t v4 4/6] tests/gem_gpgpu_fill: Add command line switch to
 dump the surface
Date: Thu, 21 Nov 2024 13:33:06 +0100
Message-Id: <20241121123308.98158-5-zbigniew.kempczynski@intel.com>
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

When implementation for new platform is added and shader + pipeline
needs to be adopted there's useful to dump the surface data.

0xC4 pattern makes distinction from 0x4C written by the shader very
hard so change it to 0x88 makes dump more clear.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 tests/intel/gem_gpgpu_fill.c | 43 +++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/tests/intel/gem_gpgpu_fill.c b/tests/intel/gem_gpgpu_fill.c
index aa735e5395..36c60e75f0 100644
--- a/tests/intel/gem_gpgpu_fill.c
+++ b/tests/intel/gem_gpgpu_fill.c
@@ -64,9 +64,11 @@
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
@@ -117,27 +119,58 @@ static void gpgpu_fill(data_t *data, igt_fillfunc_t fill, uint32_t region)
 	uint8_t *ptr;
 	int i, j;
 
-	buf = create_buf(data, WIDTH, HEIGHT, COLOR_C4, region);
+	buf = create_buf(data, WIDTH, HEIGHT, COLOR_88, region);
 	ptr = gem_mmap__device_coherent(data->drm_fd, buf->handle, 0,
 					buf->surface[0].size, PROT_READ);
 
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

