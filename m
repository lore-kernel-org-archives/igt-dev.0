Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A00C021B1
	for <igt-dev@archiver.kernel.org>; Thu, 20 Feb 2025 11:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29E6C10E942;
	Thu, 20 Feb 2025 11:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ia9IFFK0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508B210E93F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2025 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740049503; x=1771585503;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8XdILlGC4vLKdEGJdmzeztUZ5IrZwqfGUfKSiUs9m0U=;
 b=ia9IFFK0nxzMuydMDfywC5Z4vpDpQKYitJWodjJ+qCfAGUj4j0w9Xk9d
 3+0mkvcJl4VXpq/0mLRzXtrqrszaU55MurbZ6udWefF0yHxQV77uap2yY
 kvllebduahwulREqYkfepjq2J8p1l4HmnRjtY78q5eJiHVVHZe9q7CMfP
 2pnNixXryh8jzA9kcSfrA8rgzQvqSowthR7g6MOxabETtXn9jbBBdKt2C
 85krjBNKALLiVH2bCxYkByX71LevTJLa2DGHRqfmpkQVB3ayRYzNAW94S
 hax/Ea68kFKyeaXmkkty1PMAwpQY8BzR4xt9kvoSuFBNAlF63WtJo5JrW w==;
X-CSE-ConnectionGUID: 4ABwQZrjSSapVdcFk/ZwtQ==
X-CSE-MsgGUID: A2Vt+lJfQ66Y4LAJejkgqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41079311"
X-IronPort-AV: E=Sophos;i="6.13,301,1732608000"; d="scan'208";a="41079311"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:03 -0800
X-CSE-ConnectionGUID: yYMn//tiQCaieIkrThzm3w==
X-CSE-MsgGUID: hgJILivwSCuQeicrKD10yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="115904425"
Received: from rtauro-desk.iind.intel.com ([10.190.238.50])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 03:05:00 -0800
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, anshuman.gupta@intel.com,
 umesh.nerlige.ramappa@intel.com, vinay.belgaumkar@intel.com,
 kamil.konieczny@linux.intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v3 0/3] Add PMU tests to validate engine activity
Date: Thu, 20 Feb 2025 16:55:53 +0530
Message-ID: <20250220112556.1585555-1-riana.tauro@intel.com>
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

Riana Tauro (3):
  lib/igt_perf: Use shift parameter for format
  tests/intel/xe_pmu: Add PMU test to validate engine activity stats
  tests/intel/xe_pmu: Add idle engine activity tests

 lib/igt_perf.c       |  13 ++--
 lib/igt_perf.h       |   2 +-
 tests/intel/xe_pmu.c | 157 +++++++++++++++++++++++++++++++++++++------
 3 files changed, 145 insertions(+), 27 deletions(-)

-- 
2.47.1

