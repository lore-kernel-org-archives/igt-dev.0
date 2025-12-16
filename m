Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D454D5C0F2
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 08:52:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96EB210E735;
	Tue, 16 Dec 2025 08:52:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGKlqiRi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A7910E735
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765875137; x=1797411137;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5sImBIrH3fzDAj5fObMNtgw9+c1GWZAyz50YAtArXbY=;
 b=SGKlqiRieFpliG7RW7PIhJ8XZ0wHX9zGA4rnipUKDIGDfLsvdmA/M9ku
 sPSM4xP90gfdW3XsiUyCj67b9aOdY+xQjBw+UpqrnOQiVQBDKZQ7i3baT
 7VFIdUx98v5YisjU1N5RBHySAuthJ+HBZQTNsMkc+q58VeN9rPe9pX+uS
 olv61umDPqPSyI+zZSV61VAea679/Vev4W/c6DDV87uDD+WhxTiXefEeM
 GnKuRC20uPVt54L0baxx8TOKF6MXU2jDZQduaeCJ4o7+GuQXjovYoErn8
 W+ZfWJJSvWPdVb8yshOMqSFpToW5t7UI0H5jqFymPPYzqScSZhJ+WG0qm Q==;
X-CSE-ConnectionGUID: eR5k+UwXTQquelr0rUBvQg==
X-CSE-MsgGUID: 8Hofug4PT9iIYmUB6xB83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="67670024"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="67670024"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:17 -0800
X-CSE-ConnectionGUID: xqen6q4KTQKfNjGSwiPaEA==
X-CSE-MsgGUID: t5gEexZKRXGF6H8PANYHOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="197710606"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 00:52:16 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, jeevan.b@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 0/4] Add wrappers for painting test patterns to
Date: Tue, 16 Dec 2025 14:22:38 +0530
Message-ID: <20251216085242.2916476-1-karthik.b.s@intel.com>
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

 lib/igt_fb.c                     | 53 ++++++++++++++++++++++++++------
 lib/igt_fb.h                     |  3 ++
 tests/amdgpu/amd_assr.c          |  5 +--
 tests/intel/kms_mmap_write_crc.c |  9 ++----
 tests/kms_hdr.c                  |  7 +----
 5 files changed, 51 insertions(+), 26 deletions(-)

-- 
2.43.0

