Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com
 [64.147.123.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5622610E485
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Oct 2022 08:25:50 +0000 (UTC)
From: maxime@cerno.tech
Date: Wed, 26 Oct 2022 10:17:11 +0200
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20221026081711.zj7h2rpfd4kfkpqe@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > I've discussing the idea for the past year to add an IGT test suite that
> > all well-behaved KMS drivers must pass.
> >
> > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > that are being used to validate that the drivers are sane.
> >
> > We should probably start building up the test list, and eventually
> > mandate that all tests pass for all the new KMS drivers we would merge
> > in the kernel, and be run by KCi or similar.
>=20
> Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> first, that already gives us a mechanism similar to what we use in
> mesa to track pass/fail/flake

I'm not sure it's a dependency per-se, and I believe both can (and
should) happen separately.

AFAIU, the CI patches are here to track which tests are supposed to be
working and which aren't so that we can track regressions.

The list I was talking about is here to identify issues in the first
place. All tests must pass, and if one fails it should be considered a
hard failure.

This would be eligible for CI only for drivers which have been known to
pass them all already, but we wouldn't need to track which ones can fail
or not, all of them must.

> Beyond that, I think some of the igt tests need to get more stable
> before we could consider a "mustpass" list.

I agree that IGT tests could get more stable on ARM platforms, but it's
also a chicken-and-egg issue. If no-one is using them regularly on ARM,
then they'll never get fixed.

> The kms_lease tests seem to fail on msm due to bad assumptions in the
> test about which CRTCs primary planes can attach to. The legacy-cursor
> crc tests seem a bit racy (there was a patch posted for that, not sure
> if it landed yet), etc.

And this is fine, we can merge that list without them, and if and when
they get stable, we'll add them later.

> The best thing to do is actually start running CI and tracking xfails
> and flakes ;-)

Again, I wouldn't oppose them.

The issue I'm trying to solve is that there's just no way to know, at
the moment:

  - When you're running IGT, which tests are relevant for your platform
    exactly.

  - If some of them fail, is it expected for them to fail or not. The
    ci/ patch you mentioned help for that a bit, but only for platforms
    where someone already did that work. When you want to do that work
    in the first place, it's extremely tedious and obscure.

  - And if some of them fail, is it something that I should actually fix
    or not.

The mustpass list addresses all those issues by providing a baseline.

Maxime
