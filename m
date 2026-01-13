Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659BD2D0E0
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 12:04:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B0F10E4B5;
	Tue, 13 Jan 2026 12:04:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M6pQ6OsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3F110E4B5
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 12:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768305894; x=1799841894;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Z68QPv9nNd+dUlRL1eBP9Gh+V0ju1Qm60OdR5RVz0cQ=;
 b=M6pQ6OsXK02zrlJw+wCln3lm1r7SKEUp8OWlsTpuQiJ9BSAqxKXjxtWe
 WArcMeLvC/8PP/9k0Bo3B268it+cmZ/PN/myr8VpKelgjQTwfC9hxGB9/
 5ovU83Btrf8b6QsX+mkMAK6YHa5QCKaTEvUgZmZkzI7boSihZpdFSBYSi
 zujTe596kpxpCeNmMqv7s7wp22XASfgC3tKnJwuLTH/Paqj8hStXgKCy0
 AvqZP3puZew+5RwmLv4ht5WGmcl+ItquvF4HJW++LyEHAbRNtRiJxRt/R
 7oancyjovpErl+4UjZzeRPDYqFA01SwPKcpSM3tB6K7cEaaogMSksT09H Q==;
X-CSE-ConnectionGUID: jWm2vknpSDuoAQAz0Bwtdw==
X-CSE-MsgGUID: MJniPvXuQ9W3c+LXezPlCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="92256385"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="92256385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:54 -0800
X-CSE-ConnectionGUID: lL05YYHuTVelA3n2Fos0Sg==
X-CSE-MsgGUID: scFv3kdlQJ+zXkETI3yGuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="208835701"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.124.220.52])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 04:04:53 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/8] tests/kms_rotation_crc: s/0/PIPE_A/
Date: Tue, 13 Jan 2026 14:04:34 +0200
Message-ID: <20260113120439.12577-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
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

Pass 'PIPE_A' instead of '0' to test_multi_plane_rotation()
since it takes an 'enum pipe'.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_rotation_crc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index c0642a389121..b1765b4c75e5 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1312,7 +1312,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.4f;
 		data.planepos[1].y = .1f;
-		test_multi_plane_rotation(&data, 0);
+		test_multi_plane_rotation(&data, PIPE_A);
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/top corner of primary plane and"
@@ -1326,7 +1326,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_top | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.15f;
-		test_multi_plane_rotation(&data, 0);
+		test_multi_plane_rotation(&data, PIPE_A);
 	}
 
 	igt_describe("Rotation test on both planes by cropping left/bottom corner of primary plane"
@@ -1340,7 +1340,7 @@ int igt_main_args("", long_opts, help_str, opt_handler, &data)
 		data.planepos[1].origo = p_bottom | p_right;
 		data.planepos[1].x = -.15f;
 		data.planepos[1].y = -.20f;
-		test_multi_plane_rotation(&data, 0);
+		test_multi_plane_rotation(&data, PIPE_A);
 	}
 
 	/*
-- 
2.51.2

