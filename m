Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7EFB10E132
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Sep 2022 00:25:51 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id lh5so2400941ejb.10
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 17:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
In-Reply-To: <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
From: Daniel Latypov <dlatypov@google.com>
Date: Mon, 19 Sep 2022 17:25:38 -0700
Message-ID: <CAGS_qxpCPTSRNAyejL0gS0pZAoVNp9SdFwPFkHRyn5yMuPGkLw@mail.gmail.com>
To: Isabella Basso <isabbasso@riseup.net>
Content-Type: text/plain; charset="UTF-8"
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
Cc: linux-kselftest@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, n@nfraprado.net,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Gow <davidgow@google.com>, Tales Aparecida <tales.aparecida@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@riseup.net>,
 Brendan Higgins <brendanhiggins@google.com>,
 Trevor Woerner <twoerner@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 19, 2022 at 1:43 PM Isabella Basso <isabbasso@riseup.net> wrote=
:
> >> +        * "(K)TAP version XX" should be the first line on all (sub)te=
sts as per
> >> +        * https://www.kernel.org/doc/html/latest/dev-tools/ktap.html#=
version-lines
> >> +        * but actually isn't, as it currently depends on whoever writ=
es the
> >> +        * test to print this info
> >
> > FYI: we're really trying to fix cases of "missing version lines",
> > largely by making the kunit_test_suites() macro work in more
> > circumstances.
> >
> > So while it may be worth still handling the case where this is
> > missing, I don't think there are any tests in the latest versions of
> > the kernel which should have this missing.
>
> I=E2=80=99m not sure if I totally get how these work. Every time I run a =
KUnit test I
> get something like this: https://pastebin.com/7Ff31PMC
>
> As you can see it has been loaded as a module, just like we intend to do =
it
> from IGT, and I see no version lines whatsoever. Am I doing something wro=
ng?

You're doing everything right.

The problem is we only print the version line for the *built-in* tests.
It never gets printed for tests in loadable modules.

Some more details below, if interested.
Specifically, it happens in
https://elixir.bootlin.com/linux/latest/C/ident/kunit_print_tap_header

What David is referring to is we had tests that weren't in modules,
but didn't use the normal built-in code path. Those were also missing
TAP version lines.
But KUnit needs to do better here in the case of modules.

The goal was that you'd be able to parse the result of module based
tests by something like
$ cat /sys/kernel/debug/kunit/*/results | ./tools/testing/kunit/kunit.py pa=
rse
but this doesn't work because of the lack of a version line.

If we add it to each module's test results, then we'll need to update
the parse to allow multiple verison lines, I think.

Daniel
