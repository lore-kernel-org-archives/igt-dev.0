Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 1 Nov 2022 14:53:33 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20221101145333.5960e6e7@maurocar-mobl2>
In-Reply-To: <Y2EcEnAzkt1Qn341@platvala-desk.ger.corp.intel.com>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-5-isabbasso@riseup.net>
 <Yyl3UXvLd3Jyr9uP@platvala-desk.ger.corp.intel.com>
 <20221101135425.3ee12c9c@maurocar-mobl2>
 <Y2EcEnAzkt1Qn341@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/4] tests: DRM selftests: switch to
 KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: skhan@linuxfoundation.org, daniel@ffwll.ch, kunit-dev@googlegroups.com,
 magalilemes00@gmail.com, maira.canal@usp.br, dlatypov@google.com,
 n@nfraprado.net, brendanhiggins@google.com, linux-kernel@vger.kernel.org,
 leandro.ribeiro@collabora.com, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 tales.aparecida@gmail.com, davidgow@google.com,
 Isabella Basso <isabbasso@riseup.net>, andrealmeid@riseup.net,
 twoerner@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 1 Nov 2022 15:16:02 +0200
Petri Latvala <petri.latvala@intel.com> wrote:

> On Tue, Nov 01, 2022 at 01:54:25PM +0100, Mauro Carvalho Chehab wrote:
> > On Tue, 20 Sep 2022 11:18:25 +0300
> > Petri Latvala <petri.latvala@intel.com> wrote:
> > 
> > > On Sun, Aug 28, 2022 at 09:09:20PM -0300, Isabella Basso wrote:
> > > > As the DRM selftests are now using KUnit [1], update IGT tests as well.
> > > > 
> > > > [1] - https://lore.kernel.org/all/20220708203052.236290-1-maira.canal@usp.br/
> > > > 
> > > > Signed-off-by: Isabella Basso <isabbasso@riseup.net>
> > > > ---
> > > >  tests/drm_buddy.c    |  7 ++++---
> > > >  tests/drm_mm.c       |  7 ++++---
> > > >  tests/kms_selftest.c | 12 +++++++++---
> > > >  3 files changed, 17 insertions(+), 9 deletions(-)
> > > > 
> > > > diff --git a/tests/drm_buddy.c b/tests/drm_buddy.c
> > > > index 06876e0c..74c06dce 100644
> > > > --- a/tests/drm_buddy.c
> > > > +++ b/tests/drm_buddy.c
> > > > @@ -6,9 +6,10 @@
> > > >  #include "igt.h"
> > > >  #include "igt_kmod.h"
> > > >  
> > > > -IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct drm_buddy)");
> > > > +IGT_TEST_DESCRIPTION("Basic sanity check of DRM's buddy allocator (struct \
> > > > +		      drm_buddy) using KUnit");
> > > >  
> > > > -igt_main
> > > > +igt_simple_main
> > > >  {
> > > > -	igt_kselftests("test-drm_buddy", NULL, NULL, NULL);
> > > > +	igt_kunit("drm_buddy_test", NULL);
> > > >  }  
> > > 
> > > With kselftests we had the ability to only run a specified set of
> > > tests, and with or without selection, we had sub-results for each
> > > through dynamic subtests. Does kunit have that possibility? I mean I
> > > know kunit itself does but what about igt_kunit()?
> > 
> > I don't think so. I created a KUnit with the mock selftests:
> > 
> > 	$ modinfo test-i915-mock
> > 	filename:       /lib/modules/6.1.0-rc2-drm-b1cab854a639+/kernel/drivers/gpu/drm/i915/test-i915-mock.ko
> > 	import_ns:      I915_SELFTEST
> > 	license:        GPL v2
> > 	depends:        i915
> > 	retpoline:      Y
> > 	intree:         Y
> > 	name:           test_i915_mock
> > 	vermagic:       6.1.0-rc2-drm-b1cab854a639+ SMP preempt mod_unload 
> > 
> > There's no module parameters. Just loading it makes all tests
> > there to run.
> 
> Ah, the selection is in kunit.ko itself. kunit.filter_glob, set from
> kunit.py with
> 
> positional arguments:
>   filter_glob           Filter which KUnit test suites/tests run at boot-time, e.g. list* or list*.*del_test
> \

Gah, permissions are 0:

	module_param_named(filter_glob, filter_glob_param, charp, 0);

You can't even see what filters were set via sysfs:

	$ ls /sys/module/kunit/parameters/
	stats_enabled

So, once set, there's no way to change it.

I wonder why this isn't 0x644.

It sounds that, if we want to control it at runtime, we'll need to 
build with kunit as module, and unload/reload it every time if/when
we want to run IGT with a different filtering ruleset.

Regards,
Mauro
