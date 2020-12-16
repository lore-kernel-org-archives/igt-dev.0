Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOhCKfoFNqZUnHqbsNC-hWXzKQjK8jzH4FB+B4hnSinHA@mail.gmail.com>
References: <20201215210658.1188718-1-chris@chris-wilson.co.uk>
 <20201215210658.1188718-2-chris@chris-wilson.co.uk>
 <CAM0jSHOhCKfoFNqZUnHqbsNC-hWXzKQjK8jzH4FB+B4hnSinHA@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 16 Dec 2020 09:36:14 +0000
Message-ID: <160811137407.1420.12667858510374604278@build.alporthouse.com>
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t 2/2] i915/gem_softpin: Check
 full placement control under full-ppgtt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Matthew Auld (2020-12-16 09:31:41)
> On Tue, 15 Dec 2020 at 21:07, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > With full-ppgtt, userspacew has complete control over their GTT. Verify
> > that we can place an object at the very beginning and the very end of
> > our GTT.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  tests/i915/gem_softpin.c | 45 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> > index fcaf8ef30..a530e89d3 100644
> > --- a/tests/i915/gem_softpin.c
> > +++ b/tests/i915/gem_softpin.c
> > @@ -97,6 +97,47 @@ static void test_invalid(int fd)
> >         }
> >  }
> >
> > +static uint32_t batch_create(int i915, uint64_t *sz)
> > +{
> > +       const uint32_t bbe = MI_BATCH_BUFFER_END;
> > +       struct drm_i915_gem_create create = {
> > +               .size = sizeof(bbe),
> > +       };
> > +
> > +       if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CREATE, &create)) {
> > +               igt_assert_eq(errno, 0);
> > +               return 0;
> > +       }
> > +
> > +       gem_write(i915, create.handle, 0, &bbe, sizeof(bbe));
> > +
> > +       *sz = create.size;
> > +       return create.handle;
> > +}
> > +
> > +static void test_zero(int i915)
> > +{
> > +       uint64_t sz;
> > +       struct drm_i915_gem_exec_object2 object = {
> > +               .handle = batch_create(i915, &sz),
> > +               .flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS,
> > +       };
> > +       struct drm_i915_gem_execbuffer2 execbuf = {
> > +               .buffers_ptr = to_user_pointer(&object),
> > +               .buffer_count = 1,
> > +       };
> > +
> > +       /* Under full-ppgtt, we have complete control of the GTT */
> > +
> > +       object.offset = 0;
> > +       gem_execbuf(i915, &execbuf);
> > +
> > +       object.offset = gem_aperture_size(i915) - sz;
> > +       gem_close(i915, object.handle);
> > +
> > +       gem_close(i915, object.handle);
> > +}
> > +
> >  static void test_softpin(int fd)
> >  {
> >         const uint32_t size = 1024 * 1024;
> > @@ -559,6 +600,10 @@ igt_main
> >
> >         igt_subtest("invalid")
> >                 test_invalid(fd);
> > +       igt_subtest("zero") {
> > +               igt_require(gem_uses_full_ppgtt(fd));
> > +               test_zero(fd);
> > +       }
> 
> Worth adding igt_subtest("full") somewhere, which tries to occupy the
> entire 48b ppGTT? Maybe using pad_to_size?

No. I'll let you work out why :)
-Chris
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
