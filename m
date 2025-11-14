Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D4A7CE7AA8
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 10:08:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69CF10EA27;
	Fri, 14 Nov 2025 10:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JIqvjw7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA78110EA24
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 10:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763114878; x=1794650878;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=duhBWM2s8rC0gM0fVArYzVhRu3yc8EHVqQvCHHUUiKg=;
 b=JIqvjw7fkrf85KErWFfmn+PdiKPLpH3qxWXiF7uozVLBuuWR0Ck2W4+o
 Kdyv0RaAv8/ls8hRrtyQKeuWZ9IbRdFDCBhWibAB4X1fvVHHbOAFOSs8J
 qP1jTz+RJnAdA7aqKm3A7EyzrMrmxpahiLiAsmoTF4SdPjgH7Og47ZmDg
 WSeJhS5iPptBjZrY4BgHkjF/6XOcwS59gHnxG9t5lxuzRPpOrA/UOCD9n
 Mm4fUjubxn7wr+gSxKLnehHW3WLiS6LaFGZAJVs04+f9/ty7o6H/TZbxe
 0VApe8xsZyumMYL6lLOSWFkYs0ySH55gaghCnM/N6IIYZ2qC9kntZnXWm g==;
X-CSE-ConnectionGUID: ptLroxHgS0Oh1vPJ5l935A==
X-CSE-MsgGUID: S5ZgDSMDSS6LPZ4ozYDXDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="68832068"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="68832068"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:07:58 -0800
X-CSE-ConnectionGUID: xoqnWVhFQa2WBhfJFGBaFA==
X-CSE-MsgGUID: gX9aV+oqTHGBslvscXXX6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="189988736"
Received: from rkoppura-z790i-aorus-ultra.iind.intel.com ([10.190.239.17])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 02:07:55 -0800
From: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 Tauro Riana <riana.tauro@intel.com>,
 Iddamsetty Aravind <aravind.iddamsetty@intel.com>,
 Gupta Anshuman <anshuman.gupta@intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>
Subject: [PATCH v2] tools/drm_ras: tool to communicate with DRM Netlink
 Subsystem
Date: Fri, 14 Nov 2025 15:37:29 +0530
Message-Id: <20251114100729.102365-1-ravi.kishore.koppuravuri@intel.com>
X-Mailer: git-send-email 2.34.1
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

User space tool for querying GPU health monitoring RAS events via
Generic Netlink Socket interface from Kernel's DRM Netlink Subsystem.
Available Commands are
	- List Nodes
	- Get Error Counters
	- Query Error Counter

Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
Cc: Tauro Riana <riana.tauro@intel.com>
Cc: Iddamsetty Aravind <aravind.iddamsetty@intel.com>
Cc: Gupta Anshuman <anshuman.gupta@intel.com>
Cc: Vivi Rodrigo <rodrigo.vivi@intel.com>

---
V1 -> V2:
	- Removed device_id from the input parameters
	- Updated help() function
	- Incorporated error handling logic
---
---
 include/drm-uapi/drm_netlink.h |  79 +++++++
 meson.build                    |   5 +-
 tools/drm_ras.c                | 421 +++++++++++++++++++++++++++++++++
 tools/meson.build              |   5 +
 4 files changed, 509 insertions(+), 1 deletion(-)
 create mode 100644 include/drm-uapi/drm_netlink.h
 create mode 100644 tools/drm_ras.c

