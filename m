Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500FED3C912
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 14:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC84710E6E2;
	Wed, 10 Dec 2025 14:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P8jsfidL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 821DB10E6E2
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 14:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765376494; x=1796912494;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=gabP4uk2NztbsR+IbDgKGJNbDzHTxKG5v0M7QbK12xM=;
 b=P8jsfidLT+UVnj+mekPQ96Y78JtKYWU7m/r11NN8uLBsAUPDgW2HkADC
 IklxnLVpunBBTjSStqKvHwBM+wVfTTYfobxRrJzPwaKy6hZjNm9Nl021j
 DnRtA0PWHLyXUiE5MkEh99fQ/36/KUtusmFaAzsaAlLKTjCp2inbiNyN1
 E+iOqf592gokPIhbib1c9HUAFXWynTHrkef2AKY7lT075R1FXg36XHWN7
 ka7Tdiaku5nDi7t7LHN2btbGHiUKTzIA1wDU6o2ul/GmuGr7skHTJBF0+
 DatAGC8yImWau8jA7RMOWWrv+GIcoB+yv8Lq7v6tlHW5TKYDHLo++TAUm w==;
X-CSE-ConnectionGUID: run3+XtpSVijMrZvC4cy8g==
X-CSE-MsgGUID: KIQSlfMNR5W5I21PC3Y/xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67235538"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="67235538"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:21:33 -0800
X-CSE-ConnectionGUID: H40+ELnjT12sOFMi3gda/Q==
X-CSE-MsgGUID: lO+/r2IBR72KgiIyYXgZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="200694223"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.207])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 06:21:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 01/10] tests/intel/kms_dp_linktrain_fallback:
 Reduce side effects in igt_output_set_pipe() args
In-Reply-To: <20251210093903.15934-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
 <20251210093903.15934-2-ville.syrjala@linux.intel.com>
Date: Wed, 10 Dec 2025 16:21:28 +0200
Message-ID: <17d2a21cf2e4956a18b141b26ddfb280938d6341@intel.com>
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

On Wed, 10 Dec 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Move the i++ out from the igt_output_set_pipe(() arguments to
> reduce the number of side effects there. This avoids breaking
> things during upcoming cocci refactoring that wants to duplicate
> the expression passed as the first argument.
>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  tests/intel/kms_dp_linktrain_fallback.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp=
_linktrain_fallback.c
> index ac398ec5bb70..10c4d9e65ebf 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -103,7 +103,8 @@ static void setup_pipe_on_outputs(data_t *data,
>  		igt_info("Setting pipe %s on output %s\n",
>  			 kmstest_pipe_name(data->pipe),
>  			 igt_output_name(outputs[i]));
> -		igt_output_set_pipe(outputs[i++], data->pipe);
> +		igt_output_set_pipe(outputs[i], data->pipe);
> +		i++;
>  	}
>  }

--=20
Jani Nikula, Intel
