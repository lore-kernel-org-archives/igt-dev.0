Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CF3C36010
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 16:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B476010E61A;
	Tue,  1 Apr 2025 16:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxABAxxW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0236310E61A
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 16:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743525208; x=1775061208;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=70aYOWayqwceh+qYfeuzBzASDOVUOJXgVZZYtBYIsF8=;
 b=cxABAxxWmWmlT7sq6ROKQdpB35KoafyELpH7R3UOwlqSdnKw9mSN/7fb
 MpyjJFo801C+xBKd8Vp2LFBsdPOAO0LXD6D/uBzXUQCNr1cibnpLrIhzV
 UFcCV5AUbyNtc/14FWxMKMLX6vzd/m9Z0nvrKr1p2JUeZCrS792cXjU4/
 ZqFnFHuKrdw14nIL0CtHh3gczDTiewGmD2xKs9nujiYey89iWtQNMrA9O
 d4sb0tcSCwV66ztB5AVZdMOtnKkfb4UeaNIuHjRQQCWTUb6qEduFQptBf
 NKh2OeNMpzcloFvm/Cy6PfMydRnXvZ58PhY5fUdezvjGFUYKaKS8qYT51 Q==;
X-CSE-ConnectionGUID: sUBXg1f2Tly2S7Mhzspwhw==
X-CSE-MsgGUID: lK5Y/m5PSD2kxb+dxj9XGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="45031599"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="45031599"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 09:33:26 -0700
X-CSE-ConnectionGUID: lUbSl9aEQaKWJmV0RH5vlA==
X-CSE-MsgGUID: 3IEkeavrRUmekf0+BlQDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="127342568"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 09:33:23 -0700
Date: Tue, 1 Apr 2025 18:33:20 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, kamil.konieczny@intel.com, jani.nikula@intel.com
Subject: Re: [PATCH i-g-t v2 1/1] tools/intel_hdcp: Introduce intel_hdcp tool
Message-ID: <20250401163320.c2qlbj5jkj645ouk@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, kamil.konieczny@intel.com,
 jani.nikula@intel.com
References: <20250320112835.2652365-1-santhosh.reddy.guddati@intel.com>
 <20250320112835.2652365-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320112835.2652365-2-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-03-20 at 16:58:35 +0530, Santhosh Reddy Guddati wrote:
