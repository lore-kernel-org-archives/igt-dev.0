Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE34896C4
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Aug 2021 07:30:42 +0000 (UTC)
Date: Mon, 9 Aug 2021 09:30:33 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210809073033.GC5318@zkempczy-mobl2>
References: <20210806134145.24634-1-zbigniew.kempczynski@intel.com>
 <20210806134145.24634-38-zbigniew.kempczynski@intel.com>
 <87fsvmum2i.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87fsvmum2i.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 37/56] tests/gem_tiled_fence_blits:
 Adopt to use allocator
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
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 06, 2021 at 05:37:25PM -0700, Dixit, Ashutosh wrote:
> On Fri, 06 Aug 2021 06:41:26 -0700, Zbigniew Kempczyński wrote:
> >
> > For newer gens we're not able to rely on relocations. Adopt to use
> > offsets acquired from the allocator.
> 
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> 
> Just a question below.
> 
> > @@ -198,7 +209,23 @@ static void run_test(int fd, int count)
> >			reloc[0].target_handle = obj[0].handle = bo[dst];
> >			reloc[1].target_handle = obj[1].handle = bo[src];
> >
> > +			if (ahnd) {
> > +				obj[0].offset = get_offset(ahnd, obj[0].handle,
> > +						sizeof(linear), 0);
> > +				obj[1].offset = get_offset(ahnd, obj[1].handle,
> > +						sizeof(linear), 0);
> > +				obj[2].offset = get_offset(ahnd, obj[2].handle,
> > +						4096, 0);
> > +				update_batch(fd, obj[2].handle, reloc,
> > +					     obj[0].offset, obj[1].offset);
> > +			}
> > +
> >			gem_execbuf(fd, &eb);
> > +			if (ahnd) {
> > +				gem_close(fd, obj[2].handle);
> > +				obj[2].handle = gem_create(fd, 4096);
> 
> Is it necessary to update these offsets above, rather than just fix the
> offsets at the beginning of the function? Also to recreate obj[2]? What we
> have above is fine but just wondering the reason for it. Thanks.

Original - reloc version uses single batch which is patched by kernel 
when it completes. i915 knows when it can be altered with new relocation
data then executed. For softpin we're not able to do so on same active bb.
We should wait until bb will be not busy and then we could patch it. 
Doing this in userspace can be done using out-fence, poll() then patch
bb and execbuf(). But this strategy is prone to stalls because time 
we spend in userspace is idle from gpu point of view. Another attitude
is to prepare more execbufs which enqueued on same context will be
executed sequentially but without gaps between. This is strategy
above. 

--
Zbigniew 
