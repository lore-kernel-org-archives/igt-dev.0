Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 832406E170
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Aug 2020 07:53:07 +0000 (UTC)
Date: Mon, 24 Aug 2020 10:42:09 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200824074209.GF7444@platvala-desk.ger.corp.intel.com>
References: <20200821163928.1072379-1-michel@daenzer.net>
 <159803492175.16198.892699385799556109@emeril.freedesktop.org>
 <1f2bafb1-e3c2-8295-c8c1-816410759f41@daenzer.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f2bafb1-e3c2-8295-c8c1-816410759f41@daenzer.net>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=3A_Turn_off_pipe_as_well_if_all_planes_are_off?=
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
To: Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, Aug 22, 2020 at 11:08:15AM +0200, Michel D=E4nzer wrote:
> On 2020-08-21 8:35 p.m., Patchwork wrote:
> > =

> > Possible new issues
> > -------------------
> > =

> >   Here are the unknown changes that may have been introduced in IGTPW_4=
902_full:
> > =

> > ### IGT changes ###
> > =

> > #### Possible regressions ####
> > =

> >   * igt@kms_big_fb@linear-32bpp-rotate-0:
> >     - shard-tglb:         [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8913/shard-tglb=
5/igt@kms_big_fb@linear-32bpp-rotate-0.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4902/shard-tglb5=
/igt@kms_big_fb@linear-32bpp-rotate-0.html
> =

> This is a false positive, since my series doesn't affect this test.

Yep. Lakshmi, see above.


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
