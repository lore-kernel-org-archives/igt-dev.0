Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106E10E11B
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Apr 2023 11:47:07 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Fri, 28 Apr 2023 11:47:04 +0000
Message-ID: <MW3PR11MB474832550DCA4B11D6C3D6E7AE6B9@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230425123603.3069724-1-janga.rahul.kumar@intel.com>
 <MW3PR11MB474865820F23633E1C468129AE6A9@MW3PR11MB4748.namprd11.prod.outlook.com>
 <BYAPR11MB34135C3DEA3576D3EEA5AD3BD06A9@BYAPR11MB3413.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB34135C3DEA3576D3EEA5AD3BD06A9@BYAPR11MB3413.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/xe/xe_query.c: Update subtest
 query-engines
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
> From: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> Sent: 27 April 2023 17:50
> To: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>; igt-
> dev@lists.freedesktop.org; Gandi, Ramadevi <ramadevi.gandi@intel.com>
> Subject: RE: [PATCH i-g-t] tests/xe/xe_query.c: Update subtest query-engi=
nes
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Sent: Thursday, April 27, 2023 5:28 PM
> > To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>
> > Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> > Subject: RE: [PATCH i-g-t] tests/xe/xe_query.c: Update subtest
> > query-engines
> >
> >
> >
> > > -----Original Message-----
> > > From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > > Sent: 25 April 2023 18:06
> > > To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > > <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> > > <janga.rahul.kumar@intel.com>
> > > Subject: [PATCH i-g-t] tests/xe/xe_query.c: Update subtest
> > > query-engines
> > >
> > > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > >
> > > Log engine instance and tile info along with engine type.
> > >
> > > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > ---
> > >  tests/xe/xe_query.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c index
> > > 3f038225..161386d8 100644
> > > --- a/tests/xe/xe_query.c
> > > +++ b/tests/xe/xe_query.c
> > > @@ -183,8 +183,9 @@ test_query_engines(int fd)
> > >
> > >  	xe_for_each_hw_engine(fd, hwe) {
> > >  		igt_assert(hwe);
> > > -		igt_info("engine %d: %s\n", i++,
> > > -			xe_engine_class_string(hwe->engine_class));
> > > +		igt_info("engine %d: %s, engine instance: %d , tile: TILE-%d\n",
>=20
> Do we really need tile info here ?
Yes, It helps in identifying the number of engines per tile.
> Fix this engine instance: %d , --> engine instance: %d,
> > > i++,
> > > +			 xe_engine_class_string(hwe->engine_class), hwe-
> > > >engine_instance,
> > > +								    hwe-
> > > >gt_id);
> > >  	}
> With the above fixed,
> Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> > >
> > >  	igt_assert(i > 0);
> > > --
> > > 2.25.1
