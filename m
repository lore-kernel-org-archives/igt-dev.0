Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4AAC54E51
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 06:31:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B6710E459;
	Wed, 28 Feb 2024 06:31:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YfVMgqMH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67EAD10E40F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709101904; x=1740637904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gJ9tkwf37cGEXBxztgYQw44l1S89+JklwAx0mnhdzoI=;
 b=YfVMgqMHWVoSt+oUsgf/kouP8xUuDwA3RbYYJhyYLRs4WDwy8oVYfKMv
 itoAJVsXu4I5ZUGMUWwR5swveqgnwEnnKyKbuU8EpnlPVa5afwF9grcBL
 qEqy7r+TYILBM05CZW21M+0e7sh+cPDMZ24scOlepR6SRwzcfs60plBq3
 kBWMUzm6fGP2hnRmve0u+9MEdrDmhEhvzuMgFTqoeJr4lScgce6kGZRGr
 BbGLts6YnBjYPhIyiCm/ucDDl6IAzqTV6jqBOch2FhOu6DnlcBbKNUueX
 C8aKRI/ZJEMHrM/JBWUBrypSOnKoiPiwVvIl0rv/4lgP0pkBmuvoVBF6m A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="4054176"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4054176"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="44845860"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:31:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 2/3] lib/igt_sysfs: stop leaking fd on write failures
Date: Tue, 27 Feb 2024 22:32:10 -0800
Message-ID: <20240228063211.3662862-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228063211.3662862-1-lucas.demarchi@intel.com>
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
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

