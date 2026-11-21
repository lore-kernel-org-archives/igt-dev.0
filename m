Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4293606A320
	for <igt-dev@archiver.kernel.org>; Sat, 21 Nov 2026 09:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XXh0dPmR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0388735;
	Sat, 21 Nov 2026 09:46:44 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 561D310E3E6
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 09:42:51 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-3282db206d3so4807065eec.0
 for <igt-dev@lists.freedesktop.org>; Sat, 21 Nov 2026 01:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795254170; x=1795858970; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=J9R7I3cdSJGxtaCIJHDOHze6Z1u/B4zBGLaqGohf9jQ=;
 b=XXh0dPmRlDEtMZmePcSr9Uj3obsjPVV0Vmk8WCjZjAHX51QEfcZ+l+ZabVsHn7pTNf
 0QVt/bro2Z11kskfjwbyCF+xPJoLmr74AsUGtsK9B30B3w0X9B/3ujLHDClWlJNq1fJ/
 SKOaYm8NBPFJu/L/1bIPvUIkZTtwdYghY/Qk0Us48dcyBDsvI9XjCoul1343q7N56LfZ
 8tze2P1GuE56dDMLoRErJ9UHeampOG0iJTQZAdPgywg7RdhqdUDHrXRtqqzAD1/aRq1z
 HOLY/aVoQjm5nUY5WVTUAk8hLJdyjU1ol6iTO5Oj4MEBWZsP2zdTU8JpyMPxksIgduMS
 1KLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795254170; x=1795858970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J9R7I3cdSJGxtaCIJHDOHze6Z1u/B4zBGLaqGohf9jQ=;
 b=z82fSeMt3fgEI75/i2GHggP7Uyslb8J2haR63Tb5jGJ1DnyPIyPw3gqSNdwKAY9Usk
 xFa9+vSN5Q0de+PRFuEPPLJc3i+13DAtShESQwdPpKPBUwn0BGnvXA9APOaA591tnujU
 13+sJBsmF7mxU3Z2pQZ+TlLLlVv8B+0XJfJFG9EAMEnj42ktqE/GWDMxiDDi+ZXQFBw4
 JPGjaYKO+v4rDFWjO+J5a0FaAqyZZjLia76bvbyxiVMkc5yaPb9Sj53EykcWcbnYgld0
 cgrlteZ7Qc35sc2NfRA/V9sknQUbx9n0vFw8ID+3Wc3gUV0Y0h2wGpvdNy1M3MiZQBfp
 aVug==
X-Gm-Message-State: APuU4Z8w10S4o+p7wTG+AeIokRisNTvhxx3XJuhvyAi2hZsDlqwDWGtQ
 hv/7q31xruydCbhkWPDxKUl/cDsbNpsq+HN27ZvbTtF/g7MY9WnthkiU3Qvxzw==
X-Gm-Gg: AZFdTZdHO0pt7ILZSE9RkYWmR2O414k2aQwUZPqLqJ5uFNL1zKm3DwtzkhsxKPZ269a
 3wUcLK1d/GT2kGfpquracdomG7vPZKIkL6FLlFgq/9+teNizXx3GPTwc8iEWWLMvE2vGkMbnhM/
 SJzNcWzREHZT9DXJRObi5W2rYTbONyt72iECk71WDU/eBoAFmfCHrkLVlRcCLUuWepvOgzjoTaS
 XkieBAkQe0IVxgOCvXeI31X6+9FwjayjFOVcnurMawYsjJq2nFPSsp1Mhb7sGg9fLshSczJaJ8G
 mRDGFMYC2PwaPI3MRmwcsh7vyUsabeAwvpvFyxBnZlrCHatavTsMVS36JT7MZ8jmuR6nGLhYT8I
 mRBoS86TjYHkfQAmIU/1Xqxuzsfm9xOYIqz6bkCvKfYUBuh/Ng1Ml61yZB218raLgPg0VvpnR0x
 rUeM7lY9vSo1QkrP9Y6Dp7Xwh//JS9Ou6NGUDY9cvXxxxOZBuRG0E68y0mKpJMZH/FFlvmUCd1Y
 f/Cnovg8wBQhDNh3ZolkjkDltNjoU4ZsFscCdImsEEhl1sOYoep/I3xqZSV+8xhH4t+egNjmPDP
 aw+OgoGzXkpt4wqV18yMn25iT+01A1ZAxhLiaxpDnengRw==
X-Received: by 2002:a05:701b:450b:10b0:1b2:4e2e:d95a with SMTP id
 a92af1059eb24-1b55e06c4d7mr3785143c88.2.1795254170525; 
 Sat, 21 Nov 2026 01:42:50 -0800 (PST)
