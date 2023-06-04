Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
References: <20230526130001.71730-1-nunes.erico@gmail.com>
In-Reply-To: <20230526130001.71730-1-nunes.erico@gmail.com>
From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 4 Jun 2023 21:05:56 +0200
Message-ID: <CAK4VdL1Y0pc7=mCnSBwqtawg1WrC3NoSuMQGG0BR-S+TenskDA@mail.gmail.com>
To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Initial tests for the lima drm
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: lima@lists.freedesktop.org, anarsoul@gmail.com, yuq825@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello,

On Fri, May 26, 2023 at 3:00=E2=80=AFPM Erico Nunes <nunes.erico@gmail.com>=
 wrote:
>
> I started working on something for the lima drm driver and realized that
> there is no coverage for it in igt yet. It would be nice to have some to
> check the driver specific ioctls and support that work.
> Here are some to get some basic support and if we can get these in, we
> can follow up with more tests to cover the remaining ioctls.
> I used the panfrost and v3d gem tests as a reference for these initial
> tests.
>
> v2: fixed build after CI failure
>
> Erico Nunes (3):
>   lib: Add support for opening lima devices
>   lib/lima: Add lima helpers
>   tests/lima: Add initial tests for lima
>
>  lib/drmtest.c        |  3 ++
>  lib/drmtest.h        |  1 +
>  lib/igt_lima.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_lima.h       | 26 ++++++++++++
>  lib/meson.build      |  1 +
>  tests/lima_gem_new.c | 78 +++++++++++++++++++++++++++++++++++
>  tests/meson.build    |  1 +
>  7 files changed, 207 insertions(+)
>  create mode 100644 lib/igt_lima.c
>  create mode 100644 lib/igt_lima.h
>  create mode 100644 tests/lima_gem_new.c

Looks like this series got stuck, maybe because there are no owners
for it yet in igt.
Could any of the igt maintainers take a look?

Thanks

Erico
