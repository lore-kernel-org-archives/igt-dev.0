Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEAFCD6E4D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Nov 2025 13:00:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83D010E056;
	Thu, 13 Nov 2025 13:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5xmd+36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2EC10E056
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Nov 2025 13:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763038809; x=1794574809;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ecjYmxZKmpxPrN7CEpHtodHASo760ylm5keIA0cwZU8=;
 b=H5xmd+36YohVa9zg3ALG4ZiwcQKnBfuiXniXRnMRJOk69/3EfkQJeHBc
 cdmskVZD/60JYYswpVhzfhVpNoxY/Q8Q7Lh67kHiaJ+QGT1xfhaQiMMfy
 imMDw5xUdUdawmMURhNFqy8BcwuZZdFhumBChW5/0XE9I5+dPzEc/8BkY
 UmfeAzrhdskAluHOy7R/M6O2aK9NnhBS5Wjjn5zJBvS12vQmPRbYxFI0R
 PacavXmV1qes09M17t+qU/km6f0ZuEWlLsYFExD4Cy80SIYUeEXJuMzty
 eQ9VHjHQUZ60z4CKVMHN/46jtdLSoxgos+W/F0yHlvKnZEdQA5zbom016 A==;
X-CSE-ConnectionGUID: yvbC2wWHQ5qj6nF2e62A2A==
X-CSE-MsgGUID: BXbLtoKGRhiZz3awkzhYbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64124110"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64124110"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:09 -0800
X-CSE-ConnectionGUID: b99R41/kSeWx55NriJalQA==
X-CSE-MsgGUID: uocT+tgqTna0Sixe2U579g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194493159"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 05:00:06 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 lucas.demarchi@intel.com, umesh.nerlige.ramappa@intel.com,
 kamil.konieczny@intel.com
Subject: [PATCH i-g-t v1 0/3] Improve engine activity accuracy test with
 spinner reuse
Date: Thu, 13 Nov 2025 18:19:33 +0530
Message-Id: <20251113124936.3878794-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Instead of creating a new spinner during each pass, it's more efficient to
instantiate the spinner once and reuse it by properly ending and resetting
it between iterations.
This approach reduces the overhead associated with repeated spinner creation,
saving time across multiple passes. By eliminating the cumulative time spent
on spinner initialization (i.e., creation time * number of passes),
the spinner's active duration more accurately reflects the actual engine busyness.
This leads to more precise measurements of the percentage of engine busyness in
terms of spinner running time.

With this change engine-activity-accuracy test result clearly shows the difference:

Before spinner reuse :

Starting subtest: engine-activity-accuracy-90
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.90% (81.03% vs 83.93%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.598s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.81% (83.06% vs 85.87%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.684s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.04% (83.83% vs 85.87%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.667s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.15% (83.99% vs 86.14%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.647s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=-2.00% (83.59% vs 85.60%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.664s)
Subtest engine-activity-accuracy-90: SUCCESS (8.264s)

After spinner reuse:

Starting subtest: engine-activity-accuracy-90
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_RENDER0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.03% (89.45% vs 89.42%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_RENDER0: SUCCESS (1.560s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COPY0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.02% (89.56% vs 89.54%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COPY0: SUCCESS (1.559s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_COMPUTE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.02% (89.42% vs 89.40%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_COMPUTE0: SUCCESS (1.571s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.01% (89.28% vs 89.27%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_DECODE0: SUCCESS (1.581s)
Starting dynamic subtest: engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0
calibration=500ms, test=1000ms, cycle=100ms; ratio=90.00% (90000us/10000us)
error=0.01% (89.37% vs 89.36%)
Dynamic subtest engine-DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE0: SUCCESS (1.583s)
Subtest engine-activity-accuracy-90: SUCCESS (7.859s)

Soham Purkait (3):
  lib/xe/xe_spin: Introduce xe_spin_reset
  lib/xe/xe_spin: Export xe_spin_sync_wait
  tests/intel/xe_pmu: Refine engine activity accuracy test

 lib/xe/xe_spin.c     | 38 +++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_spin.h     |  2 ++
 tests/intel/xe_pmu.c | 11 ++++++++---
 3 files changed, 47 insertions(+), 4 deletions(-)

-- 
2.34.1

