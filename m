Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68D5D6B6B4
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 23:49:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DE810E157;
	Wed, 30 Oct 2024 23:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LYlElvAb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFFF10E157
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 23:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730332147; x=1761868147;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ji17oV+k+/ku6u0vx5PXsVvPpwvPFtl6osjnjz9wULU=;
 b=LYlElvAbYu74EWJEd6e1p2hUR3HuLujFs3Ax/VJhWzNyMpFKKY3B+Omd
 ijr/2bHDvHKKq8QnYzfSHVvSESI0zj3MDQ3jJwppZuMYiI5nGwplkgi1n
 a/Y5OZYZaMIDRNlqpxO3PC8TSTM4LVSQYyM0qU6kaTzPPlyfmbMY3P3sd
 EL/v9dwANZeq3HMhu/pm4Z3iUVm3ehE9SAOwIIeO/CnopGBEhLoHSY26L
 MXa9QfmqjTXYxT33Vv/E/EtLTE5kN3/F+d14a0+c4GfwypzcWyWVd8qFA
 3XYFYxwO5NGauUrHFSll28L9BVblBY+nNdUuVN57E6TLcwWsGRjFamnXo A==;
X-CSE-ConnectionGUID: +dtJfHxeQs2WVmjL9cf7hA==
X-CSE-MsgGUID: K4I1J4AxQYWxfS8WdKYRFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30013352"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30013352"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:49:07 -0700
X-CSE-ConnectionGUID: tjIQnZpqTgKMaVUAteLwlQ==
X-CSE-MsgGUID: dcfcUfXcRZOhdDKONFUo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; d="scan'208";a="82625751"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2024 16:49:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] lib/igt_kmod: Drop PM interaction on unbind
Date: Wed, 30 Oct 2024 16:48:38 -0700
Message-ID: <20241030234838.857880-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
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

Setting the power/control to "auto" is not needed and will fail if
kernel is configured without CONFIG_PM. Just stop setting it and it
should still work as before.

Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_kmod.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
index 6f73f9220..bcbb8dc22 100644
--- a/lib/igt_kmod.c
+++ b/lib/igt_kmod.c
@@ -690,9 +690,6 @@ static int unbind(const char *driver)
 		devfd = openat(dirfd(dir), de->d_name, O_RDONLY | O_CLOEXEC);
 		igt_assert(devfd >= 0);
 
-		ret = igt_sysfs_set(devfd, "power/control", "auto");
-		igt_assert(ret);
-
 		ret = igt_sysfs_set(devfd, "driver/unbind", de->d_name);
 		igt_assert(ret);
 
-- 
2.47.0

