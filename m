Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE97B6E46E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2020 15:22:45 +0000 (UTC)
Date: Wed, 9 Sep 2020 18:22:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200909152239.GN6112@intel.com>
References: <20200908061001.20302-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908061001.20302-1-karthik.b.s@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v6] tests/kms_async_flips: Add test to
 validate asynchronous flips
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Karthik B S <karthik.b.s@intel.com>
Cc: michel@daenzer.net, igt-dev@lists.freedesktop.org, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 11:40:01AM +0530, Karthik B S wrote:
> Asynchronous flips are issued using the page flip IOCTL.
> The test consists of two subtests. The first subtest waits for
> the page flip event to be received before giving the next flip,
> and the second subtest doesn't wait for page flip events.
> =

> The test passes if the IOCTL is successful.
> =

> v2: -Add authors in the test file. (Paulo)
>     -Reduce the run time and timeouts to suit IGT needs. (Paulo)
>     -Replace igt_debug's with igt_assert's to catch slow flips. (Paulo)
>     -Follow IGT coding style regarding spaces. (Paulo)
>     -Make set up code part of igt_fixture. (Paulo)
>     -Skip the test if async flips are not supported. (Paulo)
>     -Replace suggested-by. (Paulo)
>     -Added description for test and subtests.
> =

> v3: -Rename the test to kms_async_flips. (Paulo)
>     -Modify the TODO comment. (Paulo)
>     -Remove igt_debug in flip_handler. (Paulo)
>     -Use drmIoctl() in has_async function. (Paulo)
>     -Add more details in igt_assert in flip_handler. (Paulo)
>     -Remove flag variable in flip_handler. (Paulo)
>     -Call igt_assert in flip_handler after the warm up time.
> =

> v4: -Calculate the time stamp in flip_handler from userspace, as the
>      kernel will return vbl timestamps and this cannot be used
>      for async flips.
>     -Add a new subtest to verify that the async flip time stamp
>      lies in between the previous and next vblank time stamp. (Daniel)
> =

> v5: -Add test that alternates between sync and async flips. (Ville)
>     -Add test to verify invalid async flips. (Ville)
>     -Remove the subtest async-flip-without-page-flip-events. (Michel)
>     -Remove the intel gpu restriction and make the test generic. (Michel)
> =

> v6: -Change the THRESHOLD from 10 to 8 as failures are seen on CI
>      on platforms <=3D gen10.
>     -In older platforms(<=3D gen10), async address update bit in plane ctl
>      is double buffered. Made changes in subtests to accomodate this.

It actually used to work correctly until skl (I suspect) broke it.

I cobbled together some async flip support for intel_display_poller:
git://github.com/vsyrjala/intel-gpu-tools.git async_flip_2
which can be used to observe the hardware behaviour.

So far I tried this on g4x, chv and snb. All appear to work correctly.
My cfl however is broken. Still need to check bdw to make sure it reall
is skl where it broke.

This is actually a real problem for skl. We can probably accept that
the first async flip actually ends up being a sync flip. Just a minor
inconvenience really. The other direction is much more critical since
the first sync flip after an async flip now also turns into an async
flip. That means we're now going to try to update all kinds of
plane/crtc state using an async flip, which is illegal.

So far the only idea I have for a workaround is:
1. do an extra flip internally to toggle the async bit back to 0
2. wait for the async flip from the previous step to finish
3. proceed with the normal commit for the sync flip, which will now
   be a real sync flip sinc we alreaydy flipped the bit

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
