Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212D56E9E7
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2020 09:28:22 +0000 (UTC)
Date: Wed, 8 Apr 2020 12:28:17 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200408092817.xxyrr2dsxt5vxl5y@ahiler-desk1.fi.intel.com>
References: <20200407101338.1340310-1-arkadiusz.hiler@intel.com>
 <20200408091704.GN9497@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408091704.GN9497@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_chamelium: Fix
 dp-mode-timings test
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org, Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Apr 08, 2020 at 12:17:04PM +0300, Petri Latvala wrote:
> On Tue, Apr 07, 2020 at 01:13:37PM +0300, Arkadiusz Hiler wrote:
> > Chamelium provides us with hsync_offset value which is read form its
> > receiver register described as "Hsync start edge to H active start
> > edge", vsync_offest is analogous.
> > 
> > Let's calculate the correct things on IGT side.
> > 
> > v2: keep the original checks for HDMI (Petri)
> > 
> > Cc: Petri Latvala <petri.latvala@intel.com>
> > Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> 
> Why does the discrepancy exist in the first place, DP vs HDMI? Just
> the receivers handled differently in chameliumd? Is this a
> misunderstanding on cham side and we might get a fix later and have to
> change this test again?

Yep, seems like this was added and never used/validated properly. I have
patch for chamelium drafted, but I don't have physical access to any
board to validate the changes, also the upstreaming process is quite
involved, but I plan on doing this and I wonder what the core developers
will say.

> Oh well. Either way, we don't automatically update chameliumd and will
> notice if there's a need to update tests again...
> 
> Reviewed-by: Petri Latvala <petri.latvala@intel.com>
> 
> 
> > ---
> >  tests/kms_chamelium.c | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index 77c203d3..69c9de4e 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -915,10 +915,20 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
> >  	chamelium_port_get_video_params(chamelium, port, &video_params);
> >  
> >  	mode_clock = (double) mode->clock / 1000;
> > -	mode_hsync_offset = mode->hsync_start - mode->hdisplay;
> > -	mode_vsync_offset = mode->vsync_start - mode->vdisplay;
> > +
> > +	if (chamelium_port_get_type(port) == DRM_MODE_CONNECTOR_DisplayPort) {
> > +		/* this is what chamelium understands as offsets for DP */
> > +		mode_hsync_offset = mode->htotal - mode->hsync_start;
> > +		mode_vsync_offset = mode->vtotal - mode->vsync_start;
> > +	} else {
> > +		/* and this is what they are for other connectors */
> > +		mode_hsync_offset = mode->hsync_start - mode->hdisplay;
> > +		mode_vsync_offset = mode->vsync_start - mode->vdisplay;
> > +	}
> > +
> >  	mode_hsync_width = mode->hsync_end - mode->hsync_start;
> >  	mode_vsync_width = mode->vsync_end - mode->vsync_start;
> > +
> >  	mode_hsync_polarity = !!(mode->flags & DRM_MODE_FLAG_PHSYNC);
> >  	mode_vsync_polarity = !!(mode->flags & DRM_MODE_FLAG_PVSYNC);
> >  
> > -- 
> > 2.24.1
> > 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
