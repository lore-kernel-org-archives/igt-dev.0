Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 1 Nov 2022 13:43:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Daniel Latypov <dlatypov@google.com>
Message-ID: <20221101134334.59500e01@maurocar-mobl2>
In-Reply-To: <CAGS_qxpCPTSRNAyejL0gS0pZAoVNp9SdFwPFkHRyn5yMuPGkLw@mail.gmail.com>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
 <CAGS_qxpCPTSRNAyejL0gS0pZAoVNp9SdFwPFkHRyn5yMuPGkLw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 3/4] lib/igt_kmod: add compatibility
 for KUnit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kselftest@vger.kernel.org,
 Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>,
 Trevor Woerner <twoerner@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>, n@nfraprado.net,
 David Gow <davidgow@google.com>, Isabella Basso <isabbasso@riseup.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, 19 Sep 2022 17:25:38 -0700
Daniel Latypov <dlatypov@google.com> wrote:

> On Mon, Sep 19, 2022 at 1:43 PM Isabella Basso <isabbasso@riseup.net> wro=
te:
> > >> +        * "(K)TAP version XX" should be the first line on all (sub)=
tests as per
> > >> +        * https://www.kernel.org/doc/html/latest/dev-tools/ktap.htm=
l#version-lines
> > >> +        * but actually isn't, as it currently depends on whoever wr=
ites the
> > >> +        * test to print this info =20
> > >
> > > FYI: we're really trying to fix cases of "missing version lines",
> > > largely by making the kunit_test_suites() macro work in more
> > > circumstances.
> > >
> > > So while it may be worth still handling the case where this is
> > > missing, I don't think there are any tests in the latest versions of
> > > the kernel which should have this missing. =20
> >
> > I=E2=80=99m not sure if I totally get how these work. Every time I run =
a KUnit test I
> > get something like this: https://pastebin.com/7Ff31PMC
> >
> > As you can see it has been loaded as a module, just like we intend to d=
o it
> > from IGT, and I see no version lines whatsoever. Am I doing something w=
rong? =20
>=20
> You're doing everything right.
>=20
> The problem is we only print the version line for the *built-in* tests.
> It never gets printed for tests in loadable modules.

IGT tests require loadable modules, as some tests check if bind/unbind
and load/unload works. Also, some tests require modprobing drivers
with different parameters.

Unfortunately, kunit.py is currently broken on such cases: its parser
simply ignores everything if the subtest doesn't have a TAP version
just before it. See:

	$ ./tools/testing/kunit/kunit.py parse /var/log/dmesg
	[12:37:05] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:05] [ERROR] Test: main: 0 tests run!
	[12:37:05] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:05] Testing complete. Ran 0 tests: errors: 1

Here, I loaded the test module twice. I can force it to parse it by
doing

	$ (dmesg|grep "TAP version"; dmesg|grep -A9999 intel_i915_mock) >logs=20

But then, it gets confused with two subtests with the same name:

	$ ./tools/testing/kunit/kunit.py parse logs
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D intel_i915_mock (18 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] [PASSED] sanitycheck
	[12:37:34] [PASSED] shmem
	[12:37:34] [PASSED] fence
	[12:37:34] [PASSED] scatterlist
	[12:37:34] [PASSED] syncmap
	[12:37:34] [PASSED] uncore
	[12:37:34] [PASSED] ring
	[12:37:34] [PASSED] engine
	[12:37:34] [PASSED] timelines
	[12:37:34] [PASSED] requests
	[12:37:34] [PASSED] objects
	[12:37:34] [PASSED] phys
	[12:37:34] [PASSED] dmabuf
	[12:37:34] [PASSED] vma
	[12:37:34] [PASSED] evict
	[12:37:34] [PASSED] gtt
	[12:37:34] [PASSED] hugepages
	[12:37:34] [PASSED] memory_region
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] in=
tel_i915_mock =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D intel_i915_mock (18 =
subtests) =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] [PASSED] sanitycheck
	[12:37:34] [PASSED] shmem
	[12:37:34] [PASSED] fence
	[12:37:34] [PASSED] scatterlist
	[12:37:34] [PASSED] syncmap
	[12:37:34] [PASSED] uncore
	[12:37:34] [PASSED] ring
	[12:37:34] [PASSED] engine
	[12:37:34] [PASSED] timelines
	[12:37:34] [PASSED] requests
	[12:37:34] [PASSED] objects
	[12:37:34] [PASSED] phys
	[12:37:34] [PASSED] dmabuf
	[12:37:34] [PASSED] vma
	[12:37:34] [PASSED] evict
	[12:37:34] [PASSED] gtt
	[12:37:34] [PASSED] hugepages
	[12:37:34] [PASSED] memory_region
	[12:37:34] [ERROR] Test: intel_i915_mock: Expected test number 2 but found=
 1
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [PASSED] in=
tel_i915_mock =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
	[12:37:34] Testing complete. Ran 36 tests: passed: 36, errors: 1

> Some more details below, if interested.
> Specifically, it happens in
> https://elixir.bootlin.com/linux/latest/C/ident/kunit_print_tap_header
>=20
> What David is referring to is we had tests that weren't in modules,
> but didn't use the normal built-in code path. Those were also missing
> TAP version lines.
> But KUnit needs to do better here in the case of modules.
>=20
> The goal was that you'd be able to parse the result of module based
> tests by something like
> $ cat /sys/kernel/debug/kunit/*/results | ./tools/testing/kunit/kunit.py =
parse
> but this doesn't work because of the lack of a version line.

At least here, debug/kunit doesn't exist:

	sudo ls -lctra /sys/kernel/debug/|grep kunit

>=20
> If we add it to each module's test results, then we'll need to update
> the parse to allow multiple verison lines, I think.

Yeah, the parser is currently broken when used with modules.

Regards,
Mauro
