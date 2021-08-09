Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8A8889581
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 10:57:30 +0000 (UTC)
Date: Mon, 9 Aug 2021 12:57:24 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809105724.GA18660@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-52-zbigniew.kempczynski@intel.com>
 <20210809082735.GE5318@zkempczy-mobl2>
 <DM8PR11MB57198466A85E302B5351953C8DF69@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM8PR11MB57198466A85E302B5351953C8DF69@DM8PR11MB5719.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 51/56] tests/kms_flip: Adopt to use
 allocator
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala, Petri" <petri.latvala@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 09, 2021 at 12:24:10PM +0200, Modem, Bhanuprakash wrote:
> > From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com>
> > Sent: Monday, August 9, 2021 1:58 PM
> > To: igt-dev@lists.freedesktop.org
> > Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Latvala, Petri
> > <petri.latvala@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > Subject: Re: [PATCH i-g-t v4 51/56] tests/kms_flip: Adopt to use allocator
> >
> > On Fri, Aug 06, 2021 at 03:41:40PM +0200, Zbigniew Kempczyński wrote:
> > > From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > >
> > > For newer gens kernel will reject relocations returning -EINVAL
> > > so we should just provide the allocator handle to inject the hang.
> > >
> > > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > ---
> > >  tests/kms_flip.c | 14 ++++++++++----
> > >  1 file changed, 10 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> > > index f2fce8d2a..e87d571a7 100755
> > > --- a/tests/kms_flip.c
> > > +++ b/tests/kms_flip.c
> > > @@ -616,9 +616,9 @@ static void recreate_fb(struct test_output *o)
> > >     o->fb_info[o->current_fb_id].fb_id = new_fb_id;
> > >  }
> > >
> > > -static igt_hang_t hang_gpu(int fd)
> > > +static igt_hang_t hang_gpu(int fd, uint64_t ahnd)
> > >  {
> > > -   return igt_hang_ring(fd, I915_EXEC_DEFAULT);
> > > +   return igt_hang_ring_with_ahnd(fd, I915_EXEC_DEFAULT, ahnd);
> > >  }
> > >
> > >  static void unhang_gpu(int fd, igt_hang_t hang)
> > > @@ -675,6 +675,7 @@ static bool run_test_step(struct test_output *o,
> > unsigned int *events)
> > >     struct vblank_reply vbl_reply;
> > >     unsigned int target_seq;
> > >     igt_hang_t hang;
> > > +   uint64_t ahnd = 0;
> > >
> > >     target_seq = o->vblank_state.seq_step;
> > >     /* Absolute waits only works once we have a frame counter. */
> > > @@ -776,8 +777,11 @@ static bool run_test_step(struct test_output *o,
> > unsigned int *events)
> > >     igt_print_activity();
> > >
> > >     memset(&hang, 0, sizeof(hang));
> > > -   if (do_flip && (o->flags & TEST_HANG))
> > > -           hang = hang_gpu(drm_fd);
> > > +   if (do_flip && (o->flags & TEST_HANG)) {
> > > +           if (is_i915_device(drm_fd))
> > > +                   ahnd = get_reloc_ahnd(drm_fd, 0);
> > > +           hang = hang_gpu(drm_fd, ahnd);
> > > +   }
> >
> > Same issue like in kms_vblank.c - why we need is_i915_device() here if hang
> > is valid only for i915?
> 
> Please consider my comments in kms_vblank patch 52/56 in this series.
> 
> - Bhanu

Sure, thanks for fixes. I'm going to get them to the series.

--
Zbigniew

> 
> >
> > --
> > Zbigniew
> >
> > >
> > >     /* try to make sure we can issue two flips during the same frame */
> > >     if (do_flip && (o->flags & TEST_EBUSY)) {
> > > @@ -847,6 +851,8 @@ static bool run_test_step(struct test_output *o,
> > unsigned int *events)
> > >             igt_assert(do_page_flip(o, new_fb_id, false) == expected_einval);
> > >
> > >     unhang_gpu(drm_fd, hang);
> > > +   if (is_i915_device(drm_fd))
> > > +           put_ahnd(ahnd);
> > >
> > >     *events = completed_events;
> > >
> > > --
> > > 2.26.0
> > >
