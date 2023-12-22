Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D34210E763
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Dec 2023 08:33:45 +0000 (UTC)
Date: Fri, 22 Dec 2023 10:33:41 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [PATCH i-g-t 01/12] lib/rendercopy: Add deltas to all surface
 relocs
Message-ID: <ZYVJ5SjcfiLUYFPP@intel.com>
References: <20231220175934.22849-1-ville.syrjala@linux.intel.com>
 <20231220175934.22849-2-ville.syrjala@linux.intel.com>
 <20231222053731.ph6cjqgis2yh6upr@zkempczy-mobl2>
 <ZYUmH-o0eH2qVM30@intel.com> <ZYUnaMTEkCV2ZDZi@intel.com>
 <ZYUyRaXo_P4KF4VX@intel.com>
 <20231222072608.rpv2zyglnk6jm566@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231222072608.rpv2zyglnk6jm566@zkempczy-mobl2>
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

On Fri, Dec 22, 2023 at 08:26:08AM +0100, Zbigniew Kempczyński wrote:
> On Fri, Dec 22, 2023 at 08:52:53AM +0200, Ville Syrjälä wrote:
> > On Fri, Dec 22, 2023 at 08:06:32AM +0200, Ville Syrjälä wrote:
> > > On Fri, Dec 22, 2023 at 08:01:03AM +0200, Ville Syrjälä wrote:
> > > > On Fri, Dec 22, 2023 at 06:37:31AM +0100, Zbigniew Kempczyński wrote:
> > > > > On Wed, Dec 20, 2023 at 07:59:23PM +0200, Ville Syrjala wrote:
> > > > > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > 
> > > > > > In order to copy stuff not at offset 0 in the BO we need
> > > > > > to include the delta in the relocs/etc.
> > > > > > 
> > > > > > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > > > ---
> > > > > >  lib/rendercopy_gen4.c |  9 +++++----
> > > > > >  lib/rendercopy_gen6.c |  9 +++++----
> > > > > >  lib/rendercopy_gen7.c |  9 +++++----
> > > > > >  lib/rendercopy_gen8.c |  9 +++++----
> > > > > >  lib/rendercopy_gen9.c | 13 +++++++------
> > > > > >  lib/rendercopy_i830.c | 10 +++++++---
> > > > > >  lib/rendercopy_i915.c |  6 ++++--
> > > > > >  7 files changed, 38 insertions(+), 27 deletions(-)
> > > > > > 
> > > > > > diff --git a/lib/rendercopy_gen4.c b/lib/rendercopy_gen4.c
> > > > > > index 8536d6b632c5..d10e5b7780c0 100644
> > > > > > --- a/lib/rendercopy_gen4.c
> > > > > > +++ b/lib/rendercopy_gen4.c
> > > > > > @@ -148,10 +148,11 @@ gen4_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst)
> > > > > >  	ss->ss0.data_return_format = SURFACERETURNFORMAT_FLOAT32;
> > > > > >  	ss->ss0.color_blend = 1;
> > > > > >  
> > > > > > -	address = intel_bb_offset_reloc(ibb, buf->handle,
> > > > > > -					read_domain, write_domain,
> > > > > > -					intel_bb_offset(ibb) + 4,
> > > > > > -					buf->addr.offset);
> > > > > > +	address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > > > > > +						   read_domain, write_domain,
> > > > > > +						   buf->surface[0].offset,
> > > > > > +						   intel_bb_offset(ibb) + 4,
> > > > > > +						   buf->addr.offset);
> > > > > >  	ss->ss1.base_addr = (uint32_t) address;
> > > > > 
> > > > > I've just took a look to intel_bb_add_reloc() because I didn't
> > > > > remember all details and I see address returned there is offset
> > > > > at which object will be binded, not offset + delta.
> > > > > Until this patch only users of this function reside in
> > > > > rendercopy_gen9.c so for older platforms it doesn't matter
> > > > > (xe driver doesn't support them).
> > > > > 
> > > > > Anyway, delta addition sets up 10-bit if buf->cc.offset is not zero.
> > > > > I mean:
> > > > > 
> > > > > address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
> > > > > 					   read_domain, write_domain,
> > > > > 					   (buf->cc.offset ? (1 << 10) : 0)
> > > > > 					   | buf->ccs[0].offset,
> > > > > 					   intel_bb_offset(ibb) + 4 * 10,
> > > > > 					   buf->addr.offset);
> > > > > ss->ss10.aux_base_addr = (address + buf->ccs[0].offset) >> 12;
> > > > > ss->ss11.aux_base_addr_hi = (address + buf->ccs[0].offset) >> 32;
> > > > > 
> > > > > I wonder shouldn't intel_bb_add_reloc() return offset + delta.
> > > > > 
> > > > > I also have some doubts regarding:
> > > > > 
> > > > > 	(buf->cc.offset ? (1 << 10) : 0) | buf->ccs[0].offset
> > > > > 
> > > > > This will set up bit-10 (if I'm not wrong clearvalue enable) only
> > > > > when relocation will happen. Without relocation or on softpinning
> > > > > this bit is never set.
> > > > > 
> > > > > Above also would require remove delta in __intel_bb_emit_reloc()
> > > > > but if I'm not wrong this would be enough to start directly using
> > > > > offset returned in intel_bb_add_reloc() derivatives.
> > > > > 
> > > > > Have I missed something?
> > > > 
> > > > No, I think you're right. The lack of the cc enable bit diretly
> > > > written to ss10 would seem to be wrong for the no-reloc case.
> > > > Also the >>12 there looks wrong. And the >>6 in the ss12 clear
> > > > color address looks wrong (and the reloc case should again
> > > > get fixed up by the kernel).
> > > 
> > > Actually no, the extra shift are correct due to the bitfields.
> > > But yeah clear color enable was missing for the no-reloc case.
> > > But that doesn't help either. And I just realized that I'm actually
> > > testing a modifier w/o CC anyway so the problem must be elsewhere.
> > 
> > OK, the problem seems to be that somehow the hardware thinks the
> > initial state of the AUX surface is compressed. So any part of the
> > FB I don't explicitly touch is left with interesting rainbow colors
> > when the zeroed main surface data is treated as compressed.
> > Did the AUX format change such that all zeroes in AUX is no 
> > longer uncompressed?
> 
> I don't know, but I would expect zero means uncompressed.

Actually that part seems OK. What is not OK is that when we write
all black compressed pixels we do something wrong. Feels like we're
writing some kind of fast clear data in that case that the display
doesn't understand (since I'm not using a CC modifier). So I 
suppose the question is whether we can somehow disable that,
or if we need to do an explicit resolve afterwards.

-- 
Ville Syrjälä
Intel
