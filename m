Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C3CC3ABD8
	for <igt-dev@archiver.kernel.org>; Fri, 16 May 2025 14:50:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 287D810EAF7;
	Fri, 16 May 2025 14:50:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEVYxUf2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834D710EAF7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 May 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747407041; x=1778943041;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8k2CYT7li5rKfgoCwTsRWBCWsNDo/y6bY5OmxBc4d3Q=;
 b=DEVYxUf2vg9lyqNoBNQbxTag5A9+vpPVX9ldduTFyBmSuX0pElBL7t77
 A6huwZozNXzivP6a6y3HhyPxU+MLgtfWQwk+Nk0hCB6wP+jRzdFvvlqGv
 skxXvoX+DZosiVFfbSmQLBFwB5HDx8RjCdEiFe2FQ8q26Fu1AD5nS6JTf
 C7GhTIGQ01AB+bJY6Lle/aUDve0M4jCytIHkkmupW3DlLseXp9YrFnrjV
 mlmW47yyW/eELpBG5vA0rxaT34OCJ3UHxI9EJmD+uANWYVCO3xZNY0Ybj
 KjUW9DtkzGDmDo7qLoUGVuCZXYrvLZ4lRftkdjPcExpjhIvixCmPcRNEe Q==;
X-CSE-ConnectionGUID: yzQ+iS5QRHuMJqN37F/fjw==
X-CSE-MsgGUID: OG/S01HzS9qWowjuSxVJwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="60722033"
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="60722033"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2025 07:50:41 -0700
X-CSE-ConnectionGUID: 19agSzDWReqCzJeJ9cPCKw==
X-CSE-MsgGUID: TZKXk5ytST6K3cbGd+jFXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,294,1739865600"; d="scan'208";a="139239475"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa007-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 07:50:40 -0700
Date: Fri, 16 May 2025 16:50:37 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v3 2/2] tools/intel_hdcp: Support for enabling and
 disabling HDCP
