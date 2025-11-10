Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C7BCCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8D810E3B9;
	Mon, 10 Nov 2025 13:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="27XZ9nUI";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC7510E3C0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 31E4CC108F5
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A05D5606F5;
 Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8E04D1037188A; Mon, 10 Nov 2025 14:39:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EsiQM5ezgXXIysICismenRtx8jrftXlR6scuaxqALkY=;
 b=27XZ9nUIsHlyEErjzjFic5PmywmHT1e9L1kOV4Kk4EPRkaDw0Cb+0SCCOfy6ynBuXnpbkt
 5Aefa9hcJuvg4hVDpaJqFYRv3V/NQvYl1qBzX7/p67e1p56mj2YLx2WsVY5h3Qb7NSDIrx
 mozrM2lh+3fsts3mgjhSI2QcfDo4g8mybttVSjaV2zRMFTJTKA7C+6Ck/S2N/rOcxBnpie
 5r5n5CVCbBfn6uOpUq9gWWewfsbQ1u0ffGps0Y0JzE9EcNVPhcks6OaJ+LAnyE9e8MZCVx
 IwScLVErW5pDhlE8b40cYHQTkAKEe9W6qgXV1lEjlBRHw0pXCGRxDtq4ExaSfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:10 +0000
Subject: [PATCH i-g-t v4 08/46] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-8-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1074;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XKzU5PT7qV/KAOUCUtWp6SsDqWac5+l/lkcK1jq6nvY=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesNnscFxnhZWTflvGadeLwByqys7DBfAQOLY
 JbTBQDuHOGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDQAKCRAgrS7GWxAs
 4veHD/4pkj0aGsRNowEHmyvLz7bP01nAVu2mnwXtSsBOYWTYrZN4/fSC7sV8eH+dR8fO7NOzyMx
 MBdeHrhmKHFyxfcUcAwi6WozLVNMsWyyYhRtAQNCpuqJdku0I8GGPLAJr1844Rhc244Ktw/Y8/f
 PuigpKO0vLfE97UQSbBfi1dRVtc3him3ThlAqPNe+FwUxYDF5yM/CFD+NMUTi2w+YjbS8wsRQ7D
 PpUaVM5c5g3ra7UmHAkH7onxrRGsmk7KJoogdVKbXgWjEIKeWe7E+NtPFxB20q0AgsqpbBVrEhr
 lsoUBhXJSWvIAvbIXpmPWhWNXPpIQsgKSdjd3MQszYrvXhd9uTom12eKFzEF982Oo4WxR3YnxT3
 ItkCp5RueyAV/bueccPbwDLNJCaQjLS3ehozoU1qbCbBRcVmlxrNujdj38T6wCARYxiDyuBT9nr
 FDTN2/BO//7+ogTie3/huUg/ncSIDX3O9i9aus0wal013a+4IEohxwVgaEkar+973iPIfEgU6JO
 iyyVNrq9nHWw0fhjge9qkkjWTTKC5x9lkOeZRO7sID0fUC4QjdJQlizEFZmVh4q1ZpEWWV7gqrd
 14Ljuof78pEzHGChLrMcR4fHKRn88XMruBqI1vaVO60C5QHKBi2BK0YSZJ+Ar90yyEYQZpttDG2
 F10HFV4bDC3hJsg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

reset_connectors_at_exit is used by i915 DP helpers, expose it so it can
be reused in a different file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a5b840e5aed3..473d35b373e5 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1493,7 +1493,7 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3975909aeeef..7caceec7c076 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -162,6 +162,7 @@ int kmstest_get_pipe_from_crtc_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.51.0

