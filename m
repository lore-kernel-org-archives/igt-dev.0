Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B117110E10D
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:57:06 +0000 (UTC)
Date: Wed, 5 Jul 2023 10:56:59 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <20230705105659.64b4ca0f@maurocar-mobl2>
In-Reply-To: <b197f870-0e9d-37b0-9b58-0d2f77325480@linux.intel.com>
References: <20230526064624.2886063-1-mauro.chehab@linux.intel.com>
 <20230526064624.2886063-3-mauro.chehab@linux.intel.com>
 <843966cc-f42a-5ec8-34d5-80cb832b8ee1@linux.intel.com>
 <f307f97a-506a-4897-46a7-52ce032aa8b6@linux.intel.com>
 <20230704145053.31c39a24@maurocar-mobl2>
 <b197f870-0e9d-37b0-9b58-0d2f77325480@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] testplan/meson.build: make it check
 for missing i915 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 4 Jul 2023 14:03:59 +0100
Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:

> On 04/07/2023 13:50, Mauro Carvalho Chehab wrote:
> > On Tue, 4 Jul 2023 13:41:14 +0100
> > Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
> >   
> >> On 04/07/2023 13:28, Tvrtko Ursulin wrote:  
> >>>
> >>> On 26/05/2023 07:46, Mauro Carvalho Chehab wrote:  
> >>>> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >>>>
> >>>> Now that i915 is fully documented, check it at build time.  
> >>>
> >>> This step seems to be slow as molasses and it also rebuilds the Xe test
> >>> plan when I touch an i915 test.  
> > 
> > This is fixable, but better to wait for Bhanu's patch series that will
> > be moving the Intel tests to a new directory (tests/intel/).
> >   
> >>>
> >>> What is the way to disable it all when configuring the build?  
> > 
> > Yes, you can disable it:
> > 
> > 	$ meson -Dtestplan=disabled build --reconfigure  
> 
> Works, thanks!
> 
> > We do want this enabled by default, as CI needs to check it and
> > reject patches that aren't updating tests documentation.
> > 
> > Our internal CI is already dependent on it for the Xe and KMS, and
> > the plan is to extend it to i915 as well, to get rid of lots of
> > hacks that currently maps tests with the tested features.  
> 
> As long as the build process is not smart enough to only check a single 
> modified test, FWIW disabled by default sounds better to me and CI can 
> easily enable it.

See, parsing the source code to produce documentation is really fast:

$ for i in tests/xe/xe_test_config.json tests/kms_test_config.json tests/i915/i915_test_config.json; do echo $i:; time ./scripts/igt_doc.py --config $i >/dev/null; echo; done

tests/xe/xe_test_config.json:

real	0m0.113s
user	0m0.090s
sys	0m0.022s

tests/kms_test_config.json:

real	0m0.132s
user	0m0.121s
sys	0m0.010s

tests/i915/i915_test_config.json:

real	0m0.271s
user	0m0.259s
sys	0m0.011s

Handling all documents and even producing a ReST output takes less than
500ms.

What takes time is to get a list of all IGT tests that are covered on
a test set (xe, kms or i915). The way IGT is conceived is that there's no 
single exec file or build output that lists all tests. One needs to run all
tests that matches a certain pattern, using --list option, in order to get 
a list of tests. This is what `igt_runner -L` does. The code I implemented
is faster than igt_runner, but it doesn't use multithread - as python is
currently problematic with multi-CPU multithread[1]. 

[1] https://www.turing.com/kb/python-multiprocessing-vs-multithreading

Perhaps one solution would be to change meson.build to produce a list
of tests per compiled file, by running the tests after their builds,
storing the results under the build dir. As meson/ninja is properly
parallelized, this should reduce the time to generate the testlists
that are used by the documentation tool to check if tests are documented.

I'll explore such solution, as we may end speeding up some CI runs
by having a build time generated "full" testlist.

> 
> >>> P.S. I also find the "now that i915 is fully documented" statement a bit
> >>> of a chuckle, since random two tests I happened to open haven't really
> >>> been documented - it rather looks to be a bit of a charade.  
> > 
> > Well, it is as good as what we had documented on IGT itself and on
> > some separate spreadsheets. If you find anything odd, please fix it.  
> 
> I happened to open i915_pm_rps yesterday and drm_fdinfo today. Majority 
> of documentation are just place holders to cheat the verification step. 

It was not meant to be that. Those were generated from different data
sources:

	- igt_describe(), igt_describe_f(), and IGT_TEST_DESCRIPTION();
	- Grafana's feature mapping logic used internally;
	- efforts from validation teams to document existing tests.

Now, for sure the efforts to write documentation after the facts are
hard.  

> Similarly I don't think it will be "enforceable" during code review and 
> such silliness will just land. Shrug. sometimes even best intentions 
> don't lead where you'd expect them to.

The main goal of enforcing it is to ensure that developers and reviewers
will be doing it right for new tests and gradually fix issues at the
existing ones.

> 
> >>> I wouldn't care really apart from it significantly slowing down the
> >>> development workflow.  
> >>
> >> # time ninja
> >> [1/448] Generating lib/version.h with a custom command
> >> fatal: not a git repository (or any of the parent directories): .git
> >> [6/6] Generating docs/testplan/i915_tests.rst with a custom command
> >>
> >> real    0m24.363s
> >> user    0m6.530s
> >> sys     0m20.968s
> >>
> >> 24 seconds.. I just changed one i915 test. :(  
> > 
> > What it takes time is not building the docs, but to run all tests with
> > "--list" parameter, in order to double-check if every test has some
> > documentation.  
> 
> I don't really care what takes time, just that it was unbearable. But 
> now you gave me a workaround so that's good enough for me.
> 
> Regards,
> 
> Tvrtko
