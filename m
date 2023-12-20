Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF61310E312
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Dec 2023 07:13:59 +0000 (UTC)
Date: Wed, 20 Dec 2023 08:13:54 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_create: Use separate VMs per process
Message-ID: <20231220071354.scpr62ujthylvt7s@zkempczy-mobl2>
References: <20231218145051.1869466-1-jonathan.cavitt@intel.com>
 <20231219044845.cqzbiqf4bndxpva3@zkempczy-mobl2>
 <CH0PR11MB544423D6926CEF01FDB989CFE597A@CH0PR11MB5444.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH0PR11MB544423D6926CEF01FDB989CFE597A@CH0PR11MB5444.namprd11.prod.outlook.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 04:27:41PM +0100, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Kempczynski, Zbigniew <zbigniew.kempczynski@intel.com> 
> Sent: Monday, December 18, 2023 8:49 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.com>; Welty, Brian <brian.welty@intel.com>; kamil.konieczny@linux.intel.com; De Marchi, Lucas <lucas.demarchi@intel.com>; Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Subject: Re: [PATCH i-g-t] tests/xe_create: Use separate VMs per process
> > 
> > On Mon, Dec 18, 2023 at 06:50:51AM -0800, Jonathan Cavitt wrote:
> > > We currently exercise cross-user impact in xe_create by attempting to
> > > concurrently create a large number of exec queues on a single vm using
> > > forked child processes.  This is unrealistic, as multiple users are more
> > > likely to be using separate file descriptors for creating exec queues.
> > > 
> > > Update the test to reflect this use case.
> > 
> > As original version of the test reveals bug in KMD Brian suggested in offline
> > discussion we should keep current test behavior (but not executed in BAT
> > with MAXTIME tweaked to relatively large value). I mean we should have four
> > subtests - two with current behavior with increased maxtime not executed in
> > BAT + two with maxtime set to 5/6. I see ATSM passed with your change but
> > it is on the time limit boundary.
> 
> 
> I'm sorry.  I don't fully understand what change you're suggesting here.
> 
> It sounds like you want me to create a duplicate of the original test that
> increases MAXTIME to, say, 15, while also leaving an old version that
> leaves MAXTIME at 5.  That's doable, but it also sounds like you want
> to run the test with the low MAXTIME on BAT and not the test with
> the high MAXTIME.
> 
> Doesn't that defeat the purpose of creating a duplicate test, since
> we're not changing the test behavior on BAT and thus the issue would
> still get reported?  Or did you mean for those tests to be put the other
> way around?  Or are you referring to the test change in this patch when
> referring to the "two [tests] with maxtime set to 5/6"?  Or am I
> misunderstanding what the BAT tests are?
> 
> -Jonathan Cavitt

Don't duplicate, just diverge code logic adding flag passed to the function
(like MULTI_VM or sth.).

Then we would have:

	igt_subtest("create-execqueues-noleak")
		create_execqueues(xe, NOLEAK, MULTI_VM);

	igt_subtest("create-execqueues-leak")
		create_execqueues(xe, LEAK, MULTI_VM);

	igt_subtest("create-execqueues-noleak-single")
		create_execqueues(xe, NOLEAK, 0);

	igt_subtest("create-execqueues-leak-single")
		create_execqueues(xe, LEAK, 0);

So in BAT run stays test changed to be executed "quickly" on
multi-fd/vm. In full run we would have original (current) test
code with max_time increased (use variable altered to some big value
for single).

--
Zbigniew

> 
> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > Suggested-by: Brian Welty <brian.welty@intel.com>
> > > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > CC: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> > > CC: Lucas De Marchi <lucas.demarchi@intel.com>
> > > CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > CC: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> > > ---
> > >  tests/intel/xe_create.c | 17 +++++++++--------
> > >  1 file changed, 9 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
> > > index 0aa32c788a..22f9464161 100644
> > > --- a/tests/intel/xe_create.c
> > > +++ b/tests/intel/xe_create.c
> > > @@ -167,13 +167,9 @@ enum exec_queue_destroy {
> > >  static void create_execqueues(int fd, enum exec_queue_destroy ed)
> > >  {
> > >  	struct timespec tv = { };
> > > -	uint32_t num_engines, exec_queues_per_process, vm;
> > > +	uint32_t exec_queues_per_process;
> > >  	int nproc = sysconf(_SC_NPROCESSORS_ONLN), seconds;
> > >  
> > > -	fd = drm_reopen_driver(fd);
> > > -	num_engines = xe_number_engines(fd);
> > > -	vm = xe_vm_create(fd, 0, 0);
> > > -
> > >  	exec_queues_per_process = max_t(uint32_t, 1, MAXEXECQUEUES / nproc);
> > >  	igt_debug("nproc: %u, exec_queues per process: %u\n", nproc, exec_queues_per_process);
> > >  
> > > @@ -182,8 +178,13 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
> > >  	igt_fork(n, nproc) {
> > >  		struct drm_xe_engine *engine;
> > >  		uint32_t exec_queue, exec_queues[exec_queues_per_process];
> > > +		uint32_t num_engines, vm;
> > >  		int idx, err, i;
> > >  
> > > +		fd = drm_reopen_driver(fd);
> > > +		num_engines = xe_number_engines(fd);
> > > +		vm = xe_vm_create(fd, 0, 0);
> > > +
> > >  		srandom(n);
> > >  
> > >  		for (i = 0; i < exec_queues_per_process; i++) {
> > > @@ -206,12 +207,12 @@ static void create_execqueues(int fd, enum exec_queue_destroy ed)
> > >  				xe_exec_queue_destroy(fd, exec_queues[i]);
> > >  			}
> > >  		}
> > > +
> > > +		xe_vm_destroy(fd, vm);
> > > +		drm_close_driver(fd);
> > >  	}
> > >  	igt_waitchildren();
> > >  
> > > -	xe_vm_destroy(fd, vm);
> > > -	drm_close_driver(fd);
> > > -
> > >  	seconds = igt_seconds_elapsed(&tv);
> > >  	igt_assert_f(seconds < MAXTIME,
> > >  		     "Creating %d exec_queues tooks too long: %d [limit: %d]\n",
> > > -- 
> > > 2.25.1
> > > 
> > 
