Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327C3D4336B
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 05:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941710E32E;
	Fri, 12 Dec 2025 05:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bderQhS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7076510E32A
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 05:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765519014; x=1797055014;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bvE+6VpfLwbXRIDgR+yyORo2W+OiF1wcGNXgTV+5HvE=;
 b=bderQhS1sxRKUCUcbPCoxCp8u9O6G2n2B4icpHpobFV7289iv73C40iT
 HBKfPjUI09bXyXuboUNNxDrC2k91Kej8e1m334f48H6llMvCC6XyNwBZA
 E1Jb0St0mxqs5c22Akmk0juwIgHGdy1xY+nEDaJ+26SFnofEOgYDxQoWc
 /RH3LjKfgVecDhcy+ynqJ/plW0cqO6ll8qIXUt6dkzEYakRHa8DfMEuBO
 TQ3w/5p9V3N4LzSEXEKtWx2PRcCLp2WIWYUaejpPm/mNKXNDrPXCjNXI1
 62oAqZle4nq+zFziSWLRFqyopcQXsLjCCnVVNgfZqEXle5ejPu7mIMqxc Q==;
X-CSE-ConnectionGUID: T7KWRg9nT8+DQtPdvmBYQw==
X-CSE-MsgGUID: smSsHAn1RbyD8k9OpUXzDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78972125"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="78972125"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 21:56:53 -0800
X-CSE-ConnectionGUID: Sh0yIZ1MQ4CfHZO2Z16pIQ==
X-CSE-MsgGUID: DvUQlzzUSBmZ1a8driT1+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; d="scan'208";a="228058540"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 21:56:51 -0800
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, santhosh.reddy.guddati@intel.com,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/kms_joiner: Add function for pretest
 checks
Date: Fri, 12 Dec 2025 11:27:14 +0530
Message-ID: <20251212055717.2870018-1-karthik.b.s@intel.com>
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

Revert the patch which was added to cleanup the igt_require checks by
adding them to subtest groups as this can lead to spurious skips and
corresponding noise in logs.

After the revert, add the clean up patch which moves the igt_require
checks in invidual subtests to a function which is called from all the
subtests to avoid code duplication.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>

Karthik B S (2):
  Revert "tests/intel/kms_joiner: Cleanup igt_require checks"
  tests/intel/kms_joiner: Add function for pretest checks

 tests/intel/kms_joiner.c | 243 +++++++++++++++++++++------------------
 1 file changed, 130 insertions(+), 113 deletions(-)

-- 
2.43.0

