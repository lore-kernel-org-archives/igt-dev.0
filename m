Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC3110E1EB
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 09:54:14 +0000 (UTC)
From: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Kumar, Janga Rahul"
 <janga.rahul.kumar@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 2 Aug 2023 09:54:10 +0000
Message-ID: <DM6PR11MB449226BE0DFB46E1E717B84D8D0BA@DM6PR11MB4492.namprd11.prod.outlook.com>
References: <20230802083900.1175872-1-priyanka.dandamudi@intel.com>
 <20230802083900.1175872-2-priyanka.dandamudi@intel.com>
 <SJ1PR11MB6204368BA9AFEF54A6B51EEA810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204368BA9AFEF54A6B51EEA810BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
 xe_sysfs_gt_open
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
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: 02 August 2023 03:11 PM
> To: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>; Kumar, Janga
> Rahul <janga.rahul.kumar@intel.com>; igt-dev@lists.freedesktop.org
> Subject: RE: [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
> xe_sysfs_gt_open
>=20
>=20
>=20
> > -----Original Message-----
> > From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Sent: Wednesday, August 2, 2023 2:09 PM
> > To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> > dev@lists.freedesktop.org; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> > Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> > Subject: [PATCH i-g-t 1/4] xe/xe_sysfs: Updated tests to use
> > xe_sysfs_gt_open
> >
> > From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> >
> > Tests have been updated to use xe_sysfs_gt_open function.
> >
> > v2: Updated code to check when root user try to set value beyond local
> > min/max scheduler property.
> >
> > Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> > ---
> >  tests/xe/xe_sysfs_defaults.c  | 10 ++++++----
> > tests/xe/xe_sysfs_scheduler.c
> > | 12 +++++++-----
> >  2 files changed, 13 insertions(+), 9 deletions(-)
> >
> > diff --git a/tests/xe/xe_sysfs_defaults.c
> > b/tests/xe/xe_sysfs_defaults.c index 5c9de43e9..ff958161b 100644
> > --- a/tests/xe/xe_sysfs_defaults.c
> > +++ b/tests/xe/xe_sysfs_defaults.c
> > @@ -65,25 +65,27 @@ igt_main
> >
> >  		sys_fd =3D igt_sysfs_open(xe);
> >  		igt_require(sys_fd !=3D -1);
> > +		close(sys_fd);
> >  	}
> >
> >  	igt_subtest_with_dynamic("engine-defaults") {
> >  		xe_for_each_gt(xe, gt) {
> >  			int engines_fd =3D -1;
> > -			char buf[100];
> > +			int gt_fd =3D -1;
> >
> > -			sprintf(buf, "device/gt%d/engines", gt);
> > -			engines_fd =3D openat(sys_fd, buf, O_RDONLY);
> > +			gt_fd =3D xe_sysfs_gt_open(xe, gt);
> > +			igt_require(gt_fd !=3D -1);
> > +			engines_fd =3D openat(gt_fd, "engines", O_RDONLY);
> >  			igt_require(engines_fd !=3D -1);
> >
> >  			igt_sysfs_engines(xe, engines_fd, NULL,
> test_defaults);
> >
> >  			close(engines_fd);
> > +			 close(gt_fd);
> >  		}
> >  	}
> >
> >  	igt_fixture {
> > -		close(sys_fd);
> >  		xe_device_put(xe);
> >  		close(xe);
> >  	}
> > diff --git a/tests/xe/xe_sysfs_scheduler.c
> > b/tests/xe/xe_sysfs_scheduler.c index 1da0f541a..f199d6be8 100644
> > --- a/tests/xe/xe_sysfs_scheduler.c
> > +++ b/tests/xe/xe_sysfs_scheduler.c
> > @@ -94,7 +94,7 @@ static void test_min_max(int xe, int engine, const
> > char
> > **property)
> >
> >  	igt_sysfs_printf(engine, property[0], "%d", default_min);
> >  	igt_sysfs_scanf(engine, property[0], "%u", &set);
> > -	igt_assert_eq(set, default_min);
> > +	igt_assert_neq(set, default_min);
>=20
> Also what is default_min here, is it min/max under .defaults/? To test
> min/max, I think it should sysfs min/max that we should check against.

default_min here is under min/max under .defaults. This is sort of a negati=
ve test when we try to test beyond sysfs min/max and within default min/max=
 it should fail. This I changed to negative, as the requirement has been ch=
anged.

Regards,
Priyanka

>=20
> Tejas
> >
> >  	igt_sysfs_printf(engine, property[0], "%d", min);
> >  	igt_sysfs_scanf(engine, property[0], "%u", &set); @@ -184,6 +184,7
> > @@ igt_main
> >
> >  		sys_fd =3D igt_sysfs_open(xe);
> >  		igt_require(sys_fd !=3D -1);
> > +		close(sys_fd);
> >  	}
> >
> >  	for (int i =3D 0; i < count; i++) {
> > @@ -191,20 +192,21 @@ igt_main
> >  			igt_subtest_with_dynamic_f("%s-%s", property[i][0],
> > t->name) {
> >  				xe_for_each_gt(xe, gt) {
> >  					int engines_fd =3D -1;
> > -					char buf[100];
> > +					int gt_fd =3D -1;
> >
> > -					sprintf(buf, "device/gt%d/engines",
> > gt);
> > -					engines_fd =3D openat(sys_fd, buf,
> > O_RDONLY);
> > +					gt_fd =3D xe_sysfs_gt_open(xe, gt);
> > +					igt_require(gt_fd !=3D -1);
> > +					engines_fd =3D openat(gt_fd, "engines",
> > O_RDONLY);
> >  					igt_require(engines_fd !=3D -1);
> >
> >  					igt_sysfs_engines(xe, engines_fd,
> property[i], t->fn);
> >  					close(engines_fd);
> > +					close(gt_fd);
> >  				}
> >  			}
> >  		}
> >  	}
> >  	igt_fixture {
> > -		close(sys_fd);
> >  		xe_device_put(xe);
> >  		close(xe);
> >  	}
> > --
> > 2.25.1
