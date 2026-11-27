Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E914606A32E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 05:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jH94fTHi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5BE10E0B0;
	Fri, 27 Nov 2026 05:12:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E96810E82B
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 05:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795756197; x=1827292197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kP8lpW7wjHJ+9q1yFmqp/LZtUNXKCAi7dwf8l4YIEIE=;
 b=jH94fTHi5tqXukUpYRtvUYUqZ2c092QN0af5ICb2HVhlgQQZXQtJL0/H
 TOXx9vqbv9VuL1nZiId0heo+46E9UJi2AoFfTkJuliJvqxIiqCw80nrRV
 w8NKEtHdgGuJbtgpJt3VSbACTBuOxgu6aH3GvdvJo8t3k6bCX6er7SYMq
 OyviITM4+ne8cRdcq60U8uzymxzZyUtnfOJMZXCKu+7ax8rWfDwNp0fNV
 4CZDkiUN5PdbsnBqgp4RiRe5ZZT57q8CT2JaUbiIEZvPgWg7PynHPkK2+
 K48MJfPoK1+wvRfHCL1EBjcWM+CFSFcqY2LZ44liFjEaooQnl8x1kg2EB A==;
X-CSE-ConnectionGUID: s495kC1pT6O2pAKYvn976w==
X-CSE-MsgGUID: MgUM9mfbTcyrqHim5XhxmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4669944"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4669944"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:09:56 -0800
X-CSE-ConnectionGUID: /cDHSpAOSLKguGSdJ7RwDQ==
X-CSE-MsgGUID: xCERZhoyTYu6JBO+ABge3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12098970"
Received: from avandhic-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:09:55 -0800
From: Avandhica S R <avandhica.s.r@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sowmiya.s@intel.com,
	avandhica.s.r@intel.com
Subject: [PATCH i-g-t v3 0/3] Extended multiple planes with multiple pixel
 formats
Date: Fri, 27 Nov 2026 10:40:07 +0530
Message-ID: <20261127051010.937287-1-avandhica.s.r@intel.com>
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

kms_plane_multiple currently uses a single pixel format (XRGB8888) when 
creating the reference image and the plane framebuffers. This limits the test 
coverage to validating plane composition and modifier handling for a single
format. As a result, issues that may occur when combining multiple planes 
using other supported pixel formats are not exercised by the test.

The first patch fixes plane count handling and random plane selection, and 
replaces hard commits with try-commits so unsupported configurations are 
skipped instead of causing failures.

The second patch separates reference framebuffers from test framebuffers and
improves cleanup by properly clearing plane assignments, detaching outputs 
from CRTCs, and removing framebuffers after use.

The third patch extends kms_plane_multiple to test multiple pixel formats 
(XYUV8888, XRGB16161616F, YUYV, XRGB2101010, and XRGB8888) across supported
modifiers, covering both single-display and dual-display scenarios.

Avandhica S R (3):
  tests/kms_plane_multiple: Fix plane count and shuffle bugs
  tests/kms_plane_multiple: Fix reference frame buffer and plane frame
    buffer
  tests/kms_plane_multiple: Feature Adding pixel formats across multiple
    planes

 tests/kms_plane_multiple.c | 364 ++++++++++++++++++++++---------------
 1 file changed, 217 insertions(+), 147 deletions(-)

-- 
2.53.0

