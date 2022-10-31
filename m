Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BD3310E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:24:48 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 12:24:28 +0200
Message-Id: <20221031102434.2250160-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/7] lib/runnercomms: Structured
 communication from tests to igt_runner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of letting the tests output their logs as text and parsing
that in the runner during and after test execution, introduce a
structured log format that is passed through a UNIX datagram socket.

This patch only introduces the datagram format and helpers for
creating/reading them. Key points about the format:

It's binary, and has some amount of forwards and backwards
compatibility. Passing through UNIX datagram sockets makes the
communication atomic which avoids message interleaving between child
process logging. (Threaded logging already gets correct serialization
through the use of a mutex, no change there.)

Having atomic logging also gives the possibility of igt_runner
injecting messages into test logs without having to worry whether the
stdout pipe is still in the middle of printing a subtest completion
message for example.

On-disk storage of datagrams will use a canary chunk to verify
correctly sized reads of datagrams, and to ensure that the endianness
of the reader and the dump match.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/meson.build   |   1 +
 lib/runnercomms.c | 635 ++++++++++++++++++++++++++++++++++++++++++++++
 lib/runnercomms.h | 259 +++++++++++++++++++
 3 files changed, 895 insertions(+)
 create mode 100644 lib/runnercomms.c
 create mode 100644 lib/runnercomms.h

