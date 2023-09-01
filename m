Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A22010E048
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 07:46:21 +0000 (UTC)
Date: Fri, 1 Sep 2023 09:45:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ilja Friedel <ihf@google.com>
Message-ID: <20230901094540.564ce3f6@maurocar-mobl2>
In-Reply-To: <CAAea8Y13=CguTipLJjJJt_pBvaiv92DViWJBZwvtjm7W-SU+vw@mail.gmail.com>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-5-mauro.chehab@linux.intel.com>
 <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
 <CAJUqKUo9rKSqQ6h17gbiEWVhQSaAsvwD51_fmpBr+MTm_R7Rug@mail.gmail.com>
 <CAAea8Y3a_RjknGcn6-v9CVUVpcmMuASnJKfn73KGtQzbXo0TcA@mail.gmail.com>
 <20230831112851.2b5c19b7@maurocar-mobl2>
 <CAAea8Y13=CguTipLJjJJt_pBvaiv92DViWJBZwvtjm7W-SU+vw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v5 4/7] tests/meson.build: create
 testlists for tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, 31 Aug 2023 18:24:05 -0700
Ilja Friedel <ihf@google.com> wrote:

> Hi Mauro,
>=20
> On Thu, Aug 31, 2023 at 2:28=E2=80=AFAM Mauro Carvalho Chehab <
> mauro.chehab@linux.intel.com> wrote: =20
>=20
> > The testlist files are used for two purposes:
> >
> > 1. for documentation build;
> > 2. for CI automation to run the tests.
> >
> > While right now Intel CI doesn't depend on the produced testlists,
> > this may change in the future. So, instead of making the testlist
> > build dependent of testplan, the better seems to verify if the
> > build is not a cross-compilation, e. g. with a patch similar to
> > the enclosed one.
> > =20
>=20
> In my experience it is better to separate build phases from phases that u=
se
> these binaries and execute them. It makes steps more modular and clearer
> where any failures come from. Having test lists sounds like a good idea
> and beneficial to other architectures.

My original approach was to do that, but I had some issues due to the
lack of some features with the minimal meson version supported by IGT
(and upgrading the version would also break gitlab pipelines).

> > Could you please check if this will address the issue? I don't have
> > a cross-compilation environment handy to test it, so it would be
> > easier if you could test it for me.
> > =20
>=20
> The enclosed patch "[PATCH i-g-t] tests/meson.build: only generate
> testlists
> on native builds" works for our build system. If you want to stick with i=
t,
> could you please land it in the upstream tree?=20

I sent the patch upstream too. Had to do a rebase today due to
a conflict (that actually made the final patch simpler):

	https://patchwork.freedesktop.org/series/123104/

Could you please re-test and review or ack it? I'll merge it after
getting your R-B or A-B.

> Otherwise I could try a different patch as well.

Sure! If you'd like to spin a different patch addressing it, go
for it.

Regards,
Mauro
