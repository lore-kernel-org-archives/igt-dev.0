Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADE6D41D7E
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCD210E822;
	Thu, 11 Dec 2025 19:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLueV3uT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A9D310E822
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 19:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765481432; x=1797017432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oPqNelCGundkkWsDOpQmpNxSVLwlCHhkYZx2+7dg2AA=;
 b=jLueV3uTyX8JU0fQrLJbWGxAcpuO/kRiChoSqfyb58kvL9ljzOkaRk8X
 oYe0y6fRYydsfsP13btPxhO8irF/ydoePiKTjoeRe0wWKt09g/NrADrig
 CpbQVAwI3Z9lqchljB8bAJ17K3uX2+FqKuHjSHFwDekks74liNznTLVxG
 gnJ/cU8gYJifFM7Gr6kFQCc+t2uhQk0BgLJo/DYTKAt3ibTc7yRq2YhX/
 AXOKO8kkqORRB3KRoUxmxWxRWcoXK435NcNjwEnXBrhPQ/USQBcUmOE0/
 GcK+8GDDsILdylkOH8C+hIXLH90Uz6eqptVFa8gbpNk0xVSoKIQ892crM g==;
X-CSE-ConnectionGUID: Vft2SFMZRoSnO+HSbKKVmA==
X-CSE-MsgGUID: mek8rcz3TKWYhUN1exNjSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70053726"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="70053726"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 11:30:31 -0800
X-CSE-ConnectionGUID: R0626p2NTuufcapIHsx30g==
X-CSE-MsgGUID: Y9hvFN8tRS+NCst1FpQb3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="201049627"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.69])
 by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 11:30:32 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com,
	Xin Wang <x.wang@intel.com>
Subject: [PATCH v5 0/2] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Thu, 11 Dec 2025 19:30:25 +0000
Message-ID: <20251211193030.187174-1-x.wang@intel.com>
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


Xin Wang (2):
  lib/intel_pat: read Xe PAT config from debugfs
  tests/intel/xe_pat: sync with Xe PAT debugfs parser

 lib/intel_pat.c      | 121 +++++++++++++++++++++++++++++++++++--------
 lib/intel_pat.h      |  20 +++++++
 lib/xe/xe_query.c    |   4 ++
 lib/xe/xe_query.h    |   4 ++
 tests/intel/xe_pat.c |  38 +++++++++++++-
 5 files changed, 162 insertions(+), 25 deletions(-)

-- 
2.43.0

