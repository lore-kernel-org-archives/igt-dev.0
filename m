Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDD9CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 04:56:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32A610E23C;
	Wed, 27 May 2026 04:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUhKh2+Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED23410E243
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 04:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779857788; x=1811393788;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=JzrETQIoKFQjG2/S8s2hXTtkVsK2WIIvjHEwrzMYhis=;
 b=MUhKh2+YllcU6CruFjQDV7zhE2ofjJtZAwhwrSDJarSL0GtvMoT65nu/
 jLSb2E/ChWabOAYyRFSkFHMw0gsyHt6KD65n7J0IPD6VBVv03NRvj06Og
 rCIqysLHJzEB7vVX81iTuArxI/U+RU81LLY/tAV6l4hlHAZ033Gd5uahw
 4Q3AgTel9t1WUMASpDSCINIbC8QHJee8InqzEuNnwaMDAPfAGBlWVip1L
 7I7moRRH7gA2DYC19a68AuBrmDb91ZNf11mL54RpowukIVnACsMWiUA8v
 QaiU4kZItDv4yZMB56FNI4vsPvMelZzQMrjX1yDFEydblV/zZyCCjYPzT w==;
X-CSE-ConnectionGUID: hSfZboD/RomAHOyh6MLT6A==
X-CSE-MsgGUID: jbJHFE7MQ9OQ+jg9oXX1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="79715739"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="79715739"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 21:56:28 -0700
X-CSE-ConnectionGUID: 9Oo8IOR4S8uYgeqwYEwzgQ==
X-CSE-MsgGUID: dkAWHF2dQR6cMPyP15QdQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="265729254"
Received: from jeevan24.iind.intel.com ([10.223.74.58])
 by fmviesa002.fm.intel.com with ESMTP; 26 May 2026 21:56:27 -0700
From: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH] tests/intel/xe_configfs: Add malformed multi-line BB to
 verify ctx rejection and rollback
Date: Wed, 27 May 2026 10:31:26 +0530
Message-ID: <20260527050129.2147335-2-smitha.balasubramanyam@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
References: <20260420045724.1053946-1-smitha.balasubramanyam@intel.com>
 <20260527050129.2147335-1-smitha.balasubramanyam@intel.com>
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

Add a test vector with a partially invalid second command in the
ctx_restore_*_bb invalid-case suite to ensure a malformed multi-line
BB is rejected and the stored BB remains empty (rollback).

Signed-off-by: Smitha Balasubramanyam <smitha.balasubramanyam@intel.com>
---
 tests/intel/xe_configfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 755524e7c..f024235f2 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -225,6 +225,10 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-engine-instance",
 		  .in = "rcs0 reg 4F100 DEADBEEF",
 		},
+		{ .test = "invalid-second-command",
+		  .in = "rcs cmd 11000001 4F100 DEADBEEF\n"
+			"rcs cmd 11000001 4F10G DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
-- 
2.43.0

