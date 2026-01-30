Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F221E6BF0D
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 13:38:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E946110E9FB;
	Fri, 30 Jan 2026 13:38:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VHN17+IR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EB8110E9FB
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 13:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769780288; x=1801316288;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=X2Njq4wg2kubuBdNXcx2ZYLtbNvAKJZCFANPiv7kGic=;
 b=VHN17+IRVBdYTv5Vi8tpEgDqKhe3qchkhm9viLpfgpTR2G0D3ao8hNmD
 IfKjr50oUdhPTn4wzNO6lLa7jPffjjx/pI2Mvq+AvoR8Z7iAOuPDWyI3y
 l5MrIx1U5BXlZog0OQiiVcwe34uQry4ZYgEC4zi2wboN6doaXJr3+9FXn
 de/3/kd4QC/FyhEy1wF/4SjsJpGljz2A9UNB0544pw3S4KMlDM9/mPcBw
 OT5+YMRTKHIdWVVxyKZcYm/t5fcRNEWCAUNCQtVe9pVHgHI2XtTe8fjnz
 4tpapIrIX2p9X/W9K+p6ECjgIBJ4vIUxyUiQzYNGb8TNGenppAGVwgt4G g==;
X-CSE-ConnectionGUID: so8qvIqtQoqUt4/zkADN4Q==
X-CSE-MsgGUID: 7scR4kYRREm6Yy98nVhcLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74654446"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="74654446"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:38:08 -0800
X-CSE-ConnectionGUID: uYzqaKR4TiqL6tlPVNCFZw==
X-CSE-MsgGUID: 7FdCk3cCQHWgceCac4nL2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="208856388"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.77])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 05:38:06 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/15] lib/kms: Introduce for_each_crtc*()
In-Reply-To: <20260130105237.14481-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260130105237.14481-1-ville.syrjala@linux.intel.com>
 <20260130105237.14481-2-ville.syrjala@linux.intel.com>
Date: Fri, 30 Jan 2026 15:38:03 +0200
Message-ID: <8ce09d54c3f0208797f5b256e8aa27d29c6f4fbf@intel.com>
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

On Fri, 30 Jan 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Add for_each_crtc*() as the crtc based replacement for
> the for_each_pipe*() iterators (which will eventually get
> nuked).
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  lib/igt_kms.h | 68 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 432c67d11780..a4857ea0e574 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -682,6 +682,19 @@ static inline bool igt_pipe_connector_valid(enum pip=
e pipe, igt_output_t *output
>  		output->config.valid_crtc_idx_mask & (1 << (pipe));
>  }
>=20=20
> +/**
> + * igt_crtc_connector_valid:
> + * @crtc: CRTC to check.
> + * @output: #igt_output_t to check.
> + *
> + * Checks whether the given CRTC and output can be used together.
> + */
> +static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output=
_t *output)
> +{
> +	return igt_output_is_connected(output) &&
> +		output->config.valid_crtc_idx_mask & (1 << crtc->pipe);

So should this use crtc->crtc_offset instead of crtc->pipe? Or will that
bring complications during the conversions that try to remain
functionally unchanged?

(And should crtc->crtc_offset really be named crtc_index?)

> +}
> +
>  #define for_each_if(condition) if (!(condition)) {} else
>=20=20
>  /**
> @@ -744,6 +757,23 @@ static inline bool igt_pipe_connector_valid(enum pip=
e pipe, igt_output_t *output
>  	for_each_pipe_static(pipe) \
>  		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
>=20=20
> +/**
> + * for_each_crtc:
> + * @display: a pointer to an #igt_display_t structure
> + * @crtc: The CRTC
> + *
> + * This for loop iterates over all CRTCs.
> + *
> + * Note that this cannot be used to enumerate per-CRTC subtest names sin=
ce it
> + * depends upon runtime probing of the actual kms driver that is being t=
ested.
> + * Use #for_each_pipe_static instead.
> + */
> +#define for_each_crtc(display, crtc) \
> +	for ((crtc) =3D &(display)->crtcs[0]; \
> +	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
> +	     (crtc)++) \
> +		for_each_if ((crtc)->valid)

