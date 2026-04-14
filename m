Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255D7ED7B8B
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 09:21:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BA610E325;
	Tue, 14 Apr 2026 09:21:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQBkXalO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A3E10E5AC
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 09:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776158459; x=1807694459;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=Bndh2nxuO4UoKrnhXow6zMOmwDAGHcYaj8tA2pnMDt8=;
 b=FQBkXalOh/BAQ3vuxbifH3jt/n0VPhyofXSah6BNdJDAGx/abBQX6JGW
 VxI7UjBn0RCyZZ5RnnkqmZ4uRe9DP1l90nmUzIBsdfEFkBFj45rQ4ZsRX
 lyvvOc/ALG8zYvL0kz1UPxOBqA8zpyqYHK+dOJGavUfO2opC48ZEia+r0
 7b3LAoDy6OFAgkxKlHqD+Qk/ZtRUuB0OioWVb+2u5lgNGv73Pkua7+/m5
 1oDQbNRiE5AVG9xggVAD4tGjMRyvzROLNTkTzLqpDhWMGktc6HVp92tab
 yL6gkwWpbbY8+GxRXM42svgfqkjv4BZ6VziyS4NDd5Wr92Um8M2LRzMv7 Q==;
X-CSE-ConnectionGUID: Z9LlOQL4SNCLh+XE7wKNvg==
X-CSE-MsgGUID: KIsJLWQESJGgFfNtlI/Q4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88557471"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="88557471"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:20:58 -0700
X-CSE-ConnectionGUID: z9q/URh2RR24cWmUq0Hb0A==
X-CSE-MsgGUID: AeknH2KET0iwXsGW3R1IwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="253439445"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 02:20:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>, Arun R Murthy
 <arun.r.murthy@intel.com>
Subject: Re: [PATCH i-g-t 3/6] lib/igt_serial: add generic serial
 communication helper
In-Reply-To: <20260409043714.284108-4-kunal1.joshi@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260409043714.284108-1-kunal1.joshi@intel.com>
 <20260409043714.284108-4-kunal1.joshi@intel.com>
Date: Tue, 14 Apr 2026 12:20:52 +0300
Message-ID: <89f11a67438bedee71a9a38355d88078e72bb1b8@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 09 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
> Add a reusable serial communication library for host-to-device
>
>  - igt_serial_open()/close(): lifecycle with configurable baud rate
>  - igt_serial_send()/read(): raw data transfer
>  - igt_serial_command(): send command and capture response
>  - igt_serial_flush(): drain stale data from receive buffer
>  - igt_serial_set_timeout(): adjust per-operation VTIME timeouts
>
> Used by lib/igt_usb4_switch to communicate with the Microsoft USB4
> Switch 3141 over its serial/USB interface.

The last time I wrote some serial port handling code from scratch was in
the 90s. Surely by now there are a plethora of libraries to choose from
for this?! Maintaining and debugging this locally is going to be
tedious, boring, time-consuming, and completely off-topic for IGT.

BR,
Jani.


