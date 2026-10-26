Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F1606A323
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 17:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gk3QB/+T
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA73110E1FD;
	Mon, 26 Oct 2026 17:19:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52BD710E1FD
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 17:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793035106; x=1824571106;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2io6P+iyDxCG91Fwzfs/5MG+21S2MM3McL2DaB9Kyl8=;
 b=Gk3QB/+TXOnPgIU6qzs2boYMOCu9NQLF9ETVILu4hVMTgtp1/bCDJ9K1
 pDnliGC/dODVohZXaXya5szcJMPIva4vuscCy5qCKeXx+wBEILcFn2x5v
 sUD/EQmCasPruLSJp3RZAVYcem/w02Yg8c7WCgsd5hPgBmoaxtTC54KVW
 swwrpuMX/As/cKREPeFE8Qx3e84eC+tsNfVMEGoCVlJty1ryXNs6tWiJD
 4laosyG9JQWwZlcB4v078wNPpxkAUBjAol2l43P0ehALHC2fyMY6rXVVr
 0FtchRE4bZggtnKoMA00mqTURoAVPf0BBrUBCNAMCwXRgUyJHRx7KtkXm Q==;
X-CSE-ConnectionGUID: 8yiAzvg5SleZtzA2AhBMBw==
X-CSE-MsgGUID: F+jyc07zR7Gt7/9K0gX77Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1589178"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1589178"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:25 -0700
X-CSE-ConnectionGUID: CTlsfhLUREey402PLiej9A==
X-CSE-MsgGUID: 0PhQUsZ+SzKMnpwzm89UEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4275067"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 10:18:23 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: pranay.samala@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH 0/3] reduce CI debug output
Date: Mon, 26 Oct 2026 22:48:33 +0530
Message-ID: <20261026171836.1434992-1-jeevan.b@intel.com>
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
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jeevan B (3):
  tests/kms_cursor_legacy: reduce CI debug output
  tests/kms_plane_cursor: reduce CI debug output
  tests/kms_rotation_crc: reduce multiplane CI debug output

 lib/igt_sysfs.c           |  3 +-
 tests/kms_cursor_legacy.c |  3 +-
 tests/kms_plane_cursor.c  |  4 ++
 tests/kms_rotation_crc.c  | 96 +++++++++++++++++++++------------------
 4 files changed, 61 insertions(+), 45 deletions(-)

-- 
2.43.0

