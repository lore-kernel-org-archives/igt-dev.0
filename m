Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB4DEFCD6D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 09:27:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5406410E4B8;
	Mon,  9 Mar 2026 09:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bjTOpXr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B04BD10E4B7
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773048467; x=1804584467;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=yh6p8GQnist9tRCxibD1YGo+efTBAbYIGsJOk0gXPpw=;
 b=bjTOpXr5UkwC8zsIaYz5Smg8eCt6QeUYFnZ0qaOpMvj3ezmM4kSp/hm6
 wSPx3hZrp+dV36KWlJrLHKqIwDfc5ElUBRC67GUy677T/8QMuUzASlKqW
 sVT0qp7HO57i+MxomnNe3eghUj09tiN9yc+qGivg/SUw6ZzyrxHJX6izq
 Sj0J2DZ0s79Heh50CrqkbZca284A2geAKXylKxJFBi92GscKekoMOqRmp
 TfBK2rx+IvYuOweQ8HuKGQ+uiiHCfNxxwM80wetZBrFm4BSYEBgP9nL9B
 Ftne0I9BRFufiMnnjZhw2Nb+pV7kz5yduF4Mih/PzGOYx3aWUj7Pu91uC A==;
X-CSE-ConnectionGUID: IvH0S2PmTmC+rNylwvvGnA==
X-CSE-MsgGUID: r6cu3yjWRK2TRPsrfCJtYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73941752"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73941752"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:27:47 -0700
X-CSE-ConnectionGUID: p98lyPDKRcOXyybWNdrpKg==
X-CSE-MsgGUID: iKTnqoCMQBGjj06CFL6w2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="216229441"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 02:27:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 4/5] tests/kms_multipipe_modeset: use igt_next_crtc()
In-Reply-To: <aare1TykX5nruyn7@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1772803372.git.jani.nikula@intel.com>
 <7d66e7bd76f0a7b1caf2274eaf870c483ed75ae7.1772803372.git.jani.nikula@intel.com>
 <aare1TykX5nruyn7@intel.com>
Date: Mon, 09 Mar 2026 11:27:41 +0200
Message-ID: <e09e87cda7eb9e863290673e1c442b0eff8c3881@intel.com>
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

