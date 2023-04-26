Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FEC10E0A4
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Apr 2023 10:52:38 +0000 (UTC)
Date: Wed, 26 Apr 2023 12:52:35 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Message-ID: <20230426105235.6yzgqmrzxtld3iup@zkempczy-mobl2>
References: <20230425154017.374465-1-zbigniew.kempczynski@intel.com>
 <20230425154017.374465-9-zbigniew.kempczynski@intel.com>
 <81f21156-0b26-a53a-0964-07097da28c41@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <81f21156-0b26-a53a-0964-07097da28c41@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6 08/15] lib/intel_batchbuffer: Add Xe
 support in intel-bb
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

On Wed, Apr 26, 2023 at 11:59:43AM +0200, Manszewski, Christoph wrote:
> > +			/* Use safe start offset instead assuming 0x0 is safe */
> > +			start = max_t(uint64_t, start, gem_detect_safe_start_offset(fd));
> 
> I'm not sure this is relevant since it should be related to the allocator
> scenario, however originally we executed this line regardless of the
> 'do_relocs' value.

If you mean allocator also adopts start/end for intel-bb we want
to override this, just to not rely on default allocator start/end
offset detection.

> 
> Upholding:
> Reviewed-by: Christoph Manszewski <christoph.manszewski@intel.com>

Thank you for the review.

--
Zbigniew

> 
> Christoph
> 
> 
> > +
> > +			/* if relocs are set we won't use an allocator */
> > +			ibb->allocator_handle =
> > +				intel_allocator_open_full(fd, ctx,
> > +							  start, end,
> > +							  allocator_type,
> > +							  strategy, 0);
