Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Nov 2022 10:29:12 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20221107092912.q7tcsv4gmmsohmx3@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <20221026081711.zj7h2rpfd4kfkpqe@houat>
 <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CAF6AEGs3j7wmjM10o2Dpw4mgTJC7L4SXHPZkJm_DjeQVG5H_vA@mail.gmail.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 08:08:28AM -0700, Rob Clark wrote:
> On Wed, Oct 26, 2022 at 1:17 AM <maxime@cerno.tech> wrote:
> >
> > Hi Rob,
> >
> > On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > > > I've discussing the idea for the past year to add an IGT test suite=
 that
> > > > all well-behaved KMS drivers must pass.
> > > >
> > > > The main idea behind it comes from v4l2-compliance and cec-complian=
ce,
> > > > that are being used to validate that the drivers are sane.
> > > >
> > > > We should probably start building up the test list, and eventually
> > > > mandate that all tests pass for all the new KMS drivers we would me=
rge
> > > > in the kernel, and be run by KCi or similar.
> > >
> > > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > > first, that already gives us a mechanism similar to what we use in
> > > mesa to track pass/fail/flake
> >
> > I'm not sure it's a dependency per-se, and I believe both can (and
> > should) happen separately.
>=20
> Basically my reasoning is that getting IGT green is a process that so
> far is consisting of equal parts IGT test fixes, to clear out
> lingering i915'isms, etc, and driver fixes.  Yes, you could do this
> manually but the drm/ci approach seems like it would make it easier to
> track, so it is easier to see what tests are being run on which hw,
> and what the pass/fail/flake status is.  And the expectation files can
> also be updated as we uprev the igt version being used in CI.
>=20
> I could be biased by how CI has been deployed (IMHO, successfully) in
> mesa.. my experience there doesn't make me see any value in a
> "mustpass" list.  But does make me see value in automating and
> tracking status.  Obviously we want all the tests to pass, but getting
> there is going to be a process.  Tracking that progress is the thing
> that is useful now.

Yeah, I understand where you're coming from, and for CI I agree that
your approach looks like the best one.

It's not what I'm trying to address though.

My issue is that, even though I have a bunch of KMS experience by now,
every time I need to use IGT, I have exactly zero idea what test I
need to run to check that a given driver behaves decently.

I have no idea which tests I should run, which tests are supposed to be
working but can't really because of some intel-specific behavior, which
tests are skipped but shouldn't, which tests are broken but should be,
etc.

I don't want to have a nice table with everything green because there
was no regression, I want to see which bugs I haven't found out are
still lingering in my driver. I've been chasing bugs too many times
where it turned out that there was a test for that in IGT somewhere,
hidden in a 70k tests haystack with zero documentation.

So, yeah, I get what you're saying, it makes sense, and please go
forward with drm/ci. I still think we need to find a beginning of a
solution for the issue I'm talking about.

Maxime
