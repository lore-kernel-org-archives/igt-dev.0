Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E406EB20
 for <igt-dev@lists.freedesktop.org>; Tue,  4 May 2021 15:13:21 +0000 (UTC)
Date: Tue, 4 May 2021 18:13:11 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJFkhyFk3bTceeqf@intel.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
 <161974412821.17884.14333591157395148453@emeril.freedesktop.org>
 <20210504150058.GB30246@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210504150058.GB30246@ideak-desk.fi.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Ffb=3A_A_few_changes_to_fix_test_runs_on_ADL=5FP?=
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, May 04, 2021 at 06:00:58PM +0300, Imre Deak wrote:
> On Fri, Apr 30, 2021 at 12:55:28AM +0000, Patchwork wrote:
> > =3D=3D Series Details =3D=3D
> > =

> > Series: lib/igt_fb: A few changes to fix test runs on ADL_P
> > URL   : https://patchwork.freedesktop.org/series/89668/
> > State : failure
> > =

> > =3D=3D Summary =3D=3D
> > =

> > CI Bug Log - changes from CI_DRM_10028_full -> IGTPW_5771_full
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> > =

> > Summary
> > -------
> > =

> >   **FAILURE**
> > =

> >   Serious unknown changes coming with IGTPW_5771_full absolutely need t=
o be
> >   verified manually.
> >   =

> >   If you think the reported changes have nothing to do with the changes
> >   introduced in IGTPW_5771_full, please notify your bug team to allow t=
hem
> >   to document this new failure mode, which will reduce false positives =
in CI.
> > =

> >   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/ind=
ex.html
> > =

> > Possible new issues
> > -------------------
> > =

> >   Here are the unknown changes that may have been introduced in IGTPW_5=
771_full:
> > =

> > ### IGT changes ###
> > =

> > #### Possible regressions ####
> > =

> >   * igt@kms_plane@pixel-format-pipe-a-planes:
> >     - shard-tglb:         [PASS][1] -> [SKIP][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10028/shard-tgl=
b3/igt@kms_plane@pixel-format-pipe-a-planes.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5771/shard-tglb7=
/igt@kms_plane@pixel-format-pipe-a-planes.html
> =

> Test requirement not met in function test_format_plane, file ../tests/kms=
_plane.c:912:
> Test requirement: num_unique_crcs(ref_crc[PLANAR_CRC_SET], data->num_colo=
rs) > 1
> =

> after a bunch of CRC mismatches, so I suppose the CRC generation gets
> stuck at one point.
> =

> It's on the same path this patchset changes, however on TGL the patchset
> should have no functional change: the stride calculated by
> __intel_buf_init() and the stride passed to it by
> igt_fb_create_intel_buf() always match based on my tests. After testing
> the same CI testlist locally on 2 TGLs, I also rerun the testlist where
> this problem didn't happen:

There's definitely something hinky going on with tgl since kms_big_fb
is also failing atm in ci. But dunno if that's related or not.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
