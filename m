Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A645CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 17:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CAE10E305;
	Wed, 10 Sep 2025 17:20:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lLZOlgvG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D9B10E305
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 17:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757524808; x=1789060808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HuqQthdVqpV2jLTK4pwagR44cfay2TqNt8H1k0laP9o=;
 b=lLZOlgvG1IMFN2pnPAqk/0J1k0kLskzYw5eUk9spCUyL5rZabg/OChuh
 DmBqgloD5zRqjdo0AF8I9LX+C+jHa0XlcQ7lk/ozkU0l+dAXu7sYJXTaS
 DJQ6BOXZ5+B2+MdzccsvBAyJYLQ3EwmBnWxP0xFc0btNXujniMfyGbUEP
 EEyUi1/6SZw3cmUVP9xC3vIAmOAT3JlG9ZhxcbjVPxbnlMF7s40YtvvLm
 CK7W9+1DEhfIOLZ7Tv7pLqwZDuCrKT1akMdPv2uICSM4pDL5YUT0Qumoq
 cs5f90eOsC49CUzdAQ2g6ptfNM0SZKQs07dti4Pq/sk4jECHefznK0YRO Q==;
X-CSE-ConnectionGUID: l1qwnSGbRkeP1Up2auj8jg==
X-CSE-MsgGUID: pWjoXxSISjOeeVRd8vUmjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59068241"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59068241"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:20:08 -0700
X-CSE-ConnectionGUID: wKVThQXMTwenMGNlvwI5ew==
X-CSE-MsgGUID: FHxTHh2ET/CZ/uPzOJLGZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="173360251"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:20:08 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH v3 i-g-t 0/1] tests/intel/xe_compute_preempt: Compute
 preemption check
Date: Wed, 10 Sep 2025 17:19:58 +0000
Message-Id: <20250910171959.1852534-1-sobin.thomas@intel.com>
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

On platforms like PVC that lack walker mid-thread preemption, running
tests in forked threads can cause inconsistent states due to mid-
execution igt_skip calls. This patch adds a kernel preemption check
at the start of each subtest to ensure consistent behavior. If the
GPU lacks required preemption, the test is skipped gracefully.

v2: Moved compatibility check to igt_fixture per review.
v3: - Added thread group preemption and WMTP checks;
    - Introduced enum flags for preemption types. [Zbigniew]
Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>

Sobin Thomas (1):
  tests/intel/xe_compute_preempt: Compute preemption check

 lib/intel_compute.c              | 22 ++++++++++++++++++++++
 lib/intel_compute.h              |  7 +++++++
 tests/intel/xe_compute_preempt.c |  6 ++++++
 3 files changed, 35 insertions(+)

-- 
2.34.1

