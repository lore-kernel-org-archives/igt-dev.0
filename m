Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B4510E6F5
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 18:28:36 +0000 (UTC)
Date: Wed, 6 Sep 2023 21:28:48 +0300
From: Imre Deak <imre.deak@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>
Message-ID: <ZPjE4AL8v9xw+0z0@ideak-desk.fi.intel.com>
References: <20230904170749.14616-1-jeevan.b@intel.com>
 <ZPYi0chDmm3G4r8L@ideak-desk.fi.intel.com>
 <DM4PR11MB63128768E4EF4978D5E1F94490E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM4PR11MB63128768E4EF4978D5E1F94490E8A@DM4PR11MB6312.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_setmode: skip subtest when
 valid combination not found
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: imre.deak@intel.com
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 05, 2023 at 08:24:33AM +0300, B, Jeevan wrote:
> > -----Original Message-----
> > From: Deak, Imre <imre.deak@intel.com>
> > Sent: Tuesday, September 5, 2023 12:03 AM
> > To: B, Jeevan <jeevan.b@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [PATCH i-g-t] tests/kms_setmode: skip subtest when valid
> > combination not found
> >
> > On Mon, Sep 04, 2023 at 10:37:49PM +0530, Jeevan B wrote:
> > > Skip subtest with a valid message instead of "No dynamic tests executed"
> > > when valid crtc-connector combination is not available.
> >
> > Please describe how the change actually fixes things. If no dynamic test is
> > defined for a subtest the subtest will skip. Is that an issue and if so why?
> Hi Imre,
> 
> It does not resolve/fixes things, but rather provides clarity when the
> bugs are generated.
> Instead of skipping with "No Dynamic Subtest Executed"

I still don't get it. I presume you refer to the CI results generated,
but please provide an actual example.

After this change dynamic subtests would be defined which can never run
on a given platform and so would always skip on this platform. Is this
somehow better than the current way of skipping the whole subtest
(always)?

For a given platform type there is also a variation of dynamic tests
depending on what connected connectors the test sees. But this is the
behavior both before and after this change.

> 
> Thanks
> Jeevan B
> >
> > >
> > > Signed-off-by: Jeevan B <jeevan.b@intel.com>
> > > ---
> > >  tests/kms_setmode.c | 64
> > > ++++++++++++++++++++++-----------------------
> > >  1 file changed, 32 insertions(+), 32 deletions(-)
> > >
> > > diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c index
> > > a611d938..74292abf 100644
> > > --- a/tests/kms_setmode.c
> > > +++ b/tests/kms_setmode.c
> > > @@ -645,47 +645,47 @@ static void test_one_combination(const struct
> > test_config *tconf,
> > >                              int connector_count)
> > >  {
> > >     struct crtc_config crtcs[MAX_CRTCS];
> > > -   int crtc_count;
> > > +   int crtc_count, i, pos = 0;
> > > +   char test_name[256];
> > >     bool config_valid;
> > >
> > >     setup_crtcs(tconf, cconfs, connector_count, crtcs,
> > >                 &crtc_count, &config_valid);
> > >
> > > -   if (config_valid == !(tconf->flags & TEST_INVALID)) {
> > > -           int i, pos = 0;
> > > -           char test_name[256];
> > > -
> > > -           for (i = 0; i < crtc_count; i++) {
> > > -                   if (i > 0)
> > > -                           pos += snprintf(&test_name[pos],
> > ARRAY_SIZE(test_name) - pos, "-");
> > > -                   pos += get_test_name_str(&crtcs[i],
> > &test_name[pos], ARRAY_SIZE(test_name) - pos);
> > > -           }
> > > +   for (i = 0; i < crtc_count; i++) {
> > > +           if (i > 0)
> > > +                   pos += snprintf(&test_name[pos],
> > ARRAY_SIZE(test_name) - pos, "-");
> > > +           pos += get_test_name_str(&crtcs[i], &test_name[pos],
> > ARRAY_SIZE(test_name) - pos);
> > > +   }
> > >
> > > -           for (i = 0; i < crtc_count; i++) {
> > > -                   struct crtc_config *crtc = &crtcs[i];
> > > -
> > > -                   /*
> > > -                    * if mode.hdisplay > 5120, then ignore
> > > -                    *   - last crtc in single/multi-connector config
> > > -                    *   - consecutive crtcs in multi-connector config
> > > -                    *
> > > -                    * in multi-connector config ignore if
> > > -                    *   - previous crtc mode.hdisplay > 5120 and
> > > -                    *   - current & previous crtcs are consecutive
> > > -                    */
> > > -                   if (((crtc->mode.hdisplay >
> > MAX_HDISPLAY_PER_CRTC) &&
> > > -                        ((crtc->crtc_idx >= (tconf->resources->count_crtcs
> > - 1)) ||
> > > -                         ((i < (crtc_count - 1)) && (abs(crtcs[i + 1].crtc_idx -
> > crtc->crtc_idx) <= 1)))) ||
> > > -                       ((i > 0) && (crtc[i - 1].mode.hdisplay >
> > MAX_HDISPLAY_PER_CRTC) &&
> > > -                        (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <= 1))) {
> > > -                           igt_info("Combo: %s is not possible with
> > selected mode(s).\n", test_name);
> > > -                           goto out;
> > > +   igt_dynamic_f("%s", test_name)
> > > +           if (config_valid == !(tconf->flags & TEST_INVALID)) {
> > > +
> > > +                   for (i = 0; i < crtc_count; i++) {
> > > +                           struct crtc_config *crtc = &crtcs[i];
> > > +
> > > +                           /*
> > > +                            * if mode.hdisplay > 5120, then ignore
> > > +                            *   - last crtc in single/multi-connector config
> > > +                            *   - consecutive crtcs in multi-connector
> > config
> > > +                            *
> > > +                            * in multi-connector config ignore if
> > > +                            *   - previous crtc mode.hdisplay > 5120 and
> > > +                            *   - current & previous crtcs are consecutive
> > > +                            */
> > > +                           if (((crtc->mode.hdisplay >
> > MAX_HDISPLAY_PER_CRTC) &&
> > > +                                ((crtc->crtc_idx >= (tconf->resources-
> > >count_crtcs - 1)) ||
> > > +                                 ((i < (crtc_count - 1)) && (abs(crtcs[i +
> > 1].crtc_idx - crtc->crtc_idx) <= 1)))) ||
> > > +                               ((i > 0) && (crtc[i - 1].mode.hdisplay >
> > MAX_HDISPLAY_PER_CRTC) &&
> > > +                                (abs(crtc->crtc_idx - crtcs[i - 1].crtc_idx) <=
> > 1))) {
> > > +                                   igt_info("Combo: %s is not possible
> > with selected mode(s).\n", test_name);
> > > +                                   goto out;
> > > +                           }
> > >                     }
> > > -           }
> > >
> > > -           igt_dynamic_f("%s", test_name)
> > >                     test_crtc_config(tconf, crtcs, crtc_count);
> > > -   }
> > > +           } else
> > > +                   igt_skip("Valid connector-crtc combination not
> > found\n");
> > >
> > >  out:
> > >     cleanup_crtcs(crtcs, crtc_count);
> > > --
> > > 2.34.1
> > >
