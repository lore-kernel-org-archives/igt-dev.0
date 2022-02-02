Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B0710F311
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Feb 2022 06:21:07 +0000 (UTC)
Date: Wed, 2 Feb 2022 07:21:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YfoizqgCmIe2y+LP@zkempczy-mobl2>
References: <20220131164804.26165-1-zbigniew.kempczynski@intel.com>
 <87bkzq45kl.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkzq45kl.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/api_intel_bb: Correct size for
 munmap
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

On Tue, Feb 01, 2022 at 01:53:14PM -0800, Dixit, Ashutosh wrote:
> On Mon, 31 Jan 2022 08:48:04 -0800, Zbigniew Kempczyński wrote:
> >
> > If we don't release the entirety of the mmap we create, it still holds a
> > reference to the fd/object.
> >
> > Signed-off-by: Chris Wilson <chris.p.wilson@intel.com>
> > Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > ---
> >  tests/i915/api_intel_bb.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tests/i915/api_intel_bb.c b/tests/i915/api_intel_bb.c
> > index 5c996f644..130fb9014 100644
> > --- a/tests/i915/api_intel_bb.c
> > +++ b/tests/i915/api_intel_bb.c
> > @@ -1169,7 +1169,7 @@ static void delta_check(struct buf_ops *bops)
> >	ptr = gem_mmap__device_coherent(i915, buf->handle, 0,
> >					intel_buf_size(buf), PROT_READ);
> >	val = ptr[0x2000 / sizeof(uint32_t)];
> > -	gem_munmap(ptr, ibb->size);
> > +	gem_munmap(ptr, intel_buf_bo_size(buf));
> 
> For making it easier, maybe we should also change to intel_buf_bo_size() in
> the mmap (similar to the munmap). Or have intel_buf_size() in the munmap
> too? Basically the same in both map and unmap. With that, this is:

Yes, you're right. I missed that in above mapping. intel_buf_size() is not
always intel_buf_bo_size() as first one contains requested buffer size.
It may differ than buffer size created by the kernel.

For above case intel_buf_size() should be put as an argument. 
Thanks for spotting that. I'm going to change and resend.

--
Zbigniew

> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
