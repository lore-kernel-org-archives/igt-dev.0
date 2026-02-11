Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 985A9EA3F27
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:10:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B0AB10E060;
	Wed, 11 Feb 2026 09:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lMv4Psmr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA40B10E060
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770801038; x=1802337038;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=qGVwhMEOKOrnWLchcmtJ9SuhWflaa88tDTjOek78Y98=;
 b=lMv4Psmr/DsU8jBeD36quE9bkvEQfHgyT0UgxSHk87OIxb/OHVII4nEa
 LWjT/e5txMZIvj6nS4USFqEqFMM7eDIgJfOnSbHAanBwaHfVzHnTOpi06
 ICbSIZrpZX6Sdio4wnRqBczJMuEXJyIfn/V0G9YBe/TmF3ryFf+zSx8Uf
 4GLESRWNsRwHLYSjubdPy60vcVwHPJwD9QV82zHK+G0I1sVVah2q+B7q4
 uCJUL2BMEEAxdrh/fA9o8II9zQf1D2MYAXgyEdlpymolwG3p/354+hI8p
 J+MpYZqlGi915++rN+J6dV+NfdjeIxj8lejt/rRSd62IYn83dPtKtdloj w==;
X-CSE-ConnectionGUID: JMZUWtWdSby60J6lod/MlA==
X-CSE-MsgGUID: 4/sh6NIOTSq1VFgGaAydEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83385091"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="83385091"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:10:32 -0800
X-CSE-ConnectionGUID: 1P2KQ8+7SBOYuNwiOo7NRg==
X-CSE-MsgGUID: uT0LbdarR6OhfaPp3PKHuw==
X-ExtLoop1: 1
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:10:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 07/11] lib/igt_kms: use for_each_crtc() for
 iterating CRTCs
In-Reply-To: <aYttSeO152W8Z-kN@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1770736961.git.jani.nikula@intel.com>
 <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
 <aYttSeO152W8Z-kN@intel.com>
Date: Wed, 11 Feb 2026 11:10:27 +0200
Message-ID: <f0874979d29c952cea525fa43184bc04af2d22c4@intel.com>
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

On Tue, 10 Feb 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Feb 10, 2026 at 05:23:48PM +0200, Jani Nikula wrote:
>> The loop still figures out the pipe mask, keep using pipe here. The main
>> thing is not using the loop index as pipe, as that is subject to change
>> in the future.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/igt_kms.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index c4be889dc696..63fd8095c551 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -3622,16 +3622,14 @@ igt_output_t **__igt_pipe_populate_outputs(igt_d=
isplay_t *display, igt_output_t
>>  {
>>  	unsigned full_pipe_mask =3D 0, assigned_pipes =3D 0;
>>  	igt_output_t *output;
>> +	igt_crtc_t *crtc;
>>  	int i, j;
>>=20=20
>>  	memset(chosen_outputs, 0,
>>  	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
>>=20=20
>> -	for (i =3D 0; i < igt_display_n_crtcs(display); i++) {
>> -		igt_crtc_t *crtc =3D igt_crtc_for_pipe(display, i);
>> -		if (crtc->valid)
>> -			full_pipe_mask |=3D (1 << i);
>> -	}
>> +	for_each_crtc(display, crtc)
>> +		full_pipe_mask |=3D crtc->pipe;
>
> 1 << crtc->pipe

*facepalm* of course

>
>>=20=20
>>  	/*
>>  	 * Try to assign all outputs to the first available CRTC for
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
