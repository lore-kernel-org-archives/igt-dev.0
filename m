Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CE4C624A4
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 15:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1FEA10E15D;
	Thu,  3 Sep 2026 15:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ln4DrZtN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8847610E15D
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788451086; x=1819987086;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=fUY6rgVaonprkt3GWQV/u67l2c9GMNRPixv+Qjr96VY=;
 b=Ln4DrZtNSw1+TRh5xbkkgNYkASBfIXfWSLHaEef8qgnjzJwaUDQ9nzcr
 xJZnn22vvQQB9pFe8J51ZO67MMNKcHHxJYw5dJO7F7V2tQRWtTep0vp8m
 VH5yeddgu4PuhoMB5+oHtv75Sa9Rr27Jtletxf4y+RKj6oT5tmTnXO0UN
 t8Qkwu2R/7lZlsc73CKKj6PRpTaddyAMs7oQxH95O0Dxo/KpxlYlQQH4P
 J0rRgl9UY2lVU3J+gTkUxZnlQz/MM2CPKakpAD9LfHyEO+Maz7EQI+tI7
 UdLtm0oqRfpGoJ+my3NpKXOhw5isAwSkGyx3kuWlZ3AlrU4nsJwLGXB3B A==;
X-CSE-ConnectionGUID: OaN9fvnrRtmDrM1UyHuUYg==
X-CSE-MsgGUID: X+PWgRpNRpm0sZtwlCSjrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="106460576"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="106460576"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:58:06 -0700
X-CSE-ConnectionGUID: B3Gi6TqvQ+akJhUgfIDPIw==
X-CSE-MsgGUID: 0gDjiyWnSj+p32vXLaXqKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; d="scan'208";a="267186156"
Received: from black.igk.intel.com ([10.91.253.5])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2026 08:58:05 -0700
Date: Thu, 3 Sep 2026 17:58:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: igt-dev@lists.freedesktop.org, ravi.kishore.koppuravuri@intel.com,
 mallesh.koujalagi@intel.com
Subject: Re: [PATCH v1] tests/intel/xe_ras: Introduce error threshold
Message-ID: <apmZCgSTWDtIYWTh@black.igk.intel.com>
References: <20260813080513.254848-1-raag.jadav@intel.com>
 <95dd0231-8023-47ee-8309-9d098280936a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95dd0231-8023-47ee-8309-9d098280936a@intel.com>
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

On Thu, Sep 03, 2026 at 07:28:31PM +0530, Tauro, Riana wrote:
> On 13-08-2026 13:35, Raag Jadav wrote:
> > Introduce error threshold test as part of xe_ras. This will serve as a
> > foundation for all RAS related tests moving forward.
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >   include/drm-uapi/drm_ras.h |  53 ++++++++
> >   meson.build                |   3 +
> >   tests/intel/xe_ras.c       | 242 +++++++++++++++++++++++++++++++++++++
> >   tests/meson.build          |   2 +
> >   4 files changed, 300 insertions(+)
> >   create mode 100644 include/drm-uapi/drm_ras.h
> >   create mode 100644 tests/intel/xe_ras.c
> > 
> > diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> > new file mode 100644
> > index 000000000..27c689564
> > --- /dev/null
> > +++ b/include/drm-uapi/drm_ras.h
> > @@ -0,0 +1,53 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause) */
> > +/* Do not edit directly, auto-generated from: */
> > +/*	Documentation/netlink/specs/drm_ras.yaml */
> > +/* YNL-GEN uapi header */
> > +/* To regenerate run: tools/net/ynl/ynl-regen.sh */
> > +
> > +#ifndef _UAPI_LINUX_DRM_RAS_H
> > +#define _UAPI_LINUX_DRM_RAS_H
> > +
> > +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> > +#define DRM_RAS_FAMILY_VERSION	1
> > +
> > +/*
> > + * Type of the node. Currently, only error-counter nodes are supported, which
> > + * expose reliability counters for a hardware/software component.
> > + */
> > +enum drm_ras_node_type {
> > +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> > +};
> > +
> > +enum {
> > +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> > +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> > +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> > +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> > +
> > +	__DRM_RAS_A_NODE_ATTRS_MAX,
> > +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> > +};
> > +
> > +enum {
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> > +
> > +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> > +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> > +};
> > +
> > +enum {
> > +	DRM_RAS_CMD_LIST_NODES = 1,
> > +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> > +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> > +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> > +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> > +
> > +	__DRM_RAS_CMD_MAX,
> > +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> > +};
> > +
> > +#endif /* _UAPI_LINUX_DRM_RAS_H */
> 
> This should be split into a seperate patch and should either be generated
> using ynl tool
> or copied from kernel directly.

