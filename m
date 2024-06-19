Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17A57C27C53
	for <igt-dev@archiver.kernel.org>; Wed, 19 Jun 2024 09:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE35B10E246;
	Wed, 19 Jun 2024 09:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EYNW242i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207AB10E246
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jun 2024 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718789329; x=1750325329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ko778WQXkS+WYNHEKiksaZYVlbPDkL6435feCk/GX8Y=;
 b=EYNW242i01/DQiuZg19kwhXGmwH+o5ZkqBDSL4bvN/CGntW8tQb6pra3
 deEEr9y55cCuSi2eoPbPULSKtknrwoUOqA5vuAtzKoev21L7I76ZUWOTh
 ETdADxxsXpPbRA5PpvdjycuDsWw0SmPcuEybuX4lEUYbHoOJte23bdhXW
 u0ICOBlY3iMkJJVjEOtRC7BV4R2GVMKQsISpqsLU+tJDlWMhfYD78aNTP
 6/Fcswejb+qtfBXh/2T7qSZ1+fzgpajYG5DI6+eHQHtvwsz/b/wnw+OkN
 RSgc6n6VG5veneB3zQYH+F47QAnvLyQtjLgNAQ3epgZaU/gjXE+cHG6Pq g==;
X-CSE-ConnectionGUID: 5KcyFMeVRZ6EGwMy3WzGsA==
X-CSE-MsgGUID: GFFOzoVnRX6NhczqFm1oWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="33262444"
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="33262444"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 02:28:47 -0700
X-CSE-ConnectionGUID: T+xagP54Qx2O405WAPAqNw==
X-CSE-MsgGUID: Kl5zeV0UTP62ucpVhTucqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,250,1712646000"; d="scan'208";a="42573058"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 02:28:45 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] tests/intel-ci: Block unsupported KMS tests for i915
Date: Wed, 19 Jun 2024 14:50:49 +0530
Message-ID: <20240619092049.4131162-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Block KMS tests those are specific to (display_ver > 14)
are not applicable for i915.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/blacklist.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index f6e9bb474..d01ef5e16 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -140,3 +140,6 @@ igt@device_reset@reset-bound
 
 # not working for i915
 igt@kms_bw@.*
+
+# Tests specific to (Display_ver > 14) are not applicable for i915
+igt@kms_vrr@cmrr
-- 
2.43.2

