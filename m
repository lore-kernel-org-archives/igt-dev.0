Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCEC83F17
	for <igt-dev@archiver.kernel.org>; Fri, 18 Jul 2025 15:15:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF32F10E9E4;
	Fri, 18 Jul 2025 15:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mowqjJDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F76710E9E4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jul 2025 15:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752851747; x=1784387747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RL8zadzUNaj0wN8mtarQXtYYVBxwWFWBU10QqsJ55zU=;
 b=mowqjJDTB4H258Pc79wdKLwJ2+4MtgWJQ1QzHAGjVqKkfaXO058C8LX5
 u5fVR1xoyYvY94wnRVVNtYjLc3nS/P44H21jodzezQ4c7UZVeqQuWat8Q
 rky9hKUTJWdImkOjLO52WRlXmpeS2QNr/fHPgCDiucw1w9rQZN9Pndvfy
 geNSnhKKN3M/krXlUoY1ESeE2TTbUpbBpSAQmQlrHhwlQ3GVPTxM73Yww
 vpaPgSEtVPa52D732Df9cVkcu1nX3oD1KwaQVYC2N4pH8hPukS7bXROnX
 xdbw10Z7g2DbV0SHdBwepWm3qXCuM10kPMNq8yFU5UryONhjjrbX9fzzV g==;
X-CSE-ConnectionGUID: qEDgWDAoRAaPp6lsuyfStg==
X-CSE-MsgGUID: j7uEH+2uQ7CUp7DhKnmSkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="54861004"
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="54861004"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:47 -0700
X-CSE-ConnectionGUID: ALBuKqGGT1OEd3aPQN0ejg==
X-CSE-MsgGUID: NZWL59r0SJKw71CixWfSYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,321,1744095600"; d="scan'208";a="195213487"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2025 08:15:46 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Soham Purkait <soham.purkait@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Riana Tauro <riana.tauro@intel.com>
Subject: [PATCH i-g-t v1 2/3] tools/gputop/meson: Fix warning
Date: Fri, 18 Jul 2025 17:15:20 +0200
Message-ID: <20250718151521.105886-3-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
References: <20250718151521.105886-1-kamil.konieczny@linux.intel.com>
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

Fix compilation warning:

tools/gputop/meson.build:2: WARNING: Keyword argument "install" defined multiple times.
WARNING: This will be an error in future Meson releases.

Also while at this, move each option to its own line.

Cc: Soham Purkait <soham.purkait@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tools/gputop/meson.build | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/gputop/meson.build b/tools/gputop/meson.build
index 4766d8496..f82962834 100644
--- a/tools/gputop/meson.build
+++ b/tools/gputop/meson.build
@@ -1,6 +1,6 @@
 gputop_src = [ 'gputop.c', 'utils.c', 'xe_gputop.c']
-executable('gputop', sources : gputop_src,
-           install : true,
-           install_rpath : bindir_rpathdir,
+executable('gputop',
+	   sources : gputop_src,
            dependencies : [igt_deps,lib_igt_perf,lib_igt_drm_clients,lib_igt_drm_fdinfo,lib_igt_profiling,math],
-	   install: true)
+           install : true,
+           install_rpath : bindir_rpathdir)
-- 
2.50.1

