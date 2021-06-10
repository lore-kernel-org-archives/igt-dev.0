Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B076ED72
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jun 2021 14:18:02 +0000 (UTC)
Date: Thu, 10 Jun 2021 10:17:58 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YMIfFoG1vIiJ9RXZ@intel.com>
References: <20210518103344.2264397-1-alan.previn.teres.alexis@intel.com>
 <20210518103344.2264397-18-alan.previn.teres.alexis@intel.com>
 <YLo7d2H3IM7ioEcq@intel.com>
 <256530184ff5c6a18dc46b3d7c6deca13a386874.camel@intel.com>
 <752e0f7a330d43deae47e9ea94c12c3b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <752e0f7a330d43deae47e9ea94c12c3b@intel.com>
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
To: "Shankar, Uma" <uma.shankar@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 01:00:06PM +0000, Shankar, Uma wrote:
> 
> 
> > -----Original Message-----
> > From: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>
> > Sent: Saturday, June 5, 2021 6:38 AM
> > To: Shankar, Uma <uma.shankar@intel.com>; Vivi, Rodrigo
> > <rodrigo.vivi@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t 17/17] tests/i915_pxp: CRC validation for display
> > tests.
> > 
> > On Fri, 2021-06-04 at 10:40 -0400, Rodrigo Vivi wrote:
> > > On Tue, May 18, 2021 at 03:33:44AM -0700, Alan Previn wrote:
> > > > From: Karthik B S <karthik.b.s@intel.com>
> > > >
> > > > Added subtests to validate pxp using CRC validation.
> > > >
> > > > Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> > > Cc: Uma Shankar <uma.shankar@intel.com>
> > >
> > > > ---
> > > >  tests/i915/gem_pxp.c | 286
> > > > ++++++++++++++++++++++++++++++++++++++++++-
> > > >  1 file changed, 283 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c index
> > > > 179fb742..728c925a 100644
> > > > +		if (hdcp) {
> > > > +			/* Disable HDCP and collect CRC */
> > > > +			igt_output_set_prop_value(hdcp_output[0],
> > > > IGT_CONNECTOR_CONTENT_PROTECTION,
> > > > +						  CP_UNDESIRED);
> > > > +			igt_display_commit2(display, COMMIT_ATOMIC);
> > > > +			ret = wait_for_prop_value(hdcp_output[0],
> > > > CP_UNDESIRED,
> > > > +						  KERNEL_DISABLE_TIME_A
> > > > LLOWED_MSEC);
> > > > +			igt_assert_f(ret, "Content Protection not
> > > > cleared\n");
> > > > +
> > > > +			igt_plane_set_fb(plane, &protected_fb);
> > > > +			igt_fb_set_size(&protected_fb, plane, mode-
> > > > >hdisplay, mode->vdisplay);
> > > > +			igt_plane_set_size(plane, mode->hdisplay, mode-
> > > > >vdisplay);
> > > > +
> > > > +			igt_display_commit2(display, COMMIT_ATOMIC);
> > > > +			igt_pipe_crc_collect_crc(pipe_crc, &new_crc);
> > > > +			igt_assert_f(!igt_check_crc_equal(&ref_crc,
> > > > &new_crc),
> > > > +				    "CRC's expected to be different
> > > > after HDCP is disabled\n");
> > >
> > > The CRC is at the pipe level, but I believe it is right to expect that
> > > after disabling the HDCP we will get different CRC.
> > >
> > > +Uma to help me to confirm this.
> > >
> > > But also, I'm asking myself if this test case here is really bringing
> > > any value to PXP itself. To me, it looks like it is only testing HDCP
> > > disable scenario... nothing to do with the PXP flow.
> > >
> > > With the HDCP removed, or with Uma confirming my assumption is right
> > > and that I'm wrong about the value-added, feel free to use:
> > >
> > 
> > If i recall our earlier conversations on test requirements, we wanted to ensure that
> > the HW had indeed changed the key or completely disabled plane decryption in
> > response to the teardown (i.e. disabling hdcp).
> > With that in mind, I thought pipe crc is not a reflection of hdcp encryption state - i
> > thought that was the transcoder CRC. So Pipe CRC really does reflect the content
> > (and, as such, plane decryption) unless the plane is disabled or occluded by another
> > plane (which is never the case in this controlled IGT environment). But lets hear from
> > Uma - i maybe crc input-signal.
> 
> Sorry for a late response, somehow missed this mail.

no problem

> 
> We have crc's at both pipe and at port level but it appears in the test here we are relying on pipe crc.
> So pipe crc will not be dependent on any HDCP state change as that happens at port. But if we expect
> that as part of HDCP teardown we will also disable plane decryption then surely we will get a different
> crc. But is it really the case here. Are we expecting both Plane decryption which is a PAVP usecase and
> HDCP to be operating together.  My understanding is we will have PAVP only for internal LFP's and go with
> HDCP when we operate with external sync.

Thanks.
So, if we want to move faster we probably want to drop this part of the test
or this patch entirely for the next revision and move with a follow up version
after the initial ones are merged.

> 
> Regards,
> Uma Shankar
> 
> > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >
> > > >
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
