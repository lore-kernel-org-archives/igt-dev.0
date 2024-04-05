Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBF3CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 10:42:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366C010F715;
	Fri,  5 Apr 2024 10:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M3yoh4OV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D41810F715
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712313723; x=1743849723;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8ysl9qmBRmISasZpYWfAH7hQP6qrMh4AN5fdQFbzWpo=;
 b=M3yoh4OVoqp+HnNHgyWskzozNZp4ttLyeUuxvJx/iuxpO67tkcaQbaca
 BLzAuVeZeuUtF5y1XQx3OHIqJv961Tt+Q9H8TyX4e29hkVKjwnQbgbOMi
 TW33O3zEKt4bl+ilUJita4/Oo/FHqa+G9Nwm5/XZj2BBHJtBp5ZM9L3Oq
 4LMlgcbOaOsjYZFkDAOz3OR4wpbLlxZN2b5AH+HGj0KzdlhV/mC3N2p+C
 CJJloJenHU35kLgPvR8RgQFxqnYcBG35zj1nPVqGfya/nXHqY6RjhMx/6
 8mP1op150sXRhfPc+JHSm6Hz1YdW/4ZDH2CXlKBC3z9BF916GFLaKPDxI A==;
X-CSE-ConnectionGUID: k0fbFvFlQZ2uWKC119/JbQ==
X-CSE-MsgGUID: rkTKtHCPSa+es3Cj69VJzg==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7735836"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7735836"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 03:42:02 -0700
X-CSE-ConnectionGUID: OjPVcFphQ7GEi+bcl9B4BQ==
X-CSE-MsgGUID: IZysVjXzT222JAcd3YaWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19691820"
Received: from himanshu-h97m-d3h.iind.intel.com ([10.145.169.80])
 by orviesa008.jf.intel.com with ESMTP; 05 Apr 2024 03:42:00 -0700
From: himanshu.girotra@intel.com
To: ramadevi.gandi@intel.com, aditya.chauhan@intel.com,
 kamil.konieczny@linux.intel.com, bhanuprakash.modem@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [i-g-t] tests/intel-ci: Addback evict & threads tests to BAT
Date: Fri,  5 Apr 2024 16:11:59 +0530
Message-Id: <20240405104159.14617-1-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.40.0
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

From: Himanshu Girotra <himanshu.girotra@intel.com>

Addback xe_evict and xe_exec_threads to fast feedback testlist to bring
back the coverage of BAT and reorder testlist so that kms tests run
before core tests to encounter problem caused by "6.9.0-rc1-xe"
Regression.

Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 139 +++++++++++++----------
 1 file changed, 80 insertions(+), 59 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index c859acdca..365d033af 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,64 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_addfb_basic@addfb25-4-tiled
+igt@kms_addfb_basic@addfb25-bad-modifier
+igt@kms_addfb_basic@addfb25-modifier-no-flag
+igt@kms_addfb_basic@addfb25-x-tiled-legacy
+igt@kms_addfb_basic@addfb25-yf-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-legacy
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_addfb_basic@bad-pitch-0
+igt@kms_addfb_basic@bad-pitch-1024
+igt@kms_addfb_basic@bad-pitch-128
+igt@kms_addfb_basic@bad-pitch-256
+igt@kms_addfb_basic@bad-pitch-32
+igt@kms_addfb_basic@bad-pitch-63
+igt@kms_addfb_basic@bad-pitch-65536
+igt@kms_addfb_basic@bad-pitch-999
+igt@kms_addfb_basic@basic
+igt@kms_addfb_basic@basic-x-tiled-legacy
+igt@kms_addfb_basic@bo-too-small
+igt@kms_addfb_basic@invalid-get-prop
+igt@kms_addfb_basic@invalid-get-prop-any
+igt@kms_addfb_basic@invalid-set-prop
+igt@kms_addfb_basic@invalid-set-prop-any
+igt@kms_addfb_basic@no-handle
+igt@kms_addfb_basic@size-max
+igt@kms_addfb_basic@small-bo
+igt@kms_addfb_basic@too-high
+igt@kms_addfb_basic@too-wide
+igt@kms_addfb_basic@unused-handle
+igt@kms_addfb_basic@unused-modifier
+igt@kms_addfb_basic@unused-offsets
+igt@kms_addfb_basic@unused-pitches
+igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
+igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
+igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
+igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
+igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
+igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
+igt@kms_dsc@dsc-basic
+igt@kms_flip@basic-flip-vs-dpms
+igt@kms_flip@basic-flip-vs-modeset
+igt@kms_flip@basic-flip-vs-wf_vblank
+igt@kms_flip@basic-plain-flip
+igt@kms_force_connector_basic@force-connector-state
+igt@kms_force_connector_basic@force-edid
+igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_frontbuffer_tracking@basic
+igt@kms_hdmi_inject@inject-audio
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
+igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
+igt@kms_pipe_crc_basic@hang-read-crc
+igt@kms_pipe_crc_basic@nonblocking-crc
+igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
+igt@kms_pipe_crc_basic@read-crc
+igt@kms_pipe_crc_basic@read-crc-frame-sequence
+igt@kms_prop_blob@basic
+igt@kms_psr@psr-primary-page-flip
+igt@kms_psr@psr-cursor-plane-move
+igt@kms_psr@psr-sprite-plane-onoff
 igt@xe_compute@compute-square
 igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
