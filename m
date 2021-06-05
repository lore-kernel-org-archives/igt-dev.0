Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFC26E43C
 for <igt-dev@lists.freedesktop.org>; Sat,  5 Jun 2021 01:08:00 +0000 (UTC)
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Date: Sat, 5 Jun 2021 01:07:56 +0000
Message-ID: <256530184ff5c6a18dc46b3d7c6deca13a386874.camel@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-18-alan.previn.teres.alexis@intel.com>
 <YLo7d2H3IM7ioEcq@intel.com>
In-Reply-To: <YLo7d2H3IM7ioEcq@intel.com>
Content-Language: en-US
Content-ID: <436D15285AB59F43B6A14DFB58D6FF33@namprd11.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 17/17] tests/i915_pxp: CRC validation
 for display tests.
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
To: "Shankar, Uma" <uma.shankar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2021-06-04 at 10:40 -0400, Rodrigo Vivi wrote:
> On Tue, May 18, 2021 at 03:33:44AM -0700, Alan Previn wrote:
> > From: Karthik B S <karthik.b.s@intel.com>
> > 
> > Added subtests to validate pxp using CRC validation.
> > 
> > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> 
> > ---
> >  tests/i915/gem_pxp.c | 286
> > ++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 283 insertions(+), 3 deletions(-)
> > 
> > diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> > index 179fb742..728c925a 100644
> > +		if (hdcp) {
> > +			/* Disable HDCP and collect CRC */
> > +			igt_output_set_prop_value(hdcp_output[0],
> > IGT_CONNECTOR_CONTENT_PROTECTION,
> > +						  CP_UNDESIRED);
> > +			igt_display_commit2(display, COMMIT_ATOMIC);
> > +			ret = wait_for_prop_value(hdcp_output[0],
> > CP_UNDESIRED,
> > +						  KERNEL_DISABLE_TIME_A
> > LLOWED_MSEC);
> > +			igt_assert_f(ret, "Content Protection not
> > cleared\n");
> > +
> > +			igt_plane_set_fb(plane, &protected_fb);
> > +			igt_fb_set_size(&protected_fb, plane, mode-
> > >hdisplay, mode->vdisplay);
> > +			igt_plane_set_size(plane, mode->hdisplay, mode-
> > >vdisplay);
> > +
> > +			igt_display_commit2(display, COMMIT_ATOMIC);
> > +			igt_pipe_crc_collect_crc(pipe_crc, &new_crc);
> > +			igt_assert_f(!igt_check_crc_equal(&ref_crc,
> > &new_crc),
> > +				    "CRC's expected to be different
> > after HDCP is disabled\n");
> 
> The CRC is at the pipe level, but I believe it is right to expect
> that
> after disabling the HDCP we will get different CRC.
> 
> +Uma to help me to confirm this.
> 
> But also, I'm asking myself if this test case here is really bringing
> any value to PXP itself. To me, it looks like it is only testing
> HDCP disable scenario... nothing to do with the PXP flow.
> 
> With the HDCP removed, or with Uma confirming my assumption is right
> and that I'm wrong about the value-added, feel free to use:
> 

If i recall our earlier conversations on test requirements, we wanted
to ensure that the HW had indeed changed the key or completely disabled
plane decryption in response to the teardown (i.e. disabling hdcp).
With that in mind, I thought pipe crc is not a reflection of hdcp
encryption state - i thought that was the transcoder CRC. So Pipe CRC
really does reflect the content (and, as such, plane decryption) unless
the plane is disabled or occluded by another plane (which is never the
case in this controlled IGT environment). But lets hear from Uma - i
maybe crc input-signal.

> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> > 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
