Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936286E04B
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2020 13:59:10 +0000 (UTC)
Date: Wed, 12 Feb 2020 15:59:06 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200212135906.4xlvx4y3f4s7wsmi@ahiler-desk1.fi.intel.com>
References: <20200212132123.108506-1-arkadiusz.hiler@intel.com>
 <20200212132123.108506-5-arkadiusz.hiler@intel.com>
 <20200212133737.GP25209@platvala-desk.ger.corp.intel.com>
 <20200212134204.GQ25209@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200212134204.GQ25209@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/9] runner/runner_tests: Extract helper
 for inspecting test result
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Feb 12, 2020 at 03:42:04PM +0200, Petri Latvala wrote:
> On Wed, Feb 12, 2020 at 03:37:37PM +0200, Petri Latvala wrote:
> > On Wed, Feb 12, 2020 at 03:21:18PM +0200, Arkadiusz Hiler wrote:
> > > to make this bit of code more readable and to reuse it in the following patch
> > > 
> > > Signed-off-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> > > ---
> > >  runner/runner_tests.c | 30 +++++++++++++++++-------------
> > >  1 file changed, 17 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/runner/runner_tests.c b/runner/runner_tests.c
> > > index ed30b3f9..dd590f33 100644
> > > --- a/runner/runner_tests.c
> > > +++ b/runner/runner_tests.c
> > > @@ -32,6 +32,16 @@ static const char testdatadir[] = TESTDATA_DIRECTORY;
> > >  /* The total number of test binaries in runner/testdata/ */
> > >  #define NUM_TESTDATA_BINARIES 4
> > >  
> > > +static const char *igt_get_result(struct json_object *tests, const char* testname)
> > > +{
> > > +	struct json_object *obj;
> > > +
> > > +	igt_assert(json_object_object_get_ex(tests, testname, &obj));
> > > +	igt_assert(json_object_object_get_ex(obj, "result", &obj));
> > > +
> > > +	return json_object_get_string(obj);
> > > +}
> > > +
> > >  static void igt_assert_eqstr(const char *one, const char *two)
> > >  {
> > >  	if (one == NULL && two == NULL)
> > > @@ -1432,7 +1442,7 @@ igt_main
> > >  
> > >  		igt_subtest("dynamic-subtests-in-testlist") {
> > >  			struct execute_state state;
> > > -			struct json_object *results, *obj;
> > > +			struct json_object *results, *tests;
> > >  			const char *argv[] = { "runner",
> > >  					       "--test-list", filename,
> > >  					       testdatadir,
> > > @@ -1453,16 +1463,13 @@ igt_main
> > >  			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
> > >  				     "Results parsing failed\n");
> > >  
> > > -			obj = results;
> > > -			igt_assert(json_object_object_get_ex(obj, "tests", &obj));
> > > +			igt_assert(json_object_object_get_ex(results, "tests", &tests));
> > >  
> > >  			/* Check that the dynamic subtest we didn't request is not reported */
> > > -			igt_assert(!json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@failing", NULL));
> > > +			igt_assert_no_result_for(tests, "igt@dynamic@dynamic-subtest@failing");
> > 
> > 
> > Where is igt_assert_no_result_for defined? *blind*
> 
> Found it hiding in the next patch.

Fixed in:

https://gitlab.freedesktop.org/ivyl/igt/commits/igt_abort
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
