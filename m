Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA9C021B2
	for <igt-dev@archiver.kernel.org>; Tue, 25 Feb 2025 06:52:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99B210E586;
	Tue, 25 Feb 2025 06:52:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="edSbCr6N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C3310E583
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2025 06:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740466330; x=1772002330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RXT0+ZVRmp/CTx6IoC9igCA+dFAd+swbWEcLUAKQfpY=;
 b=edSbCr6NlfkKjRaiVCIwSXESQwK0g5/7FClroOydyWzBoeqfGcbbwHI6
 qPwktiG3l0mfBMsFuFiGwcfD94D9/wPPhwvTFBAmNRn2m5ysU/fWd+SqC
 QnKWrKU84ArzX5TZ8tfdP/H9lzHIj9WiXNiShGI1kDqD7ZmrNDCZVlqXx
 063rWimHyC3tRdc4YB0RZ3XoghFM9O0EdyMWusWbXl4MdXHw055yAuqfC
 ev+y1ydRVnZw3aIOyQZcLUzdkyMA6ZH0886CKSeBRN+1pkfJioy1DAiP1
 8tfvBeYdu96d2voE7hV5E48lSKQFXRIfwE19PNfhyFRW+jZT3gszLEegA w==;
X-CSE-ConnectionGUID: IPw0Vxy+QXa0R+lsG645NA==
X-CSE-MsgGUID: TpP0sbXCT2a1aAGl7lMLLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="40442892"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="40442892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:10 -0800
X-CSE-ConnectionGUID: nt7mvLBFRxGfvUHQ+i+alg==
X-CSE-MsgGUID: kjx9B0MqRDOViNgMsCyLYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="120399747"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 22:52:09 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com
Subject: [PATCH i-g-t v4 0/3] Add PMU tests to validate engine activity
Date: Tue, 25 Feb 2025 12:43:08 +0530
Message-ID: <20250225071311.2333393-1-riana.tauro@intel.com>
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

PMU provides two counters (engine-active-ticks, engine-total-ticks)
to calculate engine activity. When querying engine activity
user must group these 2 counters using the perf_event
group mechanism to ensure both counters are sampled together.

Add tests to validate engine activity

engine-activity-idle
engine-activity-load-idle
engine-activity-load

KMD Patch: https://patchwork.freedesktop.org/series/144408/

Rev2: add trailing idle test
Rev3: rebase
Rev4: fix return values

Riana Tauro (3):
  lib/igt_perf: Use shift parameter for format
  tests/intel/xe_pmu: Add PMU test to validate engine activity stats
  tests/intel/xe_pmu: Add idle engine activity tests

 lib/igt_perf.c       |  17 ++---
 lib/igt_perf.h       |   2 +-
 tests/intel/xe_pmu.c | 157 +++++++++++++++++++++++++++++++++++++------
 3 files changed, 147 insertions(+), 29 deletions(-)

-- 
2.47.1

