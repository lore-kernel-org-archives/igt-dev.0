Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4DEC5478C
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 19:33:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2148A10EA44;
	Thu, 22 Feb 2024 19:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYiKCZQA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29C8F10EA4B
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 19:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708630390; x=1740166390;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9ClOOiJrz9dcZPK6fTibT8UemWVjij35S9YIqg2p2jE=;
 b=NYiKCZQA0yhTVnAaHjRRZLh1gY94H57wwMwekpo3nyOHdl5LlnpLY8OD
 FTW7DS+smqfDC6D9SoJXO7gwxSwUsRKSuCVJ6HJNaM7xF/ventTaOJiju
 89kN9FA6QtfAKuLzxfo9zegTZ8SWJrRhRqjAH0RkD1Lr1Jw0isbblB1k/
 MdrC/lvH8X29Ce6Yqc8C8b0HKlS1kfTRL97TVA/dKyLOGhXpDhTsC3KuX
 JmJsOyj13ZHMklxA/Z2b2toqd2e9Dlzz3z/FYeeYkjQ56UnxDYMcJtJFz
 mj2rCtm+swAcRYm36UNBvkKBiBppTOlXywn8sxj+jdaNFd0f3Rke57qtj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6706260"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6706260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:33:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5910778"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 11:33:10 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v2 1/2] lib/igt_sysfs: Use same var for sizeof()
Date: Thu, 22 Feb 2024 11:33:25 -0800
Message-ID: <20240222193326.3004623-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
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

Let's guarantee we always pass the same pointer to vsnprintf: if we are
using the array size, pass that instead of buf that could point to
something else in an eventual refactor.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 51b610114..2b0225138 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -513,7 +513,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
 		return -errno;
 
 	va_copy(tmp, ap);
-	ret = vsnprintf(buf, sizeof(stack), fmt, tmp);
+	ret = vsnprintf(stack, sizeof(stack), fmt, tmp);
 	va_end(tmp);
 	if (igt_debug_on(ret < 0))
 		return -EINVAL;
-- 
2.43.0

