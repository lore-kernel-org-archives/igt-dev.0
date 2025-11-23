Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BB8CFA46B
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282E910E152;
	Sun, 23 Nov 2025 15:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hFS+E3br";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E6310E056
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910499; x=1795446499;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sAHezs35Ejs3QGhPJ7lsWS6p4Fe924rpvZcV4+70jjU=;
 b=hFS+E3br8AwHJG63sjePBv9orXpIvA3Yjaar1zKs/PfC6eBEi1kUoOw2
 4JQ0MpXX0fLp7P5EZCDZlzLnNauy7K8flT3maf3zFI0l5FKBAw53gJl1S
 eetRayTk7kps0Qlg+FS0XG0BAbU+liWdSMJC6bw+SdkUIWyueRhZxt3au
 8s87BwLqOROkJFnH0DAgv7y7K3CUKqwXnZM7iwSQKPxwx3ffkRKNRRnOb
 ZM+0u1IE4FAz10NMtP4q785+5fT/Xm1j+6pDbx8odpgmNibLp0AkO4qzf
 0vkCgIbMp7MqebtX8lDhQ0JAbJCiCdYT6bJKUDEhUsfrnja+NYFPV8Nfp Q==;
X-CSE-ConnectionGUID: 5xeByUeGTJmAZbyws3f/iQ==
X-CSE-MsgGUID: Jhv+5HOsRs213RF1LfJ5qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615155"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615155"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:18 -0800
X-CSE-ConnectionGUID: 9It2opPDQNOE34+Seqdodw==
X-CSE-MsgGUID: a0sAzbWWTjCnV6MVf1tnWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903707"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:18 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 00/35] fix pipe-crtc conflict in crc helpers
Date: Sun, 23 Nov 2025 20:53:37 +0530
Message-Id: <20251123152412.599801-1-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series updates all Intel and Xe KMS CRC users to rely on the new
CRTC-aware helpers instead of igt_pipe_crc_new(). The library
change separates logical pipe indices from CRTC indices and exposes helper
constructors that derive the correct debugfs crtc-<index>/crc/ paths from
igt_display state.

Each test is then switched over to use igt_pipe_crc_new_for_display o that CRC
collection no longer assumes pipe == CRTC index. The intent is to keep the
test behaviour unchanged while making the series robust on platforms where
CRTC numbering no longer matches hardware pipe ordering.

Will merge all changes in one file later.

Kunal Joshi (35):
  lib/igt_pipe_crc: separate CRTC index from pipe
  tests/kms_atomic: use display-aware pipe CRC helper
  tests/kms_color: use display-aware pipe CRC helper
  tests/kms_cursor_crc: use display-aware pipe CRC helper
  tests/kms_cursor_legacy: use display-aware pipe CRC helper
  tests/kms_display_modes: use display-aware pipe CRC helper
  tests/kms_hdr: use display-aware pipe CRC helper
  tests/kms_multipipe_modeset: use display-aware pipe CRC helper
  tests/kms_rotation_crc: use display-aware pipe CRC helper
  tests/kms_plane_lowres: use display-aware pipe CRC helper
  tests/kms_async_flips: use display-aware pipe CRC helper
  tests/kms_atomic_transition: use display-aware pipe CRC helper
  tests/kms_plane: use display-aware pipe CRC helper
  tests/kms_plane_alpha_blend,cursor: use display-aware pipe CRC helper
  tests/kms_plane_multiple: use display-aware pipe CRC helper
  tests/kms_sharpness_filter: use display-aware pipe CRC helper
  tests/kms_universal_plane: use display-aware pipe CRC helper
  tests/kms_prime: use display-aware pipe CRC helper
  tests/kms_bw: use display-aware pipe CRC helper
  tests/kms_ccs: use display-aware pipe CRC helper
  tests/kms_fbc_dirty_rect: use display-aware pipe CRC helper
  tests/kms_pwrite_crc: use display-aware pipe CRC helper
  tests/xe_pxp: use display-aware pipe CRC helper
  tests/kms_frontbuffer_tracking: use display-aware pipe CRC helper
  tests/kms_mmap_write_crc: use display-aware pipe CRC helper
  tests/kms_dirtyfb: use display-aware pipe CRC helper
  tests/kms_big_fb: use display-aware pipe CRC helper
  tests/xe_pat: use display-aware pipe CRC helper
  tests/kms_draw_crc: use display-aware pipe CRC helper
  tests/kms_fbcon_fbt: use display-aware pipe CRC helper
  tests/tests/intel/kms_flip_scaled_crc: use display-aware pipe CRC
    helper
  tests/intel/kms_flip_tiling: use display-aware pipe CRC helper
  tests/intel/kms_pipe_stress: use display-aware pipe CRC helper
  tests/intel/kms_fb_coherency: use display-aware pipe CRC helper
  tests/intel/gem_pxp: use display-aware pipe CRC helper

 lib/igt_pipe_crc.c                     | 39 ++++++++++++++++++++++++--
 lib/igt_pipe_crc.h                     |  6 ++++
 tests/intel/gem_pxp.c                  |  2 +-
 tests/intel/kms_big_fb.c               | 10 ++++---
 tests/intel/kms_ccs.c                  |  5 ++--
 tests/intel/kms_dirtyfb.c              |  5 ++--
 tests/intel/kms_draw_crc.c             |  4 ++-
 tests/intel/kms_fb_coherency.c         |  2 +-
 tests/intel/kms_fbc_dirty_rect.c       |  5 ++--
 tests/intel/kms_fbcon_fbt.c            |  7 +++--
 tests/intel/kms_flip_scaled_crc.c      |  4 +--
 tests/intel/kms_flip_tiling.c          |  2 +-
 tests/intel/kms_frontbuffer_tracking.c |  5 ++--
 tests/intel/kms_mmap_write_crc.c       |  5 ++--
 tests/intel/kms_pipe_stress.c          |  4 +--
 tests/intel/kms_pwrite_crc.c           |  5 ++--
 tests/intel/xe_pat.c                   |  4 ++-
 tests/intel/xe_pxp.c                   |  4 +--
 tests/kms_async_flips.c                |  6 ++--
 tests/kms_atomic.c                     |  4 +--
 tests/kms_atomic_transition.c          |  5 ++--
 tests/kms_bw.c                         |  5 ++--
 tests/kms_color.c                      |  2 +-
 tests/kms_cursor_crc.c                 |  2 +-
 tests/kms_cursor_legacy.c              |  4 +--
 tests/kms_display_modes.c              |  6 ++--
 tests/kms_hdr.c                        |  3 +-
 tests/kms_multipipe_modeset.c          |  4 +--
 tests/kms_pipe_crc_basic.c             | 12 ++++----
 tests/kms_plane.c                      |  4 +--
 tests/kms_plane_alpha_blend.c          |  4 +--
 tests/kms_plane_cursor.c               |  5 ++--
 tests/kms_plane_lowres.c               |  3 +-
 tests/kms_plane_multiple.c             | 12 ++++----
 tests/kms_prime.c                      |  4 +--
 tests/kms_rotation_crc.c               |  6 ++--
 tests/kms_sharpness_filter.c           |  5 ++--
 tests/kms_universal_plane.c            |  4 +--
 38 files changed, 139 insertions(+), 79 deletions(-)

-- 
2.25.1

