Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC94BC04FF8
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 14:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46CDE11263F;
	Mon, 15 Apr 2024 14:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BH1X+Yt0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7EC611263C
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 14:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713192574; x=1744728574;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2i7E1PQcpEGwkbpDNp1lqOVAzvyBkYGcp/9S10+n7zc=;
 b=BH1X+Yt0W4+mY2n3xS25nPXWLFfSTEK4YbPQzKoPse25Q3+67lZXHAGg
 vjoQX18Nw/ZfMddVlQFP4ywKmUH7URPmkueB5d4o0w8S61QA8BOx+Edfh
 piAohkypOxjmYRI7GEv8gIQ21Aa2hDpqT09rhXyum5SXWJdil8kxpbDuD
 m7ffmo9A7Q9bEo1Edbpp07erY5akLmYb358OwY9yWYc+FiRQP6/kT0LY4
 m9aiIhEVNqMG794Hvqc5m1M6clTVTsuIJJF2mq3raTYcSzrAKkgQQvgco
 Ro0ozy66uc9pR9pEBWLh3r9CFpKiY8Hj9eKdPgjmbNo8PkGmXxqJU1FU3 A==;
X-CSE-ConnectionGUID: 9fZlfUO2S2iGTr6y1uYkSg==
X-CSE-MsgGUID: jtwwu95uSE6KBgrSdftZyg==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19735089"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19735089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:34 -0700
X-CSE-ConnectionGUID: LQoqrwlRRaCxsOg2j5JueA==
X-CSE-MsgGUID: lLr6mgGzRo2sX5DMi3asPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26580070"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:32 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 4/4] test/intel/xe_query: Print
 DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM
Date: Mon, 15 Apr 2024 16:35:28 +0200
Message-ID: <20240415143528.4107-5-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415143528.4107-1-nirmoy.das@intel.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Print DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM query config flag.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_query.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index a5a2dd7d4..f74fa4797 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -428,6 +428,9 @@ test_query_config(int fd)
 	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM\t%s\n",
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
 		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "ON":"OFF");
+	igt_info("  DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM\t%s\n",
+		config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM ? "ON":"OFF");
 	igt_info("DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
 		config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT]);
 	igt_info("DRM_XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
-- 
2.42.0

