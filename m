Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC501C7EE39
	for <igt-dev@archiver.kernel.org>; Fri, 27 Jun 2025 06:00:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DBFE10E970;
	Fri, 27 Jun 2025 06:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYYmFZB1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB3810E96D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Jun 2025 06:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751004047; x=1782540047;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vNq1zCKLzr7wn9WU8XHq+dMWhghwm3/JNsakZza4GDo=;
 b=RYYmFZB17+6JtjmuPVnADDV+a9t582FQ9a47kw4h027Rw9t+kIb2WJww
 GR87MMqswXq2zpSy+/J8Bg0g3iPQw+Vhhq/+WTN2hp2etuUgKLvflNC5d
 RMCzWEFWasHZ0/byu/xoa3r/YPkmuYpF/nG2a+scbQmp73etUZoWxfuTO
 ybs11o3vq+2KvKS8Y0z+6UQ9y7LJxqDSTBQqqdJZUKfzYqEf8Oal2Q33l
 zYZRsHIUX88HUfWaroPCDeR8D/MRGgTbry3nVzs/YyYXALEfuIVmuaYxe
 9OxRPPynlveydXViyuRHWsqKJ6P+kQn4nUgIkBdJ2pP7o01TmzWdTydkI A==;
X-CSE-ConnectionGUID: oWq/rS2CSeq6QIAPM6V+hw==
X-CSE-MsgGUID: EDh7gimmSVKYPYN1j0pS9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53278512"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="53278512"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 23:00:47 -0700
X-CSE-ConnectionGUID: KRJ1Rws4S7m0coSmqHK7fA==
X-CSE-MsgGUID: A0H8Z79XQQK2aK3b1Lm/uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; d="scan'208";a="152809467"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 linux-Lunar-Lake-Client-Platform.iind.intel.com) ([10.190.238.55])
 by fmviesa006.fm.intel.com with ESMTP; 26 Jun 2025 23:00:45 -0700
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v2 4/7] tests/intel/kms_dirtyfb: Enable the tests support
 variations based on the WAs
Date: Fri, 27 Jun 2025 11:34:43 +0530
Message-Id: <20250627060446.29615-5-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627060446.29615-1-mohammed.thasleem@intel.com>
References: <20250627060446.29615-1-mohammed.thasleem@intel.com>
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

This update stops skipping fbc-* tests support variations based on the WAs.

v2: Updated function name with intel_is_fbc_disabled_by_wa. (Kamil)

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index a5707c5b1..e190fdec3 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -381,8 +381,9 @@ igt_main
 					data.mode = igt_output_get_mode(data.output);
 
 					/* FBC disabled: Wa_16023588340 */
-					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
-						       "FBC isn't supported on BMG\n");
+					igt_skip_on_f(data.feature == FEATURE_FBC &&
+						      !intel_is_fbc_disabled_by_wa(data.drm_fd),
+						      "WA has disabled FBC on BMG\n");
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-- 
2.34.1

