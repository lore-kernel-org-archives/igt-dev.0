Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B05E7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 14:38:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3798410E6A8;
	Mon, 16 Dec 2024 14:38:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aMFw7nG2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FED310E6A8
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Dec 2024 14:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734359926; x=1765895926;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:to:cc;
 bh=oBnfAdCfzKH8wBi1b378TgBL4l+BxYGc0ObgTKkEz6A=;
 b=aMFw7nG2fb6GKv1RgxpQ6TYJqGtLtkoFjvcAJRTwXmoyZdHp951U9rYw
 TOLSjuYYqSXGuGZKLA0NvvTXb3YHGKNVxmlN6XCl5f9DwROeHWSb5mrXg
 gI93geTqd1C0ZgJNrBuSbHFIUY6rqXK1iSKYQ8trTV/Ts8+oUebXKEU32
 GzLyhvu02zfXAztX+dTW4PwuPk1fPC2drIZVpcsWAMtoaX0csUs0uGUXE
 japQdlCIM2uxL6ysJHY8S4jsu4qB9R15cPAmf9ubChvt4I9KiqXd++70A
 QjEaeqcHRF/LBeGom0VyyMQf2ddQK0ASfVtcAht7yRYFQ6U3UZn+TMyLx w==;
X-CSE-ConnectionGUID: bExmR0mXQ82j2PmRDGYBeQ==
X-CSE-MsgGUID: j60BM6lGRMuKrRZKZHBNlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="52265894"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="52265894"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 06:38:46 -0800
X-CSE-ConnectionGUID: 5ZJ+f26tTb2cgb+1/zdRtg==
X-CSE-MsgGUID: zfVJseWjRmKtvbzb3KEHGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101804364"
Received: from lab-ah.igk.intel.com (HELO [127.0.1.1]) ([10.211.135.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 06:38:44 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 16 Dec 2024 15:38:38 +0100
Subject: [PATCH] lib/meson.build: allow build IGT with link time optimization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-fix-lto-v1-1-1280b17dc70f@intel.com>
X-B4-Tracking: v=1; b=H4sIAG07YGcC/x3MSwqEMAwG4KtI1hOwVaR4FXHR1qgBqdI4w0Dx7
 kaXH/+jgFBmEuirApl+LLwnhflUEFefFkKe1GBr2xprOpz5j9u5o5uaEE3rXOw8aPvIpNH7NIz
 q4IUwZJ/i+uy/h8B13ZSq9zFvAAAA
To: igt-dev@lists.freedesktop.org
Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1517;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=oBnfAdCfzKH8wBi1b378TgBL4l+BxYGc0ObgTKkEz6A=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBnYDt0OFO/w5f3OsYfXtmGEVpyc7RBJNabyQoHU+sI
 G8Ba2+GJAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZ2A7dAAKCRAjYrKT3hD918UvC/
 sFZ7KWB8cf0h5xGWyiwMVmyZDmn8JkBun3prBsqFl7DPMSNQtOUa/QvHxgVkJs3dcqCUvuimuU4FM2
 teezz8cWfN3RLIjqITspn6+o8QdroOIAOkUkOsLkihSXeVcJO4cX4UUwJBkh+djgAl6thPWHDqfrWf
 Abw3sBSie4qdiqNUa8bL45PZ9O66aS83weIYDRb2tUbRw9Onfzs204ohDM78Sz+mWnR4zN++edGi8c
 VKLwEjQNZXXFsfVVUdpbqfdHZ7p7wm+hbIsPFLubiA+uD1UNWBMnDc5jAfG9NQSJllE8RGiuhAiTXv
 RW2oOjGyjzDmbqDdESC2sKFo/j+HL53PpCtFKyRQjjehgV7szFJUxNrMOTXBIItQa2OsmQr1+bSxBJ
 FIAmO3eDNX0PrzOpib227EvjHlAokI0NlmCRgTPa8nLL8k2YD9InKonT5R9dnqMQQhh3FVzKJjsRx+
 Kv+LZUk03Uj9kZ9VRFkO+gx1XosNTWWJOX5RZvS/XtQ78=
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

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
This patch 'fixes' building IGT with link-time-optimization. I am not
sure it is or should be supported by IGT, but build scripts can be
modified to allow it for testing.
Grepping internet shows at least Gentoo and Arch Linux builds IGT with
LTO, so I guess it is working for them.
---
 lib/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/meson.build b/lib/meson.build
index beaf43dffc5b..5a2fd9bf310c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -239,7 +239,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
-	])
+	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
 
     lib_intermediates += lib
     if iga64_assembly_sources.contains(f)

---
base-commit: 48a70f6795e6d68b9fae275261ae3b09d3401fe1
change-id: 20241216-fix-lto-8d3bc1488c6a

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>

