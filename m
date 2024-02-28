Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE90C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 22:33:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240A110E288;
	Wed, 28 Feb 2024 22:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LoPiHLfb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F1B10E215
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709159581; x=1740695581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6ReiuEJUdSewkY0cGiTFAQUGvMsYQQzUBp/889G7KcQ=;
 b=LoPiHLfboGLAk6D1p0MbgpsaIHrd4w5Ved1vkLb1nIsn5PMLmvGvBgfa
 oLa/NVYy8IeIRX5dAbEPmPuPPOj3jiiPtYWTPzrKJVPDDPO0I6JU6oihO
 xUYIZIRPySsob0PzAO/nZJ9OoQO6q9/d7W4O29XRgGpjUgPdFMfjCsWoc
 +sgLYKbiQZ9bt2YJ9XwG0qW2GPUELKAfPJbdFMerkv+8gMBoiaz2LOo7z
 +1poLW9dbiS+yxMOYQuEQIDilk19klPCoAmVO+k0hlwYiwLdKAhXhj0mB
 Mpe664nGFsJGJetXrMWuObM7S1Y/oQDpHswQeS9RBQxAb0YgDiTUvzBGW g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14306017"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="14306017"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12157770"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:32:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 3/4] lib/igt_sysfs: Fix off-by-one in buffer size
Date: Wed, 28 Feb 2024 14:31:33 -0800
Message-ID: <20240228223134.3908035-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228223134.3908035-1-lucas.demarchi@intel.com>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
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

vsnprintf() should receive the buffer size as argument, here called `len`,
including the trailing '\0'. There was truncation if the return is "size
or more". In this second call to vsnprintf() the value should be exactly
the same as in the first call, otherwise something really unexpected
happened.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2997925e5..a1ff5655d 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -529,8 +529,8 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 			goto end;
 		}
 
-		ret = vsnprintf(buf, ret, fmt, ap);
-		if (igt_debug_on(ret > len)) {
+		ret = vsnprintf(buf, len, fmt, ap);
+		if (igt_debug_on(ret != len - 1)) {
 			ret = -EINVAL;
 			goto free_buf;
 		}
-- 
2.43.0

