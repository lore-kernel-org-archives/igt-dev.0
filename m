Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B6010ED67C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Mar 2026 14:06:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F97E10EC98;
	Fri, 27 Mar 2026 14:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c+9UmEda";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B72B10E050
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2026 14:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774620395; x=1806156395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3ImOuG6ivfppMxf3R+2J4IlFaBx+ZmDLoexINuOSolE=;
 b=c+9UmEda77NchTk8tQ6UxprCpW+DH/NY/+Kpw2ckMt3cH3D3p/qVgOmQ
 F7OkIsx+C8kchIzXypXJnINeCCRgUwgbITMhq8zzKJHEet5EisflY2sEi
 GQuXrg8s0IkAQrgUGoK3SusXHJhlbfeqpB4ZIAZ5C+dXtvGwRDEpr9hSG
 QQ/Rv60qOZ2MFCi4NuwW/a9vJNeTauC8/UIzduOv6XdcmtGm22egtOyAg
 ZFq9BVwiKWWGUdkGit8BZMIWlfcZAr1leUbh3KRuVzZfxr18x8f1J5LA6
 T/H/8vnaGdQOS+PatqdopPrTCPvIpPSNOwhCLBsbrGTjBni26aX5MdffS Q==;
X-CSE-ConnectionGUID: wEGCBlMHRoK2g6UZh69DwQ==
X-CSE-MsgGUID: NxLq67r9SumdP6/rODGDgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="79295381"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="79295381"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:34 -0700
X-CSE-ConnectionGUID: f4zdt2qXTti+bKkdOLG6sA==
X-CSE-MsgGUID: zrOor1Q/Tai1NGkEGB/Rzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="220925765"
Received: from lvasutx-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.246.16.239])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 07:06:31 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 0/4] tests/intel/xe_sriov_vfio: Add basic VFIO
 coverage
Date: Fri, 27 Mar 2026 15:06:23 +0100
Message-ID: <20260327140627.64574-1-marcin.bernatowicz@linux.intel.com>
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

Add xe_sriov_vfio test covering basic xe-vfio-pci module handling
and VFIO smoke-test paths for SR-IOV VFs.

The first patch adds standalone module load/unload subtest. The second
adds a dynamic bind-unbind-vfs subtest that enables VFs and binds each
of them to xe-vfio-pci through driver_override. The remaining patches
add basic VFIO coverage by opening the VFIO group and querying VFIO
region information for a VF bound to xe-vfio-pci.

v2:
- Keep as a single load/unload subtest skipping
  when module already loaded (Lukasz)
- Split bound-driver assertion helper and remove
  redundant pre-bind unbind (Lukasz)
- Simplify restore_xe_vfio_module() logic (Lukasz)

Marcin Bernatowicz (4):
  tests/intel/xe_sriov_vfio: Add VFIO module load/unload subtest
  tests/intel/xe_sriov_vfio: Add dynamic bind-unbind-vfs subtest
  tests/intel/xe_sriov_vfio: Add open-basic subtest
  tests/intel/xe_sriov_vfio: Add region-info subtest

 tests/intel/xe_sriov_vfio.c | 435 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 436 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vfio.c

-- 
2.43.0

