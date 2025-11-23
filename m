Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A6DCFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C70A10E18B;
	Sun, 23 Nov 2025 15:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSlAqLA6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E02310E18C
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910545; x=1795446545;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rYYE+LngUlu5ziXc5umqtUyWfzbDlCNKmL1ogwQ8a6k=;
 b=XSlAqLA66PggFTySX7/Sca7d4VJQ5BpZvnp1Q6/vrq3852SEfgd4qY4a
 9QUxtpc8AL24z4fCCVlL69JWynfZnBrxZBmn66cgQSyfMt3idXrgtq3Rc
 lrT7MIjVigqM5x2ErNy7lz51S+u3OsokTlcTwSOP6UULf/RWX9AmeQfVR
 k5l48VgnhWlj14Rdzb9yH0ki731aNmSWS6BAEYmA3LulYdFAHbmfuo+uV
 qzK2/O6XODlszQIH9UrXQfa0BHgX4eO1Wtkdm/iRLK+bawSZwec2PYGgQ
 T8iUWG17CjUyCAxvRwrMhfJO4NUzXr9uGJOhEz7iTotvJzBN6vlQ/0gcf Q==;
X-CSE-ConnectionGUID: ZqbZ0LiSSPOBVpYUCY/lWQ==
X-CSE-MsgGUID: pXhSxjhISWSjsFDpEaAReQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615233"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615233"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:09:05 -0800
X-CSE-ConnectionGUID: Kq0a3hhsSTCgktW0m+cYpg==
X-CSE-MsgGUID: PM1Fo5EJQSSJEiQ8TNJ4Ug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903887"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:09:05 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 33/35] tests/intel/kms_pipe_stress: use display-aware
 pipe CRC helper
Date: Sun, 23 Nov 2025 20:54:10 +0530
Message-Id: <20251123152412.599801-34-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123152412.599801-1-kunal1.joshi@intel.com>
References: <20251123152412.599801-1-kunal1.joshi@intel.com>
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

Replace igt_pipe_crc_new() with igt_pipe_crc_new_for_display() when creating per-pipe CRC collectors. This removes the dependency on pipe == CRTC index and ties CRC sampling to the display pipeline described by igt_display.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_pipe_stress.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_pipe_stress.c b/tests/intel/kms_pipe_stress.c
index 193f59d8d..bfdf88369 100644
--- a/tests/intel/kms_pipe_stress.c
+++ b/tests/intel/kms_pipe_stress.c
@@ -806,8 +806,8 @@ static void prepare_test(struct data *data)
 		if (data->highest_mode[i]) {
 			igt_info("Using mode: \n");
 			kmstest_dump_mode(data->highest_mode[i]);
-			data->pipe_crc[i] = igt_pipe_crc_new(data->drm_fd, i,
-							     IGT_PIPE_CRC_SOURCE_AUTO);
+			data->pipe_crc[i] = igt_pipe_crc_new_for_display(&data->display, i,
+						     IGT_PIPE_CRC_SOURCE_AUTO);
 		} else
 			data->pipe_crc[i] = NULL;
 
-- 
2.25.1

