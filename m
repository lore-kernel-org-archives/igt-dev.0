Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0F0C43458
	for <igt-dev@archiver.kernel.org>; Wed,  1 Jul 2026 12:13:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77B010EEC5;
	Wed,  1 Jul 2026 12:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fUTrpmUn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A13910E9EE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2026 12:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782907935; x=1814443935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8G7WllHquQLDwEKRQRyb4t3fT53cz4AbfqsxtWGZZsM=;
 b=fUTrpmUnuRGXjxQDKs7jCNFKw9oIIUYoFeXO00ImKvHjWkIo7hjYw/Jk
 JMhw1LL99xxDaDtW0KzCFlfGCtgiHxX9KQdcDFDWcdUy4Ejkcz204Wq80
 zBCJzez5Oy3cln2zmIv0GCeazlwWKQ4vE3CPad8xudFdnXEdTGeg/kW0O
 J0DKxDUEJfsAjXn+Pzjzzca5wMppAL16gvyRzWCOfvwZw9Zobt3GMlCof
 XCsLxptM6I6UR2Guac0wJ7Q8Ar2O2u6iWbMQfGOhtgEGRaTMuSiCjPzL4
 B9pRMVce4KSnrSFptueOOnldySc22Z6EtgBAk0AhWjMaTVyN79h+YZJTy w==;
X-CSE-ConnectionGUID: +iAEnDoPTd+nNWnHflxyDw==
X-CSE-MsgGUID: 38TcPgYwRCOKKUMoiD9tWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="83414377"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="83414377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:15 -0700
X-CSE-ConnectionGUID: u/mfzl+WQ/G4zg5nejE0xQ==
X-CSE-MsgGUID: YNSJhYFhTfOJP5EAV4polA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; d="scan'208";a="254477281"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.244.55])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 05:12:14 -0700
From: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Subject: [PATCH v4 i-g-t 8/8] meson: Remove Xe EUdebug
Date: Wed,  1 Jul 2026 14:11:49 +0200
Message-Id: <20260701121149.16639-9-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
References: <20260701121149.16639-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Remove Xe EUdebug from meson and meson_options, as there are no EUdebug
files present.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
---
 meson.build       | 2 --
 meson_options.txt | 5 -----
 2 files changed, 7 deletions(-)

diff --git a/meson.build b/meson.build
index e09122a09..cb6dea30e 100644
--- a/meson.build
+++ b/meson.build
@@ -90,12 +90,10 @@ build_chamelium = get_option('chamelium')
 build_docs = get_option('docs')
 build_tests = not get_option('tests').disabled()
 build_xe = not get_option('xe_driver').disabled()
-build_xe_eudebug = get_option('xe_eudebug').enabled()
 build_vmtb = get_option('vmtb').enabled()
 with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
-build_info += 'Build Xe EU debugger test framework: @0@'.format(build_xe_eudebug)
 build_info += 'Build VM Test Bench: @0@'.format(build_vmtb)
 
 inc = include_directories('include', 'include/drm-uapi', 'include/drm-uapi-experimental', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
diff --git a/meson_options.txt b/meson_options.txt
index e23402b36..fc824dda9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -42,11 +42,6 @@ option('xe_driver',
        value : 'enabled',
        description : 'Build tests for Xe driver')
 
-option('xe_eudebug',
-       type : 'feature',
-       value : 'disabled',
-       description : 'Build library and tests for Xe EU debugger')
-
 option('vmtb',
        type : 'feature',
        value : 'disabled',
-- 
2.34.1