>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  lib/igt_serial.c | 435 +++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_serial.h |  32 ++++
>  lib/meson.build  |   1 +
>  3 files changed, 468 insertions(+)
>  create mode 100644 lib/igt_serial.c
>  create mode 100644 lib/igt_serial.h
>
> diff --git a/lib/igt_serial.c b/lib/igt_serial.c
> new file mode 100644
> index 000000000..35fbadd7c
> --- /dev/null
> +++ b/lib/igt_serial.c
> @@ -0,0 +1,435 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +/**
> + * SECTION:igt_serial
> + * @short_description: Generic serial port communication library
> + * @title: Serial Communication
> + * @include: igt_serial.h
> + *
> + * This library provides a clean API for serial port communication,
> + * useful for test equipment that uses serial/USB-CDC interfaces.
> + */
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <termios.h>
> +#include <unistd.h>
> +
> +#include "igt_core.h"
> +#include "igt_serial.h"
> +
> +struct igt_serial {
> +	int fd;
> +	char *device;
> +	struct termios orig_termios;
> +	bool termios_saved;
> +	int read_timeout_ds;
> +};
> +
> +static speed_t baud_to_speed(int baud)
> +{
> +	switch (baud) {
> +	case 9600:   return B9600;
> +	case 19200:  return B19200;
> +	case 38400:  return B38400;
> +	case 57600:  return B57600;
> +	case 115200: return B115200;
> +	case 230400: return B230400;
> +	case 460800: return B460800;
> +	case 921600: return B921600;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +/**
> + * igt_serial_open:
> + * @device: path to the serial device (e.g., "/dev/ttyACM0")
> + * @baud_rate: baud rate (e.g., 115200)
> + *
> + * Opens a serial port with the specified baud rate.
> + * Uses 8N1 configuration (8 data bits, no parity, 1 stop bit).
> + *
> + * Returns: A serial handle on success, NULL on failure.
> + */
> +struct igt_serial *igt_serial_open(const char *device, int baud_rate)
> +{
> +	struct igt_serial *s;
> +	struct termios tty;
> +	speed_t speed;
> +
> +	if (!device) {
> +		igt_debug("Serial: NULL device path\n");
> +		return NULL;
> +	}
> +
> +	s =3D calloc(1, sizeof(*s));
> +	if (!s) {
> +		igt_debug("Serial: Failed to allocate memory\n");
> +		return NULL;
> +	}
> +
> +	s->fd =3D -1;
> +
> +	s->device =3D strdup(device);
> +	if (!s->device)
> +		goto err_free;
> +
> +	/* Default timeout: 1 second (10 deciseconds) */
> +	s->read_timeout_ds =3D 10;
> +	s->fd =3D open(device, O_RDWR | O_NOCTTY);
> +
> +	if (s->fd < 0) {
> +		igt_debug("Serial: Failed to open %s: %s\n",
> +			  device, strerror(errno));
> +		goto err_free_device;
> +	}
> +
> +	if (tcgetattr(s->fd, &tty) !=3D 0) {
> +		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
> +		goto err_close;
> +	}
> +
> +	s->orig_termios =3D tty;
> +	s->termios_saved =3D true;
> +	speed =3D baud_to_speed(baud_rate);
> +
> +	if (!speed) {
> +		igt_debug("Serial: Unsupported baud rate %d\n", baud_rate);
> +		goto err_close;
> +	}
> +
> +	cfsetospeed(&tty, speed);
> +	cfsetispeed(&tty, speed);
> +
> +	/* 8N1: 8 data bits, no parity, 1 stop bit */
> +	tty.c_cflag &=3D ~PARENB;
> +	tty.c_cflag &=3D ~CSTOPB;
> +	tty.c_cflag &=3D ~CSIZE;
> +	tty.c_cflag |=3D CS8;
> +	tty.c_cflag &=3D ~CRTSCTS;
> +	tty.c_cflag |=3D CREAD | CLOCAL;
> +
> +	/* Disable canonical mode, echo, and signals */
> +	tty.c_lflag &=3D ~(ICANON | ECHO | ECHOE | ISIG);
> +
> +	/* Disable output post-processing */
> +	tty.c_oflag &=3D ~OPOST;
> +
> +	/* Disable software flow control and input translations */
> +	tty.c_iflag &=3D ~(IXON | IXOFF | IXANY);
> +	tty.c_iflag &=3D ~(IGNBRK | BRKINT | PARMRK | ISTRIP |
> +			  INLCR | IGNCR | ICRNL);
> +
> +	/*
> +	 * Blocking read with timeout.
> +	 * VMIN=3D0, VTIME>0: return after timeout or when data available.
> +	 */
> +	tty.c_cc[VMIN] =3D 0;
> +	tty.c_cc[VTIME] =3D s->read_timeout_ds;
> +
> +	if (tcsetattr(s->fd, TCSANOW, &tty) !=3D 0) {
> +		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
> +		goto err_close;
> +	}
> +
> +	/* Flush any stale input */
> +	if (tcflush(s->fd, TCIFLUSH) !=3D 0)
> +		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
> +
> +	igt_debug("Serial: Opened %s at %d baud (timeout=3D%dms)\n",
> +		  s->device, baud_rate, s->read_timeout_ds * 100);
> +	return s;
> +
> +err_close:
> +	close(s->fd);
> +err_free_device:
> +	free(s->device);
> +err_free:
> +	free(s);
> +	return NULL;
> +}
> +
> +/**
> + * igt_serial_close:
> + * @s: serial handle
> + *
> + * Closes the serial port and frees resources.
> + */
> +void igt_serial_close(struct igt_serial *s)
> +{
> +	if (!s)
> +		return;
> +
> +	if (s->termios_saved) {
> +		if (tcsetattr(s->fd, TCSANOW, &s->orig_termios) !=3D 0)
> +			igt_debug("Serial: tcsetattr restore failed: %s\n",
> +				  strerror(errno));
> +	}
> +
> +	if (s->fd >=3D 0)
> +		close(s->fd);
> +	igt_debug("Serial: Closed %s\n", s->device ? s->device : "(unknown)");
> +	free(s->device);
> +	free(s);
> +}
> +
> +/**
> + * igt_serial_set_timeout:
> + * @s: serial handle
> + * @timeout_ms: timeout in milliseconds (0 enables polling mode)
> + *
> + * Sets the read timeout for the serial port. VTIME has a granularity
> + * of 100 ms (deciseconds); non-zero values are rounded up. Setting
> + * @timeout_ms to 0 configures polling mode where reads return
> + * immediately if no data is available.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms)
> +{
> +	struct termios tty;
> +	int new_timeout_ds;
> +
> +	if (!s || timeout_ms < 0)
> +		return false;
> +
> +	if (tcgetattr(s->fd, &tty) !=3D 0) {
> +		igt_debug("Serial: tcgetattr failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +
> +	/* Convert ms to deciseconds (0.1s units), clamp to cc_t max (255) */
> +	new_timeout_ds =3D (timeout_ms + 99) / 100;
> +	if (new_timeout_ds > 255)
> +		new_timeout_ds =3D 255;
> +
> +	tty.c_cc[VTIME] =3D new_timeout_ds;
> +
> +	if (tcsetattr(s->fd, TCSANOW, &tty) !=3D 0) {
> +		igt_debug("Serial: tcsetattr failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +	s->read_timeout_ds =3D new_timeout_ds;
> +	igt_debug("Serial: Timeout set to %dms (applied %dms)\n",
> +		  timeout_ms, s->read_timeout_ds * 100);
> +	return true;
> +}
> +
> +/**
> + * igt_serial_send:
> + * @s: serial handle
> + * @cmd: command string to send
> + *
> + * Sends a command string to the serial port exactly as provided.
> + * The caller is responsible for adding any required line endings.
> + * Handles short writes that may occur on USB-CDC devices under load.
> + *
> + * Returns: true on success, false on failure.
> + */
> +bool igt_serial_send(struct igt_serial *s, const char *cmd)
> +{
> +	size_t len, total =3D 0;
> +	ssize_t written;
> +
> +	if (!s || !cmd)
> +		return false;
> +
> +	len =3D strlen(cmd);
> +	if (len =3D=3D 0)
> +		return true;
> +
> +	while (total < len) {
> +		written =3D write(s->fd, cmd + total, len - total);
> +		if (written <=3D 0) {
> +			if (written < 0 && errno =3D=3D EINTR)
> +				continue;
> +			igt_debug("Serial: Write failed: %s\n",
> +				  written < 0 ? strerror(errno) : "zero bytes written");
> +			return false;
> +		}
> +		total +=3D written;
> +	}
> +
> +	if (tcdrain(s->fd) !=3D 0) {
> +		igt_debug("Serial: tcdrain failed: %s\n", strerror(errno));
> +		return false;
> +	}
> +
> +	igt_debug("Serial: Sent '%s'\n", cmd);
> +	return true;
> +}
> +
> +/*
> + * igt_serial_readline - Read a line from serial port (until newline or =
timeout).
> + *
> + * Returns number of bytes in buf (0 means timeout/no data), or -1 on er=
ror.
> + */
> +static ssize_t igt_serial_readline(struct igt_serial *s, char *buf, size=
_t size)
> +{
> +	size_t total =3D 0;
> +	ssize_t n;
> +
> +	if (!s || !buf || size =3D=3D 0)
> +		return -1;
> +
> +	/*
> +	 * Read one byte at a time until newline or timeout.
> +	 * VTIME timeout ensures read() returns 0 on timeout.
> +	 */
> +	while (total < size - 1) {
> +		n =3D read(s->fd, buf + total, 1);
> +		if (n < 0) {
> +			if (errno =3D=3D EINTR)
> +				continue;
> +			igt_debug("Serial: Read error: %s\n", strerror(errno));
> +			return -1;
> +		}
> +		if (n =3D=3D 0)
> +			break;
> +
> +		total++;
> +
> +		if (buf[total - 1] =3D=3D '\n')
> +			break;
> +	}
> +
> +	buf[total] =3D '\0';
> +	return (ssize_t)total;
> +}
> +
> +/**
> + * igt_serial_read:
> + * @s: serial handle
> + * @buf: buffer to read into
> + * @size: size of buffer
> + *
> + * Reads one line (up to newline or timeout) from the serial port.
> + * This is a line-oriented read, not an arbitrary byte read =E2=80=94 it=
 stops
> + * at the first newline character or when the VTIME timeout expires.
> + * Use igt_serial_set_timeout() to adjust the timeout before calling.
> + *
> + * Returns: Number of bytes read, 0 on timeout/no data, or -1 on error.
> + */
> +ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size)
> +{
> +	ssize_t n;
> +
> +	n =3D igt_serial_readline(s, buf, size);
> +
> +	igt_debug("Serial: Read %zd bytes: '%s'\n", n, n > 0 ? buf : "");
> +	return n;
> +}
> +
> +/**
> + * igt_serial_command:
> + * @s: serial handle
> + * @cmd: command string to send
> + * @response: buffer for response
> + * @resp_size: size of response buffer
> + *
> + * Convenience function to send a command and read the response.
> + * Flushes stale input before sending, sends the command, then reads
> + * one response line. If @response is non-NULL, at least one byte must
> + * be received before the configured VTIME timeout for success.
> + *
> + * Returns: true if the send succeeded and, when @response is given,
> + * at least one response byte was received; false otherwise.
> + */
> +bool igt_serial_command(struct igt_serial *s, const char *cmd,
> +			char *response, size_t resp_size)
> +{
> +	ssize_t n;
> +
> +	if (!s || !cmd)
> +		return false;
> +
> +	igt_serial_flush(s);
> +
> +	if (!igt_serial_send(s, cmd))
> +		return false;
> +
> +	if (response && resp_size > 0) {
> +		n =3D igt_serial_readline(s, response, resp_size);
> +		if (n <=3D 0) {
> +			igt_debug("Serial: No response received\n");
> +			return false;
> +		}
> +		igt_debug("Serial: Response: '%s'\n", response);
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * igt_serial_flush:
> + * @s: serial handle
> + *
> + * Discards stale input. Does not touch pending output.
> + * Calls TCIFLUSH to drop kernel-queued input, then temporarily sets
> + * O_NONBLOCK and drains any bytes already readable to reduce races
> + * with in-flight input. Assumes single-threaded access.
> + */
> +void igt_serial_flush(struct igt_serial *s)
> +{
> +	char discard[256];
> +	ssize_t n;
> +	int flags;
> +
> +	if (!s)
> +		return;
> +
> +	/* Discard kernel-queued input; never touch pending output */
> +	if (tcflush(s->fd, TCIFLUSH) !=3D 0)
> +		igt_debug("Serial: tcflush failed: %s\n", strerror(errno));
> +
> +	/* Drain bytes already readable to reduce races with in-flight input */
> +	flags =3D fcntl(s->fd, F_GETFL);
> +	if (flags < 0) {
> +		igt_debug("Serial: fcntl(F_GETFL) failed: %s\n", strerror(errno));
> +		return;
> +	}
> +
> +	if (fcntl(s->fd, F_SETFL, flags | O_NONBLOCK) < 0) {
> +		igt_debug("Serial: fcntl(F_SETFL) failed: %s\n", strerror(errno));
> +		return;
> +	}
> +
> +	for (;;) {
> +		n =3D read(s->fd, discard, sizeof(discard));
> +		if (n > 0)
> +			continue;
> +		if (n =3D=3D 0)
> +			break;
> +		/* n < 0 */
> +		if (errno =3D=3D EINTR)
> +			continue;
> +		if (errno !=3D EAGAIN)
> +			igt_debug("Serial: unexpected read error in flush: %s\n",
> +				  strerror(errno));
> +		break;
> +	}
> +
> +	if (fcntl(s->fd, F_SETFL, flags) < 0)
> +		igt_debug("Serial: fcntl(F_SETFL) restore failed: %s\n", strerror(errn=
o));
> +
> +	igt_debug("Serial: Flushed\n");
> +}
> +
> +/**
> + * igt_serial_get_fd:
> + * @s: serial handle
> + *
> + * Gets the underlying file descriptor for advanced operations.
> + *
> + * Returns: File descriptor, or -1 if handle is NULL.
> + */
> +int igt_serial_get_fd(struct igt_serial *s)
> +{
> +	return s ? s->fd : -1;
> +}
> diff --git a/lib/igt_serial.h b/lib/igt_serial.h
> new file mode 100644
> index 000000000..b460fbf16
> --- /dev/null
> +++ b/lib/igt_serial.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_SERIAL_H
> +#define IGT_SERIAL_H
> +
> +#include <stdbool.h>
> +#include <stddef.h>
> +#include <sys/types.h>
> +
> +/**
> + * IGT_SERIAL_DEFAULT_TIMEOUT_MS:
> + *
> + * Default timeout for serial read operations in milliseconds.
> + */
> +#define IGT_SERIAL_DEFAULT_TIMEOUT_MS 1000
> +
> +struct igt_serial;
> +
> +struct igt_serial *igt_serial_open(const char *device, int baud_rate);
> +void igt_serial_close(struct igt_serial *s);
> +bool igt_serial_set_timeout(struct igt_serial *s, int timeout_ms);
> +bool igt_serial_send(struct igt_serial *s, const char *cmd);
> +ssize_t igt_serial_read(struct igt_serial *s, char *buf, size_t size);
> +bool igt_serial_command(struct igt_serial *s, const char *cmd,
> +			char *response, size_t resp_size);
> +void igt_serial_flush(struct igt_serial *s);
> +int igt_serial_get_fd(struct igt_serial *s);
> +
> +#endif /* IGT_SERIAL_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 5e34ce631..26e7015d2 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -122,6 +122,7 @@ lib_sources =3D [
>  	'igt_msm.c',
>  	'igt_dsc.c',
>  	'igt_hook.c',
> +	'igt_serial.c',
>  	'xe/xe_gt.c',
>  	'xe/xe_ioctl.c',
>  	'xe/xe_legacy.c',

--=20
Jani Nikula, Intel
