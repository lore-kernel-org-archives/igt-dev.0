Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA833F0180E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 09:13:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1E610ECB4;
	Fri,  6 Mar 2026 09:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NLy12JCB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0805010ECB6
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772788434; x=1804324434;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=bZ/EjDLyJMV92COp2VYIynZFPrwbGV5C7rlmKmwJ6m4=;
 b=NLy12JCBfc4aJn9zkb+yKVm2Wc4pj8RDqpLPOm+mYRzFHAhX4dtA8H1U
 zYVvQ4bufcpiLVXtRyk6XFfZTF45PZgz3ucPKz+D1UW3lihlVvABoGfd1
 glfps+2kNaS6ATvwz2AOxZOCImx8QqJPcvtkwQdIdLrasar23StjR/bHz
 IHPhAudrhwfBhjlSv5+o0qV2gilV+SgJGXbwrckqptbltPrOMSZNM3TH/
 RipR4m+kEBySSHVTr5qyd+AdxmraO+kjBPCv4/vrmPh7eQ7NIAEYzZCh5
 WmjXu5dVlimy038Wmu6hgNTwpgFvlUE3JqBeqv/1Mrb7s9w/nXrUcNPJl g==;
X-CSE-ConnectionGUID: +rRWG9srT62lyMOTj+gE1g==
X-CSE-MsgGUID: fMMJm/t5RHWaF9Dsce01DA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91468480"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91468480"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:13:53 -0800
X-CSE-ConnectionGUID: s+TNavAdR1uMvOQdxgLnFQ==
X-CSE-MsgGUID: rMb8vzW1TOW9a0XT/FzQHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="223644396"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 01:13:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] lib/kms: convert output->pending_pipe to
 output->pending_crtc
In-Reply-To: <aammluBQpXREUBMG@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305140851.2318968-1-jani.nikula@intel.com>
 <aammluBQpXREUBMG@intel.com>
Date: Fri, 06 Mar 2026 11:13:48 +0200
Message-ID: <be8fae304eeefdbcd6a5f422d9ad251421776147@intel.com>
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

