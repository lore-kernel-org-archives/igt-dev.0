Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <7c8a0bc1-3e3f-4551-7e62-9f21bed92192@intel.com>
References: <20200218122648.1252102-1-chris@chris-wilson.co.uk>
 <20200218174219.1301127-1-chris@chris-wilson.co.uk>
 <7c8a0bc1-3e3f-4551-7e62-9f21bed92192@intel.com>
Message-ID: <158204880357.8112.17918282201515978143@skylake-alporthouse-com>
Date: Tue, 18 Feb 2020 18:00:03 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_exec_schedule: Exercise
 implicit ordering between engines
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quoting Antonio Argenziano (2020-02-18 17:56:10)
> 
> 
> On 18/02/20 09:42, Chris Wilson wrote:
> > Check that reads are serialised after a write, and that a subsequent
> > write is after all reads.
> > 
> > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Antonio Argenziano <antonio.argenziano@intel.com>
> > Cc: Sravan Kumar Nedunoori <sravan.kumar.nedunoori@intel.com>
> > ---
> >   tests/i915/gem_exec_schedule.c | 73 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 73 insertions(+)
> > 
> > diff --git a/tests/i915/gem_exec_schedule.c b/tests/i915/gem_exec_schedule.c
> > index a20985864..cfd06aa55 100644
> > --- a/tests/i915/gem_exec_schedule.c
> > +++ b/tests/i915/gem_exec_schedule.c
> > @@ -241,6 +241,61 @@ static void fifo(int fd, unsigned ring)
> >       igt_assert_eq_u32(result, 2);
> >   }
> >   
> > +enum implicit_dir {
> > +     READ_WRITE = 0x1,
> > +     WRITE_READ = 0x2,
> > +};
> > +
> > +static void implicit_rw(int i915, unsigned ring, enum implicit_dir dir)
> > +{
> > +     IGT_CORK_FENCE(cork);
> > +     unsigned int count;
> > +     uint32_t scratch;
> > +     uint32_t result;
> > +     int fence;
> > +
> > +     count = 0;
> > +     for_each_physical_engine(other, i915) {
> > +             if (eb_ring(other) == ring)
> > +                     continue;
> > +
> > +             count++;
> > +     }
> > +     igt_require(count);
> > +
> > +     scratch = gem_create(i915, 4096);
> > +     fence = igt_cork_plug(&cork, i915);
> > +
> > +     if (dir & WRITE_READ)
> > +             store_dword_fenced(i915, 0,
> > +                                ring, scratch, 0, -ring,
> > +                                fence, I915_GEM_DOMAIN_RENDER);
> > +
> > +     for_each_physical_engine(other, i915) {
> > +             if (eb_ring(other) == ring)
> > +                     continue;
> > +
> > +             store_dword_fenced(i915, 0,
> > +                                eb_ring(other), scratch, 0, eb_ring(other),
> > +                                fence, 0);
> > +     }
> > +
> > +     if (dir & READ_WRITE)
> > +             store_dword_fenced(i915, 0,
> > +                                ring, scratch, 0, ring,
> > +                                fence, I915_GEM_DOMAIN_RENDER);
> > +
> > +     unplug_show_queue(i915, &cork, ring);
> > +     close(fence);
> > +
> > +     result =  __sync_read_u32(i915, scratch, 0);
> > +     gem_close(i915, scratch);
> > +
> > +     igt_assert_neq_u32(result, -ring);
> 
> if (dir & WRITE_READ) ?

We should never have -ring in there. If we have 2 billion engines, CI
will timeout first. And ring should always be !0.

Although the symmetry is pleasing.
-Chris
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
