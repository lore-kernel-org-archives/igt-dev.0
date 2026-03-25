Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1231FEA830
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 07:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716FA10E4EB;
	Wed, 25 Mar 2026 07:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0yiimSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B923910E4EB
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 07:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774425120; x=1805961120;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k7j2Qyg5y3E+E7foWI30SUPpWkSowi0JcsIxTxx1RR8=;
 b=R0yiimSKHfHj2Ec9ylX1ZVhOLhNDVcT/qytsyLTUWlS0lHB71330vGa9
 t6oOcMUcSKhJRqmyO3SuHk4e/P4WJ/b+XWGv75S2dqXL0u/lPN9lYxbNg
 LqMwnShWgmHOGdaRBkcgRD2YLyQFOg4snEQvfY7mRyDbc84VkkfaBokef
 WEJkSFAKCxy5+A1vTTtXF84cpXCl/JoH+8Le0Tkr/IodDCHFqLeRj1Uaw
 6sqra4VX+YitYWG8nxvtcxKNq6px4vw1KkZrECf3+ROMj3XfWFiHyASwr
 yGxNSjOJy1Ikq+NoIMn3YqW/sXNKA0AOS8lElpuFMdov0NA4ngd++uC1W w==;
X-CSE-ConnectionGUID: UodgnsN1TWOpqx5oQu2WVA==
X-CSE-MsgGUID: wmygvrjmTX2F7C5lFc0CYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86150315"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="86150315"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 00:52:00 -0700
X-CSE-ConnectionGUID: 2Hb80gybQeOzyFBMkD75YA==
X-CSE-MsgGUID: Fa58tctST5ePq/Bu0JmX/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="221274072"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 00:51:59 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, pranay.samala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Fix timestamp print format
Date: Wed, 25 Mar 2026 13:19:23 +0530
Message-Id: <20260325074923.103348-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
References: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
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

Update timestamp print to use unsigned format specifiers.
Change from %ld to %lu.

This changes fix the below wrong log formatting.

v2: Fix cosmetic changes. (Pranay)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a2930968..305bd5190 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -599,9 +599,10 @@ static void test_timestamp(data_t *data)
 	/* TODO: Make changes to do as many flips as possbile between two vblanks */
 
 	igt_assert_f(seq1 == seq + 1,
-		     "Vblank sequence is expected to be incremented by one(%d != (%d + 1)\n", seq1, seq);
+		     "Vblank sequence is expected to be incremented by one(%u != (%u + 1)\n",
+		     seq1, seq);
 
-	igt_info("vbl1_timestamp = %ldus\nflip_timestamp = %ldus\nvbl2_timestamp = %ldus\n",
+	igt_info("vbl1_timestamp = %lu us\nflip_timestamp = %lu us\nvbl2_timestamp = %lu us\n",
 		 vbl_time, data->flip_timestamp_us, vbl_time1);
 
 	igt_assert_f(vbl_time <= data->flip_timestamp_us && vbl_time1 > data->flip_timestamp_us,
-- 
2.34.1