I'll update to latest.

> > diff --git a/meson.build b/meson.build
> > index 980fb6421..5ef0b4edf 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -153,6 +153,9 @@ libpci = dependency('libpci', required : true)
> >   libudev = dependency('libudev', required : true)
> >   glib = dependency('glib-2.0', required : true)
> > +libnl = dependency('libnl-3.0', required: true)
> > +libnl_genl = dependency('libnl-genl-3.0', required: true)
> > +
> >   libtsi = cc.find_library('TSI', required : false)
> >   if libtsi.found()
> > diff --git a/tests/intel/xe_ras.c b/tests/intel/xe_ras.c
> > new file mode 100644
> > index 000000000..91f624d9f
> > --- /dev/null
> > +++ b/tests/intel/xe_ras.c
> > @@ -0,0 +1,242 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2026 Intel Corporation
> > + */
> > +
> > +/**
> > + * TEST: Check Reliability Availability Serviceability
> > + * Category: Core
> > + * Mega feature: RAS
> > + * Sub-category: Error handling tests
> > + * Test category: functionality test
> > + */
> > +
> > +#include <limits.h>
> > +#include <netlink/socket.h>
> > +#include <netlink/genl/ctrl.h>
> > +#include <netlink/genl/genl.h>
> > +
> > +#include "igt.h"
> > +#include "lib/igt_device.h"
> > +#include "lib/igt_sysfs.h"
> > +
> > +#include "xe_drm.h"
> > +#include "drm_ras.h"
> > +
> > +static const char * const error_severity[] = DRM_XE_RAS_ERROR_SEVERITY_NAMES;
> > +
> > +typedef struct {
> > +	int fd_xe;
> > +	int sysfs_fd;
> > +	struct pci_device *pci_xe;
> > +	struct nl_sock *sock;
> > +	struct nl_cb *cb;
> > +	int family_id;
> > +	uint32_t node_id;
> > +	uint32_t error_id;
> > +	uint32_t threshold;
> > +} xe_ras_t;
> > +
> > +static void init_ras_ctx(xe_ras_t *ctx)
> > +{
> > +	int ret;
> > +
> > +	ctx->fd_xe = drm_open_driver(DRIVER_XE);
> > +	ctx->sysfs_fd = igt_sysfs_open(ctx->fd_xe);
> > +	ctx->pci_xe = igt_device_get_pci_device(ctx->fd_xe);
> > +
> > +	ctx->sock = nl_socket_alloc();
> > +	igt_assert_f(ctx->sock, "Failed to allocate nl_sock");
> > +
> > +	ret = genl_connect(ctx->sock);
> > +	igt_assert_f(!ret, "Failed to connect nl_sock: %s\n", nl_geterror(ret));
> > +
> > +	ctx->family_id = genl_ctrl_resolve(ctx->sock, DRM_RAS_FAMILY_NAME);
> > +	igt_require_f(ctx->family_id >= 0, "drm-ras family not found\n");
> > +}
> > +
> > +static void cleanup_ras_ctx(xe_ras_t *ctx)
> > +{
> > +	nl_close(ctx->sock);
> > +	nl_socket_free(ctx->sock);
> > +
> > +	close(ctx->sysfs_fd);
> > +	drm_close_driver(ctx->fd_xe);
> > +}
> > +
> > +static uint32_t nlattr_max(uint32_t cmd)
> > +{
> > +	if (cmd == DRM_RAS_CMD_LIST_NODES)
> > +		return DRM_RAS_A_NODE_ATTRS_MAX;
> > +	else
> > +		return DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX;
> > +}
> > +
> > +static int nl_cb(struct nl_msg *msg, void *arg)
> > +{
> > +	struct nlmsghdr *nlh = nlmsg_hdr(msg);
> > +	struct genlmsghdr *gnlh = nlmsg_data(nlh);
> > +	struct nlattr *attrs[UCHAR_MAX];
> > +	int ret, cmd = gnlh->cmd;
> > +	xe_ras_t *ctx = arg;
> > +
> > +	ret = genlmsg_parse(nlh, 0, attrs, nlattr_max(cmd), NULL);
> > +	if (ret) {
> > +		igt_warn("Failed to parse nl msg: %s\n", nl_geterror(ret));
> > +		return NL_SKIP;
> > +	}
> > +
> > +	switch (cmd) {
> > +	case DRM_RAS_CMD_LIST_NODES: {
> > +		char *device_name, *node_name, pci_name[UCHAR_MAX];
> > +		struct pci_device *pci = ctx->pci_xe;
> > +
> > +		if (!attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]) {
> > +			igt_warn("Device name attribute not found\n");
> > +			return NL_SKIP;
> > +		}
> > +
> > +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]) {
> > +			igt_warn("Node name attribute not found\n");
> > +			return NL_SKIP;
> > +		}
> > +
> > +		if (!attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]) {
> > +			igt_warn("Node id attribute not found\n");
> > +			return NL_SKIP;
> > +		}
> > +
> > +		device_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_DEVICE_NAME]);
> > +		node_name = nla_get_string(attrs[DRM_RAS_A_NODE_ATTRS_NODE_NAME]);
> > +
> > +		snprintf(pci_name, UCHAR_MAX, "%04x:%02x:%02x.%01x",
> > +			 pci->domain, pci->bus, pci->dev, pci->func);
> > +
> > +		if (strcmp(node_name, error_severity[DRM_XE_RAS_ERR_SEV_CORRECTABLE]) ||
> > +		    strcmp(device_name, pci_name))
> > +			return NL_SKIP;
> > +
> > +		ctx->node_id = nla_get_u32(attrs[DRM_RAS_A_NODE_ATTRS_NODE_ID]);
> > +		return NL_OK;
> > +	}
> > +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> > +		return NL_OK;
> > +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
> > +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]) {
> > +			igt_warn("Error threshold attribute not found\n");
> > +			return NL_SKIP;
> > +		}
> > +
> > +		ctx->threshold = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD]);
> > +		return NL_OK;
> > +	default:
> > +		return NL_SKIP;
> > +	}
> > +}
> 
> We should have this part of lib so other tests can re-use.

