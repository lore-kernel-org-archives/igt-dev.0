Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1F8CA100B
	for <igt-dev@archiver.kernel.org>; Wed,  3 Sep 2025 06:03:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A248810E002;
	Wed,  3 Sep 2025 06:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LhGbmYoF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB12210E002
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Sep 2025 06:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756879395; x=1788415395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YswCGdeWFCm86rjrDwTECLuvRRSfGfuA3shBluoNVz8=;
 b=LhGbmYoFVIQIdGONSY5tHzufJAiqryfbZZ8whB8P7Z4S4IoYbmiYbX1n
 Dw5ABGCxgPukVZedlGNMCPitkwUsNi8iakdv7tGnQxriBqgwDz5Dv74tP
 cGgmv8jYlSTcBFfLcTbuqYb7vS3R1ZF0Ea8QpeCjooAjzipN0/wEb7mTM
 ugcXMd17X1zw8I3gd7oUt3z0hYNjcxUp/+iQsfjMhLckguzJiVMncbi4a
 C0ZCKW9CQI1mOmSCK44twFGYs6w6RMzTahboLpROCDwODXTa1tT36lXwT
 QqnaX18HOAO1G+iSOj77eO5+aGW744PwA1PxSo/bNJRKvNRVl+MSygU4p A==;
X-CSE-ConnectionGUID: 8yZZrtl9SqqAZMXMtYF7IQ==
X-CSE-MsgGUID: 5WeHO0qCQ5yyq07Zrf96WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59095232"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59095232"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:03:15 -0700
X-CSE-ConnectionGUID: Gui1774XTwWbPRaOAckCjA==
X-CSE-MsgGUID: Wb/XCq9ERXiFqU+SDOQhyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171059166"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 23:03:15 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_compute_preempt: GPU Compatibility
 check
Date: Wed,  3 Sep 2025 06:03:05 +0000
Message-Id: <20250903060306.1516598-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add a check to verify the GPU version prior to launching the
xe_compute_preempt test. This prevents the unnecessary forking of
multiple child processes that would later be skipped due to a GPU
version mismatch.

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: GPU Compatibility check

 lib/intel_compute.c              | 25 +++++++++++++++++++++++++
 lib/intel_compute.h              |  1 +
 tests/intel/xe_compute_preempt.c |  4 ++++
 3 files changed, 30 insertions(+)

-- 
2.34.1

