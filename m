Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB0F10E178
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:09:47 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:09:43 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Petri Latvala <adrinael@adrinael.net>
Message-ID: <20230314120943.6d922a1c@maurocar-mobl2>
In-Reply-To: <ZBBDaxaH/9SyZK1w@adrinael.net>
References: <20230314065344.589589-1-mauro.chehab@linux.intel.com>
 <ZBBDaxaH/9SyZK1w@adrinael.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] meson: build Xe test documentation
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

On Tue, 14 Mar 2023 11:50:35 +0200
Petri Latvala <adrinael@adrinael.net> wrote:

> On Tue, Mar 14, 2023 at 07:53:44AM +0100, Mauro Carvalho Chehab wrote:
> > From: Mauro Carvalho Chehab <mchehab@kernel.org>
> >=20
> > Add the remaining changes at meson for it to build Xe documentation
> > on html format.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> > ---
> >  docs/meson.build           |  1 +
> >  docs/testplan/conf.py      | 32 +++++++++++++++++++++++++++
> >  docs/testplan/testplan.css |  7 ++++++
> >  meson_options.txt          |  8 +++++++
> >  scripts/gen_rst_index      | 44 ++++++++++++++++++++++++++++++++++++++
> >  scripts/meson.build        |  3 +++
> >  6 files changed, 95 insertions(+)
> >  create mode 100644 docs/testplan/conf.py
> >  create mode 100644 docs/testplan/testplan.css
> >  create mode 100755 scripts/gen_rst_index
> >=20
> > diff --git a/docs/meson.build b/docs/meson.build
> > index ead14c4015d9..01edf64f04a8 100644
> > --- a/docs/meson.build
> > +++ b/docs/meson.build
> > @@ -1 +1,2 @@
> >  subdir('reference')
> > +subdir('testplan')
>=20
> Did you forget to git add docs/testplan/meson.build?

It was already added on this commit:

commit 2afc0e59eb2dfaa97e61895b8191b39044050dc7
Author:     Mauro Carvalho Chehab <mchehab@kernel.org>
AuthorDate: Fri Mar 10 20:41:18 2023 +0100
Commit:     Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>
CommitDate: Mon Mar 13 21:02:19 2023 +0100

    testplan/meson.build: add targets to build Xe test documentation
   =20
    Produce documentation from igt_doc.py markups inside the Xe driver
    at build time.
   =20
    Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
    Acked-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

This patch contains a left-over from the committed series.

Regards,
Mauro