@@ -142,66 +200,29 @@ igt@xe_pat@pat-index-xe2
 igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
-igt@kms_addfb_basic@addfb25-4-tiled
-igt@kms_addfb_basic@addfb25-bad-modifier
-igt@kms_addfb_basic@addfb25-modifier-no-flag
-igt@kms_addfb_basic@addfb25-x-tiled-legacy
-igt@kms_addfb_basic@addfb25-yf-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_addfb_basic@bad-pitch-0
-igt@kms_addfb_basic@bad-pitch-1024
-igt@kms_addfb_basic@bad-pitch-128
-igt@kms_addfb_basic@bad-pitch-256
-igt@kms_addfb_basic@bad-pitch-32
-igt@kms_addfb_basic@bad-pitch-63
-igt@kms_addfb_basic@bad-pitch-65536
-igt@kms_addfb_basic@bad-pitch-999
-igt@kms_addfb_basic@basic
-igt@kms_addfb_basic@basic-x-tiled-legacy
-igt@kms_addfb_basic@bo-too-small
-igt@kms_addfb_basic@invalid-get-prop
-igt@kms_addfb_basic@invalid-get-prop-any
-igt@kms_addfb_basic@invalid-set-prop
-igt@kms_addfb_basic@invalid-set-prop-any
-igt@kms_addfb_basic@no-handle
-igt@kms_addfb_basic@size-max
-igt@kms_addfb_basic@small-bo
-igt@kms_addfb_basic@too-high
-igt@kms_addfb_basic@too-wide
-igt@kms_addfb_basic@unused-handle
-igt@kms_addfb_basic@unused-modifier
-igt@kms_addfb_basic@unused-offsets
-igt@kms_addfb_basic@unused-pitches
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
-igt@kms_dsc@dsc-basic
-igt@kms_flip@basic-flip-vs-dpms
-igt@kms_flip@basic-flip-vs-modeset
-igt@kms_flip@basic-flip-vs-wf_vblank
-igt@kms_flip@basic-plain-flip
-igt@kms_force_connector_basic@force-connector-state
-igt@kms_force_connector_basic@force-edid
-igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_frontbuffer_tracking@basic
-igt@kms_hdmi_inject@inject-audio
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
-igt@kms_pipe_crc_basic@hang-read-crc
-igt@kms_pipe_crc_basic@nonblocking-crc
-igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
-igt@kms_pipe_crc_basic@read-crc
-igt@kms_pipe_crc_basic@read-crc-frame-sequence
-igt@kms_prop_blob@basic
-igt@kms_psr@psr-primary-page-flip
-igt@kms_psr@psr-cursor-plane-move
-igt@kms_psr@psr-sprite-plane-onoff
+igt@xe_exec_threads@threads-basic
+igt@xe_exec_threads@threads-mixed-basic
+igt@xe_exec_threads@threads-mixed-shared-vm-basic
+igt@xe_exec_threads@threads-mixed-fd-basic
+igt@xe_exec_threads@threads-mixed-userptr-invalidate
+igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
+igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
+igt@xe_evict@evict-beng-small
+igt@xe_evict@evict-beng-small-cm
+igt@xe_evict@evict-beng-small-external
+igt@xe_evict@evict-beng-small-external-cm
+igt@xe_evict@evict-beng-small-multi-vm
+igt@xe_evict@evict-cm-threads-small
+igt@xe_evict@evict-mixed-threads-small
+igt@xe_evict@evict-mixed-threads-small-multi-vm
+igt@xe_evict@evict-small
+igt@xe_evict@evict-small-cm
+igt@xe_evict@evict-small-external
+igt@xe_evict@evict-small-external-cm
+igt@xe_evict@evict-small-multi-vm
+igt@xe_evict@evict-small-multi-vm-cm
+igt@xe_evict@evict-threads-small
 
-# All tests that do module unloading and reloading are executed last.
 # They will sometimes reveal issues of earlier tests leaving the
 # driver in a broken state that is not otherwise noticed in that test.
 igt@core_hotunplug@unbind-rebind
-- 
2.40.0

