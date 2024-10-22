Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0287D1CDD5
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:55:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A34F10E66A;
	Tue, 22 Oct 2024 10:55:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oFnvA3lT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FD0910E66A
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729594535; x=1761130535;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e39UlJ5fzniFgTe8KBSksehKK3DqVM4VQUy2wR+3b5Q=;
 b=oFnvA3lTgz4qzGzBn7N7tQGCV4V95SUIJBpi+X4DuElsg9+gVXmflCKd
 a0wEUEXbhWji4YkyVxCS7Abxv+q/evY7y0LfPWSfKHIRHihjrYFMUOqcp
 2wHS7AKtuDOibrqWU18/bjeIqMrUDMCoyYushBejY5zOqP5e28GE3of2L
 ZJ//VbYW4JJWvB6KEtXvfRiW/UTy4LWD085Z66d47rLtKdNrXBeXU/nM/
 WcR8gzlgeoWOBGI01FVAEn6PT32rjdK/U2K5e6REDMWgwyyH3/jQzHXGa
 1y3xGgDYnwShfxHq8basW69chGO/0dBcLhvWAx+9PWz2gBHf75TEWBNFH A==;
X-CSE-ConnectionGUID: q5zOiQWCS9qKBsOvmkToVQ==
X-CSE-MsgGUID: YXBR+XGES5mPtCLvcpmxsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="16749566"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="16749566"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:55:34 -0700
X-CSE-ConnectionGUID: x/s3eDmfQ5uei8lh3XBzaA==
X-CSE-MsgGUID: ckubNcvES7iNal8K3/KnIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="110653801"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.145.169.150])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 03:55:32 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, sk.anirban@intel.com, riana.tauro@intel.com,
 badal.nilawar@intel.com
Subject: [i-g-t, v3,
 0/2] tests/xe: Add tests to validate GT coarse power gating status
 and toggle coarse power gating states
Date: Tue, 22 Oct 2024 16:19:16 +0530
Message-Id: <20241022104918.2120652-1-sk.anirban@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Sk Anirban <sk.anirban@intel.com>

Implement test cpg-basic to validate coarse power gating status
after S3 cycle.
Add test cpg-gt-toggle to check if GT coarse power gating is up when
forcewake is acquired and down when released.

v2: Address cosmetic review comments (Riana)
    Fix suspend state (Riana)
    Add exit handler for test cpg-gt-toggle (Riana)

v3: Address cosmetic review comments (Riana)
    Fix commit message & test name (Konieczny)

v4: Address cosmetic review comments (Riana)

Sk Anirban (2):
  tests/intel/xe_pm_residency: Add GT coarse power gating validation
  HAX: Add Coarse power gating tests to fast feedback list

 tests/intel-ci/xe-fast-feedback.testlist |  2 +
 tests/intel/xe_pm_residency.c            | 90 ++++++++++++++++++++++++
 2 files changed, 92 insertions(+)

-- 
2.34.1

