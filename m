Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05AB103E304
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:26:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EC6F10E9D3;
	Thu, 12 Mar 2026 10:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hy1K/gzo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D3810E9CF
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773311212; x=1804847212;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=bygm0ojLVGj1/I+7iJN+u/QgNiUeWA125UpOq7MAvxY=;
 b=hy1K/gzomAMPscbkwtSebPL+9oG/8pysAj0yzSzpxs7ef57MFDt8Ft02
 Fz4h2vzRFZS1rXUZo9kihHnRw/evrylU2lLh58qd3wi2Z5DqH4SfcWEsk
 5PmGd8uqO/UOA6QhOtpEDAxSnysG6wsX6tiAxsNmJRs2RJUKu5Gpp1Ajh
 Jmnjg0do/m9zA9wF/AZlhSAm7Pf/kyYMVjIkSoiVNq8A2d6KWTqlzKf73
 xJbGf54TC+PJWnawjGmTATGBHA+UfcJGktFnWcYOpMNJgGhh4m8jcZPYu
 ZqrX/mPPGRFoNA4Rh0epcraCwXdPac0lucGQh8MgrTL32JPdRt14W/7et g==;
X-CSE-ConnectionGUID: IuTC0plQSk+dQ+GAnAs0RQ==
X-CSE-MsgGUID: hWy9q5IqQEysP8qWkJKRnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="85752452"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="85752452"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:26:52 -0700
X-CSE-ConnectionGUID: m7tOEMAnS2W2aE+B9nVhSw==
X-CSE-MsgGUID: VINSMiqZQMWm/FBjuBjyvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="219880378"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:26:50 -0700
Date: Thu, 12 Mar 2026 11:26:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kunal1.joshi@intel.com, Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH i-g-t v4 1/1] tests/kms_vrr: Skip LOBF test when aux-less
 ALPM is not enabled
Message-ID: <20260312102648.l26g7fa7xgtrlbwg@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 igt-dev@lists.freedesktop.org, swati2.sharma@intel.com,
 kunal1.joshi@intel.com,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>
References: <20260310103601.3195341-1-mohammed.bilal@intel.com>
 <20260310103601.3195341-2-mohammed.bilal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260310103601.3195341-2-mohammed.bilal@intel.com>
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
On 2026-03-10 at 16:05:54 +0530, Mohammed Bilal wrote:
> LOBF (Link Off Between Frames) is a feature introduced in eDP 1.5+
> that can operate in both Aux-less ALPM (Advanced Link Power Management)
> and AUX-Wake ALPM modes.Currently, the test relies on Aux-less
> ALPM support to validate LOBF functionality.
> 
> Add a helper to read the Aux-less ALPM status from debugfs and
> skip the LOBF subtest when Aux-less ALPM is not enabled on the
> panel, avoiding false failures on systems that may only support
> AUX-Wake ALPM or lack ALPM support entirely.
> 
> v4:
> -Rebase
> 
> v3:
> -Rebase
> 
> v2:
> -Update commit message (Jeevan)
> -Update commit message for LOBF/ALPM clarification (Kamil)
> -Rename function to igt_is_aux_less_alpm_enabled (Sebastien)
> -Add explicit null-termination (Sebastien)
> -Add igt_info() log (Sowmiya)
> 
> Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> ---
>  lib/igt_kms.c   | 32 ++++++++++++++++++++++++++++++++
>  lib/igt_kms.h   |  1 +
>  tests/kms_vrr.c |  4 ++++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 0b05ddd72..45defa694 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -6591,6 +6591,38 @@ bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name)
>  	return strstr(buf, "LOBF status: enabled");
>  }
>  
> +/**
> + * igt_is_aux_less_alpm_enabled
> + * @drmfd: A drm file descriptor
> + * @connector_name: Name of the libdrm connector we're going to use
> + *
> + * Check if Aux-less ALPM (Advanced Link Power Management) mode is enabled by reading
> + * the i915_edp_lobf_info debugfs.
> + *
> + * Return: True if aux-less ALPM is enabled.
> + */
> +bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name)
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
> +	if (res <= 0) {
> +		igt_info("Failed to read i915_edp_lobf_info for %s\n", connector_name);
> +		return false;
> +	}
> +
> +	buf[res < sizeof(buf) ? res : sizeof(buf) - 1] = '\0';
> +
> +	return strstr(buf, "Aux-less alpm status: enabled") != NULL;

You could drop ' != NULL' from here:

	return strstr(buf, "Aux-less alpm status: enabled");

Regards,
Kamil

> +}
> +
>  /**
>   * igt_get_output_max_bpc:
>   * @drmfd: A drm file descriptor
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 081613a4b..1fe9b23ca 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1238,6 +1238,7 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display);
>  bool igt_fit_modes_in_bw(igt_display_t *display);
>  bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output);
>  bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
> +bool igt_is_aux_less_alpm_enabled(int drmfd, char *connector_name);
>  unsigned int igt_get_output_max_bpc(igt_output_t *output);
>  unsigned int igt_get_crtc_current_bpc(igt_crtc_t *crtc);
>  void igt_assert_output_bpc_equal(igt_crtc_t *crtc, igt_output_t *output,
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index c15ab0aba..ec0692b2f 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -908,6 +908,10 @@ test_lobf(data_t *data, igt_crtc_t *crtc, igt_output_t *output,
>  			igt_skip("i915_edp_lobf_status not present for %s\n",
>  				 igt_output_name(output));
>  
> +		if (!igt_is_aux_less_alpm_enabled(data->drm_fd, output->name))
> +			igt_skip("%s: Aux-less ALPM not enabled, LOBF not supported.\n",
> +				 igt_output_name(output));
> +
>  		if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
>  		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
>  			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> -- 
> 2.48.1
> 
