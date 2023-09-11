Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Mon, 11 Sep 2023 11:28:32 +0200
Message-ID: <2157156.irdbgypaU6@jkrzyszt-mobl2.ger.corp.intel.com>
In-Reply-To: <20230911105251.220d90ed@maurocar-mobl2>
References: <20230908123233.137134-19-janusz.krzysztofik@linux.intel.com>
 <20230908123233.137134-24-janusz.krzysztofik@linux.intel.com>
 <20230911105251.220d90ed@maurocar-mobl2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 05/17] lib/kunit: Fix
 illegal igt_fail() calls inside subtest body
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
Cc: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, Isabella Basso <isabbasso@riseup.net>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Mauro,

Thanks for review.

On Monday, 11 September 2023 10:52:51 CEST Mauro Carvalho Chehab wrote:
> On Fri,  8 Sep 2023 14:32:39 +0200
> Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com> wrote:
> 
> > In a body of a subtest with dynamic sub-subtests, it is illegal to call
> > igt_fail() and its variants from outside of a dynamic sub-subtest body.
> > On the other hand, it is perfectly legal to call either igt_skip() and
> > friends or __igt_abort() or its variant from there.
> > 
> > In the current implementation of igt_kunit(), there are several places
> > where igt_fail() is called despite being illegal.  Moreover, it is called
> > with IGT_EXIT_ABORT as an argument with no good reason for using such
> > aggressive method that forces CI to trigger system reboot (in most cases
> > igt_runner can decide if abort is required).
> > 
> > Follow igt_kselftests() pattern more closely, where similar setup and
> > cleanup operations are performed but their potential errors are processed
> > in a more friendly way.  Move common cleanup and their corresponding setup
> > steps out of the subtest body.  Place the latter as requirements in a
> > preceding igt_fixture section.  Replace remaining illegal igt_fail() calls
> > with more friendly skips.  Let igt_runner decide if abort is needed.
> > 
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > ---
> >  lib/igt_kmod.c | 75 +++++++++++++++-----------------------------------
> >  1 file changed, 22 insertions(+), 53 deletions(-)
> > 
> > diff --git a/lib/igt_kmod.c b/lib/igt_kmod.c
> > index 1d1cd51170..78b8eb8f53 100644
> > --- a/lib/igt_kmod.c
> > +++ b/lib/igt_kmod.c
...
> > @@ -825,24 +793,21 @@ static void __igt_kunit(const char *module_name, const char *opts)
> >  		}
> >  	}
> >  
> > -unload:
> > -	igt_ktest_end(&tst);
> > -
> > -	igt_ktest_fini(&tst);
> > -
> > -	igt_skip_on_f(skip, "Skipping test, as probing KUnit module failed\n");
> > -
> > -	if (fail)
> > -		igt_fail(IGT_EXIT_ABORT);
> > -
> >  	ret = ktap_parser_stop();
> >  
> > -	if (ret != 0)
> > -		igt_fail(IGT_EXIT_ABORT);
> > +	igt_skip_on_f(ret, "KTAP parser failed\n");
> >  }
> >  
> >  void igt_kunit(const char *module_name, const char *name, const char *opts)
> >  {
> > +	struct igt_ktest tst;
> > +
> > +	if (igt_ktest_init(&tst, module_name) != 0)
> > +		return;
> 
> Shouldn't it be calling igt_skip() here too?

Maybe yes.  I've chosen to follow the algorithm used in igt_kselftest.  There 
was an igt_skip() variant there initially but in 2017 that was converted to 
the current return only by Peter with IGT commit 9f92893b11e8 ("lib/igt_kmod: 
Don't call igt_assert or igt_require without a fixture").  However, 
justification for dropping igt_require() instead of calling it from an 
igt_fixture section may not apply to kunit modules:

"If kmod_module_new_from_name fails, ... return normally from igt_kselftest, 
matching behaviour when the module loading is successful but it doesn't 
contain selftests."

While i915 could be built with no selftests included, a kunit module without 
any tests doesn't make sense, then silent return may be not what we need.

Thanks,
Janusz

> 
> > +
> > +	igt_fixture
> > +		igt_require(igt_ktest_begin(&tst) == 0);
> > +
> >  	/*
> >  	 * We need to use igt_subtest here, as otherwise it may crash with:
> >  	 *  skipping is allowed only in fixtures, subtests or igt_simple_main
> > @@ -854,7 +819,11 @@ void igt_kunit(const char *module_name, const char *name, const char *opts)
> >  		name = module_name;
> >  
> >  	igt_subtest_with_dynamic(name)
> > -		__igt_kunit(module_name, opts);
> > +		__igt_kunit(&tst, opts);
> > +
> > +	igt_ktest_end(&tst);
> > +
> > +	igt_ktest_fini(&tst);
> >  }
> >  
> >  static int open_parameters(const char *module_name)
> 





