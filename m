Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E011710E3AF
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 08:47:14 +0000 (UTC)
Date: Tue, 22 Nov 2022 09:46:46 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20221122084646.coak7ptp5r5uf7yb@zkempczy-mobl2>
References: <20221121170257.2022727-1-vikas.srivastava@intel.com>
 <20221121224602.xygdms5gt2d4wkme@ldmartin-desk2.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121224602.xygdms5gt2d4wkme@ldmartin-desk2.lan>
Subject: Re: [igt-dev] [PATCH i-g-t v3]tests/i915/gem_userptr_blits: Added
 XY_FAST_COPY_BLT Command for MTL
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org,
 Karolina Drobnik <karolina.drobnik@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 21, 2022 at 02:46:02PM -0800, Lucas De Marchi wrote:
> On Mon, Nov 21, 2022 at 10:32:57PM +0530, Vikas Srivastava wrote:
> > From: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > 
> > Test case uses legacy command which is not supported on MTL.
> > Modified test to use XY_FAST_COPY_BLT.
> > 
> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> > Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> $ git grep XY_SRC_COPY_BLT_CMD
> lib/i830_reg.h:#define XY_SRC_COPY_BLT_CMD              ((2<<29)|(0x53<<22))
> lib/intel_batchbuffer.c:        dword0 |= XY_SRC_COPY_BLT_CMD;
> lib/intel_batchbuffer.c:        intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
> lib/intel_batchbuffer.h:        OUT_BATCH(XY_SRC_COPY_BLT_CMD | \

I would like to get rid of all libdrm stuff in intel_batchbuffer but there's
one test which still references to it - prime_nv_test.c. 

+ Petri, Kamil

May I remove this test? There're no users of it (there's no such hw we can
test this on) so I see no reason to keep outdated and dead test.
Anyway, I'm going to send the series, please decide in the meantime to
accept it or reject.

