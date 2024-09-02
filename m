Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C04CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 09:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CFB10E265;
	Mon,  2 Sep 2024 09:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NjnEL2TD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C4F10E265
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 09:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725267620; x=1756803620;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvU4KcDdN8ScmS8nzLwNccftRN+KTPlYCps5ebodack=;
 b=NjnEL2TDEFMBfWEX3gbMXp2MMVvscGm2QBjxa0osjEts4whee+bHpV0p
 htyUE9E8VLHCmp6vL2X+e16BetZcxoXOxUaYo+KYiS3nrECUDmSVy8RkF
 /1uubOmidumzyD9CFXxrWmqposApB6r84fqubJmbfyGKBlVDPgdRVx+O3
 RuIC8bUTsmJUyh1kvDHlorsUvS/TBLi/0lJwEAaZ0jLIXknAGR6vMWw8Q
 f3D2dIk2+SnJ0hrdvR+lSSHpfWQDfebePWZcvq5U4gjiaSD5aP1LGrXXO
 2HwSdY2S/Jzhc4CbnW/DXxu0svTQgAzSA50QZkfspUHh6bUwyPXhkBP74 g==;
X-CSE-ConnectionGUID: AtkrQtqGTI+1mQRuA/uyIw==
X-CSE-MsgGUID: 08ERGwLdQuGDM4Xv92uwzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41316183"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="41316183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:00:20 -0700
X-CSE-ConnectionGUID: Vtki2CItSnq/KmesBsRGBQ==
X-CSE-MsgGUID: emzT+1TvSuetYIhF98lSWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64749711"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 02:00:18 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, jeevan.b@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v6 3/4] tests/intel/kms_pm_dc: Update test duration to 4
 seconds
Date: Mon,  2 Sep 2024 14:29:42 +0530
Message-ID: <20240902085943.1496088-4-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
References: <20240902085943.1496088-1-ramanaidu.naladala@intel.com>
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
index 2d03ba4c5..75262c79d 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -592,7 +592,9 @@ static unsigned int read_pkgc_counter(int debugfs_root_fd)
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

