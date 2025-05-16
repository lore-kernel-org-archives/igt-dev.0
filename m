Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4952C3ABC9
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 14:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8C710EAF4;
	Fri, 16 May 2025 14:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X86UsIUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ECC10EAF4
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747406838; x=1778942838;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=9O5NWuAS4qoeHCjmnySBjls/iV4B/1RCaxdBSmOKnC4=;
 b=X86UsIUCwRTYST/xK5umd2TzaSidDgbXL/Q9PrMEpmia/TvaKEOCBgZ5
 /WaQQUAkZ+G+ZvQ94drLHGL6pmJhJfuhzsHwD7Jx9YmuzEyJY57Qso337
 c5xNao2TEOB4jAWMuLPVQvadVOdZrhWlyqVeR9+oHPxuZPdQrmGyscmAa
 T/fC7ThVw6DzeztXnFmCtqY3WKhtLcylCPcpH4SHunMfIQOH02YtSL5xv
 qR4G550cLzFo7avFyegLhUaHwFuOg5+vZB7+m2rUPuqQ+0wqoC+eXfa7f
 t53NvE3r2yrzSsfVu7tW4PLBh4p8PyHIGHVoF32tuh5wIel0zOUTREtOj w==;
X-CSE-ConnectionGUID: KnHjf1brQ4atDMsc1TJceA==
X-CSE-MsgGUID: nH94J1/FQCmFwe2TJJ4OOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="49487500"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="49487500"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:47:17 -0700
X-CSE-ConnectionGUID: r6q0aFvdSqOEfmmFfOqcQw==
X-CSE-MsgGUID: SkQIg7bQStCN8QzwonnVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="162024044"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:47:15 -0700
Date: Fri, 16 May 2025 16:47:01 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v3 1/2] tools/intel_hdcp: Introduce intel_hdcp tool
Message-ID: <20250516144701.q6zzv7j5qh6alnlt@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
References: <20250514090230.3281649-1-santhosh.reddy.guddati@intel.com>
 <20250514090230.3281649-2-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250514090230.3281649-2-santhosh.reddy.guddati@intel.com>
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
On 2025-05-14 at 14:32:29 +0530, Santhosh Reddy Guddati wrote:
> Add a new HDCP tool for self-testing and easy deployment
> to client machines. This tool helps diagnose issues,
> determining whether the problem lies in the driver or user space.
> 
> The current changes include tool skeleton and get hdcp info
> on the connected outputs.
> 
> Wiki: https://en.wikipedia.org/wiki/High-bandwidth_Digital_Content_Protection

Better:

More about HDCP could be readed here:
https://en.wikipedia.org/wiki/High-bandwidth_Digital_Content_Protection

> 
> V2:
>  - Update copyright to use SPDX (Jani Nikula).
>  - Replace use of igt_* with fprintf and minimise usage of igt wrappers
>    wherever possible (Kamil).
>  - Consolidate HDCP version info and connector dump , remove redundant
>    code and comments (Santhosh).
> 
> V3:
>  - Remove unimplemented enable, disable options and add Wiki (Kamil).
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

LGTM, few whitespace fixes needed as suggested by checkpatch.pl,
for example:

0001-tools-intel_hdcp-Introduce-intel_hdcp-tool.patch:106: CHECK:PARENTHESIS_ALIGNMENT: Alignment should match open parenthesis
#106: FILE: tools/intel_hdcp.c:68:
+               asprintf(&output_name, "%s-%d",
+                                       kmstest_connector_type_str(c->connector_type),

but this could be fixed at merge.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  tools/intel_hdcp.c | 126 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build  |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 tools/intel_hdcp.c
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> new file mode 100644
> index 000000000..fa7855d6e
> --- /dev/null
> +++ b/tools/intel_hdcp.c
> @@ -0,0 +1,126 @@
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
> +
> +typedef struct data {
> +	int fd;
> +	igt_display_t display;
> +	struct igt_fb red, green;
> +	int height, width;
> +} data_t;
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
> +	static const char optstr[] = "hi";
> +	struct option long_opts[] = {
> +		{"help",	no_argument,	NULL, 'h'},
> +		{"info",	no_argument,	NULL, 'i'},
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
