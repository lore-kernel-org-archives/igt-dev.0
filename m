Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8110E0AA
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 11:13:00 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Aug 2023 11:12:56 +0000
Message-ID: <SJ1PR11MB62049456A99CD89C28BF26FD810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
 <20230802083900.1175872-3-priyanka.dandamudi@intel.com>
 <SJ1PR11MB6204E928F9C5514480AD2D22810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204E928F9C5514480AD2D22810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/4] xe/xe_sysfs: Modified code to work
 for non priv user
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Upadhyay, Tejas
> Sent: Wednesday, August 2, 2023 3:13 PM
> To: Dandamudi, Priyanka <Priyanka.Dandamudi@intel.com>; Kumar, Janga
> Rahul <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH i-g-t 2/4] xe/xe_sysfs: Modified code to work for non=
 priv
> user
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Sent: Wednesday, August 2, 2023 2:09 PM
> > To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> > dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> > Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Subject: [PATCH i-g-t 2/4] xe/xe_sysfs: Modified code to work for non
> > priv user
> >
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Updated code to work non privileged user.
> > Modified documentation.
> >
> > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/xe/xe_sysfs_defaults.c  |  6 +++---
> > tests/xe/xe_sysfs_scheduler.c | 19
> > +++++++++++++++----
> >  2 files changed, 18 insertions(+), 7 deletions(-)
> >
> > diff --git a/tests/xe/xe_sysfs_defaults.c
> > b/tests/xe/xe_sysfs_defaults.c index
> > ff958161b..0fc2918b6 100644
> > --- a/tests/xe/xe_sysfs_defaults.c
> > +++ b/tests/xe/xe_sysfs_defaults.c
> > @@ -6,10 +6,10 @@
> >  /**
> >   * TEST: xe sysfs defaults
> >   * Category: Infrastructure
> > - * Functionality: driver handler
> > + * Functionality: sysman defaults
> >   * Run type: FULL
> > - * Sub-category: xe
> > - * Test category: SysMan
> > + * Sub-category: sysman
> > + * Test category: functionality test
> >   * SUBTEST: engine-defaults
> >   */
> >
> > diff --git a/tests/xe/xe_sysfs_scheduler.c
> > b/tests/xe/xe_sysfs_scheduler.c index f199d6be8..6dbbd1760 100644
> > --- a/tests/xe/xe_sysfs_scheduler.c
> > +++ b/tests/xe/xe_sysfs_scheduler.c
> > @@ -5,6 +5,9 @@
> >
> >  /**
> >   * TEST: xe sysfs scheduler
> > + * Sub-category: sysman
> > + * Functionality: scheduler control interface
> > + * Test category: functionality test
> >   * Run type: FULL
> >   *
> >   * SUBTEST: %s-invalid
> > @@ -107,14 +110,21 @@ static void test_min_max(int xe, int engine,
> > const char **property)
> >
> >  static void test_param_nonpriv(int xe, int engine, const char
> > **property)  {

Please remove non-priv test, as it does not make difference. Sysfs is suppo=
sed to be written by priv user only. So we should check those tests only.

Thanks,
Tejas
> > +	struct stat st_engine, st_property;
> >  	unsigned int default_max, max;
> >  	unsigned int default_min, min;
> >  	unsigned int set;
> > -	struct stat st;
> >  	int defaults;
> > +	int property_fd;
> >
> > -	fstat(engine, &st);
> > -	fchmod(engine, (st.st_mode | S_IROTH | S_IWOTH));
> > +	property_fd =3D openat(engine, property[0], O_RDWR);
> > +	igt_require(property_fd !=3D -1);
> > +
> > +	fstat(engine, &st_engine);
> > +	fchmod(engine, (st_engine.st_mode | S_IRWXO | S_IRWXG |
> > S_IRWXU));
> > +
> > +	fstat(property_fd, &st_property);
> > +	fchmod(property_fd, (st_property.st_mode | S_IRWXO | S_IRWXG |
> > +S_IRWXU));
>=20
> Description of commit is not really talking about why this change is made=
.
> Can you please describe or reply here what are we trying to do here?
>=20
> Tejas
> >
> >  	defaults =3D openat(engine, ".defaults", O_DIRECTORY);
> >  	igt_require(defaults !=3D -1);
> > @@ -150,7 +160,8 @@ static void test_param_nonpriv(int xe, int engine,
> > const char **property)
> >  	}
> >  	igt_waitchildren();
> >
> > -	fchmod(engine, st.st_mode);
> > +	fchmod(engine, st_engine.st_mode);
> > +	fchmod(property_fd, st_property.st_mode);
> >
> >  	/* Reset max, min to original values */
> >  	igt_sysfs_printf(engine, property[1], "%d", default_min);
> > --
> > 2.25.1
