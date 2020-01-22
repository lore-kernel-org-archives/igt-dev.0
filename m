Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBD96F491
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jan 2020 10:34:51 +0000 (UTC)
Date: Wed, 22 Jan 2020 12:34:47 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200122103447.GI25209@platvala-desk.ger.corp.intel.com>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
 <1579586055-27583-2-git-send-email-kunal1.joshi@intel.com>
 <20200121132948.GC25209@platvala-desk.ger.corp.intel.com>
 <20200122030147.GA32307@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200122030147.GA32307@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/3] lib/igt_chamelium Added
 chamelium_frame_match_or_dump which returns bool that the captured frame
 matches
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jan 22, 2020 at 08:31:47AM +0530, Kunal Joshi wrote:
> On 2020-01-21 at 15:29:48 +0200, Petri Latvala wrote:
> > On Tue, Jan 21, 2020 at 11:24:13AM +0530, Kunal Joshi wrote:
> > > Added chamelium_frame_match_or_dump which returns bool that the captured
> > > frame matches with reference framebuffer.
> > > 
> > > (v2)
> > >         Removed previously added function chamelium_assert_frame_dump_eq.
> > > 
> > > (v3)
> > > 	No change.
> > > 
> > > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > > Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> > > Suggested-by: Uma Shankar <uma.shankar@intel.com>
> > > ---
> > >  lib/igt_chamelium.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > >  lib/igt_chamelium.h |  5 +++++
> > >  2 files changed, 70 insertions(+)
> > > 
> > > diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> > > index 9971f51..db1f2b6 100644
> > > --- a/lib/igt_chamelium.c
> > > +++ b/lib/igt_chamelium.c
> > > @@ -1632,6 +1632,71 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
> > >  }
> > >  
> > >  /**
> > > + * chamelium_assert_frame_match_or_dump:
> > > + * @chamelium: The chamelium instance the frame dump belongs to
> > > + * @frame: The chamelium frame dump to match
> > > + * @fb: pointer to an #igt_fb structure
> > > + * @check: the type of frame matching check to use
> > > + *
> > > + * Returns bool that the provided captured frame matches the reference
> > > + * frame from the framebuffer. If they do not, this saves the reference
> > > + * and captured frames to a png file.
> > > + */
> > > +bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
> > > +				   struct chamelium_port *port,
> > > +				   const struct chamelium_frame_dump *frame,
> > > +				   struct igt_fb *fb,
> > > +				   enum chamelium_check check)
> > > +{
> > > +	cairo_surface_t *reference;
> > > +	cairo_surface_t *capture;
> > > +	igt_crc_t *reference_crc;
> > > +	igt_crc_t *capture_crc;
> > > +	bool match;
> > > +
> > > +	/* Grab the reference frame from framebuffer */
> > > +	reference = igt_get_cairo_surface(chamelium->drm_fd, fb);
> > > +
> > > +	/* Grab the captured frame from chamelium */
> > > +	capture = convert_frame_dump_argb32(frame);
> > > +
> > > +	switch (check) {
> > > +	case CHAMELIUM_CHECK_ANALOG:
> > > +		match = igt_check_analog_frame_match(reference, capture);
> > > +		break;
> > > +	case CHAMELIUM_CHECK_CHECKERBOARD:
> > > +		match = igt_check_checkerboard_frame_match(reference, capture);
> > > +		break;
> > > +	default:
> > > +		igt_assert(false);
> > > +	}
> > > +
> > > +	if (!match && igt_frame_dump_is_enabled()) {
> > > +		reference_crc = malloc(sizeof(igt_crc_t));
> > > +		igt_assert(reference_crc);
> > > +
> > > +		/* Calculate the reference frame CRC. */
> > > +		chamelium_do_calculate_fb_crc(reference, reference_crc);
> > > +
> > > +		/* Get the captured frame CRC from the Chamelium. */
> > > +		capture_crc = chamelium_get_crc_for_area(chamelium, port, 0, 0,
> > > +							 0, 0);
> > > +		igt_assert(capture_crc);
> > > +
> > > +		compared_frames_dump(reference, capture, reference_crc,
> > > +				     capture_crc);
> > > +
> > > +		free(reference_crc);
> > > +		free(capture_crc);
> > > +	}
> > > +
> > > +	cairo_surface_destroy(reference);
> > > +	cairo_surface_destroy(capture);
> > > +
> > > +	return match;
> > > +}
> > 
> > This copy of chamelium_assert_frame_match_or_dump is
> > unnecessary. The typical structure is that we have a bool-returning
> > function for code that wants to do its own checks afterwards, and
> > another one that 1) calls the bool-returning function 2) asserts
> > success. Like so:
> > 
> > 
> Petri if you see the function test_pipe_ctm, we loop for different
> delta values If the of the delta value has a match then only we assert,
> I think chamelium_frame_dump_match returning a bool value is required,
> I will use chamelium_assert_frame_match_or_dump in the rest of
> the functions where we need to assert without any further checks.

I only meant that you don't need to copy the function body to get
those two different functions. The asserting function can be
implemented by calling the other one and asserting.

-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
