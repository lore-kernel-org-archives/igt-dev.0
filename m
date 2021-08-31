Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF716E051
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 18:54:45 +0000 (UTC)
Date: Tue, 31 Aug 2021 21:54:37 +0300
From: Imre Deak <imre.deak@intel.com>
Message-ID: <20210831185437.GG3458504@ideak-desk.fi.intel.com>
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-2-imre.deak@intel.com>
 <60f7c750-9ab4-8193-a019-63ff68ebd826@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <60f7c750-9ab4-8193-a019-63ff68ebd826@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/6] tests/kms_ccs: Make sure to free
 GEM and FB objects
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Aug 31, 2021 at 08:47:49PM +0300, Juha-Pekka Heikkila wrote:
> On 27.8.2021 17.57, Imre Deak wrote:
> > At the moment we're leaking the GEM and FB objects that could lead to
> > OOM if multiple subtests are run (vs. each subtest in a seperate test
> > run).
> > 
> > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > ---
> >   tests/kms_ccs.c | 15 +++++++++++----
> >   1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > index 586680ae1..f376f1c80 100644
> > --- a/tests/kms_ccs.c
> > +++ b/tests/kms_ccs.c
> > @@ -345,6 +345,10 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
> >   	if (data->flags & TEST_FAIL_ON_ADDFB2) {
> >   		igt_assert_eq(ret, -1);
> >   		igt_assert_eq(errno, EINVAL);
> > +
> > +		if (f.handles[index])
> > +			gem_close(data->drm_fd, f.handles[index]);
> > +
> 
> I guess this gem_close could be called before doing asserts.

Ah yes, the assert will continue with the next subtest, doh:/

> >   		return;
> >   	} else
> >   		igt_assert_eq(ret, 0);
> > @@ -387,7 +391,8 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >   	drmModeModeInfo *drm_mode = igt_output_get_mode(data->output);
> >   	int fb_width = drm_mode->hdisplay;
> >   	enum igt_commit_style commit;
> > -	struct igt_fb fb, fb_sprite;
> > +	struct igt_fb fb = {};
> > +	struct igt_fb fb_sprite = {};
> >   	int ret;
> >   	if (data->display.is_atomic)
> > @@ -425,7 +430,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >   	}
> >   	if (data->flags & TEST_FAIL_ON_ADDFB2)
> > -		return true;
> > +		goto out_free_fbs;
> >   	igt_plane_set_position(primary, 0, 0);
> >   	igt_plane_set_size(primary, drm_mode->hdisplay, drm_mode->vdisplay);
> > @@ -458,14 +463,16 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
> >   		igt_plane_set_position(data->plane, 0, 0);
> >   		igt_plane_set_size(data->plane, 0, 0);
> >   		igt_plane_set_fb(data->plane, NULL);
> > -		igt_remove_fb(display->drm_fd, &fb_sprite);
> >   	}
> >   	igt_plane_set_fb(primary, NULL);
> >   	igt_plane_set_rotation(primary, IGT_ROTATION_0);
> >   	igt_display_commit2(display, commit);
> > -	if (data->flags & TEST_CRC)
> > +out_free_fbs:
> > +	if (fb_sprite.fb_id)
> > +		igt_remove_fb(data->drm_fd, &fb_sprite);
> > +	if (fb.fb_id)
> >   		igt_remove_fb(data->drm_fd, &fb);
> 
> These igt_remove_fb could be called unconditionally, they do as first things
> same check for fb_id

Ok, missed that.

> >   	return true;
> > 
> 
> those are just minor comments, fix or no fix either way
> 
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
