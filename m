Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76030E7717B
	for <igt-dev@archiver.kernel.org>; Fri,  6 Dec 2024 17:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68010F144;
	Fri,  6 Dec 2024 17:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OakEQeem";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4390E10F144
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Dec 2024 17:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733505543; x=1765041543;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WuofPNg1OBGBKpZhxepH8V2GWjU+tXXQwT8OtWKMkQo=;
 b=OakEQeemd1nFmPhnAGsSA/2UVws1s6/oadzT2srllBY+XVwQztrSElV1
 f1eKgL/KwDtanTnXjN7ilCwLup8GhiEmczIIQCyzv3210DGr8NMv4RQ3U
 JFPiDTtLD0sbG8YQ+qFaxJtiaY7lQYbqrGrz0xl9TLO0c7RnFz+lKRJeX
 Ec/3qVdHIP8u/Inp91cJNWk0dLDFGQ4l1o7V/Z1a0Sp1IClL2RP0KHlLB
 MaN9W9B9bQlNG0EKBpEZHaGD5DX+05bOi7zDMIMxyL4wbbVVmrAOrubJc
 WYqO0zbMmL0sF1WYSCHQ4Ocszy2KIf6DKhgFOFpJV+n56QLl539fm4tnb A==;
X-CSE-ConnectionGUID: 0ArBxpgjQaaormr3eWS8mw==
X-CSE-MsgGUID: 1cG9Oq/DR52wY15VGUjtQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="33187074"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="33187074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2024 09:19:03 -0800
X-CSE-ConnectionGUID: f7w8/qruTAWDaCYAW72cIA==
X-CSE-MsgGUID: CgLLCinWQa+g2/N4M5Sj6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; d="scan'208";a="99525427"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 09:19:02 -0800
Date: Fri, 6 Dec 2024 18:18:58 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com,
 ankit.k.nautiyal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v1] tools/intel_hdcp: Introduce intel_hdcp tool
Message-ID: <20241206171858.wtozqz4n2ntslj43@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, suraj.kandpal@intel.com,
 ankit.k.nautiyal@intel.com, mohammed.thasleem@intel.com
References: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241204095654.3185959-1-santhosh.reddy.guddati@intel.com>
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
On 2024-12-04 at 15:26:54 +0530, Santhosh Reddy Guddati wrote:
> Add a new HDCP tool for self-testing and easy deployment
> to client machines. This tool helps diagnose issues,
> determining whether the problem lies in the driver or user space.
> 
> The current changes include tool skeleton and get hdcp info
> on the connected outputs.
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 203 +++++++++++++++++++++++++++++++++++++++++++++
>  tools/meson.build  |   1 +
>  2 files changed, 204 insertions(+)
>  create mode 100644 tools/intel_hdcp.c
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> new file mode 100644
> index 000000000..8c0258092
> --- /dev/null
> +++ b/tools/intel_hdcp.c
> @@ -0,0 +1,203 @@
> +/*
> + * Copyright © 2024 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Use SPDX, see other recent C files.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
> + * DEALINGS IN THE SOFTWARE.
> + *
> + * This tool designed to mimic an HDCP video player, capable of performing
> + * self-tests and easily deployable to client machines. This tool helps identify
> + * whether issues are rooted in the driver or user space.
> + *
> + */
> +
> +#include <stdio.h>
> +#include "igt.h"
> +#include <fcntl.h>

Sort alphabetically, first system headers, then igt so:

#include <fcntl.h>
#include <stdio.h>

#include "igt.h"

Btw are you sure to include igt.h here?

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
> +	igt_debug("TODO: Enable HDCP\n");

Tools is not a test, so maybe just fprintf(stderr, ...)

> +}
> +
> +/* TODO: Implement the actual HDCP disabling logic here */
> +static void disable_hdcp(void)
> +{
> +	igt_debug("TODO: Disable HDCP\n");

Same here.

> +}
> +
> +static bool sink_hdcp2_capable(data_t *data, igt_output_t *output)
> +{
> +	char buf[MAX_HDCP_BUF_LEN];
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);

