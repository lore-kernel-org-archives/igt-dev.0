Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25140C4829F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9D110E43F;
	Tue, 13 Feb 2024 10:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OH2CNXmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0A010E347
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818504; x=1739354504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hK+uIrAEu2isfxisgGSp60Z2jjrWRd+1bweVgwcId9o=;
 b=OH2CNXmc0/hjZHTks/4xuYVwoY6uchtBlp6zbuP7/12a5iLjoWowSnUy
 G+VN9PviVpl1bAhhaKocE+5ShrQ7sjE/Utp8bdhxKD+2DeQipq8S89Dj/
 /+y2GvBuf+l8zUQJfWP6ab9Tlh2JrL3G1jamPgETeuD8ldVrJrARARXeY
 YzorXErtgxbWlqRl5Lfquol/0kZFcnORXYgOBnBv9DWb0nVHohzcELCjl
 JoFjzbgGlsR1TpOylSFUNq0u1ALS7RFohWMy4R7TCJtd7Pj1XU0AcI0XL
 QdRKV8BhzSGX/QsbH03M/po05PKS8H2XCP/0pcSam9a/9DhH8kabvxbjr w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232364"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="19232364"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="2815524"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:42 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 8/8] lib/igt_fb: assert fb->size blt_fb_init()
Date: Tue, 13 Feb 2024 10:01:25 +0000
Message-ID: <20240213100125.90085-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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

If fb->size is zero here, the mmap failure is pretty obscure from the
logs. Make it more obvious if we hit this.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/igt_fb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 71c220a08..65e0638c2 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2780,6 +2780,8 @@ static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
 
 	blt->plane_offset = fb->offsets[plane];
 
+	igt_assert(fb->size);
+
 	if (is_xe_device(fb->fd))
 		blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
 					  PROT_READ | PROT_WRITE);
-- 
2.43.0

