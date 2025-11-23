Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8E8CFD2F6
	for <igt-dev@archiver.kernel.org>; Sun, 23 Nov 2025 15:08:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 630CC10E152;
	Sun, 23 Nov 2025 15:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hAEZv7Iw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF0710E182
 for <igt-dev@lists.freedesktop.org>; Sun, 23 Nov 2025 15:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763910525; x=1795446525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AbNuDuwgMXKUZjgltZhdy+Js3ZFZpayXqO3GTo0dvP0=;
 b=hAEZv7IwWgJ1wS/H+VSPstY1P5M7GDyAVOo+Jj1yZnZ78qLAx7Oq65bq
 CfvF8ta3jdYEAsymb3go1uaEdXXvEMoUZ2NFPtU+mlXBGu1WNxe8sznuj
 19edGswwo7Nj9gO/kHAKqenEZvpPm9Ao60gGR15kfxMFjdKTU/wL/SKg8
 U+nPKuOpJep4o0By+uShQLXIENf3BWy5L5sfI7rwZ0PPEnWi3Cadw4Coj
 8CoK6HsydJf81BRfvljCwXVJWqW+qI0DGjXdqu6gUNJlFuCWE4Azo++8j
 CNk7vbvI3S0Aw10ahp36VZEASR1U1t2er3BL1ouPCWEvARpJ2/Xoi9N6G g==;
X-CSE-ConnectionGUID: zWmvpdtgQo6KXYPQjiUGyA==
X-CSE-MsgGUID: ZYIr5jNZSlyVmVYzMkK+OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="76615203"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="76615203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2025 07:08:45 -0800
X-CSE-ConnectionGUID: oel79W+LR1+RqpGmFmiaEw==
X-CSE-MsgGUID: zWdMhkoyTlmjpGjIw2ahDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; d="scan'208";a="191903804"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 07:08:45 -0800
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 19/35] tests/kms_bw: use display-aware pipe CRC helper
Date: Sun, 23 Nov 2025 20:53:56 +0530
Message-Id: <20251123152412.599801-20-kunal1.joshi@intel.com>
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

kms_bw created pipe CRC helpers with igt_pipe_crc_new(fd, pipe, ...), keying them
directly off the logical pipe index. That assumed the pipe enum matched the
CRTC index used in the crtc-<index>/crc/ debugfs paths, which can break on
platforms where CRTCs and hardware pipes are not in a simple 1:1 mapping.

Switch the CRC helper setup in this test to use igt_pipe_crc_new_for_display(&data->display,
data->pipe_id[i], IGT_PIPE_CRC_SOURCE_AUTO) so that the CRC debugfs paths are
derived from display->pipes[pipe].crtc_offset instead of the pipe enum.

This makes kms_bw robust to non-trivial CRTC index to hardware pipe mappings
while preserving the rest of its logic.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_bw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..c0cc74430 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -129,8 +129,9 @@ static void test_init(data_t *data, bool physical)
 		data->primary[i] = igt_pipe_get_plane_type(
 			data->pipe[i], DRM_PLANE_TYPE_PRIMARY);
 		data->pipe_crc[i] =
-			igt_pipe_crc_new(data->fd, data->pipe_id[i],
-					 IGT_PIPE_CRC_SOURCE_AUTO);
+			igt_pipe_crc_new_for_display(&data->display,
+						      data->pipe_id[i],
+						      IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
-- 
2.25.1

