Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20313CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 11:41:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CD810E1C9;
	Mon, 18 Aug 2025 11:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iupdcOSn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBA310E1C9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 11:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755517283; x=1787053283;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jYBSkcotBrst/eY6FyDYjXeQ/8NvYgix79mkQaKugkw=;
 b=iupdcOSnBk/z4VulnlYZZXaNz/EyrTbZ9bPgUk9nKREwK16xY1+RSp7l
 3cx7Z7TwS184OnFmj/srfHzvYKvCWQcqnrzz/9U2B0kNjndRBSyAX2+F3
 BBN0owlX75w5tI6WJTF5bAD2NXm9myStaKhlMM9jejCw+GzzVnD0uZQi0
 /UW74MXen6hdeLfdskrHxhubK1CWXhS07ZQX8oPzanXRJjuQcWdpqDpdv
 LUFI4YbRdWJ1N1/d2dHmQYOQQBFUoJqZz0nPswrKz75vzgzQgIVfPsCmk
 kodH0Z2LxQMltsQD4dR8pjqPLa1k7ofI0M0QIjntY52w4+J2xrMQ9aBwK A==;
X-CSE-ConnectionGUID: kx8G0H4sSyO9IhyWoJ8B9g==
X-CSE-MsgGUID: jQCb7jEtRPi/7qAzCcgrTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="80318243"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="80318243"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 04:41:04 -0700
X-CSE-ConnectionGUID: uQshWjrgTHu+XKB0OZrpFQ==
X-CSE-MsgGUID: elDoUR+YQBGceDjxUupIgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="166786085"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa010.jf.intel.com with ESMTP; 18 Aug 2025 04:41:03 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/kms_cursor_legacy: don't inhibit pipe CRC
 calculation
Date: Mon, 18 Aug 2025 13:42:07 +0200
Message-ID: <20250818114207.2251823-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250818114207.2251823-1-michal.grzelak@intel.com>
References: <20250818114207.2251823-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Running either flip-vs-cursor-busy-crc-(legacy|atomic) subtest from
kms_cursor_legacy results in entering PSR1 after the test. Even with
PSR2 enabled panel, it is impossible to switch to PSR2 via
i915_edp_psr_debug. Kernel does so because it prevents inhibiting pipe
CRC calculation which is allowed in PSR1 but prohibited in PSR2.
Therefore subtests from kms_psr testing PSR2 feature (e.g. psr2-no-drrs,
psr2-primary-blt etc.) are failing after running any of those
kms_cursor_legacy subtests.

Restore enabling Panel Replay Selective Update by stopping pipe CRC
calculation after running the subtest and before the clean-up.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5298
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_cursor_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 9f6e644e1..ed1c77d55 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1748,13 +1748,14 @@ static void flip_vs_cursor_busy_crc(igt_display_t *display, bool atomic)
 		igt_assert_crc_equal(&crcs[i], &test_crc);
 	}
 
+	igt_pipe_crc_stop(pipe_crc);
+
 	/* Clean-up */
 	igt_plane_set_fb(plane_primary, NULL);
 	igt_plane_set_fb(cursor, NULL);
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, display->is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
-	igt_pipe_crc_stop(pipe_crc);
 	igt_remove_fb(display->drm_fd, &fb_info[1]);
 	igt_remove_fb(display->drm_fd, &fb_info[0]);
 	igt_remove_fb(display->drm_fd, &cursor_fb);
-- 
2.45.2

