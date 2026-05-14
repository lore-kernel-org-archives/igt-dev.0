Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DD2CD37AC
	for <igt-dev@archiver.kernel.org>; Thu, 14 May 2026 20:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E3810F326;
	Thu, 14 May 2026 20:17:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="suLG3HtM";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588C010E3EB
 for <igt-dev@lists.freedesktop.org>; Thu, 14 May 2026 20:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L6m1C974Vi9/1bdZIC4/cnkX3RXybypjC5/2kBgqaNU=; b=suLG3HtMP3f8yQdRJOyTsKCIf9
 F7IpJs5W9ZfhwYQJfaIrJVidq88IrVnI0522tWYBSi8ufquuqK6kHDAfqjUp0HqOd5iGfs2tqXphu
 p3ufH45DSMniCt6dyjz82/phESn78EuxMJiUYztFswjGSvlRzM7/r8xeA5V9eV1ZwUgm+P1wL1R+K
 IY9Q1wc2QKjhM2nEbXp260DYp+hl8pBuD+KlXaHt4Eih2FTHXODxhlZInpmU5iSUe/A7Elr0Dz212
 qvuxj4QWfRFPmGrU6A7qS6kh6yKyrrGbNZIfJ4DMoP+KpETlko9+OKzJq/IAZn1prIgW5o9vgNJ97
 buIjBHXA==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wNcUD-000Dwf-7u; Thu, 14 May 2026 22:16:49 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t v3 1/5] tests/v3d_perfmon: Don't use the deprecated
 V3D_PERFCNT_NUM
Date: Thu, 14 May 2026 17:14:53 -0300
Message-ID: <20260514201637.1811428-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260514201637.1811428-1-mcanal@igalia.com>
References: <20260514201637.1811428-1-mcanal@igalia.com>
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

As described in the UAPI, one shouldn't use V3D_PERFCNT_NUM to retrieve
the maximum number of performance counters, as this value is only valid
for V3D 4.2. One should retrieve this parameter from the kernel using
DRM_V3D_PARAM_MAX_PERF_COUNTERS.

Due to this inconsistency, the test "create-perfmon-invalid-counters" is
currently failing in V3D 7.1 (Raspberry Pi 5).

Update the "create-perfmon-invalid-counters" test to the UAPI guideline
by replacing V3D_PERFCNT_NUM with the value retrieved from
DRM_IOCTL_V3D_GET_PARAM.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 tests/v3d/v3d_perfmon.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tests/v3d/v3d_perfmon.c b/tests/v3d/v3d_perfmon.c
index ac6f094c3..5045e8c81 100644
--- a/tests/v3d/v3d_perfmon.c
+++ b/tests/v3d/v3d_perfmon.c
@@ -37,8 +37,18 @@ int igt_main()
 	igt_subtest("create-perfmon-invalid-counters") {
 		struct drm_v3d_perfmon_create create = {
 			.ncounters = 1,
-			.counters = { V3D_PERFCNT_NUM },
 		};
+		uint32_t total_perfcnt_num;
+
+		total_perfcnt_num = igt_v3d_get_param(fd, DRM_V3D_PARAM_MAX_PERF_COUNTERS);
+		igt_assert(total_perfcnt_num || errno != EINVAL);
+
+		/* Fallback if kernel < v6.11 */
+		if (!total_perfcnt_num)
+			total_perfcnt_num = V3D_PERFCNT_NUM;
+
+		create.counters[0] = total_perfcnt_num;
+
 		do_ioctl_err(fd, DRM_IOCTL_V3D_PERFMON_CREATE, &create, EINVAL);
 	}
 
-- 
2.54.0

