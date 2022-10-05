Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B2710E466
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Oct 2022 08:03:03 +0000 (UTC)
Date: Wed, 5 Oct 2022 10:02:57 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20221005100257.2bcad6ad@maurocar-mobl2>
In-Reply-To: <Yz02HL4ue1N1O4hi@zkempczy-mobl2>
References: <cover.1664173031.git.mchehab@kernel.org>
 <50da9d5c006ba73f8464eb0cee1e40257a00486e.1664173031.git.mchehab@kernel.org>
 <Yz02HL4ue1N1O4hi@zkempczy-mobl2>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH 01/76] lib: Introduce typed cleanups
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

On Wed, 5 Oct 2022 09:45:32 +0200
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> > +void igt_cleanup_fd(volatile int *fd);
> > +#define igt_fd_t(x__) \
> > +	volatile int x__ cleanup_with(igt_cleanup_fd) =3D IGT_OUTER_SCOPE_INI=
T(-1) =20
>=20
> Why do we need volatile here? Variable after initalization (open) likely =
won't
> be touched (until exiting its scope) so what's the risk?

With current gcc versions, volatile is not needed, but this fails with
clang. The real problem is that C spec doesn't define what happens
with an automatic stack variable after doing a longjmp.

=46rom Petri's feedback, the only solution that works is to declare
such variables as volatile.

Regards,
Mauro
