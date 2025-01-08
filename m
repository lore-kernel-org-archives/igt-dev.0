Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C2DE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 15:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8717E10EBE8;
	Wed,  8 Jan 2025 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gm2IN2Ny";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5050810EBE8
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736349382; x=1767885382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PTE0OImZHqngIwLzS/8gYQRXC6FDCEhhjXPWMt8MJSs=;
 b=gm2IN2NyC2AAAyL3gvd2VhcOFLon5mlCNFeiiqhu+Q5FWEhx+LyZ8XFX
 R7C8D6l8AAZEpZK9kYs3507p2Qc6YTGAbdXojTYs8C4/5W2fXnAZIY9Vp
 sAxjfbff44iFsnWL2meHvVWZ4XAozeNtbQLSxSbYFi458EFlc21aMUmpq
 PCGEhTtPt9Vj+Zjwfqg/Q7XIJ+N24GRVnkA/5bwyF+pM6X8vhRugG6Dri
 olIbOk93rz/mQILSBNyjCVvwWlNL0n5e/LFHQqSOHVIF50qmBtoFOHe4v
 a+f81gogrUTW+eh9+aClmyt6/CfZ0+ve4LdNO2zIR8SnlPNQkbJEaUEOd Q==;
X-CSE-ConnectionGUID: mpEPLoh3S72Rrcr+JbR2sQ==
X-CSE-MsgGUID: GQi8lAo7RWimfjHW5QFVyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36742528"
X-IronPort-AV: E=Sophos;i="6.12,298,1728975600"; d="scan'208";a="36742528"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 07:16:21 -0800
X-CSE-ConnectionGUID: uZWHf43jQO+CqSKULaKghA==
X-CSE-MsgGUID: or3UfyaOStijd/YrqJzC2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107743429"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2025 07:16:19 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, lucas.demarchi@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add check for libghe version
Date: Wed,  8 Jan 2025 20:46:06 +0530
Message-ID: <20250108151606.333202-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250108150448.329219-1-mohammed.thasleem@intel.com>
References: <20250108150448.329219-1-mohammed.thasleem@intel.com>
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

Update check for libghe version to avoid compilation issue.

v2: Update version check and remove warning message. (Lucas)
    Print messae at api else check. (Kamil)
v3: Remove special case and update dependency declaration. (Lucas)
v4: Update subject and discription.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 meson.build | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8b2a2a64a..3b6988cd6 100644
--- a/meson.build
+++ b/meson.build
@@ -197,9 +197,9 @@ else
 	chamelium = disabler()
 endif
 
-libghe = dependency('libghe', required : false)
+libghe = dependency('libghe', version : '>=0.2.0', required : false)
 if libghe.found()
-      config.set('HAVE_LIBGHE', 1)
+  config.set('HAVE_LIBGHE', 1)
 endif
 
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
-- 
2.43.0