I feel like for_each_crtc() should iterate the CRTCs in CRTC order, not
pipe order. What's the plan? Are we eventually going to have ->crtcs[]
in CRTC order? And then do something special when some tests want to use
pipe order?

The other day I was looking at making ->n_crtcs and thus
igt_display_n_crtcs() reflect the actual CRTC count, not IGT_MAX_PIPES,
and it's also complicated because too many places depend on
igt_display_n_crtcs() indicating the size of ->crtcs[] and that being
indexed by pipe instead of CRTC index. So that's also dependent on
indexing ->crtcs[] with CRTC index.

Anyway, the loops here make my head spin, but it's all

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I'd just like to hear what the plan is wrt the above questions, perhaps
recorded in the commit message.

BR,
Jani.


> +
>  /**
>   * for_each_pipe_with_valid_output:
>   * @display: a pointer to an #igt_display_t structure
> @@ -765,6 +795,27 @@ static inline bool igt_pipe_connector_valid(enum pip=
e pipe, igt_output_t *output
>  			for_each_if ((((output) =3D &(display)->outputs[con__]), \
>  						igt_pipe_connector_valid((pipe), (output))))
>=20=20
> +/**
> + * for_each_crtc_with_valid_output:
> + * @display: a pointer to an #igt_display_t structure
> + * @crtc: CRTC for which this @crtc / @output combination is valid.
> + * @output: The output for which this @crtc / @output combination is val=
id.
> + *
> + * This for loop is called over all connected outputs. This function
> + * will try every combination of @crtc and @output.
> + *
> + * If you only need to test a single output for each pipe, use
> + * for_each_crtc_with_single_output(), if you only need an
> + * output for a single CRTC, use igt_get_single_output_for_pipe().
> + */
> +#define for_each_crtc_with_valid_output(display, crtc, output) \
> +	for ((output) =3D &(display)->outputs[0], (crtc) =3D &(display)->crtcs[=
0]; \
> +	     assert(igt_can_fail()), (crtc) < &(display)->crtcs[(display)->n_cr=
tcs] && \
> +		     (output) < &(display)->outputs[(display)->n_outputs]; \
> +	     (output) =3D (output) + 1 < &(display)->outputs[(display)->n_outpu=
ts] ? \
> +		     (output) + 1 : ((crtc)++, &(display)->outputs[0])) \
> +		for_each_if ((crtc)->valid && igt_crtc_connector_valid((crtc), (output=
)))
> +
>  igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
>  					   igt_output_t **chosen_outputs);
>=20=20
> @@ -785,6 +836,23 @@ igt_output_t **__igt_pipe_populate_outputs(igt_displ=
ay_t *display,
>  		for_each_if (*__output && \
>  			     ((pipe) =3D (__output - __outputs), (output) =3D *__output, 1))
>=20=20
> +/**
> + * for_each_crtc_with_single_output:
> + * @display: a pointer to an #igt_display_t structure
> + * @crtc: The CRTC for which this @crtc / @output combination is valid.
> + * @output: The output for which this @crtc / @output combination is val=
id.
> + *
> + * This loop is called over all CRTCs, and will try to find a compatible=
 output
> + * for each CRTC. Unlike for_each_pipe_with_valid_output(), this functio=
n will
> + * be called at most once for each pipe.
> + */
> +#define for_each_crtc_with_single_output(display, crtc, output) \
> +	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
> +	     **__output =3D __igt_pipe_populate_outputs((display), __outputs); \
> +		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
> +		for_each_if (*__output && \
> +			     ((crtc) =3D igt_crtc_for_pipe((display), (__output - __outputs))=
, (output) =3D *__output, 1))
> +
>  /**
>   * for_each_valid_output_on_pipe:
>   * @display: a pointer to an #igt_display_t structure

--=20
Jani Nikula, Intel
