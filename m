Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4592210E144
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 05:47:42 +0000 (UTC)
Date: Mon, 5 Sep 2022 07:47:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20220905074721.53d35eec@maurocar-mobl2>
In-Reply-To: <YxIB7zrR8Fp7QJS4@platvala-desk.ger.corp.intel.com>
References: <20220901063722.261828-1-mauro.chehab@linux.intel.com>
 <20220901063722.261828-2-mauro.chehab@linux.intel.com>
 <YxB5IMoe9slyOn/5@platvala-desk.ger.corp.intel.com>
 <20220901125609.242835c6@maurocar-mobl2>
 <20220901130946.53262572@maurocar-mobl2>
 <YxCWediao6eQtbbq@platvala-desk.ger.corp.intel.com>
 <20220902144840.6728d805@maurocar-mobl2>
 <YxIB7zrR8Fp7QJS4@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 01/74] lib: Introduce typed cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2 Sep 2022 16:15:27 +0300
Petri Latvala <petri.latvala@intel.com> wrote:

> On Fri, Sep 02, 2022 at 02:48:40PM +0200, Mauro Carvalho Chehab wrote:
> > On Thu, 1 Sep 2022 14:24:41 +0300
> > Petri Latvala <petri.latvala@intel.com> wrote:
> >   
> > > On Thu, Sep 01, 2022 at 01:09:46PM +0200, Mauro Carvalho Chehab wrote:  
> > > > On Thu, 1 Sep 2022 12:56:09 +0200
> > > > Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
> > > >     
> > > > > On Thu, 1 Sep 2022 12:19:28 +0300
> > > > > Petri Latvala <petri.latvala@intel.com> wrote:
> > > > >     
> > > > > > On Thu, Sep 01, 2022 at 08:36:09AM +0200, Mauro Carvalho Chehab wrote:      
> > > > > > > From: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > > 
> > > > > > > Start introducing standard types with automatic cleanup courtesy of
> > > > > > > gcc's __attribute__((cleanup)). As an example, we start with an fd
> > > > > > > that will automatically call close() on going out of scope, and
> > > > > > > crucially before atexit where we will want to check for resource leaks.
> > > > > > > 
> > > > > > > Suggested-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> > > > > > > Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> > > > > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > > > > Acked-by: Nirmoy Das <nirmoy.das@linux.intel.com>
> > > > > > > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>      
> > > > > 
> > > > > ...
> > > > >     
> > > > > > > +void igt_cleanup_fd(int *fd);
> > > > > > > +#define igt_fd_t(x__) \
> > > > > > > +	int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > > > > > +
> > > > > > > +#endif /* IGT_TYPES_H */      
> > > > > 
> > > > > ...
> > > > >     
> > > > > > 
> > > > > > This fails with clang currently, and might fail with gcc in the
> > > > > > future. longjmp is funky.      
> > > > > 
> > > > > It is unlikely that gcc would change it, but yeah, there's a possibility.
> > > > > 
> > > > > There's an easy to workaround: just check if CONFIG_CLANG_VERSION is
> > > > > defined, disabling the logic on such case with something like:
> > > > > 
> > > > > /*
> > > > >  * FIXME: on clang, stack variables are lost after setjmp()
> > > > >  */
> > > > > #ifdef CONFIG_CLANG_VERSION
> > > > > #  define igt_fd_t(x__) int x__
> > > > > #else
> > > > > #  define igt_fd_t(x__) \
> > > > >        int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > > > #endif
> > > > > 
> > > > > This would keep the file descriptors opened on Clang, but it would
> > > > > at least solve for gcc.
> > > > >     
> > > > > > If an automatic (stack) variable is assigned after setjmp(), the
> > > > > > longjmp to "before" the assignment has the variable in unspecified
> > > > > > state as per the C spec. In the sense that the value can be either.      
> > > > > 
> > > > > I see. Yeah, handling undefined behavior cases are complex.
> > > > > 
> > > > > I guess one possible solution would be to define the macro as:
> > > > > 
> > > > > #define igt_fd_t(x__) \
> > > > >        static int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > > > > #endif
> > > > > 
> > > > > but I didn't check the C spec to see if this has a defined behavior,
> > > > > nor tested it.    
> > > > 
> > > > Answering myself:  this won't work, as the macro uses __cleanup__
> > > > atribute, which is only valid for stack-allocated variables:
> > > > 
> > > > 	../tests/i915/gem_request_retire.c:109:2: warning: '__cleanup__' attribute only applies to local variables [-Wignored-attributes]
> > > > 
> > > > A solution that would work would be to store a list of file
> > > > descriptors on a static list and then use it during cleanup time
> > > > (assuming that clang will still call the cleanup function with 
> > > > longjmp).     
> > > 
> > > Yeah the only thing that helps really is volatile. That is fully
> > > specified as per spec for this.
> > > 
> > > Having said that: What if igt_fd_t just used volatile across the
> > > board?  
> > 
> > Do you mean folding this change on patch 01/74?
> > 
> > <snip>
> > diff --git a/lib/igt_types.c b/lib/igt_types.c
> > index 7416b0fffc04..392f30fcab23 100644
> > --- a/lib/igt_types.c
> > +++ b/lib/igt_types.c
> > @@ -7,7 +7,7 @@
> >  
> >  #include "igt_types.h"
> >  
> > -void igt_cleanup_fd(int *fd)
> > +void igt_cleanup_fd(volatile int *fd)
> >  {
> >  	if (!fd || *fd < 0)
> >  		return;
> > diff --git a/lib/igt_types.h b/lib/igt_types.h
> > index 1852026969ae..c4bc01ecdb3b 100644
> > --- a/lib/igt_types.h
> > +++ b/lib/igt_types.h
> > @@ -40,8 +40,8 @@
> >  /* Prevent use within the inner scope subtests, it will be broken by igt_skip */
> >  #define IGT_OUTER_SCOPE_INIT(x) ({ __igt_assert_in_outer_scope(); x; })
> >  
> > -void igt_cleanup_fd(int *fd);
> > +void igt_cleanup_fd(volatile int *fd);
> >  #define igt_fd_t(x__) \
> > -	int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> > +	volatile int x__ cleanup_with(igt_cleanup_fd) = IGT_OUTER_SCOPE_INIT(-1)
> >  
> >  #endif /* IGT_TYPES_H */
> > 
> > </snip>
> > 
> > This builds fine, but didn't try yet checking if it will do the right 
> > thing.  
> 
> Yeah, exactly. It should do the right thing, at the cost of
> zero-to-small performance hit. Whether that's true remains to be seen.

Did a quick test with volatile patch applied on a TGL. It seems it didn't
cause any performance hits. It also didn't affect the test results.

So, I'll be submitting a version 2 of this series using volatile.

Regards,
Mauro

--

--- before	2022-09-05 07:39:06.877762817 +0200
+++ after	2022-09-05 07:39:37.218574835 +0200
@@ -1,4 +1,4 @@
- 1.26-g40ec79634da4 (x86_64) (Linux: 5.19.0-drm-50bc22230125+ x86_64)
+ 1.26-g4530a3c6bbf0 (x86_64) (Linux: 5.19.0-drm-50bc22230125+ x86_64)
 
  Subtest load: SKIP (0.002s)
  Subtest basic-auth: SKIP
@@ -12,45 +12,45 @@
  Subtest create-close: SUCCESS (0.000s)
  Subtest create-fd-close: SUCCESS (0.000s)
  Subtest busy: SKIP
- Subtest basic-process: SUCCESS (0.047s)
- Subtest basic-threads: SUCCESS (1.183s)
+ Subtest basic-process: SUCCESS (0.054s)
+ Subtest basic-threads: SUCCESS (1.182s)
  Subtest basic: SUCCESS (0.000s)
  Subtest basic-files: SUCCESS (2.007s)
- Subtest basic: SUCCESS (0.002s)
- Subtest basic: SUCCESS (0.002s)
- Subtest basic: SUCCESS (2.041s)
- Subtest basic-busy: SUCCESS (0.143s)
- Subtest basic-wait: SUCCESS (0.173s)
- Subtest basic-await: SUCCESS (0.378s)
- Subtest nb-await: SUCCESS (0.307s)
- Subtest basic: SUCCESS (4.078s)
+ Subtest basic: SUCCESS (0.003s)
+ Subtest basic: SUCCESS (0.003s)
+ Subtest basic: SUCCESS (2.054s)
+ Subtest basic-busy: SUCCESS (0.145s)
+ Subtest basic-wait: SUCCESS (0.134s)
+ Subtest basic-await: SUCCESS (0.377s)
+ Subtest nb-await: SUCCESS (0.303s)
+ Subtest basic: SUCCESS (4.060s)
  Subtest engines: SKIP
- Subtest basic: SUCCESS (0.042s)
+ Subtest basic: SUCCESS (0.040s)
  Subtest bad-flink: SUCCESS (0.000s)
  Subtest bad-open: SUCCESS (0.000s)
  Subtest basic: SUCCESS (0.000s)
  Subtest double-flink: SUCCESS (0.000s)
  Subtest flink-lifetime: SUCCESS (0.001s)
  Subtest huc-copy: SKIP (0.000s)
- Subtest basic: SUCCESS (0.004s)
+ Subtest basic: SUCCESS (0.005s)
  Subtest basic: SUCCESS (0.000s)
  Subtest basic: SUCCESS (0.000s)
- Subtest basic: SUCCESS (0.032s)
- Subtest basic: SUCCESS (0.021s)
- Subtest basic-all: SUCCESS (1.117s)
+ Subtest basic: SUCCESS (0.022s)
+ Subtest basic: SUCCESS (0.026s)
+ Subtest basic-all: SUCCESS (1.112s)
  Subtest allocator-basic: SKIP
  Subtest allocator-basic-reserve: SKIP
  Subtest safe-alignment: SKIP
- Subtest basic-all: SUCCESS (2.039s)
- Subtest basic-each: SUCCESS (2.079s)
- Subtest basic: SUCCESS (0.014s)
+ Subtest basic-all: SUCCESS (2.289s)
+ Subtest basic-each: SUCCESS (2.123s)
+ Subtest basic: SUCCESS (0.015s)
  Subtest basic: SUCCESS (0.022s)
- SUCCESS (0.059s)
+ SUCCESS (0.055s)
  Subtest busy: SKIP
  Subtest wait: SKIP
  Subtest basic-eu-total: SUCCESS (0.000s)
  Subtest basic-subslice-total: SUCCESS (0.000s)
- Subtest error-state-basic: SUCCESS (0.028s)
+ Subtest error-state-basic: SUCCESS (0.030s)
  SUCCESS (0.001s)
  Subtest addfb25-bad-modifier: SKIP
  Subtest addfb25-framebuffer-vs-set-tiling: SKIP
@@ -124,14 +124,14 @@
  Subtest basic-clone-single-crtc: SKIP
  Subtest basic-brightness: SKIP
  Subtest basic-pci-d3-state: SKIP
- Subtest basic-rte: SKIP (0.001s)
- Subtest basic-api: SUCCESS (0.025s)
+ Subtest basic-rte: SKIP (0.000s)
+ Subtest basic-api: SUCCESS (0.026s)
  Subtest basic-llseek-bad: SUCCESS (0.001s)
- Subtest basic-llseek-size: SUCCESS (0.003s)
+ Subtest basic-llseek-size: SUCCESS (0.002s)
  Subtest basic-with_fd_dup: SUCCESS (0.001s)
  Subtest basic-with_one_bo: SUCCESS (0.001s)
- Subtest basic-with_one_bo_two_files: SUCCESS (0.002s)
- Subtest basic-with_two_bos: SUCCESS (0.002s)
+ Subtest basic-with_one_bo_two_files: SUCCESS (0.001s)
+ Subtest basic-with_two_bos: SUCCESS (0.001s)
  Subtest basic-fence-flip: SKIP
  Subtest basic-fence-mmap: SKIP
  Subtest basic-fence-read: SKIP
@@ -142,11 +142,11 @@
  Subtest setversion: SUCCESS (0.000s)
  Subtest create: SUCCESS (0.000s)
  Subtest debugfs: SUCCESS (0.001s)
- Subtest dmabuf-export: SUCCESS (0.001s)
- Subtest dmabuf-fence: SUCCESS (0.001s)
+ Subtest dmabuf-export: SUCCESS (0.002s)
+ Subtest dmabuf-fence: SUCCESS (0.000s)
  Subtest dmabuf-fence-before: SUCCESS (0.000s)
- Subtest dmabuf-mmap: SUCCESS (0.015s)
- Subtest mmap: SUCCESS (0.014s)
+ Subtest dmabuf-mmap: SUCCESS (0.009s)
+ Subtest mmap: SUCCESS (0.008s)
  Subtest second-client: SUCCESS (0.001s)
- Subtest sysfs: SUCCESS (0.000s)
- Subtest unbind-rebind: SUCCESS (0.960s)
+ Subtest sysfs: SUCCESS (0.001s)
+ Subtest unbind-rebind: SUCCESS (0.979s)


---

If you're curious enough, those are the changesets on my test machine:

4530a3c6bbf0 (HEAD -> master) i915/gem_ctx_isolation: Close device before exit
b1d4756a6cab i915/gem_exec_balancer: Close device before exit
df2549ea0cc1 core_auth: Close(master) before exit
4e6e6f5892db i915/i915_pm_dc: Close device before exit
02baa5a498e8 feature_discovery: Close device before exit
46dfbc9ad928 kms_content_protection: Close device before exit
0edd85b18c7f kms_plane_lowres: Close device before exit
562ea35b366b kms_cursor_edge_walk: Close device before exit
152a672d7a1d drm_read: Close device before exit
044ade01e25c kms_dither: Close device before exit
ae20ffcc39f2 kms_scaling_modes: Close device before exit
72e844e0716d kms_3d: Close device before exit
043ac26886cb kms_hdmi_inject: Close device before exit
36cf9798c647 kms_dp_aux_dev: Close device before exit
3aadfa70f159 drm_import_export: Close device before exit
218778762b52 syncobj_timeline: Close device before exit
e0a5c6a3a54c syncobj_basic: Close device before exit
59eaeeb14f8b syncobj_wait: Close device before exit
1213005ddc7e kms_vblank: Close device before exit
fe5bd17d1a71 kms_universal_plane: Close device before exit
c9b5df3b6b03 kms_sequence: Close device before exit
30823b629924 kms_rotation_crc: Close device before exit
74286a7f4b62 kms_properties: Close device before exit
9e52df6f7e44 kms_plane_scaling: Close device before exit
693c0d3b5546 kms_plane_multiple: Close device before exit
ee189b64976c kms_plane_cursor: Close device before exit
950b3d38155e kms_plane_alpha_blend: Close device before exit
4fed026b22fb kms_plane: Close device before exit
d611d7283a2b kms_panel_fitting: Close device before exit
e71281b62517 kms_lease: Close device before exit
eda8b974d91f kms_invalid_mode: Close device before exit
60348f9f2a30 kms_hdr: Close device before exit
5f24d029244c kms_flip_event_leak: Close device before exit
caf47f871b0b i915/kms_pwrite_crc: Close device before exit
fd79af4a5528 i915/kms_psr2_su: Close device before exit
23306e43498f i915/kms_psr2_sf: Close device before exit
0064cdcf8ced i915/kms_pipe_b_c_ivb: Close device before exit
3b6d5b8c0430 i915/kms_mmap_write_crc: Close device before exit
7e503c65c833 i915/kms_flip_tiling: Close device before exit
f38d5c0313ad i915/kms_flip_scaled_crc: Close device before exit
9ab01954d4ed i915/kms_fence_pin_leak: Close device before exit
f1728b91adff i915/kms_cdclk: Close device before exit
89accc090b0f i915/kms_big_joiner: Close device before exit
b54a850c67e9 kms_cursor_crc: Close device before exit
54a5451ca22f kms_color: Close device before exit
da1a768871e1 i915/kms_ccs: Close device before exit
de7a865bb2c5 i915/kms_big_fb: Close device before exit
c1f86be52d1c kms_atomic_transition: Close device before exit
1d54de0d4186 kms_atomic_interruptible: Close device before exit
26ce912981e7 kms_atomic: Close device before exit
2c0b1094771a dumb_buffer: Close device before exit
c502b300dd03 kms_force_connector_basic: Close device before exit
4233e2ae1d38 kms_flip: Close device before exit
006f1e3d93d3 kms_psr: Close device before exit
fc1e25f183ec kms_pipe_crc_basic: Close device before exit
2bf1fb607fd9 kms_flip: Close device before exit
c383167f1ace kms_cursor_legacy: Close device before exit
df752f7cfb9c i915/i915_pciid: Close device before exit
adb9c4547657 i915/gem_unfence_active_buffers: Close device before exit
8e214a2e0b25 i915/gem_request_retire: Close device before exit
19529fdef5cf i915/gem_exec_endless: Close device before exit
3054f0c97b07 i915/gem_unref_active_buffers: Close device before exit
abec97ca8c48 i915/gem_workarounds: Close device before exit
fd2de3209118 i915/gem_userptr_blits: Close device before exit
f9405034e215 i915/gem_media_fill: Close device before exit
9d6df278e077 i915/gem_render_copy_redux: Close device before exit
6d9a4f32dcf8 i915/gem_render_copy: Close device before exit
00b7b0edc00d i915/gem_exec_alignment: Close device before exit
9473d42d97f3 i915/gem_ctx_shared: Close device before exit
0f08a002cbf5 i915/gem_ctx_engines: Close device before exit
da0f52e411f4 i915/gem_create: Close device before exit
e86f970af730 i915/gem_close: Close device before exit
639bb8e53747 i915/gem_blits: Close device before exit
803df363b6db i915/gem_linear_blits: Close device before exit
0ad94b7acc2e i915/gem_flink_basic: Close device before exit
69634ee9d093 i915/gem_basic: Close device before exit
a615ce9c482d lib: Introduce typed cleanups
9b2970a6d495 lib/igt_kms: Choose default mode based on --environment flag from igt_runner
c018ce1d1ab8 tests/kms_plane_multiple: Fix assumption about single primary plane
391ac3a06323 tests/amdgpu: add deadlock tests
11f7f3e8ae75 lib/amdgpu: added dispatch tests for gfx and compute
b84a050923b1 lib/amdgpu: added dispatch helper functions
cfc7239bad10 lib/amdgpu: added binary shaders with disassembled annotations
ea2ef908a516 lib/amdgpu: improve operations to create commands and misc
0e7eb0bf7b42 tests/kms_cursor_crc: Add max-size test back
397677d03f27 tests/kms_plane_cursor: Convert tests to dynamic
ba61c48dba71 docs: Update report link to fd.o GitLab
ec22200d4c91 runner: Add tests for environment flags
b580bae747f0 runner: Add help for the --environment flag
1e8c7ae5df17 runner: Set requested env vars during execution
f3d848a0b578 runner: Serialize the provided environment flags
66ee80cc5854 runner: Add the --environment flag
01737c4a4577 runner: make the usage function variadic
1096ca21fa7a runner: rename free_settings to clear_settings
9338ab3ec085 replaced /bin/bash shebangs with /bin/sh for BSD compatibility
a23e8aed0b54 lib/igt_device_scan: Retry when parent pci device lacks properties
1298b5f0e1b3 igt: Allow overriding the commit hash in the version string
9785abfeda27 lib/chamelium: Use MST Path property to reprobe an MST connector.
e01fe99f0069 i915/guc: Disable i915_pm_rps when SLPC is enabled
40ec79634da4 (origin/master, origin/HEAD) tests/i915/kms_big_fb: First async flip discarded on i915

