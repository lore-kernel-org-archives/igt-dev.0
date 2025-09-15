Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79ECCCA101F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Sep 2025 05:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA42210E2AD;
	Mon, 15 Sep 2025 05:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SalQUreb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B42B10E2AD
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Sep 2025 05:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757914279; x=1789450279;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=63rAlj6gBJu71rtW7bwXPvW398dwwwkRKGTavuSZhzg=;
 b=SalQUrebIO6MOz3VfmqG3EMYM0i1eQAlqCIA7Iiy+uy+gJ7pcdoJXO3l
 59VCx+IuRvnyqldWOFY5H10L8u6rpTo/RSXLVklIusNsj9mY6awOTfL3t
 DVWxBZAw3c5XHE2dF9+lxLgis1b9UXGHEy2OwdTow5T75orasW7y7G6d1
 b++CSMIEVglsv1sN8f4BZoAAjRxkMWzpI+XYAow/9jho1h8Ysfz3LtNBU
 wn7lEWqcEc4JeUf+utZuydWPuYICd6R7h+X1nhXrM5CUdExUwOLPTquYl
 NugWCOuBI62vB7k+lHgfX/rcIBnL1IeOo95oCQDUDP+a8nl306/CaaeY7 A==;
X-CSE-ConnectionGUID: KBjG5DBbSDOEQ9ZOFIlWKg==
X-CSE-MsgGUID: s1C2I9f5TqKixgg1CmJbtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60217286"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60217286"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2025 22:31:18 -0700
X-CSE-ConnectionGUID: 8HGP4SuKQEGgyQb7JT4CMQ==
X-CSE-MsgGUID: RfSYFH2GQ7+KzZX5jzhMeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; d="scan'208";a="205494061"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2025 22:31:17 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org,
	kamil.konieczny@intel.com
Cc: zbigniew.kempczynski@intel.com,
	Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t 0/1] tests/intel/xe_compute_preempt: Compute preemption
 check
Date: Mon, 15 Sep 2025 05:31:06 +0000
Message-Id: <20250915053107.10980-1-sobin.thomas@intel.com>
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

On platforms (like PVC) that do not support walker mid-thread
preemption, running tests in forked threads can lead to inconsistent
states due to igt_skip being called mid-execution. Made changes to
perform kernel preemption check at the beginning of each subtests.
If the GPU version does not support the required features, the
test is skipped gracefully, ensuring consistent behavior across
different platforms.

v2: Fixed review comments to move the compatibility check
    into the igt_fixture.

v3: Added check for thread group preemption and WMTP.
    Added enum flags for preemption type as per review . [Zbigniew]

v4: Added check for preempt inside __run_intel_compute_kernel_preempt.
    Refactored the code into functions.

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: Compute preemption check

 lib/intel_compute.c              | 50 ++++++++++++++++++++++++++++----
 lib/intel_compute.h              |  7 +++++
 tests/intel/xe_compute_preempt.c |  6 ++++
 3 files changed, 57 insertions(+), 6 deletions(-)

-- 
2.34.1

