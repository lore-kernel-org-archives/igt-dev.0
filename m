Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9559ECA0EED
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 21:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A25B10EAE9;
	Thu, 28 Aug 2025 21:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ipzCFiZb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1992510EAE4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756417754; x=1787953754;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=C0qKVQ+O/CvEocwzp8QcMB2DFX0QyGofh7O/tHxf/no=;
 b=ipzCFiZbC2G+U6JGr3D7AksqyByw0+bYMvl7iC48dUNUbtkFDITCGeDA
 XDBE/RJibf2XWyre3d12wYZB6Ue+8lwM/ib9L6ZZ01tzCNhnj+krgO4i9
 HGThNkOniI+hcqcUEVKgK++CLugP2A2C2LAY7PH1lHTajnVFDY6Ix0xDm
 VICqMN7eMRhvkwPzQzxpDJj2O6lKFahDVoUf+cN8nTpTzzcLsqUdumC/T
 iVEXM020q81YzfCL6IVOUjKLcWIVksqoa5pN/vcZMNadpt8/nBbbTFh3v
 CKppuIqJFzOoQQ/1LYjzPMTSo3u+I6ahpYqX4Oh/S/HCa5ZE+qJ4foPP/ Q==;
X-CSE-ConnectionGUID: oLvlNrtlS/mc7wOFXj7QOw==
X-CSE-MsgGUID: zv3v6BFUQtWkqdQoJwN8Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62346785"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="62346785"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:13 -0700
X-CSE-ConnectionGUID: nNWF45roTFqFVZ1NhuuF2Q==
X-CSE-MsgGUID: 7lepR8JiTWaZc2jrHwy9yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170607766"
Received: from dut6306bmgfrd.fm.intel.com ([10.36.25.21])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 0/2] Add a test for tail address wrap
Date: Thu, 28 Aug 2025 21:49:05 +0000
Message-ID: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
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

Use buffer overflow logic to implement tail address wrap test. To do so
refactor the buffer-fill test before implementing the new test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Umesh Nerlige Ramappa (2):
  tests/intel/xe_oa: Clean up buffer-fill test
  tests/intel/xe_oa: Add a test for tail address wrap

 tests/intel/xe_oa.c | 101 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 16 deletions(-)

-- 
2.43.0

