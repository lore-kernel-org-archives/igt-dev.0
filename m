Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D790C10FF6B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Apr 2022 05:48:07 +0000 (UTC)
Date: Thu, 14 Apr 2022 07:48:02 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Message-ID: <20220414074802.43ada340@maurocar-mobl2>
In-Reply-To: <3b1fb6c9-b517-e682-04ad-d17d365a33fa@intel.com>
References: <cover.1649753814.git.mchehab@kernel.org>
 <2a6359e9b7cfcc7cfaa37339d3aa8a3af9788d66.1649753814.git.mchehab@kernel.org>
 <3b1fb6c9-b517-e682-04ad-d17d365a33fa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH v2 09/12] code_cov_parse_info: fix error
 handling when opening files
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Ch Sai Gowtham <sai.gowtham.ch@intel.com>,
 Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, 13 Apr 2022 15:27:16 +0200
Andrzej Hajda <andrzej.hajda@intel.com> wrote:

> On 12.04.2022 10:59, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >
> > While on bash scripts we use "||" for error handling, perl
> > uses "or" instead. Yet, it doesn't warn when "||" is used. =20
>=20
> Perl accepts || as well (this is why it does not warn), but it has=20
> higher priority so in cases below it will behave different than or.
> So the above sentence is misleading.

Yeah, I was pretty sure I used ||  before... didn't notice that
it would be doing something different without the parenthesis.

> >
> > That causes it to print a warning when the open fail while
> > reading filter files, instead of the original intent of
> > finishing and reporting an error.
> >
> > Reviewed-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> > To avoid mailbombing on a large number of people, only mailing lists we=
re C/C on the cover.
> > See [PATCH v2 00/12] at: https://lore.kernel.org/all/cover.1649753814.g=
it.mchehab@kernel.org/
> >
> >   scripts/code_cov_parse_info | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
> > index 3e1525a67d99..c8284a297b33 100755
> > --- a/scripts/code_cov_parse_info
> > +++ b/scripts/code_cov_parse_info
> > @@ -513,7 +513,7 @@ my $filter_str =3D "";
> >   my $has_filter;
> >  =20
> >   if ($func_filters) {
> > -	open IN, $func_filters || die "Can't open $func_filters";
> > +	open IN, $func_filters or die "Can't open $func_filters"; =20
>=20
> Replacing with:
>  =C2=A0=C2=A0=C2=A0 open(IN, $func_filters) || die "Can't open $func_filt=
ers";
> should help as well.
>=20
> With or without slightly adjusted commit message.
>=20
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks!

Mauro
