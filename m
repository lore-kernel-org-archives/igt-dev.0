Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223D7E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 16:26:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42CD10E2C3;
	Thu,  9 Jan 2025 16:26:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eJa83dea";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD94210E470
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 16:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736439998; x=1767975998;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=o+2h/nd9Wh1Wx9M1X3Juxw2fSTC8hUXZRfVJCYIa638=;
 b=eJa83deafRnixjhNP6ph548LBEbapHHvgNu8vLI0/69l1jVfzYEyz26o
 ccG2KWUH8mSnHbXWPJ24iBJDTWVVD8v1+bfhlQltpeEcBQrb04WlXvs8S
 hSolIieU6MPG4aRJLVpmq+xzWXsYVKIVzBP1Pu3uLKB+XjD6MidooU20v
 v89ezHe25FISQyxni/9c+3G5BFOUGgQYvTt2i4RS2WMWJTTpNPeVNXpRA
 MEF1JbLI7JIvyj8zQCEHd66mSOenxWfoyp0n0SAFBvEmVwDc8L/SaH2j5
 /MSCFaz5jUPi9mmuxq5LcAr2TfzLhMEDYYc+pQgpM5BZnZxAfW0osIEr9 w==;
X-CSE-ConnectionGUID: OxgnYofjSgGRyYa0e8IySA==
X-CSE-MsgGUID: WwWWJmFqTvGVJBePw+DGLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47380939"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; d="scan'208";a="47380939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:26:37 -0800
X-CSE-ConnectionGUID: 9mARJyz+S8mcFu/odu1XuA==
X-CSE-MsgGUID: ZHDThRX3QMa5EeGcypQRyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108086808"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 08:26:36 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Thu, 09 Jan 2025 17:26:30 +0100
Subject: [PATCH v2] lib/meson.build: allow build IGT with link time
 optimization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-fix-lto-v2-1-3dc74d60a124@intel.com>
X-B4-Tracking: v=1; b=H4sIALX4f2cC/2WNQQqDMBBFryKzblqTioauvEdxkcSxDmgik1Rax
 Ls3ui1/9fjz5m8QkQkjPIoNGFeKFHwGdSnAjca/UFCfGVSpKqlkLQb6iCkFofu7dbLS2tUG8vX
 CmKvz07PLbE1EYdl4Nx7+e4mJ0cy32cSEfBgjxRT4e06v8vD+V1YpcpQurWx615RDSz7hdHVhh
 m7f9x95d35iwAAAAA==
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=o+2h/nd9Wh1Wx9M1X3Juxw2fSTC8hUXZRfVJCYIa638=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnf/i7FqGb40Jvfi//wIFpIr5IZBlW2uER5y3WKjIt
 8zZH6saJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ3/4uwAKCRAjYrKT3hD9161vDA
 CulUQ3mQLiE6t7W2BYoyU/5Bqn8/3vMNo0fuOrZeLbDoGLlfEmMRBb1eje3TaIWU7zly8a0cI/y0jr
 ypTXi+vUWb1IwU7fmL3+gV3y529A8lTayAPZgsvIcEcIvSpC+f4XMPO+F8rfJk090myJc8rZEG17QO
 kLLn3JVRS7T9TWKnGwT92jKkRNqMOXNxFzzesE+iFgkdEfzracxHAYAI7fl1oW22ksCBqirmrQlc8a
 fqLDvTxZNNuEzbe3+1ZQwZcIc3XM8PSIVZlUksZKMSkjWSWNI4tOnGtJqP56Ka//23llUhu01tozwI
 9xwTH7+fVm6F81AAPWn+HLH1oynahrNgL5mdSVNo65b43E/bLLBWYsNQcjRr8c7FdcyXQrfgAksA5o
 jyWSzyFaerOhjPuK5f0xZkT95WdtV+EmxN3ecxaTDl9pd3p2E7oW7jcy7XWOZ+e3rGDhJ0Snd3wyzG
 Z4Kc+QpWYNe/OoxDgr5Svv0haZNkoOxNhmQHAQ6g2qdwM=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

Some distributions use -flto gcc flag to build IGT. With this flag
enabled variables declared with section attribute do not appear in
correct section in .o files. Since iga64 assembly helper script relies
on it we need to use -ffat-lto-objects in case of files containing
iga64 assembly. According to documentation this option is effective
only in case lto is in use, so it should not affect non-lto builds.

Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/165
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
This patch 'fixes' building IGT with link-time-optimization. I am not
sure it is or should be supported by IGT, but build scripts can be
modified to allow it for testing.
Grepping internet shows at least Gentoo and Arch Linux builds IGT with
LTO, so I guess it is working for them.
---
Changes in v2:
 - added Closes tag
- Link to v1: https://lore.kernel.org/r/20241216-fix-lto-v1-1-1280b17dc70f@intel.com
---
 lib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index 1704ed1e1c17..9fffdd3c6218 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -240,7 +240,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
-	])
+	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
 
     lib_intermediates += lib
     if iga64_assembly_sources.contains(f)

---
base-commit: ee7a3ac616f55f6ed1b959ff951237099bda86d8
change-id: 20241216-fix-lto-8d3bc1488c6a

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

