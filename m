Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A1FDCD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 14:14:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8A010EFCE;
	Tue, 26 Mar 2024 14:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="As+KatHM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 921BA10EA60
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 14:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711462443; x=1742998443;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Yla258niWQMxJUgIsMc6oPste0voHiw+vk00dGpkhbs=;
 b=As+KatHM0v/h9Vj9J8Py2vGRg8a7CgpmgZxs2HGS09u7hjgA5sxpx60o
 jDfXFbZ5JZZsR+63abLo1ZeHXi14jWeEzoaEzh7bz7axx3Evreu0qTB1t
 OOxsQoknUVTIOZOrEx0qBWZzi0pxJtk3lv5muscKtqrZOstJXMFWLuHi6
 gUE9qjub1NiiF76FVZvqsyTAe2mti9khM5BsfeVMzZ/WlBAsvewc29+gu
 MTWgwI0lDcQu/SY5n4m2BkQgv1Pat7wEYaj4oIpUjBzn03SX6ewHV7XVd
 XQULGUvRuNj6RBqDs4ApmugT+XF0RgrTRRKTqn9+XukTO3d7XefM+BHGX A==;
X-CSE-ConnectionGUID: bNGD78kbSF2TujpQxJgUcQ==
X-CSE-MsgGUID: Mtm+fvB1SpWVVM422x0DwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17147229"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17147229"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:14:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="53437703"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:14:01 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [v4 3/3] tests/kms_async_flips: Reuse the already mmapped buffer
Date: Tue, 26 Mar 2024 19:44:22 +0530
Message-ID: <20240326141422.13993-4-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240326141422.13993-1-vandita.kulkarni@intel.com>
References: <20240326141422.13993-1-vandita.kulkarni@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

In crc test case where we are trying to update the fb
dont mmap it agian. On some platforms it was found that
updating a newly mmapped buffer takes longer time.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/kms_async_flips.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 2895168f7..4658ca4c0 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -221,12 +221,19 @@ static void test_init_fbs(data_t *data)
 		prev_modifier = data->modifier;
 
 		if (data->bufs[0].fb_id) {
-			for (i = 0; i < NUM_FBS; i++)
+			for (i = 0; i < NUM_FBS; i++) {
+				if (is_intel_device(data->drm_fd))
+					igt_fb_unmap_buffer(&data->bufs[i], data->bufs[i].driver_priv);
 				igt_remove_fb(data->drm_fd, &data->bufs[i]);
+			}
 		}
 
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
 			make_fb(data, &data->bufs[i], width, height, i);
+			if (is_intel_device(data->drm_fd))
+				data->bufs[i].driver_priv = igt_fb_map_buffer(data->drm_fd,
+									      &data->bufs[i]);
+		}
 	}
 
 	igt_plane_set_fb(data->plane, &data->bufs[0]);
@@ -730,8 +737,11 @@ igt_main
 	}
 
 	igt_fixture {
-		for (i = 0; i < NUM_FBS; i++)
+		for (i = 0; i < NUM_FBS; i++) {
+			if (is_intel_device(data.drm_fd))
+				igt_fb_unmap_buffer(&data.bufs[i], data.bufs[i].driver_priv);
 			igt_remove_fb(data.drm_fd, &data.bufs[i]);
+		}
 
 		if (is_intel_device(data.drm_fd))
 			buf_ops_destroy(data.bops);
-- 
2.43.2

