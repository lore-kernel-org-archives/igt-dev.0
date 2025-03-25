Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04657C36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 17:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A489E10E5BF;
	Tue, 25 Mar 2025 17:24:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ix8IQ4Jq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14FD10E5BF
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 17:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742923491; x=1774459491;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tojg9s3IFTUEObKybnS1gLku8bqzRs7a4WunT3i2muk=;
 b=ix8IQ4JqfHwrFBXNd0gwx85Q/BK3fr3V3+tb5tHriKJR5F9H/A9uK9Jt
 etM0VdGpY8iW6qRWOSp6+BlSNGgmF+We+vlkeAViajkdT7C9+gNMiOdrj
 pbavJ/6qPll0yhuhX8EOoVi8Y/9xeJtKUbpBxdVLAS7N75EmBwNyydkdt
 ZGmisbLadDcBLqEwwzoLVYk69DQVHQ6h2NECOb9LpISTpOVjMFgCnTQUW
 Dqls943qh/JIQrhQZCO60RbHBZ+dGVZ2lQiFc7M3UaIPm+/iYMft1Qs1e
 xX5Wm+u+Nz9zaMdjzDl0ksvI67ujWav0k42s0V7NMMQs4/IN57YseBjIb w==;
X-CSE-ConnectionGUID: nvn/9kz8QoC2P2Uy5vIMYg==
X-CSE-MsgGUID: 8otZ4rZTQcOoI1ef9y4YZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44197745"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="44197745"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:51 -0700
X-CSE-ConnectionGUID: xjWmayJtQhyu/lIcBcAIqw==
X-CSE-MsgGUID: CHdp4Zv1S1GhP5/6moX1JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="129288042"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 10:24:48 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 0/3] Add engine activity tests for functions
Date: Tue, 25 Mar 2025 23:16:19 +0530
Message-ID: <20250325174622.155975-1-riana.tauro@intel.com>
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

Add three tests

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

 tests/intel/xe_pmu.c | 248 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 238 insertions(+), 10 deletions(-)

-- 
2.47.1

