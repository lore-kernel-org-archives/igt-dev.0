Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5E8EB28FE
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:37:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794A710E65D;
	Fri,  6 Feb 2026 09:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bD/zFjba";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD65010E65D
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770370659; x=1801906659;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=8omRHbnzMAMKDpEGYD1Eg2tErbKSCS5tcNUl6riHL60=;
 b=bD/zFjbaRox041zM9N85rJ7WpBk9cxu2OsFH1RINUNeyvXKQpbxrap1v
 Jou7m1udYyUqtXKZTYKSxgeY0kJnkUJ8AXNOeCv7ZFwiO435rH4bycT2f
 KM+8SEX/Q4B7NMk3jZGYJFI7ORMYsVxqNZU1VveN/3AKyoHXWWuSlj1B/
 sTuApc/CkZSuAPhN4thafipnE6HLDwIfHq5TKODi3wZdX11jat1cj+6QS
 gt8pvYjb1HI1ojtu1NQKLV+3H4SVbyrhjMPt0pER7k/Iu9HODQo6L9t4e
 wQwXdFRqxgxYOTU8LVYUqcl1/a/64MTaG2tsaL+DBDjS5el/Lse8mJF0/ Q==;
X-CSE-ConnectionGUID: BJoZT5YdSTaiQFps4oPdnw==
X-CSE-MsgGUID: bY+QOFg7SQKMcxthMvB8Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70593221"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="70593221"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:37:39 -0800
X-CSE-ConnectionGUID: m6jUV0OEQymVw9V2YQW4yA==
X-CSE-MsgGUID: Y0bHOCwaRsetE1tbPxXVDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; d="scan'208";a="241491429"
Received: from lfiedoro-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.129])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2026 01:37:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 08/12] tests/kms: Convert to for_each_crtc(), part 3
In-Reply-To: <20260205133019.9161-9-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
 <20260205133019.9161-9-ville.syrjala@linux.intel.com>
Date: Fri, 06 Feb 2026 11:37:34 +0200
Message-ID: <eec5020e8af067dd3ba6aa64fa77afcdee0e1299@intel.com>
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

On Thu, 05 Feb 2026, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Convert more for_each_pipe()s into for_each_crtc(). In
> these cases the iterator is stored in some kind of data
> structure (data->pipe) which we still want to keep up to
> date to avoid functional changes.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

>
> Done with cocci:
>  #include "scripts/iterators.cocci"
>
> @change@
> iterator name for_each_pipe;
> iterator name for_each_crtc;
> identifier PIPE;
> expression DISPLAY, X;
> @@
> - for_each_pipe(DISPLAY, X->PIPE)
> + for_each_crtc(DISPLAY, crtc)
> {
> + X->PIPE =3D crtc->pipe;
> <...
> (
> - igt_crtc_for_pipe(..., X->PIPE)
> + crtc
> |
> - kmstest_pipe_name(X->PIPE)
> + igt_crtc_name(crtc)
> |
> - X->PIPE
> + crtc->pipe
> )
> ...>
> }
>
> @depends on change@
> identifier FUNC, CRTC;
> @@
> FUNC(...)
> {
> + igt_crtc_t *CRTC;
> <+...
> for_each_crtc(..., CRTC) { ... }
> ...+>
> }
>
> @@
> identifier CRTC;
> @@
>  igt_crtc_t *CRTC;
> ...
> - igt_crtc_t *CRTC;
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp=
_linktrain_fallback.c
> index d74575f91d83..fdb5b782cf02 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -88,23 +88,25 @@ static void setup_pipe_on_outputs(data_t *data,
>  				      igt_output_t *outputs[],
>  				      int *output_count)
>  {
> +	igt_crtc_t *crtc;
>  	int i =3D 0;
>=20=20
>  	igt_require_f(data->n_pipes >=3D *output_count,
>  		      "Need %d pipes to assign to %d outputs\n",
>  		      data->n_pipes, *output_count);
>=20=20
> -	for_each_pipe(&data->display, data->pipe) {
> +	for_each_crtc(&data->display, crtc) {
> +		data->pipe =3D crtc->pipe;
>  		if (i >=3D *output_count)
>  			break;
>  		/*
>  		 * TODO: add support for modes requiring joined pipes
>  		 */
>  		igt_info("Setting pipe %s on output %s\n",
> -			 kmstest_pipe_name(data->pipe),
> +			 igt_crtc_name(crtc),
>  			 igt_output_name(outputs[i]));
>  		igt_output_set_crtc(outputs[i],
> -				    igt_crtc_for_pipe(outputs[i]->display, data->pipe));
> +				    crtc);
>  		i++;
>  	}
>  }

--=20
Jani Nikula, Intel
