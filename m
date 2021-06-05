Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29236E81E
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Jun 2021 01:30:22 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 5 Jun 2021 01:30:15 +0000
Message-ID: <e08cdb24f070450b7de247bc98d74e35997cf739.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-10-alan.previn.teres.alexis@intel.com>
 <YLopEQeWZ40kV59k@intel.com>
In-Reply-To: <YLopEQeWZ40kV59k@intel.com>
Content-Language: en-US
Content-ID: <64502EA2410B8E48A982B9518BE6D2CA@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 09/17] Add subtest to copy raw source to
 protected dest
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
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2021-06-04 at 09:22 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:36AM -0700, Alan Previn wrote:
> > Add subtest to 3d-copy raw source buffer (with
> > known readible content) to a destination buffer
> > marked as protected with a protected session using
> > default session keys. The destination buffer is
> > verified to be different from the source (when
> > read via CPU) because its encrypted.
> > 
> > Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> > ---
> >  tests/i915/gem_pxp.c | 55
> > ++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 55 insertions(+)
> > 
> > diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> > index b1415efc..5a29024a 100644
> > --- a/tests/i915/gem_pxp.c
> > +++ b/tests/i915/gem_pxp.c
> > @@ -376,7 +376,9 @@ static uint32_t alloc_and_fill_dest_buff(int
> > i915, bool protected, uint32_t size
> >  #define TSTSURF_STRIDE      (TSTSURF_WIDTH*TSTSURF_BYTESPP)
> >  #define TSTSURF_SIZE        (TSTSURF_STRIDE*TSTSURF_HEIGHT)
> >  #define TSTSURF_FILLCOLOR1  0xfaceface
> > +#define TSTSURF_FILLCOLOR2  0xdeaddead
> >  #define TSTSURF_INITCOLOR1  0x12341234
> > +#define TSTSURF_INITCOLOR2  0x56785678
> 
> I couldn't understand why we can't simply reuse the ones who were
> there
> already, but anyway:
> 

Since this operation required me to start with a raw-src, then encrypt
it once to a dest-buf and then reuse that dest-buf as another source in
a second render operation, i wanted to ensure that none of the initial
color values of that second operation happenned to be the same as the
first operation. This is to avoid the event of stale data from re-used
memory not cleared properly (a bug we want to catch?) and missing it as
we setup the buffers for the second render.

We could perhaps forgo FILLCOLOR2 but since you gave the rv-b, I'm
assuming i can skip this.

Thanks again btw.

> 
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
