Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 23 Jan 2020 12:01:57 +0100
Message-ID: <4915664.0qtKoWCMDK@jkrzyszt-desk.ger.corp.intel.com>
In-Reply-To: <11711055.DxJhndXA8j@jkrzyszt-desk.ger.corp.intel.com>
References: <20200109140125.18483-1-janusz.krzysztofik@linux.intel.com>
 <157858221040.2197.11860218526538512609@skylake-alporthouse-com>
 <11711055.DxJhndXA8j@jkrzyszt-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/prime_vgem: Examine blitter
 access path
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Sorry for replying to myself again.

On Wednesday, January 22, 2020 4:24:49 PM CET Janusz Krzysztofik wrote:
> Hi Chris,
> 
> On Thursday, January 9, 2020 4:03:30 PM CET Chris Wilson wrote:
> > Quoting Janusz Krzysztofik (2020-01-09 14:01:25)
> > > On future hardware with missing GGTT BAR we won't be able to exercise
> > > dma-buf access via that path.  An alternative to basic-gtt subtest for
> > > testing dma-buf access is required, as well as basic-fence-mmap and
> > > coherency-gtt subtest alternatives for testing WC coherency.
> > > 
> > > Access to the dma sg list feature exposed by dma-buf can be tested
> > > through blitter.  Unfortunately we don't have any equivalently simple
> > > tests that use blitter.  Provide them.
> > > 
> > > Blitter XY_SRC_COPY method implemented by igt_blitter_src_copy__raw()
> > > IGT library function has been chosen.
> > > 
> > > v2: As fast copy is not supported on platforms older than Gen 9,
> > >     use XY_SRC_COPY instead (Chris),
> > >   - add subtest descriptions.
> > > 
> > > Suggested-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > > ---
> > >  tests/prime_vgem.c | 192 +++++++++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 192 insertions(+)
> > > 
> > > diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> > > index 69ae8c9b..9ceee47a 100644
> > > --- a/tests/prime_vgem.c
> > > +++ b/tests/prime_vgem.c
> <SNIP>
> > >  
> > > +static void test_blt(int vgem, int i915)
> > > +{
> > > +       struct vgem_bo scratch;
> > > +       uint32_t prime, native;
> > > +       uint32_t *ptr;
> > > +       int dmabuf, i;
> > > +
> > > +       scratch.width = 1024;
> > > +       scratch.height = 1024;
> > > +       scratch.bpp = 32;
> > > +       vgem_create(vgem, &scratch);
> > > +
> > > +       dmabuf = prime_handle_to_fd(vgem, scratch.handle);
> > > +       prime = prime_fd_to_handle(i915, dmabuf);
> > > +       close(dmabuf);
> > > +
> > > +       native = gem_create(i915, scratch.size);
> > > +
> > > +       ptr = gem_mmap__wc(i915, native, 0, scratch.size, PROT_WRITE);
> > > +       for (i = 0; i < 1024; i++)
> > > +               ptr[1024 * i] = i;
> > > +       munmap(ptr, scratch.size);
> > > +
> > > +       igt_blitter_src_copy__raw(i915,
> > > +                                 native, 0, scratch.width * scratch.bpp / 8,
> > > +                                 I915_TILING_NONE, 0, 0,
> > > +                                 scratch.width, scratch.height, scratch.bpp,
> > > +                                 prime, 0, scratch.width * scratch.bpp / 8,
> > > +                                 I915_TILING_NONE, 0, 0);
> > > +       gem_sync(i915, prime);
> > 
> > Would this be better with prime_sync_start(dmabuf, true); ?
> 
> I'm not sure why you suggest true for write access, not false for just having 
> the prime object confirmed ready for reading.  Could you please explain?

Now I think that by requesting a write sync, as suggested by Chris, we make 
sure that all former write operations have completed.  That might be not true 
if we requested a read sync as we might get a snapshot taken while the write 
we wanted to serialize against was still pending.  I hope my understanding of 
this is now correct.

Thanks,
Janusz

> 
> Thanks,
> Janusz
> 
> > gem_sync(prime) is nice in its own way (checking sync on imported handle
> > provides correct serialisation for the vgem_mmap). But I think the
> > recommended practice would be to use dmabuf for the inter-device sync?
> 
> 




_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
