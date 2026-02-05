Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4612BEA7960
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 03:45:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED2910E79F;
	Thu,  5 Feb 2026 03:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iw0NNrRT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D2010E79E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 03:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770263123; x=1801799123;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x3Ei+Wxfq98+zIRNgfjjdnQDcxOymaA8LVdAShboLHQ=;
 b=iw0NNrRT3h1Jm87nobHz2QF1pkSFdLXdVNRC9zP3snniscGkYHdhfvmt
 wgAt0GwHmHDaT75z3G0IPIObJgTlyzPIrsIEabiQOMzMNPB5CD+MEDAfe
 H+Z+icFJNR58ICML69aVWQslVORrRwyCHgDpAQVzoEkGI3H4K2og9eMoD
 Z99LJyEsixyPP3D8p/A4ztLMUb3rtGPUEftqe88ndbvgn0GnII67LaM+T
 aI31vOVu93KBLBZxtXZD9dVUnb18zEyx8MlyfQnKjrw6Joxwu1DTYjK6J
 FgZRSETot+un1vy9qxVLH5vGcMGvzynrZGHIJPIeKziMb4BNFIjZ6WWnA w==;
X-CSE-ConnectionGUID: aR6jUvZySNOh6HZgBYqeZA==
X-CSE-MsgGUID: nclcENK/Q36KhJZb/SL+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71353129"
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="71353129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:23 -0800
X-CSE-ConnectionGUID: BGDEU4JNQLCBD49H8oeWaw==
X-CSE-MsgGUID: ULNiTGN7Q8S1+2w6rOucBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,273,1763452800"; d="scan'208";a="214886969"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 19:45:22 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 3/3] intel-ci : Unblocklist HDCP type1 subtests
Date: Thu,  5 Feb 2026 09:11:20 +0530
Message-ID: <20260205034120.793193-3-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260205034120.793193-1-karthik.b.s@intel.com>
References: <20260205034120.793193-1-karthik.b.s@intel.com>
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

Unblocklist kms_content_protection@.*type1 subtests as these configs are
now enabled on CI.

Cc: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/intel-ci/xe.ptl.display.blocklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.ptl.display.blocklist.txt b/tests/intel-ci/xe.ptl.display.blocklist.txt
index d92e9ef35..aaf7eb1ef 100644
--- a/tests/intel-ci/xe.ptl.display.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.display.blocklist.txt
@@ -111,10 +111,6 @@ igt@kms_chamelium.*@.*(vga).*
 ##############################################################################
 igt@kms_tiled_display@.*
 ##############################################################################
-# Config not enabled on CI
-##############################################################################
-igt@kms_content_protection@.*(type1|type-1|type-change).*
-##############################################################################
 # Simulation specific test
 ##############################################################################
 igt@kms_simulation_hpd@sim-hpd
-- 
2.43.0

