Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8B5C54FB3
	for <igt-dev@archiver.kernel.org>; Sun,  1 Jun 2025 19:16:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A8110E0F6;
	Sun,  1 Jun 2025 19:16:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pcetn9Gy";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04FF10E0DA
 for <igt-dev@lists.freedesktop.org>; Sun,  1 Jun 2025 19:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5l+c/qRlamE+IEvP4EF6BUz4jvQyxxJWzen3mpr4dqI=; b=pcetn9Gypzari/9Gwnm67Q/Inp
 VANFmtBdhT+q9mia+jZOg1PjXqEGp6xb9ObtdjN+fiPB2qEiMUUkE394EC5onSVFBVUedaFEwv1Ak
 UrgNhOpuhoTfHuTGIhTDCQSv+P8xIj96fgb8nB+KBTUbqjtw0e7a8wsfulJQ9/rLikorBLzPJ8WvX
 PXrhA5xQ74eL+XU7X9RnNIucL8fednW1NmWiRfXwa3MVRE9d78ciadgU9ykVCuaIfDivHEODlM2W3
 LAJENEgGB2PsuWyAWUkmv6eWWrncxbMeKjTI4mU5kCib2fTi6yc8mRg+JNb3XIJ7udUQERgHGr5y5
 Q5JNnNZA==;
Received: from [191.195.103.116] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uLoAX-00FzVn-LF; Sun, 01 Jun 2025 21:16:30 +0200
From: Melissa Wen <mwen@igalia.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Harry Wentland <harry.wentland@amd.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t 3/3] tests/kms_async_flip: skip subtest on AMD if
 invalid condition
Date: Sun,  1 Jun 2025 16:14:46 -0300
Message-ID: <20250601191459.46759-4-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250601191459.46759-1-mwen@igalia.com>
References: <20250601191459.46759-1-mwen@igalia.com>
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

Async page flips can fail for any driver-specific reasons, i.e. when the
driver can't commit to async page flip request due to hw limitations,
the commit is rejected with -EINVAL since there is one or more
conditions that make the request invalid. These limitations vary between
vendors and hw versions. In case of AMD devices, async page flip cannot
be perfomed if fb memory type changes (VRAM vs GTT), but framebuffer
allocation type cannot be controlled by any userspace configuration.

Allow EINVAL failures on AMD device and skip the test. Async flips can
be still validated by the performance comparison assert if no EINVAL.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_async_flips.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 97128cfad..065ac9c49 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -410,7 +410,12 @@ static void test_async_flip(data_t *data)
 
 		ret = perform_flip(data, frame, flags);
 
-		if (frame == 1 && data->allow_fail)
+		/* AMD cannot perform async page flip if fb mem type changes,
+		 * and this condition cannot be controlled by any userspace
+		 * configuration. Therefore allow EINVAL failure and skip the
+		 * test for AMD devices.
+		 */
+		if ((frame == 1 && data->allow_fail) || is_amdgpu_device(data->drm_fd))
 			igt_skip_on(ret == -EINVAL);
 		else
 			igt_assert_eq(ret, 0);
-- 
2.47.2

