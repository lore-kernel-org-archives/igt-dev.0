Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3409CCD3436
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 12:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5A2110E2FA;
	Fri,  8 May 2026 12:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pWiNxL5A";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D22810E31A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 12:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kzSwJ24pGRkuraQJJbh/qLqIn9Eg5Jsdod3BpUYY+a0=; b=pWiNxL5A5Aci471x3rt2051p6n
 ++VPEcxyF1h+/JMMTZ2G/PEkPSI7JFg0yqMB3YjjMgzPWK7/iLGFFFGUzlPax/cK+ucfs7FZFbzmW
 idnn7098aRllwHFzQXtNThKIaH7VQNtqBIDWlEdZiHqvwJkSKZweZt+KLrTVDoxe5TJkt8+N33lAG
 N+INVWBNhnmBtsSSw2p6IHRBpdu9Lj/TJ4G943CULoJ+mwdtONvb0xOtEhdFIq4aEAs/rBVDDq69O
 yffv86TRyujcOSa0qmxr4ne/Qj9iW9DQ5zbwsHxs6ElEEdjvYgxegkfvLMP/7RCSrRcuezd5uzPlm
 YhwrsHlw==;
Received: from [189.7.87.137] (helo=prince)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wLKaK-007sqk-PE; Fri, 08 May 2026 14:45:41 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t 1/5] tests/v3d_perfmon: Don't use the deprecated
 V3D_PERFCNT_NUM
Date: Fri,  8 May 2026 09:42:50 -0300
Message-ID: <20260508124446.1260672-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508124446.1260672-2-mcanal@igalia.com>
References: <20260508124446.1260672-2-mcanal@igalia.com>
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

