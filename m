Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722F6606A31B
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 21:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AOQP8HLs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248A110E358;
	Tue,  3 Nov 2026 21:14:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB9010E21F
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 21:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793740395; x=1825276395;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nYYYeAQ8wll1uCGGEVvryAY1Myam+bmIlxpeAaZr010=;
 b=AOQP8HLs8aeayn/IiOTFQAHFQcWNQN3F0kuopooQIMRfahl3SuJBwGMk
 gacp0Sph6PycIihco0VYxAR1PMqpbhqZ52vig6iBQJHHrY8/U4O67qeh3
 UilXBDRZo+zdL0SOJdnJZ/tC05twmyMsgRIhlBW4T0zAjWF6YMhnrzqJU
 2ui03AeMcPzuHjORjX+rtb3LodViilEEwAqon5sDpU6FprNkkdj+ilYdu
 Ax3gyyLHbzBfv78OeIYNweLVgy5qNDn1efSSMMarB7T4aUzdGaToONFFm
 PhcVSww8bHAxtQyHaWOvipn5kbyPmq1fAw1bmpAHUWqS/5Sw1WzJmVwJF Q==;
X-CSE-ConnectionGUID: F8oKZXlYRsCIZckAOXl+2w==
X-CSE-MsgGUID: SuGQaNj7RzWTNv78iDgXNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2376350"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2376350"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 13:13:14 -0800
X-CSE-ConnectionGUID: D8AVpgRhTB275UrYd/kKZQ==
X-CSE-MsgGUID: fxbD1bBHSFC+e9uSD/Kr2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6440019"
Received: from rabbit.fm.intel.com ([10.36.54.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 13:13:14 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, himanshu.girotra@intel.com,
 ramadevi.gandi@intel.com
Subject: [PATCH] intel-ci: Block xe_oa render test on CRI
Date: Wed,  4 Nov 2026 05:13:08 +0800
Message-ID: <20261103211308.232161-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

CRI does not expose a render engine, so the test
xe_oa@unprivileged-single-ctx-counters should be blocklisted, as it will
hit a skip condition regardless.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 41328186cc..57e3141e0d 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -23,6 +23,7 @@ igt@xe_peer2peer@.*
 # Valid skip: No render engine support on CRI
 ##################################################################
 igt@.*render.*
+igt@xe_oa@unprivileged-single-ctx-counters
 ##################################################################
 # Valid skip: PAT index tests targeting older/different platforms
 ##################################################################
-- 
2.43.0

