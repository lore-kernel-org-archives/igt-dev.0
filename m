Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72552C36018
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 02:29:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CF210E0F6;
	Wed,  2 Apr 2025 02:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MFM22lEI";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8349910E0F6
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 02:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ldGjuXeZJGsP4EMWdV57oNkLtVnQ/V2MkqBWPQXmlJo=; b=MFM22lEIhoV4tiKF18cjSs4Jjr
 zki/u5bJ2cpAuhefN47jCv95eypStRIIec2h1U5G6g9Mh6f+KYasYa3vOg9kUDq/MvSnRpuSm1Dgk
 dgUJbSWt8NkVu0aPtQteIl1erjyYlETEW24cbV5Ga1G0DFr/c/md2MjdcfLYnhBR3oM232hK/tJZ5
 9R439KvdEGx7fBZkzoyoCXyx5Itk1jPIpgjA95TRfDKsXEWO76pL5aphh2uONpXx7IwGuvBWLM4km
 nYF5ssJeOKh/Cyah1TiX1T2sVXb6SajHeMBmp3AIf6pDNUEPG1pPZjxsycUT5BrTZEZuml5JJCAj0
 BKt01GdA==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tznr8-00AAa9-Bu; Wed, 02 Apr 2025 04:29:30 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Subject: [PATCH v5 1/4] lib/ioctl_wrappers: let the caller handle capability
 check result
Date: Tue,  1 Apr 2025 23:29:19 -0300
Message-ID: <20250402022922.210495-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402022922.210495-1-andrealmeid@igalia.com>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
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

From: Melissa Wen <mwen@igalia.com>

Rework igt_has_drm_cap to just check if a DRM capability is supported
and let the called decide what to do from this check. It prevents the
test fails because of an assert done when it's called in
igt_subtest_with_dynamics.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 lib/ioctl_wrappers.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 146973f0d..15eeb9aa4 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1292,10 +1292,10 @@ int __kms_addfb(int fd, uint32_t handle,
  */
 bool igt_has_drm_cap(int fd, uint64_t capability)
 {
-	struct drm_get_cap cap = { .capability = capability };
-
-	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
-	return cap.value;
+	uint64_t value;
+	if (drmGetCap(fd, capability, &value))
+		return false;
+	return value ? true : false;
 }
 
 /**
-- 
2.49.0

