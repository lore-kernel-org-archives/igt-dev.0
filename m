Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8508AD2D10F
	for <igt-dev@archiver.kernel.org>; Tue, 13 Jan 2026 14:41:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 271B910E2B9;
	Tue, 13 Jan 2026 14:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gobiQsdP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFF710E2B9
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jan 2026 14:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768315277; x=1799851277;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=tv2vrfSmzaEZh5HxIwG5RqFGF53XpCHHXP/7zteLfgM=;
 b=gobiQsdPCsZPuwgczy1lqZRFaYFOVVx2ZuLjJWt76aLE65hr/G6Unjdm
 52OS5ijmxoRBY/cIfPCGRaSyz0/EG87zYWM1gH0nXwqyKKKS8JMAZTk/y
 m8AY14k48zX9evz3dfH7zVIVuIul9dQF6XbIXFJSQsSq1gIy7e+G4qRtR
 exYzGAZgQnQ57ZCkwT0Z5egFcpt0VgkEFFHC6bNZtcZMAbH5v9wHHPvSI
 LLpSHbtLpKPYDlOVyWnzv1L6H/U6gANIluWF65z903LJoJWz0kpkjjRCV
 gGGN9zpoEm5eelfy1eLIPNdNHk6DaSQXYWxOs0L82p0a3zo4Qn5NG51xl Q==;
X-CSE-ConnectionGUID: hYs5uJLHSW6fQj+mEsl5Sg==
X-CSE-MsgGUID: vxkEkNqHSTWQahAzR4imBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69656577"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="69656577"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:41:17 -0800
X-CSE-ConnectionGUID: KLjr/RtBSJiRMZsi9toGbA==
X-CSE-MsgGUID: 0yv+QZt0Taao9r9R+njRXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="204195010"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.36])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 06:41:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 8/8] lib/kms: Turn igt_pipe_connector_valid() into
 a function
In-Reply-To: <20260113120439.12577-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260113120439.12577-1-ville.syrjala@linux.intel.com>
 <20260113120439.12577-9-ville.syrjala@linux.intel.com>
Date: Tue, 13 Jan 2026 16:41:13 +0200
Message-ID: <9bf12cd355d9f292fa7b746ac06b44acce09327f@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 13 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> There is no need for igt_pipe_connector_valid() to be a macro,
> just make it a function. This gets us type safety, and will
> help us do more changes later using coccinelle.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index e1044101707c..a271c94a97fd 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -669,9 +669,11 @@ static inline bool igt_output_is_connected(igt_outpu=
t_t *output)
>   *
>   * Checks whether the given pipe and output can be used together.
>   */
> -#define igt_pipe_connector_valid(pipe, output) \
> -	(igt_output_is_connected((output)) && \
> -	       (output->config.valid_crtc_idx_mask & (1 << (pipe))))
> +static inline bool igt_pipe_connector_valid(enum pipe pipe, igt_output_t=
 *output)
> +{
> +	return igt_output_is_connected(output) &&
> +		output->config.valid_crtc_idx_mask & (1 << (pipe));

Here, too, using pipe for crtc idx mask is wrong both before and after
the patch. But I'm sure this will help the eventual changes fixing that.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +}
>=20=20
>  #define for_each_if(condition) if (!(condition)) {} else

--=20
Jani Nikula, Intel
