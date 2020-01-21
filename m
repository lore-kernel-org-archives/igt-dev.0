Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7475A6ECEB
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2020 13:29:52 +0000 (UTC)
Date: Tue, 21 Jan 2020 15:29:48 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200121132948.GC25209@platvala-desk.ger.corp.intel.com>
References: <1579586055-27583-1-git-send-email-kunal1.joshi@intel.com>
 <1579586055-27583-2-git-send-email-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1579586055-27583-2-git-send-email-kunal1.joshi@intel.com>
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
Cc: ville.syrjala@intel.com, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jan 21, 2020 at 11:24:13AM +0530, Kunal Joshi wrote:
> Added chamelium_frame_match_or_dump which returns bool that the captured
> frame matches with reference framebuffer.
> 
> (v2)
>         Removed previously added function chamelium_assert_frame_dump_eq.
> 
> (v3)
> 	No change.
> 
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Suggested-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  lib/igt_chamelium.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_chamelium.h |  5 +++++
>  2 files changed, 70 insertions(+)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 9971f51..db1f2b6 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -1632,6 +1632,71 @@ void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
>  }
>  
>  /**
> + * chamelium_assert_frame_match_or_dump:
> + * @chamelium: The chamelium instance the frame dump belongs to
> + * @frame: The chamelium frame dump to match
> + * @fb: pointer to an #igt_fb structure
> + * @check: the type of frame matching check to use
> + *
> + * Returns bool that the provided captured frame matches the reference
> + * frame from the framebuffer. If they do not, this saves the reference
> + * and captured frames to a png file.
> + */
> +bool chamelium_frame_match_or_dump(struct chamelium *chamelium,
> +				   struct chamelium_port *port,
> +				   const struct chamelium_frame_dump *frame,
> +				   struct igt_fb *fb,
> +				   enum chamelium_check check)
> +{
> +	cairo_surface_t *reference;
> +	cairo_surface_t *capture;
> +	igt_crc_t *reference_crc;
> +	igt_crc_t *capture_crc;
> +	bool match;
> +
> +	/* Grab the reference frame from framebuffer */
> +	reference = igt_get_cairo_surface(chamelium->drm_fd, fb);
> +
> +	/* Grab the captured frame from chamelium */
> +	capture = convert_frame_dump_argb32(frame);
> +
> +	switch (check) {
> +	case CHAMELIUM_CHECK_ANALOG:
> +		match = igt_check_analog_frame_match(reference, capture);
> +		break;
> +	case CHAMELIUM_CHECK_CHECKERBOARD:
> +		match = igt_check_checkerboard_frame_match(reference, capture);
> +		break;
> +	default:
> +		igt_assert(false);
> +	}
> +
> +	if (!match && igt_frame_dump_is_enabled()) {
> +		reference_crc = malloc(sizeof(igt_crc_t));
> +		igt_assert(reference_crc);
> +
> +		/* Calculate the reference frame CRC. */
> +		chamelium_do_calculate_fb_crc(reference, reference_crc);
> +
> +		/* Get the captured frame CRC from the Chamelium. */
> +		capture_crc = chamelium_get_crc_for_area(chamelium, port, 0, 0,
> +							 0, 0);
> +		igt_assert(capture_crc);
> +
> +		compared_frames_dump(reference, capture, reference_crc,
> +				     capture_crc);
> +
> +		free(reference_crc);
> +		free(capture_crc);
> +	}
> +
> +	cairo_surface_destroy(reference);
> +	cairo_surface_destroy(capture);
> +
> +	return match;
> +}

This copy of chamelium_assert_frame_match_or_dump is
unnecessary. The typical structure is that we have a bool-returning
function for code that wants to do its own checks afterwards, and
another one that 1) calls the bool-returning function 2) asserts
success. Like so:


void chamelium_assert_frame_match_or_dump(struct chamelium *chamelium,
  					  const struct chamelium_frame_dump *frame,
  					  struct igt_fb *fb,
  					  enum chamelium_check check)
{
  igt_assert(chamelium_frame_match_or_dump(chamelium, frame, fb, check));
}




-- 
Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
