Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452E6606EE80
	for <igt-dev@archiver.kernel.org>; Tue,  3 Nov 2026 09:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a4E1lVSF
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F006210F4A8;
	Tue,  3 Nov 2026 09:40:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B49EB10F4A5
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Nov 2026 09:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793698779; x=1825234779;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M6d1BHfcVyWNyrl9iJ+4urdKdVv6RqZgtpwJavjDND4=;
 b=a4E1lVSFJRAae33Oce3uky/XG1BLVcbBOwfFpGHcIQ3Z5PVaMd6VNGZh
 obuc/lVpTIa8jM86HC+CR6fJ5F9jZPpNfhl01m61oWs+nJxuIQOnaf+gZ
 dptVhgLpuGtiZkCTM8Xc7SyWzKrUg5TXO0t4qerz0WDXSniC+9SSZSGqa
 /oXzfrrsuEK4hz4qNCI8dhAJMv2sJeI/MgeEgBKQYuJY/I0yDLC2gXC1P
 iElsUpZWGoFsUQXpUHjZHjgqJCkHkSJm+zuINX7lh8RSJC9BNgHWKO7XE
 z4GDHwDasOEv/vgJv4kv5K+SrVzQTLf/jOv919j+aV+qP9/W8mXCQUMjv w==;
X-CSE-ConnectionGUID: hXDtsr9nT4mo3WTN5SYztA==
X-CSE-MsgGUID: 9grOHfqMTrmdew1cS3yGQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2423101"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2423101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:39:37 -0800
X-CSE-ConnectionGUID: 3qZeEUleSsGEWHZIt20gnQ==
X-CSE-MsgGUID: DHC5dnPwRm+/aUb1Y9JIkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6437857"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 01:39:37 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: rodrigo.vivi@intel.com, jonathan.cavitt@intel.com,
 Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH i-g-t v2 0/1] tests/intel/xe_exec_capture: Add coredump decode
 validation subtests
Date: Tue,  3 Nov 2026 10:39:26 +0100
Message-ID: <20261103093927.1668349-1-jan.maslak@intel.com>
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

Jan Maslak (1):
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
