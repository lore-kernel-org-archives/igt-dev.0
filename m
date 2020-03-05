Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 966266E358
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 15:31:22 +0000 (UTC)
Date: Thu, 5 Mar 2020 14:03:14 +0530
From: Kunal Joshi <kunal1.joshi@intel.com>
Message-ID: <20200305083313.GA4267@intel.com>
References: <1583324295-22013-1-git-send-email-kunal1.joshi@intel.com>
 <20200305115433.GS3839@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305115433.GS3839@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_chamelium: Add support to
 validate YUV pixel formats
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2020-03-05 at 13:54:33 +0200, Petri Latvala wrote:
> On Wed, Mar 04, 2020 at 05:48:15PM +0530, Kunal Joshi wrote:
> > Currently, only hard coded pixel formats are validated which are not
> > generic for all the platforms which leads to false alarms.
> > Added support to validate only those pixel formats which are supported
> > by platform.
> > 
> > Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> > ---
> >  tests/kms_chamelium.c | 70 +++++++++++++++++++++++----------------------------
> >  1 file changed, 32 insertions(+), 38 deletions(-)
> > 
> > diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> > index 5c4a189..d6d63c6 100644
> > --- a/tests/kms_chamelium.c
> > +++ b/tests/kms_chamelium.c
> > @@ -2612,6 +2612,14 @@ static const struct edid *get_edid(enum test_edid edid)
> >  			if (chamelium_port_get_type(port) == \
> >  			    DRM_MODE_CONNECTOR_ ## type__)
> >  
> > +#define connector_subtest_start(name__, type__)              \
> > +	igt_subtest_with_dynamic(name__)                     \
> > +		for_each_port(p, port)                       \
> > +			if (chamelium_port_get_type(port) == \
> > +			    DRM_MODE_CONNECTOR_ ## type__) {
> > +
> > +#define connector_subtest_end }
> > +
> >  static data_t data;
> >  
> >  IGT_TEST_DESCRIPTION("Tests requiring a Chamelium board");
> > @@ -2872,44 +2880,30 @@ igt_main
> >  						   CHAMELIUM_CHECK_CRC);
> >  
> >  		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-nv12", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_NV12,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-nv16", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_NV16,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-nv21", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_NV21,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-nv61", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_NV61,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-yu12", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_YUV420,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-yu16", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_YUV422,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-yv12", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_YVU420,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > -
> > -		igt_describe(test_display_one_mode_desc);
> > -		connector_subtest("hdmi-cmp-yv16", HDMIA)
> > -			test_display_one_mode(&data, port, DRM_FORMAT_YVU422,
> > -					      CHAMELIUM_CHECK_CHECKERBOARD, 1);
> > +		connector_subtest_start("hdmi-yuv", HDMIA)
> > +			int k;
> > +			igt_output_t *output;
> > +			igt_plane_t *primary;
> > +
> > +			output = prepare_output(&data, port, TEST_EDID_BASE);
> > +			primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> > +			igt_assert(primary);
> > +
> > +			for (k = 0; k < primary->format_mod_count; k++) {
> > +
> > +				if (!igt_fb_supported_format(primary->formats[k]))
> > +					continue;
> > +
> > +				if (!(igt_format_is_yuv(primary->formats[k])
> > +				   && primary->modifiers[k] != LOCAL_DRM_FORMAT_MOD_NONE))
> > +					continue;
> 
> Can you structure this if statement in another way? if-inside-an-if or
> convert !(a && b) to (!a || !b). I had to read it three times and then
> open it in an editor to help me see what parens are what and how much
> that ! negates.
> 
> 
Thanks petri for the comment
I have addressed your comment in the new patch series
> -- 
> Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
