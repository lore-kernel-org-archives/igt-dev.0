Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB6876E1F7
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Mar 2021 08:19:55 +0000 (UTC)
From: "Patnana, Venkata Sai" <venkata.sai.patnana@intel.com>
Date: Mon, 29 Mar 2021 08:19:49 +0000
Message-ID: <DM6PR11MB4594CAB99D9D918CD8C027A7B37E9@DM6PR11MB4594.namprd11.prod.outlook.com>
References: <20210323105306.400-1-venkata.sai.patnana@intel.com>
 <BYAPR11MB3319A1C56984721AB7BF18758D649@BYAPR11MB3319.namprd11.prod.outlook.com>
 <YFnVqLHiXxfvKR7d@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YFnVqLHiXxfvKR7d@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/kms: Add for_each_pipe_clamped
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Latvala, Petri" <petri.latvala@intel.com>, "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Latvala, Petri <petri.latvala@intel.com>
> Sent: Tuesday, March 23, 2021 5:19 PM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>; igt-
> dev@lists.freedesktop.org; B S, Karthik <karthik.b.s@intel.com>; Heikkila=
, Juha-
> pekka <juha-pekka.heikkila@intel.com>; Shankar, Uma
> <uma.shankar@intel.com>
> Subject: Re: [PATCH i-g-t 1/2] lib/kms: Add for_each_pipe_clamped
> =

> On Tue, Mar 23, 2021 at 01:32:20PM +0200, Modem, Bhanuprakash wrote:
> > > From: Patnana, Venkata Sai <venkata.sai.patnana@intel.com>
> > > Sent: Tuesday, March 23, 2021 4:23 PM
> > > To: igt-dev@lists.freedesktop.org
> > > Cc: B S, Karthik <karthik.b.s@intel.com>; Heikkila, Juha-pekka
> > > <juha- pekka.heikkila@intel.com>; Shankar, Uma
> > > <uma.shankar@intel.com>; Patnana, Venkata Sai
> > > <venkata.sai.patnana@intel.com>; Modem, Bhanuprakash
> > > <bhanuprakash.modem@intel.com>; Latvala, Petri
> > > <petri.latvala@intel.com>
> > > Subject: [PATCH i-g-t 1/2] lib/kms: Add for_each_pipe_clamped
> > >
> > > From: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> > >
> > > for_each_pipe and for_each_pipe_static cannot be used for limiting
> > > pipe iteration.
> > > This api will provide limits the pipe iteration
> > >
> > > v2: Handle fused pipes (Petri)
> > >     Add a variable pipe count (Bhanu)
> > > v3: change api name as suggested (Petri)
> > >
> > > Cc: Uma Shankar <uma.shankar@intel.com>
> > > Cc: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> > > Cc: Modem Bhanuprakash <bhanuprakash.modem@intel.com>
> > > Cc: Karthik B S <karthik.b.s@intel.com>
> > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> > > ---
> > >  lib/igt_kms.h | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/lib/igt_kms.h b/lib/igt_kms.h index
> > > 09b10b3e04..7dbf14483c 100644
> > > --- a/lib/igt_kms.h
> > > +++ b/lib/igt_kms.h
> > > @@ -534,6 +534,18 @@ static inline bool
> > > igt_output_is_connected(igt_output_t *output)
> > >  for_each_pipe_static(pipe) \
> > >  for_each_if((display)->pipes[(pipe)].enabled)
> > >
> > > +/**
> > > + * for_each_pipe_clamped:
> > > + * @display: a pointer to an #igt_display_t structure
> > > + * @pipe: The pipe to iterate.
> > > + * @pipe_count: Number of pipes to be iterate
> > > + *
> > > + * This for loop iterates based on pipe_count and supported by IGT
> > > libraries,
> > > + */
> > > +#define for_each_pipe_clamped(display, pipe, pipe_count) \
> >
> > What about other APIs like "for_each_pipe_with_valid_output" those
> > iterates over all enabled pipes? Are we planning to implement similar
> > APIs to limit the execution to few pipes?
> =

> A good point here. At this point I suppose it might be cleaner to leave t=
he
> for_each loops alone and implement clamping in the tests directly with an=
 open-
> coded counting.
> =

> igt_subtest_with_dynamic(....) {
>   int count =3D 0;
>   for_each_pipe(no magickry here) {
>     igt_dynamic_f(pipe-%s)
>       ....
>     if (++count > limit)
>       break;
>   }
> }
> =

Here our basic idea is to implement a cleaner code, to make lib for generic=
 approach,
Because in multiple tests we are doing this same approach for all tests. Th=
at is why we had decided to create a new api.  =

> =

> --
> Petri Latvala
> =

> =

> >
> > > +for_each_pipe_static(pipe) \
> > > +                for_each_if((display)->pipes[(pipe)].enabled) \
> > > +for_each_if(pipe_count-- > 0)
> > >  /**
> > >   * for_each_pipe_with_valid_output:
> > >   * @display: a pointer to an #igt_display_t structure
> > > --
> > > 2.25.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
