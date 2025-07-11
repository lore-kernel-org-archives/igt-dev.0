Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A50EC83F1A
	for <igt-dev@archiver.kernel.org>; Fri, 11 Jul 2025 20:13:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0510E3C8;
	Fri, 11 Jul 2025 20:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kpwawfxd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58DA110E9C9
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jul 2025 20:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752264782; x=1783800782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Dzk6opvXq4sqe5Nsf0H+Kt1vYHs7DdJ6tCP8fgCru3Y=;
 b=KpwawfxdLsKyE4XX5+wsUXxq22xizRrWGS9a0fruyIP1172MG+qCqcC2
 MIc1Idpry6FKZXwt2+nbTCpVH6+80leC0A3naki0lP/q993QUyNcf0zNj
 mOKJS6WT+z3rbtOd9sM7a2g8UKlROtFpxcojZB47RRPDXhQgL/yRxAxK5
 XgMRE+DSflOFjboBjAXPcRtXU0cVvgtiMZFPxMJRLPdy7GT7+0Lepy2jz
 dafColD5Ko5kdvA/eOJAUwmzyNRfDkN48N2fXfg0SBftj0ooOxg0VY4Kg
 NJvi4Zjml6ys0JOYOW4OuFMSXUVFSdaG+8ZXWwwCiVaL5s2thnmy+2elq Q==;
X-CSE-ConnectionGUID: nW8ZcVEDRoCyUG/GdZOjVA==
X-CSE-MsgGUID: tH95k+b4Tc6dIwLIHhjvYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="42200069"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="42200069"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 13:13:02 -0700
X-CSE-ConnectionGUID: OPddQ2GdQx6BqdouKBHAcg==
X-CSE-MsgGUID: cN5REd+FSEiaaNYg+8Mnag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="156229735"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 13:13:00 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2] tests/intel-ci: Block unsupported downscaling tests
Date: Sat, 12 Jul 2025 01:43:10 +0530
Message-ID: <20250711201310.156705-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
References: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
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

Adds the downscaling test to the blocklist due to failures when
the maximum downscale factor exceeds the 3.0 limit in either
direction.

Bspec: 50441

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/blacklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 6c91f1a70..bb4b8dfec 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -84,6 +84,11 @@ igt@gem_exec_alignment@pi-shared
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
+# Maximum downscale must be less than 3.0 in
+# each direction
+###############################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
-- 
2.43.0