I tried to keep it generic enough so that we can get away with simply
adding switch cases for new commands here but sure, if having a lib
makes more sense I'll wait for Ravi's series to merge.

> > +static void prepare_nl_msg(xe_ras_t *ctx, struct nl_msg *msg, uint32_t cmd)
> > +{
> > +	int ret;
> > +
> > +	switch (cmd) {
> > +	case DRM_RAS_CMD_LIST_NODES:
> > +		break;
> > +	case DRM_RAS_CMD_SET_ERROR_THRESHOLD:
> > +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD, ctx->threshold);
> > +		igt_assert_f(!ret, "Failed to put error threshold: %s\n", nl_geterror(ret));
> > +		/* fallthrough */
> > +	case DRM_RAS_CMD_GET_ERROR_THRESHOLD:
> > +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID, ctx->node_id);
> > +		igt_assert_f(!ret, "Failed to put node id: %s\n", nl_geterror(ret));
> > +
> > +		ret = nla_put_u32(msg, DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID, ctx->error_id);
> > +		igt_assert_f(!ret, "Failed to put error id: %s\n", nl_geterror(ret));
> > +		break;
> > +	default:
> > +		igt_assert_f(0, "Invalid command: %u\n", cmd);
> > +	}
> > +}
> > +
> > +static uint32_t nlmsg_flags(uint32_t cmd)
> > +{
> > +	uint32_t flags = NLM_F_REQUEST | NLM_F_ACK;
> > +
> > +	if (cmd == DRM_RAS_CMD_LIST_NODES)
> > +		flags |= NLM_F_DUMP;
> > +
> > +	return flags;
> > +}
> > +
> > +static void test_cmd(xe_ras_t *ctx, uint32_t cmd)
> > +{
> > +	struct nl_msg *msg;
> > +	void *msg_head;
> > +	int ret;
> > +
> > +	msg = nlmsg_alloc();
> > +	igt_assert_f(msg, "Failed to allocate nl_msg\n");
> > +
> > +	msg_head = genlmsg_put(msg, NL_AUTO_PORT, NL_AUTO_SEQ, ctx->family_id, 0,
> > +			       nlmsg_flags(cmd), cmd, DRM_RAS_FAMILY_VERSION);
> > +	igt_require_f(msg_head, "Failed to add nl msg header\n");
> > +
> > +	prepare_nl_msg(ctx, msg, cmd);
> > +
> > +	ret = nl_socket_modify_cb(ctx->sock, NL_CB_VALID, NL_CB_CUSTOM, nl_cb, ctx);
> > +	igt_assert_f(!ret, "Failed to modify cb: %s\n", nl_geterror(ret));
> > +
> > +	ret = nl_send_auto(ctx->sock, msg);
> > +	igt_assert_f(ret > 0, "Failed to send nl msg: %s\n", nl_geterror(ret));
> > +
> > +	ret = nl_recvmsgs_default(ctx->sock);
> > +	igt_assert_f(!ret, "Failed to receive nl msg: %s\n", nl_geterror(ret));
> > +
> > +	nlmsg_free(msg);
> > +}
> > +
> > +/**
> > + * SUBTEST: error-threshold
> > + * Description: test get/set error threshold of the counter
> > + * Functionality: RAS
> > + * GPU requirements: DRM RAS feature should be supported
> > + */
> > +static void test_error_threshold(xe_ras_t *ctx)
> > +{
> > +	ctx->node_id = UINT_MAX;
> > +
> > +	test_cmd(ctx, DRM_RAS_CMD_LIST_NODES);
> > +
> > +	/* drm_ras is missing */
> > +	igt_skip_on(ctx->node_id == UINT_MAX);
> > +	igt_info("node id: %d\n", ctx->node_id);
> > +
> > +	ctx->error_id = DRM_XE_RAS_ERR_COMP_CORE_COMPUTE;
> > +	igt_info("error id: %d\n", ctx->error_id);
> > +
> > +	test_cmd(ctx, DRM_RAS_CMD_GET_ERROR_THRESHOLD);
> > +	igt_info("get error threshold: %u\n", ctx->threshold);
> > +
> > +	test_cmd(ctx, DRM_RAS_CMD_SET_ERROR_THRESHOLD);
> > +	igt_info("set error threshold: %u\n", ctx->threshold);
> > +}
> > +
> > +int igt_main()
> > +{
> > +	xe_ras_t ctx;
> > +
> > +	igt_fixture() {
> > +		memset(&ctx, 0, sizeof(ctx));
> > +		init_ras_ctx(&ctx);
> > +
> > +		igt_install_exit_handler(igt_drm_debug_mask_reset_exit_handler);
> > +		update_debug_mask_if_ci(DRM_UT_KMS);
> > +	}
> > +
> > +	igt_subtest_f("error-threshold") {
> > +		test_error_threshold(&ctx);
> 
> We are only checking if commands are supported here..
> Why not set a threshold and check if we get the same back?
> Is it planned as a follow up?

I think that's what I did here but it's the other way around, we set
what we get - which I thought was enough considering that driver is just
a transport here and we don't care about the values.

Raag

> > +	}
> > +
> > +	igt_fixture() {
> > +		cleanup_ras_ctx(&ctx);
> > +	}
> > +}
> > diff --git a/tests/meson.build b/tests/meson.build
> > index a62f447df..2ebdc74da 100644
> > --- a/tests/meson.build
> > +++ b/tests/meson.build
> > @@ -333,6 +333,7 @@ intel_xe_progs = [
> >   	'xe_prime_self_import',
> >   	'xe_pxp',
> >   	'xe_query',
> > +	'xe_ras',
> >   	'xe_render_copy',
> >   	'xe_vm',
> >   	'xe_userptr_pressure',
> > @@ -429,6 +430,7 @@ extra_dependencies = {
> >   	'xe_fault_injection': [ lib_igt_xe_oa ],
> >   	'xe_oa': [ lib_igt_xe_oa ],
> >           'xe_compute': [ igt_deps,lib_igt_perf,lib_igt_profiling,math ],
> > +	'xe_ras': [ libnl, libnl_genl ],
> >   }
> >   test_executables = []
