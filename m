Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9C51CD4853
	for <igt-dev@archiver.kernel.org>; Wed,  4 Sep 2024 15:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9907410E1B9;
	Wed,  4 Sep 2024 15:59:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fQ0N3RFB";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C56E10E1B9
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2024 15:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ZsFc5On2qgScSElkPYglCqG2fG9/McbWZgYHQ7GDCM=; b=fQ0N3RFB1xT9T1GDmW4V757k6D
 Tz+aK623gsqMXUaGiyVez2BUgqNPgnBAt6ZTWtAdWlCpRsCsNSBj0ENKMRz1eniIB6bXiRvVFhN4y
 ChKyCyfEI7Fsle4kN+ih5F7u4GygVZmytilbmMVe3Nx/lslpJZ+j0EBy/Q8DZt8stdYqUvVCdtYq+
 gOX4+KJ+wxKy4yIkVHRgYJ/qaJPPrTJ0YUUYj9mUrgsuBwad6MRDMuIVFoAKfai2wSiIvikEoN+OJ
 Xb3PMbV8sYq70fPACPxzoqghBL+whOjzht6xOSOZu51gIBnYZatXkDjf3mNAG/9ym9MsE1med2CR5
 X6D0a2bw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1slsPo-009a3q-IU; Wed, 04 Sep 2024 17:59:28 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t] lib/igt_drm_fdinfo: Handle (somewhat) amdgpu memory
 stats
Date: Wed,  4 Sep 2024 16:59:19 +0100
Message-ID: <20240904155919.74744-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.46.0
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
specifically, outputs drm-memory-<region> instead of drm-resident-<region>.

With this added gputop starts showing resident memory usage for amdgpu.

v2:
 * Semantics of amdgpu drm-memory- are like resident, not total.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> # v1
---
 lib/igt_drm_fdinfo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 539d15056117..74a90c437880 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -281,6 +281,11 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
 			UPDATE_REGION(idx, resident, val);
+		} else if (strstartswith(l, "drm-memory-", &keylen)) {
+			/* amdgpu legacy key */
+			idx = parse_region(l + keylen, info,
+					   region_map, region_entries, &val);
+			UPDATE_REGION(idx, resident, val);
 		} else if (strstartswith(l, "drm-purgeable-", &keylen)) {
 			idx = parse_region(l + keylen, info,
 					   region_map, region_entries, &val);
-- 
2.44.0

