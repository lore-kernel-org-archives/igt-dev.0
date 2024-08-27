Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674A7C5473E
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 16:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D06010E3B6;
	Tue, 27 Aug 2024 16:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="juoqfgyX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA43210E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 16:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724777697; x=1756313697;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UFtmpcsgVSVPuGhRN6v+CssCY2TGi6CnhV6M5cvjSrE=;
 b=juoqfgyXPR3CAwLRoQoaT0QvE5h8uWr2SndpWhMw7cuzt1h+7yVPavZk
 /eOof0miN67EsDyH0XudRxtX6tNDAGy5+0Pn78e4CMJkeF/DabSCx/jya
 17XBq6gdEVdfs2lfwfJo3dCzl3sWzkGz6bnepyQM6RsA59qgywib6j3Zs
 NBa8bgvQ2uUbh4VQJi1Z2r9SUM9oYAiUbpjCMOOhkxdU7wIaohWgSRemY
 Uct9vBkaRuBZKuSkj5KAEPeuK5DcTOZu3bb9BdXQCw72S1KDGVRzdryoc
 iJdTUYGxaP2PBo6gNFL1xtGcGrFs/pDOMQRPPQSP/GfxoGlIsoU4xX6SC A==;
X-CSE-ConnectionGUID: LphXFTYAR6++gG34fZD6WA==
X-CSE-MsgGUID: dh26OsOIQlKwQ3Kan7MmiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="45787335"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="45787335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:56 -0700
X-CSE-ConnectionGUID: HxHBhxXxTyKvBllVXKejFw==
X-CSE-MsgGUID: CpV9/DxKQ6ic/DsL5R0kMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="63640429"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 09:54:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t v3 07/10] tests/intel/xe_drm_fdinfo: Half the execution
 time
Date: Tue, 27 Aug 2024 09:54:46 -0700
Message-ID: <20240827165449.1706784-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827165449.1706784-1-lucas.demarchi@intel.com>
References: <20240827165449.1706784-1-lucas.demarchi@intel.com>
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

No need to do 500 msec per subtest. As we add more tests, the total
execution time of ~ 2.5 sec per subtest make it take too long. Sleep
half the time to lower the execution time.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_drm_fdinfo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
index 9fb739fba..46c96dbe0 100644
--- a/tests/intel/xe_drm_fdinfo.c
+++ b/tests/intel/xe_drm_fdinfo.c
@@ -73,7 +73,7 @@ struct pceu_cycles {
 	uint64_t total_cycles;
 };
 
-const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 2;
+const unsigned long batch_duration_usec = (1 * USEC_PER_SEC) / 4;
 
 static const char *engine_map[] = {
 	"rcs",
-- 
2.43.0

