Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28667C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B143E10F9A8;
	Fri,  9 Feb 2024 18:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CHT/9P1n";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE1A10F990
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 18:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503725; x=1739039725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qm5tWSwneEp4tLCFLJV0ySIbZapBWNP6rVfqcNco4TU=;
 b=CHT/9P1ni7ePPZp+FeNQTn3Ue2KZtCFyrAmF8hEdse5v7jwrh1KI8KlM
 pSvYN2zufF+UmkgXuERYAExM9lS8dudahxXPF41qcZgq1g74EmTyvNby3
 sjkDulnVXEIf+OBb3FQDouUCsO8sel0hzt5CBdOe6W5uPrTDwq0HCZgkO
 dsLLIoFYtIyqOEuqGfmZT+bR2SsCRg8IsqJjwGAv9H99T1WFOlpu6iBbS
 b2w7pclGLguGTnVnvAM5lWKifRRaHZttpsqUG1EQIJ3Qp5qviPhky8L7X
 ++sBRxEImW/Rj9rzkMAURN4nVx6NYfc+9vhMcqHTgwadHN9FwJuz00Oir A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12049336"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="12049336"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="6647808"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 8/8] lib/igt_fb: assert fb->size blt_fb_init()
Date: Fri,  9 Feb 2024 18:34:33 +0000
Message-ID: <20240209183433.375099-8-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209183433.375099-1-matthew.auld@intel.com>
References: <20240209183433.375099-1-matthew.auld@intel.com>
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

