Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B4C606A330
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ME/s2syV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D2CF10E5F1;
	Mon, 23 Nov 2026 07:27:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5079010E5F1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 07:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795418760; x=1826954760;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fnXnkBjZaroBuZR0ruX+M3Mmqe6TRkhfMEhMRmI4+4Y=;
 b=ME/s2syVcyXahMcCzw5HK1edgFvEROnQmd8nen+Yb1wJ+Arc31uHwPMS
 M8XBGQclrefLbZbhgWL/nR5JjvssG0lXv2FcMKHCVXvjoujeiVYO077Vc
 GmQsVWUknsWgArM2YU+uchm85VkVSG401/LvaRWHZAlJt9RNS3GKCKGHK
 aFcaJByeB0gLFcpsJTeKSZIyZXe4S/TbPpcMEuQdY1IrANbeDRM5toLAg
 TKppemb8h0GFYEIBfQIU5uu+4jRdQijjeKVaIMgd7CTjCvd/LSQVeVH45
 h2PjdE6dcwiGi3ovju/P87JQIu6hTjA/RyS0c0FPkQWjYbvKHbBl9Ct7U w==;
X-CSE-ConnectionGUID: Ug9AqtxDS9KYjpW9o1hlVA==
X-CSE-MsgGUID: 2Ijied9CRLyP8wzwA4J4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4225358"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4225358"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 23:26:00 -0800
X-CSE-ConnectionGUID: oIeXryC8RW+/swF5Dj/voQ==
X-CSE-MsgGUID: aJvdE9XmSmO+fmcu9Oc90A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11241545"
Received: from shawnle1-z890-eagle-wifi7.itwn.intel.com ([10.225.64.208])
 by orviesa002.jf.intel.com with ESMTP; 22 Nov 2026 23:26:00 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Shawn Lee <shawn.c.lee@intel.corp-partner.google.com>
Subject: [PATCH v11 0/2] tests/kms_vrr: Add full-range refresh rate testing
Date: Mon, 23 Nov 2026 07:24:07 +0000
Message-ID: <20261123072409.294287-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Shawn Lee <shawn.c.lee@intel.corp-partner.google.com>

This series extends kms_vrr to validate hardware stability across the
entire VRR refresh rate spectrum, rather than only fixed step increments.

The first patch reverts a previous workaround that started virtual RR
tests above the midpoint to avoid mode fallback. This workaround is no
longer needed once full-range testing is in place.

The second patch introduces a 'full-range' testing mode to kms_vrr.
When enabled, the test iterates from maximum down to minimum refresh
rate (stepping by 1Hz), covering all supported rates within the VRR
range. For eDP displays, the test is skipped if the panel does not
support multiple refresh rates. Standard behavior (min-to-max with
defined step size) is preserved for existing subtests.

Lee Shawn C (2):
  Revert "tests/kms_vrr: Start virtual RR test above midpoint to avoid
    mode fallback"
  tests/kms_vrr: add support for full range refresh rate testing

 tests/kms_vrr.c | 122 ++++++++++++++++++++++++++++++++++++------------
 1 file changed, 91 insertions(+), 31 deletions(-)

-- 
2.53.0

