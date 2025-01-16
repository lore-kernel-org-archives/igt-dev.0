Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C323C02187
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 00:20:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF2A10E860;
	Thu, 16 Jan 2025 00:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hiiqRGXN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906A110E85B
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 00:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736986811; x=1768522811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w5mf6lyvTM2QICnokr+ZTmebls7Ef1Jcj4Hl565+V/A=;
 b=hiiqRGXNxljPPBFjs21byikSf9T3HLJQLsoQDoOKACT6d24/yQA79P2/
 ROg/qx3TkKGMaatX3VixYYhDQU91kYLQs7oEkZ2NGhe+zsDiReZ3YBwCu
 g3PWqJQZEEBuOjfp5xKobT1dquHZ8A9GhJ+rLcjE8Dz8m5u6fdFSCrhQA
 CG9PhIQ0AV4i3DuF16FYckyYZ28G5fOwJYF4BKxgVzOiCf7QasgS89YMV
 YCEKrqKVYyZQWYaHgXzRXi1NfwHpaDnPcSqK35mNmblxjU1eeTVf0Mi0k
 bpK3LzVFLeXJ8adlSxA+fXFe4ZVOHbPpRC+bsDIVvJH148oxJ+79sxMkl w==;
X-CSE-ConnectionGUID: iCMpb5LeQ/uTgbr1lr+yQQ==
X-CSE-MsgGUID: PsSwtWxqTpivRVqCMfBoCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37374273"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; d="scan'208";a="37374273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:11 -0800
X-CSE-ConnectionGUID: 1ztRS+IPS46JO8f8axxQ6w==
X-CSE-MsgGUID: k/tnNNUIT9OWmkIHH1vFsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105146794"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 16:20:11 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH i-g-t v2 4/9] tests/intel/xe_create: Stop treating the
 extension field as MBZ
Date: Wed, 15 Jan 2025 16:19:35 -0800
Message-ID: <20250116001951.4159243-5-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
References: <20250116001951.4159243-1-daniele.ceraolospurio@intel.com>
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

A new extension for the xe_create ioctl was added to support PXP, so the
field is no longer expected to always be zero.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 tests/intel/xe_create.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index 07e11036d..0907a8a8a 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -127,11 +127,6 @@ static void create_invalid_mbz(int fd)
 	gem_close(fd, create.handle);
 	create.handle = 0;
 
-	/* No supported extensions yet */
-	create.extensions = -1;
-	igt_assert_eq(__ioctl_create(fd, &create), -EINVAL);
-	create.extensions = 0;
-
 	/* Make sure KMD rejects non-zero padding/reserved fields */
 	for (i = 0; i < ARRAY_SIZE(create.pad); i++) {
 		create.pad[i] = -1;
-- 
2.43.0

