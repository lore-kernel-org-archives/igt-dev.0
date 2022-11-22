Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB94910E074
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Nov 2022 09:43:36 +0000 (UTC)
Date: Tue, 22 Nov 2022 01:43:29 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20221122094329.iwgcx2twshfxpaje@ldmartin-desk2.lan>
References: <20221121170257.2022727-1-vikas.srivastava@intel.com>
 <20221121224602.xygdms5gt2d4wkme@ldmartin-desk2.lan>
 <20221122084646.coak7ptp5r5uf7yb@zkempczy-mobl2>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221122084646.coak7ptp5r5uf7yb@zkempczy-mobl2>
MIME-Version: 1.0
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

On Tue, Nov 22, 2022 at 09:46:46AM +0100, Zbigniew Kempczyński wrote:
>On Mon, Nov 21, 2022 at 02:46:02PM -0800, Lucas De Marchi wrote:
>> On Mon, Nov 21, 2022 at 10:32:57PM +0530, Vikas Srivastava wrote:
>> > From: Arjun Melkaveri <arjun.melkaveri@intel.com>
>> >
>> > Test case uses legacy command which is not supported on MTL.
>> > Modified test to use XY_FAST_COPY_BLT.
>> >
>> > Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>> > Acked-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>>
>> $ git grep XY_SRC_COPY_BLT_CMD
>> lib/i830_reg.h:#define XY_SRC_COPY_BLT_CMD              ((2<<29)|(0x53<<22))
>> lib/intel_batchbuffer.c:        dword0 |= XY_SRC_COPY_BLT_CMD;
>> lib/intel_batchbuffer.c:        intel_bb_out(ibb, XY_SRC_COPY_BLT_CMD |
>> lib/intel_batchbuffer.h:        OUT_BATCH(XY_SRC_COPY_BLT_CMD | \
>
>I would like to get rid of all libdrm stuff in intel_batchbuffer but there's
>one test which still references to it - prime_nv_test.c.
>
>+ Petri, Kamil
>
>May I remove this test? There're no users of it (there's no such hw we can
>test this on) so I see no reason to keep outdated and dead test.
>Anyway, I'm going to send the series, please decide in the meantime to
>accept it or reject.
>
>> lib/intel_reg.h:#define XY_SRC_COPY_BLT_CMD             ((2<<29)|(0x53<<22))
>> tests/i915/api_intel_allocator.c:               batch[i++] = XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_blits.c: batch[i] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_caching.c:                    XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_evict_alignment.c:       batch[i++] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_evict_everything.c:      batch[i++] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_linear_blits.c:  batch[i++] = XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_partial_pwrite_pread.c:               XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_tiled_fence_blits.c:     batch[i] = (XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_userptr_blits.c: batch[i++] = XY_SRC_COPY_BLT_CMD |
>> tests/i915/gem_userptr_blits.c: batch[i++] = XY_SRC_COPY_BLT_CMD |
>> tests/i915/gen3_mixed_blits.c:  *b++ = (XY_SRC_COPY_BLT_CMD |
>>
>> Currently we have one abstraction for bb creation, but some tests
>> not using it.  This is covering just 1 test... maybe we should rather
>> convert tests to use a common abstraction and change it there?
>>
>> +Zbigniew, who I think was working on some common abstraction.
>
>+ Karolina
>
>TL;DR
>------
>We're working on more universal blitter library, but currently it
>supports/will support xy-block-copy-blt and xy-fast-copy-blt. So any
>above changes (xy-src-copy-blt -> xy-fast-copy-blt) I still would do
>manually.
>
>Long:
>-----
>Question is - do we really want to move to intel-bb everywhere. Intel-bb

if we don't have one function, that is fine, but I think we should at
least abstract out this if/else for XY_SRC_COPY_BLT vs XY_FAST_COPY_BLT,
because there are 10+ users of it doing the similar stuff.

>was create to remove libdrm in render-copy/gpgpu-fill/media-fill. Nothing
>prevents us from creating batches this way, but this still doesn't
>handle conditional code to feed batches. I think we should rather go way
>where we prepare data in structures, pass to build/execute batch (see
>gem_ccs/i915_blt for reference). We may integrate this with intel-bb too
>(I mean feeding intel-bb with instructions produced by the blit library
>function is easy). Currently this is standalone blit (with execbuf
>itself), but I want to change this - current design doesn't allow to
>execute two blits in a row what may reveal some problems (cache flushes,
>etc.). I opt for structures because new blit commands are quite big
>(xy-block-copy-blt on dg2 has 21 dwords - I don't want to make function
>argument list monsters - readability of this is questionable thing).
>
>Another thing we're considering are tilings and compression support in
>specific platform. I was surprised that in same gen we have different
>tilings/compressions (dg1 and dg2 as an example). If I'm not wrong

there isn't such a "gen" terminology anymore... this ended in 12. The
ones after that we shouldn't considered as "generation".. so they are
not really the same. DG1 has graphics 12.1 while DG2 has 12.55

>main bcs engine also may differ from other engines...

In PVC, yes. Link Copy engines don't support all the instructions of the
main copy engine.

Lucas De Marchi
