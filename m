Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBDC606A329
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 23:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T0HzT8QL
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEF6110E713;
	Mon,  2 Nov 2026 23:09:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD68910E713
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 23:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793660942; x=1825196942;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TFBqTZ9RVlLHdtXQb3bEgIBEjgP9hIWe+PNUxr2iE2E=;
 b=T0HzT8QL7ldDPbvGIhKQTMUE8NEmDlKafT1vXf9yEIYI0ZxrVnI9s5OL
 HMicXntyYWYFmBRGYZPgSS2+Rh7/3hUmRvx2wJq7HeJWc3SmcLROg2QP2
 FjtgvVng1YcoJX972gikHT8Z0Bx+ssdLAfN1wNcNTBHeZbEz+FQ8dRZ/e
 +1X4NxMNj0LNuW/yxs8IBSQx6tXL7nOIRMzPERcZdz1K2ohyuWNWudZWn
 0vjvw5O8tgjgsaYYnKxYq4rlNz1HUnHJSFQvdifSdE6BJ/2N9prx6Q0vC
 DETN4cGZbN/ANpRK4V+r66valRl8ch+6Z1ek2DicTMZfSRJwNfHdRDUSp A==;
X-CSE-ConnectionGUID: AlV0jjCBQUO1C+g70onMGg==
X-CSE-MsgGUID: vdC1LmuuTxWJO7vgLtFnMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2376482"
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="2376482"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:09:01 -0800
X-CSE-ConnectionGUID: UrtyHjJnTl2zC6lVlvRkyw==
X-CSE-MsgGUID: KZ/CwayYQ8O5gAv8KgKGRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,192,1787036400"; 
   d="scan'208";a="6339634"
Received: from rabbit.fm.intel.com ([10.36.54.170])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 15:09:02 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, alex.zuo@intel.com, himanshu.girotra@intel.com,
 ramadevi.gandi@intel.com
Subject: [PATCH] intel-ci: Block more render tests on CRI
Date: Tue,  3 Nov 2026 07:08:54 +0800
Message-ID: <20261102230854.89148-1-jonathan.cavitt@intel.com>
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

CRI does not expose a render engine, so the tests
xe_pat@pat-index-auto@render and xe_oa@unprivileged-single-ctx-counters
should be blocklisted, as they will hit their skip conditions
regardless.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
Cc: Gandi Ramadevi <ramadevi.gandi@intel.com>
---
 tests/intel-ci/xe.cri.core.blocklist.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/xe.cri.core.blocklist.txt b/tests/intel-ci/xe.cri.core.blocklist.txt
index 41328186cc..254654422f 100644
--- a/tests/intel-ci/xe.cri.core.blocklist.txt
+++ b/tests/intel-ci/xe.cri.core.blocklist.txt
@@ -23,6 +23,8 @@ igt@xe_peer2peer@.*
 # Valid skip: No render engine support on CRI
 ##################################################################
 igt@.*render.*
+igt@xe_pat@pat-index-auto@render
+igt@xe_oa@unprivileged-single-ctx-counters
 ##################################################################
 # Valid skip: PAT index tests targeting older/different platforms
 ##################################################################
-- 
2.43.0

