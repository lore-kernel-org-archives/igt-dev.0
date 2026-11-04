Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86061606A31B
	for <igt-dev@archiver.kernel.org>; Wed,  4 Nov 2026 06:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iekmTST4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2152B10E216;
	Wed,  4 Nov 2026 06:35:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFE810E216
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Nov 2026 06:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793774071; x=1825310071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=H3IxuZOsEnCm7v/sQkbAPYL3Ri0HPckYVQZdthIquLo=;
 b=iekmTST4WeKFkSkkyr7GfNcBdC7RI1AZIrhq8S+BAOv7bOz0nsw7Wh6E
 mA+n5569/YlpKCLgwleBno3bDo3asgO4bLNByfbSQ6iwBKZjXXjV+mgJn
 2TrUtVbRiLjGJcMfL9dodaW/AZQ1snrqGoiDse9Xbn9QtQGCRnzeVyDPc
 gR0bV4i8IkyuZamX8Dtlirfc2+frCY3kjxSJwMZ68+45ovExKn7EaqeF+
 cO/J8XXWC27FUcuXnY4c2aEbJHLxWMcX9SJuGq7417phUwytXBYNCnLTX
 At0QGCPPO0wrUv0NRbOZeR6zKKfoU9VRtdwykM1I2ZxRs0Gbokf/8yhLm Q==;
X-CSE-ConnectionGUID: eL7gzd67Q0mJu7MgmC+5wA==
X-CSE-MsgGUID: YiLxzx0rQfeS6ALTU9SUGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2403891"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2403891"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:29 -0800
X-CSE-ConnectionGUID: eeY1DG4HQEi1bmwFq06aqA==
X-CSE-MsgGUID: 9vIpsR+KQ2alx5w8IiZWcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6956451"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 22:34:29 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_setmode: Convert to igt_display atomic API
Date: Wed,  4 Nov 2026 12:04:39 +0530
Message-ID: <20261104063442.2208555-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series updates kms_setmode to use the modern IGT atomic display API
instead of legacy DRM calls, switches to public igt_display helper functions,
and cleans up outdated code. As part of this, the legacy TEST_STEALING subtest
is removed since its behavior does not apply to the atomic model. Overall, this
makes the test simpler, more maintainable, and aligned with current KMS
practices without changing existing test behavior.

Jeevan B (2):
  tests/kms_setmode: Drop invalid-clone-single-crtc-stealing subtest
  tests/kms_setmode: Convert to igt_display atomic API

 tests/kms_setmode.c | 350 +++++++++++++++++++-------------------------
 1 file changed, 150 insertions(+), 200 deletions(-)

-- 
2.43.0

