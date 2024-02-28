Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BD5C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 22:33:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D16C10E215;
	Wed, 28 Feb 2024 22:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jO5Mfgc9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013410E215
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 22:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709159581; x=1740695581;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uqwMxMOewdouh/UYbxmK6QWBi7vPf8hRNUQCnCsqjyA=;
 b=jO5Mfgc90aEK5hF3f2aKaVQvaOYxHWqe3l8M71/3PlYZYDQi0fk/+BCm
 R1SiFI77MDomMqX+QYewB0aJ8k2hyvW1USv+d2Su/UHqB/Vcgud6KWOf9
 +x4iDF35L/hQ5XmJ62wtN0lAfPHZJg/4R+xDGc4G1Gp7iwL02zxW0DaNc
 oeXanL2MBB1gcr46A7npDUtNwVMz/AutOMzmGS6C7PaeyYEiQ3kAhfM7c
 jXv2EuzjyMrR+xwVFn0J3woQNnYSrrwJuNyFznqrIQO1i00TLTIoMDZtu
 2IWBdbFF1pnjAhrjBH84KkIYJirka9Jtdvzvs0Et57jdA4kDEO0wKlWMW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14306015"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="14306015"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:33:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; d="scan'208";a="12157762"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 14:32:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v4 1/4] lib/igt_sysfs: Use same var for sizeof()
Date: Wed, 28 Feb 2024 14:31:31 -0800
Message-ID: <20240228223134.3908035-1-lucas.demarchi@intel.com>
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
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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

