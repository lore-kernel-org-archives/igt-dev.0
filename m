Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D8F6EA71
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2020 14:23:22 +0000 (UTC)
Date: Wed, 8 Apr 2020 17:23:09 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20200408142309.GB28695@ideak-desk.fi.intel.com>
References: <20200407131633.1350311-1-arkadiusz.hiler@intel.com>
 <20200408141539.GA28695@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408141539.GA28695@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] tests/kms_vblank: Make sure that we
 have a mode set
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 05:15:39PM +0300, Imre Deak wrote:
> On Tue, Apr 07, 2020 at 04:16:27PM +0300, Arkadiusz Hiler wrote:
> > Subtest 'invalid' was depending on a "leftover" mode set by something
> > external (usually fbcon) in order to work.
> > 
> > Let's make the test more robust by setting the mode explicitly.
> > 
> > v2: set flag for the pipe we are using (Imre)
> > 
> > Cc: Imre Deak <imre.deak@intel.com>
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > ---
> >  tests/kms_vblank.c | 27 ++++++++++++++++++++++-----
> >  1 file changed, 22 insertions(+), 5 deletions(-)
> > 
> > diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> > index a895ab80..7b5f3426 100644
> > --- a/tests/kms_vblank.c
> > +++ b/tests/kms_vblank.c
> > @@ -472,12 +472,26 @@ static void invalid_subtest(data_t *data, int fd)
> >  {
> >  	union drm_wait_vblank vbl;
> >  	unsigned long valid_flags;
> > +	enum pipe pipe;
> > +	igt_output_t* output;
> > +	bool found = false;
> > +	int base_flags;
> > +
> > +	/* we need to have a mode set, otherwise we will get EINVAL no matter what */
> > +	for_each_pipe_with_single_output(&data->display, pipe, output) {
> > +		data->pipe = pipe;
> > +		found = true;
> > +		break;
> > +	}
> > +
> > +	igt_require_f(found, "No outputs connected = no vblanks\n");
> > +	prepare_crtc(data, fd, output);
> >  
> > -	igt_display_require_output_on_pipe(&data->display, 0);
> > +	base_flags = _DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(data->pipe);
> >  
> >  	/* First check all is well with a simple query */
> >  	memset(&vbl, 0, sizeof(vbl));
> > -	vbl.request.type = DRM_VBLANK_RELATIVE;
> > +	vbl.request.type = base_flags;
> >  	igt_assert_eq(wait_vblank(fd, &vbl), 0);
> >  
> >  	valid_flags = (_DRM_VBLANK_TYPES_MASK |
> > @@ -486,7 +500,9 @@ static void invalid_subtest(data_t *data, int fd)
> >  
> >  	/* pick some interesting invalid permutations */
> >  	memset(&vbl, 0, sizeof(vbl));
> > -	vbl.request.type = _DRM_VBLANK_RELATIVE | ~valid_flags;
> > +	vbl.request.type = base_flags;
> > +	vbl.request.type |= kmstest_get_vbl_flag(data->pipe);
> > +	vbl.request.type |= ~valid_flags;
> 
> Or just vbl.request.type = base_flags | ~valid_flags; ?
> 
> >  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> >  	for (int bit = 0; bit < 32; bit++) {
> >  		int err;
> > @@ -495,7 +511,7 @@ static void invalid_subtest(data_t *data, int fd)
> >  			continue;
> >  
> >  		memset(&vbl, 0, sizeof(vbl));
> > -		vbl.request.type = _DRM_VBLANK_RELATIVE | (1 << bit);
> > +		vbl.request.type = base_flags | (1 << bit);
> >  		err = wait_vblank(fd, &vbl);
> >  		igt_assert_f(err == -EINVAL,
> >  			     "vblank wait with invalid request.type bit %d [0x%08x] did not report -EINVAL, got %d\n",
> > @@ -504,10 +520,11 @@ static void invalid_subtest(data_t *data, int fd)
> >  
> >  	/* check the maximum pipe, nobody should have that many pipes! */
> >  	memset(&vbl, 0, sizeof(vbl));
> > -	vbl.request.type = _DRM_VBLANK_RELATIVE;
> > +	vbl.request.type = base_flags;
> >  	vbl.request.type |= _DRM_VBLANK_SECONDARY;
> >  	vbl.request.type |= _DRM_VBLANK_FLAGS_MASK;
> >  	igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
> 
> Semi-unrelated, but not sure what the 'maximum pipe' means, or how this
> will pass now if it's not pipe A we use. I think it wants to test a
> non-existing or disabled pipe, which needs to be fixed. (as a follow-up)

It happens to pass, because _DRM_VBLANK_SIGNAL is an invalid flag
nowadays.

> Reviewed-by: Imre Deak <imre.deak@intel.com>
> 
> > +	cleanup_crtc(data, fd, output);
> >  }
> >  
> >  igt_main
> > -- 
> > 2.24.1
> > 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
