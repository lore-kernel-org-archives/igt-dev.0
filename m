Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462CF606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mp40+kIp
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE17110E869;
	Fri, 27 Nov 2026 04:48:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F9110E87D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795754710; x=1827290710;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WSCoLSKzl/f4uUnC8F+qtc3c5S9PZ5GpDmt+8rp600M=;
 b=mp40+kIpP7eCNw0nu1Dl2um6v7v6sJ2GYkFwbRSDVLr1LWZXY3p1pPUD
 5G6NGP81l0h2KLyM0u4xrlWJF13wJeFSPS6E1U0YW2fq8lU2SIoBWXmUu
 LiAwVT/Mxkk/vzHOS3LWHPxHoDJ01n6b7tEdThHMr/aGTLpwtIH5b6rpE
 +mSjcKO99dLwu2o12LTVphIw33AW1dk+73ZKSL9XIG+oZkjz5DJ4s55yz
 17GsgYZ9UYAmL4zG3+p4PvYXlHf01wIRa+Z9yfPkVC1IeLDArdaZtrAF1
 zBui5Gebe9nzIa7TX/ZnuKwUOlHOstbCjieV2mZ+E89rWmUA1EVcmuabl w==;
X-CSE-ConnectionGUID: VRB/wdexSfaTA7LuG7Yz6A==
X-CSE-MsgGUID: 57zNkyfbTd2eJlhCj6eIBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4674228"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4674228"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:45:10 -0800
X-CSE-ConnectionGUID: ZbORr7FtTkexrWfIqekADg==
X-CSE-MsgGUID: jtPjQIcFQ7WT2Fn4fto/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12096066"
Received: from hgirotra-desk.iind.intel.com ([10.190.216.57])
 by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 20:45:07 -0800
From: Himanshu Girotra <himanshu.girotra@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel-ci: Unblock compute-threadgroup-preempt
 on CRI
Date: Fri, 27 Nov 2026 10:15:04 +0530
Message-ID: <20261127044504.4119774-3-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044504.4119774-1-himanshu.girotra@intel.com>
References: <20261127044504.4119774-1-himanshu.girotra@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thread group preemption is now advertised for CRI (35.11), so drop
xe_compute_preempt@compute-threadgroup-preempt from the CRI core
blocklist.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 6b77523d6..d1d786d2c 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -42,10 +42,6 @@ igt@xe_evict_ccs@.*
 igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads
 igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-(single|multi)-vma
 ##################################################################
-# Valid skip: Threadgroup-preemption not supported on CRI
-##################################################################
-igt@xe_compute_preempt@compute-threadgroup-preempt
-##################################################################
 # Valid skip: Tests requiring multiple CCS (Compute Command
 # Streamers) engines — CRI exposes only a single CCS engine.
 ##################################################################
-- 
2.53.0

