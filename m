Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB76CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 14:49:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7207110E836;
	Wed, 27 Aug 2025 14:49:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ao2LWqfe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B6010E836
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 14:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756306166; x=1787842166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zan8HvHzPa52i+dA4qdjqkaRs6ASxp8JDeyAxkB3CAA=;
 b=Ao2LWqfe5fpPMpC/YHjxUQcfhCiP7WMxj5DUkXT0eTHAdIbYTI86nIzQ
 gbFt1U3wbHg/JgKWfFAjDIEy/7mwaOEIGm2N7MgSKdaUwMrPREQw48L9A
 NWDoyStrOAyNkdxfyeOKA2JHmociHgzA6Nke9RtvbwTEjFFEujrh3kdRB
 xmFP+MpUJ/5VN8LCce/VMIGUsB6frc7n3EuNF4eTk2APjaRuM9i3hgkbf
 ywau75DKrcsOyyA0WB8sHUk8FO5qVewHIBWQ2zt9/gNfjT239ql8JHb2D
 1Fn4coNpY6NaGHuiqDBDHmJzezHcNcaMbkPb8NQboInbst2ZyktF3caGw w==;
X-CSE-ConnectionGUID: T6uAyM4vQ1O4EFSEwrvIyA==
X-CSE-MsgGUID: WKbL2Z+ASF+owm/r3ree7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="61191644"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="61191644"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:26 -0700
X-CSE-ConnectionGUID: PmU1FhpYQTuXQd9zR8T3WQ==
X-CSE-MsgGUID: wRl72W9zSISYvBrAlwR4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="174246217"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:49:25 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t v2 0/4] Validate VF accesses to VRAM via BAR
Date: Wed, 27 Aug 2025 16:49:12 +0200
Message-Id: <20250827144916.18558-1-lukasz.laguna@intel.com>
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

v2:
- apply changes in intel_vram lib based on Marcin's review,
- apply changes in xe_sriov_vram based on Piotr's and Marcin's review.

Detailed changelogs can be found in updated patches.

Lukasz Laguna (4):
  lib/igt_sriov_device: Add helper to iterate over enabled VFs
  lib/intel_vram: Add library for VRAM accesses
  tests/intel/xe_sriov_flr: Use VRAM access helpers from intel_vram
    library
  tests/intel/xe_sriov_vram: Add test checking VF access to VRAM

 lib/igt_sriov_device.h      |  12 ++
 lib/intel_vram.c            | 189 ++++++++++++++++++++++
 lib/intel_vram.h            |  22 +++
 lib/meson.build             |   1 +
 tests/intel/xe_sriov_flr.c  | 104 +++---------
 tests/intel/xe_sriov_vram.c | 312 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 7 files changed, 555 insertions(+), 86 deletions(-)
 create mode 100644 lib/intel_vram.c
 create mode 100644 lib/intel_vram.h
 create mode 100644 tests/intel/xe_sriov_vram.c

-- 
2.40.0

