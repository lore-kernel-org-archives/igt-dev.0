Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F5DEC35FFF
	for <igt-dev@archiver.kernel.org>; Fri, 21 Mar 2025 10:48:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B0610E0BC;
	Fri, 21 Mar 2025 10:48:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cX+2wv5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B43810E0BC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Mar 2025 10:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742554114; x=1774090114;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q59+fLtWrw2yZBYmsKkLyZERjFg1bpIOy6vmMQYdLig=;
 b=cX+2wv5VfELO0CauDTc3Amp6fWtrObbjh7dw+3/fYbj1+NAmVhdxE03t
 IDByJ/DEP9kuZlZC2LOkCD6jZg1PPHDEefOSfduBJJF/nk6AodQnuqtEp
 Wuv6bS13H9O4ztgW5TDfbiqwRQ628y7c5T7GeaP3krFx/xp2+PeJslnw6
 gzCObufmb9khFgDXJGhCVV3V6oW//DwPUFBYBBNrT+yV5MtK9SOA/GC2n
 JjZK4Cmny5xbjkygp/5iPnisNRmuQKGK87kyN2QbQW6U74IKka0pnVLHi
 GaiuJlL/gijIE6fP79jiNuWYhWJZh6bTzIkrj7SzOw4iKr6YFhKy/ckNe Q==;
X-CSE-ConnectionGUID: 9RJ9ATR5TYy3NXZcAr9Mzw==
X-CSE-MsgGUID: CJVSVFGJTJWIeVnSvUGH7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43980308"
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="43980308"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:32 -0700
X-CSE-ConnectionGUID: pmyKQk8HQNmBuKV0n0io+w==
X-CSE-MsgGUID: YjujvT8aTgu4xA7BvOL5cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,264,1736841600"; d="scan'208";a="123542901"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2025 03:48:30 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, satyanarayana.k.v.p@intel.com
Subject: [PATCH i-g-t v3 0/3] Add engine activity tests for functions
Date: Fri, 21 Mar 2025 16:39:55 +0530
Message-ID: <20250321110958.3557106-1-riana.tauro@intel.com>
X-Mailer: git-send-email 2.47.1
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

Add engine activity tests for PF and VF's. Provision the PF and VF's
with execution quantum and sched policy and run workload on functions.

Add two tests

all-fn-engine-activity-load : Run workload on all functions
simultaneously and validate that all engines are equally
and fully loaded.

fn-engine-activity-load: Run workload on one function at a time
with sched_if_idle set to false

fn-engine-activity-sched-if-idle: Run workload on one function at a time
with sched_if_idle set to true. Validate functions use execution quantum
when idle

Riana Tauro (3):
  tests/intel/xe_pmu: move xe perf device to fixture
  tests/intel/xe_pmu: Add engine activity test for all functions
  tests/intel/xe_pmu: Add a test to validate engine activity on a
    function

 tests/intel/xe_pmu.c | 234 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 224 insertions(+), 10 deletions(-)

-- 
2.47.1

