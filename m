Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC93606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VzNx1t4i
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5BA10FB73;
	Wed, 18 Nov 2026 12:27:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991A710E7F1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795004792; x=1826540792;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=66b5wjghZQC8N7gwyeIaNcyIwHojgYNNkdPW31/J/VU=;
 b=VzNx1t4ih1kmf0kODwhujpPNp4jufW52QlQD1cLq2+0IaT9g52AjUixq
 g/Cm8oN5u6UW9mxRdIQSOapHlcjY/Gkbu3kNitCLPwAyjl1qdrHu5M9c+
 1nLIYk55btMN8NjjufiwnUifDr/pQh4/r04p4licEwIrrctAeIP6aYViJ
 BYuKKYulNxDAaBt120lbqb19zPMieAtZXD0htuzgRkb4XA6oeBAREqxGo
 ZDFoaJV1lZT0/Ecj9IDNP7Bqbf5ZZGQIxbZTze3T8MkqZvSomekmeq1AS
 1l6dtOmbObbmBIbU74F9rSWqWAwcSst+6+lA9fZDl7050WC32MkD8L72q g==;
X-CSE-ConnectionGUID: P/sy3VHmTOqdPNkCHr+ONw==
X-CSE-MsgGUID: Y8BjW5wJTQWzN4ojHWnuEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3803672"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3803672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:26:31 -0800
X-CSE-ConnectionGUID: ZrJwWURcRoOun+tHrt3sgA==
X-CSE-MsgGUID: N98d4BRXQECpQCX0rWb8gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10274836"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:26:29 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 0/2] Add Tile64 software support in bufops
Date: Wed, 18 Nov 2026 13:26:20 +0100
Message-ID: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
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

Add missing Tile64 software support in intel_bufops and intel_tiling_detect.

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Zbigniew Kempczyński (2):
  lib/intel_bufops: Add support for Tile64 in software.
  tools/intel_tiling_detect: Enable Tile64 detection

 lib/intel_bufops.c          | 113 +++++++++++++++++++++++++++++++++++-
 tools/intel_tiling_detect.c |   2 +-
 2 files changed, 112 insertions(+), 3 deletions(-)

-- 
2.43.0

