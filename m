Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A966E84A
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 10:09:07 +0000 (UTC)
Date: Wed, 6 May 2020 13:09:04 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200506100904.GV9497@platvala-desk.ger.corp.intel.com>
References: <20200428202255.31309-1-juhapekka.heikkila@gmail.com>
 <20200428202255.31309-6-juhapekka.heikkila@gmail.com>
 <20200505140912.pqtw6yyplacaop5u@ahiler-desk1.fi.intel.com>
 <a9c3b9e6-1f2c-6e08-7c61-74f4aeead861@gmail.com>
 <0169ef69-3a71-991e-0b0c-302b19ffd6ad@gmail.com>
 <20200506090500.v7qtdlbjcf2m6azg@ahiler-desk1.fi.intel.com>
 <68a9eb1a-4ed7-7ca1-7161-7b3ec740b319@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <68a9eb1a-4ed7-7ca1-7161-7b3ec740b319@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/7] igt/params: add generic saving
 module parameter set
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, May 06, 2020 at 12:54:37PM +0300, Juha-Pekka Heikkila wrote:
> On 6.5.2020 12.05, Arkadiusz Hiler wrote:
> > On Tue, May 05, 2020 at 11:00:03PM +0300, Juha-Pekka Heikkila wrote:
> > > On 5.5.2020 21.46, Juha-Pekka Heikkila wrote:
> > > > On 5.5.2020 17.09, Arkadiusz Hiler wrote:
> > > > > On Tue, Apr 28, 2020 at 11:22:53PM +0300, Juha-Pekka Heikkila wro=
te:
> > > > > > From: Jani Nikula <jani.nikula@intel.com>
> > > > > > =

> > > > > > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> > > > > > Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.co=
m>
> > > > > > ---
> > > > > >  =A0 lib/igt_params.c | 57 ++++++++++++++++++++++++++++++++++++=
++++--------
> > > > > >  =A0 lib/igt_params.h |=A0 3 +++
> > > > > >  =A0 2 files changed, 51 insertions(+), 9 deletions(-)
> > > > > > =

> > > > > > diff --git a/lib/igt_params.c b/lib/igt_params.c
> > > > > > index fe4b1df3..d9cf986c 100644
> > > > > > --- a/lib/igt_params.c
> > > > > > +++ b/lib/igt_params.c
> > > > > > @@ -153,6 +153,29 @@ int igt_params_open(int device)
> > > > > >  =A0=A0=A0=A0=A0 return __igt_params_open(device, NULL);
> > > > > >  =A0 }
> > > > > > +__attribute__((format(printf, 3, 0)))
> > > > > =

> > > > > this is using a va_list, not "...", so this format attirbue shoul=
d not
> > > > > be here
> > > > > =

> > > > =

> > > > Good catch
> > > > =

> > > =

> > > Looking it with bit more thought, what's wrong with it? I think it is
> > > required there.
> > =

> > I found it a bit useless that we do printf format checking without
> > having any arugments to match types for as they are wrapped in va_list,
> > but if compilers are screeming that it's necessary so be it.
> > =

> > Not sure what benefit does it provide though.
> =

> Benefit is not to get compiler warning which would be caused from later
> usage of vsnprintf. Other way to avoid it is to take out
> "missing-format-attribute" warnings.

First I thought format_arg(3) is proper here but after checking the
docs, it is as J-P says:

"For functions where the arguments are not available to be checked
(such as vprintf), specify the third parameter as zero. In this case
the compiler only checks the format string for consistency."


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
