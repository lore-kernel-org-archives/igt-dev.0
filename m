Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNkN+XTzeUuWPLj0g=rGRdBU9sxECeVbeaYgGZ+Lg2jkg@mail.gmail.com>
References: <20210216143220.98382-1-chris@chris-wilson.co.uk>
 <CAM0jSHNkN+XTzeUuWPLj0g=rGRdBU9sxECeVbeaYgGZ+Lg2jkg@mail.gmail.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 16 Feb 2021 17:14:53 +0000
Message-ID: <161349569361.8311.10448637823546925278@build.alporthouse.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_reloc: Verify relocations
 with pinned scanout framebuffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Matthew Auld (2021-02-16 16:49:28)
> On Tue, 16 Feb 2021 at 14:32, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> >
> > In light of the VT-d workarounds, we may introduce padding around the
> > scanout vma. This should not affect relocations referencing the scanout
> > on !full-ppgtt where we leak the GGTT address of scanout to users.
> >
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > ---
> >  tests/i915/gem_exec_reloc.c | 102 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 102 insertions(+)
> >
> > diff --git a/tests/i915/gem_exec_reloc.c b/tests/i915/gem_exec_reloc.c
> > index cc9b8cd6d..98960bb84 100644
> > --- a/tests/i915/gem_exec_reloc.c
> > +++ b/tests/i915/gem_exec_reloc.c
> > @@ -26,7 +26,9 @@
> >
> >  #include "i915/gem.h"
> >  #include "igt.h"
> > +#include "igt_device.h"
> >  #include "igt_dummyload.h"
> > +#include "igt_kms.h"
> >  #include "sw_sync.h"
> >
> >  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl relocations.");
> > @@ -1286,6 +1288,83 @@ static void concurrent(int i915, int num_common)
> >         igt_assert_eq(result, 0);
> >  }
> >
> > +static uint32_t
> > +pin_scanout(igt_display_t *dpy, igt_output_t *output, struct igt_fb *fb)
> > +{
> > +       drmModeModeInfoPtr mode;
> > +       igt_plane_t *primary;
> > +
> > +       mode = igt_output_get_mode(output);
> > +
> > +       igt_create_pattern_fb(dpy->drm_fd, mode->hdisplay, mode->vdisplay,
> > +                             DRM_FORMAT_XRGB8888,
> > +                             LOCAL_I915_FORMAT_MOD_X_TILED, fb);
> > +
> > +       primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +       igt_plane_set_fb(primary, fb);
> > +
> > +       igt_display_commit2(dpy, COMMIT_LEGACY);
> > +
> > +       return fb->gem_handle;
> > +}
> > +
> > +static void scanout(int i915,
> > +                   igt_display_t *dpy,
> > +                   const struct intel_execution_engine2 *e)
> 
> Missing feeding the engine into the execbuf?

Oops. Pretty pointless in making it loop over the engines without
selecting one!
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
