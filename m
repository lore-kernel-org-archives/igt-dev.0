Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C45C5AC67
	for <igt-dev@archiver.kernel.org>; Tue, 11 Aug 2026 13:30:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D954110E40D;
	Tue, 11 Aug 2026 13:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yxz4qDLS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06B010E500
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Aug 2026 13:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786455011; x=1817991011;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RNd/nXw1QAffZw51gKmOz9+pJnFUkJJIGkmwvQuE6j0=;
 b=Yxz4qDLSMXHQLsBEYwV0ldJK9DJPCuwC/Tdug7q3BTMCCs6/OtASPnVQ
 eaLudbyntW3WNtuoYgRLlUhmqahxMsjA0m/5vmnIaoBuYkxY9IQzvl8gX
 R2eHGcRZNqhDRhIU2HiCD9bAExFmkIGUlwfYUmm9pHgCMEF9cFy3aI7LA
 DvaNzOhdRpwtfTflsLDeSIhA/yOprb+xEwhA1D9GE/7C3fiX8w9x7PeoP
 kJrtmaZHniVMmc2eQmq6iw3drm7/Uf6eeAnx3ya6UioKVGUYVvr+7DDG7
 +K8R4Wd6uP8HTNeQcskk0fuK1s4RKeLHFCeSRtJvU/mDYyiDf5pMFS27i A==;
X-CSE-ConnectionGUID: gRnsXYmkTymUPh4Z46hJOw==
X-CSE-MsgGUID: v7AmQ9+1R2+EtI7CMFAvAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87199900"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="87199900"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:30:11 -0700
X-CSE-ConnectionGUID: 7sg/O3ivSEelmCqc3cUYmA==
X-CSE-MsgGUID: MnLsYhkeQeu3bEILk+0OUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; d="scan'208";a="259078017"
Received: from x299.igk.intel.com ([10.211.131.197])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 06:30:09 -0700
From: "Tahvanainen, Jari" <jari.tahvanainen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mchehab@kernel.org,
	"Tahvanainen, Jari" <jari.tahvanainen@intel.com>
Subject: [PATCH 0/2] Update scripts/code_cov_parse_info
Date: Tue, 11 Aug 2026 16:34:09 +0300
Message-ID: <20260811133411.720679-1-jari.tahvanainen@intel.com>
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


Tahvanainen, Jari (2):
  scripts/code_cov_parse_info: add support for lcov/geninfo >1.14
    formats
  scripts/code_cov_parse_info: add display include and exclude in
    only_xe

 scripts/code_cov_parse_info | 141 ++++++++++++++++++++++++++++++++++--
 1 file changed, 135 insertions(+), 6 deletions(-)

-- 
2.43.0

