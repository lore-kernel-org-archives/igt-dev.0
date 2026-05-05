Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9BEFF8855
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 19:45:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F097E10E48B;
	Tue,  5 May 2026 19:45:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="EwJtjOo+";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2720B10E48B
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 19:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1778010260;
 bh=vIk+jWkGmPT54XHynX/yKDRzCWVja/LktP34kotmjvs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=EwJtjOo+rwXelWUF2wNnAfAx2CL1vQ4kkAkpGfh4xW6mar5vxufIA96LUJAGc0fNk
 LK6JwbnxE+RIJMrM+y8Tf3EwIlgzSz8rTH/y9REc/PFgvlqKeVZENJ9j+4ceDDQgDK
 pOpiFfZsKACH7Y1CcvVO+10DO48L3SGLYKpT8Auzgvrth91T2QnF6PJcFQLQigz7y+
 wx6YqJKoMMlxevcpPMZMNJu8lj4kAVkrT83oKWj3/cnGO4Damy2F8th70nealeweIx
 lphBnrmLMlOMxAnZWa1xL1FMrKNMkZ3C3NgpigAoNHmZODie0bJUc3YSWFlwcaYLMX
 nZx4YNEsFrnFA==
From: Maarten Lankhorst <dev@lankhorst.se>
To: igt-dev@lists.freedesktop.org
Cc: Maarten Lankhorst <dev@lankhorst.se>
Subject: [PATCH i-g-t 2/4] includes: Remove DRM_XE_VM_BIND_FLAG_DECOMPRESS
Date: Tue,  5 May 2026 21:44:21 +0200
Message-ID: <20260505194419.500600-6-dev@lankhorst.se>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505194419.500600-5-dev@lankhorst.se>
References: <20260505194419.500600-5-dev@lankhorst.se>
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

This is already defined in xe_drm.h too.

Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
---
 include/drm-uapi-experimental/intel_drm_local.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/include/drm-uapi-experimental/intel_drm_local.h b/include/drm-uapi-experimental/intel_drm_local.h
index 10cc011f7f..b48c9e2195 100644
--- a/include/drm-uapi-experimental/intel_drm_local.h
+++ b/include/drm-uapi-experimental/intel_drm_local.h
@@ -20,8 +20,6 @@ extern "C" {
  * clean these up when kernel uapi headers are sync'd.
  */
 
-#define DRM_XE_VM_BIND_FLAG_DECOMPRESS	(1 << 7)
-
 #if defined(__cplusplus)
 }
 #endif
-- 
2.53.0

