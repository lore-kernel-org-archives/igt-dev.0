Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BD310E17D
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 12:13:19 +0000 (UTC)
Date: Fri, 15 Sep 2023 14:13:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Message-ID: <20230915141315.1a72c2e2@maurocar-mobl2>
In-Reply-To: <2168658.Icojqenx9y@jkrzyszt-mobl2.ger.corp.intel.com>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230911105251.220d90ed@maurocar-mobl2>
 <cc5a692b-62cc-a31b-44c9-ba8545ec0cb2@linux.intel.com>
 <2168658.Icojqenx9y@jkrzyszt-mobl2.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 05/17] lib/kunit: Fix
 illegal igt_fail() calls inside subtest body
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

On Fri, 15 Sep 2023 12:08:50 +0200
Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:

> Hi Mauro,
> 
> On Friday, 15 September 2023 11:58:36 CEST Mauro Carvalho Chehab wrote:
> > Hi Janusz,
> > 
> > 
> > On 9/11/23 10:52, Mauro Carvalho Chehab wrote:  
> > > On Fri,  8 Sep 2023 14:32:39 +0200
> > > Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> > >   
> > >   void igt_kunit(const char *module_name, const char *name, const char *opts)
> > >   {
> > > +	struct igt_ktest tst;
> > > +
> > > +	if (igt_ktest_init(&tst, module_name) != 0)
> > > +		return;
> > > Shouldn't it be calling igt_skip() here too?  
> > 
> > Maybe due to that, but running:
> > 
> >      $ cd 
> > /lib/modules/6.5.0-rc7-xe-public-4a9681392cec+/kernel/drivers/gpu/drm/xe/tests
> >      $ sudo mv xe_bo_test.ko xe_blocked_bo_test.ko
> > 
> >      sudo ./build/tests/xe_live_ktest
> >      IGT-Version: 1.28-g3d29cbf02 (x86_64) (Linux: 
> > 6.5.0-rc7-xe-public-4a9681392cec+ x86_64)
> >      Starting subtest: bo
> > 
> >      <IGT hangs forever waiting for module load to complete>
> > 
> > 
> > It seems that something at KUnit modprobe logic require fixes.  
> 
> Please test with 17/17 and 15/17 reverted.

With both reverted, it worked.

Regards,
Mauro
