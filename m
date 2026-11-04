Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B521606A33E
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=K5a+aCeK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095AF10E8AB;
	Wed,  4 Nov 2026 13:08:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C53610E130
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793797662; x=1825333662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tdfKW+83n3xAthnb5LbMFiak9fJ8wJohG4rZDlb7D/A=;
 b=K5a+aCeKrdCnW8VG8hQoXaRygmu+KCWrPJSWoetziId5sPxYI/POz7Id
 wkn6N6Mn4k09iEka4JP5gf6wCQnagSdVI9z2xU//HKAr8xWE9sutPtRL2
 aWf8EdkMSEPALJq81PXr6DaiKmdR1eZr4OxZXPv4LYb76E91Fz6BdYIId
 oUztm3Z2Au+gA4TyyVJWNSpO5BVLOtUBG/W6yVYibxrzwjp/Y6A3hr/7S
 LUGvSEil9rzH/QYKswMbWnGBsVAjjfzJdKm8TnCDFOheT2lvliP3EVvqO
 6as2e1tjGksCd3nrPFJF0yBip0mNc6shFnd3QJ165CNDAmdkGfYeiaXtL A==;
X-CSE-ConnectionGUID: rhpIBmeLQkGzcmNVcUNCvw==
X-CSE-MsgGUID: 3UE73MTiRXGDHCyzPRS0sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2424637"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2424637"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 05:07:41 -0800
X-CSE-ConnectionGUID: M+7nyiLQSFqMj6A8yBnqnw==
X-CSE-MsgGUID: K6FO0lrrQoabhXZqPVB2hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6565695"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by orviesa008.jf.intel.com with ESMTP; 04 Nov 2026 05:07:40 -0800
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t v2 0/3] tests/intel: validate PSR2 selective fetch under
 joiner
Date: Wed,  4 Nov 2026 13:07:34 +0000
Message-ID: <20261104130737.2549248-1-mika.kahola@intel.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is the v2 of the series [1] with the following updates

- Skip the test if joiner is not supported on eDP.

[1] https://lore.kernel.org/igt-dev/20260921124408.358774-1-mika.kahola@intel.com/

Mika Kahola (3):
  tests/intel/kms_joiner: Pass output array into test_single_joiner()
  tests/intel/kms_joiner: Add PSR2 selective fetch test with joiner
  tests/intel/kms_psr2_sf: Handle the joiner

 tests/intel/kms_joiner.c  | 101 ++++++++++++++++++++++++++++++++++++--
 tests/intel/kms_psr2_sf.c |  22 +++++++++
 2 files changed, 118 insertions(+), 5 deletions(-)

-- 
2.43.0

