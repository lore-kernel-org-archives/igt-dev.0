Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA62CAC5AE
	for <igt-dev@archiver.kernel.org>; Wed, 24 Sep 2025 14:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F3610E733;
	Wed, 24 Sep 2025 14:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k82mw1ak";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D722710E733
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Sep 2025 14:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758725859; x=1790261859;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HcF5BxzTQFW3Zk15yfqOnTAabwLvLLN5t5qiU/HDW1M=;
 b=k82mw1akPRgXPr8Eaxh2SuGdjPDMAsXdqr4tFevYN0Oh0y+1UPRmMf0p
 sR0qDsXHXJfCT0PKSzSlHw/lxk5exNbCNuO9viHOZPr4H/U/4YCwYIO6C
 p48u4jf7RE2Hn1mocyfi1yEfHR+s8x+qdzOLfuyu1yh2d5dUNDrL3sa7u
 oT2s2memjLqqkPUkG3QhFM+2S07ubg6U4SYpkW+/P6OvcLU1DPnZlhT4g
 AZKPm2fwSWa9z6SQJr8JrS3KBe8nR5nF+zHHTDfhRmVTlDwn5uMjmMYvu
 SzK8N06ifCBCRLK3owdiO1rxmjR/i+XNWAGpAM2rsReVntkqnIZZDe70L w==;
X-CSE-ConnectionGUID: xZ0Ld31OTnyGhy74syYkVg==
X-CSE-MsgGUID: oKI4l5TxRAifD389Viveiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="86468241"
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="86468241"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:57:39 -0700
X-CSE-ConnectionGUID: lr1IS/nITA2Ct/KFol/u8A==
X-CSE-MsgGUID: 7w+l2XrZQU6i+6WHT7ppBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; d="scan'208";a="176350036"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2025 07:57:38 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v3 0/4] Validate VF accesses to VRAM via BAR
Date: Wed, 24 Sep 2025 16:57:22 +0200
Message-Id: <20250924145726.23557-1-lukasz.laguna@intel.com>
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

v3:
- make vram_mapping a pointer to const struct (Marcin),
- fix the incorrect skip of the vf-access-after-resize-up (Marcin).

Lukasz Laguna (4):
  lib/igt_sriov_device: Add helper to iterate over enabled VFs
  lib/intel_vram: Add library for VRAM accesses
  tests/intel/xe_sriov_flr: Use VRAM access helpers from intel_vram
    library
  tests/intel/xe_sriov_vram: Add test checking VF access to VRAM

 lib/igt_sriov_device.h      |  12 ++
 lib/intel_vram.c            | 189 +++++++++++++++++++++
 lib/intel_vram.h            |  22 +++
 lib/meson.build             |   1 +
 tests/intel/xe_sriov_flr.c  | 104 ++----------
 tests/intel/xe_sriov_vram.c | 317 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 7 files changed, 560 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h
 create mode 100644 tests/intel/xe_sriov_vram.c

-- 
2.40.0

