Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00E35C36010
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 22:36:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0DDC10E78B;
	Tue,  8 Apr 2025 22:36:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="DZumkd5N";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9618F10E78B
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 22:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FE0/6hYMCaBgrbhnd6gJEFbQv9l/uAKaixvTtDQUHJU=; b=DZumkd5NqXoGSaPGwkK4yOtvL2
 /JpeACVxZaVXMpx+cPu9GSA62q3Jrk7wsL9hVPNNX/J+sPDMuaV3k7aWOEkn2RR2Dgff2Pmeptfby
 vFqeNOCG7K5oSkB8PhULdmO4Gdv/KZ5UlZLHwiqChEBfJ6+UbKsDkgd6BGKbAgkm1IRcBqMI/YeAI
 qND1HTtEUdic9oBNmAJDunmnS9IkD7N3y28IwfwxmzKQh6HyQ2k5L4KSvoa6UTM5l3RLL1Z/Qje7V
 aaUoC8PoRUTwk4myORUiBZVaRYeNKTJu8OHbblIEfdLKI6rI/OYvKSZBfrNvkq7svonI7S/IaXvlm
 gwxIf4SQ==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u2HYH-00DbcU-Hz; Wed, 09 Apr 2025 00:36:17 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v7 2/4] tests/kms_async_flips: Check for atomic async flip cap
Date: Tue,  8 Apr 2025 19:36:02 -0300
Message-ID: <20250408223604.289309-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408223604.289309-1-andrealmeid@igalia.com>
References: <20250408223604.289309-1-andrealmeid@igalia.com>
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

If a driver doesn't support doing an async flip through the atomic uAPI,
the atomic tests fails. Instead of failing, create a function that
checks for this capability and skip the test if is unsupported.

Signed-off-by: André Almeida <andrealmeid@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 tests/kms_async_flips.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 63598bd95..90ab7a076 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -209,6 +209,14 @@ static void require_monotonic_timestamp(int fd)
 	igt_require_f(ret == 1, "Monotonic timestamps not supported\n");
 }
 
+static void require_atomic_async_cap(data_t *data)
+{
+	int ret = igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP);
+
+	igt_require_f(ret >= 0, "Atomic async flip cap doesn't exist in this kernel\n");
+	igt_require_f(ret == 1, "Atomic async flip not supported by this driver\n");
+}
+
 static void test_init(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -689,6 +697,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
 
+	if (data->atomic_path)
+		require_atomic_async_cap(data);
+
 	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
 		igt_display_reset(display);
 
@@ -714,6 +725,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
+	if (data->atomic_path)
+		require_atomic_async_cap(data);
+
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-- 
2.49.0

