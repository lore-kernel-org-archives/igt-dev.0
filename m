Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D7606A32C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NJoAsbx0
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B9F10E52F;
	Tue, 17 Nov 2026 15:14:48 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19BFE10E5FF
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 15:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794928427; x=1826464427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Mela6MH4D/CbVRshuVIgnFvQu1azVXq7zQiJ8MDn4Fk=;
 b=NJoAsbx0Bbln5UbCKoE1KjvQ4g6EcalZ44GBdaW0ROoGS/gVNIINY4s7
 wUB5n7jBz/CUc11sa6TQa8/pLlXgTOs3Q90M2UV4DBlGYsABOs2KtDA+7
 ++ctGKExJlcZOF9Eb4Wrqo4lHPBYFmCgV0rqGWMm7zQCtAhCbBVGCUeTn
 BNEOIznIsLM1dyAiiMKTATlIdJqQZGKBDIzbIpuFRKTbXd8k4i8Mns3Ck
 dkucq/JBsGhJXaag+TbvExmkuli09aCL1LZC5q3seKfMdQJDVMcMLGcgo
 SQm+UqG4PaszA3tr8x/9XctSGABQKVg2+lxdmzxmjtTe64VD42XkUtNTv A==;
X-CSE-ConnectionGUID: oEB7Oi8/RqOOIcI4etK7eA==
X-CSE-MsgGUID: X1n6QvwwTtuqAIwv2mYuhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3568777"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3568777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:46 -0800
X-CSE-ConnectionGUID: dI13eIL1TKeZ/3D0c5rO4Q==
X-CSE-MsgGUID: VwjIQXyLQCGLImvklsKXVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9724526"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:45 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v10 0/9] tests: limiting suspend tests
Date: Tue, 17 Nov 2026 16:13:17 +0100
Message-ID: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Next version of [1].

BR,
Michał

[1] https://lore.kernel.org/igt-dev/20261106180849.156578-1-michal.grzelak@linux.intel.com/

---
Changelog:
v9->v10
- clear array of available pipes before each recomputation (J-P)

v8->v9
- fix extra long opts string for kms_ccs (JP)

v7->v8
- use pipe mask (Jani)
- add 2 new patches

Michał Grzelak (9):
  tests/kms_async_flips: split outer test loop into two
  tests/kms_async_flips: set mask for available hardware pipes
  tests/kms_async_flips: limit #pipes tested during suspend
  tests/kms_vblank: limit #outputs tested during suspend
  tests/intel/kms_ccs: split outer test loop into two
  tests/intel/kms_ccs: limit #outputs tested during suspend
  tests/intel/kms_ccs: set mask for available hardware pipes
  tests/intel/kms_ccs: limit #pipes tested during suspend
  tests/kms_hdr: run on 3 outputs when testing suspend

 tests/intel/kms_ccs.c   | 115 ++++++++++++++++++++++++++++++----------
 tests/kms_async_flips.c | 103 ++++++++++++++++++++++++-----------
 tests/kms_hdr.c         |  30 ++++++++++-
 tests/kms_vblank.c      |  21 +++++++-
 4 files changed, 206 insertions(+), 63 deletions(-)

-- 
2.45.2

