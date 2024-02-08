Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFF7C4828F
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 12:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3A710E375;
	Thu,  8 Feb 2024 12:10:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ax3B8Y2k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDC710E375
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 12:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707394256; x=1738930256;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DzQFkqJIRLhr6gBOa8Dajab1AYWnov0qCOV9e2N3jd8=;
 b=ax3B8Y2k5DFp6ej2UB6M6MhXioH736ESarfP1vbmgAWkouyJBj3da4WO
 4BcBUvSiRUhGoUmOTK5EYBrrXnJKiRL03vohIXAYsIzIu1UYQHQhPpzSd
 J0d7aahuQswfdAYBzOF7IUa0vSQre2gV43ULpraNdCfWhmT4+z1lUhyrQ
 llTbVfHXn9azIf9a0ksYz3B7GIWyqjzGSC03jDvWrCRTIiTiUtK0TVvQr
 f4NqmDe+ar6C9YfTEJrrgYoDps8ghkyDiouBPrlrMkYtLPELr9H+NmJeE
 B122zmv8hLqXFB4+OmI3c5JZVBvT35aHhnHa5FCpEG3fizWzgM6UbTo80 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1501759"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1501759"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:10:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1872902"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 04:10:42 -0800
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, karthik.b.s@intel.com,
 juha-pekka.heikkila@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [PATCH i-g-t] tests/kms_async_flip: Reduce the clobbering area used
 for CRC test
Date: Thu,  8 Feb 2024 17:40:38 +0530
Message-ID: <20240208121039.13701-1-vandita.kulkarni@intel.com>
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

On some platforms wc_mmap write takes longer to paint the fb,
which we are using to clobber the already scanned buffer for
CRC. Hence reducing the clobbered area.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 tests/kms_async_flips.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index a0349fa03..2e5960943 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -589,7 +589,7 @@ static void test_crc(data_t *data)
 
 	while (clock_ms() - start < 2000) {
 		/* fill the next fb with the expected color */
-		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
+		paint_fb(data, &data->bufs[frame], 10, 10, 0xff0000ff);
 
 		data->flip_pending = true;
 		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
@@ -600,7 +600,7 @@ static void test_crc(data_t *data)
 
 		/* clobber the previous fb which should no longer be scanned out */
 		frame = !frame;
-		paint_fb(data, &data->bufs[frame], 1, height, rand());
+		paint_fb(data, &data->bufs[frame], 10, 10, rand());
 	}
 
 	igt_pipe_crc_stop(data->pipe_crc);
-- 
2.43.0

