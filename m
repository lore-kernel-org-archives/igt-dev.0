Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4591EC0218A
	for <igt-dev@archiver.kernel.org>; Thu, 30 Jan 2025 22:15:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F013110E9F1;
	Thu, 30 Jan 2025 22:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WzJtB9qe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB08E10E9EE
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Jan 2025 22:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738275310; x=1769811310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gmpe5tLJCNJw9ZovxcQZ+P/fUYknXQqyEJHKuDIVX8Y=;
 b=WzJtB9qeDDXyb3znzWFeRVIFrKOMy6kCmEZD1shyTVNH4ytnB1GF69bK
 MYrbxBWc6mxg81NJ9umc/4nenLC7ADZvLqlGllMX9P7/SiGer6OdhvAuR
 8nowjSdK6LW1eS2kcZPIvo6ZZprdg3URrgqpSB6W49uajN+3ZEXcB5m5a
 EXrkNEXvXj/uItkIk3zuyCXMPBOUKEam4UKkJUIL52h2+2TNwIl2LE60v
 nCtslfndW8iOK49G6k5nXHdFueeOO2vzSLf+BcFWgO4LdWidzVoQ41jIJ
 TPPaVw9rdXfmPIUR8ecosOic5j70T/NneaDCKx18N3RZUP9oQqlLyrTDf g==;
X-CSE-ConnectionGUID: i5zUmxViRjyvVhAqSIzv3g==
X-CSE-MsgGUID: kGBRilHaQxGz35iSQY8AwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="49502781"
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="49502781"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:10 -0800
X-CSE-ConnectionGUID: J2X+2/U9QpGUk6rhp51VFg==
X-CSE-MsgGUID: fOf5C8usQqu3I24N8QAj8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,246,1732608000"; d="scan'208";a="140347251"
Received: from valcore-skull-1.fm.intel.com ([10.1.39.17])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 14:15:09 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_create: Stop treating the extension
 field as MBZ
Date: Thu, 30 Jan 2025 14:14:56 -0800
Message-ID: <20250130221457.1092670-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
References: <20250130221457.1092670-1-daniele.ceraolospurio@intel.com>
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

A new extension for the xe_create ioctl will be added to support PXP [1],
so in preparation for that to be merged stop expecting the field to always
be zero.

[1] https://patchwork.freedesktop.org/patch/634550/
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 tests/intel/xe_create.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index e3be6b774..e3ebb9fd4 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -243,11 +243,6 @@ static void create_invalid_mbz(int fd)
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

