Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D91CE77188
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jan 2025 09:55:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C183E10E5F9;
	Mon,  6 Jan 2025 09:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BtgybcNs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B967A10E5F9
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jan 2025 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736157303; x=1767693303;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z5BKQUt0hOQhtbJ6D0LtjVymbeHR0H6trXp1tN8ubMg=;
 b=BtgybcNsR0SbnS+r1BThp1z+32bEwtFco2+E4U2WPbJwh1pqK9apZkM7
 SzFL7fhi2fguqpmL4NMmTMOXAOhr++j/N/ABgbsMxlQJjkF6QuiastAGk
 /QSxrxPdH9b0glQlyjPQhXz9QrsmRjUWeUhsd05r4v3ELtmlnnsh9w/uX
 1lONhcTcBiKcTlJBIz+Dc4rIcCik8q8nKXJk2+PJEbpnHSNtFH8LZgR6Q
 KDkY60NetI3k2rM2cU1lLNUJUEIrnIjJI2ST6TNQVY1Fenpwy9u4gz33L
 X1wcwCVqFc8+ni2UBDsN+NeRgpXBcIaZ8TzI71uTtitFX4pWzWy6FNGgq w==;
X-CSE-ConnectionGUID: /tWiA/ryTwGUyuK57X5XWQ==
X-CSE-MsgGUID: YFJzL23qSZWMKvWh/iXiNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="53719115"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; d="scan'208";a="53719115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2025 01:52:15 -0800
X-CSE-ConnectionGUID: ryMxS0I/ROSplT8GRNo1rg==
X-CSE-MsgGUID: upznA7eOTm2/rqijdR2qxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133312260"
Received: from dg2adlp-alder-lake-client-platform.iind.intel.com
 ([10.145.162.161])
 by fmviesa001.fm.intel.com with ESMTP; 06 Jan 2025 01:52:13 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t] tests/kms_histogram: Add check for ghe api call
Date: Mon,  6 Jan 2025 15:21:54 +0530
Message-Id: <20250106095154.243459-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.25.1
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

Check ghe algo for the function called by ghe igt while compiling.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 meson.build | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 8b2a2a64a..96f010fe2 100644
--- a/meson.build
+++ b/meson.build
@@ -198,8 +198,19 @@ else
 endif
 
 libghe = dependency('libghe', required : false)
+
 if libghe.found()
-      config.set('HAVE_LIBGHE', 1)
+
+	cc = meson.get_compiler('c')
+
+	if cc.has_function('histogram_compute_generate_data_bin', dependencies: libghe)
+		message('libghe provides the required function')
+		config.set('HAVE_LIBGHE', 1)
+	else
+	warning('libghe does not provide the required function')
+	endif
+else
+	warning('libghe not found')
 endif
 
 build_info += 'Build Chamelium test: @0@'.format(chamelium.found())
-- 
2.25.1

