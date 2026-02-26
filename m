Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B984FD8FDA
	for <igt-dev@archiver.kernel.org>; Thu, 26 Feb 2026 17:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F53610E9DE;
	Thu, 26 Feb 2026 17:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZgktgkA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92E310E9DE
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Feb 2026 17:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772127104; x=1803663104;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O2OUeokpZQvRlOJ5Y/4thCIKCJLGuulTQM8X026ky4Q=;
 b=hZgktgkACmvm7IZmZeD7A1bDGGlIet6GDDAhjPTdB1ZKWjRcnpCRdE/i
 g6xcz3hUmA0D2wmJJ0aG2Q/XkFhwPv7cRT3/GMM7SbS3x7vNdwyOzerPH
 8ngNONGz9f8mFX4n27mMJ6ufwAGi0mj9kWqYHgxdU0u9outbjB4Pz6uXH
 eCP/4R08bygBxDcf8ugR3W1OiEEDnkgFYpRnH6qyHZYdRdSfWJPb03UuY
 z4H8f6F4uQA1A7icDAPLJVxWwBfU7AoMrOhaXtIbFzrfI/YGkgf9qHqt1
 W63zGzQptgESXRlER17Ke5ieksN6lXP8Qh7o5psVk+NUQ437dTF5fV11C w==;
X-CSE-ConnectionGUID: eqaaTzKvReWytZACmKvfMQ==
X-CSE-MsgGUID: CVefFdyhTxincd7H766nWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="95814089"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="95814089"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:44 -0800
X-CSE-ConnectionGUID: H3uCZompSD+LdXIlkgbS7Q==
X-CSE-MsgGUID: pmxFCZ7cT+Op5TDheHgLVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="220765350"
Received: from soc-5cg43972f8.clients.intel.com (HELO localhost)
 ([172.28.182.87])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 09:31:42 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: lukasz.laguna@intel.com, piotr.piorkowski@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t 0/2] xe_sriov_flr: reset-only FLR smoke test
Date: Thu, 26 Feb 2026 18:31:35 +0100
Message-ID: <20260226173137.3221419-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

This series adds a minimal FLR smoke test to xe_sriov_flr.

Patch 1 introduces the flr-reset-only subtest intended as a minimal smoke
test for the VF reset sysfs write path while still using the xe-vfio-pci
based synchronization.

Patch 2 adds --extended to generate additional dynamic variants (numvfs-%u)
beyond the default numvfs-1.

Marcin Bernatowicz (2):
  tests/intel/xe_sriov_flr: Add reset-only FLR subtest
  tests/intel/xe_sriov_flr: Add --extended for reset-only

 tests/intel/xe_sriov_flr.c | 79 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

-- 
2.43.0

