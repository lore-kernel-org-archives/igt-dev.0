Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3C410EA1F
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jan 2022 11:13:49 +0000 (UTC)
Date: Mon, 24 Jan 2022 13:13:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <Ye6J6ZhEZPX25BS7@intel.com>
References: <20220121134833.28740-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220121134833.28740-1-swati2.sharma@intel.com>
Subject: Re: [igt-dev] [v2 0/6] Addition of new plane scaling test cases
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Swati Sharma <swati2.sharma@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jan 21, 2022 at 07:18:27PM +0530, Swati Sharma wrote:
> In this series, combination of downscaling and upscaling testcases
> are added.
>=20
>     v2:-Minor fixes, to prevent CI crashes
>=20
> Swati Sharma (6):
>   tests/kms_plane_scaling: Removal of plane-scaling subtest
>   tests/kms_plane_scaling: Add output name in dynamic subtests
>   tests/kms_plane_scaling: Upscaling on 2 planes
>   tests/kms_plane_scaling: Downscaling on 2 planes
>   tests/kms_plane_scaling: Upscaling and downscaling scenario
>   tests/kms_plane_scaling: Add negative test to check num of scalers

Seems quite a lot of i915isms still here. Also not sure these tests
are prticualrly useful without crcs.

If this stuff is actually considered useful I propose we generalize
it into someting more like:
- subtest for testing each plane individually (can probable speed it
  up a bit for i915 by checking 1 plane per "class" like we do in
  a bunch of the other tests).
- subtest for each N plane scaling combo, probably favoring the
  "overlay" planes and adding the primary plane only last, as it
  seems more likely that those support scaling instead of the
  primary plane

Though what we really want is crc based tests that actually make
sure we get the correct stuf on screen. On platforms where we have
the nearest neighbour scaling we should be able to do this properly.
For other platforms we could use solid color fbs and still at least
make sure we didn't get any underruns.

--=20
Ville Syrj=E4l=E4
Intel
