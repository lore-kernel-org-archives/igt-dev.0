Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8A2CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 14:36:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345110E613;
	Tue,  4 Nov 2025 14:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku2AEA47";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732E210E613
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 14:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762266993; x=1793802993;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6sCoVTUcZmGFJTv9k6WaCnxqeB03cTCLbTOJlgLsNas=;
 b=Ku2AEA47sn8CchoHnL07VEpNuKuxdM9GmusBZQObQ03GpMAogDYjG9Cw
 rCuYoG4fTiPevLZzDY51uquypacUHcB9dryWvO4Elt0FrChlCFDp18qYQ
 LzRFHLZMkHLwpd7EtMuOCYw24DIIDA2grYA6771/Ks3DM7fXokoKkkZ8b
 nOMQDmEAw+4NgelGcLWGQlFgxIeFKIptSr46XF9cIH+DtFdcE5xqMVdWK
 YacxvDomiBtyZeRr+ierd0yJ9UDeF/dXgcizHNbydwy8T4Gqo2rrm4zit
 MXOPmRbxfTQW1DigMnWDqGQyiiCdOjvRq1ksGeNDLu6DPBEejZTT+krh8 g==;
X-CSE-ConnectionGUID: g/n0q23lSs6/LwpLuYvM2A==
X-CSE-MsgGUID: hMH/t/vmSBCE/zA2BxbVeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="51932149"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="51932149"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 06:36:33 -0800
X-CSE-ConnectionGUID: tekj6eB9RIiN2el97YFX0w==
X-CSE-MsgGUID: GftlpxbXStKmaS/od6oP5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; d="scan'208";a="192261727"
Received: from dut2943pvc.iind.intel.com ([10.190.215.39])
 by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2025 06:36:32 -0800
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	nishit.sharma@intel.com
Subject: [PATCH i-g-t v1 0/7] Madvise feature in Multi-GPU
Date: Tue,  4 Nov 2025 14:36:21 +0000
Message-ID: <20251104143631.51831-1-nishit.sharma@intel.com>
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

From: Nishit Sharma <nishit.sharma@intel.com>

This patch series adds comprehensive SVM multi-GPU IGT test coverage
for madvise and prefetch functionality.

Nishit Sharma (7):
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU cross-GPU memory
    access test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU atomic operations
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU coherency test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU performance test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU fault handling test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU simultaneous access
    test
  tests/intel/xe_multi-gpusvm.c: Add SVM multi-GPU conflicting madvise
    test

 lib/xe/xe_ioctl.c             |     40 +
 lib/xe/xe_ioctl.h             |      5 +
 tags                          | 263672 +++++++++++++++++++++++++++++++
 tests/intel/xe_multi_gpusvm.c |   1379 +
 tests/intel/xe_multisvm.c     |     41 +-
 tests/meson.build             |      1 +
 6 files changed, 265100 insertions(+), 38 deletions(-)
 create mode 100644 tags
 create mode 100644 tests/intel/xe_multi_gpusvm.c

-- 
2.48.1

