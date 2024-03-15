Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D76C54E58
	for <igt-dev@archiver.kernel.org>; Fri, 15 Mar 2024 06:11:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 463A810FA15;
	Fri, 15 Mar 2024 06:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O0YMk5+D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E43510F9F3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Mar 2024 06:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710483081; x=1742019081;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b2kNc4K7YcurRtCbwCRdE7ao6jT7qw/YCrkd+XAPhig=;
 b=O0YMk5+DtB6M3OEKbW3scqKVhkT/HpZ1OJ/GtXFiYeF3ch7TO3sspVwn
 Dinqus4W8auNoA+Er4t3yBKqMScqHlqcxEqRQnhvKvl8qPtYl4ZqLc3ij
 CzXBlu+r/e0o4WG5t2RJZNX0CBCvwQyelGrtT9By/tO4oAdEBQH1ohV/q
 obEYpD/4FavhfGKONrw5pmSi6w4PbwOzgPl/V2d/CWWpE6H+xIHsXn3xr
 F/B2ZhUfAWHlmXURcfb8HVXNRtxLabxH7cCI6E7WSroFoSJZgX330JQZT
 iCaiR8jLrEzVvA90Qqrb2IB4Uyr3hy23W/09v+rXBExE3NeJORJtQL5pA A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5187370"
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; 
   d="scan'208";a="5187370"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,127,1708416000"; d="scan'208";a="12463521"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 23:11:18 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, bhanuprakash.modem@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t 2/3] tests/kms_async_flips: Reuse the already mmapped
 buffer
Date: Fri, 15 Mar 2024 11:41:41 +0530
Message-ID: <20240315061142.6591-3-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240315061142.6591-1-vandita.kulkarni@intel.com>
References: <20240315061142.6591-1-vandita.kulkarni@intel.com>
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

In crc test case where we are trying to update the fb
dont mmap it agian. On some platforms it was found that
updating a newly mmapped buffer takes longer time.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
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
2.34.1

