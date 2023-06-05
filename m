Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 5 Jun 2023 11:22:10 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Erico Nunes <nunes.erico@gmail.com>
Message-ID: <20230605092210.tyc4imcsvfyifc7z@zkempczy-mobl2>
References: <20230526130001.71730-1-nunes.erico@gmail.com>
 <CAK4VdL1Y0pc7=mCnSBwqtawg1WrC3NoSuMQGG0BR-S+TenskDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK4VdL1Y0pc7=mCnSBwqtawg1WrC3NoSuMQGG0BR-S+TenskDA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/3] Initial tests for the lima drm
 driver
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, anarsoul@gmail.com, yuq825@gmail.com,
 lima@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Jun 04, 2023 at 09:05:56PM +0200, Erico Nunes wrote:
> Hello,
> 
> On Fri, May 26, 2023 at 3:00 PM Erico Nunes <nunes.erico@gmail.com> wrote:
> >
> > I started working on something for the lima drm driver and realized that
> > there is no coverage for it in igt yet. It would be nice to have some to
> > check the driver specific ioctls and support that work.
> > Here are some to get some basic support and if we can get these in, we
> > can follow up with more tests to cover the remaining ioctls.
> > I used the panfrost and v3d gem tests as a reference for these initial
> > tests.
> >
> > v2: fixed build after CI failure
> >
> > Erico Nunes (3):
> >   lib: Add support for opening lima devices
> >   lib/lima: Add lima helpers
> >   tests/lima: Add initial tests for lima
> >
> >  lib/drmtest.c        |  3 ++
> >  lib/drmtest.h        |  1 +
> >  lib/igt_lima.c       | 97 ++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_lima.h       | 26 ++++++++++++
> >  lib/meson.build      |  1 +
> >  tests/lima_gem_new.c | 78 +++++++++++++++++++++++++++++++++++
> >  tests/meson.build    |  1 +
> >  7 files changed, 207 insertions(+)
> >  create mode 100644 lib/igt_lima.c
> >  create mode 100644 lib/igt_lima.h
> >  create mode 100644 tests/lima_gem_new.c
> 
> Looks like this series got stuck, maybe because there are no owners
> for it yet in igt.
> Could any of the igt maintainers take a look?
> 
> Thanks
> 
> Erico

Hi.

I'm not the maintainer but sometimes I put my fingers here and there
so I got a question and a nit. Do you have people involved in the
project who contains the hardware and may verify test is working fine?
And definitely they can better review internal aspects of the test.
IGT imo is correct place to put your tests in, only what I would change
is to create additional 'lima/' directory. We treat 'tests/' directory
as common so your specific driver tests should land to separate dir.
lib/igt_lima.* is fine, but lima_gem_new.c should land to 'lima/'.

--
Zbigniew
