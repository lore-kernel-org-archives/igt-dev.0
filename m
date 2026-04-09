Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFC5E98FA9
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 04:16:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CE2C10E0FF;
	Thu,  9 Apr 2026 04:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLJkU9/S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78D3510E0FF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 04:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775708158; x=1807244158;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rp6wfTIf5AmztGGJJMtM+6vySKGXqDr/p6Wme+bEbNg=;
 b=FLJkU9/SHjlhSwtU/g0hRMjJkNEHRspRVQ6HFer3B5OrXN8vvW07cEbt
 BVRryje5owlXvaRqVtW2XTBiomfbzkWl8pzj+yF/AcEA/uf65x23woQX6
 Hiw9G07SDUjbkUuy/DUq61G1LBRlite4qQyxM/rd4ZYaxvgLoZ+3t+5Mj
 ivIUV/srNk7IqRFqUds+nNHDjtb3iBqHIaqGLQab1kgMl/jhK2WRC1Wmd
 tcLgQb+SmkJxfiwgVmGzHHrxAxahWjAh+8vRinxe+NA0VN4LlnI7jyR/M
 pPVE9YDleCvOPdIHFCcv5yshirCc1bRG315HbYi18+zp7+R4PIcTw3Zuy Q==;
X-CSE-ConnectionGUID: 7UshfHW4TPKeztlJJwN6Tg==
X-CSE-MsgGUID: F2SLd8hSTVCkHeAwEHUk9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76608381"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; d="scan'208";a="76608381"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2026 21:15:57 -0700
X-CSE-ConnectionGUID: Svvq9kouSj+yiRA6zdBt+Q==
X-CSE-MsgGUID: l/LboLZgTM2qvOesSez+6A==
X-ExtLoop1: 1
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 21:15:55 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH i-g-t 3/6] lib/igt_serial: add generic serial communication
 helper
Date: Thu,  9 Apr 2026 10:07:11 +0530
Message-Id: <20260409043714.284108-4-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260409043714.284108-1-kunal1.joshi@intel.com>
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
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

Add a reusable serial communication library for host-to-device

 - igt_serial_open()/close(): lifecycle with configurable baud rate
 - igt_serial_send()/read(): raw data transfer
 - igt_serial_command(): send command and capture response
 - igt_serial_flush(): drain stale data from receive buffer
 - igt_serial_set_timeout(): adjust per-operation VTIME timeouts

Used by lib/igt_usb4_switch to communicate with the Microsoft USB4
Switch 3141 over its serial/USB interface.

Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 lib/igt_serial.c | 435 +++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_serial.h |  32 ++++
 lib/meson.build  |   1 +
 3 files changed, 468 insertions(+)
 create mode 100644 lib/igt_serial.c
 create mode 100644 lib/igt_serial.h

