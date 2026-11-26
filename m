Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7881B606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 26 Nov 2026 10:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qaNfoIT1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8671122C7;
	Thu, 26 Nov 2026 10:54:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3116E10E3E6
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 10:53:49 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-3ae1da332bcso3565896a91.2
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Nov 2026 02:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795690429; x=1796295229; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Biq0Fk3ikDiYyQFOCDGY6bQ/ex+OS0/x2yH2qbB39Ak=;
 b=qaNfoIT1mHuSu/VOD1/WwWe7KvSiW+xIdFtj6I6Ci4rxHNJgpP3DD6U7Q8WCm9q5t0
 jx9IDFVxBcPQv4Olkta8UomXMDZqAGGTniqEzCf5hJBwl+sKgfHaw/eK+ku7Ehpnsml5
 2YeSfZD+ddRrxUtWee8wfWopXMc9+0j9mDZ73XdVWZnX6pnay5LBTSF3BN78jyRglRNJ
 EfCfTIlknG4iXerhSsn8pIiDpyDTbcCziims2Y8oLh/CNugY/bF9+sj7NDern/oz0efL
 8VfpKYEGzKa0JepHQrQlutIi9UcV+LIP27V2QXJPfxgdgT9ZMgDG6LvmR6Qvi9W9n9Oq
 Nflg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795690429; x=1796295229;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Biq0Fk3ikDiYyQFOCDGY6bQ/ex+OS0/x2yH2qbB39Ak=;
 b=FGjpE2hBPnZ9ciBCob08HIL3r7wpGg2qR1p/Ydp1zTd8W0hPoEcsgyhVqwHp8OakF8
 MYIOTq7fNHXl6IgCi4q3omXgMxqJW/vgc8C/MCX6MQ6HTJKXfUOMSpxpmJgOX7Cl6Ze/
 aPM8EgfoNEXARsmp1lfoF8XfGel0Nphmd3lGEDE7f8VrweIL5126S8CXazH1VFSqmIZm
 /LKWcu39og9wJ2bG9L07XvCcqnSszpWX3PkUWGz/W2MYcndhiC7mz8cICai4hp0UFHZ/
 sUskyB+u2HmmgcDFlcWjzCxQHjgiUlsNc4qgn9zFGFzZ5UxNGTo8N5oF6AcUbpp2v6RV
 GibA==
X-Gm-Message-State: APuU4Z9qWT0SZr5TYXMOwhtNYKhFJUB03Vh/6frIbJk/TtEvJA6ZWQ8F
 3QELDCpz0aP36wpwIYQCQa1PpGkfa3BeI2rxUjT4lddekLvsr5fgiy+SoJIxBzAC
X-Gm-Gg: AZFdTZeuuLb4HypsRWXChJOkqF2iJ4cPIFdotFMe52ci0PUzo3h2MMOJfwu3gKzWJV6
 cUQFifm6CiVJDFkf3ZkGBdJOCaweW3apZsm+b1rbrh91tBbQq9tZOHIdyUS9Fs0XjVQft2cVvqM
 cF5swn46DsI8zhWJkGkuRdsYX+OzenFXR3xt1H7vLRnHtk5DRZXNeWdH/9A3f9nfIbVBjSv5KzJ
 CFeYN/vV1SmqLPa3ht+IvWgYVn+ZTo0jryEs/dzHbAX5YEZupziNJrjRWP3fonZE1YfGlcCLG2a
 5drALkThh3LFr4QezDmc1neKuzBDXoqplAoTG+CpXqsfQjUcyLZj6BxCnCrnC/okLwMaekdLKKl
 LoJVrtubl8uzIWqrK5R4yxPku3wyqXBHgkiPE3Nx5mqJZcGoYPS8EVEjOQ8hlam6I7BBELIFlQE
 QGdepueLXOmMAp8wW0LgQOfS43l0dHJ9DooyrETFpGIsELeGCN34Yf2v2VKECO35byVTK1CuTax
 otzZiZ8skoAXOd/QX0A3F3Kb8JBi3eqP4GvwylXvjJfYMbinftlJ6RRMuhtiyTS6ZUlb2JN+SNa
 9LmbBD0dFY/ps6RXvQNOp4ZJ5Ev97q4NxenkBb/gXLmJI/LV5mZGqaVlj9CL454cnDyMyWrsDLc
 GeD0AAoiRR6I=
