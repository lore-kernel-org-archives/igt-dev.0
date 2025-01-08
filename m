Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D858E77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 23:00:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D62A310E08D;
	Wed,  8 Jan 2025 23:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Htyt9yj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE6610E08D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 23:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736377227; x=1767913227;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YgGVwkUL+JlAcrvDEotrs7Z6BTA+w0aAt3tK13xB+r4=;
 b=Htyt9yj9YNv3Ab7k7szwt3H/Km6azBGbFDHSH8R/KZvsWE1J2VJ38xpY
 DVfENlCwth4i4TbQKkIpTHXRevuZAYYe4qhmcNSJeLhMcpOKoO0Gfvq40
 zZcaPSvVPVr80LkqSvAaCx6/7ek35TSkypzMWzqqxt5uYhNf3tPiM4FZt
 ZQw5TV0yrTRKqjjxus4FUEIuMzx7+jvJ4nL7qjDa2ZHRFKtByYFR90Rnf
 dmsWKWtVfoZGWzm+BtDu5qsjE+vpG1VAiyMvOTttX817b0rQlA3ImqD7w
 2ol+KwH95SCDophUgdU4Rio1voav+a0+TxH0+i7uB9x3oXRx/O+mh6/5H Q==;
X-CSE-ConnectionGUID: NTD5P+QlTYK/nKtaeu2RrA==
X-CSE-MsgGUID: AqxAw8cTS1uwMQlswhVvIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36736458"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="36736458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 15:00:26 -0800
X-CSE-ConnectionGUID: w1lE3ibZTVC+UwbQEzZh0g==
X-CSE-MsgGUID: 0Res6kFGQuOpSFsrggZNug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107836182"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.64])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 15:00:23 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] meson: Add check for libghe histogram function
Date: Thu,  9 Jan 2025 00:00:17 +0100
Message-ID: <20250108230017.212621-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.47.1
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

From: Mohammed Thasleem <mohammed.thasleem@intel.com>

From: Mohammed Thasleem <mohammed.thasleem@intel.com>

Check libghe for the function needed by igt test at compiling.
It should solve a problem when package version do not match
values set in github repo.

v1: Update subject and description, change message. (Kamil)

Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Nemesa Garg <nemesa.garg@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 meson.build | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meson.build b/meson.build
index 5eda2d582..7c42531d1 100644
--- a/meson.build
+++ b/meson.build
@@ -199,7 +199,13 @@ endif
 
 libghe = dependency('libghe', version : '>=0.2.0', required : false)
 if libghe.found()
+    cc = meson.get_compiler('c')
+
+    if cc.has_function('histogram_compute_generate_data_bin', dependencies: libghe)
       config.set('HAVE_LIBGHE', 1)
+    else
+      message('libghe do not have the required function')
+    endif
 endif
 
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
-- 
2.47.1

