Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373D76E970
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Oct 2021 07:19:45 +0000 (UTC)
Date: Mon, 18 Oct 2021 10:19:41 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YW0gDYSzbuHlnQ5+@intel.com>
References: <20211013125949.19373-1-ville.syrjala@linux.intel.com>
 <20211013125949.19373-2-ville.syrjala@linux.intel.com>
 <DM8PR11MB571916D91BEA231F737525A28DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <DM8PR11MB571916D91BEA231F737525A28DBC9@DM8PR11MB5719.namprd11.prod.outlook.com>
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Oct 18, 2021 at 04:19:41AM +0000, Modem, Bhanuprakash wrote:
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Ville
> > Syrjala
> > Sent: Wednesday, October 13, 2021 6:30 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [igt-dev] [PATCH i-g-t 1/7] lib: Introduce igt_memdup()
> >=20
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> >=20
> > Provide a helper to do the malloc()+memcpy() in one swift blow.
> >=20
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  lib/igt_aux.c | 11 +++++++++++
> >  lib/igt_aux.h |  2 ++
> >  2 files changed, 13 insertions(+)
> >=20
> > diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> > index 1217f5e88094..2445e483e210 100644
> > --- a/lib/igt_aux.c
> > +++ b/lib/igt_aux.c
> > @@ -1527,3 +1527,14 @@ uint64_t vfs_file_max(void)
> >  	}
> >  	return max;
> >  }
> > +
> > +void *igt_memdup(const void *ptr, size_t len)
> > +{
> > +	void *dup;
> > +
> > +	dup =3D malloc(len);
> > +	if (dup)
> > +		memcpy(dup, ptr, len);
> > +
> > +	return dup;
>=20
> Don't we need to handle the malloc() failures?

Returning NULL is the way we handle malloc failures.

> If it is fine to return NULL (in case of malloc failure) from here,
> I haven't seen that any caller (Other patches in this series) is handling
> this NULL.

In actual tests the normal way to handle malloc failures is by
exploding. Nothing special needed for that.

--=20
Ville Syrj=E4l=E4
Intel