You are using igt lib function here, make sure it will not assert.

> +	if (fd < 0)
> +		return false;
> +
> +	if (is_intel_device(data->fd))
> +		igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", buf, sizeof(buf));

Same here, using igt lib function intended for tests
can bring an assert, it is no expected in a tool.

> +	else
> +		igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, sizeof(buf));

Same here.

> +
> +	close(fd);
> +
> +	igt_debug("Sink capability: %s\n", buf);
> +	return strstr(buf, "HDCP2.2");
> +}
> +
> +static bool sink_hdcp_capable(data_t *data, igt_output_t *output)
> +{
> +	char buf[MAX_HDCP_BUF_LEN];
> +	int fd;
> +
> +	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);

Same here.

> +	if (fd < 0)
> +		return false;
> +
> +	if (is_intel_device(data->fd))
> +		igt_debugfs_simple_read(fd, "i915_hdcp_sink_capability", buf, sizeof(buf));

Same here.

> +	else
> +		igt_debugfs_simple_read(fd, "hdcp_sink_capability", buf, sizeof(buf));

Same here.

> +
> +	close(fd);
> +
> +	igt_debug("Sink capability: %s\n", buf);
> +	return strstr(buf, "HDCP1.4");
> +}
> +
> +static const char *get_hdcp_version(igt_output_t *output, data_t *data)
> +{
> +	if (sink_hdcp2_capable(data, output))
> +		return "HDCP 2.2";
> +	else if (sink_hdcp_capable(data, output))
> +		return "HDCP 1.4";
> +	else
> +		return "No HDCP support";
> +}
> +
> +static void get_hdcp_info(data_t *data)
> +{
> +	igt_output_t *output;
> +	igt_display_t *display = &data->display;
> +
> +	igt_info("\nHDCP Sink Information\n");
> +	for_each_connected_output(display, output) {
> +		igt_info("Output: %s\tHDCP Supported Version: %s\n",
> +			  igt_output_name(output), get_hdcp_version(output, data));
> +	}
> +}
> +
> +static void print_usage(void)
> +{
> +	igt_info("Usage: intel_hdcp [OPTIONS]\n");

Same here, imho better just printf() here.
> +	igt_info("Options:\n");
> +	igt_info("-i,	--info		Get HDCP Information\n");
> +	igt_info("-e,	--enable	Enable HDCP on the output\n");
> +	igt_info("-d,	--disable	Disable HDCP on the specific output\n");
> +	igt_info("-h,	--help		Display this help message\n");
> +}
> +
> +static void create_frame_buffers(int fd, data_t *data)
> +{
> +	igt_output_t *output;
> +	drmModeModeInfo *mode;
> +	uint16_t width, height;
> +	igt_display_t *display = &data->display;
> +
> +	for_each_connected_output(display, output) {
> +		mode = igt_output_get_mode(output);
> +		igt_assert(mode);
> +
> +		width = mode->hdisplay;
> +		height = mode->vdisplay;
> +	}
> +
> +	data->width = width;
> +	data->height = height;
> +
> +	igt_create_color_fb(data->fd, width, height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.f, 0.f, 0.f, &data->red);
> +	igt_create_color_fb(data->fd, width, height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.f, 1.f, 0.f, &data->green);
> +}
> +
> +static void hdcp_init(data_t *data)
> +{
> +	data->fd = drm_open_driver_master(DRIVER_ANY);

Imho you should do an open yourself.

> +	if (data->fd < 0) {
> +		fprintf(stderr, "Failed to open DRM driver\n");
> +		exit(EXIT_FAILURE);
> +	}
> +	igt_display_require(&data->display, data->fd);

You are not in test, you cannot 'require' a display in a tool,
imho you should inform user that no displays were found and
just exit, no igt SKIPs.

Regards,
Kamil

> +	igt_display_require_output(&data->display);
> +	create_frame_buffers(data->fd, data);
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
> +	hdcp_init(&data);
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
> index 48c9a4b50..8e24005eb 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -27,6 +27,7 @@ tools_progs = [
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
