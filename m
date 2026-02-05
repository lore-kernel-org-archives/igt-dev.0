Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC508EC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF310E8AD;
	Thu,  5 Feb 2026 13:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PtxGJYVh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBA410E8AA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298267; x=1801834267;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wWR0vnPAPzkhLCQy6xKWAoH5bmIQE6CZDo/7iNnniaI=;
 b=PtxGJYVhYeDP9mTKo95kvE8RVQpXPoMvxe9Jc3x4zrDkLbRrnx5/HC1E
 kPjB72RZ0VfO6hlBDljGLyCFAbBm2NOF0gU05DiLJfEr3OW7nxwT+m+/y
 C6SUhho2RXDohjVtk9HARMDBRclHWVnxlKKnd761msk3a02r91jNzviAQ
 BdOliyJvIUtIDNjy1qxQotYNGn/nCXZNi00SSHcv06tM9oSQuC3VbDHbG
 l2QCVdmwevtjn3QLaIIzpwi6+prqAP/hcccst6kb33Q4EoQ2WKLzYxmmo
 iaWn2SRCpAafxUNX+doU4ac8xyibOcnGTVcLBuUZHa1TPSMYym2wGxJOq Q==;
X-CSE-ConnectionGUID: RyMIvl/nQ/+Zk7UShG8j/Q==
X-CSE-MsgGUID: SUrYOdSRT/SxEqcV2jk9NA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="70693542"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="70693542"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:31:06 -0800
X-CSE-ConnectionGUID: b0Fn8usBQWajx7YY/6OBWg==
X-CSE-MsgGUID: 5Hp/MoY6Qs6fQJJ5PxLdKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215499341"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:31:05 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/12] lib/kms: Nuke for_each_pipe()
Date: Thu,  5 Feb 2026 15:30:19 +0200
Message-ID: <20260205133019.9161-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Everything has been converted to for_each_crtc(), nuke the
old for_each_pipe().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 057a0f5e90e0..ca039a6bb9e5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -742,21 +742,6 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 #define for_each_pipe_static(pipe) \
 	for (pipe = 0; pipe < IGT_MAX_PIPES; pipe++)
 
-/**
- * for_each_pipe:
- * @display: a pointer to an #igt_display_t structure
- * @pipe: The pipe to iterate.
- *
- * This for loop iterates over all pipes.
- *
- * Note that this cannot be used to enumerate per-pipe subtest names since it
- * depends upon runtime probing of the actual kms driver that is being tested.
- * Use #for_each_pipe_static instead.
- */
-#define for_each_pipe(display, pipe) \
-	for_each_pipe_static(pipe) \
-		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
-
 /**
  * for_each_crtc:
  * @display: a pointer to an #igt_display_t structure
-- 
2.52.0

