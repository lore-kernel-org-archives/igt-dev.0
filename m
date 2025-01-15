Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92222C02180
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jan 2025 07:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2254F10E4DD;
	Wed, 15 Jan 2025 07:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LN1w7+sh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0F0A10E4DD
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jan 2025 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736925046; x=1768461046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2sU5j/rY6gisITCLNaS/sVLq0o0GdauXK+mj7Lo83gA=;
 b=LN1w7+shkj/m00dp9IcirTut7NFCoUWxZOO3yIerG3G/F9sMPmEdUBs0
 E16Ywq4crUJVcosoFu0OL74lzZChf5tB/ny92GrnugbpzhIpN8YG7HKCd
 /UuTZoZXtVKU5CCsBOUPy14CKKy6qYiDqLZHjKEjt7HGGl2EEaE4k1zun
 uq3Bl69t2Lum9D6zcC/MZWclD1AyHHfnLKrxTwdY/JmmbQiD7npMRjZoR
 HaJ1GQ7pQ1k35wn3RbElB2jVvQWAP3AKR8ptIpckXU+VobWGTcwyOsK9M
 US1iNJt2lw3lI0N6uohPwE5XAb8XlU725YCEYGQCCRzr+gyb4H8BBDZMm A==;
X-CSE-ConnectionGUID: KLJmiqM8TJicpoaGsmr5pQ==
X-CSE-MsgGUID: D0WrILcxTh60vFdIFY62CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="40927146"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="40927146"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:44 -0800
X-CSE-ConnectionGUID: S/L0KLH4TF6gL0BlhtI6Kw==
X-CSE-MsgGUID: S6HlB9C3QlCVUDma0F8NDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; d="scan'208";a="104881237"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 23:10:41 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 soham.purkait@intel.com
Subject: [PATCH i-g-t 0/3] Add tests for per-engine-class activity
Date: Wed, 15 Jan 2025 13:00:37 +0530
Message-ID: <20250115073040.1852977-1-riana.tauro@intel.com>
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

PMU provides two counters (engine-active-ticks, total-ticks)
to calculate engine acitivity. When querying engine busyness,
user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

Add basic IGT test to validate per-engine-class activity

KMD : https://patchwork.freedesktop.org/series/143138/

Riana Tauro (2):
  lib/perf: Add helper functions to read format entries
  tests/intel/xe_pmu: Add test for per-engine-class activity

Vinay Belgaumkar (1):
  tests/xe/pmu: Add pmu tests

 lib/igt_perf.c       |  71 +++++++
 lib/igt_perf.h       |   4 +
 tests/intel/xe_pmu.c | 458 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build    |   1 +
 4 files changed, 534 insertions(+)
 create mode 100644 tests/intel/xe_pmu.c

-- 
2.47.1

