Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD38606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Oct 2026 20:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n1fTt48V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D108C10E16E;
	Wed, 28 Oct 2026 20:06:43 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D20110E103
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Oct 2026 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793217913; x=1824753913;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PAbEaZUu7LTwqvkR6RN8nGKAQ6UJWNGqa8kCi7OzPpM=;
 b=n1fTt48Vn9fELCWDmXE8/AAVSliGl92nm2v9A9BaiiqBXg3cgc37F5tR
 KfyyMRMwf8zhqciHmdkdcf/m9bPyrRe+LgnZPCEX7eH8BYEI2AGchTweI
 BFy0Yw0N/ZLR4ZOV+83qvpbFTpKKvPNZvoeVxdTjQrzOnHayMNc8uuiGF
 J0hQ9hxGrlJz30+TDTwdtVyV6k2amMQWojUhCwBqY+qjHP0ML1Knwi6Uw
 5ZiHvWH3UdZhfza5vfu8pcXyaP8rHzhQK6LpR1US6K9Xs8Ket4/iaolcZ
 FWzS79cAiXmP34BLilwutbl+But6NZsQ1dXkzHklEFCqNZz32F3Zqvtpx A==;
X-CSE-ConnectionGUID: Q4coO7euThiBMzlPerkHwA==
X-CSE-MsgGUID: J9Rv5wCuRSmPo1YIx2MnuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1850474"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,146";a="1850474"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:05:12 -0700
X-CSE-ConnectionGUID: FbK4YSOXRYaS0T84bKgz1A==
X-CSE-MsgGUID: oQHXWYRcRQWAyPDK9yvyPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; d="scan'208,146";a="5278510"
Received: from mjruhl-vm.amr.corp.intel.com ([10.11.186.166])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 13:05:11 -0700
From: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
To: rodrigo.vivi@intel.com, igt-dev@lists.freedesktop.org,
 frank.scarbrough@intel.com, david.e.box@linux.intel.com
Subject: [PATCH i-g-t v2 0/2] Support PMT for BMG and CRI devices
Date: Wed, 28 Oct 2026 13:05:00 -0700
Message-ID: <20261028200500.4005780-4-michael.j.ruhl@intel.com>
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

BMG and CRI devices have PMT functionality.

Provide tests to exercise that functionality.

--
v2:
  - moved data file check to first patch
  - moved crashlog trigger compile to first patch

Michael J. Ruhl (2):
  test/intel/xe_pmt: Add testing for BMG PMT features
  test/intel/xe_pmt: Support CRI PMT

 tests/intel/xe_pmt.c | 645 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 645 insertions(+)
 create mode 100644 tests/intel/xe_pmt.c

-- 
2.43.0

