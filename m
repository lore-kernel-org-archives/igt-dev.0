Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5271DC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 06:31:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B291C10E3F5;
	Wed, 28 Feb 2024 06:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lgb9+rOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1F210E3F5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709101904; x=1740637904;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uqwMxMOewdouh/UYbxmK6QWBi7vPf8hRNUQCnCsqjyA=;
 b=Lgb9+rOHsMfd9Ip71wl31xpSho/FGj8xumSF4P2qwV2p1tfZ+VFJpH09
 zs8LAdcrrnZiHcjnc29abtF2qyNjkW5UCutY28C2/uRGov12CthZRcjcc
 oGJ3+Fj/z2j7Miz/eRy8vwZZquPEB2Gs6cvI0KeEdHpKGJZ81LOko1B+3
 RZwdVP6PzR4XAHdEnQ/PFGKLIJO+5Hj+fuoba7sXwHVERhApfocjrbDY6
 v3jx8TmLzSC7fvW+kvav4x2VBIeWlffTVkzR6/ZFueiklu4JHsxZ5BTQL
 CMI+qg/zaqXcXCaaULelM94wd0wM+6d2dBDbsOMaGhvKWbL0Js/t3dPyI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="4054175"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="4054175"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="44845857"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 22:31:43 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH i-g-t v3 1/3] lib/igt_sysfs: Use same var for sizeof()
Date: Tue, 27 Feb 2024 22:32:09 -0800
Message-ID: <20240228063211.3662862-1-lucas.demarchi@intel.com>
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

