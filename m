Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E3ABC27C5E
	for <igt-dev@archiver.kernel.org>; Tue, 11 Jun 2024 08:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E2110E568;
	Tue, 11 Jun 2024 08:04:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UzAT1pL/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A8310E568
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Jun 2024 08:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718093071; x=1749629071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lwp5zww32xP3HgkvmHAdZuzm/I4WJRyL/UHKojkY5ws=;
 b=UzAT1pL/aQ9ra4qCqLp2vtTihpUrUGE4TcYmh1mr1SyYYWsvMObGYDok
 nbrHaQf4iLIfWOi9/zPUKJWxq4LpPmU2foma7zShgoxEmJ3eT2n/l+1Gp
 bunZdCiG8DvIM9lhdRS8KCZhP30lTv0g/Vlw7MhWcW34e8y2I4pXRdl4e
 biA6b4vpCD0dRKqEWzKxfc+k65wcn6nNWCHE+EpK2qrBEZZEa5oiw+kEN
 b9YzdudsyUulWUpRe75NspH9ThFxv6UVIMvd5N1+TxvjKe3dNOPLApeSd
 r4H25U0cKDfI0avLDtCRADEZh52FmQ5/04ADZGtR4U0CXu5Y6b1PHCiJW A==;
X-CSE-ConnectionGUID: hlDlCS7wTTqepQ6dc8PrfA==
X-CSE-MsgGUID: f3GWdyz3T3e/yPRE8VKYOQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="25907314"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="25907314"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:31 -0700
X-CSE-ConnectionGUID: x9lHsCzuSyOJff8czC2h/g==
X-CSE-MsgGUID: rRUTsMdJTyOXylNzFZj2ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; d="scan'208";a="39336135"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO vgovind2-mobl3..)
 ([10.245.245.127])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 01:04:30 -0700
From: Vinod Govindapillai <vinod.govindapillai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, juha-pekka.heikkila@intel.com,
 jouni.hogander@intel.com, jonathan.cavitt@intel.com
Subject: [PATCH i-g-t v3 1/5] lib/i915/fbc: print current fbc status if cannot
 be enabled
Date: Tue, 11 Jun 2024 11:04:12 +0300
Message-Id: <20240611080416.56878-2-vinod.govindapillai@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611080416.56878-1-vinod.govindapillai@intel.com>
References: <20240611080416.56878-1-vinod.govindapillai@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Print the current fbc status if the fbc is not enabled after
the timeout.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
---
 lib/i915/intel_fbc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/i915/intel_fbc.c b/lib/i915/intel_fbc.c
index 3fac60087..07ed7f469 100644
--- a/lib/i915/intel_fbc.c
+++ b/lib/i915/intel_fbc.c
@@ -92,6 +92,10 @@ bool intel_fbc_is_enabled(int device, enum pipe pipe, int log_level)
 bool intel_fbc_wait_until_enabled(int device, enum pipe pipe)
 {
 	char last_fbc_buf[FBC_STATUS_BUF_LEN] = {'\0'};
+	bool enabled = igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
 
-	return igt_wait(_intel_fbc_is_enabled(device, pipe, IGT_LOG_DEBUG, last_fbc_buf), 2000, 1);
+	if (!enabled)
+		igt_info("FBC is not enabled: \n%s\n", last_fbc_buf);
+
+	return enabled;
 }
-- 
2.34.1

