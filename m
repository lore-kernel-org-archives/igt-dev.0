Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B89606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WQONfU3g
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14A2C10E869;
	Fri, 27 Nov 2026 04:47:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CE110E869
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 04:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795754709; x=1827290709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=65dsNLLIldYxjFdgoNRQBlcEPwfgGTs9jPE3PGjHqcE=;
 b=WQONfU3gtVH/KS1+WZS3131dMggkG3qoaDaLqBSfKIdrRazD7rGYx/C9
 tMmZ/ouOjNIIitK1KtXUE5dzb4iSqS7uDqZoUJb4F2m4HLzv9cTzIEQVh
 4RXAhYHArB2Qmo7lG2RAvIOCGHkuL5kmtGSti5e55bOcpTVHeiNVetOia
 bOShbWT+AQdhY+TMb9BOggCXcEW3SDCjMfAal/4FdQjjfdEivjPloYg0V
 sKNUD3xHJOWQwy4JMkr0iZOZOKMSaZ3Z8QY6+ryLY6ANWizzOOErjpDh+
 GcNKUzsAOZnsHr7a7gHxJj80CSXMGlGw7jxGUHH+JCkzYnIseCfzkCGGv g==;
X-CSE-ConnectionGUID: CuTi8fzDTJ6gcFv20whwYQ==
X-CSE-MsgGUID: Wmk96/4gR76B7VnwRXcraQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4674227"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4674227"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 20:45:08 -0800
X-CSE-ConnectionGUID: n/UfQjERRhm9f0ZmfjLBsA==
X-CSE-MsgGUID: 6l2hze+HRN+LggEy93y30w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12096061"
Received: from hgirotra-desk.iind.intel.com ([10.190.216.57])
 by orviesa008.jf.intel.com with ESMTP; 26 Nov 2026 20:45:06 -0800
From: Himanshu Girotra <himanshu.girotra@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramadevi.gandi@intel.com, nishit.sharma@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [PATCH i-g-t 1/2] lib/intel_compute: Enable TG preemption for
 Xe3p_XPC 35.11
Date: Fri, 27 Nov 2026 10:15:03 +0530
Message-ID: <20261127044504.4119774-2-himanshu.girotra@intel.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127044504.4119774-1-himanshu.girotra@intel.com>
References: <20261127044504.4119774-1-himanshu.girotra@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Graphics version 35.11 (CrescentIsland) advertises only WMTP in the
compute preempt table. Thread group preemption is supported on this IP,
which uses the same xe3p preemption path (COMPUTE_WALKER2) as 35.10, so
enable PREEMPT_TGP as well.

Signed-off-by: Himanshu Girotra <himanshu.girotra@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index ecf4e3bf0..12362742c 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2881,7 +2881,7 @@ static const struct {
 		.ip_ver = IP_VER(35, 11),
 		.compute_exec = xe3p_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
-		.preempt_type = PREEMPT_WMTP,
+		.preempt_type = PREEMPT_TGP | PREEMPT_WMTP,
 	},
 };
 
-- 
2.53.0