diff --git a/include/drm-uapi/drm_netlink.h b/include/drm-uapi/drm_netlink.h
new file mode 100644
index 000000000..af893aa36
--- /dev/null
+++ b/include/drm-uapi/drm_netlink.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
+/* Do not edit directly, auto-generated from: */
+/*	Documentation/netlink/specs/drm_ras.yaml */
+/* YNL-GEN uapi header */
+
+#ifndef _LINUX_DRM_RAS_H
+#define _LINUX_DRM_RAS_H
+
+#define DRM_RAS_GENL_NAME "drm-ras"
+#define DRM_RAS_FAMILY_VERSION	1
+
+/*
+ * Type of the node. Currently, only error-counter nodes are supported, which
+ * expose reliability counters for a hardware/software component.
+ */
+enum drm_ras_node_type {
+	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
+};
+
+enum {
+	/* Unique identifier for the node*/
+	DRM_RAS_NODE_ATTR_NODE_ID = 1,
+
+	/* Device name chosen by the driver at the time of registration */
+	DRM_RAS_NODE_ATTR_DEVICE_NAME,
+
+	/* Node name chosen by the driver at registration to identify RAS node inside the device */
+	DRM_RAS_NODE_ATTR_NODE_NAME,
+
+	/* Type of the node, identifying its function */
+	DRM_RAS_NODE_ATTR_NODE_TYPE,
+
+	__DRM_RAS_NODE_ATTR_MAX,
+	DRM_RAS_NODE_ATTR_MAX = (__DRM_RAS_NODE_ATTR_MAX - 1)
+};
+
+enum {
+	/* Node ID targeted by this error counter operation */
+	DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID = 1,
+
+	/* Unique identifier for a specific error counter within an node */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID,
+
+	/* Name of the requested error counter */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME,
+
+	/* Current value of the requested error counter */
+	DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE,
+
+	__DRM_RAS_ERROR_COUNTER_ATTR_MAX,
+	DRM_RAS_ERROR_COUNTER_ATTR_MAX = (__DRM_RAS_ERROR_COUNTER_ATTR_MAX - 1)
+};
+
+enum drm_genl_error_cmds {
+	/**
+	 * @DRM_RAS_CMD_LIST_NODES: Command to Retrieve the full list of currently registered
+	 * DRM RAS nodes.Each node includes its dynamically assigned ID, name, and type.
+	 * Obtain the Node IDs by calling this command and use it in the subsequent operations
+	 * on the nodes.
+	 */
+	DRM_RAS_CMD_LIST_NODES = 1,
+
+	/**
+	 * @DRM_RAS_CMD_GET_ERROR_COUNTERS: Retrieve the full list of error counters for a given
+	 * node. The response include id, name, and current value of each counter.
+	 */
+	DRM_RAS_CMD_GET_ERROR_COUNTERS,
+
+	/**
+	 * @DRM_RAS_CMD_QUERY_ERROR_COUNTER: Query the information of a specific error counter
+	 * for a given node. Response contains id, name, and current value of the counter.
+	 */
+	DRM_RAS_CMD_QUERY_ERROR_COUNTER,
+
+	__DRM_RAS_CMD_MAX,
+	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
+};
+
+#endif /* _LINUX_DRM_RAS_H */
diff --git a/meson.build b/meson.build
index db6e09a94..f7807660e 100644
--- a/meson.build
+++ b/meson.build
@@ -165,10 +165,13 @@ cairo = dependency('cairo', version : '>1.12.0', required : true)
 libudev = dependency('libudev', required : true)
 glib = dependency('glib-2.0', required : true)
 
+libnl = dependency('libnl-3.0', required: false)
+libnl_genl = dependency('libnl-genl-3.0', required: false)
+libnl_cli = dependency('libnl-cli-3.0', required:false)
+
 xmlrpc = dependency('xmlrpc', required : false)
 xmlrpc_util = dependency('xmlrpc_util', required : false)
 xmlrpc_client = dependency('xmlrpc_client', required : false)
-
 xmlrpc_cmd = find_program('xmlrpc-c-config', required : false)
 if not xmlrpc.found() and xmlrpc_cmd.found()
 	libs_cmd = run_command(xmlrpc_cmd, 'client', '--libs', check: false)