diff --git a/lib/meson.build b/lib/meson.build
index 4b6d2267..9283aa9c 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -67,6 +67,7 @@ lib_sources = [
 	'rendercopy_gen7.c',
 	'rendercopy_gen8.c',
 	'rendercopy_gen9.c',
+	'runnercomms.c',
 	'sw_sync.c',
 	'intel_aux_pgtable.c',
 	'intel_reg_map.c',
diff --git a/lib/runnercomms.c b/lib/runnercomms.c
new file mode 100644
index 00000000..344312bd
--- /dev/null
+++ b/lib/runnercomms.c
@@ -0,0 +1,635 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#include <assert.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <unistd.h>
+
+#include "igt_aux.h"
+#include "runnercomms.h"
+
+/**
+ * SECTION:runnercomms
+ * @short_description: Structured communication to igt_runner
+ * @title: runnercomms
+ * @include: runnercomms.h
+ *
+ * This library provides means for the tests to communicate to
+ * igt_runner with a formally specified protocol, avoiding
+ * shortcomings and pain points of text-based communication.
+ */
+
+static sig_atomic_t runner_socket_fd = -1;
+
+/**
+ * set_runner_socket:
+ * @fd: socket connected to runner
+ *
+ * If the passed fd is a valid socket, globally sets it to be the fd
+ * to use to talk to igt_runner.
+ */
+void set_runner_socket(int fd)
+{
+	struct stat sb;
+
+	if (fstat(fd, &sb))
+		return;
+
+	if (!S_ISSOCK(sb.st_mode))
+		return;
+
+	/*
+	 * We only sanity-check that the fd is a socket. We don't
+	 * check that it's a datagram socket etc.
+	 */
+
+	runner_socket_fd = fd;
+}
+
+/**
+ * runner_connected:
+ *
+ * Returns whether set_runner_socket has been called with a valid
+ * socket fd. Note: Will be true forever after that point. This
+ * function is used to mainly determine whether log strings will be
+ * output to the socket or to stdout/stderr and that cannot be changed
+ * even if the socket is lost midway.
+ */
+bool runner_connected(void)
+{
+	return runner_socket_fd >= 0;
+}
+
+/**
+ * send_to_runner:
+ * @packet: packet to send
+ *
+ * Sends the given communications packet to igt_runner. Calls free()
+ * on the packet, don't reuse it.
+ */
+void send_to_runner(struct runnerpacket *packet)
+{
+	if (runner_connected())
+		write(runner_socket_fd, packet, packet->size);
+	free(packet);
+}
+
+/* If enough data left, copy the data to dst, advance p, reduce size */
+static void read_integer(void* dst, size_t bytes, const char **p, uint32_t *size)
+{
+	if (*size < bytes) {
+		*size = 0;
+		return;
+	}
+
+	memcpy(dst, *p, bytes);
+	*p += bytes;
+	*size -= bytes;
+}
+
+/* If nul-termination can be found, set dststr to point to the cstring, advance p, reduce size */
+static void read_cstring(const char **dststr, const char **p, uint32_t *size)
+{
+	const char *end;
+
+	end = memchr(*p, '\0', *size);
+	if (end == NULL) {
+		*size = 0;
+		return;
+	}
+
+	*dststr = *p;
+	*size -= end - *p + 1;
+	*p = end + 1;
+}
+
+/**
+ * read_runnerpacket:
+ * @packet: runner communications packet to read
+ *
+ * Checks that the internal data of the communications packet is valid
+ * and the contents can safely be inspected without further checking
+ * for out-of-bounds etc. Constructs a runnerpacket_read_helper which
+ * will, for c-style strings, point to various sub-values directly in
+ * the #data field within @packet. Those are valid only as long as
+ * @packet is valid.
+ *
+ * Returns: An appropriately constructed runnerpacket_read_helper. On
+ * data validation errors, the #type of the returned value will be
+ * #PACKETTYPE_INVALID.
+ */
+runnerpacket_read_helper read_runnerpacket(const struct runnerpacket *packet)
+{
+	runnerpacket_read_helper ret = {};
+	uint32_t sizeleft;
+	const char *p;
+
+	if (packet->size < sizeof(*packet)) {
+		ret.type = PACKETTYPE_INVALID;
+		return ret;
+	}
+
+	ret.type = packet->type;
+	sizeleft = packet->size - sizeof(*packet);
+	p = packet->data;
+
+	switch (packet->type) {
+	case PACKETTYPE_LOG:
+		read_integer(&ret.log.stream, sizeof(ret.log.stream), &p, &sizeleft);
+		read_cstring(&ret.log.text, &p, &sizeleft);
+
+		if (ret.log.text == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_EXEC:
+		read_cstring(&ret.exec.cmdline, &p, &sizeleft);
+
+		if (ret.exec.cmdline == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_EXIT:
+		read_integer(&ret.exit.exitcode, sizeof(ret.exit.exitcode), &p, &sizeleft);
+		read_cstring(&ret.exit.timeused, &p, &sizeleft);
+
+		break;
+	case PACKETTYPE_SUBTEST_START:
+		read_cstring(&ret.subteststart.name, &p, &sizeleft);
+
+		if (ret.subteststart.name == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_SUBTEST_RESULT:
+		read_cstring(&ret.subtestresult.name, &p, &sizeleft);
+		read_cstring(&ret.subtestresult.result, &p, &sizeleft);
+		read_cstring(&ret.subtestresult.timeused, &p, &sizeleft);
+		read_cstring(&ret.subtestresult.reason, &p, &sizeleft);
+
+		if (ret.subtestresult.name == NULL ||
+		    ret.subtestresult.result == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_DYNAMIC_SUBTEST_START:
+		read_cstring(&ret.dynamicsubteststart.name, &p, &sizeleft);
+
+		if (ret.dynamicsubteststart.name == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_DYNAMIC_SUBTEST_RESULT:
+		read_cstring(&ret.dynamicsubtestresult.name, &p, &sizeleft);
+		read_cstring(&ret.dynamicsubtestresult.result, &p, &sizeleft);
+		read_cstring(&ret.dynamicsubtestresult.timeused, &p, &sizeleft);
+		read_cstring(&ret.dynamicsubtestresult.reason, &p, &sizeleft);
+
+		if (ret.dynamicsubtestresult.name == NULL ||
+		    ret.dynamicsubtestresult.result == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_VERSIONSTRING:
+		read_cstring(&ret.versionstring.text, &p, &sizeleft);
+
+		if (ret.versionstring.text == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	case PACKETTYPE_RESULT_OVERRIDE:
+		read_cstring(&ret.resultoverride.result, &p, &sizeleft);
+
+		if (ret.resultoverride.result == NULL)
+			ret.type = PACKETTYPE_INVALID;
+
+		break;
+	default:
+		ret.type = PACKETTYPE_INVALID;
+		break;
+	}
+
+	return ret;
+}
+
+struct runnerpacket *runnerpacket_log(uint8_t stream, const char *text)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + sizeof(stream) + strlen(text) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_LOG;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	memcpy(p, &stream, sizeof(stream));
+	p += sizeof(stream);
+
+	strcpy(p, text);
+	p += strlen(text) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_exec(char **argv)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+	int i;
+
+	size = sizeof(struct runnerpacket);
+
+	for (i = 0; argv[i] != NULL; i++)
+		size += strlen(argv[i]) + 1; // followed by a space of \0 so +1 either way for each
+
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_EXEC;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	for (i = 0; argv[i] != NULL; i++) {
+		if (i != 0)
+			*p++ = ' ';
+
+		strcpy(p, argv[i]);
+		p += strlen(argv[i]);
+	}
+	p[0] = '\0';
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_exit(int32_t exitcode, const char *timeused)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + sizeof(exitcode) + strlen(timeused) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_EXIT;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	memcpy(p, &exitcode, sizeof(exitcode));
+	p += sizeof(exitcode);
+
+	strcpy(p, timeused);
+	p += strlen(timeused) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_subtest_start(const char *name)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + strlen(name) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_SUBTEST_START;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, name);
+	p += strlen(name) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_subtest_result(const char *name, const char *result,
+						 const char *timeused, const char *reason)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	if (reason == NULL)
+		reason = "";
+
+	size = sizeof(struct runnerpacket) + strlen(name) + strlen(result) + strlen(timeused) + strlen(reason) + 4;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_SUBTEST_RESULT;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, name);
+	p += strlen(name) + 1;
+
+	strcpy(p, result);
+	p += strlen(result) + 1;
+
+	strcpy(p, timeused);
+	p += strlen(timeused) + 1;
+
+	strcpy(p, reason);
+	p += strlen(reason) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_dynamic_subtest_start(const char *name)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + strlen(name) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_DYNAMIC_SUBTEST_START;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, name);
+	p += strlen(name) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_dynamic_subtest_result(const char *name, const char *result,
+							 const char *timeused, const char *reason)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	if (reason == NULL)
+		reason = "";
+
+	size = sizeof(struct runnerpacket) + strlen(name) + strlen(result) + strlen(timeused) + strlen(reason) + 4;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_DYNAMIC_SUBTEST_RESULT;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, name);
+	p += strlen(name) + 1;
+
+	strcpy(p, result);
+	p += strlen(result) + 1;
+
+	strcpy(p, timeused);
+	p += strlen(timeused) + 1;
+
+	strcpy(p, reason);
+	p += strlen(reason) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_versionstring(const char *text)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + strlen(text) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_VERSIONSTRING;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, text);
+	p += strlen(text) + 1;
+
+	return packet;
+}
+
+struct runnerpacket *runnerpacket_resultoverride(const char *result)
+{
+	struct runnerpacket *packet;
+	uint32_t size;
+	char *p;
+
+	size = sizeof(struct runnerpacket) + strlen(result) + 1;
+	packet = malloc(size);
+
+	packet->size = size;
+	packet->type = PACKETTYPE_RESULT_OVERRIDE;
+	packet->senderpid = getpid();
+	packet->sendertid = gettid();
+
+	p = packet->data;
+
+	strcpy(p, result);
+	p += strlen(result) + 1;
+
+	return packet;
+}
+
+uint32_t socket_dump_canary(void)
+{
+	return 'I' << 24 | 'G' << 16 | 'T' << 8 | '1';
+}
+
+void log_to_runner_sig_safe(const char *str, size_t len)
+{
+	size_t prlen = len;
+
+	struct runnerpacket_log_sig_safe p = {
+					      .size = sizeof(struct runnerpacket) + sizeof(uint8_t),
+					      .type = PACKETTYPE_LOG,
+					      .senderpid = getpid(),
+					      .sendertid = 0, /* gettid() not signal safe */
+					      .stream = STDERR_FILENO,
+	};
+
+	if (len > sizeof(p.data) - 1)
+		prlen = sizeof(p.data) - 1;
+	memcpy(p.data, str, prlen);
+	p.size += prlen + 1;
+
+	write(runner_socket_fd, &p, p.size);
+
+	len -= prlen;
+	if (len)
+		log_to_runner_sig_safe(str + prlen, len);
+}
+
+/**
+ * comms_read_dump:
+ * @fd: Open fd to a comms dump file
+ * @visitor: Collection of packet handlers
+ *
+ * Reads a comms dump file, calling specified handler functions for
+ * individual packets.
+ *
+ * Returns: #COMMSPARSE_ERROR for failures reading or parsing the
+ * dump, #COMMSPARSE_EMPTY for empty dumps (no comms used),
+ * #COMMSPARSE_SUCCESS for successful read.
+ */
+int comms_read_dump(int fd, struct comms_visitor *visitor)
+{
+	struct stat statbuf;
+	char *buf, *bufend, *p;
+	int ret = COMMSPARSE_EMPTY;
+	bool cont = true;
+
+	if (fd < 0)
+		return COMMSPARSE_EMPTY;
+
+	if (fstat(fd, &statbuf))
+		return COMMSPARSE_ERROR;
+
+	if (statbuf.st_size == 0)
+		return COMMSPARSE_ERROR;
+
+	buf = mmap(NULL, statbuf.st_size, PROT_READ, MAP_SHARED, fd, 0);
+	if (buf == MAP_FAILED)
+		return COMMSPARSE_ERROR;
+
+	bufend = buf + statbuf.st_size;
+	p = buf;
+
+	while (p != NULL && p != bufend && cont) {
+		const struct runnerpacket *packet;
+		runnerpacket_read_helper helper;
+
+		if (bufend - p >= sizeof(uint32_t)) {
+			uint32_t canary;
+
+			memcpy(&canary, p, sizeof(canary));
+			if (canary != socket_dump_canary()) {
+				fprintf(stderr,
+					"Invalid canary while parsing comms: %"PRIu32", expected %"PRIu32"\n",
+					canary, socket_dump_canary());
+				munmap(buf, statbuf.st_size);
+				return COMMSPARSE_ERROR;
+			}
+		}
+		p += sizeof(uint32_t);
+
+		if (bufend -p < sizeof(struct runnerpacket)) {
+			fprintf(stderr,
+				"Error parsing comms: Expected runnerpacket after canary, truncated file?\n");
+			munmap(buf, statbuf.st_size);
+			return COMMSPARSE_ERROR;
+		}
+
+		packet = (struct runnerpacket *)p;
+		if (bufend -p < packet->size) {
+			fprintf(stderr,
+				"Error parsing comms: Unexpected end of file, truncated file?\n");
+			munmap(buf, statbuf.st_size);
+			return COMMSPARSE_ERROR;
+		}
+		p += packet->size;
+
+		/*
+		 * Runner sends EXEC itself before executing the test.
+		 * If we get other types, it indicates the test really
+		 * uses socket comms.
+		 */
+		if (packet->type != PACKETTYPE_EXEC)
+			ret = COMMSPARSE_SUCCESS;
+
+		switch (packet->type) {
+		case PACKETTYPE_INVALID:
+			printf("Warning: Unknown packet type %"PRIu32", skipping\n", packet->type);
+			break;
+		case PACKETTYPE_LOG:
+			if (visitor->log) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->log(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_EXEC:
+			if (visitor->exec) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->exec(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_EXIT:
+			if (visitor->exit) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->exit(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_SUBTEST_START:
+			if (visitor->subtest_start) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->subtest_start(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_SUBTEST_RESULT:
+			if (visitor->subtest_result) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->subtest_result(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_DYNAMIC_SUBTEST_START:
+			if (visitor->dynamic_subtest_start) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->dynamic_subtest_start(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_DYNAMIC_SUBTEST_RESULT:
+			if (visitor->dynamic_subtest_result) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->dynamic_subtest_result(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_VERSIONSTRING:
+			if (visitor->versionstring) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->versionstring(packet, helper, visitor->userdata);
+			}
+			break;
+		case PACKETTYPE_RESULT_OVERRIDE:
+			if (visitor->result_override) {
+				helper = read_runnerpacket(packet);
+				cont = visitor->result_override(packet, helper, visitor->userdata);
+			}
+			break;
+		default:
+			printf("Warning: Unknown packet type %"PRIu32"\n", helper.type);
+			break;
+		}
+	}
+
+	munmap(buf, statbuf.st_size);
+	return cont ? ret : COMMSPARSE_ERROR;
+}
diff --git a/lib/runnercomms.h b/lib/runnercomms.h
new file mode 100644
index 00000000..0bc30818
--- /dev/null
+++ b/lib/runnercomms.h
@@ -0,0 +1,259 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2022 Intel Corporation
+ */
+
+#ifndef IGT_RUNNERCOMMS_H
+#define IGT_RUNNERCOMMS_H
+
+#include <stdbool.h>
+#include <stddef.h>
+#include <stdint.h>
+
+/*
+ * A flat struct that can and will be directly dumped to
+ * disk. Constructed with runnerpacket_<type>() helper functions.
+ */
+struct runnerpacket {
+	uint32_t size; /* Full size of the packet in octets */
+	uint32_t type; /* runnerpacket_type, but fixed width */
+	int32_t senderpid;
+	int32_t sendertid;
+
+	char data[];
+} __attribute__((packed));
+
+_Static_assert(sizeof(struct runnerpacket) == 4 * 4, "runnerpacket structure must not change");
+_Static_assert(offsetof(struct runnerpacket, data) == 4 * 4, "runnerpacket structure must not change");
+
+/*
+ * A helper for reading and parsing runnerpacket structs. Fields will
+ * point directly into the data field of an existing runnerpacket
+ * object. Constructed with read_runnerpacket().
+ *
+ * Some fields can be left as 0 / NULL / some other applicable invalid
+ * value in the case of having older dumps read with binaries that
+ * have extended the data formats.
+ */
+typedef union runnerpacket_read_helper {
+	/*
+	 * All other fields must begin with "uint32_t type" so it's a
+	 * common initial sequence, safe to read no matter what union
+	 * field is active.
+	 */
+	uint32_t type;
+
+	struct {
+		uint32_t type;
+
+		uint8_t stream;
+		const char *text;
+	} log;
+
+	struct {
+		uint32_t type;
+
+		const char *cmdline;
+	} exec;
+
+	struct {
+		uint32_t type;
+
+		int32_t exitcode;
+		const char *timeused;
+	} exit;
+
+	struct {
+		uint32_t type;
+
+		const char *name;
+	} subteststart;
+
+	struct {
+		uint32_t type;
+
+		const char *name;
+		const char *result;
+		const char *timeused;
+		const char *reason;
+	} subtestresult;
+
+	struct {
+		uint32_t type;
+
+		const char *name;
+	} dynamicsubteststart;
+
+	struct {
+		uint32_t type;
+
+		const char *name;
+		const char *result;
+		const char *timeused;
+		const char *reason;
+	} dynamicsubtestresult;
+
+	struct {
+		uint32_t type;
+
+		const char *text;
+	} versionstring;
+
+	struct {
+		uint32_t type;
+
+		const char *result;
+	} resultoverride;
+} runnerpacket_read_helper;
+
+void set_runner_socket(int fd);
+bool runner_connected(void);
+void send_to_runner(struct runnerpacket *packet);
+
+runnerpacket_read_helper read_runnerpacket(const struct runnerpacket *packet);
+
+/*
+ * All packet types must document the format of the data[] array. The
+ * notation used is
+ *
+ * Explanation of the packet
+ * type: explanation of values
+ * type2: explanation of values
+ * (etc)
+ *
+ * The type "cstring" can be used to denote that the content is a
+ * nul-terminated string.
+ */
+enum runnerpacket_type {
+      PACKETTYPE_INVALID,
+      /* No data. This type is only used on parse failures and such. */
+
+      PACKETTYPE_LOG,
+      /*
+       * Normal log message.
+       * uint8_t: 1 = stdout, 2 = stderr
+       * cstring: Log text
+       */
+
+      PACKETTYPE_EXEC,
+      /*
+       * Command line executed. Sent by runner before calling exec().
+       * cstring: command line as one string, argv[0] included, space separated
+       */
+
+      PACKETTYPE_EXIT,
+      /*
+       * Process exit. Written by runner.
+       * int32_t: exitcode
+       * cstring: Time taken by the process from exec to exit, as a floating point value in seconds, as text
+       */
+
+      PACKETTYPE_SUBTEST_START,
+      /*
+       * Subtest begins.
+       * cstring: Name of the subtest
+       */
+
+      PACKETTYPE_SUBTEST_RESULT,
+      /*
+       * Subtest ends. Can appear without a corresponding SUBTEST_START packet.
+       * cstring: Name of the subtest
+       * cstring: Result of the subtest
+       * cstring: Time taken by the subtest, as a floating point value in seconds, as text
+       * cstring: If len > 0, the reason for the subtest result (fail/skip)
+       */
+
+      PACKETTYPE_DYNAMIC_SUBTEST_START,
+      /*
+       * Dynamic subtest begins.
+       * cstring: Name of the dynamic subtest
+       */
+
+      PACKETTYPE_DYNAMIC_SUBTEST_RESULT,
+      /*
+       * Dynamic subtest ends.
+       * cstring: Name of the dynamic subtest
+       * cstring: Result of the dynamic subtest
+       * cstring: Time taken by the dynamic subtest, as a floating point value in seconds, as text
+       * cstring: If len > 0, the reason for the dynamic subtest result (fail/skip)
+       */
+
+      PACKETTYPE_VERSIONSTRING,
+      /*
+       * Version of the running test
+       * cstring: Version string
+       */
+
+      PACKETTYPE_RESULT_OVERRIDE,
+      /*
+       * Override the result of the most recently started test/subtest/dynamic subtest. Used for timeout and abort etc.
+       * cstring: The result to use, as text. All lowercase.
+       */
+
+
+      PACKETTYPE_NUM_TYPES /* must be last */
+};
+
+struct runnerpacket *runnerpacket_log(uint8_t stream, const char *text);
+struct runnerpacket *runnerpacket_exec(char **argv);
+struct runnerpacket *runnerpacket_exit(int32_t exitcode, const char *timeused);
+struct runnerpacket *runnerpacket_subtest_start(const char *name);
+struct runnerpacket *runnerpacket_subtest_result(const char *name, const char *result,
+						 const char *timeused, const char *reason);
+struct runnerpacket *runnerpacket_dynamic_subtest_start(const char *name);
+struct runnerpacket *runnerpacket_dynamic_subtest_result(const char *name, const char *result,
+							 const char *timeused, const char *reason);
+struct runnerpacket *runnerpacket_versionstring(const char *text);
+struct runnerpacket *runnerpacket_resultoverride(const char *result);
+
+uint32_t socket_dump_canary(void);
+
+struct runnerpacket_log_sig_safe {
+	uint32_t size;
+	uint32_t type;
+	int32_t senderpid;
+	int32_t sendertid;
+
+	uint8_t stream;
+	char data[128];
+} __attribute__((packed));
+
+_Static_assert(offsetof(struct runnerpacket_log_sig_safe, stream) == 4 * 4, "signal-safe log runnerpacket must be compatible");
+_Static_assert(offsetof(struct runnerpacket_log_sig_safe, data) == 4 * 4 + 1, "signal-safe log runnerpacket must be compatible");
+
+void log_to_runner_sig_safe(const char *str, size_t len);
+
+/*
+ * Comms dump reader
+ *
+ * A visitor for reading comms dump files. Calls handlers if
+ * corresponding handler is set. Reading stops if a handler returns
+ * false.
+ *
+ * The passed arguments are the packet itself, the already-constructed
+ * read helper, and the userdata pointer from the visitor.
+ */
+typedef bool (*handler_t)(const struct runnerpacket *, runnerpacket_read_helper, void *userdata);
+
+struct comms_visitor {
+	handler_t log;
+	handler_t exec;
+	handler_t exit;
+	handler_t subtest_start;
+	handler_t subtest_result;
+	handler_t dynamic_subtest_start;
+	handler_t dynamic_subtest_result;
+	handler_t versionstring;
+	handler_t result_override;
+
+	void* userdata;
+};
+
+enum {
+	COMMSPARSE_ERROR,
+	COMMSPARSE_EMPTY,
+	COMMSPARSE_SUCCESS
+};
+int comms_read_dump(int fd, struct comms_visitor *visitor);
+
+#endif
-- 
2.30.2
