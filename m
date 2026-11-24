Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A278606A329
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=CSdcQ0+H
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523AF10FA84;
	Wed, 25 Nov 2026 09:51:06 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5D410E285
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 19:44:42 +0000 (UTC)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-920fb8b9859so3788756d6.2
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 11:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20260707; t=1795549482; x=1796154282;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/jyGaK/d0JY3sKJXlWLvlncKhBDSjU7ExoWuoXKgGmI=;
 b=CSdcQ0+HpKfNmnWKCoJsUwcPxxoqtgWaAELYYAn1gWJmd/yDN1Ytpb9oytzCdjtkj1
 H3Ybg032ywys7JzEItGU5LPcIOpgPjHQTYmL4OlTQlEyRXb1O+APLjs9oVjMid/lvAEf
 rHNGj6bJbnWTs1+OQ0UoGuwcSySHd4nFQPXdw0P6omeaZ+AywD6IP7aonY193MHejag6
 kWnbzAjKQ+Vo7pCnRjxJR8z5yR039FwLZtGOf7iZXYTWcR+K1Pcnbf8ZDrWuTGZOQSTu
 9uVAgcur4ek/k42THrBxiW2P/36Xny44NYpYe+2q1/JdA59/KYIBQwt+TYmlqjau/wEW
 1kVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795549482; x=1796154282;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=/jyGaK/d0JY3sKJXlWLvlncKhBDSjU7ExoWuoXKgGmI=;
 b=z+jub7dfhHHZt/0frMJsm1Ll4M03jZDHy3lXKLiIkN1iWIWBgZnftKm2RxZmTWPtK1
 dJSvEPovTjJ3QwSki0HNhSJ9CGp9G8jlaVNaTUpFdOVK3QfvijQ/tHfGMmsAHZaBoLUi
 Mfj4obOlt7LnIoyXG1DM+UeIQyBDYa1OPgYcY7w/eMhd/SaTJN9lgz1TKyVdt/jhyNkV
 Pt7Zh5M7wRatBaZXbS6BHUYCy1Tr2lZhVUHGVFuJPsAmHfHa/OukSuJAH5jxalEswvDc
 gqSpnc66PlKFaNyjArp3L6ljAtbHL3Mc3AeCLrVRIzU9ZmROS7txTMaxRVAmDSzpEQ4w
 aeRA==
X-Gm-Message-State: APuU4Z9x9XSUgQoCYz7eAtQgo8JIA5QkNikSLcczddrPM1kaLW/CJsXZ
 9lV2+sJ0Hqmv7meXyd5uy1jBW4DjSspvAvbuwa+s32S/Ae3UeSNkT1LKXDx6yyr/eOWCyKR6bCp
 t0RUWZkyxFd2IOtEJDXCHRpx+0VEmFjpdUR4kOmkUUZCWbJp6evwpFwhwlS9pkUCVzACrxbVn1Y
 bk3lY+xg54mPC43ECFeuE/ybQwBA8rR/sYOrsGKQlzKlSLTJm/qIofYYun
X-Received: from qvcc9.prod.google.com ([2002:a05:6214:2249:b0:91f:1004:2b9c])
 (user=gildekel job=prod-delivery.src-stubby-dispatcher) by
 2002:a0c:f146:0:10b0:921:15da:8114 with SMTP id
 6a1803df08f44-92134ab62e7mr234209796d6.29.1795549479796; 
 Tue, 24 Nov 2026 11:44:39 -0800 (PST)
Date: Tue, 24 Nov 2026 14:44:38 -0500
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261124194438.314352-1-gildekel@google.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Use /dev/kmsg in invalid-hdr
From: Gil Dekel <gildekel@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Gil Dekel <gildekel@google.com>, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>, Jani Nikula <jani.nikula@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 25 Nov 2026 09:48:20 +0000
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

invalid-hdr checks that the kernel rejected the EOTF by running
system("dmesg|tail -n 1000|grep -E \"Unknown EOTF [0-9]+\""). That grep
also matches "Unknown EOTF" lines left in the ring buffer by earlier
format iterations, the preceding TEST_ONLY check, or other outputs, so
it can pass when the commit under test logged nothing; conversely,
verbose DRM_UT_KMS modeset logs after infoframe setup can push the line
past tail -n 1000. It also requires sh, dmesg, tail, and grep on the
target.

Open /dev/kmsg with O_NONBLOCK and seek to SEEK_END right before the
HDR metadata commit (skipping if /dev/kmsg is inaccessible). After the
commit, read records until EAGAIN, continue past EPIPE if older records
were overwritten, and assert that a record logged during this commit
contains "Unknown EOTF <n>".

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Mark Yacoub <markyacoub@google.com>
Assisted-by: Claude:claude-fable-5.2
Signed-off-by: Gil Dekel <gildekel@google.com>
---

Notes:
    Resent standalone after withdrawing patches 1/3 and 2/3 of the HDR
    DisplayID series in favor of Simon Ser's libdisplay-info conversion:
    https://lists.freedesktop.org/archives/igt-dev/2026-November/118994.html
    
    Changes since patch 3/3 of that series:
    - Skip cleanly on EACCES/EPERM/ENOENT when opening /dev/kmsg in
      restricted environments.

 tests/kms_hdr.c | 51 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index e23d5e469..e273c6932 100644
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
@@ -354,6 +356,46 @@ static void adjust_brightness(data_t *data, uint32_t flags)
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
+	if (fd < 0 && (errno == EACCES || errno == EPERM || errno == ENOENT))
+		igt_skip("Cannot open /dev/kmsg: %s\n", strerror(errno));
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
@@ -361,6 +403,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
 	struct hdr_output_metadata hdr;
 	igt_crc_t ref_crc, new_crc;
 	int afb_id;
+	int kmsg_fd = -1;
 
 	/* 10-bit formats are slow, so limit the size. */
 	afb_id = igt_create_fb(data->fd, 512, 512,
@@ -392,11 +435,17 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
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
Gil Dekel, Senior SWE, Google | Android Laptops & Tablets Display

