Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40701C55838
	for <igt-dev@archiver.kernel.org>; Tue,  4 Aug 2026 23:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87F6C10E152;
	Tue,  4 Aug 2026 23:17:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+D5iGtG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1189110E152
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Aug 2026 23:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785885412; x=1817421412;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xCHc+fTkia3LoXnhNlyf6k9lAWkGc2DhE1iD2alMcPM=;
 b=h+D5iGtGZFcJZWzLJNNjirWomSIQ0/a5Dtp5As3Sx5KgsnX/j60v6Ab9
 QtEJ8V9femM0UR3Ui9d2aOj1CTp7eGxaVSTBoHG/9e4rfEDdbNJwBgfML
 1Z+od6H+ro2amLpBEQT2ZgxGR4cpBiy7RXKuCPSPWn6KyBCy/p5zJrsnZ
 xP7MmITC+uihnyysViT7Ygm/UFPPKuCmSI+itGbs5EnV/JPpd5a1hRv4D
 UwiUOj+Rf3JMkJXVyP0GKhz68Yhut1A5SVjWkxL4Whm0d6pISyJYXtwxD
 PUgAKxNO83HsSjpH4xUNAYHqZon3CK4wCLZxYYixpcKEDchP7GiNrCYX/ g==;
X-CSE-ConnectionGUID: hgiF92RYT6CBKVecRSMOTg==
X-CSE-MsgGUID: 99ZnLeo+QVuJFNOniK7zbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86327080"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="86327080"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 16:16:51 -0700
X-CSE-ConnectionGUID: jTTcbbgxSUqKA0pDO/Qm6Q==
X-CSE-MsgGUID: AFfFtrhyQx6ayH/MdudCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; d="scan'208";a="259867687"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:16:49 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, mitulkumar.ajitkumar.golani@intel.com,
 ankit.k.nautiyal@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 0/2] Add CMRR subtests
Date: Wed,  5 Aug 2026 04:46:56 +0530
Message-ID: <20260804231702.602029-1-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add a subtests to validate CMRR with video mode and fixed mode.

Naladala Ramanaidu (2):
  lib/igt_vrr:Add VRR helper library for display refresh rate testing
  tests/kms_vrr: add CMRR fixed and video mode subtests

 lib/igt_vrr.c   | 150 ++++++++++++++++++++++++++++++++++++++
 lib/igt_vrr.h   |  45 ++++++++++++
 lib/meson.build |   1 +
 tests/kms_vrr.c | 188 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 384 insertions(+)
 create mode 100644 lib/igt_vrr.c
 create mode 100644 lib/igt_vrr.h

-- 
2.43.0

