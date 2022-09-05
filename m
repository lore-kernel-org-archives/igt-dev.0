Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F33A910E475
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Sep 2022 18:07:48 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>
Date: Mon, 5 Sep 2022 18:07:45 +0000
Message-ID: <MW3PR11MB4748C7A83CFC224F8A578A78AE7F9@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20220905125320.3475254-1-janga.rahul.kumar@intel.com>
 <20220905125320.3475254-2-janga.rahul.kumar@intel.com>
 <YxX/ce428cCpzUmR@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YxX/ce428cCpzUmR@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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



> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: 05 September 2022 19:24
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t 1/1] lib/igt_core.h: Introduce
> igt_subtest_group_named
>=20
> On Mon, Sep 05, 2022 at 06:23:20PM +0530, janga.rahul.kumar@intel.com
> wrote:
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > igt_subtest_group_named will check for requirements only when the
> > subtest inside igt_subtest_group_named are executed.
> >
> > This will help in avoiding the logging related to requirements of
> > subgroup tests when tests outside the subgroup are executed
> > individually.
> >
> > Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
>=20
> How is this supposed to be used? Does one need to list all subtests a
> subtest_group is going to have one by one? That's prone to errors and a
> maintenance nightmare.
[Janga Rahul Kumar] It is an alternative to igt_subtest_group whose main pu=
rpose is to group the common subtests setup/requirements check together and=
 skip the subtests in the group if the requirements mentioned in common set=
up is not met. Existing issue with igt_subtest_group, it will execute the s=
etup part(igt_fixture) independent of whether the subtests under it are exe=
cuted or not. igt_subtest_group_named executes the setup part only when the=
 subtests inside them are ran which can help in avoiding the unnecessary lo=
gging in setup part and also save time wasted in executing the setup part.

Usage :
igt_subtest_group_named(test*) {
	igt_fixture() { }
	igt_subtest(test1) { }
	igt_subtest(test2) {}
}
>=20
> If the purpose is just to get logging easier to read, a better solution i=
s in my
> TODO with the runner communications rework that puts the result reason
> alongside the result text itself.
>=20
>=20
> --
> Petri Latvala
>=20
>=20
>=20
> > ---
> >  lib/igt_core.c | 23 +++++++++++++++++++++++
> >  lib/igt_core.h | 20 ++++++++++++++++++++
> >  2 files changed, 43 insertions(+)
> >
> > diff --git a/lib/igt_core.c b/lib/igt_core.c
> > index e7425326..7d84e145 100644
> > --- a/lib/igt_core.c
> > +++ b/lib/igt_core.c
> > @@ -658,6 +658,29 @@ void __igt_fixture_end(void)
> >  	siglongjmp(igt_subtest_jmpbuf, 1);
> >  }
> >
> > +bool __igt_check_subtest_list(const char *subtest_name, ...)
> > +{
> > +	va_list valist;
> > +	bool match =3D false;
> > +	char *next_subtest_name =3D (char *)subtest_name;
> > +
> > +	if (!run_single_subtest)
> > +		return true;
> > +
> > +	va_start(valist, *subtest_name);
> > +
> > +	while (next_subtest_name !=3D NULL) {
> > +		if (uwildmat(run_single_subtest, next_subtest_name) !=3D 0)
> > +			match =3D true;
> > +
> > +		next_subtest_name =3D va_arg(valist, char *);
> > +	}
> > +
> > +	va_end(valist);
> > +
> > +	return match;
> > +}
> > +
> >  /*
> >   * If the test takes out the machine, in addition to the usual dmesg
> >   * spam, the kernel may also emit a "death rattle" -- extra debug
> > diff --git a/lib/igt_core.h b/lib/igt_core.h
> > index aa98e8ed..774e1893 100644
> > --- a/lib/igt_core.h
> > +++ b/lib/igt_core.h
> > @@ -138,6 +138,7 @@ struct _GKeyFile *igt_load_igtrc(void);
> >  bool __igt_fixture(void);
> >  void __igt_fixture_complete(void);
> >  __noreturn void __igt_fixture_end(void);
> > +bool __igt_check_subtest_list(const char *subtest_name, ...);
> >  /**
> >   * igt_fixture:
> >   *
> > @@ -401,6 +402,25 @@ void __igt_subtest_group_restore(int, int);
> >  			       __igt_subtest_group_restore(igt_unique(__save), \
> >  							   igt_unique(__desc)))
> >
> > +/**
> > + * igt_subtest_group_named:
> > + *
> > + * Group a set of subtests together with their common setup code
> > + *
> > + * This macro will execute common setup only when subtests under the
> > + * group are ran.
> > + */
> > +#define igt_subtest_group_named(...) for (int igt_unique(__tmpint) =3D=
 0, \
> > +					  igt_unique(__save) =3D 0, \
> > +					  igt_unique(__desc) =3D 0; \
> > +
> __igt_check_subtest_list(__VA_ARGS__, NULL) && \
> > +					  igt_unique(__tmpint) < 1 && \
> > +
> (__igt_subtest_group_save(&igt_unique(__save), \
> > +
> &igt_unique(__desc)), true); \
> > +					  igt_unique(__tmpint) ++, \
> > +
> __igt_subtest_group_restore(igt_unique(__save), \
> > +
> igt_unique(__desc)))
> > +
> >  /**
> >   * igt_main_args:
> >   * @extra_short_opts: getopt_long() compliant list with additional sho=
rt
> options
> > --
> > 2.25.1
> >