Received: from gye-SER8.tail6a86d6.ts.net ([121.125.115.175])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1b55684c85fsm19092456c88.14.2026.11.21.01.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:42:50 -0800 (PST)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 3/3] tools/gputop: Show device node and driver name in
 client header
Date: Sat, 21 Nov 2026 18:41:57 +0900
Message-ID: <20261121094225.628262-4-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121094225.628262-1-gye976@gmail.com>
References: <20261121094225.628262-1-gye976@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Show the device node name and the driver name in the client header
instead of "DRM minor N".

Before:
  DRM minor 128
  DRM minor 0

After:
  renderD128 (panthor)
  accel0 (rocket)

The minor alone does not tell which device or driver the clients belong
to, and since accel nodes share minor numbers with DRM nodes,
"DRM minor 0" cannot even tell card0 from accel0.

Take the node name from sysfs and the driver name from the drm-driver
fdinfo key.

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 lib/igt_drm_clients.c |  1 +
 lib/igt_drm_clients.h |  1 +
 tools/gputop.c        | 33 ++++++++++++++++++++++++++++++---
 3 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/lib/igt_drm_clients.c b/lib/igt_drm_clients.c
index 4ab49a6b5..94e27f84b 100644
--- a/lib/igt_drm_clients.c
+++ b/lib/igt_drm_clients.c
@@ -188,6 +188,7 @@ igt_drm_client_add(struct igt_drm_clients *clients,
 
 	c->id = info->id;
 	c->rdev = rdev;
+	snprintf(c->driver, sizeof(c->driver), "%s", info->driver);
 	c->clients = clients;
 
 	/* Engines */
diff --git a/lib/igt_drm_clients.h b/lib/igt_drm_clients.h
index f2a7bab97..54bd12147 100644
--- a/lib/igt_drm_clients.h
+++ b/lib/igt_drm_clients.h
@@ -65,6 +65,7 @@ struct igt_drm_client {
 	struct igt_drm_client_engines *engines; /* Engines used by this client, to map with busynees data. */
 	unsigned long id; /* DRM client id from fdinfo. */
 	dev_t rdev; /* Device number of the DRM or accel node this client fd refers to. */
+	char driver[128]; /* DRM driver name from fdinfo. */
 	unsigned int pid; /* PID which has this DRM fd open. */
 	char pid_str[10]; /* Cached PID representation. */
 	char name[24]; /* Process name of the owning PID. */
diff --git a/tools/gputop.c b/tools/gputop.c
index e89a1e53e..fb1ee0fcf 100644
--- a/tools/gputop.c
+++ b/tools/gputop.c
@@ -252,27 +252,54 @@ static char *get_frequencies(dev_t rdev)
 	return NULL;
 }
 
+/*
+ * Get the device node name (e.g. card0, renderD128) from sysfs, falling back
+ * to the major:minor numbers.
+ */
+static void get_node_name(dev_t rdev, char *buf, size_t size)
+{
+	char path[64];
+	char link[256];
+	const char *name;
+	ssize_t len;
+
+	snprintf(path, sizeof(path), "/sys/dev/char/%u:%u",
+		 major(rdev), minor(rdev));
+	len = readlink(path, link, sizeof(link) - 1);
+	if (len == -1) {
+		snprintf(buf, size, "%u:%u", major(rdev), minor(rdev));
+		return;
+	}
+	link[len] = '\0';
+
+	name = strrchr(link, '/');
+	snprintf(buf, size, "%s", name ? name + 1 : link);
+}
+
 static int
 print_client_header(struct igt_drm_client *c, int lines, int con_w, int con_h,
 		    int *engine_w)
 {
 	int ret, len;
 	char *freq_info = NULL;
+	char node[256];
 
 	if (lines++ >= con_h)
 		return lines;
 
+	get_node_name(c->rdev, node, sizeof(node));
+
 	printf(ANSI_HEADER);
 
 	/* Get frequency information */
 	freq_info = get_frequencies(c->rdev);
 
 	if (freq_info) {
-		ret = printf("DRM minor %u   Frequency(MHz) %s",
-			     minor(c->rdev), freq_info);
+		ret = printf("%s (%s)   Frequency(MHz) %s",
+			     node, c->driver, freq_info);
 		free(freq_info);
 	} else {
-		ret = printf("DRM minor %u", minor(c->rdev));
+		ret = printf("%s (%s)", node, c->driver);
 	}
 
 	n_spaces(con_w - ret);
-- 
2.43.0

