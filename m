Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B876BCA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 08:54:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5951C10E8A2;
	Wed, 10 Sep 2025 08:54:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bzVomvCx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747B710E36D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 08:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757494465; x=1789030465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wo6vW1Z1GLBkI9vF/rK+5oqEmmSQ6OoL4lt5mW/ncnk=;
 b=bzVomvCxdvaMDxpmwQhxFPdNM+35yzD3On8tJlAkeNuiJ69XUy1pZzDk
 KYA6J0Ab2HmCjyA7Ty/ZR0it2N2O9fK0Cd5flNK3EGUjaScSA0Wej+T9I
 bx0BTcmaUepI7c/NNzdhZMhAVDOI9HsIBITiIbc/iBOHR6yZn5XcIqGch
 06GyxX1ceuCXR5wvXBDZooRX5Hx85jWrrpwMeS4MuJZagJTYbq78Vu3rX
 ELXz79JJEk743ZJPYyGRB/Txluvm937XI+HS4JQDKHn3Kta/p5Fm3HMqk
 H+QuyYYhi8GbeVRzTBGyAJJQQV43OX+SswT6i+36h0cXq7/lZgd6p43NY Q==;
X-CSE-ConnectionGUID: pTLllT13TYGLjSQbkyMmvg==
X-CSE-MsgGUID: PmlC6nYmR/OlUPqUHW3+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="77252078"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="77252078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 01:54:14 -0700
X-CSE-ConnectionGUID: NfRdyq4eTL+GRmU++eob2Q==
X-CSE-MsgGUID: SpVbQGvNRVu6WhM2TV/kAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178536654"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 01:54:12 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/4] Reduce simulation runtime
Date: Wed, 10 Sep 2025 14:30:55 +0530
Message-Id: <20250910090059.351698-1-swati2.sharma@intel.com>
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

Simulation runs are slow and do not benefit from exhaustive
iterations. This series reduces test runtime under simulation
while keeping full coverage on real hardware.

Swati Sharma (4):
  tests/intel/kms_draw_crc: limit formats in simulation env
  tests/intel/kms_mmap_write_crc: lower rounds in simulation
  tests/kms_color: limit iterations in simulation
  tests/kms_pipe_stress: lower minimum iterations in simulation

 tests/intel/kms_draw_crc.c       |  7 +++++++
 tests/intel/kms_mmap_write_crc.c | 10 +++++-----
 tests/intel/kms_pipe_stress.c    |  4 ++--
 tests/kms_color.c                |  5 +++++
 4 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.25.1

