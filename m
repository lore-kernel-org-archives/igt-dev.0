Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236AF6E9C1
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Jul 2021 07:08:37 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 9 Jul 2021 07:08:23 +0000
Message-ID: <BY5PR11MB43728B8D04743521EEBCC59589189@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210708090439.4453-1-vidya.srinivas@intel.com>
 <20210708093057.31324-1-vidya.srinivas@intel.com>
 <CO6PR11MB55692A2FF838FDB5DC874C4D8D199@CO6PR11MB5569.namprd11.prod.outlook.com>
 <BY5PR11MB43721EA14E6AB31CE7AA133289199@BY5PR11MB4372.namprd11.prod.outlook.com>
 <PH0PR11MB557926DDD48F68486F0E34808D199@PH0PR11MB5579.namprd11.prod.outlook.com>
 <17de69b615a548df93fdad2b86526832@intel.com>
 <BY5PR11MB43729C0BE0CD3D6E7C6D2DAB89199@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB4372A20E955EEB653953B93889199@BY5PR11MB4372.namprd11.prod.outlook.com>
 <CO6PR11MB55690B39936C9D2D48498D6B8D199@CO6PR11MB5569.namprd11.prod.outlook.com>
 <BY5PR11MB437278197A9FA5DB1633C7CD89199@BY5PR11MB4372.namprd11.prod.outlook.com>
 <BY5PR11MB4372BE73766BA2A9328382F189189@BY5PR11MB4372.namprd11.prod.outlook.com>
 <CO6PR11MB556904F68AF8D300553D6B048D189@CO6PR11MB5569.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB556904F68AF8D300553D6B048D189@CO6PR11MB5569.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc
 assertion in coverage-vs-premult-vs-none for 6bpc panels
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Bhanu,

Thank you so much.
I have changed the message as suggested and tested it. https://patchwork.freedesktop.org/patch/443390/?series=90828&rev=18
Kindly check Rev 18.

Now I get this:
Test skipped for 6bpc panels
Subtest pipe-A-coverage-vs-premult-vs-constant: SKIP (0.058s)

Regards
Vidya

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com> 
Sent: Friday, July 9, 2021 12:17 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; Shankar, Uma <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc assertion in coverage-vs-premult-vs-none for 6bpc panels

Hi Vidya,

Overall it looks good, but I have one minor suggestion. Otherwise we are good to go.

+	/* 6bpc panels have dithering ON and CRC might fail, hence skip test */
+	igt_require(is_6bpc(display, pipe) == false);

It would be good if we print some useful message on skipping the test, so that user can aware of that skip.

Please try with below snippet:
igt_require_f(!is_6bpc(display, pipe), "Your message\n");


Thanks,
Bhanu

> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Friday, July 9, 2021 11:52 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Shankar, Uma 
> <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip 
> crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> 
> Hello Bhanu,
> 
> Could you kindly check if rev 16 is okay for merge?
> Thank you so much.
> 
> Regards
> Vidya
> 
> -----Original Message-----
> From: Srinivas, Vidya
> Sent: Thursday, July 8, 2021 7:56 PM
> To: Modem, Bhanuprakash <Bhanuprakash.Modem@intel.com>; Shankar, Uma 
> <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip 
> crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> 
> Very sorry Bhanu, I missed seeing your comments before submitting. Apologies.
> Please find them fixed here.
> 
> https://patchwork.freedesktop.org/patch/443213/?series=90828&rev=16
> 
> Regards
> Vidya
> 
> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: Thursday, July 8, 2021 7:51 PM
> To: Srinivas, Vidya <vidya.srinivas@intel.com>; Shankar, Uma 
> <uma.shankar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip 
> crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> 
> Hi Vidya,
> 
> Can you please address the comments in rev 14:
> https://patchwork.freedesktop.org/patch/443207/?series=90828&rev=14
> 
> 
> Thanks,
> Bhanu
> 
> > -----Original Message-----
> > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > Sent: Thursday, July 8, 2021 7:49 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; Modem, Bhanuprakash 
> > <bhanuprakash.modem@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: 
> > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> >
> > Hello Uma/Bhanu,
> >
> > https://patchwork.freedesktop.org/patch/443212/?series=90828&rev=15 
> > I have submitted the patch with adding DSI and skipping the test.
> > Kindly check and approve if okay.
> >
> > Regards
> > Vidya
> >
> > -----Original Message-----
> > From: Srinivas, Vidya
> > Sent: Thursday, July 8, 2021 7:44 PM
> > To: Shankar, Uma <uma.shankar@intel.com>; Modem, Bhanuprakash 
> > <Bhanuprakash.Modem@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: 
> > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> >
> > Hello Uma,
> >
> > Sure, I have already submitted skipping test itself
> > https://patchwork.freedesktop.org/patch/443207/?series=90828&rev=14
> > I will add DSI also the same and re-submit. Thank you so much.
> >
> > Regards
> > Vidya
> >
> > -----Original Message-----
> > From: Shankar, Uma <uma.shankar@intel.com>
> > Sent: Thursday, July 8, 2021 7:05 PM
> > To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; Srinivas, 
> > Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
> > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: 
> > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> >
> >
> >
> > > -----Original Message-----
> > > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > > Sent: Thursday, July 8, 2021 5:51 PM
> > > To: Srinivas, Vidya <vidya.srinivas@intel.com>; 
> > > igt-dev@lists.freedesktop.org; Shankar, Uma 
> > > <uma.shankar@intel.com>
> > > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend:
> > > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc panels
> > >
> > > > From: Srinivas, Vidya <vidya.srinivas@intel.com>
> > > > Sent: Thursday, July 8, 2021 5:03 PM
> > > > To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>; igt- 
> > > > dev@lists.freedesktop.org
> > > > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend:
> > > > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc 
> > > > panels
> > > >
> > > > Hello Bhanu,
> > > >
> > > > No we skip it for all 6bpc. We can skip the test, but as 
> > > > discussed with Uma, I just skip crc check, not the test.
> > > > Kindly suggest further.
> > >
> > > If we remove/skip the crc check, I think there is no point in 
> > > doing further commits unless we have kernel checkers.
> > >
> > > Uma?
> >
> > I think it's a compromise here,  skip on 6bpc would be ideal here or 
> > we need to have some passing criterion in order to declare this as pass.
> >
> > We can do the bpc check after the first commit and skip there itself 
> > if we detect 6bpc.This should be better given the constraints. Also 
> > Vidya its good to add MIPI_DSI along with eDP as well since we have 
> > some 6bpc MIPI DSI panels as well.
> >
> > > >
> > > > Regards
> > > > Vidya
> > > >
> > > > -----Original Message-----
> > > > From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> > > > Sent: Thursday, July 8, 2021 4:15 PM
> > > > To: Srinivas, Vidya <vidya.srinivas@intel.com>; 
> > > > igt-dev@lists.freedesktop.org
> > > > Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend:
> > > > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc 
> > > > panels
> > > >
> > > > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On 
> > > > > Behalf Of Vidya Srinivas
> > > > > Sent: Thursday, July 8, 2021 3:01 PM
> > > > > To: igt-dev@lists.freedesktop.org
> > > > > Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend:
> > > > > Skip crc assertion in coverage-vs-premult-vs-none for 6bpc 
> > > > > panels
> > > > >
> > > > > Intel Gen11 platforms using 6bpc panels have dithering ON and 
> > > > > show CRC mismatch in coverage-vs-premult-vs-none Doing a crc 
> > > > > based test with dithering is not a great idea as pixels will 
> > > > > change due to the 8bit to 6bits truncation with dithering.
> > > > >
> > > > > This patch skips the CRC assertion for 6bpc panels. Currently, 
> > > > > there is no better way of fetching the bpc info other than 
> > > > > EDID or display_info. Currently using i915_display_info for the same.
> > > > > Hence restricting the check to i915 devices only.
> > > > >
> > > > > Credits-to: Uma Shankar <uma.shankar@intel.com>
> > > > > Credits-to: Juha-pekka Heikkila 
> > > > > <juha-pekka.heikkila@intel.com>
> > > > > Credits-to: Modem Bhanuprakash <Bhanuprakash.Modem@intel.com>
> > > > > Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> > > > > Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> > > > > ---
> > > > >  tests/kms_plane_alpha_blend.c | 43
> > > > > +++++++++++++++++++++++++++++++++--
> > > > >  1 file changed, 41 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/tests/kms_plane_alpha_blend.c 
> > > > > b/tests/kms_plane_alpha_blend.c index 
> > > > > a37cb27c7d62..e450e64cb105
> > > > > 100644
> > > > > --- a/tests/kms_plane_alpha_blend.c
> > > > > +++ b/tests/kms_plane_alpha_blend.c
> > > > > @@ -442,10 +442,42 @@ static void coverage_7efc(data_t *data, 
> > > > > enum pipe pipe, igt_plane_t *plane) 
> > > > > igt_pipe_crc_stop(data->pipe_crc);
> > > > >  }
> > > > >
> > > > > +static bool is_6bpc(igt_display_t *display, enum pipe pipe) { 
> > > > > +char buf[4096]; char *str; bool ret; int debugfs_fd; 
> > > > > +drmModeConnector *c; igt_output_t *output = 
> > > > > +igt_get_single_output_for_pipe(display,
> > > > > +pipe);
> > > > > +
> > > > > +if (!is_i915_device(display->drm_fd))
> > > > > +return false;
> > > > > +
> > > > > +c = output->config.connector; if (c->connector_type != 
> > > > > +DRM_MODE_CONNECTOR_eDP) return false;
> > > > > +
> > > > > +debugfs_fd = igt_debugfs_dir(display->drm_fd); if (debugfs_fd 
> > > > > +<
> > > > > +0) return false;
> > > > > +
> > > > > +igt_debugfs_simple_read(debugfs_fd, "i915_display_info", buf,
> > > > > sizeof(buf));
> > > > > +
> > > > > +str = strstr(buf, "bpp=");
> > > > > +if (str && (strncmp(str, "bpp=18", 6) == 0)) ret = true; else 
> > > > > +ret = false;
> > > > > +
> > > > > +close(debugfs_fd);
> > > > > +return ret;
> > > > > +}
> > > > > +
> > > > >  static void coverage_premult_constant(data_t *data, enum pipe 
> > > > > pipe, igt_plane_t *plane)  {  igt_display_t *display = 
> > > > > &data->display;  igt_crc_t ref_crc = {}, crc = {};
> > > > > +bool is6bpc = false;
> > > > >
> > > > >  /* Set a background color on the primary fb for testing */  
> > > > > if (plane->type != DRM_PLANE_TYPE_PRIMARY) @@ -461,14 +493,21 
> > > > > @@ static void coverage_premult_constant(data_t *data, enum 
> > > > > pipe pipe, igt_plane_t  igt_plane_set_fb(plane, 
> > > > > &data->argb_fb_7e); igt_display_commit2(display, 
> > > > > COMMIT_ATOMIC); igt_pipe_crc_get_current(display->drm_fd, 
> > > > > data->pipe_crc, &crc); -igt_assert_crc_equal(&ref_crc, &crc);
> > > > > +
> > > > > +/* 6bpc panels have dithering ON and CRC might fail, hence 
> > > > > +skip crc
> > > > > check */
> > > > > +is6bpc = is_6bpc(display, pipe); if (is6bpc == false) 
> > > > > +igt_assert_crc_equal(&ref_crc, &crc);
> > > >
> > > > We can SKIP here, right? Also no need to run on remaining planes.
> > > > Otherwise IGT will report this test result as PASS instead of 
> > > > reporting as
> > SKIP.
> > > >
> > > > igt_require_f(!is_6bpc(display, pipe), "Skip test on 6 bpc 
> > > > panels\n");
> > > >
> > > >
> > > > Also, are we going to skip this test on only gen 11? Then we 
> > > > need a check to perform such.
> > > >
> > > > if (is_i915_device(fd) && intel_gen(intel_get_drm_devid(fd)) ==
> > > > 11) igt_require_f(!is_6bpc(display, pipe), "Skip test on 6 bpc 
> > > > panels\n");
> > > >
> > > > >
> > > > >  igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE,
> > > "None");
> > > > >  igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e); 
> > > > > igt_plane_set_fb(plane, &data->argb_fb_cov_7e); 
> > > > > igt_display_commit2(display, COMMIT_ATOMIC); 
> > > > > igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, 
> > > > > &crc); -igt_assert_crc_equal(&ref_crc, &crc);
> > > > > +
> > > > > +/* 6bpc panels have dithering ON and CRC might fail, hence 
> > > > > +skip crc
> > > > > check */
> > > > > +if (is6bpc == false)
> > > > > +igt_assert_crc_equal(&ref_crc, &crc);
> > > > >
> > > > >  igt_pipe_crc_stop(data->pipe_crc);
> > > > >  }
> > > > > --
> > > > > 2.32.0
> > > > >
> > > > > _______________________________________________
> > > > > igt-dev mailing list
> > > > > igt-dev@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> >

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
