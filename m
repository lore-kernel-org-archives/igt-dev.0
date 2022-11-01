Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 1 Nov 2022 19:03:49 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Isabella Basso <isabbasso@riseup.net>
Message-ID: <20221101190349.4043db12@maurocar-mobl2>
In-Reply-To: <F263C946-123C-407F-984D-7AC284CC1B29@riseup.net>
References: <20220829000920.38185-1-isabbasso@riseup.net>
 <20220829000920.38185-4-isabbasso@riseup.net>
 <CABVgOS=HO9XAf8C5X7ZD6aTW37r06ify==7AW9a8cpKsgLVfFw@mail.gmail.com>
 <D53B4EB1-1A95-48F1-BF49-8EC0CC7B5418@riseup.net>
 <20221101133323.72101670@maurocar-mobl2>
 <F263C946-123C-407F-984D-7AC284CC1B29@riseup.net>
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
Cc: linux-kselftest@vger.kernel.org, Magali Lemes <magalilemes00@gmail.com>,
 =?UTF-8?B?TWHDrXJh?= Canal <maira.canal@usp.br>,
 Daniel Latypov <dlatypov@google.com>, n@nfraprado.net,
 Brendan Higgins <brendanhiggins@google.com>,
 kernel list <linux-kernel@vger.kernel.org>, leandro.ribeiro@collabora.com,
 igt-dev@lists.freedesktop.org, ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Gow <davidgow@google.com>, Tales Aparecida <tales.aparecida@gmail.com>,
 Shuah Khan <skhan@linuxfoundation.org>,
 =?UTF-8?B?QW5k?= =?UTF-8?B?csOp?= Almeida <andrealmeid@riseup.net>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 1 Nov 2022 14:17:26 -0300
Isabella Basso <isabbasso@riseup.net> wrote:

> Hi, Mauro,
>=20
> > Am 01/11/2022 um 9:33 AM schrieb Mauro Carvalho Chehab <mauro.chehab@li=
nux.intel.com>:
> >=20
> > Hi Isabella,
> >=20
> > On Mon, 19 Sep 2022 17:43:19 -0300
> > Isabella Basso <isabbasso@riseup.net> wrote:
> >  =20
> >>> Do you want to _require_ KUnit be built as a module, rather than buil=
t-in here?   =20
> >>=20
> >> I=E2=80=99ll change the comment and the warning in v3 to clarify this.=
 =20
> >=20
> > When do you intend to submit v3? =20
>=20
> I=E2=80=99m currently waiting for my peers to review some refactorings an=
d test
> things thoroughly. I hope to submit it in a week or two. Sorry it=E2=80=
=99s taking so
> long.

No problem. In the mean time, I'll try to do some tests with the current
version.

Btw, if you want, you can also check the RFC patch I submitted today, adding
KUnit support for i915:

	https://patchwork.freedesktop.org/patch/509448/?series=3D110384&rev=3D1

The tests there are hardware-independent, but they need to be built
using x86_64 arch, due to i915 dependencies.

Regards,
Mauro
