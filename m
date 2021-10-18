Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6F06E85F
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 10:10:44 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 18 Oct 2021 10:10:40 +0000
Message-ID: <DM8PR11MB5719370C8D3791A97363031F8DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
 <20211013125949.19373-2-ville.syrjala@linux.intel.com>
 <DM8PR11MB571916D91BEA231F737525A28DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
 <YW0gDYSzbuHlnQ5+@intel.com>
In-Reply-To: <YW0gDYSzbuHlnQ5+@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Monday, October 18, 2021 12:50 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
>=20
> On Mon, Oct 18, 2021 at 04:19:41AM +0000, Modem, Bhanuprakash wrote:
> > > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vi=
lle
> > > Syrjala
> > > Sent: Wednesday, October 13, 2021 6:30 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Subject: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
> > >
> > > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > >
> > > Provide a helper to do the malloc()+memcpy() in one swift blow.
> > >
> > > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > ---
> > >  lib/igt_aux.c | 11 +++++++++++
> > >  lib/igt_aux.h |  2 ++
> > >  2 files changed, 13 insertions(+)
> > >
> > > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > > index 1217f5e88094..2445e483e210 100644
> > > --- a/lib/igt_aux.c
> > > +++ b/lib/igt_aux.c
> > > @@ -1527,3 +1527,14 @@ uint64_t vfs_file_max(void)
> > >  	}
> > >  	return max;
> > >  }
> > > +
> > > +void *igt_memdup(const void *ptr, size_t len)
> > > +{
> > > +	void *dup;
> > > +
> > > +	dup =3D malloc(len);
> > > +	if (dup)
> > > +		memcpy(dup, ptr, len);
> > > +
> > > +	return dup;
> >
> > Don't we need to handle the malloc() failures?
>=20
> Returning NULL is the way we handle malloc failures.
>=20
> > If it is fine to return NULL (in case of malloc failure) from here,
> > I haven't seen that any caller (Other patches in this series) is handli=
ng
> > this NULL.
>=20
> In actual tests the normal way to handle malloc failures is by
> exploding. Nothing special needed for that.

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

>=20
> --
> Ville Syrj=E4l=E4
> Intel