diff --git a/lib/igt_serial.c b/lib/igt_serial.c
new file mode 100644
index 000000000..35fbadd7c
--- /dev/null
+++ b/lib/igt_serial.c
@@ -0,0 +1,435 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * SECTION:igt_serial
+ * @short_description: Generic serial port communication library
+ * @title: Serial Communication
+ * @include: igt_serial.h
+ *
+ * This library provides a clean API for serial port communication,
+ * useful for test equipment that uses serial/USB-CDC interfaces.
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <termios.h>
+#include <unistd.h>
+
+#include "igt_core.h"
+#include "igt_serial.h"
+
+struct igt_serial {
+	int fd;
+	char *device;
+	struct termios orig_termios;
+	bool termios_saved;
+	int read_timeout_ds;
+};
+
+static speed_t baud_to_speed(int baud)
+{
+	switch (baud) {
+	case 9600:   return B9600;
+	case 19200:  return B19200;
+	case 38400:  return B38400;
+	case 57600:  return B57600;
+	case 115200: return B115200;
+	case 230400: return B230400;
+	case 460800: return B460800;
+	case 921600: return B921600;
+	default:
+		return 0;
+	}
+}
+
+/**
+ * igt_serial_open:
+ * @device: path to the serial device (e.g., "/dev/ttyACM0")
+ * @baud_rate: baud rate (e.g., 115200)
+ *
+ * Opens a serial port with the specified baud rate.
+ * Uses 8N1 configuration (8 data bits, no parity, 1 stop bit).
+ *
+ * Returns: A serial handle on success, NULL on failure.
+ */
+struct igt_serial *igt_serial_open(const char *device, int baud_rate)
+{
+	struct igt_serial *s;
+	struct termios tty;
+	speed_t speed;
+
+	if (!device) {
+		igt_debug("Serial: NULL device path\n");
+		return NULL;
+	}
+
+	s = calloc(1, sizeof(*s));
+	if (!s) {
+		igt_debug("Serial: Failed to allocate memory\n");
+		return NULL;
+	}
+
+	s->fd = -1;
+
+	s->device = strdup(device);
+	if (!s->device)
+		goto err_free;
+
+	/* Default timeout: 1 second (10 deciseconds) */
+	s->read_timeout_ds = 10;
+	s->fd = open(device, O_RDWR | O_NOCTTY);
+
+	if (s->fd < 0) {
+		igt_debug("Serial: Failed to open %s: %s\n",
+			  device, strerror(errno));
+		goto err_free_device;
+	}
+
+	if (tcgetattr(s->fd, &tty) != 0) {
+		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
+		goto err_close;
+	}
+
+	s->orig_termios = tty;
+	s->termios_saved = true;
+	speed = baud_to_speed(baud_rate);
+
+	if (!speed) {
+		igt_debug("Serial: Unsupported baud rate %d\n", baud_rate);
+		goto err_close;
+	}
+
+	cfsetospeed(&tty, speed);
+	cfsetispeed(&tty, speed);
+
+	/* 8N1: 8 data bits, no parity, 1 stop bit */
+	tty.c_cflag &= ~PARENB;
+	tty.c_cflag &= ~CSTOPB;
+	tty.c_cflag &= ~CSIZE;
+	tty.c_cflag |= CS8;
+	tty.c_cflag &= ~CRTSCTS;
+	tty.c_cflag |= CREAD | CLOCAL;
+
+	/* Disable canonical mode, echo, and signals */
+	tty.c_lflag &= ~(ICANON | ECHO | ECHOE | ISIG);
+
+	/* Disable output post-processing */
+	tty.c_oflag &= ~OPOST;
+
+	/* Disable software flow control and input translations */
+	tty.c_iflag &= ~(IXON | IXOFF | IXANY);
+	tty.c_iflag &= ~(IGNBRK | BRKINT | PARMRK | ISTRIP |
+			  INLCR | IGNCR | ICRNL);
+
+	/*
+	 * Blocking read with timeout.
+	 * VMIN=0, VTIME>0: return after timeout or when data available.
+	 */
+	tty.c_cc[VMIN] = 0;
+	tty.c_cc[VTIME] = s->read_timeout_ds;
+
+	if (tcsetattr(s->fd, TCSANOW, &tty) != 0) {
+		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
+		goto err_close;
+	}
+
+	/* Flush any stale input */
+	if (tcflush(s->fd, TCIFLUSH) != 0)
+		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
+
+	igt_debug("Serial: Opened %s at %d baud (timeout=%dms)\n",
+		  s->device, baud_rate, s->read_timeout_ds * 100);
+	return s;
+
+err_close:
+	close(s->fd);
+err_free_device:
+	free(s->device);
+err_free:
+	free(s);
+	return NULL;
+}
+
+/**
+ * igt_serial_close:
+ * @s: serial handle
+ *
+ * Closes the serial port and frees resources.
+ */
+void igt_serial_close(struct igt_serial *s)
+{
+	if (!s)
+		return;
+
+	if (s->termios_saved) {
+		if (tcsetattr(s->fd, TCSANOW, &s->orig_termios) != 0)
+			igt_debug("Serial: tcsetattr restore failed: %s\n",
+				  strerror(errno));
+	}
+
+	if (s->fd >= 0)
+		close(s->fd);
+	igt_debug("Serial: Closed %s\n", s->device ? s->device : "(unknown)");
+	free(s->device);
+	free(s);
+}
+
+/**
+ * igt_serial_set_timeout:
+ * @s: serial handle
+ * @timeout_ms: timeout in milliseconds (0 enables polling mode)
+ *
+ * Sets the read timeout for the serial port. VTIME has a granularity
+ * of 100 ms (deciseconds); non-zero values are rounded up. Setting
+ * @timeout_ms to 0 configures polling mode where reads return
+ * immediately if no data is available.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms)
+{
+	struct termios tty;
+	int new_timeout_ds;
+
+	if (!s || timeout_ms < 0)
+		return false;
+
+	if (tcgetattr(s->fd, &tty) != 0) {
+		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	/* Convert ms to deciseconds (0.1s units), clamp to cc_t max (255) */
+	new_timeout_ds = (timeout_ms + 99) / 100;
+	if (new_timeout_ds > 255)
+		new_timeout_ds = 255;
+
+	tty.c_cc[VTIME] = new_timeout_ds;
+
+	if (tcsetattr(s->fd, TCSANOW, &tty) != 0) {
+		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
+		return false;
+	}
+	s->read_timeout_ds = new_timeout_ds;
+	igt_debug("Serial: Timeout set to %dms (applied %dms)\n",
+		  timeout_ms, s->read_timeout_ds * 100);
+	return true;
+}
+
+/**
+ * igt_serial_send:
+ * @s: serial handle
+ * @cmd: command string to send
+ *
+ * Sends a command string to the serial port exactly as provided.
+ * The caller is responsible for adding any required line endings.
+ * Handles short writes that may occur on USB-CDC devices under load.
+ *
+ * Returns: true on success, false on failure.
+ */
+bool igt_serial_send(struct igt_serial *s, const char *cmd)
+{
+	size_t len, total = 0;
+	ssize_t written;
+
+	if (!s || !cmd)
+		return false;
+
+	len = strlen(cmd);
+	if (len == 0)
+		return true;
+
+	while (total < len) {
+		written = write(s->fd, cmd + total, len - total);
+		if (written <= 0) {
+			if (written < 0 && errno == EINTR)
+				continue;
+			igt_debug("Serial: Write failed: %s\n",
+				  written < 0 ? strerror(errno) : "zero bytes written");
+			return false;
+		}
+		total += written;
+	}
+
+	if (tcdrain(s->fd) != 0) {
+		igt_debug("Serial: tcdrain failed: %s\n", strerror(errno));
+		return false;
+	}
+
+	igt_debug("Serial: Sent '%s'\n", cmd);
+	return true;
+}
+
+/*
+ * igt_serial_readline - Read a line from serial port (until newline or timeout).
+ *
+ * Returns number of bytes in buf (0 means timeout/no data), or -1 on error.
+ */
+static ssize_t igt_serial_readline(struct igt_serial *s, char *buf, size_t size)
+{
+	size_t total = 0;
+	ssize_t n;
+
+	if (!s || !buf || size == 0)
+		return -1;
+
+	/*
+	 * Read one byte at a time until newline or timeout.
+	 * VTIME timeout ensures read() returns 0 on timeout.
+	 */
+	while (total < size - 1) {
+		n = read(s->fd, buf + total, 1);
+		if (n < 0) {
+			if (errno == EINTR)
+				continue;
+			igt_debug("Serial: Read error: %s\n", strerror(errno));
+			return -1;
+		}
+		if (n == 0)
+			break;
+
+		total++;
+
+		if (buf[total - 1] == '\n')
+			break;
+	}
+
+	buf[total] = '\0';
+	return (ssize_t)total;
+}
+
+/**
+ * igt_serial_read:
+ * @s: serial handle
+ * @buf: buffer to read into
+ * @size: size of buffer
+ *
+ * Reads one line (up to newline or timeout) from the serial port.
+ * This is a line-oriented read, not an arbitrary byte read — it stops
+ * at the first newline character or when the VTIME timeout expires.
+ * Use igt_serial_set_timeout() to adjust the timeout before calling.
+ *
+ * Returns: Number of bytes read, 0 on timeout/no data, or -1 on error.
+ */
+ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size)
+{
+	ssize_t n;
+
+	n = igt_serial_readline(s, buf, size);
+
+	igt_debug("Serial: Read %zd bytes: '%s'\n", n, n > 0 ? buf : "");
+	return n;
+}
+
+/**
+ * igt_serial_command:
+ * @s: serial handle
+ * @cmd: command string to send
+ * @response: buffer for response
+ * @resp_size: size of response buffer
+ *
+ * Convenience function to send a command and read the response.
+ * Flushes stale input before sending, sends the command, then reads
+ * one response line. If @response is non-NULL, at least one byte must
+ * be received before the configured VTIME timeout for success.
+ *
+ * Returns: true if the send succeeded and, when @response is given,
+ * at least one response byte was received; false otherwise.
+ */
+bool igt_serial_command(struct igt_serial *s, const char *cmd,
+			char *response, size_t resp_size)
+{
+	ssize_t n;
+
+	if (!s || !cmd)
+		return false;
+
+	igt_serial_flush(s);
+
+	if (!igt_serial_send(s, cmd))
+		return false;
+
+	if (response && resp_size > 0) {
+		n = igt_serial_readline(s, response, resp_size);
+		if (n <= 0) {
+			igt_debug("Serial: No response received\n");
+			return false;
+		}
+		igt_debug("Serial: Response: '%s'\n", response);
+	}
+
+	return true;
+}
+
+/**
+ * igt_serial_flush:
+ * @s: serial handle
+ *
+ * Discards stale input. Does not touch pending output.
+ * Calls TCIFLUSH to drop kernel-queued input, then temporarily sets
+ * O_NONBLOCK and drains any bytes already readable to reduce races
+ * with in-flight input. Assumes single-threaded access.
+ */
+void igt_serial_flush(struct igt_serial *s)
+{
+	char discard[256];
+	ssize_t n;
+	int flags;
+
+	if (!s)
+		return;
+
+	/* Discard kernel-queued input; never touch pending output */
+	if (tcflush(s->fd, TCIFLUSH) != 0)
+		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
+
+	/* Drain bytes already readable to reduce races with in-flight input */
+	flags = fcntl(s->fd, F_GETFL);
+	if (flags < 0) {
+		igt_debug("Serial: fcntl(F_GETFL) failed: %s\n", strerror(errno));
+		return;
+	}
+
+	if (fcntl(s->fd, F_SETFL, flags | O_NONBLOCK) < 0) {
+		igt_debug("Serial: fcntl(F_SETFL) failed: %s\n", strerror(errno));
+		return;
+	}
+
+	for (;;) {
+		n = read(s->fd, discard, sizeof(discard));
+		if (n > 0)
+			continue;
+		if (n == 0)
+			break;
+		/* n < 0 */
+		if (errno == EINTR)
+			continue;
+		if (errno != EAGAIN)
+			igt_debug("Serial: unexpected read error in flush: %s\n",
+				  strerror(errno));
+		break;
+	}
+
+	if (fcntl(s->fd, F_SETFL, flags) < 0)
+		igt_debug("Serial: fcntl(F_SETFL) restore failed: %s\n", strerror(errno));
+
+	igt_debug("Serial: Flushed\n");
+}
+
+/**
+ * igt_serial_get_fd:
+ * @s: serial handle
+ *
+ * Gets the underlying file descriptor for advanced operations.
+ *
+ * Returns: File descriptor, or -1 if handle is NULL.
+ */
+int igt_serial_get_fd(struct igt_serial *s)
+{
+	return s ? s->fd : -1;
+}
diff --git a/lib/igt_serial.h b/lib/igt_serial.h
new file mode 100644
index 000000000..b460fbf16
--- /dev/null
+++ b/lib/igt_serial.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+#ifndef IGT_SERIAL_H
+#define IGT_SERIAL_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <sys/types.h>
+
+/**
+ * IGT_SERIAL_DEFAULT_TIMEOUT_MS:
+ *
+ * Default timeout for serial read operations in milliseconds.
+ */
+#define IGT_SERIAL_DEFAULT_TIMEOUT_MS 1000
+
+struct igt_serial;
+
+struct igt_serial *igt_serial_open(const char *device, int baud_rate);
+void igt_serial_close(struct igt_serial *s);
+bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms);
+bool igt_serial_send(struct igt_serial *s, const char *cmd);
+ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size);
+bool igt_serial_command(struct igt_serial *s, const char *cmd,
+			char *response, size_t resp_size);
+void igt_serial_flush(struct igt_serial *s);
+int igt_serial_get_fd(struct igt_serial *s);
+
+#endif /* IGT_SERIAL_H */
diff --git a/lib/meson.build b/lib/meson.build
index 5e34ce631..26e7015d2 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -122,6 +122,7 @@ lib_sources = [
 	'igt_msm.c',
 	'igt_dsc.c',
 	'igt_hook.c',
+	'igt_serial.c',
 	'xe/xe_gt.c',
 	'xe/xe_ioctl.c',
 	'xe/xe_legacy.c',
-- 
2.25.1

