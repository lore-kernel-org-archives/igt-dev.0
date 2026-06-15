Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44265CD98C7
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 10:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E053A10E33C;
	Mon, 15 Jun 2026 10:34:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jJDv+lNZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6AC10E33C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 10:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781519546; x=1813055546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pwS1FnpxpMS9+2RF6JsDVLTqfQijBSsHtFiMgA5nOCA=;
 b=jJDv+lNZxDeb84zN1Qjom46gTqGJpd2Os6KadP9nbh3me1xtldsCaacn
 3MiXkHuf5hTqNm0SljJLuehy01NAggJK7BKsX3pXUdld87UE7/46/Dkcu
 fdpYXVYq6fjgbuf3IjpNUYwVtloiCrDlX07jzqhGK1NrJdL+do51Smddq
 4PBRiGDi7s9Xf+3A9+mqMvb9O3UaAbPQmTztUhFDwzGOWBnUtxXhCG0EC
 QAc0TlZGor19g5RPgnCD+ndBIA1c7JcZK7hcW6m77YS/GwAssmq71iB9L
 PqcwVvZ6ZHf+q1ony5ST70wai/WwZnHTrgooE2w9W37aNTgMp339rKJ9m A==;
X-CSE-ConnectionGUID: 5T3WPSfQRrGy74lyFLcWDw==
X-CSE-MsgGUID: msS0TYv8TnasyPM9xTj/gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="93372299"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="93372299"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:26 -0700
X-CSE-ConnectionGUID: ZQjve3/6T9eMhViHd60lNg==
X-CSE-MsgGUID: ZHNoimd9QHOC7SRqqwh+tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="271514711"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.80])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 03:32:24 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/6] Add SR-IOV exit-handler-based cleanup
Date: Mon, 15 Jun 2026 12:32:14 +0200
Message-ID: <20260615103220.281656-1-marcin.bernatowicz@linux.intel.com>
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

This series adds SR-IOV exit-handler-based cleanup in SR-IOV test paths to
improve recovery when a test exits unexpectedly (for example, via SIGQUIT
from igt_runner), while preserving strict explicit teardown
in normal fixture flow.

Goal: keep PF state restoration robust across failures:
- disable VFs on exit
- restore sriov_drivers_autoprobe state
- restore XE SR-IOV admin scheduling defaults when modified by the test
- keep explicit fixture teardown authoritative, and clear the exit handler
  only after teardown succeeds

Series is split by teardown pattern to keep review and maintenance simple:
- no-callback users
- XE admin callback users
- FLR-specific callback users, plus helper refactor to reduce duplication

v2: No need for restore_autoprobe option,
    just always restore on exit. (Lukasz)

Marcin Bernatowicz (6):
  lib/igt_device_sriov: Add generic SR-IOV exit cleanup helper
  lib/xe/xe_sriov_admin: Add SR-IOV admin exit cleanup restore helper
  tests/sriov_basic: Arm SR-IOV exit cleanup
  tests/xe: Arm SR-IOV exit cleanup
  tests/xe: Arm SR-IOV exit cleanup with callback
  tests/intel/xe_sriov_flr: Arm SR-IOV exit cleanup

 lib/igt_sriov_device.c                   | 91 ++++++++++++++++++++++++
 lib/igt_sriov_device.h                   |  5 ++
 lib/xe/xe_sriov_admin.c                  | 21 ++++++
 lib/xe/xe_sriov_admin.h                  |  2 +
 tests/intel/xe_pmu.c                     |  4 ++
 tests/intel/xe_sriov_admin.c             |  4 ++
 tests/intel/xe_sriov_auto_provisioning.c |  2 +
 tests/intel/xe_sriov_flr.c               | 42 ++++++++---
 tests/intel/xe_sriov_scheduling.c        |  4 ++
 tests/intel/xe_sriov_vram.c              |  2 +
 tests/sriov_basic.c                      |  2 +
 11 files changed, 170 insertions(+), 9 deletions(-)

-- 
2.43.0

