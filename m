Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B83E6E803
	for <igt-dev@archiver.kernel.org>; Tue,  3 Feb 2026 10:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCFB210E610;
	Tue,  3 Feb 2026 10:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/1p9ELG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9FD10E31A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Feb 2026 10:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770115834; x=1801651834;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DJW1G4Uakvxd47a/8c+YZMxbTLIHf6/tjrpLwEMkb4o=;
 b=P/1p9ELGTVx9hQFfc+4MaJke+GdOtUM31lSRSq+scIlu2T+jdIW9tEkd
 u0Codywyyu6CjQXlSS+r5Gpauu3HSnj2QJukIltBHFPD98C0MH5DBTpWX
 dNraOCw5ZzubK+HXTUOf72BEnHIOk8JUgsmzJ/2di0b7WQbA0AnCU6ayB
 oBlu/4CyJek9ZNDZUS/RPWMxtPMP96VhHAf6p5Qu9UWCQog2mtrWNIIr4
 4sVI45PIUuOHKXGgH9OWxKrloe2Tkx/4He4ShlY2HcpBNMqnCeS9Sw1Cq
 3Db11JK7CWx125etCk4UFoKmc9uBG4y7Npsu2lZ4eNc+fcA//qAhRKUj/ Q==;
X-CSE-ConnectionGUID: J3ZR+eMXR1qn8zTIrdkryw==
X-CSE-MsgGUID: JtCb3y+oR/OVtYloDZTBLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="82708524"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="82708524"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:33 -0800
X-CSE-ConnectionGUID: iDdcN/NzRWauY8d9DBFxzQ==
X-CSE-MsgGUID: wgOkaKWESBeLVlLhgaMYnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="209105159"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2026 02:50:30 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2 0/2] lib/igt_power: Ensure RAPL reads on correct CPU
Date: Tue,  3 Feb 2026 16:19:36 +0530
Message-ID: <20260203104935.3522757-4-sk.anirban@intel.com>
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

Adapt to kernel changes that require RAPL MSR reads to occur on the
same CPU where the perf event was opened. Pin the thread to the target
CPU before reading, then restore original affinity.

This fixes compatibility with kernel changes which enforces
CPU matching for MSR-based RAPL operations.

KMD changes: https://gitlab.freedesktop.org/drm/tip/-/commit/1d6c915819f5b805c35487b6ce5923e31a28266b

v2: Cosmetic changes (Kamil)
    Add description & debug info (Kamil)

Sk Anirban (2):
  lib/igt_power: Ensure RAPL reads on correct CPU
  HAX: Add toggle-gt-c6 test to fast feedback list

 lib/igt_perf.c                           | 43 ++++++++++++++++++++++++
 lib/igt_perf.h                           |  1 +
 lib/igt_power.c                          | 24 +++++++++++--
 lib/igt_power.h                          |  1 +
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 5 files changed, 68 insertions(+), 2 deletions(-)

-- 
2.43.0

