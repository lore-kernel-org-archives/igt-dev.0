Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77575C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 22:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD1010E28E;
	Wed, 28 Feb 2024 22:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l1ppsphc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AB110E269
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709159581; x=1740695581;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ9tkwf37cGEXBxztgYQw44l1S89+JklwAx0mnhdzoI=;
 b=l1ppsphcZQzcozq7QkEawox+MGm7jFFfq12vLfpo6GABFgSzAn0okTFj
 6gX34Rm+95R/BzZj94dm6LXNz9jH0pzBYzW1dEyO+EpoUIAGCN7r7MPKd
 6oSlWkR9Co36t6bbNWUSj7rcu6u/7HEDEIROdXBO1qmWKKqO+hn2fNhjL
 vpVSvtqFlFwULfRvnQ/ijQZpBzHr5q/GBsqy2ENtPNwN7tNs92HP0Tcci
 de1iy8+LY40kSVnHMdhpslC+rPFfSB/4AnPn3ujA0I6DpD8Wcerj5wQLf
 vg1HrKqpJ9k6Z3w6W3KZnXVGm/3TdePTtXLm8U3EAlEkOMEqdqxLLqtBp A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14306016"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="14306016"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12157766"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:32:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v4 2/4] lib/igt_sysfs: stop leaking fd on write failures
Date: Wed, 28 Feb 2024 14:31:32 -0800
Message-ID: <20240228223134.3908035-2-lucas.demarchi@intel.com>
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

Make sure to close the fd before returning.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 2b0225138..2997925e5 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -515,29 +515,36 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 	va_copy(tmp, ap);
 	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
 	va_end(tmp);
-	if (igt_debug_on(ret < 0))
-		return -EINVAL;
+	if (igt_debug_on(ret < 0)) {
+		ret = -EINVAL;
+		goto end;
+	}
 
 	if (ret > sizeof(stack)) {
 		unsigned int len = ret + 1;
 
 		buf = malloc(len);
-		if (igt_debug_on(!buf))
-			return -ENOMEM;
+		if (igt_debug_on(!buf)) {
+			ret = -ENOMEM;
+			goto end;
+		}
 
 		ret = vsnprintf(buf, ret, fmt, ap);
 		if (igt_debug_on(ret > len)) {
-			free(buf);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto free_buf;
 		}
 	}
 
 	ret = igt_writen(fd, buf, ret);
 
-	close(fd);
+free_buf:
 	if (buf != stack)
 		free(buf);
 
+end:
+	close(fd);
+
 	return ret;
 }
 
-- 
2.43.0

