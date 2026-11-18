Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77195606A325
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 12:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TMRv7XbS
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26BE410FBA2;
	Wed, 18 Nov 2026 12:29:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8217410E7F1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 12:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795004799; x=1826540799;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MZaRc7mYy+uVQfFGKP68oOJCxz38fKkAF3AytgRZZU4=;
 b=TMRv7XbSvyqDueF9QZxqeGolYMNPXHz/UknfbPefrwfi+sqltV4N98yZ
 ediiHkJdpIVhAB34OTjmUSZ/14N6+/V7oYewBECsUZOSLi0/b+WkJogDk
 GSRDnLsWPPp7h3NiS9qe93Pv4C9yGD9NCZQBTsJ5PN2iJOV/sQifkEtGs
 piytQy0hSDf5D8j3BN4B/ugmDZskyMANxfbsl7yyiWUEOoqKeCTPOoBYz
 5djGpOvP3+REBToHpg66CNUJcBqI17TTXrN715VYhKySoKO9pv9wmBfJ4
 2rAcH6xIFjJOCUvdHtY1FIOoO85Z8kB2+tVO2jrL821nhIn7jZDNYfmGQ A==;
X-CSE-ConnectionGUID: 6AyzLXarS164er7rK4ke+w==
X-CSE-MsgGUID: 9KjtEP3HTsOa9MmuPBH/vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3732289"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3732289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:26:38 -0800
X-CSE-ConnectionGUID: qde3AoSKQtijJWTpi6t+iQ==
X-CSE-MsgGUID: bBooGkeYSGiMjdQt2yM8rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; d="scan'208";a="10529669"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.244.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2026 04:26:37 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 2/2] tools/intel_tiling_detect: Enable Tile64 detection
Date: Wed, 18 Nov 2026 13:26:22 +0100
Message-ID: <20261118122619.206753-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
References: <20261118122619.206753-4-zbigniew.kempczynski@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enable Tile64 in detection tool to check what hw blits are supported
in the hardware.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tools/intel_tiling_detect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_tiling_detect.c b/tools/intel_tiling_detect.c
index 951e2eecd04..7b13fdcfe8d 100644
--- a/tools/intel_tiling_detect.c
+++ b/tools/intel_tiling_detect.c
@@ -347,7 +347,7 @@ static bool try_tile[NUM_REFS] = {
 	[I915_TILING_Y] = true,
 	[I915_TILING_4] = true,
 	[I915_TILING_Yf] = true,
-	[I915_TILING_64] = false,
+	[I915_TILING_64] = true,
 };
 
 int main(int argc, char *argv[])
-- 
2.43.0

