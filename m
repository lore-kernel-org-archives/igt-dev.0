Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4875910775E1
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 16:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5AA710E047;
	Wed, 18 Mar 2026 16:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFJj6v8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E664110E047
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773850496; x=1805386496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1HhPu+l7rm4oQa75Cjt0o3NmZLSenh4bbxi3WKDVBEY=;
 b=jFJj6v8cZyLJUwFx60q9JctX7KogvChJLcwN3bKIgAdzarMvY0RKxmz7
 PRkt2GvrD75HstmyjOO5UltRIcz6CrOW0BZCnjedA/48P0wYZRwBYsVkk
 FC4p4G7Ct3t3fBKciXBy7Ts7QCuOl4vA3g9CC5DRKwpIDWsKzS0+reEjx
 /CkgR6g5XKeo+BmGHs7siaGi/WlVpOIKZpV/XNjO655k+MjJKAHKWJomf
 w0LjmuyENEEKQ+juHjEr4o89jcDveaphybEVquBFPnJ75nrdebRFFXzIs
 ngCOOZYu16nO2fQm7QROfCCSTns7buWF+ss/ZV2jiE1EGSP8Mv5a1cnbj A==;
X-CSE-ConnectionGUID: 4zn3E1arSC+enSu6w+V4bw==
X-CSE-MsgGUID: IhY2yZiCR4Ga6g17Yy4wvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74798197"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74798197"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:14:56 -0700
X-CSE-ConnectionGUID: Cbrm+v56Q66z2soA0kh9KQ==
X-CSE-MsgGUID: XRoZHj/xQkWQl/Gt7Sob3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="218228792"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.180.135])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 09:14:54 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: adam.miszczak@linux.intel.com, jakub1.kolakowski@intel.com,
 kamil.konieczny@linux.intel.com, lukasz.laguna@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/4] tests/intel/xe_sriov_vfio: Add basic VFIO coverage
Date: Wed, 18 Mar 2026 17:14:43 +0100
Message-ID: <20260318161447.961840-1-marcin.bernatowicz@linux.intel.com>
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

The first patch adds standalone module load/unload subtests. The second
adds a dynamic bind-unbind-vfs subtest that enables VFs and binds each
of them to xe-vfio-pci through driver_override. The remaining patches
add basic VFIO coverage by opening the VFIO group and querying VFIO
region information for a VF bound to xe-vfio-pci.

Marcin Bernatowicz (4):
  tests/intel/xe_sriov_vfio: Add module load/unload subtests
  tests/intel/xe_sriov_vfio: Add dynamic bind-unbind-vfs subtest
  tests/intel/xe_sriov_vfio: Add open-basic subtest
  tests/intel/xe_sriov_vfio: Add region-info subtest

 tests/intel/xe_sriov_vfio.c | 479 ++++++++++++++++++++++++++++++++++++
 tests/meson.build           |   1 +
 2 files changed, 480 insertions(+)
 create mode 100644 tests/intel/xe_sriov_vfio.c

-- 
2.43.0