On Thu, 05 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Mar 05, 2026 at 04:08:51PM +0200, Jani Nikula wrote:
>> We're finally ready to convert enum pipe pending_pipe to igt_crtc_t
>> *pending_crtc.
>>=20
>> igt_output_refresh() gets changed to using crtc_index instead of the
>> pipe for crtc index mask.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  lib/igt_kms.c | 93 ++++++++++++++++++++++++++-------------------------
>>  lib/igt_kms.h |  2 +-
>>  2 files changed, 48 insertions(+), 47 deletions(-)
>>=20
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 9ebf77b74d04..32f959b2bead 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -2600,8 +2600,8 @@ void igt_output_refresh(igt_output_t *output)
>>  	igt_display_t *display =3D output->display;
>>  	unsigned long crtc_idx_mask =3D 0;
>>=20=20
>> -	if (output->pending_pipe !=3D PIPE_NONE)
>> -		crtc_idx_mask =3D 1 << output->pending_pipe;
>> +	if (output->pending_crtc)
>> +		crtc_idx_mask =3D 1 << output->pending_crtc->crtc_index;
>>=20=20
>>  	kmstest_free_connector_config(&output->config);
>>=20=20
>> @@ -2620,8 +2620,8 @@ void igt_output_refresh(igt_output_t *output)
>>  		igt_atomic_fill_connector_props(display, output,
>>  			IGT_NUM_CONNECTOR_PROPS, igt_connector_prop_names);
>>=20=20
>> -	LOG(display, "%s: Selecting pipe %s\n", output->name,
>> -	    kmstest_pipe_name(output->pending_pipe));
>> +	LOG(display, "%s: Selecting CRTC %s\n", output->name,
>> +	    igt_crtc_name(output->pending_crtc));
>>  }
>>=20=20
>>  static int
>> @@ -2741,7 +2741,7 @@ static void igt_crtc_reset(igt_crtc_t *crtc)
>>=20=20
>>  static void igt_output_reset(igt_output_t *output)
>>  {
>> -	output->pending_pipe =3D PIPE_NONE;
>> +	output->pending_crtc =3D NULL;
>>  	output->use_override_mode =3D false;
>>  	memset(&output->override_mode, 0, sizeof(output->override_mode));
>>=20=20
>> @@ -2932,7 +2932,7 @@ void igt_display_reset_outputs(igt_display_t *disp=
lay)
>>  		 * We don't assign each output a pipe unless
>>  		 * a CRTC is set with igt_output_set_crtc().
>>  		 */
>> -		output->pending_pipe =3D PIPE_NONE;
>> +		output->pending_crtc =3D NULL;
>>  		output->id =3D resources->connectors[i];
>>  		output->display =3D display;
>>=20=20
>> @@ -3438,19 +3438,20 @@ void igt_display_fini(igt_display_t *display)
>>  static void igt_display_refresh(igt_display_t *display)
>>  {
>>  	igt_output_t *output;
>> +	unsigned int crtc_index_in_use_mask =3D 0;
>>  	int i;
>>=20=20
>> -	unsigned long pipes_in_use =3D 0;
>> -
>>         /* Check that two outputs aren't trying to use the same pipe */
>>  	for (i =3D 0; i < display->n_outputs; i++) {
>>  		output =3D &display->outputs[i];
>>=20=20
>> -		if (output->pending_pipe !=3D PIPE_NONE) {
>> -			if (pipes_in_use & (1 << output->pending_pipe))
>> +		if (output->pending_crtc) {
>> +			unsigned int crtc_index_mask =3D 1 << output->pending_crtc->crtc_ind=
ex;
>> +
>> +			if (crtc_index_in_use_mask & crtc_index_mask)
>>  				goto report_dup;
>>=20=20
>> -			pipes_in_use |=3D 1 << output->pending_pipe;
>> +			crtc_index_in_use_mask |=3D crtc_index_mask;
>>  		}
>>=20=20
>>  		if (output->force_reprobe)
>> @@ -3463,35 +3464,23 @@ report_dup:
>>  	for (; i > 0; i--) {
>>  		igt_output_t *b =3D &display->outputs[i - 1];
>>=20=20
>> -		igt_assert_f(output->pending_pipe !=3D
>> -			     b->pending_pipe,
>> -			     "%s and %s are both trying to use pipe %s\n",
>> +		if (!b->pending_crtc)
>> +			continue;
>> +
>> +		igt_assert_f(output->pending_crtc !=3D b->pending_crtc,
>> +			     "%s and %s are both trying to use CRTC %s\n",
>>  			     igt_output_name(output), igt_output_name(b),
>> -			     kmstest_pipe_name(output->pending_pipe));
>> +			     igt_crtc_name(output->pending_crtc));
>>  	}
>>  }
>>=20=20
>> +/*
>> + * Return the pending CRTC (i.e. the CRTC that should drive this output=
 after
>> + * the commit(), or NULL if the user hasn't specified a CRTC to use.
>> + */
>>  igt_crtc_t *igt_output_get_driving_crtc(igt_output_t *output)
>>  {
>> -	igt_display_t *display =3D output->display;
>> -	enum pipe pipe;
>> -
>> -	if (output->pending_pipe =3D=3D PIPE_NONE) {
>> -		/*
>> -		 * The user hasn't specified a pipe to use, return none.
>> -		 */
>> -		return NULL;
>> -	} else {
>> -		/*
>> -		 * Otherwise, return the pending pipe (ie the pipe that should
>> -		 * drive this output after the commit()
>> -		 */
>> -		pipe =3D output->pending_pipe;
>> -	}
>> -
>> -	igt_assert(pipe >=3D 0 && pipe < igt_display_n_crtcs(display));
>> -
>> -	return igt_crtc_for_pipe(display, pipe);
>> +	return output->pending_crtc;
>>  }
>>=20=20
>>  static igt_plane_t *igt_crtc_get_plane(igt_crtc_t *crtc, int plane_idx)
>> @@ -3685,10 +3674,13 @@ static igt_output_t *igt_crtc_get_output(igt_crt=
c_t *crtc)
>>  	igt_display_t *display =3D crtc->display;
>>  	int i;
>>=20=20
>> +	if (!crtc)
>
> I wasn't expecting NULL here, and we dereference crtc->display
> above already. Is there some place we might pass NULL?

Right, I just wanted to avoid the below loop matching two NULL crtcs,
but that obviously can't happen due to the crtc->display dereference.

I'll remove the check.


>
>> +		return NULL;
>> +
>>  	for (i =3D 0; i < display->n_outputs; i++) {
>>  		igt_output_t *output =3D &display->outputs[i];
>>=20=20
>> -		if (output->pending_pipe =3D=3D crtc->pipe)
>> +		if (output->pending_crtc =3D=3D crtc)
>>  			return output;
>>  	}
>>=20=20
>> @@ -5285,12 +5277,21 @@ void igt_output_set_crtc(igt_output_t *output, i=
gt_crtc_t *crtc)
>>=20=20
>>  	igt_assert(output->name);
>>=20=20
>> -	if (output->pending_pipe !=3D PIPE_NONE)
>> +	if (output->pending_crtc)
>>  		old_crtc =3D igt_output_get_driving_crtc(output);
>>=20=20
>> +	/*
>> +	 * Ensure pending_crtc is always valid.
>> +	 *
>> +	 * FIXME: Ensure we only have valid crtc objects around in general, so
>> +	 * we can remove this check.
>> +	 */
>> +	if (!crtc->valid)
>> +		crtc =3D NULL;

OTOH, this one does need to check for crtc !=3D NULL before dereferencing
because NULL crtc is explicitly passed to igt_output_set_crtc().

BR,
Jani.


>> +
>>  	LOG(display, "%s: set_crtc(%s)\n", igt_output_name(output),
>>  	    igt_crtc_name(crtc));
>> -	output->pending_pipe =3D crtc ? crtc->pipe : PIPE_NONE;
>> +	output->pending_crtc =3D crtc;
>>=20=20
>>  	if (old_crtc) {
>>  		igt_output_t *old_output;

--=20
Jani Nikula, Intel
