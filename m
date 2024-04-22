Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70726C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Apr 2024 05:24:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0723211277E;
	Mon, 22 Apr 2024 05:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HRtOeKBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E4FC11277E
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Apr 2024 05:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713763445; x=1745299445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7pZU6xai+8W1QhhI99qqRNnjNzO7DuyyTL0JahLkjGg=;
 b=HRtOeKBkteJ8bbtnG3IM5lff+ARmIXWM2OT1nzvziZp9SHH04szI23EL
 1L/0M0hycAd2lUGjONazXHY+Tudvv/FVeob+uOaKHDNoaMZa5AIP2le84
 iBg4Y5JhkU8R5k7S4Uxu/jvx30aJK53+f0DFpoUB/yZ0+zJNZOCjNnyrA
 Z6qHZPyPM0qNY+iHhu9gdngPge9OAv4BXTjbIY7rVTottsf5iw0ucjLAy
 akt8VSMtD3U/iqwkxMbxnGm+CEA53O9a0SV5rddeIvbqD1QrJmdVw33Ns
 8UQPY9dcY9xjwkdRsTQ+VctT5QnAv+z3WL6G4DBteZ9JeObRZejKFo0tx A==;
X-CSE-ConnectionGUID: sfnl1qeCT1W+qENQfPk8bw==
X-CSE-MsgGUID: ne2IgBcQSBO2njDNErZTqw==
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="9113787"
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; 
   d="scan'208";a="9113787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2024 22:24:05 -0700
X-CSE-ConnectionGUID: WrNrplEfQtekzya9oe9X1A==
X-CSE-MsgGUID: dceIAVMfSe2m2ZXF9xF5Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,219,1708416000"; d="scan'208";a="23981106"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa008-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2024 22:24:03 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 1/7] lib/igt_kms: don't run on unsupported platform
Date: Mon, 22 Apr 2024 11:04:48 +0530
Message-Id: <20240422053454.2523989-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240422053454.2523989-1-kunal1.joshi@intel.com>
References: <20240422053454.2523989-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

dipslay <=12 needs dsc enabled for pipe joiner,
add a check in IGT for the same

v2: dsc is required for gen12, so test only
    for devid 13 and 13+ (Ankit)
v3: update comment (Bhanu)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Suggested-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3216fe7e4..ee8848079 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -6246,6 +6246,14 @@ bool igt_has_force_joiner_debugfs(int drmfd, igt_output_t *output)
 	char buf[512];
 	int debugfs_fd, ret;
 
+	/*
+	 * bigjoiner is supported on display<= 12 with DSC only
+	 * and only on Pipe A for Display 11
+	 * For simplicity avoid Display 11 and 12, check for >= 13
+	 */
+	if (intel_display_ver(intel_get_drm_devid(drmfd)) < 13)
+		return false;
+
 	igt_assert_f(output->name, "Connector name cannot be NULL\n");
 	debugfs_fd = igt_debugfs_connector_dir(drmfd, output->name, O_RDONLY);
 	if (debugfs_fd < 0)
-- 
2.25.1

