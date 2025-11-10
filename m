Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510F7CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0218710E3BB;
	Mon, 10 Nov 2025 13:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2k0fmlwZ";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB0610E3C0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:40 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 43171C108F4;
 Mon, 10 Nov 2025 13:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B0D63606F5;
 Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8932310371904; Mon, 10 Nov 2025 14:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781979; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UNx+8sh/f9Sb0+g/yZ9a3LDe5ApAl8ICag2oTOxu4A4=;
 b=2k0fmlwZXyLz2S87gEnMr+vLfHK9d0aQDIeJnoHgg5Z0wRKEkF87J3cGME7fx4r8xRbUwE
 SquwFnaDMJKaS3BChgsAiC9+2OZMB0mEQXZGm2KqVKRTHjdp+wF/r4PCn5P5eOct3RdKm5
 WMZwTmYYBKAPCHt457Fbg1kduSxFN2SD9LhFKM1xhG7q3lVSstERhi9eNlraywytmnFyQ4
 jSlmNgkvSn0JXNLhDJUlRG2LOvkCtOK1vkL4iPEILIKvFRP09akuMPdScrE1n2FbaP1T0a
 HAvjqhioR+rFtQ/GLoalE/Ea6Q9XkOe3+k/fVyP/wHJAli1u6/G3YdRfr9Hrog==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:09 +0000
Subject: [PATCH i-g-t v4 07/46] lib/igt_kms: Expose dump_connector_attrs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-7-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1096;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=C+Kh4HeCDMU76aYvV31fSaLrTuEcdLJB8umc462pD60=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesMBJzAjWfS0pXazjS49rRuQR9vHS5agRr6P
 fgnyaObEdyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDAAKCRAgrS7GWxAs
 4hfbD/9Yve8dQZPpY2KYf9ou7fbTCRvt7rN+X/eYqhuTM1kyPZVnMKDoUXH9MZGcOo1gGmMSF5g
 CICaMEknV3Knr0XRYFlgk2JYy6eed/QaLn664Kgis3bCcwWoWvekDls+3EKPzAa8KggvG5aY7F4
 uOzTaOeF6V2SS1dwYnpDyKyfQCSMRzxuMVyT3xEUyc4tctJquZvCYQe4ajjFJfby0ZTpV9VXHW+
 9QD+9pPBczVgzgj2JiUplWP9tIw7GNFJENkykL+vBJ2G5ve2cP4QpkA3tdn2AviwafadjeEZf49
 m42lCPgTyBuUIiOxLF8nH4cKJBswDNMmwbAXtuW7Wc7pdzRaMCWux55zS1+db5LuB7scS06QEde
 gZ0DGdcAovod/9zgLMmsitIOtw/MZm4lxUqWdOLnO/O33aSRvsskeOaMBVMGQw8M7zjFSYS7K/D
 KLrafeIBtrCEa3wEd80x/f2N0LTVXsimyi8mgxkHaBEJXgpTtSFpJtWQa58wp6HFqtbGYtgrKIu
 fMfs/GwxktFcoUGq2rrKQb1V/1U30c6yscPpE3euH41yu5UE6N0k8IzxvCKcp9X0gJeVLLj7vuf
 rTpVUzR4Fq1ovx+LAvXYBm6xTfSom0H2EGmziol8JOZia/8HVPi9xyN7XoJpVOvuZlN6i7h4gNR
 6Fkr3TYT+072ODw==
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

dump_connector_attrs is used by i915 DP helpers, so expose it from igt_kms
to be able to reuse them.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_kms.c | 2 +-
 lib/igt_kms.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f8d4037a68bf..a5b840e5aed3 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1682,7 +1682,7 @@ static bool connector_attr_set_debugfs(int drm_fd,
 	return true;
 }
 
-static void dump_connector_attrs(void)
+void dump_connector_attrs(void)
 {
 	char name[80];
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 4184c3930cbd..3975909aeeef 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -288,6 +288,7 @@ enum joined_pipes {
 
 uint64_t igt_kms_frame_time_from_vrefresh(uint32_t vrefresh);
 
+void dump_connector_attrs(void);
 bool kmstest_force_connector(int fd, drmModeConnector *connector,
 			     enum kmstest_force_connector_state state);
 bool kmstest_force_connector_joiner(int drm_fd, drmModeConnector *connector, int joined_pipes);

-- 
2.51.0

