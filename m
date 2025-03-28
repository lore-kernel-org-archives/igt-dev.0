Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F01C36010
	for <igt-dev@archiver.kernel.org>; Fri, 28 Mar 2025 18:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C83010E062;
	Fri, 28 Mar 2025 18:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EpqMlxkD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E05AE10E062
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Mar 2025 18:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185135; x=1774721135;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nS+MpEITIEO8ABQ2/h3VViL2Dhmqho1u3sz/73OCULM=;
 b=EpqMlxkD8x92pdHJ2ZKcwsX0qvYy8FV7IEeZAuEG9UxfIVYQDbShaYMQ
 63eNvGV/Sz2OKBdGVg5+I/YJlulBpG1ENHv31x2XacKBnbR3gSLq1UhCh
 MVgz/HKgoda5idPvz4wsUfsHxKT8t+Rjw8GOOJBge1+VFmZhX9OqqW6Qs
 gPIWOENH29cRQ87fPdY48cwbg7qz75ZsyCgNkY7VlGQ/kia11oC+qrpzK
 o6l3D7d8PAxz86RAKv7Yyd0znl4EGcWEbpNwObyGweqDTLRClOw3ocW0Q
 VBmva0uYzt9/Uf/3fNLSmfW4lcINi3LAbar5lASCA1NPay+AqF1iWOnjT g==;
X-CSE-ConnectionGUID: Gn1qbUBbTlaZoPQKJZzRDw==
X-CSE-MsgGUID: TXwKN7evSxiyjyKi6OSvIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="62088474"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="62088474"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:34 -0700
X-CSE-ConnectionGUID: eOfCbI8cTwuqSMiriVb29A==
X-CSE-MsgGUID: g0TsMrAKQcCIuxDBR8eDYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130725707"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:05:32 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, uma.shankar@intel.com,
 chaitanya.kumar.borah@intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 0/3] Fix ctm-limited subtest
Date: Fri, 28 Mar 2025 23:40:52 +0530
Message-Id: <20250328181055.642777-1-swati2.sharma@intel.com>
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

Fix ctm-limited subtest

Swati Sharma (3):
  lib/igt_chamelium: Add chamelium_frame_match_or_dump_frame_pair()
  lib/igt_chamelium: Fix CRC calculation in compared_frames_dump()
  tests/chamelium/kms_chamelium_color: Fix ctm-limited-range subtest

 lib/igt_chamelium.c                   | 48 ++++++++++++++++++++-
 lib/igt_chamelium.h                   |  5 +++
 tests/chamelium/kms_chamelium_color.c | 60 ++++++++++-----------------
 3 files changed, 75 insertions(+), 38 deletions(-)

-- 
2.25.1

