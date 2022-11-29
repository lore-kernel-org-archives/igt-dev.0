Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA9BB10E07B
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Nov 2022 10:49:15 +0000 (UTC)
Date: Tue, 29 Nov 2022 12:49:12 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Message-ID: <Y4XjqMspEyuWhPHa@intel.com>
References: <20221129084710.1151876-1-jani.nikula@intel.com>
 <Y4XYGG+X8qFZiIsf@intel.com> <87a64a3wow.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87a64a3wow.fsf@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tools/intel_vbt_decode: decode VBT MIPI
 sequence v4 native flag
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

On Tue, Nov 29, 2022 at 12:02:39PM +0200, Jani Nikula wrote:
> On Tue, 29 Nov 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Nov 29, 2022 at 10:47:10AM +0200, Jani Nikula wrote:
> >> MIPI sequence v4 has a flag for native/non-native GPIO.
> >
> > An naturally zero docs on what it actually means. But looks like
> > we're just meant to poke various DE registers for the "native" case.
> 
> Yeah.
> 
> Related to [1] and [2], where I'm trying to poke said registers, with
> varying success.
> 
> BR,
> Jani.
> 
> 
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/6131
> [2] https://cgit.freedesktop.org/~jani/drm/log/?h=dsi-gpio

What's with the multi-step programming of the registers?

I suppose the GPIO registers should be OK with it, assuming
the mask bits really work as documented, but I don't see why
we'd need three register writes instead of one.

The south hotplug register looks like it could in theory
cause glitches on the pin since it tries to set the direction
before the value. Actually it looks to be writing the wrong
bits for the direction even, so might not even do anything atm.
Hmm, and actually Bspec is perhaps trying to say that the pin 
direction is configured externally (on SoC pinmux level/etc.)
so the the first write is possibly entirely redundant. Though
perhaps it would be cleaner to just set all the bits for the
specific pin (ie. disable hpd, clear hpd status, set output
value).

> 
> >
> > Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> >
> >> 
> >> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> >> ---
> >>  tools/intel_vbt_decode.c | 8 ++++++--
> >>  1 file changed, 6 insertions(+), 2 deletions(-)
> >> 
> >> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
> >> index a63bfdda142a..94a910b5c107 100644
> >> --- a/tools/intel_vbt_decode.c
> >> +++ b/tools/intel_vbt_decode.c
> >> @@ -2049,8 +2049,12 @@ static const uint8_t *mipi_dump_gpio(const uint8_t *data, uint8_t seq_version)
> >>  		number = *data++;
> >>  		flags = *data++;
> >>  
> >> -		printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
> >> -		       index, number, flags & 1, flags);
> >> +		if (seq_version >= 4)
> >> +			printf("\t\t\tGPIO index %u, number %u, native %d, set %d (0x%02x)\n",
> >> +			       index, number, !(flags & 2), flags & 1, flags);
> >> +		else
> >> +			printf("\t\t\tGPIO index %u, number %u, set %d (0x%02x)\n",
> >> +			       index, number, flags & 1, flags);
> >>  	} else {
> >>  		index = *data++;
> >>  		flags = *data++;
> >> -- 
> >> 2.34.1
> 
> -- 
> Jani Nikula, Intel Open Source Graphics Center

-- 
Ville Syrjälä
Intel
