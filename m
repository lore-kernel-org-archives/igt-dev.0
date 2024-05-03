Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEBBDC4345F
	for <igt-dev@archiver.kernel.org>; Fri,  3 May 2024 12:37:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DE410E400;
	Fri,  3 May 2024 12:37:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="SBLMbV4x";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91F8510E400
 for <igt-dev@lists.freedesktop.org>; Fri,  3 May 2024 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IML3lgMdtwFQ2cy1IOALjbpUmAHfFzSkx2EUb7zjhA4=; b=SBLMbV4xdDbqKf9DRWoiy/wH+l
 T8Uyf7kBQAvYLg069qH1CzxJOb+44aQtMcImv/yh9MXPjzx6OmcNqtWBMuhbUAHX1nL/tFwc7cec5
 HBhVQkrWTQJm94BE0FqISKx8H9hdED/liiZB4urlQtkCDy3mj34s1AGpF+tsgQsRPvLAGbYsy226o
 MLEGyu1CRs1AyJKC8KcD1COKcrQlKdIz05/P/975g5kkQn55P7rPvIE3luOh1MvLPrGIe8KfEPjDy
 nT7lUMnF4lWY2mEjtaBGChtwS1olf9zhH8hIRtGi14El7ExZlIcjQa5C+pyYsoZzR10eWQ7EQsOra
 0rjYMbig==;
Received: from [84.65.0.132] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1s2sAW-0007S9-E4; Fri, 03 May 2024 14:37:40 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.keonig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle amdgpu memory stats
Date: Fri,  3 May 2024 13:37:31 +0100
Message-ID: <20240503123731.9509-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Code so far only handles the clients using the common DRM helper.

Handle the amdgpu driver which uses a slightly different set of keys. More
specifically, outputs drm-memory-<region> instead of drm-total-<region>.

With this added gputop starts showing total memory usage for amdgpu.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.keonig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_drm_fdinfo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index cab677df29a9..89992f1477ec 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -262,6 +262,10 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			idx = parse_region(l, info, strlen("drm-total-"),
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, total, val);
+		} else if (!strncmp(l, "drm-memory-", 11)) {
+			idx = parse_region(l, info, strlen("drm-memory-"),
+					   region_map, region_entries, &val);
+			UPDATE_REGION(idx, total, val);
 		} else if (!strncmp(l, "drm-shared-", 11)) {
 			idx = parse_region(l, info, strlen("drm-shared-"),
 					   region_map, region_entries, &val);
-- 
2.44.0

