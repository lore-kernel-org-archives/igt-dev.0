Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F8410F9972
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 20:21:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9215E10E260;
	Wed,  8 Apr 2026 20:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP5rvwF6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C6D10E260
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 20:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775679681; x=1807215681;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BW9CLYr3fTvKxd77Siaz88XX2knCwFuGbeWxzstPUuA=;
 b=LP5rvwF6l6aOmp4ZeckhnzwYHF3oO5BSPQjifJQIThlPr40ZSYC/aTtM
 Eu1l0rmERqzbEC7R2jZb4ESGhQAk+fgpDidEPZEUoNq6JXkeLpe1reZc0
 MtqCA/47y8A7Gw34XfGd8fKjzGlj/coYYZ4zcV5QT+HwVUBYYiJxJxDHW
 wplST5cQ1+xy0iKwdBQXZ1bBic9GtDQJdk4fav1/mPb6hfr08RBxDA7u1
 lEk+vM/VH+yDh365HKiXwUhO4PK5+ZHEfsSjhUgk2QXDJ9Of+42n2sofg
 aS8xrA4r31F1CMACifivSu7UQZKBaH8nwYYD5iiDBTAT0UxW5UxBXLy0c w==;
X-CSE-ConnectionGUID: Mr8Gu5IrTVuiv8GBTWIAlQ==
X-CSE-MsgGUID: 5qJ3aVveRGSyO1UBaPT4Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75713364"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="75713364"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:21 -0700
X-CSE-ConnectionGUID: k0xw5FvsSEqqtvN4ITIoYg==
X-CSE-MsgGUID: FmCrC+xYRxuzBZuHLdyB8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="223810467"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 13:21:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 0/7] igt: for_each_connector_mode() cleanups
Date: Wed,  8 Apr 2026 23:21:06 +0300
Message-ID: <cover.1775679624.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Make the for_each_connector_mode() helper a bit nicer, and use it more.

Jani Nikula (7):
  lib/kms: pass mode parameter to for_each_connector_mode()
  tests/intel/kms_dp_linktrain_fallback: remove mode from data
  tests/intel/kms_flip_scaled_crc: use for_each_connector_mode()
  tests/intel/kms_pm_rpm: use for_each_connector_mode()
  tests/kms_plane_lowres: use for_each_connector_mode()
  tests/kms_plane_scaling: use for_each_connector_mode()
  tests/kms_writeback: use for_each_connector_mode()

 benchmarks/kms_fb_stress.c              |  3 +--
 lib/igt_kms.c                           | 10 ++++++----
 lib/igt_kms.h                           |  7 +++++--
 tests/intel/kms_dp_linktrain_fallback.c | 15 +++++++--------
 tests/intel/kms_flip_scaled_crc.c       | 12 ++++++------
 tests/intel/kms_pm_dc.c                 |  5 +++--
 tests/intel/kms_pm_lpsp.c               |  4 +---
 tests/intel/kms_pm_rpm.c                |  6 ++----
 tests/kms_plane.c                       | 10 +++++-----
 tests/kms_plane_lowres.c                |  4 +---
 tests/kms_plane_scaling.c               | 23 ++++++++++-------------
 tests/kms_writeback.c                   | 10 +++++++---
 12 files changed, 54 insertions(+), 55 deletions(-)

-- 
2.47.3

