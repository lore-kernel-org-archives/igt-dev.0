Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 7 Nov 2022 10:30:57 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20221107093057.5w7kdc3pjq77upng@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
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
 igt-dev@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Thomas,

On Fri, Oct 28, 2022 at 09:31:38AM +0200, Thomas Zimmermann wrote:
> Am 24.10.22 um 14:43 schrieb maxime@cerno.tech:
> > I've discussing the idea for the past year to add an IGT test suite that
> > all well-behaved KMS drivers must pass.
> >=20
> > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > that are being used to validate that the drivers are sane.
> >=20
> > We should probably start building up the test list, and eventually
> > mandate that all tests pass for all the new KMS drivers we would merge
> > in the kernel, and be run by KCi or similar.
> >=20
> > I did a first pass to create a draft of such a test-suite, which would
> > contain:
> >=20
> > igt@core_auth@basic-auth
> > igt@core_auth@getclient-master-drop
> > igt@core_auth@getclient-simple
> > igt@core_auth@many-magics
> > igt@core_getclient
> > igt@core_getstats
> > igt@core_getversion
> > igt@core_hotunplug@hotrebind-lateclose
> > igt@core_hotunplug@hotunbind-rebind
> > igt@core_hotunplug@unbind-rebind
> > igt@core_setmaster
> > igt@core_setmaster_vs_auth
> > igt@device_reset@unbind-reset-rebind
> > igt@drm_read
> > igt@dumb_buffer
> > igt@fbdev
>=20
> Maybe we make this test optional? At least sprd decided to not support fb=
dev
> at all.

I'm not sure we need to make that test optional, or at least, we should
run it all the time, but skip it if there's no fbdev emulation, and not
report it as a failure?

Maxime
