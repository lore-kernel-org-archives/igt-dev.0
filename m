Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99817C7115D
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 05:24:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537D910E34B;
	Thu, 29 Aug 2024 05:24:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U9cuz1l7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7576010E196
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 05:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724909049; x=1756445049;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Iwl62Ul8PR9y3D2p9yvxyLNcVvoSaG/IiLfArk0u+4A=;
 b=U9cuz1l7CllcLNN/2fNPoy0HeGPO/cy7L021QZhRadSnmeKs+NJOuVwW
 OBah9W1crmtkCl2NQbVnWSee/NFrR+X0oN88hXuMJ29wDNWysH1uNbQyJ
 ZFf/b26KeBGCy135SFmmx7wn5riXxCQmayJfqXSY+tTmRu9yVPFO54xT2
 3SHibFrNCTjPfXXvkoLOA/DmgmRokeaNLSNt7vSeYzMjPJRv7YH+0xwAb
 9t7UDB8AlkGuCtNW3W2GnLR+OjH7nYt3TtznE3knXN/L8ZeWkKuy6/nvR
 j4jlhQGYdAkYVLXU0DNROrj+MkNxVzFOZhDv1TlxvkNNe1VxAolo5jd95 Q==;
X-CSE-ConnectionGUID: NqgOc5oLRCGNJY42FiZ5rA==
X-CSE-MsgGUID: ULpXOXdjSEuvMB6axxEfHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="27352869"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="27352869"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:08 -0700
X-CSE-ConnectionGUID: r0rS3p9qS2Whhjy1EGIakA==
X-CSE-MsgGUID: mcq03CPxRJK0RB3xzz47rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; d="scan'208";a="94200501"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 22:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: [CI i-g-t 3/5] tests/intel/xe_drm_fdinfo: Use igt_assert_lt_double()
Date: Wed, 28 Aug 2024 22:23:52 -0700
Message-ID: <20240829052354.1872909-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240829052354.1872909-1-lucas.demarchi@intel.com>
References: <20240829052354.1872909-1-lucas.demarchi@intel.com>
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

This also shows the value that is failing, which helps debugging.

Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 074a89711..1b5980752 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -485,10 +485,12 @@ check_results(struct pceu_cycles *s1, struct pceu_cycles *s2,
 
 	igt_debug("%s: percent: %f\n", engine_map[class], percent);
 
-	if (flags & TEST_BUSY)
-		igt_assert(percent >= 95 && percent <= 105);
-	else
+	if (flags & TEST_BUSY) {
+		igt_assert_lt_double(95.0, percent);
+		igt_assert_lt_double(percent, 105.0);
+	} else {
 		igt_assert(!percent);
+	}
 }
 
 static void
-- 
2.43.0

