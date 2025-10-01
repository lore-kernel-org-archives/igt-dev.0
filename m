Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB2B2CCA470
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 10:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9763C10E2ED;
	Wed,  1 Oct 2025 10:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jlZz3hVk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93E3D10E309
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 10:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759313938; x=1790849938;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BJEzuYcsXRWnCdDF7E8k9zgZ9GY0PoQwTwh5LbiGwaU=;
 b=jlZz3hVkmArU0x7shR09DxNq6ROhhNPzTH8iKENIDoI4rqWrCtyi2Px8
 tJdtd1eQE1/bSasDH9drfaz/kp+VoQRxd32pF3WZUMT23Qx+L98LZO2OH
 RY7TWrtEBk8hceWVvLX+jfHeVNO1DGiVKbDn+kRaRTM2CLxjXtrBfcp8f
 K4Xy+m6XELYvJUjB/hBwi2bgbc+mcaNn3N0kk3nl+zfxxi6Aq9JI2fG8j
 K7+Z98aYim8CCdtugnYIDTiwTlco0h2/ePY1sfhrg0UUkDE4eI2HPDCGP
 FMJfpl6lpH9EySNHyC9jvm1yvv3jTHnYL3/7YFZhUhiYzHd0fnxJvt499 w==;
X-CSE-ConnectionGUID: dlgpZH3NRKe3mBN5ndlj9g==
X-CSE-MsgGUID: ddkGl6BuSFODOthNYmxmZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60798358"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="60798358"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:18:58 -0700
X-CSE-ConnectionGUID: 9zBZHDYSRAWV03/8fVFHZQ==
X-CSE-MsgGUID: F7EMoGgxTPWIVIT5bTqCPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; d="scan'208";a="178036799"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 03:18:56 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v4 0/4] Validate VF accesses to VRAM via BAR
Date: Wed,  1 Oct 2025 12:18:46 +0200
Message-Id: <20251001101850.25299-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

Series includes a test to validate VF access to VRAM via BAR. The
following scenarios are covered:
- VF can access all provisioned memory via the VRAM BAR,
- VF cannot access memory beyond what's provisioned via the VRAM BAR,
- VF can access memory via the VRAM BAR after reprovisioning.

Additionally, it introduces a library for VRAM accesses and helper to
iterate over enabled VFs.

v4:
- log the failing ranges (Marcin),
- print detailed debug data when using verbose flag,
- change subtest name from vf-access-basic to vf-access-provisioned.

Lukasz Laguna (4):
  lib/igt_sriov_device: Add helper to iterate over enabled VFs
  lib/intel_vram: Add library for VRAM accesses
  tests/intel/xe_sriov_flr: Use VRAM access helpers from intel_vram
    library
  tests/intel/xe_sriov_vram: Add test checking VF access to VRAM

 lib/igt_sriov_device.h      |  12 ++
 lib/intel_vram.c            | 189 ++++++++++++++++++
 lib/intel_vram.h            |  22 ++
 lib/meson.build             |   1 +
 tests/intel/xe_sriov_flr.c  | 104 ++--------
 tests/intel/xe_sriov_vram.c | 388 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 7 files changed, 631 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h
 create mode 100644 tests/intel/xe_sriov_vram.c

-- 
2.40.0

