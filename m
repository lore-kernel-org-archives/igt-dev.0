Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD9E5C83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 11:37:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B80310E59A;
	Tue, 15 Jul 2025 11:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="holZ3r5R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1F110E59A
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 11:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752579445; x=1784115445;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/faAk7H2xJ8Int/FDzXLgO5yuVeRlxuMBffpkySrEak=;
 b=holZ3r5Rrx7K7wFhz90pBM9nyH9d8Vb3LkJqMjvN8ih13BIdo08Wccmq
 jBCDilKZPpUW3/4YC4pnUmq0ZBbmL1md5nTRFuDZDQ/qvP5AWb+IWqGbC
 3dA+55+0RB+ABkg4CAWpbjzVd6GCD6BG0Z5kzWmB2wEy2narsbw3+dxae
 nvkoZA5rmxUI/rt2IqyaIjbRyllM7y4VOSW9fHSCFBdlIKVnAS1R9bHey
 z0hO6tXO3H0VYbC34xrQulkTyoQrpcryppW9/BGzXjHHyUABkph/sWsZy
 LxAzCmCklGdmzW4Oatb0pZGhc2Xk8g/mwFSkNK8LtJmtdkI36p/65Z9Qk g==;
X-CSE-ConnectionGUID: R7f4ulLjTtqvHIJc7xWzMA==
X-CSE-MsgGUID: Uvsy1mXGQoi//enrSlksBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54948546"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="54948546"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 04:37:25 -0700
X-CSE-ConnectionGUID: s3NE5tRLStu4mywCbCbIlQ==
X-CSE-MsgGUID: R87HHXmnRqaVxYxzPGw0Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="161758083"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa004.jf.intel.com with ESMTP; 15 Jul 2025 04:37:24 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t 1/2] lib/igt_psr: Skip the test when PSR is disabled
Date: Tue, 15 Jul 2025 13:38:21 +0200
Message-ID: <20250715113822.831686-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250715113822.831686-1-michal.grzelak@intel.com>
References: <20250715113822.831686-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

If PSR setup timing is not met, then PSR will stay disabled and test
will fail anyway. Skip the test upon finding that setup timing was not
met.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 lib/igt_psr.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 3d8f1949b..f35051ebc 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -38,7 +38,7 @@ bool psr_disabled_check(int debugfs_fd)
 	igt_debugfs_simple_read(debugfs_fd, "i915_edp_psr_status", buf,
 				sizeof(buf));
 
-	return strstr(buf, "PSR mode: disabled\n");
+	return strstr(buf, "PSR disabled:");
 }
 
 bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
@@ -122,6 +122,8 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	igt_skip_on(strstr(buf, "PSR sink not reliable: yes"));
 
+	igt_skip_on(strstr(buf, "PSR setup timing not met"));
+
 	active = strstr(buf, state) ||
 		 (c && (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort) &&
 		  strstr(buf, "SU_STANDBY"));
-- 
2.45.2

