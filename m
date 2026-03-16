Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F40A9F46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A461210E263;
	Mon, 16 Mar 2026 10:25:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="baekUrUP";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C84E10E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 815E81A2E6F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:23:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5901E5FC4A;
 Mon, 16 Mar 2026 10:23:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2AFBB10369F21; Mon, 16 Mar 2026 11:23:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656633; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=69U3dHUmDqONc/BRG1qJkZIM++WtstJiaSAkTpaTuho=;
 b=baekUrUPpDpUvs8WhCxQt35rnJHQiiEbinMck3eWm20dswcw4rw/U4VfYO4ie1vYhPZiB0
 E0Ag5Oh69qyneoApFzpW2rrJIP3Zf2wCoLTuyTeiH1XYs8HjsZqlkGOdIYVarkRd8Lgh8i
 J7G3L8lceWpzRNdNxW8g9QCRWyY6PxzUejNqbBRpco1/BRwJMPLhrmkq7JmAtsvkYs0xH3
 SFwUrOWSN0FX3XXAty04k5YdLPluxSrAGQEu7yNQvRJgc+lZMy503LZOqWwioqlM+AZkdQ
 STi/AD9hDWEooGjKy2q5pw5eDsTDVQc0N8/MQe1ywq59n/H7NCFjZ5gilIzX/Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:17 +0100
Subject: [PATCH i-g-t v8 09/49] lib/igt_kms: Expose
 reset_connectors_at_exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-9-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=fKhevELmAZtNJbexAGw/zrFaX5h1FRkO+XG9cxzGq2M=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pP318LWejR28+SUXU9aYJEJK4uDwr88F/xQ
 VMJ22n8T8aJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOL+rQ/9Fi77maNSLB+58FS+Uz8Y4OmPbDWZjUq
 Wuvtg55B2qQxNPSFAsye/Btmzp+v15ag0xVGycbkwiReWWCI07Z/zbriRq6QFGgfKuDDxtYegwx
 WuRRyhq/ENsXpSanORHrPFDdAfEXy+lkLRjT4coc6wj9PEc1WLevLXnExtjLIkeabtwdqh0g+L1
 PlSh+4Hyhp1/dymB/QVJLZzw00PPs33syEgczVoiskMjzx2XCcmjKndmo5MKn+hAn1jVJzLrSAe
 vbiV8tYl03xfc91chfy15jdkKtiXW43LSX1Cr5eIr/MZ7/iTvB1F+rX1sEwFA5qVk+DhponybQP
 TArCsMovqjxw3qlIMNjuFvDUXVVt5CiMT6lzWGnciY/1DlQ4FXhZbeiw0PHiCyG8B50Pt/IJszH
 gnI/cfzlIcFq14edA0X1Euu8t8K4WdX4gkY+qMro18j3CpfI4S378vBn7QllSL0/rnJ/GuIguTR
 TrGSEdZAm4xFB/IwEv/n/1DN5JX6psAApywVYzIzHqsh6fiylcUzaky8l4nBjQWLBq7T5LWRctl
 AIOkij6pJgbkOku45tj7HYjqzfm9sGwgS0QdNZr3o1K8swOlouMHaXbPfK9PHqBc+Byz/DYnxIT
 PPU82KK/x5QwLm4c59PiVqALzdz19v3CndGQuKIPOseryKiwR8Sw=
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
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
---
 lib/igt_kms.c | 7 ++++++-
 lib/igt_kms.h | 1 +
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a0d12800404b..451b273999f0 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1577,7 +1577,12 @@ void kmstest_set_vt_text_mode(void)
 	igt_assert(set_vt_mode(KD_TEXT) >= 0);
 }
 
-static void reset_connectors_at_exit(int sig)
+/**
+ * reset_connectors_at_exit:
+ *
+ * Exit handler used to remove any forced state from the connectors.
+ */
+void reset_connectors_at_exit(int sig)
 {
 	igt_reset_connectors();
 }
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d071ca1800f8..5a9efc8cee48 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -152,6 +152,7 @@ int kmstest_get_crtc_index_from_id(int fd, int crtc_id);
 void kmstest_set_vt_graphics_mode(void);
 void kmstest_restore_vt_mode(void);
 void kmstest_set_vt_text_mode(void);
+void reset_connectors_at_exit(int sig);
 
 enum igt_atomic_crtc_properties {
        IGT_CRTC_CTM = 0,

-- 
2.52.0

