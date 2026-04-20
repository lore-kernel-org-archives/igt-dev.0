Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030B1F3ED73
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 04:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A506D10E02E;
	Mon, 20 Apr 2026 04:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YcoDRnBm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479CA10E02E
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776660867; x=1808196867;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wxfk4FY8Rrrd12y3WkddamWDAliPoqxDaEhH+yVy+tY=;
 b=YcoDRnBm9me+CdNOlkZuhxRvOZaW0walDtWtj2ycyGA3vkVlEYT/grt/
 cVwb4CQfCiF8BOs4QfiJNR6XMAzvg8Mzvuu4tNZjdi9BhBvVQho/MpY68
 7eKZEcRs/uQlz5c/FUXC8+kaxYJHuC+y601NmhELe8zdezrdtXSbkM46B
 82Wrb4LUJ0wHPHs/+D53c0/LuY+jl2fjVXVT4hDRzOPS1XHAT+G0MXIoT
 mEWwaA7aHi4K7fJ3B1G3DKNJTRrdd8QaGamB8Lv9SnEQUR5SO4gk/tE5P
 6Zmoqmn1oYEaMlCDOwqsfx4e+RUDSXV9e61tTJeGHckdbbT4Tt0ADwKkK A==;
X-CSE-ConnectionGUID: ApcK5asHSuWrS7kXB0+5PA==
X-CSE-MsgGUID: fWLdNSq7QRK21LIdRM1p+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="76596814"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="76596814"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2026 21:54:26 -0700
X-CSE-ConnectionGUID: 0yDwzC6/RWyokHc3LZVT+A==
X-CSE-MsgGUID: e6hjBqmKR8G/mDq1PVgObQ==
X-ExtLoop1: 1
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa003.fm.intel.com with ESMTP; 19 Apr 2026 21:54:26 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 matthew.auld@intel.com
Subject: [PATCH 0/2] Negative tests for VM_BIND decompression
Date: Mon, 20 Apr 2026 10:27:22 +0530
Message-ID: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
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

This series adds negative test coverage for VM_BIND decompression.

Patch 1 adds resource management structures and helper utilities
used by the VM_BIND Decomp Negative tests.

Patch 2 implements the actual negative tests covering invalid uapi parameters and
ccs corruption scenarios.

Previous version:
https://patchwork.freedesktop.org/series/162838/

Smitha Balasubramanyam (2):
  tests/intel : Add data structs & helper utilities for VM_Bind Neg
    tests
  tests/intel : Add Neg tests for VM_Bind Decomp

 tests/intel/xe_ccs.c | 1026 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 1021 insertions(+), 5 deletions(-)

-- 
2.43.0

