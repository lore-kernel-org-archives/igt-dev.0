Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0E0CD98DE
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 06:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED39D10ECA5;
	Thu, 18 Jun 2026 06:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+wm9teS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325F610ECA5
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781763774; x=1813299774;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5LZlsjujJaV8A/8kc7H1wPTidAzsE0mFIvDGYprWz7A=;
 b=P+wm9teSyThup0C2blpZfL/Ytmhhy0TVD/239XJN9T7VWCkHU3YNOQU4
 C5r07MPZbqsfDbTvMwdPnJMf8WpKx7oJEuhQrD8cGOAlL7O6LrWRtBAmV
 MEvhHp/5l/3BdQYZPMS8+u0xbN9SJdOYOyf5yApCjrWB/eV+aQxpoU3B1
 hpABy5xlvExdG8bczGBLTlrFXHT/26HtCEdLgzlO88UjL/q8xuiJ/kf1V
 zZtQNXVJb8J+XEmYA3Qo8lep3ZVTmWpYXY9BTLiJmPXUA3La5ud3n8PjE
 QgnPYShbxjfN78RQZT9sqxA5ekkXU01zSiBXtBpPBlc+R+nji0WhxF46x A==;
X-CSE-ConnectionGUID: WrdKUW+YT5KhJ/xX7s2fxg==
X-CSE-MsgGUID: xAR+62A5QoqF3D90eQqaZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="86430442"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="86430442"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 23:22:54 -0700
X-CSE-ConnectionGUID: OfLlgdhnTdWHE9IBigjSjg==
X-CSE-MsgGUID: d1nOHBB6TaGRpWBLspRLuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; d="scan'208";a="241903066"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2026 23:22:53 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t v6 2/3] tests/kms_hdr: Simplify flag check and continue
 with next format on failure
Date: Thu, 18 Jun 2026 12:03:46 +0530
Message-Id: <20260618063347.2940031-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260618063347.2940031-1-pranay.samala@intel.com>
References: <20260618063347.2940031-1-pranay.samala@intel.com>
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

Simplify the HDR flag check to improve code readability. Also change
the cleanup failure path from break to continue to allow remaining format
combinations to be tested, ensuring formats that might succeed are still
validated.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_hdr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 7127a56b3..c334c907a 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -553,7 +553,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 		}
 
-		if ((flags & ~TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
+		if (!(flags & TEST_INVALID_HDR) && !igt_is_panel_hdr(data->fd, output)) {
 			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
 				 igt_output_name(output));
 			continue;
@@ -610,7 +610,7 @@ static void test_hdr(data_t *data, uint32_t flags)
 					igt_plane_set_fb(data->primary, NULL);
 					igt_remove_fb(data->fd, &data->afb);
 					test_fini(data);
-					break;
+					continue;
 				}
 
 				/* Reset IGT display state; hardware was not changed. */
-- 
2.34.1

