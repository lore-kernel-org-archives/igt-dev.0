Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA217606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 09:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KEJ4LTvB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56FFC112276;
	Thu, 26 Nov 2026 09:59:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00ADA112239
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 09:57:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795687063; x=1827223063;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgM4x7aoAkvJ29jjJ/y73+rfwoeI+R/ih0QRQKxqS9k=;
 b=KEJ4LTvB1orLHx4Na5c6bSYtqTuue4nBIOSk8DxNyeBuNID+AxdFSEWg
 lY7rMZsw88u2rlrWAWHiKOUDjjHNV314+VwCydgtLAtsw4uxDTbL9y1JM
 rWxCnyN0D3y6e4Y6T1P6sD6tMGiaLjyQ0p9UdRBaLC6HYmZPbmFPCE3xv
 Ip5NSlNG1A/vorEdGDjtJUGVY8IY28EZOh2GaZn4v2naAxYPPWxV6b4VD
 1fyVzZzSwxKo68DA4lfUNvRyNzLKojlpO2NvmSedXSvhYB82YkkEengBh
 +5mX+WnsT2R6n5dIhi94halEFxjHF8Kzg2lm9ggFNVYwAoVZbQDm9xoaD w==;
X-CSE-ConnectionGUID: kM7ElmQ/SOawlbr31KQ1oQ==
X-CSE-MsgGUID: RnMtMptcRNeMtL9arGwTnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4475179"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4475179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:37:19 -0800
X-CSE-ConnectionGUID: KNcdqMItT9Ged+69XVDnDg==
X-CSE-MsgGUID: uHkQVM+cReG7C9atGw+31g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; d="scan'208";a="12386867"
Received: from slindbla-desk.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.159])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 01:31:03 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com
Subject: [PATCH i-g-t 0/3] tests/kms: don't fail cursor-fb-leak because of
 leftover FBs
Date: Thu, 26 Nov 2026 10:48:18 +0200
Message-ID: <20261126093003.492469-1-luciano.coelho@intel.com>
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

Hi,

kms_universal_plane@cursor-fb-leak counts the framebuffers before
creating its own FBs and again after releasing them, and expects the
same number.  If kms_cursor_crc fails a subtest before cursor-fb-leak
runs, the cursor and its FB are still on screen, so the first count is
one higher than the second and the test fails, even though nothing
leaked.

The first patch removes an is_intel_device() check that is always true
because the test already calls igt_require_intel().  The second one
makes kms_cursor_crc clean up after a failed subtest, so it doesn't
leave the cursor FB behind anymore.  The third one makes
cursor-fb-leak take its first count after its first commit, so it
doesn't depend on what an earlier test left on screen.

Each of the last two patches fixes the failure on its own.  I checked
this by running the two tests one after the other on the same boot
in a simulation setup.

Please review.


Luca Coelho (3):
  tests/kms_universal_plane: remove redundant is_intel_device() check
  tests/kms_cursor_crc: clean up after a failed subtest
  tests/kms_universal_plane: count FBs after the first commit

 tests/kms_cursor_crc.c      | 16 ++++++++--------
 tests/kms_universal_plane.c | 15 +++++++++------
 2 files changed, 17 insertions(+), 14 deletions(-)

-- 
2.53.0

