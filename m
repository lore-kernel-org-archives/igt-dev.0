Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF60C25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 12:36:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B800610E161;
	Fri, 31 May 2024 12:36:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lu9iSL3t";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2388910E12F
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717158980; x=1748694980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hWqe7100Mchb8zpn7C9eD8bbLq3e86P0q3JQr6f0HUE=;
 b=Lu9iSL3t/yUf6mCxrsTB4zAgE8y2m9sy3NcQXM2KIrINX+PwstCtD06P
 /eRd/PJDEIgSvGpV3I+9tTI9EzW67eXuvTJ4/wZfCA+9PBTRR01WCn7xU
 0eLMpcAbcugYYuCLAa/ViisTPZXtEByGcQhmbsdcIx+tm/H2mDACnwtnQ
 NCcl326nvsjX04KYe6a/weIJxJBYCO4TjhYuVBQf/U8tW6vryeMnfSPTx
 +UjPtQwURxOGc8LoSIZiT8xlCJGEYiRvxgMLWVSO2DRR5giujLb1J0WXS
 WHB6vT7mecGInIVdYeQ7Wx9OTMvlpLrl3y87pteCFW9+k9rc27wW7roe7 g==;
X-CSE-ConnectionGUID: QOUB/O5JR3CtuP9IGwbedQ==
X-CSE-MsgGUID: StZAsALiRbSwzHnqYgxERw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13924341"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="13924341"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:36:19 -0700
X-CSE-ConnectionGUID: kz2aYwhTRTeuULBUnkNzCQ==
X-CSE-MsgGUID: 529l+ZjrRC6b7KXV/T4K6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36085215"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:36:18 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2] man: Add --decode to intel_reg.rst
Date: Fri, 31 May 2024 05:11:58 -0700
Message-ID: <20240531121243.1083751-1-lucas.demarchi@intel.com>
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

Commit ce6ce0f60dd1 ("intel_reg: Move decoding behind an option")
added a new --decode option to intel_reg. Make sure the man page also
shows its documentation.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v2: fix typo s/implicitely/implicitly/ and extend commit message

 man/intel_reg.rst | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/man/intel_reg.rst b/man/intel_reg.rst
index d452f7927..059d8834a 100644
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
+--decode is implicitly enabled.
 
 decode REGISTER VALUE
 ---------------------
 
-Decode REGISTER VALUE.
-
-snapshot
---------
-
-Output the MMIO bar to stdout. The output can be used for a later invocation of
-dump or read with the --mmio=FILE and --devid=DEVID parameters.
+Decode REGISTER VALUE. The option --decode is implicitly enabled.
 
 list
 ----
 
-List the known registers.
+List the known registers. The option --decode is implicitly enabled.
 
 help
 ----
-- 
2.43.0