> Add a new HDCP tool for self-testing and easy deployment
> to client machines. This tool helps diagnose issues,
> determining whether the problem lies in the driver or user space.
> 
> The current changes include tool skeleton and get hdcp info
> on the connected outputs.
> 
> V2:
>  - Update copyright to use SPDX (Jani Nikula).
>  - Replace use of igt_* with fprintf and minimise usage of igt wrappers
>    wherever possible (Kamil).
>  - Consolidate HDCP version info and connector dump , remove redundant
>    code and comments (Santhosh).
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 153 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build  |   1 +
>  2 files changed, 154 insertions(+)
>  create mode 100644 tools/intel_hdcp.c
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> new file mode 100644
> index 000000000..91d32ebf4
> --- /dev/null
> +++ b/tools/intel_hdcp.c
> @@ -0,0 +1,153 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include <fcntl.h>
> +#include <stdio.h>
> +
> +#include "igt.h"
> +
> +#define MAX_HDCP_BUF_LEN	5000
> +typedef struct data {
> +	int fd;
> +	igt_display_t display;
> +	struct igt_fb red, green;
> +	int height, width;
> +} data_t;
> +
> +/* TODO: Implement the actual HDCP enabling logic here
> + * Steps:
> + * 1. Open the appropriate debugfs file for the connector.
> + * 2. Enable HDCP on the output using connector properties
> + *    IGT_CONNECTOR_CONTENT_PROTECTION and IGT_CONNECTOR_HDCP_CONTENT_TYPE.
> + * 3. Check the status to ensure HDCP is enabled.
> + */
> +static void enable_hdcp(void)
> +{
> +	fprintf(stderr, "TODO: Enable HDCP\n");
> +}
> +
> +/* TODO: Implement the actual HDCP disabling logic here */
> +static void disable_hdcp(void)
> +{
> +	fprintf(stderr, "TODO: Disable HDCP\n");
> +}
> +
> +static const char *get_hdcp_version(int fd, char *connector_name)
> +{
> +	char buf[MAX_HDCP_BUF_LEN];
> +	int ret;
> +
> +	ret = igt_debugfs_connector_dir(fd, connector_name, O_RDONLY);
> +	if (ret < 0) {
> +		fprintf(stderr, "Failed to open connector directory\n");
> +		return NULL;
> +	}
> +
> +	if (is_intel_device(fd))
> +		igt_debugfs_simple_read(ret, "i915_hdcp_sink_capability", buf, sizeof(buf));
> +	else
> +		igt_debugfs_simple_read(ret, "hdcp_sink_capability", buf, sizeof(buf));
> +
> +	close(ret);
> +	if (strstr(buf, "HDCP1.4") && strstr(buf, "HDCP2.2"))
> +		return "HDCP1.4 and HDCP2.2";
> +	else if (strstr(buf, "HDCP1.4"))
> +		return "HDCP1.4";
> +	else if (strstr(buf, "HDCP2.2"))
> +		return "HDCP2.2";
> +	else
> +		return "No HDCP support";
> +}
> +
> +static void get_hdcp_info(data_t *data)
> +{
> +	char *output_name;
> +	drmModeRes *res = drmModeGetResources(data->fd);
> +
> +	if (!res) {
> +		fprintf(stderr, "Failed to get DRM resources\n");
> +		return;
> +	}
> +
> +	fprintf(stderr, "Connectors:\n");
> +	fprintf(stderr, "id\tencoder\tstatus\t\ttype\tHDCP\n");
> +	for (int i = 0; i < res->count_connectors; i++) {
> +		drmModeConnector *c;
> +
> +		c = drmModeGetConnectorCurrent(data->fd, res->connectors[i]);
> +
> +		if (!c)
> +			continue;
> +
> +		asprintf(&output_name, "%s-%d",
> +					kmstest_connector_type_str(c->connector_type),
> +					c->connector_type_id);
> +
> +		fprintf(stderr, "%d\t%d\t%s\t%s\t%s\n",
> +				 c->connector_id, c->encoder_id,
> +				 kmstest_connector_status_str(c->connection),
> +				 kmstest_connector_type_str(c->connector_type),
> +				 get_hdcp_version(data->fd, output_name));
> +
> +		drmModeFreeConnector(c);
> +	}
> +
> +	drmModeFreeResources(res);
> +}
> +
> +static void print_usage(void)
> +{
> +	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
> +	fprintf(stderr, "Options:\n");
> +	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> +	fprintf(stderr, "-e,	--enable	Enable HDCP on the output\n");
> +	fprintf(stderr, "-d,	--disable	Disable HDCP on the specific output\n");

Please drop both not implemented options from here and from
below code (reading options from command line), 
you could surround them with

#if 0
	/* non-implemented yet */
#endif

With this change I could give my r-b.
Btw is this that hard to implement this?

Regards,
Kamil

> +	fprintf(stderr, "-h,	--help		Display this help message\n");
> +}
> +
> +static void test_init(data_t *data)
> +{
> +	data->fd = __drm_open_driver(DRIVER_ANY);
> +	if (data->fd < 0) {
> +		fprintf(stderr, "Failed to open DRM driver\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	igt_display_require(&data->display, data->fd);
> +	igt_display_require_output(&data->display);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	data_t data;
> +	int option;
> +	static const char optstr[] = "hied";
> +	struct option long_opts[] = {
> +		{"help",	no_argument,	NULL, 'h'},
> +		{"info",	no_argument,	NULL, 'i'},
> +		{"enable",	no_argument,	NULL, 'e'},
> +		{"disable",	no_argument,	NULL, 'd'},
> +		{NULL,		0,		NULL,  0 }
> +	};
> +
> +	test_init(&data);
> +
> +	while ((option = getopt_long(argc, argv, optstr, long_opts, NULL)) != -1) {
> +		switch (option) {
> +		case 'i':
> +			get_hdcp_info(&data);
> +			break;
> +		case 'e':
> +			enable_hdcp();
> +			break;
> +		case 'd':
> +			disable_hdcp();
> +			break;
> +		case 'h':
> +		default:
> +			print_usage();
> +			break;
> +		}
> +	}
> +}
> diff --git a/tools/meson.build b/tools/meson.build
> index de866c392..8185ba160 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -30,6 +30,7 @@ tools_progs = [
>  	'intel_gpu_time',
>  	'intel_gtt',
>  	'intel_guc_logger',
> +	'intel_hdcp',
>  	'intel_infoframes',
>  	'intel_lid',
>  	'intel_opregion_decode',
> -- 
> 2.34.1
> 
