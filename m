Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22935C27C6E
	for <igt-dev@archiver.kernel.org>; Fri, 14 Jun 2024 09:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886D610ECC4;
	Fri, 14 Jun 2024 09:50:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LmIzjKxI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DAA10ECC8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jun 2024 09:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718358627; x=1749894627;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=piG1dz6FbNCGmC0lkVALgdC+SvFItCBstu5UDQpYS8Q=;
 b=LmIzjKxIQu/PiXZffV883PH06RUviC/nC+8kSvMXpCk1fZhtybwVtGbc
 k4LQihplh1ey3Zt8O4jksJqKZHsWoBrxOJee7I0Kb/1jVBgglgyZKV9l/
 YbBsX2xaHHbxUPoE/OrcDQvUZXXz9b8OQuZz7YUPVqHl4jmtWlyUGkicK
 fXNqrw9sfK3M7oAzpNzqTuzyW6DWTLzYmn8uaFHoR+xQ4nwOpal8VeidK
 0oYiSGCeOvkss5S8ici2Zg9btJ3PwdccWK6TufRHBlo/K5awx88QuSSbl
 oLyItLdl6otTLF2mpoivbiUhvKW7qP/4hZre0S6FZTU//hlifynvm9M8M Q==;
X-CSE-ConnectionGUID: 9cFVwwihSR2NL0i3tXxtoQ==
X-CSE-MsgGUID: Py4fuaYsR42SuitKQ6lEVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="14970728"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="14970728"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:50:16 -0700
X-CSE-ConnectionGUID: VpOm0cM6Rt6JQQK6fgVEzA==
X-CSE-MsgGUID: vLuv5PEbTNGX4lBcLwkUXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; d="scan'208";a="41129627"
Received: from bnilawar-desk1.iind.intel.com ([10.145.169.59])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 02:50:15 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinay.belgaumkar@intel.com
Subject: [PATCH i-g-t 2/2] "tests/intel/xe_gt_freq: Fix freq_low_max test
Date: Fri, 14 Jun 2024 15:37:12 +0530
Message-Id: <20240614100712.38276-3-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240614100712.38276-1-badal.nilawar@intel.com>
References: <20240614100712.38276-1-badal.nilawar@intel.com>
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

Intention of freq_low_max is to validate GuC PC flow when max freq set
to less than min freq. Validating cur freq is enough as workloads are
not being run.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_gt_freq.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
index 24333612b..b3562181d 100644
--- a/tests/intel/xe_gt_freq.c
+++ b/tests/intel/xe_gt_freq.c
@@ -277,7 +277,6 @@ static void test_freq_low_max(int fd, int gt_id)
 	rpe = get_freq(fd, gt_id, "rpe");
 
 	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
-	igt_assert(get_freq(fd, gt_id, "act") == rpe);
 }
 
 /**
-- 
2.34.1

