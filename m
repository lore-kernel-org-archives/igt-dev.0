Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E12DCA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 22:13:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF32A10E1E6;
	Mon, 22 Sep 2025 22:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hpXr651b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805F110E1E6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 22:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758579214; x=1790115214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WsmQErQoQbcVAL7zvCxapzEbyp+9Y4dO5a/Y66Ko01M=;
 b=hpXr651b/0g4j0bi9fOKvGqfXKk5oVVeIgEL62HU+V9C5SWzeWfC6nb4
 NNEUslqXh1COJiS77o0kLRzTpS34HHzzG2dwKh6spIZBfHwXftmGlTYlP
 MjeaDkTy/0wKL97CbbysNvoQsucHSpmrf2e0cN2nIeTwrZTWHWO5j/oZT
 7H6Zpi8CGV79YBcwrTEdz6HK9jwz22HNOu2joR/901HqZXbGnj1D3gQJN
 VGIOY6MHgKFt7NepqEYFZHPejc6xHpPseZTB3DwkOnVvdI/LQZJyIPvb9
 qhADDq5eSj0O7aFiQruAb6NjN66IuV+M7spyGWbclg1UifP2rsxU9jNF+ A==;
X-CSE-ConnectionGUID: HQgqyta+Q4Sz8Xm3AAyISQ==
X-CSE-MsgGUID: ca20Z3ckRwOFi7KkH3bomQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60907774"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="60907774"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:13:34 -0700
X-CSE-ConnectionGUID: kFRRJv3BTeO0OU5o0Hjw0Q==
X-CSE-MsgGUID: rqN15JEgSlWnkXemz2iXcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; d="scan'208";a="177372580"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 15:13:33 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_configfs: Test invalid engine with valid
 class
Date: Mon, 22 Sep 2025 15:13:16 -0700
Message-ID: <20250922221315.111774-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.50.1
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

ctx_restore_* expects only the engine class. Pass in an invalid engine
with a valid engine class to make sure it's correctly handled in the
kernel.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_configfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
index 7a7a7edf4..ecba69dbd 100644
--- a/tests/intel/xe_configfs.c
+++ b/tests/intel/xe_configfs.c
@@ -177,6 +177,9 @@ static void test_ctx_restore_invalid(int configfs_device_fd, const char *type)
 		{ .test = "invalid-reg-addr-only",
 		  .in = "rcs reg 4F100",
 		},
+		{ .test = "invalid-engine-instance",
+		  .in = "rcs0 reg 4F100 DEADBEEF",
+		},
 	};
 	char buf[4096] = { };
 	char file[64] = { };
-- 
2.50.1

