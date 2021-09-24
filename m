Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 981C36E18F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 04:06:09 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 24 Sep 2021 04:06:07 +0000
Message-ID: <DM6PR11MB4379FDCF74DE4285FF47CF7E89A49@DM6PR11MB4379.namprd11.prod.outlook.com>
References: <20210916141827.17720-1-vidya.srinivas@intel.com>
 <20210920081702.19241-1-vidya.srinivas@intel.com>
 <20210923175531.4ebytoonjlipdhr7@outlook.office365.com>
In-Reply-To: <20210923175531.4ebytoonjlipdhr7@outlook.office365.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_concurrent: Fix regression in
 test_resolution_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "markyacoub@google.com" <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Sent: Thursday, September 23, 2021 11:26 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash
> <bhanuprakash.modem@intel.com>; markyacoub@google.com
> Subject: Re: [PATCH i-g-t] tests/kms_concurrent: Fix regression in
> test_resolution_with_output
>=20
> On 09/20, Vidya Srinivas wrote:
> > Staring commit fea0e38e690c30c6 "Making the test more generic"
> > test_resolution_with_output introduced setting igt_output_set_pipe to
> > PIPE_NONE. This is triggering atomic check failure resulting in
> > "enabled/connectors mismatch" under
> drm_atomic_helper_check_modeset.
> > Patch fixes this issue.
> >
> > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > ---
> >  tests/kms_concurrent.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c index
> > 25c67eb469d1..47c441a5a3f7 100644
> > --- a/tests/kms_concurrent.c
> > +++ b/tests/kms_concurrent.c
> > @@ -268,7 +268,8 @@ test_resolution_with_output(data_t *data, enum
> > pipe pipe, int max_planes, igt_ou
> >
> >  		/* switch to lower resolution */
> >  		igt_output_override_mode(output, mode_lo);
> > -		igt_output_set_pipe(output, PIPE_NONE);
> > +		if (is_amdgpu_device(data->drm_fd))
> > +			igt_output_set_pipe(output, PIPE_NONE);
> >  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >
> >  		/* switch back to higher resolution */
> > --
> > 2.33.0
> >
>=20
> I checked this patch with AMD devices, and it works fine, for this
> reason, feel free to add my:
>=20
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Tested-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> Just a note, I think with this change, drivers based on tinyDrm might
> pass this test.

Hello Siqueira, thank you so much for the RB and test confirmation.
@Modem, Bhanuprakash, can you kindly help on this review and merge? Thank y=
ou.

Regards
Vidya

>=20
> Thanks
>=20
> --
> Rodrigo Siqueira
> https://siqueira.tech