X-Received: by 2002:a17:90b:4a48:b0:3ab:2d17:51c5 with SMTP id
 98e67ed59e1d1-3b41c7b60b5mr18630945a91.6.1795690428365; 
 Thu, 26 Nov 2026 02:53:48 -0800 (PST)
Received: from DESKTOP-TPPBPA1 (36-226-201-204.dynamic-ip.hinet.net.
 [36.226.201.204]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b405d63728sm37600470a91.8.2026.11.26.02.53.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 02:53:47 -0800 (PST)
From: Roy <rongh7426@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Roy <rongh7426@gmail.com>
Subject: [PATCH i-g-t] lib/igt_eld: Accept the ASoC hdmi-codec ELD format
Date: Thu, 26 Nov 2026 18:53:45 +0800
Message-ID: <20261126105345.656307-1-rongh7426@gmail.com>
X-Mailer: git-send-email 2.51.1.windows.1
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

eld_parse_entry() only reports a monitor when the ELD file has
"monitor_present 1", and eld_get_igt() also needs "eld_valid 1". Those
two fields are printed by the HDA HDMI codec only. The ELD files of the
ASoC hdmi-codec, used by HDMI audio on Arm boards, start at
monitor_name, so every ELD there is treated as having no monitor.

On a Raspberry Pi 5 (vc4), kms_hdmi_inject's inject-audio fails even
though the ELD shows the injected EDID:

  (kms_hdmi_inject) igt_eld-DEBUG: Monitor not present in ELD: /proc/asound/card0/eld#0
  (kms_hdmi_inject) CRITICAL: HDMI ELD missing after retry

while /proc/asound/card0/eld#0 has:

  monitor_name		IGT
  connection_type	HDMI
  eld_version		[0x2] CEA-861D or below

When the two fields are missing, use the ELD version instead. The
hdmi-codec shows an all-zero ELD, with eld_version [0x0], when no sink
is connected, so a non-zero version means a monitor is present and its
ELD is valid. ELD files that have the fields are handled as before.

Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39):
kms_hdmi_inject inject-audio fails before and passes after; inject-4k
passes both times.

This change and its description were written with the help of an AI
coding assistant (Claude); the test runs above were done on real
hardware.

Signed-off-by: Roy <rongh7426@gmail.com>
---
 lib/igt_eld.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 0d3c668..51d2ee7 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -167,6 +167,11 @@ static bool parse_sad_field(struct eld_sad *sad, const char *key, char *value)
  *
  * Each entry contains one or more SAD blocks. Their contents is exposed in
  * sadN_* fields.
+ *
+ * The monitor_present and eld_valid fields are printed by the HDA HDMI codec
+ * only. The ASoC hdmi-codec starts at monitor_name and shows an all-zero ELD
+ * (eld_version [0x0]) when no sink is connected, so without those fields a
+ * non-zero ELD version means a monitor is present and its ELD is valid.
  */
 static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 {
@@ -175,6 +180,8 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 	char *key, *value, *sad_key;
 	size_t len;
 	bool monitor_present = false;
+	bool has_present = false, has_valid = false;
+	unsigned int eld_version = 0;
 	bool sad_ok;
 	int sad_index;
 
@@ -196,10 +203,15 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 		/* Skip whitespace at the beginning */
 		value += strspn(value, ELD_DELIM);
 
+		has_present |= strcmp(key, "monitor_present") == 0;
+		has_valid |= strcmp(key, "eld_valid") == 0;
+
 		if (strcmp(key, "monitor_present") == 0)
 			monitor_present = strcmp(value, "1") == 0;
 		else if (strcmp(key, "eld_valid") == 0)
 			eld->valid = strcmp(value, "1") == 0;
+		else if (strcmp(key, "eld_version") == 0)
+			sscanf(value, "[0x%x]", &eld_version);
 		else if (strcmp(key, "monitor_name") == 0)
 			snprintf(eld->monitor_name, sizeof(eld->monitor_name),
 				 "%s", value);
@@ -227,6 +239,11 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
 
 	fclose(f);
 
+	if (!has_present)
+		monitor_present = eld_version != 0;
+	if (!has_valid)
+		eld->valid = monitor_present;
+
 	if (!monitor_present)
 		igt_debug("Monitor not present in ELD: %s\n", path);
 	return monitor_present;
-- 
2.51.1.windows.1

