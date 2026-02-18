Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564C8E9A047
	for <igt-dev@archiver.kernel.org>; Wed, 18 Feb 2026 11:01:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044E610E5A3;
	Wed, 18 Feb 2026 11:01:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="htEdY1V5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BEA10E5A3
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Feb 2026 11:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771412489; x=1802948489;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=JkyBIVbBnhlG8d515odSBNY+Dh5V5QdTkeCT7Arl+bk=;
 b=htEdY1V56TuzkzuzGiH3EQgi+O+yZf4Wxe8P1PoMeTA+NMYqelwXQRLq
 5OGHbpLZAnbg3U3MqWHU9yfJ4ZM+B3DCmZ/Q2hgYp9dmcnRux8xGUdkpp
 iyTMQyW7IxeNZjFJv5gVDHtAdP0PRUTuJ7Po9o28YiSoPncU+30WemHae
 cbPK4Xin0B9OTCV0hit1zoILNfw/Jxx5oi1uv2m42uevZ+SDpxP/i/E/b
 l4KED1ffIVRAcPg9SNPcgc0KLKa1lUYGUjrWlQ+KQLPTLfeKEiivxzy67
 Y7XYcRkC4b62+NI/AsTLe4W8VqZVpAH0noWdX8v8bk4CcXSisuKbyKuKM w==;
X-CSE-ConnectionGUID: buZwf8ieRQSsNxtkVi7lVg==
X-CSE-MsgGUID: xmsmGzuxT7K6rb9lZOTeTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72576545"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="72576545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:01:29 -0800
X-CSE-ConnectionGUID: kklNjCaMRkmTaX6RGOq9JQ==
X-CSE-MsgGUID: S5YZWXgRSVKRBdVya9uR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="251857541"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 03:01:27 -0800
Date: Wed, 18 Feb 2026 12:01:07 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, jeevan.b@intel.com,
 kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 sebastian.brzezinka@intel.com
Subject: Re: [PATCH v1 1/2] tests/kms_vrr: Skip LOBF test when aux-less ALPM
 is not enabled
Message-ID: <20260218110107.5huxxdkxor5ywvfh@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, jeevan.b@intel.com,
 kunal1.joshi@intel.com, sameer.lattannavar@intel.com,
 sebastian.brzezinka@intel.com
References: <20260218080511.2534901-1-mohammed.bilal@intel.com>
 <20260218080511.2534901-2-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218080511.2534901-2-mohammed.bilal@intel.com>
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

Hi Mohammed,
On 2026-02-18 at 13:34:34 +0530, Mohammed Bilal wrote:
> LOBF can operate in either Aux-less or Aux-wake ALPM modes. However,

Please decipher here what ALPM is, my guess after googling:
Aggressive Link Power Management (ALPM)

> due to uncertainty around eDP version dependency and its impact
> on LOBF execution, we currently restrict the test to run only when
> Aux-less ALPM is enabled to avoid unexpected failures.
> 
> Add a helper to read the Aux-less ALPM status from debugfs and
> skip the LOBF subtest when Aux-less ALPM is not enabled
> on the panel, ensuring proper skip behavior and preventing
> false negatives on unsupported configurations.
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> ---
>  lib/igt_kms.c   | 28 ++++++++++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  6 ++++++
>  3 files changed, 35 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 5c4879604..48684b4b3 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6578,6 +6578,34 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
>  	return strstr(buf, "LOBF status: enabled");
>  }
>  
> +/**
> + * igt_get_aux_less_alpm_status
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Check if Aux-less ALPM mode is enabled by reading

Here also, write full name and then use shortcut for ALPM,
for example:

 * Check if Aux-less Aggressive Link Power Management (ALPM)
 * mode is enabled by reading ....

Regards,
Kamil

> + * the i915_edp_lobf_info debugfs.
> + *
> + * Return: True if aux-less ALPM is enabled.
> + */
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name)
> +{
> +	char buf[256];
> +	int fd, res;
> +
> +	fd = igt_debugfs_connector_dir(drmfd, connector_name, O_RDONLY);
> +	if (fd < 0)
> +		return false;
> +
> +	res = igt_debugfs_simple_read(fd, "i915_edp_lobf_info", buf, sizeof(buf));
> +	close(fd);
> +
> +	if (res <= 0)
> +		return false;
> +
> +	return strstr(buf, "Aux-less alpm status: enabled") != NULL;
> +}
> +
>  /**
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index dedc3f880..a1f52f452 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1257,6 +1257,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>  bool igt_fit_modes_in_bw(igt_display_t *display);
>  bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> +bool igt_get_aux_less_alpm_status(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>  unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe);
>  void igt_assert_output_bpc_equal(int drmfd, enum pipe pipe,
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 811596ec2..e46e98727 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1013,6 +1013,12 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
>  			return false;
>  		}
>  
> +		if (!igt_get_aux_less_alpm_status(data->drm_fd, output->name)) {
> +			igt_info("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
> +				 igt_output_name(output));
> +			return false;
> +		}
> +
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> -- 
> 2.48.1
> 
