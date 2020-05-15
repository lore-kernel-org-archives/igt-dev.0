Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEBB86ECEA
 for <igt-dev@lists.freedesktop.org>; Fri, 15 May 2020 18:52:23 +0000 (UTC)
Date: Fri, 15 May 2020 21:52:20 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200515185220.GN6112@intel.com>
References: <20181213105734.32617-1-ville.syrjala@linux.intel.com>
 <158956647040.26211.8314577379076963373@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <158956647040.26211.8314577379076963373@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL2Rl?=
 =?utf-8?q?bugfs=3A_Sanity_check_even_discarded_CRCs_=28rev3=29?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 15, 2020 at 06:14:30PM -0000, Patchwork wrote:
> =3D=3D Series Details =3D=3D
> =

> Series: lib/debugfs: Sanity check even discarded CRCs (rev3)
> URL   : https://patchwork.freedesktop.org/series/53982/
> State : failure
> =

> =3D=3D Summary =3D=3D
> =

> CI Bug Log - changes from CI_DRM_8488_full -> IGTPW_4574_full
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> =

> Summary
> -------
> =

>   **FAILURE**
> =

>   Serious unknown changes coming with IGTPW_4574_full absolutely need to =
be
>   verified manually.
>   =

>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_4574_full, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in=
 CI.
> =

>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/index=
.html
> =

> Possible new issues
> -------------------
> =

>   Here are the unknown changes that may have been introduced in IGTPW_457=
4_full:
> =

> ### IGT changes ###
> =

> #### Possible regressions ####
> =

>   * igt@gem_ctx_ringsize@idle@rcs0:
>     - shard-iclb:         [PASS][1] -> [INCOMPLETE][2]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb8/=
igt@gem_ctx_ringsize@idle@rcs0.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb5/i=
gt@gem_ctx_ringsize@idle@rcs0.html
> =

>   * igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge:
>     - shard-iclb:         [PASS][3] -> [WARN][4] +33 similar issues
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8488/shard-iclb8/=
igt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4574/shard-iclb8/i=
gt@kms_cursor_edge_walk@pipe-a-256x256-bottom-edge.html

Somewhat surprising result. kms_cursor_edge_walk sees zeroed
crcs all the time, but no other test ever sees them. Wasn't
quite expecting that.

Hmm. Now that I think about it IIRC there was some problem
with CRCs when all planes are turned off. I think the spec
even says the dmux crc source shouldn't be used with all planes
turned off, but I seem to recall the problem only manifesting
for a single frame when transitioning between no-planes vs. some
planes.

However I don't think kms_cursor_edge_walk should even be turning
off all the planes. This would seem to need a deeper investigation.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
