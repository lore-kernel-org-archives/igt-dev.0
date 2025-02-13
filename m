Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C568C0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 09:42:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68B10EA3A;
	Thu, 13 Feb 2025 09:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JqzG4fAC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED33B10EA3A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 09:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739439728; x=1770975728;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lKc3hDRnEgDjMC/g4P7pflLtrZZAnKYL5ASYy7Jt1uE=;
 b=JqzG4fACdFqolV+eOR/PY9UNs+WPDpCyWmU8m4LJEcvCdLxzIcJHBhA4
 5erPsCJqYai86mb3AgImc6AAMw18RNKhmpFhyeAc9mgIVS/xJEd0tNAvV
 f8qccNAcAU0Epe2NeDJ3BoJwzvKaB7fj1wER3xLWUzyCU5d0JEqvQ7uGr
 ZbuL2nN3uLm/QxKaxZ4/a47YQb6onuo5OkRpd2vGm/Jo4JLQb3TAHbbXV
 yF9XPYsiRNDX7POg/9B8yU8qX1wx8CjxHwQalaiqIfC0S7RN6FtqjXEAF
 lJQUxhSW2kEgu1ra2MLHc/onyProw1HP652oHnTqM3WnpZayv8TFAip2H g==;
X-CSE-ConnectionGUID: rhLJMydNQB+YR+xeAWOhpA==
X-CSE-MsgGUID: NxHHFOEfSUaC1ehHPGQQdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="27728337"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="27728337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 01:42:07 -0800
X-CSE-ConnectionGUID: 2lXwTOEhRW2dOiW0qtkT3g==
X-CSE-MsgGUID: f0Z16Cj9TkCjh0MfiJhOQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118279981"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa005.jf.intel.com with ESMTP; 13 Feb 2025 01:42:06 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_draw_crc: Add more logs to skips/failure
Date: Thu, 13 Feb 2025 15:17:32 +0530
Message-Id: <20250213094732.706414-1-pranay.samala@intel.com>
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

Having some logs for test failures or skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_draw_crc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/kms_draw_crc.c b/tests/intel/kms_draw_crc.c
index 30a09389e..f8ce4f71f 100644
--- a/tests/intel/kms_draw_crc.c
+++ b/tests/intel/kms_draw_crc.c
@@ -333,6 +333,7 @@ igt_main
 	enum igt_draw_method method;
 	int format_idx, modifier_idx;
 	uint64_t modifier;
+	bool flag = false;
 
 	igt_fixture
 		setup_environment();
@@ -352,6 +353,7 @@ igt_main
 					if (!igt_display_has_format_mod(&display, formats[format_idx], modifier))
 						continue;
 
+					flag = true;
 					igt_dynamic_f("%s-%s",
 						      format_str(format_idx),
 						      modifier_str(modifier_idx))
@@ -359,6 +361,8 @@ igt_main
 								    modifier);
 				}
 			}
+			if (!flag)
+				igt_info("Display doesn't supports any required formats/modifiers.\n");
 		}
 	}
 
-- 
2.34.1

