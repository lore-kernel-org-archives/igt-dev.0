Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B1510E226
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jun 2023 07:58:39 +0000 (UTC)
Date: Wed, 14 Jun 2023 09:58:34 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230614095834.0d0c8c59@maurocar-mobl2>
In-Reply-To: <13715101.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230613072726.4164-1-dominik.karol.piatkowski@intel.com>
 <843329842.0ifERbkFSE@jkrzyszt-mobl2.ger.corp.intel.com>
 <20230613153400.52ddf090@maurocar-mobl2>
 <13715101.RDIVbhacDa@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 10/10] KUnit: replace abort with
 graceful skip
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

On Tue, 13 Jun 2023 16:25:01 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> > No. Since 2022 - specifically, since those commits:
> > 
> > 	- 932da861956a ("drm: selftest: convert drm_buddy selftest to KUnit")
> > 	- fc8d29e298cf ("drm: selftest: convert drm_mm selftest to KUnit")
> > 
> > those tests don't work anymore, as upstream removed support for selftest,
> > in favor of KUnit. So, those tests currently do nothing.  
> 
> In my opinion -- no, those tests currently skip, which is different from doing 
> nothing.
> 
> > 
> > We are changing because those tests are currently broken on IGT.   
> 
> In my opinion -- no, they are not broken, they are outdated.

IGT tests are broken, as IGT is not able anymore to execute drm_buddy and
drm_mm unit tests. This series fix it.

> 
> > That
> > is the reason why we need KUnit support for such tests.
> >   
> > > CI expects that behavior, users 
> > > are used to it.  We shouldn't change that only because we switch from an old 
> > > underlying kernel selftest format to a new shiny one, I believe, unless we are 
> > > able to prove that there was something wrong with that former approach, or we 
> > > can explain why it no longer fits into the kunit variant.  
> > 
> > Yes, there's something wrong with the former approach:   
> 
> Are you saying that error handling in igt_ksleftest() is broken?  In my 
> opinion, i915 selftests successfully executing on CI now and again, as well as 
> the outdated DRM selftests successfully skipping, prove something different.

No, I'm saying that drm core tests are broken on IGT, because drm core doesn't
support the legacy selftest infrastructure since 2022, and IGT is currently
missing kUnit support.

On other words, IGT won't run such tests *even* if the Kernel is build with
support for DRM core tests.

> I believe that igt_kunit() that follows as closely as possible the pattern of 
> how igt_kselftest() is handling unmet conditions and errors, with full respect 
> to real differences between kunit and i915-like selftests, would be the best 
> solution.

I'm not saying anthing different, but KUnit and selftest executions are
different:

- with selftest, the module loads asynchronously. After the module is
  loaded with success, the probe() method will be called and the tests
  will run.

  It means that it is possible to first load the driver and then run
  igt dynamic subtest logic, parsing the results from dmesg.

- with KUnit, the unit tests will run synchronously at modprobe time.
  So, when modprobe() finishes execution, all KUnit tests were already
  executed - and if the Kernel crashes on a KUnit test - results will be
  lost.
  
  It means that all steps needed to execute KUnit should be handled
  before modprobing, including starting a thread to capture dmesg
  results during modprobe time. So, igt dynamic subtests should be created 
  before calling modprobe() function.

due to such difference, igt_subtest_with_dynamic() should be called
before modprobe(), and, if something goes wrong on that time - for instance
if the module doesn't exist and returns EENOENT - IGT needs to use
igt_skip() or igt_fail().

Regards,
Mauro
