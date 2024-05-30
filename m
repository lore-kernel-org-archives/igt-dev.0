Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF13C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 19:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E0012AF5D;
	Thu, 30 May 2024 19:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EBdvUUVp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BF512AF5D
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 19:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717097606; x=1748633606;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=w7MBioKNTEwxaQRfjCRfx3tzBcgHEi0QuvdW/2sle+M=;
 b=EBdvUUVp0df68JVlTb22nAvkw0Q6oX3w2sBS9IpUJhi7Bw1smXfMK9kZ
 wNEKGVlk7X8bOWS20ihz4Zh3SWf08v3yf1Z87s004cAQBQ82OE6DPBqFI
 WIDavmd4zf/acQDe47JDh2vgMrUh4zBVATrqYRbpL4BXiqIJBKDy7AWHc
 tkMdDKN38cDETcR8sJWdDyASJvoWSQUTfax5r3O5LfMY8gEwAZ4/zgmcT
 zTnu2+HekII/QXC5bRXCRm6mm0NDD8uweKb7jEKrngkgTMVcZ100iQ1em
 l2vGI8f9yMBvCrQUiPO6fRxAoD0OgFo5/rMcLdQWm7ZxZwD9qeLZEHfaP w==;
X-CSE-ConnectionGUID: tBT2Z8aTQt6k6J1Rfyy09w==
X-CSE-MsgGUID: ruP53pHDQmGQ8MlINBvAsQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13452021"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="13452021"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:33:25 -0700
X-CSE-ConnectionGUID: w9lx3EiHROeEAeEcr/9uRw==
X-CSE-MsgGUID: AAnHr5tNTfaI+c4PdkirFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40381766"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:33:25 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] man: Add --decode to intel_reg.rst
Date: Thu, 30 May 2024 12:33:25 -0700
Message-ID: <20240530193325.1072381-1-lucas.demarchi@intel.com>
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

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 man/intel_reg.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/man/intel_reg.rst b/man/intel_reg.rst
index d452f7927..0e6c49927 100644
--- a/man/intel_reg.rst
+++ b/man/intel_reg.rst
@@ -41,8 +41,13 @@ Some options are global, and some specific to commands.
 --binary
     Output binary values.
 
+--decode
+    Decode registers. By default it only uses the raw offsets, unless
+    it's a command that would otherwise not work without it or another
+    option forces it enabled. See COMMANDS below for details.
+
 --all
-    Decode registers for all known platforms.
+    Decode registers for all known platforms. This option implies --decode.
 
 --mmio=FILE
     Use MMIO bar from FILE.
@@ -53,7 +58,7 @@ Some options are global, and some specific to commands.
 
 --spec=PATH
     Read register spec from directory or file specified by PATH; see REGISTER
-    SPEC DEFINITIONS below for details.
+    SPEC DEFINITIONS below for details. This option implies --decode.
 
 --help
     Show brief help.
@@ -76,23 +81,18 @@ Write each VALUE to corresponding REGISTER.
 dump [--mmio=FILE --devid=DEVID]
 --------------------------------
 
-Dump all registers specified in the register spec.
+Dump all registers specified in the register spec. The option
+--decode is implicitely enabled.
 
 decode REGISTER VALUE
 ---------------------
 
-Decode REGISTER VALUE.
-
-snapshot
---------
-
-Output the MMIO bar to stdout. The output can be used for a later invocation of
-dump or read with the --mmio=FILE and --devid=DEVID parameters.
+Decode REGISTER VALUE. The option --decode is implicitely enabled.
 
 list
 ----
 
-List the known registers.
+List the known registers. The option --decode is implicitely enabled.
 
 help
 ----
-- 
2.43.0

