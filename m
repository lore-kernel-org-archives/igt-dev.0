Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 680BE10E728
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Apr 2023 07:26:35 +0000 (UTC)
Date: Wed, 12 Apr 2023 09:26:29 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Message-ID: <20230412092629.7364fadf@maurocar-mobl2>
In-Reply-To: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
References: <20230411110205.1002-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t] meson: Disable testplan build by default
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

On Tue, 11 Apr 2023 14:02:05 +0300
Ville Syrjala <ville.syrjala@linux.intel.com> wrote:

> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

> No real idea what this "testplan" is and why it lives
> in igt. Seems to be build some xe documentation, and based
> on the name is maybe some manager level stuff? Surely
> this is nothing that matters for normal people (esp. those
> outside Intel).

No. Basically, testplan contains documentation for the tests.
Currently, it contains 100% of the documentation from Xe tests.
We may end implementing it for i915 as well.

There is even a plan to generate testlists like xe-fast-feedback.testlist
directly from documentation. So, it is important to have the tests properly
documented, as otherwise they won't be executed by CI in the future.

>=20
> The main problem here being that it is hideously slow to
> build, making life miserable for everyone. Flip the
> default to disabled and let those that need this enable
> it themselves.

Generating documents takes ~150ms. What makes it slow is not the doc
generation itself, but a validation logic that checks if the test=20
documentation was updated as tests got added/renamed/removed.=20
It currently uses igt_runner, pointing to the documented tests.=20
As right now just Xe tests uses it, it will call the runner with:

	$ igt_runner -L -t igt@xe ${builddir}/tests

Perhaps the best strategy would be to re-implement the logic there to
not use igt_runner, executing

	 ${builddir}/tests/xe_* --list

directly, and in parallel. I'll work on a patch like that.

Anyway, all developers touching documented tests should run (and so CI),
as we don't want to have undocumented tests on IGT.

So,

NACK.

Regards,
Mauro

>=20
> On my HSW:
> $ touch tests/kms_color.c # any random file
> $ time ninja -Cbuild
> - real  0m22,202s
> - user  0m20,640s
> - sys   0m1,570s
> + real  0m0,241s
> + user  0m0,214s
> + sys   0m0,031s
>=20
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  meson_options.txt | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meson_options.txt b/meson_options.txt
> index d4e373d6cfc4..0ea1383a4fe8 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -22,6 +22,7 @@ option('man',
> =20
>  option('testplan',
>         type : 'feature',
> +       value : 'disabled',
>         description : 'Build testplan documentation pages in ReST and htm=
l')
> =20
>  option('sphinx',
