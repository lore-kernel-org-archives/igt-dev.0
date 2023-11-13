Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-4317.proton.ch (mail-4317.proton.ch [185.70.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD18110E33F
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Nov 2023 10:31:11 +0000 (UTC)
Date: Mon, 13 Nov 2023 10:30:55 +0000
To: juhapekka.heikkila@gmail.com
From: Simon Ser <contact@emersion.fr>
Message-ID: <i8_3cM1wQXQV0rRJ1PxYHAe03idImtlCfV5UXOCcGrCxTt0ta1pjY0SuhPZvLTIyXqtLco3NawRlMKPy5ANYBwChb6oXvdQ2xcAKLF6QPdo=@emersion.fr>
In-Reply-To: <7e113968-b406-4753-a407-a7fc8ee3e908@gmail.com>
References: <20231113094353.1232575-1-bhanuprakash.modem@intel.com>
 <8HEEyr-hZOCEfFX_B7QVCqB5hDIu6JDdaZPl1vyqw6Ep-AMyApTLBdgROVNAKPiKb6fXfAr-Yqz-HcQ4evk3knZ-lGv5F9xjpILCCztDf4c=@emersion.fr>
 <11ff717a-06d2-49fd-b73d-0a372f1c80c8@gmail.com>
 <-X2kuWRq8oIQ1Lco4I-MR9aiuCxru-OYWgvZpjoaH-Vhou2l_0l7ojH97Xet1fRob4VpnlImB3BpP-lC0rTo80o4-xAYiK2hbo1_YgyD2ew=@emersion.fr>
 <7e113968-b406-4753-a407-a7fc8ee3e908@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [i-g-t] Revert "syncobj_timeline: don't expect EINVAL
 for WAIT_UNSUBMITTED, | WAIT_AVAILABLE"
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

On Monday, November 13th, 2023 at 11:06, Juha-Pekka Heikkila <juhapekka.hei=
kkila@gmail.com> wrote:

> On 13.11.2023 12.02, Simon Ser wrote:
>=20
> > On Monday, November 13th, 2023 at 10:59, Juha-Pekka Heikkila juhapekka.=
heikkila@gmail.com wrote:
> >=20
> > > On 13.11.2023 11.55, Simon Ser wrote:
> > >=20
> > > > NACK. Please fix your docs/testplan/i915_tests.rst instead.
> > >=20
> > > Let's do fixes outside of master branch where it doesn't bother other=
s.
> >=20
> > Sorry, but no. This commit fixes a bug already. The CI regression is
> > completely unrelated, and Intel-specific, I really don't understand why
> > it happens in the first place.
> >=20
> > Is it by design that actual bug fixes break Intel CI?
>=20
> As is this is blocking others totally unrelated to this. This patch
> never passed ci in the first place hence never should've been merged.
> Let's fix it somewhere else than on everyone's build machines independent=
ly.

If we want a quick fix, we can disable the broken Intel CI, instead of
reverting a completely correct bugfix.