> lib/intel_reg.h:#define XY_SRC_COPY_BLT_CMD             ((2<<29)|(0x53<<22))
> tests/i915/api_intel_allocator.c:               batch[i++] = XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_caching.c:                    XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_evict_alignment.c:       batch[i++] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_evict_everything.c:      batch[i++] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_linear_blits.c:  batch[i++] = XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_partial_pwrite_pread.c:               XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_tiled_fence_blits.c:     batch[i] = (XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_userptr_blits.c: batch[i++] = XY_SRC_COPY_BLT_CMD |
> tests/i915/gem_userptr_blits.c: batch[i++] = XY_SRC_COPY_BLT_CMD |
> tests/i915/gen3_mixed_blits.c:  *b++ = (XY_SRC_COPY_BLT_CMD |
> 
> Currently we have one abstraction for bb creation, but some tests
> not using it.  This is covering just 1 test... maybe we should rather
> convert tests to use a common abstraction and change it there?
> 
> +Zbigniew, who I think was working on some common abstraction.

+ Karolina

TL;DR
------
We're working on more universal blitter library, but currently it
supports/will support xy-block-copy-blt and xy-fast-copy-blt. So any
above changes (xy-src-copy-blt -> xy-fast-copy-blt) I still would do
manually. 

Long:
-----
Question is - do we really want to move to intel-bb everywhere. Intel-bb
was create to remove libdrm in render-copy/gpgpu-fill/media-fill. Nothing
prevents us from creating batches this way, but this still doesn't
handle conditional code to feed batches. I think we should rather go way
where we prepare data in structures, pass to build/execute batch (see
gem_ccs/i915_blt for reference). We may integrate this with intel-bb too
(I mean feeding intel-bb with instructions produced by the blit library
function is easy). Currently this is standalone blit (with execbuf
itself), but I want to change this - current design doesn't allow to
execute two blits in a row what may reveal some problems (cache flushes,
etc.). I opt for structures because new blit commands are quite big
(xy-block-copy-blt on dg2 has 21 dwords - I don't want to make function
argument list monsters - readability of this is questionable thing).

Another thing we're considering are tilings and compression support in
specific platform. I was surprised that in same gen we have different
tilings/compressions (dg1 and dg2 as an example). If I'm not wrong 
main bcs engine also may differ from other engines...

--
Zbigniew

> 
> 
> Lucas De Marchi
> 
> 
> 
> > ---
> > tests/i915/gem_userptr_blits.c | 129 +++++++++++++++++++++------------
> > 1 file changed, 81 insertions(+), 48 deletions(-)
> > 
> > diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> > index 698508669..edcc3418b 100644
> > --- a/tests/i915/gem_userptr_blits.c
> > +++ b/tests/i915/gem_userptr_blits.c
> > @@ -99,8 +99,9 @@ static int copy(int fd, uint32_t dst, uint32_t src)
> > 	struct drm_i915_gem_relocation_entry reloc[2];
> > 	struct drm_i915_gem_exec_object2 obj[3];
> > 	struct drm_i915_gem_execbuffer2 exec;
> > +	static uint32_t devid;
> > 	uint32_t handle;
> > -	int ret, i=0;
> > +	int ret, i = 0;
> > 	uint64_t dst_offset, src_offset, bb_offset;
> > 	bool has_relocs = gem_has_relocations(fd);
> > 
> > @@ -108,29 +109,44 @@ static int copy(int fd, uint32_t dst, uint32_t src)
> > 	dst_offset = bb_offset + 4096;
> > 	src_offset = dst_offset + WIDTH * HEIGHT * sizeof(uint32_t) * (src != dst);
> > 
> > -	batch[i++] = XY_SRC_COPY_BLT_CMD |
> > -		  XY_SRC_COPY_BLT_WRITE_ALPHA |
> > -		  XY_SRC_COPY_BLT_WRITE_RGB;
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i - 1] |= 8;
> > -	else
> > -		batch[i - 1] |= 6;
> > -
> > -	batch[i++] = (3 << 24) | /* 32 bits */
> > -		  (0xcc << 16) | /* copy ROP */
> > -		  WIDTH*4;
> > -	batch[i++] = 0; /* dst x1,y1 */
> > -	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> > -	batch[i++] = dst_offset; /* dst reloc */
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i++] = dst_offset >> 32;
> > -	batch[i++] = 0; /* src x1,y1 */
> > -	batch[i++] = WIDTH*4;
> > -	batch[i++] = src_offset; /* src reloc */
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i++] = src_offset >> 32;
> > -	batch[i++] = MI_BATCH_BUFFER_END;
> > -	batch[i++] = MI_NOOP;
> > +	devid = intel_get_drm_devid(fd);
> > +
> > +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> > +		batch[i++] = XY_FAST_COPY_BLT;
> > +		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
> > +		batch[i++] = 0;/* dst x1,y1 */
> > +		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
> > +		batch[i++] = dst_offset;/* dst address */
> > +		batch[i++] = 0;/* src x1,y1 */
> > +		batch[i++] = WIDTH*4;/* src pitch */
> > +		batch[i++] = src_offset;/* src address */
> > +		batch[i++] = MI_BATCH_BUFFER_END;
> > +		batch[i++] = MI_NOOP;
> > +	} else {
> > +		batch[i++] = XY_SRC_COPY_BLT_CMD |
> > +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> > +			     XY_SRC_COPY_BLT_WRITE_RGB;
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i - 1] |= 8;
> > +		else
> > +			batch[i - 1] |= 6;
> > +
> > +		batch[i++] = (3 << 24) | /* 32 bits */
> > +			  (0xcc << 16) | /* copy ROP */
> > +			  WIDTH*4;
> > +		batch[i++] = 0; /* dst x1,y1 */
> > +		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> > +		batch[i++] = dst_offset; /* dst reloc */
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i++] = dst_offset >> 32;
> > +		batch[i++] = 0; /* src x1,y1 */
> > +		batch[i++] = WIDTH*4;
> > +		batch[i++] = src_offset; /* src reloc */
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i++] = src_offset >> 32;
> > +		batch[i++] = MI_BATCH_BUFFER_END;
> > +		batch[i++] = MI_NOOP;
> > +	}
> > 
> > 	handle = gem_create(fd, 4096);
> > 	gem_write(fd, handle, 0, batch, sizeof(batch));
> > @@ -204,31 +220,48 @@ blit(int fd, uint32_t dst, uint32_t src, uint32_t *all_bo, int n_bo)
> > 	struct drm_i915_gem_relocation_entry reloc[2];
> > 	struct drm_i915_gem_exec_object2 *obj;
> > 	struct drm_i915_gem_execbuffer2 exec;
> > -	uint32_t handle;
> > -	int n, ret, i=0;
> > +	static uint32_t devid;
> > 
> > -	batch[i++] = XY_SRC_COPY_BLT_CMD |
> > -		  XY_SRC_COPY_BLT_WRITE_ALPHA |
> > -		  XY_SRC_COPY_BLT_WRITE_RGB;
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i - 1] |= 8;
> > -	else
> > -		batch[i - 1] |= 6;
> > -	batch[i++] = (3 << 24) | /* 32 bits */
> > -		  (0xcc << 16) | /* copy ROP */
> > -		  WIDTH*4;
> > -	batch[i++] = 0; /* dst x1,y1 */
> > -	batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> > -	batch[i++] = 0; /* dst reloc */
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i++] = 0;
> > -	batch[i++] = 0; /* src x1,y1 */
> > -	batch[i++] = WIDTH*4;
> > -	batch[i++] = 0; /* src reloc */
> > -	if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > -		batch[i++] = 0;
> > -	batch[i++] = MI_BATCH_BUFFER_END;
> > -	batch[i++] = MI_NOOP;
> > +	uint32_t handle;
> > +	int n, ret, i = 0;
> > +
> > +	devid = intel_get_drm_devid(fd);
> > +
> > +	if (intel_graphics_ver(devid) >= IP_VER(12, 60)) {
> > +		batch[i++] = XY_FAST_COPY_BLT;
> > +		batch[i++] = XY_FAST_COPY_COLOR_DEPTH_32 | WIDTH*4;
> > +		batch[i++] = 0;/* dst x1,y1 */
> > +		batch[i++] = (HEIGHT << 16) | WIDTH;/* dst x2,y2 */
> > +		batch[i++] = ;/* dst address */
> > +		batch[i++] = 0;/* src x1,y1 */
> > +		batch[i++] = WIDTH*4;/* src pitch */
> > +		batch[i++] = 0;// src address lower bits
> > +		batch[i++] = MI_BATCH_BUFFER_END;
> > +		batch[i++] = MI_NOOP;
> > +	} else {
> > +		batch[i++] = XY_SRC_COPY_BLT_CMD |
> > +			     XY_SRC_COPY_BLT_WRITE_ALPHA |
> > +			     XY_SRC_COPY_BLT_WRITE_RGB;
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i - 1] |= 8;
> > +		else
> > +			batch[i - 1] |= 6;
> > +		batch[i++] = (3 << 24) | /* 32 bits */
> > +			     (0xcc << 16) | /* copy ROP */
> > +			     WIDTH*4;
> > +		batch[i++] = 0; /* dst x1,y1 */
> > +		batch[i++] = (HEIGHT << 16) | WIDTH; /* dst x2,y2 */
> > +		batch[i++] = 0; /* dst reloc */
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i++] = 0;
> > +		batch[i++] = 0; /* src x1,y1 */
> > +		batch[i++] = WIDTH*4;
> > +		batch[i++] = 0; /* src reloc */
> > +		if (intel_gen(intel_get_drm_devid(fd)) >= 8)
> > +			batch[i++] = 0;
> > +		batch[i++] = MI_BATCH_BUFFER_END;
> > +		batch[i++] = MI_NOOP;
> > +	}
> > 
> > 	handle = gem_create(fd, 4096);
> > 	gem_write(fd, handle, 0, batch, sizeof(batch));
> > -- 
> > 2.25.1
> > 
