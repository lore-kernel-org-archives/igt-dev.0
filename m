Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84F0C369AB
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 20:06:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 884E410E37F;
	Tue, 15 Apr 2025 20:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gNq4OLZ7";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7B710E37F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 20:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=giPncOFQ1gF2gcatm+W/sLn/9+2aOjrEZ4b0mGlPVvA=; b=gNq4OLZ7p3txb4iYZl3D7j4j5y
 DBkh/ILexKWtOQXUZQ/NZSbOcqEHV/44LE7FV97vrqGtd2lDkSPe8U5UBT4YxouwVa4ISmFdZlBvB
 U0NfXazqMdVPI64ICTgPkovWEDqUcaqo4hgN3Dyc17hcm21jJxM7WG4ccpQLS9XM8SZbbr8757ShZ
 iig2LK3rDV/dZkd0UlCLUCkoDdpLK6v3HBY2ZLSJoXILG9FQfJ+k2yz088NsmXV1I4PDRMq8vUk7v
 EB1T9zc8CeZKicvyDAp1VOsga6hk6bkzKf2oIiQAtZot1V4IUf11fpatbAUNOyTdzyqlQ0Bk4a6Iw
 qfSenfUw==;
Received: from [189.6.35.67] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u4mY2-00H5M2-86; Tue, 15 Apr 2025 22:06:22 +0200
From: Melissa Wen <mwen@igalia.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>, 
 Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Andre Almeida <andrealmeid@igalia.com>, Alex Hung <alex.hung@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Simon Ser <contact@emersion.fr>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ville Syrjala <ville.syrjala@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com
Subject: [PATCH i-g-t] tests/kms_async_flip: skip subtest if invalid
 driver-specific condition
Date: Tue, 15 Apr 2025 16:47:54 -0300
Message-ID: <20250415200529.31722-1-mwen@igalia.com>
X-Mailer: git-send-email 2.47.2
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
driver can't commit to async page flip request for hw limitations, the
commit is rejected with -EINVAL since there is one or more conditions
that make the request invalid. These limitations varies between vendors
and hw versions. Skip a subtest if any invalid driver-specific condition
happens. This behavior is in line with userspace expectations and fits
better the plurality of drivers in the DRM subsystem.

Signed-off-by: Melissa Wen <mwen@igalia.com>

---

Hi,

Recent changes to async page flip conditions and limitations in the DRM
subsystem shed light on unexpected restrictions of async page flip
tests. The current approach doesn't make the test generic enough to
correctly deal with the diversity of reasons for a async page flip being
rejected by drivers of any HW vendor.

As an example, AMD display driver can't perform async flip when the
memory type changes [1][2][3]. After further investigation performed by
my colleague Thadeu Cascardo, he elucidated that this situation can
happen whenever there is not enough space for FBs in VRAM, so they are
allocated in GTT. Moreover, the space available in VRAM varies between
hw families and other system needs. Therefore, the driver rejects the
async flip due to memory type change, instead of silently downgrade the
page flip from async to sync - which seems correct.

The userspace expects the rejection (-EINVAL), but not the downgrade.
So, I understand the test_async_flip should just validate if async page
flips aren't downgrade in acceptable conditions and skip for any invalid
driver-specific condition.

[1] https://lore.kernel.org/amd-gfx/20230621202459.979661-2-andrealmeid@igalia.com/
[2] https://lore.kernel.org/amd-gfx/20230804182054.142988-1-hamza.mahfooz@amd.com/
[3] https://lore.kernel.org/amd-gfx/20250107152855.2953302-17-chiahsuan.chung@amd.com/

Let me know your thoughts!

Melissa

---
 tests/kms_async_flips.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 031417ed8..0de299c2b 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -397,8 +397,10 @@ static void test_async_flip(data_t *data)
 
 		ret = perform_flip(data, frame, flags);
 
-		if (frame == 1 && data->allow_fail)
-			igt_skip_on(ret == -EINVAL);
+		if (data->allow_fail)
+			igt_skip_on_f(ret == -EINVAL,
+				      "Skipping, async flip not supported at frame %d " \
+				      "due to invalid driver-specific conditions.\n", frame);
 		else
 			igt_assert_eq(ret, 0);
 
@@ -768,7 +770,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			continue;
 
 		test_init(data);
-		data->allow_fail = false;
+		data->allow_fail = true;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
 			/*
-- 
2.47.2

