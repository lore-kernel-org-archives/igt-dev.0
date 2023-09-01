Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDEC10E748
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Sep 2023 08:35:47 +0000 (UTC)
Date: Fri, 1 Sep 2023 10:34:15 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Ilja Friedel <ihf@google.com>
Message-ID: <20230901103415.56a65e92@maurocar-mobl2>
In-Reply-To: <20230901094540.564ce3f6@maurocar-mobl2>
References: <20230710115354.699245-1-mauro.chehab@linux.intel.com>
 <20230710115354.699245-5-mauro.chehab@linux.intel.com>
 <20230710181709.234ki5ihaoh6cj5l@kamilkon-desk1>
 <CAJUqKUo9rKSqQ6h17gbiEWVhQSaAsvwD51_fmpBr+MTm_R7Rug@mail.gmail.com>
 <CAAea8Y3a_RjknGcn6-v9CVUVpcmMuASnJKfn73KGtQzbXo0TcA@mail.gmail.com>
 <20230831112851.2b5c19b7@maurocar-mobl2>
 <CAAea8Y13=CguTipLJjJJt_pBvaiv92DViWJBZwvtjm7W-SU+vw@mail.gmail.com>
 <20230901094540.564ce3f6@maurocar-mobl2>
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

On Fri, 1 Sep 2023 09:45:40 +0200
Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:

> On Thu, 31 Aug 2023 18:24:05 -0700
> Ilja Friedel <ihf@google.com> wrote:
>=20
> > Hi Mauro,
> >=20
> > On Thu, Aug 31, 2023 at 2:28=E2=80=AFAM Mauro Carvalho Chehab < =20
> > mauro.chehab@linux.intel.com> wrote:   =20
> >  =20
> > > The testlist files are used for two purposes:
> > >
> > > 1. for documentation build;
> > > 2. for CI automation to run the tests.
> > >
> > > While right now Intel CI doesn't depend on the produced testlists,
> > > this may change in the future. So, instead of making the testlist
> > > build dependent of testplan, the better seems to verify if the
> > > build is not a cross-compilation, e. g. with a patch similar to
> > > the enclosed one.
> > >   =20
> >=20
> > In my experience it is better to separate build phases from phases that=
 use
> > these binaries and execute them. It makes steps more modular and clearer
> > where any failures come from. Having test lists sounds like a good idea
> > and beneficial to other architectures. =20
>=20
> My original approach was to do that, but I had some issues due to the
> lack of some features with the minimal meson version supported by IGT
> (and upgrading the version would also break gitlab pipelines).

Btw, if you want to dig it deeper, the problem I faced is with
regards to the name for the custom_target, e.g., on this code
snippet:

	foreach prog : test_progs
		testexe =3D executable(prog, [prog + '.c'] + extra_sources.get(prog, []),
			   dependencies : test_deps + extra_dependencies.get(prog, []),
			   install_dir : libexecdir,
			   install_rpath : libexecdir_rpathdir,
			   install : true)
		test_executables +=3D testexe
		test_list +=3D prog
		name =3D prog.split('/').get(-1)
		if not meson.is_cross_build()
			testlist_files +=3D custom_target(name + '.testlist',
				    build_by_default : true,
				    command : [testexe, '--show-testlist'],
				    capture : true,
				    output : name + '.testlist')
		endif
	endforeach

the custom_target needs name + '.testlist'. Newer versions of
Meson have a .name() function to get the name of the target built
via executable[1]. So, a simple for at the end would do the work.
Something like:

    if not meson.is_cross_build()
	foreach prog : test_executables
		name =3D prog.name()
		testlist_files +=3D custom_target(name + '.testlist',
			    build_by_default : true,
			    command : [testexe, '--show-testlist'],
			    capture : true,
			    output : name + '.testlist')
	endif
    endif

But this would require setting meson minimal version to 0.54.

[1] https://mesonbuild.com/Reference-manual_returned_exe.html#build_tgtname

I was unable to find a way to do the same with version 0.48. One option
would be to change minimal version to 0.54, but, as I said, this would
require some changes at gitlab pipeline. No idea how to do that, nor I
have access to change pipeline settings.

We could do it on a different way, by creating a list of names, but
lists on Meson are constant and, on version 0.48, you can't append
values to them (at least this failed on my tests).

> > > Could you please check if this will address the issue? I don't have
> > > a cross-compilation environment handy to test it, so it would be
> > > easier if you could test it for me.
> > >   =20
> >=20
> > The enclosed patch "[PATCH i-g-t] tests/meson.build: only generate
> > testlists
> > on native builds" works for our build system. If you want to stick with=
 it,
> > could you please land it in the upstream tree?  =20
>=20
> I sent the patch upstream too. Had to do a rebase today due to
> a conflict (that actually made the final patch simpler):
>=20
> 	https://patchwork.freedesktop.org/series/123104/
>=20
> Could you please re-test and review or ack it? I'll merge it after
> getting your R-B or A-B.
>=20
> > Otherwise I could try a different patch as well. =20
>=20
> Sure! If you'd like to spin a different patch addressing it, go
> for it.
>=20
> Regards,
> Mauro
