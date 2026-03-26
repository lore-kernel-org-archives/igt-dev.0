Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C479010A3D8D
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 12:36:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756AE10E95D;
	Thu, 26 Mar 2026 12:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AivMzGT8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F398810E9C8
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 12:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774528608; x=1806064608;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zx+UwMtVBmzUALmYPZLJyiiBZxmnbPRlq7Xj1OIVJ/M=;
 b=AivMzGT8JTLP92q2jmuNaz81ekeI4yT/I0fBwmJYjpnlAvDUeG522+9z
 MucWmZEebB2wuqcCcUOrnceGoLHGPnhJbWCfYa/crGrQv/usQABhL6WGk
 Q4I5l1r6Wcv1XNuInwepI7+2wQ+6LEdLGXXKi8kttoyUnGRZNApI1IUK5
 BX8+MEXRGz+2+tnOUG/LXnTOg4YtLL0u/BOl8cVGGOIkDkdDtW5OCgpxk
 uCpKhJltR2yx4GZKfJCT/Y6do+hrjAFsy22tk6n0XMmDKM+8kmyeo0LOW
 DHLStJWZdtvKxcpzIf9iK5Z3z37gfbUaZBhB6aErrcKZ8oV1NRpCPRg15 w==;
X-CSE-ConnectionGUID: E7qiuauUQYOXsBZvvyy4Rw==
X-CSE-MsgGUID: RzHTl8K8Q5y3U8fo7RjArw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79489820"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="79489820"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:36:48 -0700
X-CSE-ConnectionGUID: oUr0PHcuRrmVKg46tmFz8g==
X-CSE-MsgGUID: BmbgoO+hRR+tPLMzNDEkkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; d="scan'208";a="255490233"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 05:36:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 3/3] lib/kms: use CRTC index for
 __igt_output_crtc_populate()
In-Reply-To: <acUaMLSxqYTN63hG@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1774267502.git.jani.nikula@intel.com>
 <5f13f6e087209ee05ffc9e3cfd0f58cf2f82b83a.1774267502.git.jani.nikula@intel.com>
 <acUaMLSxqYTN63hG@intel.com>
Date: Thu, 26 Mar 2026 14:36:41 +0200
Message-ID: <64ef0c1588a03306a91f6310c158188380001d37@intel.com>
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

On Thu, 26 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Mar 23, 2026 at 02:06:26PM +0200, Jani Nikula wrote:
>> Fill the valid output/crtc combos in __igt_output_crtc_populate() using
>> CRTC index instead of pipe. This avoids buffer overruns if we reduce
>> igt_display_n_crtcs() to the actual number of CRTCs on the device.
>>=20
>> To keep the for_each_crtc_with_single_output() iteration in pipe order
>> on Intel devices, sort the resulting array in a separate
>> step. Presumably the performance impact of qsort() on an array of at
>> most 16 elements is neglible.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/igt_kms.c | 29 +++++++++++++++++++++++------
>>  1 file changed, 23 insertions(+), 6 deletions(-)
>>=20
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 42329ad0303c..b92bb16aaf9c 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -3588,6 +3588,18 @@ bool output_is_internal_panel(igt_output_t *outpu=
t)
>>  	}
>>  }
>>=20=20
>> +static int output_crtc_pipe_compare(const void *_a, const void *_b)
>> +{
>> +	const igt_output_crtc_t *a =3D _a, *b =3D _b;
>> +
>> +	/* pipe order for valid output/crtc combos */
>> +	if (a->crtc && b->crtc)
>> +		return a->crtc->pipe - b->crtc->pipe;
>> +
>> +	/* valid combos before empty elements */
>> +	return !b->crtc - !a->crtc;
>> +}
>> +
>>  igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, i=
gt_output_crtc_t *chosen_outputs)
>>  {
>>  	unsigned int full_crtc_index_mask =3D 0, assigned_crtc_index_mask =3D =
0;
>> @@ -3634,17 +3646,17 @@ igt_output_crtc_t *__igt_output_crtc_populate(ig=
t_display_t *display, igt_output
>>  					/* We found an unassigned CRTC, use it! */
>>  					found =3D true;
>>  					assigned_crtc_index_mask |=3D 1 << crtc->crtc_index;
>> -					chosen_outputs[crtc->pipe].output =3D output;
>> -					chosen_outputs[crtc->pipe].crtc =3D crtc;
>> -				} else if (!chosen_outputs[crtc->pipe].output ||
>> -					   output_is_internal_panel(chosen_outputs[crtc->pipe].output)) {
>> +					chosen_outputs[crtc->crtc_index].output =3D output;
>> +					chosen_outputs[crtc->crtc_index].crtc =3D crtc;
>> +				} else if (!chosen_outputs[crtc->crtc_index].output ||
>> +					   output_is_internal_panel(chosen_outputs[crtc->crtc_index].outpu=
t)) {
>>  					/*
>>  					 * Overwrite internal panel if not
>>  					 * assigned, external outputs are faster
>>  					 * to do modesets
>>  					 */
>> -					chosen_outputs[crtc->pipe].output =3D output;
>> -					chosen_outputs[crtc->pipe].crtc =3D crtc;
>> +					chosen_outputs[crtc->crtc_index].output =3D output;
>> +					chosen_outputs[crtc->crtc_index].crtc =3D crtc;
>>  				}
>>  			}
>>=20=20
>> @@ -3654,6 +3666,11 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt=
_display_t *display, igt_output
>>  		}
>>  	}
>>=20=20
>> +	/* For Intel, sort the output/crtc combos in pipe order */
>> +	if (is_intel_device(display->drm_fd))
>> +		qsort(chosen_outputs, igt_display_n_crtcs(display),
>> +		      sizeof(*chosen_outputs), output_crtc_pipe_compare);
>
> Maybe one day we can drop this sorting entirely. But that needs some
> testing, so this seems good for the moment.

Yeah, maybe we'll eventually want to switch to CRTC order iteration in
for_each_crtc() too, but I just don't want to open that can of worms
here yet.

> Didn't spot anything bad, so for the series
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed.

BR,
Jani.


>
>> +
>>  	return chosen_outputs;
>>  }
>>=20=20
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
