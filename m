Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D154DC55ABF
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 10:04:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C77F10F15D;
	Thu,  6 Aug 2026 10:04:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oD1UH/bB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E8910E303
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 10:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786010623; x=1817546623;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Npthy+3Omf05w+w84DcHroO9tZDo6ERVkI24V9MHz4c=;
 b=oD1UH/bBGnaaJ5h7C8XpqYLefo6sh1zxV4A7oGj2w+W8HLdUH8uVrLMz
 pZFU6r79B7nj+fW+bhj9USyGfIUQ4SDW3RJG3MaQlDcHaSBOnWcTrNcJJ
 u5TWv6O3iccU2ztKmdnKT3TySwNPG60gNtwnBmGzKhkJdcWhh19aGqq+Y
 IrkMYKxcaBUzlQIziuE00CqdCybmGeuB8iAZduWuQlsthpEoQl1/Nzb7/
 7nTiLjjNEzjaZkQ7PiSG7Ejaz8ZQAb1XmC2OblT87v1QY5s2vit26a4IV
 HoiU9DXdrIeFCgFvrY+qEmrXDAp3b5efKdDpaHILWW7UL0YM5ZBxNKcSt A==;
X-CSE-ConnectionGUID: 6U/UyX43RCeORLP1DAbuFQ==
X-CSE-MsgGUID: n8qXwrFRQAeI/CeVnvM8VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="104136399"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="104136399"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 03:03:42 -0700
X-CSE-ConnectionGUID: d45pPzEWTKmAkvAwswT6Ew==
X-CSE-MsgGUID: mVY+IBlHQ8OTOIwLZjOigw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="260806138"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 03:03:41 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com
Subject: [PATCH v4 0/2] tests/sriov_basic: Validate PF unbind with VFs enabled
Date: Thu,  6 Aug 2026 12:03:30 +0200
Message-ID: <20260806100332.1228103-1-lukasz.laguna@intel.com>
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

Add new subtests covering PF driver unbind with VFs enabled in two
scenarios:
- with all VFs enabled,
- with one VF enabled and probed.

The tests verify that PF ends up unbound and VFs are disabled.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Lukasz Laguna (2):
  lib/igt_device_scan: Extract helper setting device filter from fd
  tests/sriov_basic: Validate PF unbind with VFs enabled

 lib/igt_device_scan.c  | 23 ++++++++++
 lib/igt_device_scan.h  |  2 +
 tests/core_hotunplug.c | 17 +-------
 tests/sriov_basic.c    | 98 +++++++++++++++++++++++++++++++++++++++++-
 4 files changed, 122 insertions(+), 18 deletions(-)

-- 
2.43.0

