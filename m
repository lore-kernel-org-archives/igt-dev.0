Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC1DC54736
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 12:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73F10E310;
	Tue, 27 Aug 2024 12:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hKfUWvf6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA6710E30E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724762449; x=1756298449;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f5lpUTWevxYA9jComfN/+S2fbKgC9ZWCwEwKqBQl0vI=;
 b=hKfUWvf6ny9m272RSCafPdIzdV2FvlfKYc7kl+cj/yFMLRtU4JypH0/F
 hVHR+6AeIg1i8VBpuHkZ/h1/FEn3EcNBD+352rJ8C7zbLxu47GJ4fXx2l
 ElIW0Q6TS/YfFCPjdUeW/FBLtEmJG1Jh98rTk9oDrCVPCZD6PQ+sqmjB5
 rT5OIS3YDeR+WIgvAi9kSzFOSgWG+GePvWsZw/GucSeary8WGPKr/ANyw
 eV235zGFdb9i11NvDqeThPP4dq731YNMULz6EG/5C94djl6uOGfIUIW4Y
 sGACDONxKTK/Vx7Upspyx0Cezw3Jm2gzot8gPnJTyLrk1i7SOLbMJ4jXj w==;
X-CSE-ConnectionGUID: pMb1aJReR/2QODwQYqnYEg==
X-CSE-MsgGUID: 4xKgm7F6RQGltaiPQunH0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="27117256"
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="27117256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2024 05:40:49 -0700
X-CSE-ConnectionGUID: FKrnRb+GSBam7lhHFqV1Dw==
X-CSE-MsgGUID: KB5Jjt4rRsatD9tW6jMrww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,180,1719903600"; d="scan'208";a="62905861"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 05:40:47 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v5 3/4] tests/intel/kms_pm_dc: Update test duration to 4
 seconds
Date: Tue, 27 Aug 2024 18:10:17 +0530
Message-ID: <20240827124018.1373304-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
References: <20240827124018.1373304-1-ramanaidu.naladala@intel.com>
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

Extend the test time to account for features causing
delayed C10 state entry. Considering CI execution time, we have
set the sequence to 4 seconds. For the first 2-3 seconds, we run
at the maximum refresh rate and then change the refresh rate to
emulate extended vblank for the remaining 4 seconds.

v2: Split the patch into two. (Kamil)
v3: Declare variable in new line. (Suraj)
v4: Fix magic number. (suraj)

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
---
 tests/intel/kms_pm_dc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index b9bee3523..a69876fc7 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -593,7 +593,9 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
 static void test_deep_pkgc_state(data_t *data)
 {
 	unsigned int pre_val = 0, cur_val = 0;
-	time_t start = time(NULL), duration = 2, delay;
+	time_t start = time(NULL);
+	time_t duration = (4 * SEC);
+	time_t delay;
 	enum pipe pipe;
 	bool pkgc_flag = false;
 	bool flip = true;
-- 
2.43.0

