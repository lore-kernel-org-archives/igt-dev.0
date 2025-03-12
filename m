Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF3C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 06:03:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5FF10E09F;
	Wed, 12 Mar 2025 06:03:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q7cNcGSa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F0610E09F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741759396; x=1773295396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ONUhAByVBW+TxDYPDuFRA+pIJDDSB24zR+VQowuWaZ0=;
 b=Q7cNcGSa3A9awyM5x5j6sDuGzm9E2BgTopZtb/CU6qvGRUy3erVfXP1t
 bjDQMwrB03U5m/zpgVrgP16cAmDcAmd+IjTcZPKAOfMwVzFDyLiZ0ZF4L
 2jk3l4o99aiZ42VDg7MJxJbOTNawFhW8+GLAH5Xu5kPZzpHLGIH2ato3Y
 mlKX2edvdoLGmLKmCxgEk3l/qVqao+JXbsizAp6miUajbzWVGsnsgyB38
 8VPqr8LP1vgaT7utc+6BJz5jUoP6U0/fBCpS82BAU61xQ2OYQkQ/1AC/I
 7hjFiC3jV2VJ37JLZmxn9gsv3mF2vPnZ0UuwSU3Y0Nnz2zBIMjdrSppHE g==;
X-CSE-ConnectionGUID: 8oRuMEh3RNGCikmy5jel9g==
X-CSE-MsgGUID: bFTGUjoRTQye+/hjHnToKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65284476"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="65284476"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:16 -0700
X-CSE-ConnectionGUID: O3tunchVT1CimNhKZED0EQ==
X-CSE-MsgGUID: elHS42RVQF+wuWR1ouapaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208";a="151354399"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 23:03:13 -0700
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, lucas.demarchi@intel.com,
 michal.wajdeczko@intel.com, soham.purkait@intel.com
Subject: [PATCH i-g-t v2 0/2] Add engine activity tests for functions
Date: Wed, 12 Mar 2025 11:54:29 +0530
Message-ID: <20250312062431.2238409-1-riana.tauro@intel.com>
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

fn-engine-activity-load: Run workload on one function at a time.
With sched_if_idle set to false, workload uses the execution quantum
of idle functions.

Riana Tauro (2):
  tests/intel/xe_pmu: Add engine activity test for all functions
  tests/intel/xe_pmu: Add a test to validate engine activity on a
    function

 tests/intel/xe_pmu.c | 197 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 187 insertions(+), 10 deletions(-)

-- 
2.47.1

