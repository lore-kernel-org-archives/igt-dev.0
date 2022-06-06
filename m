Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87EA10ED8A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jun 2022 07:55:24 +0000 (UTC)
Date: Mon, 6 Jun 2022 10:51:07 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Message-ID: <Yp2x61wwuFbKE5aZ@platvala-desk.ger.corp.intel.com>
References: <20220520011226.24017-1-nidhi1.gupta@intel.com>
 <20220520011226.24017-2-nidhi1.gupta@intel.com>
 <YocvKicRCAmZY0aR@platvala-desk.ger.corp.intel.com>
 <PH7PR11MB60063398DB84553A1CD21ADDC5A29@PH7PR11MB6006.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR11MB60063398DB84553A1CD21ADDC5A29@PH7PR11MB6006.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests to
 dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 06, 2022 at 08:36:08AM +0300, Gupta, Nidhi1 wrote:
> Hi Petri,
> 
> Thanks for the review.
> 
> We are trying to convert all the tests in IGT into dynamic tests, for better reporting and get more data just from the name of the subtest to ease the debugging process.
> 
> Trying to do the same with this test, this test will be executed on every pipe with valid output.

Doing that for a test that doesn't even care about pipes is not
achieving anything.


-- 
Petri Latvala



> 
> 
> 
> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Friday, May 20, 2022 11:33 AM
> To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_invalid_mode : Convert tests to dynamic
> 
> On Fri, May 20, 2022 at 06:42:25AM +0530, Nidhi Gupta wrote:
> > Modified kms_invalid_mode to include dynamic test cases for better
> > reporting of the results.
> >
> > Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> > ---
> >  tests/kms_invalid_mode.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index
> > bb92a94e..bb524037 100644
> > --- a/tests/kms_invalid_mode.c
> > +++ b/tests/kms_invalid_mode.c
> > @@ -296,8 +296,11 @@ static const struct {
> >
> >  static data_t data;
> >
> > -igt_main
> > -{
> > +igt_main {
> > +
> > +igt_output_t *output;
> > +enum pipe pipe;
> > +
> >       igt_fixture {
> >               data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> >
> > @@ -312,9 +315,15 @@ igt_main
> >       }
> >
> >       for (int i = 0; i < ARRAY_SIZE(subtests); i++) {
> > -             igt_subtest(subtests[i].name) {
> > -                     data.adjust_mode = subtests[i].adjust_mode;
> > -                     test(&data);
> > +             igt_subtest_with_dynamic(subtests[i].name) {
> > +                     for_each_pipe(&data.display, pipe) {
> > +                             for_each_valid_output_on_pipe(&data.display, pipe, output) {
> > +                                     igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> > +                                             data.adjust_mode = subtests[i].adjust_mode;
> > +                                             test(&data);
> > +                                     }
> > +                             }
> 
> What is the goal of this change? All this does is repeat the _same_ operations n number of times.
> 
> 
> --
> Petri Latvala
