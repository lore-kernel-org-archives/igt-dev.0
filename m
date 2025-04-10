Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005E9C369A6
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 22:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC9510EA7B;
	Thu, 10 Apr 2025 22:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="adQGqBKs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2633510EA7B
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744325272; x=1775861272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wQVPeSYCVgAsFZCg3jizdsxOic2wDHsCPvTfB/o3Ci0=;
 b=adQGqBKs7zZQuo9eLulbGS3AnMrKDAjRS1gITymdd2N1nO5+869QwNPb
 tT/S7z+CgTvP0nB/Zv3HMI7OxHw/RQgnQyrg0MJ1+Vg5onDlMeuiBcR3c
 tkXjgrlYQkxOJRiVcCukRCbPVEmdWlkLZjQ4vLD9HJR5eyWtU/EG+jC0A
 m40dgfCT1A9LditC0EI2iDHbwiDMm7XXhQ1iqfCngcxKblHqbbJ4W8NGP
 ASyfT1ZkfbkoY9Wy7bXfNEc6kodJsfcirMEgP5q+8HvTuisqmuZ4jT1OU
 9mtxNBVxyvXZTmWqQcR4NggHV7nwenSdW21kA4H5YaN0Pms8RfMtyTncu A==;
X-CSE-ConnectionGUID: fI6TGyFuQmmGtx5gcSmnuQ==
X-CSE-MsgGUID: C57KTEQLRh2iqe5fmgLccA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="49666955"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="49666955"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:47:52 -0700
X-CSE-ConnectionGUID: M+xb4ETeROOboGgRVD7KUA==
X-CSE-MsgGUID: kKbYZvYXReGKMFGjurnBSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; d="scan'208";a="152211639"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 15:47:52 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 00/10] lib/kmod: unbind, bind, rebind
Date: Thu, 10 Apr 2025 15:47:42 -0700
Message-ID: <20250410-lib-kmod-v1-0-84b1ad0b8075@intel.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Change-ID: 20250410-lib-kmod-fd3a52338d4a
X-Mailer: b4 0.15-dev-9a9c7
Content-Transfer-Encoding: quoted-printable
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

Improve and simplify igt_kmod_unbind(). Add igt_kmod_bind() and=0D
igt_kmod_rebind(), replacing the current users of xe_sysfs_driver_do().=0D
=0D
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>=0D
---=0D
Lucas De Marchi (10):=0D
      lib/igt_kmod: Fix leaking dir=0D
      lib/igt_kmod: Fix comment about unbound devices=0D
      lib/igt_kmod: Simplify igt_kmod_unbind()=0D
      lib/igt_kmod: Use igt_kmod_unbind() to kick snd_hda_intel=0D
      lib/igt_kmod: Add igt_kmod_bind()=0D
      tests/intel/xe_fault_injection: Use igt_kmod_bind()=0D
      lib/igt_kmod: Add rebind abstraction=0D
      tests/intel/xe_fault_injection: Drop XE_SYSFS_DRIVER_TRY_BIND usage=0D
      tests/intel/xe_wedged: Drop XE_SYSFS_DRIVER_REBIND usage=0D
      lib/igt_sysfs: Drop xe_sysfs_driver_do()=0D
=0D
 lib/igt_kmod.c                   | 111 +++++++++++++++++------------------=
----=0D
 lib/igt_kmod.h                   |   4 ++=0D
 lib/igt_sysfs.c                  |  50 ------------------=0D
 lib/igt_sysfs.h                  |   8 ---=0D
 tests/intel/xe_fault_injection.c |   8 +--=0D
 tests/intel/xe_wedged.c          |  14 +++--=0D
 6 files changed, 65 insertions(+), 130 deletions(-)=0D
=0D
base-commit: e5e2b60a847cd4f044360a9495c59f21f0652087=0D
change-id: 20250410-lib-kmod-fd3a52338d4a=0D
=0D
Lucas De Marchi=0D
=0D
