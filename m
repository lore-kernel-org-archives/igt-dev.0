Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF6C10E2B0
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 19:52:45 +0000 (UTC)
Date: Tue, 8 Nov 2022 18:52:28 -0100
From: Melissa Wen <mwen@igalia.com>
To: Alex Hung <alex.hung@amd.com>
Message-ID: <20221108195228.cyxt5aqqgqnkseof@mail.igalia.com>
References: <20221107195227.1741453-1-mwen@igalia.com>
 <58e72002-e40a-7557-ea8c-f5fe1c315c96@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58e72002-e40a-7557-ea8c-f5fe1c315c96@amd.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_color: check degamma and
 gamma props in CTM subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org,
 kernel-dev@igalia.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 11/07, Alex Hung wrote:
> 
> 
> On 2022-11-07 12:52, Melissa Wen wrote:
> > Some CTM subtests generate and set degamma/gamma LUTs without checking
> > if these properties are supported by the driver. Therefore, if degamma
> > and gamma are used in the subtest, check the color properties before
> > generate and set LUTs. If these properties are not supported, these
> > subtests will skip instead of failing.
> > 
> > v2:
> > - remove unnecessary set_luts check (Alex Hung)
> > 
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
> > ---
> >   tests/kms_color.c | 9 ++++++---
> >   1 file changed, 6 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > index e4dc2465..1902cd0c 100644
> > --- a/tests/kms_color.c
> > +++ b/tests/kms_color.c
> > @@ -472,9 +472,6 @@ static bool test_pipe_ctm(data_t *data,
> >   	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
> > -	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
> > -	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> > -
> >   	igt_output_set_pipe(output, primary->pipe->pipe);
> >   	igt_output_override_mode(output, mode);
> > @@ -502,6 +499,12 @@ static bool test_pipe_ctm(data_t *data,
> >   	 * rounding issues and inaccuracies leading to crc mismatch.
> >   	 */
> >   	if (memcmp(before, after, sizeof(color_t))) {
> > +		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_DEGAMMA_LUT));
> > +		igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_GAMMA_LUT));
> > +
> > +		degamma_linear = generate_table(data->degamma_lut_size, 1.0);
> > +		gamma_linear = generate_table(data->gamma_lut_size, 1.0);
> > +
> >   		set_degamma(data, primary->pipe, degamma_linear);
> >   		set_gamma(data, primary->pipe, gamma_linear);
> >   	} else {
> 
> Reviewed-by: Alex Hung <alex.hung@amd.com>
Hi Alex,

Thanks for review.

I just sent a v3 to address the crashes detected by intel CI.
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8062/index.html

Degamma and gamma LUT should be initialized as NULL to free_lut works
correctly.

I added your r-b in v3.
https://patchwork.freedesktop.org/patch/510802/?series=110500&rev=3

Let me know if it's still okay for you.

Melissa
