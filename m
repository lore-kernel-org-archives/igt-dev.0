Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B39C61DC2
	for <igt-dev@archiver.kernel.org>; Wed, 26 Aug 2026 07:37:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE30B10EC09;
	Wed, 26 Aug 2026 07:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dx4+dVQ2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DFB10EC09
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Aug 2026 07:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787729839; x=1819265839;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OlVSLr8bjyFSUUR899tMIXEkTzOoMWsk9UjJznYLFkU=;
 b=dx4+dVQ2QjIPRJPcDR3KMMlhH0Rsi8mF8K+DhN8isFfz9H8E9u8M2TcL
 en8WgDjsHoPPb6+gwW/i9Vlm4VjNtmGWvcxQIkDZyidsztx4tWb/4sIgP
 MEqxiPRylFoo4kUFw4a+hDLkWpq2ce895lP5j+7O/hTJzZjlzsmEGcxEC
 eeWl4htlGK5u0wVN61+brlV0RKaXT1rD26+j2zNkfnjRjw0wDse1tQxob
 AZxXO3sSOfbwL9lN+Bk9NcNHixc0Pa9mEvyRjjLLdTfTZskaL3Xn0e9CV
 Rs3r3MoOC5YbnxS84H0AqEV9/QXSj5IauyEZVvGFczUob6YdOmocK3IGZ g==;
X-CSE-ConnectionGUID: 2R0RM6zrQbuaoUlQS9uzcA==
X-CSE-MsgGUID: ovWQuxo2R4uGmfBL61uEtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="113741651"
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="113741651"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 00:37:19 -0700
X-CSE-ConnectionGUID: YhmA8W+dQaSg1TC7PSecEw==
X-CSE-MsgGUID: eyWD7EKuSHC3pvDdiP7baw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,244,1779174000"; d="scan'208";a="271296113"
Received: from dut1372bmgfrd.igk.intel.com ([10.211.177.125])
 by orviesa004.jf.intel.com with ESMTP; 26 Aug 2026 00:37:18 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, nishit.sharma@intel.com,
 kamil.konieczny@intel.com, sobin.thomas@intel.com,
 smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v5 0/2] xe_device_sysfs coverage updates
Date: Wed, 26 Aug 2026 07:37:08 +0000
Message-ID: <20260826073710.37283-1-shivtej.eknath.patil@intel.com>
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

This series adds coverage for xe_device_sysfs attributes and
refactors vram_d3cold_threshold helper functions into igt_sysfs
for reuse across tests.

Patch 1 adds reusable vram_d3cold_threshold helpers to
igt_sysfs.

Patch 2 adds xe_device_sysfs coverage subtests.

Shivtej Patil (2):
  lib/igt_sysfs: add vram d3cold threshold helpers
  tests/intel/xe_pm: add coverage for xe_device_sysfs

 lib/igt_sysfs.c                      |  50 ++++++++
 lib/igt_sysfs.h                      |   3 +
 tests/intel-ci/xe.pm.d3cold.testlist |   6 +
 tests/intel/xe_pm.c                  | 184 ++++++++++++++++++++++-----
 4 files changed, 211 insertions(+), 32 deletions(-)

-- 
2.43.0

