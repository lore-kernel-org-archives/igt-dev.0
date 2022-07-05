Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84CD418BE07
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Jul 2022 16:30:50 +0000 (UTC)
Date: Tue, 5 Jul 2022 18:30:26 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YsRnIkMy1SfGWEuE@kamilkon-desk1>
References: <20220630085523.291024-1-bhanuprakash.modem@intel.com>
 <20220630085523.291024-2-bhanuprakash.modem@intel.com>
 <YsMXrBugzMMS0Ao3@kamilkon-desk1>
 <c209ddaf-4acf-025c-f24e-d7c114b0564c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c209ddaf-4acf-025c-f24e-d7c114b0564c@intel.com>
Subject: Re: [igt-dev] [i-g-t V7 1/2] tests/kms_color: Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2022-07-04 at 22:44:05 +0530, Modem, Bhanuprakash wrote:
> On Mon-04-07-2022 10:09 pm, Kamil Konieczny wrote:
> > Hi Bhanuprakash,
> > 
> > On 2022-06-30 at 14:25:22 +0530, Bhanuprakash Modem wrote:
> > > Convert the existing subtests to dynamic subtests at pipe level.
> > > 
> > > V2:
> > > * Fix nested igt_fixture in igt_subtest
> > > V3:
> > > * Fix to not dereferencing a NULL pointer
> > > V4:
> > > * Add output name to subtest
> > > V5:
> > > * Rebase
> > > V6:
> > > * Fix typos in test description
> > > V7:
> > > * Added comments back to ctm tets.
> > > 
> > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > ---
> > >   tests/kms_color.c        | 556 +++++++++++++++++++++------------------
> > >   tests/kms_color_helper.h |   1 +
> > >   2 files changed, 298 insertions(+), 259 deletions(-)
> > > 
> > > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > > index ba06947b..85f3b32d 100644
> > > --- a/tests/kms_color.c
> > > +++ b/tests/kms_color.c

[cut]

> > >    * through the GAMMA_LUT property.
> > >    */
> > > -static void test_pipe_legacy_gamma_reset(data_t *data,
> > > +static bool test_pipe_legacy_gamma_reset(data_t *data,
> > >   					 igt_plane_t *primary)
> > >   {
> > >   	const double ctm_identity[] = {
> > > @@ -324,6 +327,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
> > >   	struct drm_color_lut *lut;
> > >   	drmModePropertyBlobPtr blob;
> > >   	igt_output_t *output;
> > > +	bool ret = true;
> > >   	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> > > @@ -373,10 +377,12 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
> > >   				    data->gamma_lut_size));
> > >   	lut = (struct drm_color_lut *) blob->data;
> > >   	for (i = 0; i < data->gamma_lut_size; i++)
> > > -		igt_assert(lut[i].red == 0 &&
> > > +		ret &=(lut[i].red == 0 &&
> > >   			   lut[i].green == 0 &&
> > >   			   lut[i].blue == 0);
> > >   	drmModeFreePropertyBlob(blob);
> > > +	if(!ret)
> > > +		goto end;
> > >   	/* Set a gamma LUT using the legacy ioctl and verify
> > >   	 * the content of the GAMMA_LUT property is changed
> > > @@ -411,7 +417,7 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
> > >   				    legacy_lut_size));
> > >   	lut = (struct drm_color_lut *) blob->data;
> > >   	for (i = 0; i < legacy_lut_size; i++)
> > > -		igt_assert(lut[i].red == 0xffff &&
> > > +		ret &= (lut[i].red == 0xffff &&
> > >   			   lut[i].green == 0xffff &&
> > >   			   lut[i].blue == 0xffff);
> > >   	drmModeFreePropertyBlob(blob);
> > > @@ -421,6 +427,8 @@ static void test_pipe_legacy_gamma_reset(data_t *data,
> > >   	free_lut(degamma_linear);
> > >   	free_lut(gamma_zero);
> > > +end:
> > 
> > Should this be before free ?
> 
> Thanks Kamil,
> 
> It seems, Yes. You have great eyes :-)
> I am fine if you want to submit a fix, else I'll do.
> 
> - Bhanu

Feel free to send it,

Regards,
Kamil

> 
> > 
> > Regards,
> > Kamil
> > 
> > > +	return ret;
> > >   }
> > >   /*
> > > @@ -677,130 +685,99 @@ prep_pipe(data_t *data, enum pipe p)

[cut]
