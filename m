Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E7610E623
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Sep 2022 11:43:24 +0000 (UTC)
Date: Tue, 6 Sep 2022 14:42:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Message-ID: <YxcyKr3bBnDDVXrk@platvala-desk.ger.corp.intel.com>
References: <20220905125320.3475254-1-janga.rahul.kumar@intel.com>
 <20220905125320.3475254-2-janga.rahul.kumar@intel.com>
 <YxX/ce428cCpzUmR@platvala-desk.ger.corp.intel.com>
 <MW3PR11MB4748C7A83CFC224F8A578A78AE7F9@MW3PR11MB4748.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MW3PR11MB4748C7A83CFC224F8A578A78AE7F9@MW3PR11MB4748.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Introduce
 igt_subtest_group_named
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 05, 2022 at 09:07:45PM +0300, Kumar, Janga Rahul wrote:
> 
> 
> > -----Original Message-----
> > From: Latvala, Petri <petri.latvala@intel.com>
> > Sent: 05 September 2022 19:24
> > To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>
> > Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Introduce
> > igt_subtest_group_named
> >
> > On Mon, Sep 05, 2022 at 06:23:20PM +0530, janga.rahul.kumar@intel.com
> > wrote:
> > > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > >
> > > igt_subtest_group_named will check for requirements only when the
> > > subtest inside igt_subtest_group_named are executed.
> > >
> > > This will help in avoiding the logging related to requirements of
> > > subgroup tests when tests outside the subgroup are executed
> > > individually.
> > >
> > > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > How is this supposed to be used? Does one need to list all subtests a
> > subtest_group is going to have one by one? That's prone to errors and a
> > maintenance nightmare.
> [Janga Rahul Kumar] It is an alternative to igt_subtest_group whose main purpose is to group the common subtests setup/requirements check together and skip the subtests in the group if the requirements mentioned in common setup is not met. Existing issue with igt_subtest_group, it will execute the setup part(igt_fixture) independent of whether the subtests under it are executed or not. igt_subtest_group_named executes the setup part only when the subtests inside them are ran which can help in avoiding the unnecessary logging in setup part and also save time wasted in executing the setup part.
> 
> Usage :
> igt_subtest_group_named(test*) {
>         igt_fixture() { }
>         igt_subtest(test1) { }
>         igt_subtest(test2) {}
> }


Discussed this offline, recapping here:

1)

Special care needs to be applied so that --run-subtest arguments such as

"*1"
"*,!test1,!test2"

behave correctly. That also needs to be unit-tested.

2)

With named subtest groups available the burden of maintenance and
review grows significantly. Every review of a patch series that adds
subtests to existing tests would now need to check whether those new
subtests are in a named group. That burden cannot even be limited by
having limited use of the functionality.

Having to repeat subtest names in a place that's not necessarily even
nearby in the code is inviting human errors into the mix.



With all the effort addressing that would require, I feel the gains
from this functionality is not big enough. The time taken by
"redundant" fixtures is not a lot by any means today. Misleading logs
are a problem, sure, but the level of the hinderance of those can be
discussed endlessly, it's very subjective. The problem of misleading
logs has a "workaround" in the form of educating the human readers of
said logs.


-- 
Petri Latvala



> >
> > If the purpose is just to get logging easier to read, a better solution is in my
> > TODO with the runner communications rework that puts the result reason
> > alongside the result text itself.
> >
> >
> > --
> > Petri Latvala
> >
> >
> >
> > > ---
> > >  lib/igt_core.c | 23 +++++++++++++++++++++++
> > >  lib/igt_core.h | 20 ++++++++++++++++++++
> > >  2 files changed, 43 insertions(+)
> > >
> > > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > > index e7425326..7d84e145 100644
> > > --- a/lib/igt_core.c
> > > +++ b/lib/igt_core.c
> > > @@ -658,6 +658,29 @@ void __igt_fixture_end(void)
> > >     siglongjmp(igt_subtest_jmpbuf, 1);
> > >  }
> > >
> > > +bool __igt_check_subtest_list(const char *subtest_name, ...)
> > > +{
> > > +   va_list valist;
> > > +   bool match = false;
> > > +   char *next_subtest_name = (char *)subtest_name;
> > > +
> > > +   if (!run_single_subtest)
> > > +           return true;
> > > +
> > > +   va_start(valist, *subtest_name);
> > > +
> > > +   while (next_subtest_name != NULL) {
> > > +           if (uwildmat(run_single_subtest, next_subtest_name) != 0)
> > > +                   match = true;
> > > +
> > > +           next_subtest_name = va_arg(valist, char *);
> > > +   }
> > > +
> > > +   va_end(valist);
> > > +
> > > +   return match;
> > > +}
> > > +
> > >  /*
> > >   * If the test takes out the machine, in addition to the usual dmesg
> > >   * spam, the kernel may also emit a "death rattle" -- extra debug
> > > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > > index aa98e8ed..774e1893 100644
> > > --- a/lib/igt_core.h
> > > +++ b/lib/igt_core.h
> > > @@ -138,6 +138,7 @@ struct _GKeyFile *igt_load_igtrc(void);
> > >  bool __igt_fixture(void);
> > >  void __igt_fixture_complete(void);
> > >  __noreturn void __igt_fixture_end(void);
> > > +bool __igt_check_subtest_list(const char *subtest_name, ...);
> > >  /**
> > >   * igt_fixture:
> > >   *
> > > @@ -401,6 +402,25 @@ void __igt_subtest_group_restore(int, int);
> > >                            __igt_subtest_group_restore(igt_unique(__save), \
> > >                                                        igt_unique(__desc)))
> > >
> > > +/**
> > > + * igt_subtest_group_named:
> > > + *
> > > + * Group a set of subtests together with their common setup code
> > > + *
> > > + * This macro will execute common setup only when subtests under the
> > > + * group are ran.
> > > + */
> > > +#define igt_subtest_group_named(...) for (int igt_unique(__tmpint) = 0, \
> > > +                                     igt_unique(__save) = 0, \
> > > +                                     igt_unique(__desc) = 0; \
> > > +
> > __igt_check_subtest_list(__VA_ARGS__, NULL) && \
> > > +                                     igt_unique(__tmpint) < 1 && \
> > > +
> > (__igt_subtest_group_save(&igt_unique(__save), \
> > > +
> > &igt_unique(__desc)), true); \
> > > +                                     igt_unique(__tmpint) ++, \
> > > +
> > __igt_subtest_group_restore(igt_unique(__save), \
> > > +
> > igt_unique(__desc)))
> > > +
> > >  /**
> > >   * igt_main_args:
> > >   * @extra_short_opts: getopt_long() compliant list with additional short
> > options
> > > --
> > > 2.25.1
> > >
