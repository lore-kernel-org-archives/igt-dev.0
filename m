Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81269606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 05:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OCCg6ANW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3761710E175;
	Mon, 16 Nov 2026 05:19:42 +0000 (UTC)
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF46210E1D3
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 22:29:17 +0000 (UTC)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91c046843f1so16360466d6.1
 for <igt-dev@lists.freedesktop.org>; Sat, 14 Nov 2026 14:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1794695356; x=1795300156;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=9ZKCJgfqeK9anWwh0gKycSMAbxUnr7i246FX/YvgOFM=;
 b=OCCg6ANWG2AvUJZ18uqwsL/P1Y5hyGE0hwYJ4ZuIb2A3Q8z6M+5ZB31TbBUVr3SSyr
 5GmXlKG6/f9FANWV6zCyja/gl3tRB6nlsoFhyYjFXfY58xRNzFOK+5mv9VsCVmuhr9gC
 I24CIAPv7sIC4HT/gaALB3cNhlQjgUNG9WsUHiOQWRARi0EDL8FBMxvc/uBwBh5FAAHB
 7m/jzCQO23nf9ABl09m8mG3Qh7pBLYxDMSAL0hkSVc4tLN+uLcANsoBwiv9o+yldw1FJ
 RM/5z7UoJ6WIO71/tVRJ4WDKqFeL1kXaOhNKPfuJVk6qhA/ImqFIgPaKb9D67u71cxe/
 zztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794695356; x=1795300156;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9ZKCJgfqeK9anWwh0gKycSMAbxUnr7i246FX/YvgOFM=;
 b=sy0iYLaSQ/hzcEQ/8EfU3PsXBTCmtSCyHpXjWbmQnT+Bh5iVhWpbhhSJl+wbjlrb12
 CWzdgPd3EKKm/2xisF6+Jb6XRhkGAKpIvj/kEZlMhJ0OEcnhfoBELHH/uSY0pXT3kw8S
 4mNdFcuGiYqCUig2CiNvnq1S2b0+BojvGUNNFzregKHQFlSANz5CYzb3qHInH9D3w59i
 RKk2AXp+zaD5hrTqX8ODJa0wOOaZclkBl29iB1w+wiSoGdDpVETv57CfiRvbo4l9rLcO
 7/Rmg0JLjAGnpCGvq+3Q4IL5QYu95DgHXgC5OINKYAMFA/zdPgtS4V3XufifacXz9pix
 KvJg==
X-Gm-Message-State: APuU4Z+ZmGB3sMkDD+BXpMTEBMQNn1UAqwae3ziS44Vy53dgAJpC8cSE
 pRboWCN2Ko30q1nIB5lp27foNzQer6+7MrJAgecT/iVNvRn+EqUNo3bIWOLjNmJk7ifzIPgZtTu
 0KBff+N9z55sfPK6AVH9AKZ9rdflhZrOmhd+j/SbOMgMWNq2mI9DsGEi42sjP4HRvmeH3Jotjtb
 /a4ZaGtupLL7nCGak5bCF7MFU1Vbe7jhnUT7tFxeX1ZpCwRiSPnAqYDU0s
X-Received: from qvbjt13.prod.google.com
 ([2002:a05:6214:27ed:b0:91f:17bb:c527])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6214:3984:b0:91e:ed24:f5c1 with SMTP id
 6a1803df08f44-91f241e0e50mr105179626d6.20.1794695356346; 
 Sat, 14 Nov 2026 14:29:16 -0800 (PST)
Date: Sat, 14 Nov 2026 17:29:11 -0500
In-Reply-To: <20261114222911.1405626-1-gildekel@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261114222911.1405626-1-gildekel@google.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261114222911.1405626-4-gildekel@google.com>
Subject: [PATCH i-g-t 3/3] tests/kms_hdr: Use /dev/kmsg in invalid-hdr
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Nov 2026 05:17:02 +0000
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
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

invalid-hdr checks that the kernel refused the EOTF by running
system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\"").
That grep also matches "Unknown EOTF" lines left by earlier subtests or
other outputs, so the check can pass even when this commit logged
nothing. It also needs a shell, dmesg and grep on the target.

Open /dev/kmsg with O_NONBLOCK and seek to its end right before the
commit that sets the HDR metadata. After the commit, read the new
records until EAGAIN, skip EPIPE when older records were overwritten,
and assert that one of them contains "Unknown EOTF <n>".

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-opus-5.5
Signed-off-by: Gil Dekel <gildekel@google.com>
---
 tests/kms_hdr.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e23d5e469..acfc38920 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -29,6 +29,8 @@
  */
 
 #include "igt.h"
+#include <ctype.h>
+#include <errno.h>
 #include <fcntl.h>
 #include <termios.h>
 #include <unistd.h>
@@ -354,6 +356,44 @@ static void adjust_brightness(data_t *data, uint32_t flags)
 	igt_assert_eq(igt_backlight_write(context.old, "brightness", &context), 0);
 }
 
+/*
+ * Opens /dev/kmsg positioned at its end, so that only kernel messages
+ * logged after this call are read back.
+ */
+static int kmsg_open_at_end(void)
+{
+	int fd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+
+	igt_assert_f(fd >= 0, "Failed to open /dev/kmsg: %s\n", strerror(errno));
+	igt_assert(lseek(fd, 0, SEEK_END) >= 0);
+
+	return fd;
+}
+
+/* Returns true if a record read from @kmsg_fd contains "Unknown EOTF <n>". */
+static bool kmsg_has_unknown_eotf(int kmsg_fd)
+{
+	static const char pattern[] = "Unknown EOTF ";
+	char buf[8192];
+	ssize_t len;
+
+	for (;;) {
+		const char *match;
+
+		/* Each read() returns one record, EAGAIN once drained. */
+		len = read(kmsg_fd, buf, sizeof(buf) - 1);
+		if (len < 0 && errno == EPIPE)
+			continue; /* Older records were overwritten, keep going. */
+		if (len <= 0)
+			return false;
+
+		buf[len] = '\0';
+		match = strstr(buf, pattern);
+		if (match && isdigit((unsigned char)match[sizeof(pattern) - 1]))
+			return true;
+	}
+}
+
 static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 			       uint32_t format, uint32_t flags)
 {
@@ -361,6 +401,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
 	int afb_id;
+	int kmsg_fd = -1;
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
@@ -392,11 +433,17 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	}
 
 	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
+	if (flags & TEST_INVALID_HDR)
+		kmsg_fd = kmsg_open_at_end();
 	igt_hdr_set_metadata(data->output, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 	if (flags & TEST_INVALID_HDR) {
-		igt_assert_eq(system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""), 0);
+		bool logged = kmsg_has_unknown_eotf(kmsg_fd);
+
+		close(kmsg_fd);
+		igt_assert_f(logged,
+			     "Kernel did not log \"Unknown EOTF\" for invalid HDR metadata\n");
 		return;
 	}
 
-- 
Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics

