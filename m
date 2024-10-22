Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC689D3C932
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 12:13:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B297710E31D;
	Tue, 22 Oct 2024 12:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SktfBt8p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922E910E316
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729599185; x=1761135185;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=X4+pZ2Ycf+SbaDlqFatIs3NfUgBF4Gr6OmY+yS/+0Ig=;
 b=SktfBt8p1JEgKggbSDIXzIp/aOZgqJyNkFx17rCyA8fJHUDMYep72KXz
 I+klN3G2glt6C3mk5LKeJ26TTymqZmniJYbPclTxObPb05FrnpEjSeMwg
 y2mgOkdculMAZL/lEduJvM/VfaJSPsz3zrYlIwZNuH17/9Vos67iVLZuB
 efZpXVsJiLtGU2SCcWnNzZuVhjnVO1yCVrqamGs5qJPOU/W9kT0B7h7iw
 jjalf2j3rLHvHbBRMYEsglOWoazwgJzZcjNx+BhXNtpBZq85w0Atu642l
 sZrf6ppjv8t3h+OBEd8YOKFssNTdlIt1hT4xnLXbxXffqclYk0x5QKOaY A==;
X-CSE-ConnectionGUID: p2TY01IIRS2R0sf//VJ2KQ==
X-CSE-MsgGUID: 5eCWer1JT6O+PUthz7TepQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="46615802"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="46615802"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 05:13:05 -0700
X-CSE-ConnectionGUID: 8EL274CpQr6JFXXamORjBw==
X-CSE-MsgGUID: VeenDfCbTriybHAXSZQHzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="79792327"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 05:13:03 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mohammed.thasleem@intel.com, bhanuprakash.modem@intel.com,
 suraj.kandpal@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/3] Move backlight read, write to lib
Date: Tue, 22 Oct 2024 17:40:39 +0530
Message-Id: <20241022121042.2295042-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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

Move backlight read and backlight write functions to library and rename
the function as igt_backlight_read and igt_backlight_write.

changes include:

Moving the backlight read and write functions to the library.
Renaming the functions to `igt_backlight_read` and `igt_backlight_write`.
Updating the existing `kms_pm_backlight` to use the newly moved functions.
Adding a new scenario in `kms_hdr` to manipulate brightness while in HDR 
using the newly moved functions.

Santhosh Reddy Guddati (3):
  lib/igt_kms: Move backlight read and write to lib
  tests/intel/kms_pm_backlight: Refactor and use functions from lib
  tests/kms_hdr: Test brightness manipulation in HDR mode

 lib/igt_kms.c                  |  66 ++++++++++++++++++++
 lib/igt_kms.h                  |  12 ++++
 tests/intel/kms_pm_backlight.c | 108 +++++++++------------------------
 tests/kms_hdr.c                |  43 ++++++++++++-
 4 files changed, 148 insertions(+), 81 deletions(-)

-- 
2.34.1

