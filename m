Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17842C5B572
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 09:19:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B827D10E102;
	Fri, 14 Aug 2026 09:19:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MWiLPGLe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0B010E3C7
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 09:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786699163; x=1818235163;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TgIpcn7EtE/V3ZcR9hr/bP2O0CR2cns4EATVWiW64tU=;
 b=MWiLPGLep5EggLQJUY1tXbyTh8vtsAsRZ141fQ5Ee/mQ8t0PC3r8kyRG
 q8aHlt47nBcIL7cP/Ykc61yaDO83nBRbAc2QdJw9O6dB5kleol7+t932t
 FAnm+/mnT2tUpMA3Ko4wtpIDvQAOoDx6qyGhPVC75o3mEPVlvd+EpP/2g
 erRYnJaB01yB/X+DtGI48HhK1ATLSDOw35B/1TvPXlWHvXWDDl3yvhsET
 NCGAIs+ZkGJTR1OTwwB8PGYELwXnQx0XBXWgHsxKg5DweBQ+4d0vtlp0m
 sObWdYlVRKd1jqihoqDinfnDeqRSTmpgQknlGr//DriF+EXTS81I0J42L w==;
X-CSE-ConnectionGUID: VWp0XCcNT8+3H8Ua72TwkQ==
X-CSE-MsgGUID: qk0P9pr5SGSCfF6boSnkAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97869338"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="97869338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:19:23 -0700
X-CSE-ConnectionGUID: at3g7gaATG2VefN1fND39Q==
X-CSE-MsgGUID: MUHJgTMOR0mjUPCySgLnXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267666104"
Received: from x299.igk.intel.com ([10.211.131.197])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 02:19:22 -0700
From: Jari Tahvanainen <jari.tahvanainen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mchehab@kernel.org,
	Jari Tahvanainen <jari.tahvanainen@intel.com>
Subject: [PATCH v2 0/2] Update scripts/code_cov_parse_info
Date: Fri, 14 Aug 2026 12:23:24 +0300
Message-ID: <20260814092326.839864-1-jari.tahvanainen@intel.com>
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

Add support changes related function coverage data within 
.info files produced by recent compiler/toolchain versions.

Current assumed/supported .info file is for lcov/geninfo 1.14.
   FN:<line number of function start>,<function name>
   FNDA:<execution count>,<function name>
   FNF:<number of functions found>
   FNH:<number of function hit>

There is change caused by gcc 9 tool chain, requiring lcov/geninfo 2.0.
   https://manpages.ubuntu.com/manpages/noble/man1/geninfo.1.html
   FN:<line number of function start>,[<line number of function end>,]<function name>
   The 'end' line number is optional, and is generated only if the compiler/toolchain
   version is recent enough to generate the data (e.g., gcc 9 or newer)

The format of the function coverage data has changed from LCOV 2.2 onward.
   https://manpages.ubuntu.com/manpages/questing/man1/geninfo.1.html
   First, the leader:
   FNL:<index>,<line number of function start>[,line number of function end>]
   Then the aliases of the function; there will be at least one alias.
   All aliases of a particular function share the same index.
   FNA:<index>,<execution count>,<name>
   The now-obsolete function data format is:
   FN:<line number of function start>,[<line number of function end>,]<function name>

Add i915/display files in only_xe definitions excluding non-xe related
i915/display sources.

v2: fixing name on email for submitter. 

Jari Tahvanainen (2):
  scripts/code_cov_parse_info: add support for lcov/geninfo >1.14
    formats
  scripts/code_cov_parse_info: add display include and exclude in
    only_xe

 scripts/code_cov_parse_info | 141 ++++++++++++++++++++++++++++++++++--
 1 file changed, 135 insertions(+), 6 deletions(-)

-- 
2.43.0

