Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8A3C83F34
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 12:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7A310E684;
	Tue, 22 Jul 2025 12:47:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Oe47Uepr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B07710E677
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 12:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753188426; x=1784724426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LcA6Wz6+avyFTgfUKkfJTUcuaV7pVneNGU5jXfacmMw=;
 b=Oe47UeprbKoaQbrUo5u/8YNPVnblJ8Uwf0/b7SCYGSVZ969i3MV6LVT7
 X3CoXdYb71hjYiw2zyFLPVielFdet5x0CmpV7cIAW8aPqHWxy7j/17p/Y
 FLfcdTjiJbquiw1kcD9g8Snn9NC9mfPBxWPh5z7U35Q9Tk7FTcOkacPKQ
 GDIYRy6g/G/Hk6deid5NG2uNf/jAYlmavc/bqHgBbH7OJgcesaWRW0PVp
 wjmwIBUK991IgOPvv7L+GODRgoQSaol83MN9NnHAmmCkMfVX3bqBGKaBG
 oBAZRMvov2GuoFyQLBgvpF6+pFBj9qp5iEel+8D2LVYP91zF7aX7uFIqV Q==;
X-CSE-ConnectionGUID: FdobrMvOT3C1fgGXM4eXTw==
X-CSE-MsgGUID: Vp+sXXYTRe28JYCI+O/COQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="73006864"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="73006864"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 05:47:06 -0700
X-CSE-ConnectionGUID: AuP4iLG/TgG1/dFkhqhTiQ==
X-CSE-MsgGUID: Ok0lrzgxR+2J+2hWvRG1WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="163173188"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jul 2025 05:47:05 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 1/1] tests/kms_cursor_legacy: don't inhibit pipe CRC
 calculation
Date: Tue, 22 Jul 2025 14:48:23 +0200
Message-ID: <20250722124823.912472-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250722124823.912472-1-michal.grzelak@intel.com>
References: <20250722124823.912472-1-michal.grzelak@intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
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

