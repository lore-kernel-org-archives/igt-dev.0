Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF8CA0EE6
	for <igt-dev@archiver.kernel.org>; Tue, 19 Aug 2025 15:51:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37DB810E62D;
	Tue, 19 Aug 2025 15:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bYw3AZOB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBB910E62E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Aug 2025 15:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618673; x=1787154673;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Eossvpt4LLZjhyW+Q5rxx/CWcNJ/0kECgMrlbS6fVHk=;
 b=bYw3AZOB62M8g7ONuxJFQDQqs9Hs1uxuBWuBS5ZHMJ2NO/SSeNDG5YS+
 HRa0Y79LGX5PaaagxWOAxKFrk5+leao7rAIqrUI+yqIUT+MMdcmbYDqqm
 99a7nOUaIuH/BsvI3NDt7RxlbhRXzGieEv/UlIuqqn0zcRdMY8IavZqFR
 hUBEC350UwZgwmduDHQOQmKjT7AoLWZsPDWoQvGwpjTYz1YEhRmqXPJBp
 VlXZJn5oRED8iwUzj+HDWfY4ckQcAZB2LwgG3YI1pJfBrxeNgYUB3ifUW
 PWr0o3p3peF4Hts76bSOCWEunXCRK9B7noMdmQxhwz7R7eYn59m3AZvF+ w==;
X-CSE-ConnectionGUID: pmU/pn+oQEeNTu9YTObsXg==
X-CSE-MsgGUID: 7o7Dl6JyQL6q3kMsYOSLFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="57779690"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="57779690"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:13 -0700
X-CSE-ConnectionGUID: bDNEYS1rTK+RbH2dEuwRYQ==
X-CSE-MsgGUID: RyLvtYXKQ4CcDZ2X+FRI7A==
X-ExtLoop1: 1
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.213])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:51:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v1 1/3] lib/igt_fb: Add check before loading PNG file
Date: Tue, 19 Aug 2025 17:50:56 +0200
Message-ID: <20250819155058.129794-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
References: <20250819155058.129794-1-kamil.konieczny@linux.intel.com>
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

In some configurations loading PNG data file fails simply because
file was not found on path or it wasn't copied during
installation. This in turn ends up in SIGSEGV error in cairo lib.
Call cairo lib only when file open actually succeeded.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_fb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9fc1bfc65..f42f37917 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2028,12 +2028,14 @@ stdio_read_func(void *closure, unsigned char* data, unsigned int size)
 
 cairo_surface_t *igt_cairo_image_surface_create_from_png(const char *filename)
 {
-	cairo_surface_t *image;
+	cairo_surface_t *image = NULL;
 	FILE *f;
 
 	f = igt_fopen_data(filename);
-	image = cairo_image_surface_create_from_png_stream(&stdio_read_func, f);
-	fclose(f);
+	if (f) {
+		image = cairo_image_surface_create_from_png_stream(&stdio_read_func, f);
+		fclose(f);
+	}
 
 	return image;
 }
-- 
2.51.0