On Fri, 06 Mar 2026, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Fri, Mar 06, 2026 at 03:23:57PM +0200, Jani Nikula wrote:
>> The test doesn't care about pipes, but rather just another CRTC, so
>> prefer igt_next_crtc() over looping pipes and igt_crtc_for_pipe().
>>=20
>> It's all a bit subtle, but previously the test depended on consecutive
>> pipes. Using CRTC indices allows for fused off pipes in between.
>>=20
>> While at it, prefer CRTC nomenclature in the variables and messages.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  tests/kms_multipipe_modeset.c | 32 ++++++++++++++------------------
>>  1 file changed, 14 insertions(+), 18 deletions(-)
>>=20
>> diff --git a/tests/kms_multipipe_modeset.c b/tests/kms_multipipe_modeset=
.c
>> index 1980a0c61116..3c10bb1bd5fe 100644
>> --- a/tests/kms_multipipe_modeset.c
>> +++ b/tests/kms_multipipe_modeset.c
>> @@ -48,17 +48,16 @@ typedef struct {
>>  	struct igt_fb fb;
>>  } data_t;
>>=20=20
>> -static void run_test(data_t *data, int valid_outputs)
>> +static void run_test(data_t *data)
>>  {
>>  	igt_output_t *output;
>>  	igt_pipe_crc_t *pipe_crcs[IGT_MAX_PIPES] =3D { 0 };
>>  	igt_crc_t ref_crcs[IGT_MAX_PIPES], new_crcs[IGT_MAX_PIPES];
>>  	igt_display_t *display =3D &data->display;
>>  	uint16_t width =3D 0, height =3D 0;
>> -	igt_crtc_t *crtc;
>> +	igt_crtc_t *crtc =3D NULL;
>>  	igt_plane_t *plane;
>>  	drmModeModeInfo *mode;
>> -	int i =3D 0;
>>=20=20
>>  	for_each_connected_output(display, output) {
>>  		mode =3D igt_output_get_mode(output);
>> @@ -75,13 +74,12 @@ static void run_test(data_t *data, int valid_outputs)
>>=20=20
>>  	/* Collect reference CRC by Committing individually on all outputs*/
>>  	for_each_connected_output(display, output) {
>> -		crtc =3D igt_crtc_for_pipe(display, i);
>> +		crtc =3D igt_next_crtc(display, crtc);
>>  		plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>>=20=20
>>  		mode =3D NULL;
>>=20=20
>> -		pipe_crcs[i] =3D igt_crtc_crc_new(crtc,
>> -						IGT_PIPE_CRC_SOURCE_AUTO);
>> +		pipe_crcs[crtc->crtc_index] =3D igt_crtc_crc_new(crtc, IGT_PIPE_CRC_S=
OURCE_AUTO);
>>=20=20
>>  		igt_output_set_crtc(output,
>>  				    crtc);
>> @@ -93,15 +91,14 @@ static void run_test(data_t *data, int valid_outputs)
>>  		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>>=20=20
>>  		igt_display_commit2(display, COMMIT_ATOMIC);
>> -		igt_pipe_crc_collect_crc(pipe_crcs[i], &ref_crcs[i]);
>> +		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &ref_crcs[crtc-=
>crtc_index]);
>>  		igt_output_set_crtc(output, NULL);
>> -		i++;
>>  	}
>>=20=20
>> -	i =3D 0;
>>  	/* Simultaneously commit on all outputs */
>> +	crtc =3D NULL;
>>  	for_each_connected_output(display, output) {
>> -		crtc =3D igt_crtc_for_pipe(display, i);
>> +		crtc =3D igt_next_crtc(display, crtc);
>>  		plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
>>=20=20
>>  		mode =3D NULL;
>> @@ -114,22 +111,21 @@ static void run_test(data_t *data, int valid_outpu=
ts)
>>  		igt_plane_set_fb(plane, &data->fb);
>>  		igt_fb_set_size(&data->fb, plane, mode->hdisplay, mode->vdisplay);
>>  		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
>> -		i++;
>>  	}
>>=20=20
>>  	igt_display_commit2(display, COMMIT_ATOMIC);
>>=20=20
>>  	/* CRC Verification */
>> -	for (i =3D 0; i < valid_outputs; i++) {
>> -		igt_pipe_crc_collect_crc(pipe_crcs[i], &new_crcs[i]);
>> -		igt_assert_crc_equal(&ref_crcs[i], &new_crcs[i]);
>> +	for_each_crtc(display, crtc) {
>> +		igt_pipe_crc_collect_crc(pipe_crcs[crtc->crtc_index], &new_crcs[crtc-=
>crtc_index]);
>> +		igt_assert_crc_equal(&ref_crcs[crtc->crtc_index], &new_crcs[crtc->crt=
c_index]);
>
> We may not have used up all the CRTCs since we only picked one for
> each connected output. So this would need some kind of pipe_crcs[...]=3D=
=3DNULL
> check perhaps.
>
>>  	}
>>=20=20
>>  	igt_plane_set_fb(plane, NULL);
>>  	igt_remove_fb(data->drm_fd, &data->fb);
>>  }
>>=20=20
>> -static void test_multipipe(data_t *data, int num_pipes)
>> +static void test_multipipe(data_t *data, int num_crtcs)
>>  {
>>  	igt_output_t *output;
>>  	int valid_outputs =3D 0;
>> @@ -137,11 +133,11 @@ static void test_multipipe(data_t *data, int num_p=
ipes)
>>  	for_each_connected_output(&data->display, output)
>>  		valid_outputs++;
>>=20=20
>> -	igt_require_f(valid_outputs =3D=3D num_pipes,
>> +	igt_require_f(valid_outputs =3D=3D num_crtcs,
>>  		      "Number of connected outputs(%d) not equal to the "
>> -		      "number of pipes supported(%d)\n", valid_outputs, num_pipes);
>> +		      "number of CRTCs supported(%d)\n", valid_outputs, num_crtcs);
>
> Oh, apparently we do check that we have the same number of outputs and
> CRTCs. That makes no sense to me. Apparently the original intention was
> to make sure all CRTCs can be lit up simultaneously. For that we should
> only care about having at least as many outputs as CRTCs.
>
> Or more correctly we should make sure we have valid output for each
> CRTC, which given potential CRTC<->output routing constraints isn't
> even the same thing as just comparing the numbers. So it should probably
> use something like for_each_crtc_with_single_output(), and then make
> sure it actually found a valid output for every CRTC.
>
> But given the already poor state of the test, this patch doesn't=20
> seem to make it any worse so
> Reviewed-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks.

> I guess the other thing to consider is whether this test makes
> any sense at all. I'm not sure what specifically lighting up all
> the CRTCs is supposed to achieve vs. just lighting up some of them...

Yeah, the test isn't great. The documentation says, "Test simultaneous
modeset on all the supported pipes", which I guess is a valid thing to
test, though I'm not sure how likely we even are to have displays
connected to all outputs in CI.

Since we agree I'm not making this worse, I've pushed this to nuke a few
more igt_crtc_for_pipe() uses. Not all that many left, yay.


BR,
Jani.


>
>>=20=20
>> -	run_test(data, valid_outputs);
>> +	run_test(data);
>>  }
>>=20=20
>>  int igt_main()
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
