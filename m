Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB594F3029B
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 05:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4220710E340;
	Tue, 17 Mar 2026 05:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="llBXNJg5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1D810E098
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 05:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773725567; x=1805261567;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dkE2vvuz8s/x+9tzP0OBubKwzETAvNSuM37+4CFwslY=;
 b=llBXNJg5q3c2rVBdZXZVRd98ZuvlRZ5iuGyqfi4pM/U+Tv34O0xgRC4m
 0xeU+AD11ItGpXL7qM7wVY/LJWqiEyXPcq7J6ONltyhblEYoQYV/+hW9+
 ZaePnoCpmJtO/IB2ZueedGPEdgpI92GPG0a5WSgudpUQYsJZvsz+xN7Hu
 DM1hDLFxq7xcBACid3Vy6kB9D/oBy70pd2DJV4U952FNMNi3pibJVphcY
 hYme3cRD9+Fx9wUYZIxBOnSBGwHjGzuhQmiFVebMV2iKYBn5xOQZ+4EaC
 Ye6fqw0N6O1sErgxsjFo1MuTvui9rj3g7aA7vIJM31ogWvynqP3y9Y4Pb A==;
X-CSE-ConnectionGUID: OSdCpf5CQhCeMIPfQVS6PA==
X-CSE-MsgGUID: svIUwP/dQmCnzET59y0wuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="100204857"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="100204857"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 22:32:47 -0700
X-CSE-ConnectionGUID: If2bdtujSx+eslhtufJ5xw==
X-CSE-MsgGUID: tU2LYb3vT5O1xZ5QnxOmXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="226829379"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.190.216.152])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 22:32:45 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/kms_async_flips: Use lowest mode for crc
 subtest
Date: Tue, 17 Mar 2026 11:00:38 +0530
Message-Id: <20260317053038.51570-3-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260317053038.51570-1-santhosh.reddy.guddati@intel.com>
References: <20260317053038.51570-1-santhosh.reddy.guddati@intel.com>
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

Currently The CRC subtest uses mode[0] which maps to preffered high
refresh mode. On panels with multiple modes, pick the lower mode to
speed up crc test.

V2: Rename and move the function to lib to re-use. (Ramanaidu)

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a2930968..e8a3da07c 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -819,8 +819,9 @@ static void test_crc(data_t *data)
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	/* make things faster by using a smallish mode */
-	mode = &data->output->config.connector->modes[0];
+	/* make things faster by using a lower bandwidth mode */
+	mode = igt_output_get_lowclk_mode(data->output);
+	igt_output_override_mode(data->output, mode);
 	width = mode->hdisplay;
 	height = mode->vdisplay;
 
-- 
2.34.1

