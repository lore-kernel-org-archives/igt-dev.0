Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD57D41D53
	for <igt-dev@archiver.kernel.org>; Tue, 12 Nov 2024 05:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984E10E56D;
	Tue, 12 Nov 2024 05:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YiGDXPip";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F1F10E56D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Nov 2024 05:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731387852; x=1762923852;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MtXyb0EJEG/3TR0pgcFMgtvJDQ3pMgS8+MdPVLQSDCs=;
 b=YiGDXPipFNEjBiBV53rxz+RdMLW2CoIZrtF4TI3ZZxArcq2FzlVi1GPW
 KFjEmyEwPgpzrEyZp0KOcWsY2WGRHLvBqbYUsdNyItwNaX/a7TUsaEjb5
 A24nftRgtTjtA50zSZN6TVlMlpMUkPgkcjpu5uR7N8muKUc+okt1iAyPN
 WhBJHXed7J3dAH0xzvJEQ+BdJOiAFl9HdEamduVfQQ7Alt3NhHl8Zd82C
 UqWymYzW58aIR6cGl/u7IH+T97/mhGr8rAkD2AIN4fwCcva5asdOs34pD
 V4hA57aTbdDGELH1QCBRW3rnr8/9U7c2DrWqEbK0mejPV9U6Eqzj4Vnmc g==;
X-CSE-ConnectionGUID: N1svWfXtSEOdtNePnegzGw==
X-CSE-MsgGUID: RkppPUU/T2KxISKgoK2W6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11253"; a="35137112"
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="35137112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 21:04:12 -0800
X-CSE-ConnectionGUID: jh2c+nQnTp+tvslniwk81w==
X-CSE-MsgGUID: Y3JLEUOfSQqoWIQ4G2K1Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,147,1728975600"; d="scan'208";a="86836196"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by fmviesa006.fm.intel.com with ESMTP; 11 Nov 2024 21:04:10 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v9 2/3] HAX: Do not merge
Date: Tue, 12 Nov 2024 10:34:41 +0530
Message-Id: <20241112050442.1854319-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112050442.1854319-1-pranay.samala@intel.com>
References: <20241112050442.1854319-1-pranay.samala@intel.com>
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

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel-ci/fast-feedback.testlist    | 2 ++
 tests/intel-ci/xe-fast-feedback.testlist | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..7f54eda16 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Try to load the driver if it's not available yet.
 igt@i915_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 # Keep alphabetically sorted by default
 igt@core_auth@basic-auth
 igt@debugfs_test@read_all_entries
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index d9fb98aab..8b70164f6 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,8 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
+
 igt@fbdev@eof
 igt@fbdev@info
 igt@fbdev@nullptr
-- 
2.34.1

