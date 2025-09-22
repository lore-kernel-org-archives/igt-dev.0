Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206D3CAC5A7
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 04:02:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30CE10E3A1;
	Mon, 22 Sep 2025 04:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AwPT5YVf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2ED10E3A0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 04:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758513740; x=1790049740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1eJQ0IkbNxh6BEUsgz/z3kej6wiEyOO1GrGaw2iY0IE=;
 b=AwPT5YVfD0SYuB98HtuUUZNAD7/e2wHHSSm8wfEc9nBoXcGALhFn2zeh
 NPQ8ePnErK1LH7jImCIPklq0FCawp795ACaFFK2NuHazJdltz+ACcLtU+
 EJTysUzb7b3qUwDoERjgBK4LNtdSxry/VRngbTKSqqcLhjfyu/Od8yY+a
 2gW4C5ZXMl/Q1TX3M8I/Qm7xHklsyCMeIpMSAKe2Mx7VGMNtBITKKgFVa
 t1vEGMdttoHac/7m9HcPH/AL1pXRR5GawumB4P5sLM3tIYbu1KMJb6k0N
 /5w0J9ui0rGkF2Aq6OVjdEj0YumHhYBj4k6Ur4BYxbcYvuizQwMbrPUpA g==;
X-CSE-ConnectionGUID: zQTnhxm7QdmZT5ottIIFfA==
X-CSE-MsgGUID: 30iCVbm1RhOAnJfhI/EuxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="48347795"
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="48347795"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2025 21:02:05 -0700
X-CSE-ConnectionGUID: SGkJXSphR6KMnQ3Kb88zlQ==
X-CSE-MsgGUID: Qk5s/ecyQj6lNO8sCJOM2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,284,1751266800"; d="scan'208";a="176192634"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 21:01:59 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Mon, 22 Sep 2025 09:31:49 +0530
Message-ID: <20250922040151.1374078-1-jeevan.b@intel.com>
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

If an eDP connector is present, prefer selecting its default mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not be compatible with external displays. To avoid invalid
clone configurations and test failures, we choose the default mode
from the eDP connector when available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/kms_setmode: simplify mode selection by removing goto
  tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode

 tests/kms_setmode.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.43.0

