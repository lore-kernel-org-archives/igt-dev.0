Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA7D4415D
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 09:31:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F18710E564;
	Fri, 12 Dec 2025 09:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CoSjh3t2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5CE10E564
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 09:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765531889; x=1797067889;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=++ueUHmLvEmzR5t0BGiCe7hrKw95N/9NwJ8xlN7v8LQ=;
 b=CoSjh3t2g+XwHrCEosnJlipICwoQFUyWBMJBX7jx8jrSR99XuxTYcsdU
 TlXQG3yitD8jGEfZtN+CRPsn9HwHDE8T+UE+IaX+vfkyafvV6Gb0VGo4a
 zFtVCq4c3ty2zSqdCW+NYgynYgcoGJk3SYJCYz41tLdsfS3c7bKeKO0z0
 9DV8n4Lm/cLxZ8giaHna5MeJY1HmX+vVdZMFn906VUM39WYN3UEIj6Z0b
 mT0iltuFGfb6+uQAfxnabfOdz4/4YUwTbBS91gVzCj4Benzy4k+c27ozx
 zwX7P9ZzHcD3Rf2iuklVABH+qNPHEuFaJqnLiE0wqQuYCDUM3kJ/tR1Zj A==;
X-CSE-ConnectionGUID: QFYyN3ooS7ipeiBs4xMDag==
X-CSE-MsgGUID: Prha/ptaQlWnNXD/Xs+rMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84932428"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="84932428"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:29 -0800
X-CSE-ConnectionGUID: ndNRFgEtSxmwrldp3xGfIg==
X-CSE-MsgGUID: tc6O7zMhT2KTlRDncF/kfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="197301250"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 01:31:27 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 0/4] Add wrappers for painting test patterns to
Date: Fri, 12 Dec 2025 15:01:42 +0530
Message-ID: <20251212093146.2881962-1-karthik.b.s@intel.com>
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

Several tests manually create a cairo context, optionally fill a
background color, paint the standard IGT test pattern, and then
destroy the context.

This series adds helper functions and replace the existing stand alone
calls in test binaries to avoid code duplication and improve readability.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (4):
  lib/igt_fb: Add wrappers for painting test patterns to framebuffers
  tests/intel/kms_mmap_write_crc: Use lib function to paint fb
  tests/kms_hdr: Use lib function to paint fb
  tests/amdgpu/amd_assr: Use lib function to paint fb

 lib/igt_fb.c                     | 73 ++++++++++++++++++++++++++++----
 lib/igt_fb.h                     |  3 ++
 tests/amdgpu/amd_assr.c          |  5 +--
 tests/intel/kms_mmap_write_crc.c |  9 +---
 tests/kms_hdr.c                  |  7 +--
 5 files changed, 71 insertions(+), 26 deletions(-)

-- 
2.43.0

