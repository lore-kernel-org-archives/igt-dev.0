Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1941A10E35D
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 14:22:25 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 06 Jun 2023 16:22:21 +0200
Message-ID: <2884858.e9J7NaK4W3@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230606155727.032e0fa3@maurocar-mobl2>
References: <20230605104716.5678-1-dominik.karol.piatkowski@intel.com>
 <4686292.rnE6jSC6OK@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230606155727.032e0fa3@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t 6/8] lib/igt_kmod: place KUnit tests on
 a subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 6 June 2023 15:57:27 CEST Mauro Carvalho Chehab wrote:
> On Tue, 06 Jun 2023 12:03:04 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> 
> > > > > > > +	igt_subtest_with_dynamic("all-tests")      
> > > > > > 
> > > > > > Why can't we use module_name as subtest name?    
> > > > > 
> > > > > We can, but this preserves the old behavior. So, the existing   
> > documentation
> > > > > won't break.    
> > > > 
> > > > Where is this old behavior documented?  In the current code I can't find   
> > any 
> > > > occurrence of "test-all" other than inside igt_kmod.c:igt_ksleftest(), not 
> > > > documented in any way.
> > > > 
> > > > Wasn't the old behavior a result of a limitation rather than a feature?  
> > > 
> > > Take a look at igt_kselftests():
> > > 
> > >         igt_subtest_with_dynamic(filter ?: "all-tests") {
> > >                 igt_list_for_each_entry_safe(tl, tn, &tests, link) {
> > >                         unsigned long taints;
> > > 
> > >                         igt_dynamic_f("%s", unfilter(filter, tl->name))
> > >                                 igt_kselftest_execute(&tst, tl, options,   
> > result);
> > >                         free(tl);
> > > 
> > > The default when "filter" is not used is "all-tests".  
> > 
> > Yes, I did look into igt_kselftest() and did notice the use of "all-tests", 
> > but for me that's not a documentation of an expected behavior, only a not 
> > quite fortunate implementation detail, forced by a mix of IGT contraints on 
> > one hand and implementation specifics of kernel side of i915 selftests on the 
> > other.
> 
> No, it is not just that. The tests actually announce that at runtime.
> So, if you run the test with --list, you'll see:
> 
> 	$ ./build/tests/drm_mm --list-subtests
> 	all-tests
> 
> And this is what it is used to check for testplan documentation.
> 
> > When you call an IGT test with a subtest name specified then only that subtest 
> > is executed, no matter if that's a selftest or a userspace test.
> > 
> > When you call a userspace IGT test with no subtest name (pattern) specified 
> > then all subtests are executed and their names displayed.  But when you do the 
> > same for an IGT selftest then all selftests are executed as one subtest named 
> > "all-tests".  Do you think that's intentional, not a result of some 
> > constraints which no longer apply for kunit tests?  Why do you prefer to keep 
> > the old inconsistent behavior instead of implementing IGT kunit tests to 
> > behave consistently with userspace IGT tests?
> 
> We can use whatever other name, provided that the output of
> --list-subtests will be identical to the dynamic subtest. If not,
> build will fail when checking for documentation inconsistencies. 

AFAICU, that checking process compares subtest names found in a documentation, 
here the source code, as pointed by you in one of your previouse answers as 
the source of the documentation, against --list output.  But that sounds 
weird.  What a sophisticated code parser must be used to resolve subtest names 
potentially provided via expressions?  Another compiler?
Or is there another source of documentation, which I already asked you for a 
reference to, and you didn't clearly answered yet, used by the build process 
for that checking?

Thanks,
Janusz
 
> 
> Regards,
> Mauro
> 





