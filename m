Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F917CD6E57
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 14:16:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF291113A5F;
	Tue,  2 Jun 2026 14:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcGAcezj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D28113A5C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780409789; x=1811945789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tty5pdvOyMC2VCvFuQrY7zMLLE6bTFJOM3VrPtXEZDo=;
 b=YcGAcezjtTDWX2XD6wlSDRhm6z5JEK07nZXb/4MYoNEWzHZPVQe1xKqr
 g+fptmwQjasndWtgMIYXdN38XXzCi3RzoiwPG3y13GrjTJkECnh5prZfE
 0AzTiuYD7rV/gIpOp3TK0Vm5eWbfm/RYf5kXZKAVt3Xw/NrDfSYRje+nU
 o3jdWPUURY9o2NwcqW49Kvz/d7HFleR3y9WaxdOWV2BHPhnpnXrIHyi2b
 N/HY2rKicfK7Rrx4X8vN55mx6uRGo+KP6e2XbCDoYxqGium8c+ojeT9zG
 T96bUcRCfngiEshDl3baC9XwEkOJJ10IymKMQ3kLjhEA/m1zByAwEwpWI Q==;
X-CSE-ConnectionGUID: oLfL7LG4ScOL+CTmKw+KsQ==
X-CSE-MsgGUID: +1wTEirHT/Cye3ZvSu6GVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="83778216"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="83778216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:28 -0700
X-CSE-ConnectionGUID: BRUAD1RJRmqHC+F0GcIL/Q==
X-CSE-MsgGUID: aycLAOdmQZis3CwuvBnEQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; d="scan'208";a="247881265"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.189])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2026 07:16:27 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/6] Add SR-IOV exit-handler-based cleanup
Date: Tue,  2 Jun 2026 16:16:03 +0200
Message-ID: <20260602141609.3941750-1-marcin.bernatowicz@linux.intel.com>
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

Marcin Bernatowicz (6):
  lib/igt_device_sriov: Add generic SR-IOV exit cleanup helper
  lib/xe/xe_sriov_admin: Add SR-IOV admin exit cleanup restore helper
  tests/sriov_basic: Arm SR-IOV exit cleanup
  tests/xe: Arm SR-IOV exit cleanup
  tests/xe: Arm SR-IOV exit cleanup with callback
  tests/intel/xe_sriov_flr: Arm SR-IOV exit cleanup

 lib/igt_sriov_device.c                   | 96 ++++++++++++++++++++++++
 lib/igt_sriov_device.h                   |  5 ++
 lib/xe/xe_sriov_admin.c                  | 21 ++++++
 lib/xe/xe_sriov_admin.h                  |  2 +
 tests/intel/xe_pmu.c                     |  4 +
 tests/intel/xe_sriov_admin.c             |  4 +
 tests/intel/xe_sriov_auto_provisioning.c |  2 +
 tests/intel/xe_sriov_flr.c               | 42 ++++++++---
 tests/intel/xe_sriov_scheduling.c        |  4 +
 tests/intel/xe_sriov_vram.c              |  2 +
 tests/sriov_basic.c                      |  2 +
 11 files changed, 175 insertions(+), 9 deletions(-)

-- 
2.43.0

