Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FDB810E1BD
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Apr 2023 12:20:15 +0000 (UTC)
From: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Gandi,
 Ramadevi" <ramadevi.gandi@intel.com>
Date: Thu, 27 Apr 2023 12:20:11 +0000
Message-ID: <BYAPR11MB34135C3DEA3576D3EEA5AD3BD06A9@BYAPR11MB3413.namprd11.prod.outlook.com>
References: <20230425123603.3069724-1-janga.rahul.kumar@intel.com>
 <MW3PR11MB474865820F23633E1C468129AE6A9@MW3PR11MB4748.namprd11.prod.outlook.com>
In-Reply-To: <MW3PR11MB474865820F23633E1C468129AE6A9@MW3PR11MB4748.namprd11.prod.outlook.com>
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
> From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> Sent: Thursday, April 27, 2023 5:28 PM
> To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> <ramadevi.gandi@intel.com>
> Cc: Ch, Sai Gowtham <sai.gowtham.ch@intel.com>
> Subject: RE: [PATCH i-g-t] tests/xe/xe_query.c: Update subtest query-engi=
nes
>=20
>=20
>=20
> > -----Original Message-----
> > From: Kumar, Janga Rahul <janga.rahul.kumar@intel.com>
> > Sent: 25 April 2023 18:06
> > To: igt-dev@lists.freedesktop.org; Gandi, Ramadevi
> > <ramadevi.gandi@intel.com>; Kumar, Janga Rahul
> > <janga.rahul.kumar@intel.com>
> > Subject: [PATCH i-g-t] tests/xe/xe_query.c: Update subtest
> > query-engines
> >
> > From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> >
> > Log engine instance and tile info along with engine type.
> >
> > Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > ---
> >  tests/xe/xe_query.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c index
> > 3f038225..161386d8 100644
> > --- a/tests/xe/xe_query.c
> > +++ b/tests/xe/xe_query.c
> > @@ -183,8 +183,9 @@ test_query_engines(int fd)
> >
> >  	xe_for_each_hw_engine(fd, hwe) {
> >  		igt_assert(hwe);
> > -		igt_info("engine %d: %s\n", i++,
> > -			xe_engine_class_string(hwe->engine_class));
> > +		igt_info("engine %d: %s, engine instance: %d , tile: TILE-%d\n",

Do we really need tile info here ?
Fix this engine instance: %d , --> engine instance: %d,
> > i++,
> > +			 xe_engine_class_string(hwe->engine_class), hwe-
> > >engine_instance,
> > +								    hwe-
> > >gt_id);
> >  	}
With the above fixed,
Reviewed-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> >
> >  	igt_assert(i > 0);
> > --
> > 2.25.1
