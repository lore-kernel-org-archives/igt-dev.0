Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65576F532EE
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 08:20:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494B10E5AD;
	Tue, 24 Mar 2026 08:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z8MD5lGh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BB910E5AD
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774340405; x=1805876405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YxZ4rFl3lKmPDU3KVHd4U9wIaTPWqp1n9hSo0onOqoo=;
 b=Z8MD5lGhCIaJzFYjV0IMnw5eQhLOV9mjVFL9LvEH/aIMEI3x7/yfIXGQ
 Y1X975JlicMePQKdz/sUJhpzlpNR6ftOTtZSZzdv77tmrsgBTS2axM5do
 jJ395ubN42ccMr3pFXv8r1g/5j4fIzo04CCRMZATSqOX2IZJpHjsjC428
 4vayyC/hBEDsKTu1p9D2ajFC6njOa8r4TMYZY1HA90hsx1rhszbMDMdN8
 8HXKKWLUMzmogmKNlXk1uLwhDNxW0kaEEMFFyM0SUGRABL8UsNVGgPZPd
 0YvFttd2EWWb3I2pjycbWUU0/ARHSKhRuraD+G+lbj7xsf/KBebKqQZZR w==;
X-CSE-ConnectionGUID: pVhH/2rKQE6rZhnd66v/qQ==
X-CSE-MsgGUID: HlT4bLMrSCiTVThk/3E3kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75230421"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="75230421"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 01:20:04 -0700
X-CSE-ConnectionGUID: DZrkjmWDSVy3JwcJ60SO1g==
X-CSE-MsgGUID: CFhWhI5eTDi5mfftoYX9Hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="219855571"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 01:20:01 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1] tests/kms_async_flips: fix timestamp print format
Date: Tue, 24 Mar 2026 13:47:29 +0530
Message-Id: <20260324081729.91949-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
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
change from %ld to %lu*.

This changes fix the below wrong log formatting.
(kms_async_flips:16619) CRITICAL: Failed assertion: seq1 == seq + 1
(kms_async_flips:16619) CRITICAL: Vblank sequence is expected to be
incremented by one(-1572997043 != (-1572997050 + 1)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a2930968..38de4a5e4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -599,9 +599,9 @@ static void test_timestamp(data_t *data)
 	/* TODO: Make changes to do as many flips as possbile between two vblanks */
 
 	igt_assert_f(seq1 == seq + 1,
-		     "Vblank sequence is expected to be incremented by one(%d != (%d + 1)\n", seq1, seq);
+		     "Vblank sequence is expected to be incremented by one(%u != (%u + 1)\n", seq1, seq);
 
-	igt_info("vbl1_timestamp = %ldus\nflip_timestamp = %ldus\nvbl2_timestamp = %ldus\n",
+	igt_info("vbl1_timestamp = %luus\nflip_timestamp = %luus\nvbl2_timestamp = %luus\n",
 		 vbl_time, data->flip_timestamp_us, vbl_time1);
 
 	igt_assert_f(vbl_time <= data->flip_timestamp_us && vbl_time1 > data->flip_timestamp_us,
-- 
2.34.1

