Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668ECCD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:25:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193BD10E042;
	Thu, 11 Jun 2026 14:25:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WD1xFeYX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DE210E042
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187890; x=1812723890;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b4byY06sFTllvTdhOgN8/ui6T64NeDqbwESbxI2Diyc=;
 b=WD1xFeYXTDtNTtBFV3ko/MXHUk/6ts9uP1AhnDpcbL3b7CvIXJBwb412
 U5qwYkF8Z6z/n0jj3PCXa6RAvK4XSkQDvLtBLZEgKCizVhCfcgag1oPHd
 VY01M181SsJh3X00QXb9S4otKD7FcydWlGxVJ2OJa/xnoEgoyHZVmRXK2
 TmhMolMLQ0iTSVGOM5b7GpwA6ANorio/lcid1op6BGlGkbRL4PnN2E/Wp
 ewmsAq6EnC3MuAHwE22ejbG2JYG4QIRD09rXBO3F5MfVAO3KMce8O5T/N
 jzXjaqdW24IRHvcMIXu0iPQoyqo7lKlxpeVojA35+OzXv0hzLwoF1bKo9 Q==;
X-CSE-ConnectionGUID: 4IBgGcH/Q4WjVzO1XznZ0Q==
X-CSE-MsgGUID: Koyroka6SXugDlRE/a6MXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93487252"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="93487252"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:49 -0700
X-CSE-ConnectionGUID: ui0fqzpqRWGSzqllk+4FDg==
X-CSE-MsgGUID: oqN8E1teTSOLGw3HHPJMBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="270163293"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:24:48 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: janusz.krzysztofik@linux.intel.com, lukasz.laguna@intel.com,
 matthew.brost@intel.com, michal.wajdeczko@intel.com,
 stuart.summers@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] Extend core_hotunplug coverage with open-handles
 unbind/rebind scenario
Date: Thu, 11 Jun 2026 16:24:36 +0200
Message-ID: <20260611142438.260647-1-marcin.bernatowicz@linux.intel.com>
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

This series extends core_hotunplug coverage with a child-process
open-handles unbind/rebind scenario, and updates dummyload spin-start
helpers so the test flow works correctly on both i915 and Xe.

Patch 1 updates igt_spin_has_started() and
igt_spin_busywait_until_started() so Xe-backed runs use xe-specific spin
start detection.

Patch 2 adds exec-fork-unbind-rebind, which starts spinner work in a
child process, ends execution while intentionally keeping child-side GPU
handles alive, then verifies parent-side driver unbind/rebind succeeds.

Marcin Bernatowicz (2):
  lib/igt_dummyload: Adapt helpers for Xe
  tests/core_hotunplug: Add exec-fork-unbind-rebind subtest

 lib/igt_dummyload.c    | 14 ++++++
 lib/igt_dummyload.h    | 11 +----
 tests/core_hotunplug.c | 98 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 114 insertions(+), 9 deletions(-)

-- 
2.43.0

