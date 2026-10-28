Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CD8606A325
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YE7IkIHC
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2C510FC6E;
	Wed, 28 Oct 2026 13:46:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588BF10FCAB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 13:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793195111; x=1824731111;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q2uMPOloyRSz/YecwJK7GCVOtnb3mRwEf4zk8nF2P98=;
 b=YE7IkIHCYOCP1Z4jRsE6BtJ1Rp+OD13AR75iikwdZbpR0zUZoQem9/nA
 aAr6SdoUcwi6fF1kyQioFlkUuDZeIrCigKJ2a2YmXfPeVPpmPjB67K2N0
 jwdB07wHaHJsowyjLUhrldC7+S6XUJwRGzgvDc/T0lzqy5LfYe4otv3wJ
 P0+6pLK08oiB39nFbmooHWKcFsAHggA6LrMOEcO82DQTPYnxTw4+XkjCH
 rTxLJ2Uq5FsL5s6EKwtLVQnc4zAdV/dgoyh0z1Bi6a7yjqgt3JxYwCP1k
 P+FlnZGw8/MfTq/zdczanwqlXs0qgzBgkqb+nR2qybBNgm/K71G5q4WrJ g==;
X-CSE-ConnectionGUID: on6I8DrDRVy3aGcElkSa8Q==
X-CSE-MsgGUID: +GyDSKN3RXmB+o8x0D+wug==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1811938"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1811938"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:45:10 -0700
X-CSE-ConnectionGUID: P30znMtvTJ+x6JPuXGBu/Q==
X-CSE-MsgGUID: SMX4CTsFRbiXWz5uU7Gi/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4831226"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 06:45:07 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v5 0/2] tests/intel/xe_wedged: Add cold-reset wedge test
Date: Wed, 28 Oct 2026 19:00:46 +0530
Message-ID: <20261028133045.1966466-4-sk.anirban@intel.com>
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

Inject cold-reset at probe, validate the WEDGED=cold-reset
notification, and verify the device is functional after driver
recovery/rebinding.

v2: Fix restore flow (Mallesh)
    Cosmetic changes (Mallesh)
v3: Fix verbose and dmesg regex
v4: Add code comment (Riana)
v5: Modify regex (Riana)

Tested-by: Sk Anirban <sk.anirban@intel.com>
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>

Sk Anirban (2):
  tests/intel/xe_wedged: ignore expected wedged dmesg
  tests/intel/xe_wedged: Add cold-reset wedge test

 tests/intel/xe_wedged.c | 117 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 1 deletion(-)

-- 
2.43.0

