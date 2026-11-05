Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E61F606D801
	for <igt-dev@archiver.kernel.org>; Thu,  5 Nov 2026 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jj4QTffx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA50D1123DB;
	Thu,  5 Nov 2026 12:46:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FB2F1123DD
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Nov 2026 12:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793882704; x=1825418704;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9AQ0/oty0i9jO7LHykLdlF16jPtYxaoxJiVyrxN9XUA=;
 b=Jj4QTffx5w7KnZk0C8Qe0SMn56j43OXW5BrxJIEHhJ4tmRHuxMBce5Jn
 CW2WCZEkpiuJJx84gxCavT/LE8jyDuXS+UuCtnVCXiEuoFgfaFUCtA9WN
 AFbBCnow3cxVCkOpkvLfMAnMxk2z9ThHytfZb7JPpJwL70HPrZ8Eh21kE
 PJgNiEYDG22+vnf3uHcRjj4X1Mua5x3s/+leuJTFhMwwXnefris+IR8rh
 QPh/9/Fw+WejL9LT2bJ5PcS1AxRPBLvfBwpl5IiSA4uVIav/Cyg2fz3GK
 XG32HzREOlxIHziCOWJfU08TWNOg8n12ck7pk/wHn8F0e5d6fRHNIK+IR w==;
X-CSE-ConnectionGUID: bFtMcUGiQ7eiFpca0io0bg==
X-CSE-MsgGUID: mzSWbM5xSw+DcxvrgkWYMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2768222"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2768222"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:45:04 -0800
X-CSE-ConnectionGUID: Th5Ws2+5QZ25P6Oh+fC8AQ==
X-CSE-MsgGUID: 5wuJ0m+0SQ2YKEce047YLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6885966"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 04:45:02 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v6 1/2] tests/intel/xe_wedged: ignore expected wedged dmesg
Date: Thu,  5 Nov 2026 18:00:04 +0530
Message-ID: <20261105123002.1368655-5-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105123002.1368655-4-sk.anirban@intel.com>
References: <20261105123002.1368655-4-sk.anirban@intel.com>
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

Add GSC proxy, wedged recovery and SIGID based failure
messages to the expected wedged dmesg filter.

v2: Modify dmesg_regex (Riana)

Suggested-by: Riana Tauro <riana.tauro@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_wedged.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
index ba7efbe1d..2dcab029f 100644
--- a/tests/intel/xe_wedged.c
+++ b/tests/intel/xe_wedged.c
@@ -56,6 +56,9 @@ static void ignore_wedged_in_dmesg(void)
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Fault response: Unsuccessful -EINVAL"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: Engine memory CAT error"
 				    "|Tile[0-9]+: GT[0-9A-Fa-f]*: GuC: Uncorrectable"
+				    "|GT[0-9A-Fa-f]*: Invalid gsc header in proxy reply"
+				    "|SIGID=[0-9]+ .*GT: reset failed"
+				    "|SIGID=102"
 				    "|SIGID=203");
 }
 
-- 
2.43.0

