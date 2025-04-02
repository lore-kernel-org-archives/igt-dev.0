Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D90C3601B
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 02:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC59810E6A2;
	Wed,  2 Apr 2025 02:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Iopg5tOl";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554AA10E0F6
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 02:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RJqPll5YuS7jR8TopO4nRECBi0WBJ2GCrUPqYHUkL00=; b=Iopg5tOlcyTdWBvy1pmiD53k2d
 Go4dILnX2PAOz0ApBo4zZq2N0z6oiv1zsoslPBMdcewn9vHnaMpsraJRD9fwMJC463GlIuFCB9W39
 NJgHG1MfZENrhr5abTvrxKtTvHDZXW6aE5nZHJR3dpS0l1SLHIa1EcJuTqKvsM0CTUy7MdaOtsvSw
 6gpzAMKLBi9Fnm0d3k8GstpNPZbVE1wzK8yuw5z9vHELciTo9rZFT/ddjYPqYFwn4GuwQOIOz/Uwm
 H9XcwrHisVr6gnBzh3LTkdCdmkj0iyQf2KPQEk26cTlfnGA3PjvsQqt4l9oSOC+6+uFP/Lx9cacIC
 VGWCGIBg==;
Received: from [187.57.129.172] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tznrB-00AAa9-6t; Wed, 02 Apr 2025 04:29:33 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: igt-dev@lists.freedesktop.org, Jeevan B <jeevan.b@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: kernel-dev@igalia.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH v5 2/4] tests/kms_async_flips: Check for atomic async flip cap
Date: Tue,  1 Apr 2025 23:29:20 -0300
Message-ID: <20250402022922.210495-3-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402022922.210495-1-andrealmeid@igalia.com>
References: <20250402022922.210495-1-andrealmeid@igalia.com>
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
---
 tests/kms_async_flips.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index da426f753..d2a1f60f9 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -207,6 +207,12 @@ static void require_monotonic_timestamp(int fd)
 		      "Monotonic timestamps not supported\n");
 }
 
+static void require_atomic_async_cap(data_t *data)
+{
+	igt_require_f(igt_has_drm_cap(data->drm_fd, DRM_CAP_ATOMIC_ASYNC_PAGE_FLIP),
+		      "Atomic flip async flip not supported\n");
+}
+
 static void test_init(data_t *data)
 {
 	drmModeModeInfo *mode;
@@ -687,6 +693,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
 
+	if (data->atomic_path)
+		require_atomic_async_cap(data);
+
 	for_each_pipe_with_valid_output(display, data->pipe, data->output) {
 		igt_display_reset(display);
 
@@ -712,6 +721,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 
 static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 {
+	if (data->atomic_path)
+		require_atomic_async_cap(data);
+
 	for_each_pipe_with_valid_output(&data->display, data->pipe, data->output) {
 		test_init(data);
 
-- 
2.49.0

