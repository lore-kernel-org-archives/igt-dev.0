Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5465D606A31A
	for <igt-dev@archiver.kernel.org>; Tue, 27 Oct 2026 05:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YI30+En8
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0314310E212;
	Tue, 27 Oct 2026 05:32:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE0210E212
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Oct 2026 05:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793079100; x=1824615100;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jnAIqqTIvuiSD+iBQRmfjKvM3pfD+KsIwy4wijWnee0=;
 b=YI30+En8ezKkRWrLarip6fOgvN6bukuZh7IWOIinbfFmNjkEe1opavuO
 i7Kl899f30cnE1eECySaO0K/WtoGkaPSc4Okyl252n/Dh4TJt9XSO3Z2m
 lcZeFgJhyzldCMd+ygGB7Q6O7wkDRcjpi7CmqdI98ZqMZgtRfedtj/zAV
 GgK2A06/bmWTMK/nZfWHvjGDEfy0HJC5lzgvpa4nYw93HcvHljNw+AH7W
 iVbU1PCCqwRCwQS7p85uSKSfZt6bq1vbYgcN6BedNigDjGNJLF5STTfXf
 OQf5BzDoSrPQBAF+WxtEFCIKOS1qXELC6+eRoQSHNPW4ytQN3Nj4FWmzv g==;
X-CSE-ConnectionGUID: FpNFavwuThSvgqIDYjzZWw==
X-CSE-MsgGUID: HJpOsiRISKifHn+0M6A4Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1660544"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1660544"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 22:31:36 -0700
X-CSE-ConnectionGUID: FDGQDO3LQpWypbBCVWAF/A==
X-CSE-MsgGUID: yJB0xqrtRliPdkEEa4+qEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6202374"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 22:31:35 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Update the
 chamelium testlist
Date: Tue, 27 Oct 2026 11:01:26 +0530
Message-ID: <20261027053126.1135315-1-pranay.samala@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Update the testlist with newly added tests.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 6b395e8da..c7d76ab4c 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -97,6 +97,8 @@ igt@kms_chamelium_audio@hdmi-audio-after-suspend
 igt@kms_chamelium_edid@dp-edid-change-during-suspend
 igt@kms_chamelium_edid@hdmi-edid-change-during-suspend
 igt@kms_chamelium_hpd@common-hpd-after-suspend
+igt@kms_chamelium_hpd@dp-hpd-after-runtime-suspend-d3hot
 igt@kms_chamelium_hpd@dp-hpd-after-suspend
+igt@kms_chamelium_hpd@hdmi-hpd-after-runtime-suspend-d3hot
 igt@kms_chamelium_hpd@hdmi-hpd-after-suspend
 igt@kms_chamelium_hpd@vga-hpd-after-suspend
-- 
2.53.0

