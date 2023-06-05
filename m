Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADB410E185
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 07:26:21 +0000 (UTC)
Date: Mon, 5 Jun 2023 09:26:17 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <20230605072617.g5hztamvgr6e5he3@zkempczy-mobl2>
References: <20230328183043.16258-1-juhapekka.heikkila@gmail.com>
 <20230328183043.16258-3-juhapekka.heikkila@gmail.com>
 <20230403061753.6bu3tprz5j4e3bdk@zkempczy-mobl2>
 <dcb5cf93-2d1f-2171-e8c8-ec6553088c9a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dcb5cf93-2d1f-2171-e8c8-ec6553088c9a@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] lib/igt_fb: switch blitcopy to use
 lib/i915/i915_blt functions
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

On Wed, May 31, 2023 at 06:50:39PM +0300, Juha-Pekka Heikkila wrote:

<cut>

> > > +		for_each_ctx_engine(src_fb->fd, ictx, e) {
> > > +			if (gem_engine_can_block_copy(src_fb->fd, e))
> > > +				break;
> > 
> > Hmm, this means we need to be careful when using cmds_info. As
> > not all engines support block-copy simple information from the
> > library (blt_has_block_copy()) is not enough.
> 
> Thanks for the comments Zbigniew, I fell out from this work for a while with
> Covid and now finally reached to state with all other things I can continue
> with this.
> 
> I wasn't certain what you meant with above comment? There would be better
> way to find correct engine for doing block copy? As is I'm testing new
> version of this set where these parts are bit changed, I'll probably
> today/tomorrow send another version for ci to show what I still missed.

I'm sorry for the confusion, I was sure gem_engine_can_block_copy() calls
i915_blt function which doesn't check engine capability, just reports platform
supports block-copy or not. Function you're using just does what I mean
- checks engine block-copy capability.

--
Zbigniew

> 
> My final target with all this is blitter path would do rc ccs and I'd need
> Vebox only for compressing mc ccs.
> 
> /Juha-Pekka
> 
 