diff --git a/tools/drm_ras.c b/tools/drm_ras.c
new file mode 100644
index 000000000..bb7d0dfa0
--- /dev/null
+++ b/tools/drm_ras.c
@@ -0,0 +1,421 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/types.h>
+#include <unistd.h>
+#include <ctype.h>
+#include <getopt.h>
+#include <linux/genetlink.h>
+#include <netlink/netlink.h>
+#include <netlink/cache.h>
+#include <netlink/genl/genl.h>
+#include <netlink/genl/ctrl.h>
+#include <netlink/cli/utils.h>
+#include <netlink/cli/link.h>
+#include "../include/drm-uapi/drm_netlink.h"
+#include "igt_device_scan.h"
+
+#define ARRAY_SIZE(array) (sizeof(array) / sizeof((array)[0]))
+
+struct nl_sock *mcsock;
+
+enum opt_val {
+	OPT_UNKNOWN = '?',
+	OPT_END = -1,
+	OPT_NODEID,
+	OPT_ERRORID,
+	OPT_HELP,
+};
+
+enum cmd_ids {
+	INVALID_CMD = -1,
+	LIST_NODES = 0,
+	GET_ERROR_COUNTERS,
+	QUERY_ERROR_COUNTER,
+
+	__MAX_CMDS,
+};
+
+static const char * const cmd_names[] = {
+	"list_nodes",
+	"get_error_counters",
+	"query_error_counter",
+};
+
+struct app_context {
+	enum drm_genl_error_cmds command;
+	struct nl_sock *sock;
+	struct nl_cb *cb;
+	uint32_t node_id;
+	uint32_t error_id;
+	int error_id_set;
+	int node_id_set;
+	int error;
+	int family_id;
+};
+
+static void help(char **argv)
+{
+	int i;
+
+	printf("Usage: %s command [<command options>]\n", argv[0]);
+	printf("commands:\n");
+
+	for (i = 0; i < __MAX_CMDS; i++) {
+		switch (i) {
+		case LIST_NODES:
+			printf("%s %s\n",
+			       argv[0],
+			       cmd_names[i]);
+			break;
+		case GET_ERROR_COUNTERS:
+			printf("%s %s "
+				"--node-id=<node-id>\n",
+				argv[0],
+				cmd_names[i]);
+			break;
+		case QUERY_ERROR_COUNTER:
+			printf("%s %s "
+				"--node-id=<node-id> "
+				"--error-id=<error-id>\n",
+				argv[0],
+				cmd_names[i]);
+			break;
+		default:
+			printf("%s is Unknown Command\n",
+			       (i < __MAX_CMDS && cmd_names[i]) ? cmd_names[i] : "Unknown");
+		}
+	}
+}
+
+static int list_nodes_handler(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct nlattr *nla;
+	int len, remain;
+
+	len = GENL_HDRLEN;
+	nlmsg_for_each_attr(nla, nlh, len, remain) {
+		/* Validate whether the attribute is with in the range or not*/
+		if (nla_type(nla) > DRM_RAS_NODE_ATTR_MAX) {
+			printf("Unknown Node attribute type: %d\n", nla_type(nla));
+			return NL_SKIP;
+		}
+
+		switch (nla_type(nla)) {
+		case DRM_RAS_NODE_ATTR_NODE_ID:
+			printf("%-18u\t", nla_get_u32(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_DEVICE_NAME:
+			printf("%-30s\t", nla_get_string(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_NODE_NAME:
+			printf("%-30s\t", nla_get_string(nla));
+			break;
+		case DRM_RAS_NODE_ATTR_NODE_TYPE:
+			printf("%-18u\n", nla_get_u32(nla));
+			break;
+		default:
+			printf("Unknown attribute type: %d\n", nla_type(nla));
+			break;
+		}
+	}
+	return NL_OK;
+}
+
+static int query_error_counter(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct nlattr *attrs[256];
+	int ret;
+
+	/* Parse the attributes */
+	ret = genlmsg_parse(nlh, 0, attrs, 256, NULL);
+	if (ret < 0) {
+		fprintf(stderr, "Failed to parse attributes: %s\n", nl_geterror(ret));
+		return NL_SKIP;
+	}
+
+	if (!attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]) {
+		nl_cli_fatal(NLE_FAILURE, "DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE attribute is missing");
+		return NL_SKIP;
+	}
+
+	printf("counter value %u\n", nla_get_u32(attrs[DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE]));
+
+	return NL_OK;
+}
+
+static int get_error_counters(struct nl_msg *msg, void *arg)
+{
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct nlattr *nla;
+	int len, remain;
+
+	len = GENL_HDRLEN;
+
+	nlmsg_for_each_attr(nla, nlh, len, remain) {
+		/* Validate whether the attribute is with in the range or not*/
+		if (nla_type(nla) > DRM_RAS_ERROR_COUNTER_ATTR_MAX) {
+			printf("Unknown error counter attribute type: %d\n", nla_type(nla));
+			return NL_SKIP;
+		}
+
+		switch (nla_type(nla)) {
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID:
+			printf("%-18u\t", nla_get_u32(nla));
+			break;
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_NAME:
+			printf("%-30s\t", nla_get_string(nla));
+			break;
+		case DRM_RAS_ERROR_COUNTER_ATTR_ERROR_VALUE:
+			printf("%-18u\n", nla_get_u32(nla));
+			break;
+		default:
+			printf("Unknown attribute type: %d\n", nla_type(nla));
+			break;
+		}
+	}
+	return NL_OK;
+}
+
+static int drm_genl_handle_msg(struct nl_msg *msg, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nlmsghdr *nlh = nlmsg_hdr(msg);
+	struct genlmsghdr *gnlh = genlmsg_hdr(nlh);
+
+	/* Verify aginst the expected command response */
+	if (gnlh->cmd != ctx->command) {
+		fprintf(stderr,
+			"Unexpected command response: got %d, expected %d\n",
+			gnlh->cmd,
+			ctx->command);
+		return NL_SKIP;
+	}
+
+	/* Route to respective Command handling function */
+	switch (ctx->command) {
+	case DRM_RAS_CMD_LIST_NODES:
+		return list_nodes_handler(msg, arg);
+	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
+		return get_error_counters(msg, arg);
+	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
+		return query_error_counter(msg, arg);
+	default:
+		fprintf(stderr, "Unknown command: %d\n", ctx->command);
+		ctx->error = -EOPNOTSUPP;
+		return NL_SKIP;
+	}
+}
+
+static void send_cmd(int cmd, void *arg)
+{
+	struct app_context *ctx = (struct app_context *)arg;
+	struct nl_msg *msg;
+	void *msg_head;
+	int ret;
+
+	msg = nlmsg_alloc();
+	if (!msg)
+		nl_cli_fatal(NLE_INVAL, "nlmsg_alloc failed\n");
+
+	switch (cmd) {
+	case DRM_RAS_CMD_LIST_NODES:
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
+				       cmd, 1);
+		if (!msg_head)
+			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
+
+		printf("%-18s\t%-30s\t%-30s\t%-18s\n",
+		       "node-id", "device-name", "node-name", "node-type");
+		break;
+	case DRM_RAS_CMD_GET_ERROR_COUNTERS:
+		if (!ctx->node_id_set) {
+			fprintf(stderr, "Error: --node-id is required for %s command\n",
+				cmd_names[ctx->command - 1]);
+			exit(EXIT_FAILURE);
+		}
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK | NLM_F_ROOT | NLM_F_MATCH,
+				       cmd, 1);
+
+		if (!msg_head)
+			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
+
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
+		printf("%-18s\t%-30s\t%-18s\n",
+		       "error-id", "error-name", "error-value");
+		break;
+	case DRM_RAS_CMD_QUERY_ERROR_COUNTER:
+		if (!ctx->node_id_set || !ctx->error_id_set) {
+			fprintf(stderr,
+				"Error: --node-id and --error-id are required "
+				"for %s command\n",
+				cmd_names[ctx->command - 1]);
+			exit(EXIT_FAILURE);
+		}
+		msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ,
+				       ctx->family_id, 0,
+				       NLM_F_REQUEST | NLM_F_ACK,
+				       cmd, 1);
+
+		if (!msg_head)
+			nl_cli_fatal(ENOMEM, "genlmsg_put failed\n");
+
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_NODE_ID, ctx->node_id);
+		nla_put_u32(msg, DRM_RAS_ERROR_COUNTER_ATTR_ERROR_ID, ctx->error_id);
+		break;
+	default:
+		break;
+	}
+
+	ret = nl_send_auto(ctx->sock, msg);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to send message: %s", nl_geterror(ret));
+
+	ret = nl_recvmsgs_default(ctx->sock);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to receive message: %s", nl_geterror(ret));
+
+	nlmsg_free(msg);
+}
+
+static int get_cmd(char *cmd_name)
+{
+	int i;
+
+	if (!cmd_name)
+		return -1;
+
+	for (i = 0; i < __DRM_RAS_CMD_MAX; i++) {
+		if (strcasecmp(cmd_name, cmd_names[i]) == 0)
+			return i + 1;
+	}
+	return -1;
+}
+
+static int check_for_help(int argc, char **argv)
+{
+	for (int i = 1; i < argc; i++) {
+		if (strcmp(argv[i], "--help") == 0 || strcmp(argv[i], "-h") == 0)
+			return 1;
+	}
+	return 0;
+}
+
+int main(int argc, char **argv)
+{
+	char *endptr;
+	enum opt_val val;
+	int  ret, opt, option_index = 0;
+	struct app_context ctx = {0};
+
+	// Check for help option before command parsing
+	if (check_for_help(argc, argv)) {
+		help(argv);
+		exit(EXIT_SUCCESS);
+	}
+
+	//Parse the input command
+	ctx.command = get_cmd(argv[1]);
+	if (ctx.command < 0) {
+		fprintf(stderr, "invalid command\n");
+		help(argv);
+		exit(EXIT_FAILURE);
+	}
+
+	static struct option options[] = {
+		{"error-id", optional_argument, NULL, OPT_ERRORID},
+		{"node-id",  optional_argument, NULL, OPT_NODEID},
+		{"help",     no_argument,       NULL, OPT_HELP},
+		{0, 0, 0, 0}
+	};
+
+	optind = 2;
+	while ((opt = getopt_long(argc, argv, "h", options, &option_index)) != -1) {
+		switch (opt) {
+		case OPT_ERRORID:
+			if (optarg) {
+				printf("Error ID: %s\n", optarg);
+				//Assuming input is in Decimal Representation
+				ctx.error_id = strtoul(optarg, &endptr, 10);
+				if (*endptr != '\0') {
+					fprintf(stderr, "invalid error id %s\n", optarg);
+					exit(EXIT_FAILURE);
+				}
+				ctx.error_id_set = 1;
+			} else {
+				printf("Error ID not specified\n");
+				ctx.error_id_set = 0;
+			}
+			break;
+		case OPT_NODEID:
+			if (optarg) {
+				printf("Node ID: %s\n", optarg);
+				//Assuming input is in Decimal Representation
+				ctx.node_id = strtoul(optarg, &endptr, 10);
+				if (*endptr != '\0') {
+					fprintf(stderr, "invalid node id %s\n", optarg);
+					exit(EXIT_FAILURE);
+				}
+				ctx.node_id_set = 1;
+			} else {
+				printf("Node ID not specified\n");
+				ctx.node_id_set = 0;
+			}
+			break;
+		case OPT_HELP:
+		case 'h':
+			help(argv);
+			exit(EXIT_SUCCESS);
+			break;
+		case '?':
+			fprintf(stderr, "Unknown option\n");
+			exit(EXIT_FAILURE);
+			break;
+		default:
+			fprintf(stderr, "Unexpected option: %c\n", opt);
+			exit(EXIT_FAILURE);
+			break;
+		}
+	}
+
+	/* Create a Netlink Socket object*/
+	ctx.sock = nl_cli_alloc_socket();
+	if (!ctx.sock)
+		nl_cli_fatal(NLE_NOMEM, "Cannot allocate nl_sock");
+
+	/* Connect the allocated socket to NETLINK_GENERIC protocol*/
+	ret = nl_cli_connect(ctx.sock, NETLINK_GENERIC);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Cannot connect handle");
+
+	/**
+	 * Resolves the Generic Netlink family name to the corresponding
+	 * numeric family identifier. This function queries the kernel directly
+	 */
+	ctx.family_id = genl_ctrl_resolve(ctx.sock, DRM_RAS_GENL_NAME);
+	if (ctx.family_id < 0)
+		nl_cli_fatal(NLE_INVAL, "Resolving of \"%s\" failed", DRM_RAS_GENL_NAME);
+
+	/* Modify the callback handler associated with the socket */
+	ret = nl_socket_modify_cb(ctx.sock, NL_CB_VALID, NL_CB_CUSTOM, drm_genl_handle_msg, &ctx);
+	if (ret < 0)
+		nl_cli_fatal(ret, "Unable to modify valid message callback");
+
+	send_cmd(ctx.command, &ctx);
+
+	nl_close(ctx.sock);
+	nl_socket_free(ctx.sock);
+
+	return 0;
+}
diff --git a/tools/meson.build b/tools/meson.build
index 8185ba160..74ff97713 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -70,6 +70,11 @@ if libudev.found()
 		   install : true)
 endif
 
+executable('drm_ras', 'drm_ras.c',
+			dependencies : [tool_deps, libnl, libnl_cli, libnl_genl],
+			install_rpath : bindir_rpathdir,
+			install : true)
+
 executable('gputop', 'gputop.c',
            install : true,
            install_rpath : bindir_rpathdir,
-- 
2.34.1