Message-ID: <20250516145037.ywxzrhaon5hwdriq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
References: <20250514090230.3281649-1-santhosh.reddy.guddati@intel.com>
 <20250514090230.3281649-3-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250514090230.3281649-3-santhosh.reddy.guddati@intel.com>
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
On 2025-05-14 at 14:32:30 +0530, Santhosh Reddy Guddati wrote:
> Introduce support for enabling and disabling HDCP on specific connectors
> using command line options.
> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  tools/intel_hdcp.c | 119 +++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 114 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/intel_hdcp.c b/tools/intel_hdcp.c
> index fa7855d6e..aa7b2a376 100644
> --- a/tools/intel_hdcp.c
> +++ b/tools/intel_hdcp.c
> @@ -9,6 +9,15 @@
>  #include "igt.h"
>  
>  #define MAX_HDCP_BUF_LEN	5000
> +#define MAX_CONNECTORS		10
> +
> +#define CP_UNDESIRED		0
> +#define CP_DESIRED		1
> +#define CP_ENABLED		2
> +
> +/* Max time per authentication allowed = 6Sec */
> +#define KERNEL_AUTH_TIME_ALLOWED_MSEC		(6 * 1000)
> +#define KERNEL_DISABLE_TIME_ALLOWED_MSEC	(1 * 1000)
>  
>  typedef struct data {
>  	int fd;
> @@ -17,6 +26,87 @@ typedef struct data {
>  	int height, width;
>  } data_t;
>  
> +static void update_display(data_t *data, igt_output_t *output, bool is_enabled)
> +{
> +	igt_display_t *display = &data->display;
> +	igt_plane_t *primary;
> +	drmModeModeInfo *mode;
> +
> +	mode = igt_output_get_mode(output);
> +	data->height = mode->vdisplay;
> +	data->width = mode->hdisplay;
> +
> +	igt_output_set_pipe(output, PIPE_A);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +
> +	igt_create_color_fb(data->fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1.f, 0.f, 0.f, &data->red);
> +	igt_create_color_fb(data->fd, data->width, data->height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.f, 1.f, 0.f, &data->green);
> +
> +	if (is_enabled)
> +		igt_plane_set_fb(primary, &data->green);
> +	else
> +		igt_plane_set_fb(primary, &data->red);
> +
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->fd, &data->red);
> +	igt_remove_fb(data->fd, &data->green);
> +	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_display_commit2(display, COMMIT_ATOMIC);
> +}
> +
> +static void igt_output_set_hdcp(data_t *data, igt_output_t *output, bool enable)
> +{
> +	uint64_t prop_value;
> +
> +	igt_output_set_prop_value(output, IGT_CONNECTOR_CONTENT_PROTECTION,
> +				enable ? CP_DESIRED : CP_UNDESIRED);
> +
> +	if (enable) {
> +		usleep(KERNEL_AUTH_TIME_ALLOWED_MSEC);
> +		prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
> +
> +		if (prop_value == CP_ENABLED) {
> +			fprintf(stderr, "HDCP enabled on output %s\n", output->name);
> +			update_display(data, output, true);
> +		} else {
> +			update_display(data, output, false);
> +			fprintf(stderr, "Failed to enable HDCP on connector %s\n", output->name);
> +		}
> +	} else {
> +		usleep(KERNEL_DISABLE_TIME_ALLOWED_MSEC);
> +		prop_value = igt_output_get_prop(output, IGT_CONNECTOR_CONTENT_PROTECTION);
> +
> +		if (prop_value == CP_UNDESIRED) {
> +			update_display(data, output, true);
> +			fprintf(stderr, "HDCP disabled on connector %s\n", output->name);
> +		} else {
> +			update_display(data, output, false);
> +			fprintf(stderr, "Failed to disable HDCP on connector %s\n", output->name);
> +		}
> +	}
> +}
> +
> +static void set_hdcp(data_t *data, int connector_id, bool enable)
> +{
> +	igt_output_t *output;
> +	drmModeConnector connector;
> +
> +	connector.connector_id = connector_id;
> +	output = igt_output_from_connector(&data->display, &connector);
> +	if (!output) {
> +		fprintf(stderr, "Failed to get output for connector %d\n", connector_id);
> +		return;
> +	}
> +
> +	igt_output_set_hdcp(data, output, enable);
> +}
> +
>  static const char *get_hdcp_version(int fd, char *connector_name)
>  {
>  	char buf[MAX_HDCP_BUF_LEN];
> @@ -85,7 +175,8 @@ static void print_usage(void)
>  	fprintf(stderr, "Usage: intel_hdcp [OPTIONS]\n");
>  	fprintf(stderr, "Options:\n");
>  	fprintf(stderr, "-i,	--info		Get HDCP Information\n");
> -	fprintf(stderr, "-h,	--help		Display this help message\n");

Why you removed above line? Please keep it, you could consider
make it a first printed line but it should stay.

Regards,
Kamil

> +	fprintf(stderr, "-e,	--enable	Enable HDCP on the specified connector id\n");
> +	fprintf(stderr, "-d,	--disable	Disable HDCP on the specified connector id\n");
>  }
>  
>  static void test_init(data_t *data)
> @@ -103,11 +194,13 @@ int main(int argc, char **argv)
>  {
>  	data_t data;
>  	int option;
> -	static const char optstr[] = "hi";
> +	static const char optstr[] = "hied:";
>  	struct option long_opts[] = {
> -		{"help",	no_argument,	NULL, 'h'},
> -		{"info",	no_argument,	NULL, 'i'},
> -		{NULL,		0,		NULL,  0 }
> +		{"help",	no_argument,		NULL,	'h'},
> +		{"info",	no_argument,		NULL,	'i'},
> +		{"enable",	required_argument,	NULL,	'e'},
> +		{"disable",	required_argument,	NULL,	'd'},
> +		{NULL,		0,			NULL,	 0 }
>  	};
>  
>  	test_init(&data);
> @@ -117,6 +210,22 @@ int main(int argc, char **argv)
>  		case 'i':
>  			get_hdcp_info(&data);
>  			break;
> +		case 'e':
> +			if (!optarg) {
> +				fprintf(stderr, "Missing connector ID for enable\n");
> +				print_usage();
> +				exit(EXIT_FAILURE);
> +			}
> +			set_hdcp(&data, atoi(optarg), true);
> +			break;
> +		case 'd':
> +			if (!optarg) {
> +				fprintf(stderr, "Missing connector ID for enable\n");
> +				print_usage();
> +				exit(EXIT_FAILURE);
> +			}
> +			set_hdcp(&data, atoi(optarg), false);
> +			break;
>  		case 'h':
>  		default:
>  			print_usage();
> -- 
> 2.34.1
> 
