Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73207CE9D7B
	for <igt-dev@archiver.kernel.org>; Tue,  6 Jan 2026 16:53:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9D10E522;
	Tue,  6 Jan 2026 16:53:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aBUMqISM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C556110E522
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jan 2026 16:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767718425; x=1799254425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v76kOb71ZcWVCg3mGbv28Gek/N6BTamLb5a7ez5387w=;
 b=aBUMqISM4LOohCx21QBdkcHhNMdNzLMgue76Z274z5s8EfO9VJX+8kNz
 EaTXe8eVladJosmp2YKfJoCi4OvsEji7qYeOrmbE0JkI1nLfGOSoCR0cl
 ztNZZgXtAuoN7FjWk2HoTTEeScvXKQSc5O82V1IuYGyn8pf2lc0JyfWTF
 Tp9OLLlmwqFPGLypD8A93pqpGLPVSGjH3lLmupnhOWYShczD8XKW0SDmG
 pfrW7BrYB7zTeyc5tmEkBp/Ih1prPD8MWBkbsl5oJtP4Wz/q2weLpm9Mx
 eIjTZ9GY8Hm2SH9opMVZYmSkj90ee+YHt5TgCyQfUaCpD5vJIfuco1VQB g==;
X-CSE-ConnectionGUID: F8HjrU2lQK+z4veXr+SFQQ==
X-CSE-MsgGUID: NuJlTt6+Sw2tw8okSmR/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68097960"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="68097960"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:45 -0800
X-CSE-ConnectionGUID: /7cOo3PsTDuBOXNxVc4ewg==
X-CSE-MsgGUID: 5qBA1iFxQFqG01RTGjYSOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="202460036"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 08:53:42 -0800
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, riana.tauro@intel.com,
 badal.nilawar@intel.com, kamil.konieczny@intel.com
Cc: anshuman.gupta@intel.com, soham.purkait@intel.com,
 umesh.nerlige.ramappa@intel.com
Subject: [PATCH i-g-t v4 0/3] Improve engine activity accuracy test with
 spinner reuse
Date: Tue,  6 Jan 2026 22:17:58 +0530
Message-Id: <20260106164801.46353-1-soham.purkait@intel.com>
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

      Instead of creating a new spinner during each pass, it's more efficient
to instantiate the spinner once and reuse it by properly ending and resetting
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

 lib/xe/xe_spin.c     | 43 ++++++++++++++++++++++++++++++++++++++++++-
 lib/xe/xe_spin.h     |  2 ++
 tests/intel/xe_pmu.c | 17 +++++++++++++----
 3 files changed, 57 insertions(+), 5 deletions(-)

-- 
2.34.1

