Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59088D4415F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:31:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DDE10E5A3;
	Fri, 12 Dec 2025 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hpw0fQO/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4610E59C
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531892; x=1797067892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Rhx4u+AA9sQVrJG9ZRcUQqprogICaWaa5tc/8nKvD2g=;
 b=Hpw0fQO/qRsXzx6kEXrSyGEzz0HizZIwVs8rPnbuUUggIy4rAV9OEuWE
 eDVjV0brpsYm/zeOFhZAE7JSO26LLuU4wnY0WGlhopn0lje9YldxK0mFZ
 00PHqzuj8NrNxa5s6C+Z1QC+9KuLPeI/IUW5pdTNtvI0AMztbN5A9m0IY
 x9R1/yc65nZf8hq5T6Rd0AcyKa8prK7wpYfCbdWnjWLViDwCQApeYgkzk
 snk3WRnET2oj+YVCXbqg3JtS+x2Tc//d236iJrfShEkl19r4Vgx73Jp76
 sY+n1P9zPS4txhbKXTThk5ZQ/Ca4gTh3PE/sR+9YimwQRu6tN5gw3mHE0 A==;
X-CSE-ConnectionGUID: Tq6xC7SxRmOKdi6mYwW9Yg==
X-CSE-MsgGUID: dI4svG+ZRbm4kAENktnKPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84932432"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="84932432"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:32 -0800
X-CSE-ConnectionGUID: 6kDOwf0QS7SjsP6E8BbJBA==
X-CSE-MsgGUID: fyaHabSiSZGWcpgzCdVvBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197301258"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:30 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 2/4] tests/intel/kms_mmap_write_crc: Use lib function
 to paint fb
Date: Fri, 12 Dec 2025 15:01:44 +0530
Message-ID: <20251212093146.2881962-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212093146.2881962-1-karthik.b.s@intel.com>
References: <20251212093146.2881962-1-karthik.b.s@intel.com>
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

Use the lib function igt_paint_test_pattern_fb to paint the fb
instead of doing it locally in the test binary.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_mmap_write_crc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index ad3dd1b20..ccde47c2f 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -91,7 +91,6 @@ static void test(data_t *data)
 	igt_output_t *output = data->output;
 	struct igt_fb *fb = &data->fb[1];
 	drmModeModeInfo *mode;
-	cairo_t *cr;
 	char *ptr;
 	void *buf;
 	igt_crc_t crc;
@@ -104,9 +103,7 @@ static void test(data_t *data)
 
 	ptr = dmabuf_mmap_framebuffer(data->drm_fd, fb);
 
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_test_pattern(cr, fb->width, fb->height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(data->drm_fd, fb);
 
 	/* flip to it to make it UC/WC and fully flushed */
 	igt_plane_set_fb(data->primary, fb);
@@ -151,9 +148,7 @@ static void test(data_t *data)
 
 	/* start over, writing non-white to the fb again and flip to it to make it
 	 * fully flushed */
-	cr = igt_get_cairo_ctx(data->drm_fd, fb);
-	igt_paint_test_pattern(cr, fb->width, fb->height);
-	igt_put_cairo_ctx(cr);
+	igt_paint_test_pattern_fb(data->drm_fd, fb);
 
 	igt_plane_set_fb(data->primary, fb);
 	igt_display_commit(display);
-- 
2.43.0

