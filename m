Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39DD10E33A
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Jan 2023 10:18:21 +0000 (UTC)
Date: Mon, 23 Jan 2023 12:15:12 +0200
From: Petri Latvala <petri.latvala@intel.com>
To: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
Message-ID: <Y85eMPbBB7qQEziU@platvala-desk.ger.corp.intel.com>
References: <20230112105702.19502-1-dnyaneshwar.bhadane@intel.com>
 <20230116143219.35162-1-dnyaneshwar.bhadane@intel.com>
 <Y8ViU7I39gikmC1R@platvala-desk.ger.corp.intel.com>
 <IA1PR11MB62663403CD7637504A3C84D2E2C89@IA1PR11MB6266.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <IA1PR11MB62663403CD7637504A3C84D2E2C89@IA1PR11MB6266.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH] [i-g-t,
 v2] tests/kms_cursor_crc: skip pipe on invalid connector in cursor
 size test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Kurmi,
 Suresh Kumar" <suresh.kumar.kurmi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jan 23, 2023 at 11:58:44AM +0200, Bhadane, Dnyaneshwar wrote:
> Hello Petri,
> > -----Original Message-----
> > From: Latvala, Petri <petri.latvala@intel.com>
> > Sent: Monday, January 16, 2023 8:12 PM
> > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Kurmi, Suresh Kumar
> > <suresh.kumar.kurmi@intel.com>; Heikkila, Juha-pekka <juha-
> > pekka.heikkila@intel.com>
> > Subject: Re: [igt-dev] [PATCH] [i-g-t, v2] tests/kms_cursor_crc: skip pipe on
> > invalid connector in cursor size test
> > 
> > On Mon, Jan 16, 2023 at 08:02:19PM +0530, Dnyaneshwar Bhadane wrote:
> > > Only the valid pipe connector combination reach to the igt commit.
> > > Cursor max-size test will not affect existing flow as only skip for
> > > invalid connector.
> > > For cursor-dpms and cursor-suspend not require to check
> > > require_cursor_size becuase the cursor height and width used from drm
> > capablities.
> > >
> > > --v2
> > > - Used for_each_pipe_with_single_output() to iterate for valid pipe and
> > output.
> > >
> > > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > ---
> > >  tests/kms_cursor_crc.c | 16 +++-------------
> > >  1 file changed, 3 insertions(+), 13 deletions(-)
> > >
> > > diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c index
> > > d5a4b30b..a4afcff3 100644
> > > --- a/tests/kms_cursor_crc.c
> > > +++ b/tests/kms_cursor_crc.c
> > > @@ -749,7 +749,7 @@ static void run_size_tests(data_t *data, int w, int h)
> > >  				}
> > >  			}
> > >
> > > -			for_each_pipe(&data->display, pipe) {
> > > +			for_each_pipe_with_single_output(&data->display,
> > pipe,
> > > +data->output) {
> > >  				data->pipe = pipe;
> > >
> > >  				if (require_cursor_size(data, w, h)) { @@ -
> > 850,15 +850,10 @@
> > > static void run_tests_on_pipe(data_t *data)
> > >
> > >  	igt_describe("Check random placement of a cursor with DPMS.");
> > >  	igt_subtest_with_dynamic("cursor-dpms") {
> > > -		for_each_pipe(&data->display, pipe) {
> > > +		for_each_pipe_with_single_output(&data->display, pipe,
> > > +data->output) {
> > >  			data->pipe = pipe;
> > >  			data->flags = TEST_DPMS;
> > >
> > > -			if (require_cursor_size(data, data->cursor_max_w,
> > data->cursor_max_h)) {
> > > -				igt_debug("Cursor size %dx%d not supported by
> > driver\n",
> > > -					  data->cursor_max_w, data-
> > >cursor_max_h);
> > > -				continue;
> > > -			}
> > >
> > >  			igt_dynamic_f("pipe-%s-%s",
> > >  				      kmstest_pipe_name(pipe),
> > > @@ -871,15 +866,10 @@ static void run_tests_on_pipe(data_t *data)
> > >
> > >  	igt_describe("Check random placement of a cursor with suspend.");
> > >  	igt_subtest_with_dynamic("cursor-suspend") {
> > > -		for_each_pipe(&data->display, pipe) {
> > > +		for_each_pipe_with_single_output(&data->display, pipe,
> > > +data->output) {
> > >  			data->pipe = pipe;
> > >  			data->flags = TEST_SUSPEND;
> > >
> > > -			if (require_cursor_size(data, data->cursor_max_w,
> > data->cursor_max_h)) {
> > > -				igt_debug("Cursor size %dx%d not supported by
> > driver\n",
> > > -					  data->cursor_max_w, data-
> > >cursor_max_h);
> > > -				continue;
> > > -			}
> > 
> > 
> > These will effectively overwrite whatever data->output was set to in the fixture
> > in run_tests_on_pipe. But, how did that fixture ever work?
> > That fixture leaves 'pipe' variable uninitialized and then finds an output for that
> > pipe?
> > 
> The pipe variable is default taking value 0 as it enum.

It's accidentally 0, because CI builds with the default of
buildtype=debugoptimized. It's an automatic variable, not a global.


-- 
Petri Latvala
