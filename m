Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86967CD4F39
	for <igt-dev@archiver.kernel.org>; Tue, 12 May 2026 12:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38C0910E058;
	Tue, 12 May 2026 12:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D1CjKIVm";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D6D10EA7F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 May 2026 12:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=letROS+Jfg7bxpbdHsIl4i7k5JygmxqmG5lC9gR98n0=; b=D1CjKIVmIoZinEoLHJ6jnw4oUS
 EEHg/7FTlO10x9Zq+BMoOxDZ6zsTisWuqgBmU0ofjUR3bMNZjv+FFzSgk+7FBU7VaFmz1JT/dQpwI
 zkVISCs3HVskU6A1B/P6UhIbqpVKxeKnVucSb4oAu9hcouZLsGF8ob5zJDOI7mLTVSaTk8wmGVnsl
 STeLBWwiwGTOBVesH9j37SpSF3lI2QfIDtUREGvaAJaCs9RF1Vctw53bGsjJQEV7bchXWUXyNSkhr
 OjHBZzPXBC0ccvJ5ID1r8Jzaw+/3EtfJEPXyqRs1Z2zpAgEUHp9oUSI+p9sIpw//4TZIaARhBZleS
 I1+7XYKg==;
Received: from [189.7.87.67] (helo=prince) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1wMmKE-009Sqa-MC; Tue, 12 May 2026 14:35:02 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Iago Toral <itoral@igalia.com>, Melissa Wen <mwen@igalia.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH i-g-t v2 4/5] lib/v3d: Add helper to query the V3D hardware
 version
Date: Tue, 12 May 2026 09:29:49 -0300
Message-ID: <20260512123408.1115589-6-mcanal@igalia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260512123408.1115589-2-mcanal@igalia.com>
References: <20260512123408.1115589-2-mcanal@igalia.com>
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

Add a helper to help tests to branch on the hardware version. Some HW
configurations can change from v42 to v71, such as performance counter
IDs, and this helper will assist tests to retrieve the HW version.

Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 lib/igt_v3d.c | 12 ++++++++++++
 lib/igt_v3d.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/lib/igt_v3d.c b/lib/igt_v3d.c
index eb1adaaa4..2353c97a8 100644
--- a/lib/igt_v3d.c
+++ b/lib/igt_v3d.c
@@ -114,6 +114,18 @@ igt_v3d_get_param(int fd, enum drm_v3d_param param)
 	return get.value;
 }
 
+uint32_t
+igt_v3d_get_version(int fd)
+{
+	uint32_t ident0 = igt_v3d_get_param(fd, DRM_V3D_PARAM_V3D_CORE0_IDENT0);
+	uint32_t ident1 = igt_v3d_get_param(fd, DRM_V3D_PARAM_V3D_CORE0_IDENT1);
+
+	uint32_t major = (ident0 >> 24) & 0xff;
+	uint32_t minor = (ident1 >> 0) & 0xf;
+
+	return major * 10 + minor;
+}
+
 void *
 igt_v3d_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot)
 {
diff --git a/lib/igt_v3d.h b/lib/igt_v3d.h
index 70dd6f011..e3a9f381b 100644
--- a/lib/igt_v3d.h
+++ b/lib/igt_v3d.h
@@ -72,6 +72,7 @@ void igt_v3d_free_bo(int fd, struct v3d_bo *bo);
 /* IOCTL wrappers */
 uint32_t igt_v3d_get_bo_offset(int fd, uint32_t handle);
 uint32_t igt_v3d_get_param(int fd, enum drm_v3d_param param);
+uint32_t igt_v3d_get_version(int fd);
 void *igt_v3d_mmap_bo(int fd, uint32_t handle, uint32_t size, unsigned prot);
 
 void igt_v3d_bo_mmap(int fd, struct v3d_bo *bo);
-- 
2.54.0

