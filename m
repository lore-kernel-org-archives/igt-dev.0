Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192CAF53D87
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 18:50:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989CE10E0E0;
	Mon, 16 Mar 2026 18:50:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHyW41fx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6910E10E494
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 18:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773687049; x=1805223049;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=/xsrmCLYNSFeC/GFe1U9MHmXyozrjM5kTfy/Gp+HwGg=;
 b=jHyW41fxhHqeUfuZlWxmB8avmYs/joEX1hSwly3+AUjRLrSLla2I1C2F
 QeAFygi0aWv9gY6VWNshfJTjgy4Hju2vAkEnn+fOyQihFGPQA+AQ26eUt
 gjHwQJr0662sZF5vDSBQXskoPrF6wDJwlorGr9lKI+qgCfcNs6fjgEw/S
 KkIs9vPPSKodRI549TA3iXGOTLQKPURNLxbqxiIKORUbjBKemqPy2A9NT
 8zpPSJAJC6nLv4VOnX9W6mwDFBuH9A+tRyqNDBaid+wimmT+YvIDcJzg5
 o3uEvu4JLVx/c1Z781yxYCvLtFKmFXT5v6r7K+cRMseGsuk+PCYv+A40T A==;
X-CSE-ConnectionGUID: DitGyUCHQnGyigUgWaarSA==
X-CSE-MsgGUID: 2yQNQwg2SguDPDpdMgqk3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="74748152"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74748152"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:50:49 -0700
X-CSE-ConnectionGUID: mxf4enCsTlKdlUG2JNblLQ==
X-CSE-MsgGUID: qxb8jMQJSeOGpvH7HsVgPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="259903286"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 11:50:47 -0700
Date: Mon, 16 Mar 2026 19:50:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
Subject: Re: [PATCH i-g-t v9 01/49] lib/igt_kms: Add a detect timeout value
Message-ID: <20260316185028.fznq5fdvwvpt5orn@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 igt-dev@lists.freedesktop.org, thomas.petazzoni@bootlin.com,
 luca.ceresoli@bootlin.com, kory.maincent@bootlin.com,
 markyacoub@google.com, khaled.almahallawy@intel.com
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
 <20260316-unigraf-integration-v9-1-a01dffc3b0cb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260316-unigraf-integration-v9-1-a01dffc3b0cb@bootlin.com>
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

Hi Louis,
On 2026-03-16 at 17:17:22 +0100, Louis Chauvet wrote:
> Some tests need to wait for a specific connector status. In order to make
> the timeout customisable for each target, add an option in the
> configuration file.
> 
> Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/igt_core.c | 33 +++++++++++++++++++++++++++++++++
>  lib/igt_core.h |  9 +++++++++
>  lib/igt_kms.c  |  1 +
>  3 files changed, 43 insertions(+)
> 
> diff --git a/lib/igt_core.c b/lib/igt_core.c
> index 3ee670a41a91..e8f31d573512 100644
> --- a/lib/igt_core.c
> +++ b/lib/igt_core.c
> @@ -26,6 +26,7 @@
>   *
>   */
>  
> +#include "igt_kms.h"

Why do you need this include here? lib/igt_kms.c already
has inlcuded igt_core.h

Regards,
Kamil

>  #ifdef HAVE_LIBGEN_H
>  #include <libgen.h>
>  #endif
> @@ -271,6 +272,10 @@
>   *	&num; It is not mandatory and allows overriding default values.
>   *	[DUT]
>   *	SuspendResumeDelay=10
> + *
> + *	&num; The following option define the timeout (in seconds) for detection feature
> + *	&num; (waiting for a connector status)
> + *	DisplayDetectTimeout=10.0
>   * ]|
>   *
>   * Some specific configuration options may be used by specific parts of IGT,
> @@ -379,6 +384,21 @@ static bool stderr_needs_sentinel = false;
>  
>  static int _igt_dynamic_tests_executed = -1;
>  
> +/**
> + * default_display_detect_timeout: Timeout for display detection, in seconds
> + */
> +static double default_display_detect_timeout;
> +
> +static void igt_set_default_display_detect_timeout(double timeout)
> +{
> +	default_display_detect_timeout = timeout;
> +}
> +
> +double igt_default_display_detect_timeout(void)
> +{
> +	return default_display_detect_timeout;
> +}
> +
>  static void print_backtrace(void)
>  {
>  #ifndef HAVE_LIBUNWIND
> @@ -1003,6 +1023,7 @@ static void common_init_config(void)
>  {
>  	GError *error = NULL;
>  	int ret = 0;
> +	static double timeout = 0.0;
>  
>  	igt_key_file = igt_load_igtrc();
>  
> @@ -1023,6 +1044,18 @@ static void common_init_config(void)
>  	if (ret != 0)
>  		igt_set_autoresume_delay(ret);
>  
> +	if (igt_key_file)
> +		timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
> +						&error);
> +	if (error) {
> +		igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
> +			  DEFAULT_DETECT_TIMEOUT);
> +		g_clear_error(&error);
> +		timeout = DEFAULT_DETECT_TIMEOUT;
> +	}
> +	g_clear_error(&error);
> +	igt_set_default_display_detect_timeout(timeout);
> +
>  	/* Adding filters, order .igtrc, IGT_DEVICE, --device filter */
>  	if (igt_device_filter_count() > 0)
>  		igt_debug("Notice: using --device filters:\n");
> diff --git a/lib/igt_core.h b/lib/igt_core.h
> index 6845f853c980..daf83cb5380d 100644
> --- a/lib/igt_core.h
> +++ b/lib/igt_core.h
> @@ -143,6 +143,13 @@ struct _GKeyFile *igt_load_igtrc(void);
>   */
>  #define IGT_EXIT_ABORT 112
>  
> +/**
> + * DEFAULT_DETECT_TIMEOUT
> + *
> + * Default timeout in second used for some screen detection
> + * functions. It can be overiden by option DetectTimeout in the .igtrc file.
> + */
> +#define DEFAULT_DETECT_TIMEOUT 10.0
>  void __igt_assert_in_outer_scope(void);
>  
>  bool __igt_fixture(void);
> @@ -446,6 +453,8 @@ void __igt_subtest_group_restore(int, int);
>   */
>  #define igt_main() igt_main_args(NULL, NULL, NULL, NULL, NULL)
>  
> +double igt_default_display_detect_timeout(void);
> +
>  const char *igt_test_name(void);
>  void igt_simple_init_parse_opts(int *argc, char **argv,
>  				const char *extra_short_opts,
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0b05ddd72977..692d75b70ecc 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -60,6 +60,7 @@
>  #include "igt_debugfs.h"
>  #include "igt_device.h"
>  #include "igt_pipe_crc.h"
> +#include "igt_rc.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
>  #ifdef HAVE_CHAMELIUM
> 
> -- 
> 2.52.0
> 
