Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8AA606A32C
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 11:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mOZs1QHf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10233112D16;
	Fri,  6 Nov 2026 11:10:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CC8F112D10
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793963393; x=1825499393;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5pro0ypM/8IZTZhbNXuWTe5uqU8LkWNh1blRV7lTyLE=;
 b=mOZs1QHfFrOvas74a7qmMBBR2Fr/1jYUO8Sg98L/sWdfvrlhQ/mnzGjy
 UiVmD4TuuYfhXj4yg5ZNkgx7ZvrhhcMAeJ9dLo6Ux0AdHpDO6ckSasUno
 s9gOhiiBrLqTviAvOWztbb2ltFhOc0BOctXetFcRPpwRwTUK5L62T2nwR
 4mbANpbuUAdof6nXMGFjAaP1raXO2gnHA0gn3ePj5Bcnl9vq7+SgmX6Gu
 Y/g+opEQFprRVLyywZA6Z0MlWsKkPNEdws3HPNR5VZSVrGxcc8fEpwt54
 VIkGm7NdZ1nBpZKWSp40JckY5VMOTwleEF2VKIeyKpJ7vmVtbKR4IeYVM g==;
X-CSE-ConnectionGUID: Hyaqz6sXS/Whe2ZzNoHmoA==
X-CSE-MsgGUID: InBQKO+JQI+9k5QQOOvZiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2778425"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2778425"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:09:52 -0800
X-CSE-ConnectionGUID: lfV4YvawR068xQtpaJdJpQ==
X-CSE-MsgGUID: h5Cg1FfDTF+Q3AVhW7MtSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7303159"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 03:09:51 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Date: Fri,  6 Nov 2026 12:09:37 +0100
Message-ID: <20261106110939.2697038-1-jan.maslak@intel.com>
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

This series adds coredump decode validation subtests to xe_exec_capture.

The tests create dumpable VM buffers with deterministic contents, trigger an
engine hang, and validate every ASCII85 blob in the resulting devcoredump.
The large variant exercises coredump chunking and the legacy rendering limit.

v2:
- Add libzstd as a dependency for Xe tests.
- Add per-blob Zstd decompression and retain raw-format support.
- Handle metadata-only NULL/sparse VM entries.
- Rebase onto current upstream IGT.
v3:
- Split the Dockerfile dependency updates into a separate patch per Kamil's
  request.

Jan Maslak (2):
  Dockerfile: Add libzstd build dependency
  tests/intel/xe_exec_capture: Add coredump decode validation subtests

 Dockerfile.build-debian-arm64   |   1 +
 Dockerfile.build-debian-armhf   |   1 +
 Dockerfile.build-debian-minimal |   1 +
 Dockerfile.build-fedora         |   1 +
 tests/intel/xe_exec_capture.c   | 669 +++++++++++++++++++++++++++++++-
 tests/meson.build               |   3 +
 6 files changed, 675 insertions(+), 1 deletion(-)

-- 
2.43.0
