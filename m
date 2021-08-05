Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D4446E214
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Aug 2021 07:34:34 +0000 (UTC)
Date: Thu, 5 Aug 2021 09:34:25 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210805073425.GB3295@zkempczy-mobl2>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
 <20210726200026.4815-8-zbigniew.kempczynski@intel.com>
 <87h7g4u68p.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h7g4u68p.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 07/52] lib/intel_batchbuffer: Try to
 avoid relocations in blitting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Aug 04, 2021 at 04:42:30PM -0700, Dixit, Ashutosh wrote:
> On Mon, 26 Jul 2021 12:59:41 -0700, Zbigniew Kempczyński wrote:
> >
> > We're proposing not overlapping offsets in both blitter copying functions
> > so we can try to skip relocations.
> 
> OK, afaiu I915_EXEC_NO_RELOC is a hint so when I915_EXEC_IS_PINNED is not
> specified relocations will be applied when needed (and we are providing
> presumed_offset's even in the relocation case):

If you use NO_RELOC relocations will be applied only when kernel decides
to move your object offset. Otherwise relocation won't appear. So passing
NO_RELOC, presumed_offset == -1, obj.offset == 0x40000 won't relocate
unless kernel will move obj to different offset. So if you just provide
batch without 0x40000 you can expect not valid result or hang.

--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > ---
> >  lib/intel_batchbuffer.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
> > index d4a59e508..bbf8e0da2 100644
> > --- a/lib/intel_batchbuffer.c
> > +++ b/lib/intel_batchbuffer.c
> > @@ -711,7 +711,7 @@ static void exec_blit(int fd,
> >	struct drm_i915_gem_execbuffer2 exec = {
> >		.buffers_ptr = to_user_pointer(objs),
> >		.buffer_count = count,
> > -		.flags = gen >= 6 ? I915_EXEC_BLT : 0,
> > +		.flags = gen >= 6 ? I915_EXEC_BLT : 0 | I915_EXEC_NO_RELOC,
> >		.rsvd1 = ctx,
> >	};
> >
> > --
> > 2.26.0
> >
