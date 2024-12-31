Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6DEE7718B
	for <igt-dev@archiver.kernel.org>; Tue, 31 Dec 2024 09:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84C9210E62C;
	Tue, 31 Dec 2024 09:46:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g95mDhx4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C1410E62A
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Dec 2024 09:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735638397; x=1767174397;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0XPlUx7S85yMz/m+320ATJJS96XareTALw2MWkqJXyk=;
 b=g95mDhx4PY9x/e9fH6/kslIJj3cwDAl5dhLIJX+CDYPuQlj25VfB3S7T
 gwIoqNL6mHV8zaGEYjAU5ftN0DnekbuKp1EngPN33jkWpVeHuOdINbhXB
 b4tz7ARZEG7/ZJLhWOKdGOm31lcKBttXVV4bhxYdJVH0pOo4abCn5l3b3
 V9aspEsHiZERjCY9iubsrNsXiLdmxHuB3Z23U14UELb7OWo85gHocUl1W
 r2eoUdGC3/H/UWLa0m2MMQ7q5kJZJ5hq3PSkFgIzADCPfLtpH+OIJK3Y9
 spUbDO+oUk2cIw3KPsx1ceFWKzLM39PCBhxcpoTTYCF8nrNP1q6uo2DU8 g==;
X-CSE-ConnectionGUID: yTT+k6iER6KIIhTj+a/tbw==
X-CSE-MsgGUID: g73NCI52RkaHvS40pPzqwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36078211"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36078211"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 01:46:36 -0800
X-CSE-ConnectionGUID: eoBYMqOyTAGI7C0yptKNUQ==
X-CSE-MsgGUID: ZKpXLKYCSEuV4wYaGKnY6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138354525"
Received: from hchegond-ivm1.jf.intel.com ([10.165.21.208])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 01:46:36 -0800
From: Harish Chegondi <harish.chegondi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, james.ausmus@intel.com,
 felix.j.degrood@intel.com, matias.a.cabral@intel.com,
 joshua.santosh.ranjan@intel.com, shubham.kumar@intel.com,
 kamil.konieczny@linux.intel.com,
 Harish Chegondi <harish.chegondi@intel.com>
Subject: [PATCH i-g-t 0/2] Add tests for EU stall sampling 
Date: Tue, 31 Dec 2024 01:46:27 -0800
Message-ID: <cover.1735637542.git.harish.chegondi@intel.com>
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

The patches in this series add IGT tests for EU stall sampling, a
hardware feature first introduced in PVC and also supported in XE2 and
later architecture GPUs.

The Xe driver patch that adds support for EU stall sampling is under
review: https://patchwork.freedesktop.org/series/142880/

These IGT tests were used to test the above driver patch.

Signed-off-by: Harish Chegondi <harish.chegondi@intel.com>

Harish Chegondi (2):
  lib/xe/oa: Add observation type input to intel_xe_perf_ioctl and
    intel_xe_perf_ioctl_err
  tests/intel/xe_eu_stall: Add tests for EU stall sampling

 include/drm-uapi/xe_drm.h        |  74 ++++
 lib/xe/xe_oa.c                   |  18 +-
 lib/xe/xe_oa.h                   |  11 +-
 tests/intel/xe_eu_stall.c        | 579 +++++++++++++++++++++++++++++++
 tests/intel/xe_oa.c              |  57 ++-
 tests/meson.build                |   2 +
 tools/xe-perf/xe_perf_configs.c  |   2 +-
 tools/xe-perf/xe_perf_recorder.c |   3 +-
 8 files changed, 718 insertions(+), 28 deletions(-)
 create mode 100644 tests/intel/xe_eu_stall.c

-- 
2.47.1

