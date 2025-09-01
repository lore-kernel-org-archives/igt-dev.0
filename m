Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67776CA0FF0
	for <igt-dev@archiver.kernel.org>; Mon,  1 Sep 2025 09:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186C210E321;
	Mon,  1 Sep 2025 09:48:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j4FGxDf8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAC110E321
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Sep 2025 09:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756720118; x=1788256118;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u6J5YNOpKIOK5C+A7ACqmX6VACrkQggkbDV1Oug3NQU=;
 b=j4FGxDf8aIOXFkQKnOeHulhQ9rm+UycQhNBRvs5OX3Pb06fZ9/rpmPqn
 xwO1KMdCecWIVdWMD1vFYZt03mzdBZ1KVJ6IbTSU9lF9GEimIocijvjBA
 affCSJ8ICJpGVaEMzHtA63RA3icuKX7FgzJFW/36NNTLY1RTprraT65rG
 2U3IpuFcXjdqocp15E5kl18W7UAl/hiEg0pF2FJMmhWfmlGM6gfuhKEgp
 7qK6iPyaQ5ciyy198h0PT56G1AVDyfha8t4kuFDYKRTvYV6WxdTWIlmRs
 sgUuBDy0AQiWHZSkZb4100kO9jZteYaUlM9NbGuE483YEeyNhehG0g0t7 w==;
X-CSE-ConnectionGUID: AfEYEMLhQZqZn0LDWpAJIw==
X-CSE-MsgGUID: x3cIX/hxTG+2ROih/MvIDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11539"; a="69681053"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="69681053"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2025 02:48:38 -0700
X-CSE-ConnectionGUID: C1xYD9XlR167bAp7ZYwGMw==
X-CSE-MsgGUID: +Dx6Eg/1RiKPnDzIVwRT3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; d="scan'208";a="175358256"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 02:48:37 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_rotation_crc: reduce exec. time for sim env
Date: Mon,  1 Sep 2025 15:18:28 +0530
Message-ID: <20250901094828.1232305-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
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

For simulation environment, we can reduce execution time
by running test only with one combination.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_rotation_crc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index e18768141..11cf79d61 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -1064,6 +1064,8 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 					}
 				}
 			}
+			if (igt_run_in_simulation())
+				break;
 		}
 		igt_pipe_crc_stop(data->pipe_crc);
 		igt_pipe_crc_free(data->pipe_crc);
@@ -1080,6 +1082,9 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
 		lastroundjrotation = 0;
 
 		igt_output_set_pipe(output, PIPE_NONE);
+
+		if (igt_run_in_simulation())
+			break;
 	}
 	data->pipe_crc = NULL;
 
-- 
2.43.0

