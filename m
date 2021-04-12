Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CAC36E03E
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 03:51:47 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 12 Apr 2021 03:51:40 +0000
Message-ID: <SN6PR11MB3327DD0D5044C9D630FEB7B98D709@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210409193048.6857-1-bhanuprakash.modem@intel.com>
 <CAKMK7uGBoVRHEHgBr5rfgMW3qT6Rx1Hu7sgi-d_=i0M7Vy7LRQ@mail.gmail.com>
In-Reply-To: <CAKMK7uGBoVRHEHgBr5rfgMW3qT6Rx1Hu7sgi-d_=i0M7Vy7LRQ@mail.gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Fix mode selection for 2x tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, "Deak, Imre" <imre.deak@intel.com>, "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: Daniel Vetter <daniel.vetter@ffwll.ch>
> Sent: Saturday, April 10, 2021 1:48 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: IGT development <igt-dev@lists.freedesktop.org>
> Subject: Re: [igt-dev] [PATCH i-g-t 0/5] Fix mode selection for 2x tests
> 
> On Fri, Apr 9, 2021 at 1:39 PM Bhanuprakash Modem
> <bhanuprakash.modem@intel.com> wrote:
> >
> > When two monitors connected through MST, the second monitor also
> > tries to use the same mode. So two such modes may not fit into the
> > link bandwidth.
> >
> > This series will find a combination of modes that fit into the BW.
> >
> > By parsing the PATH property, we can add a link_group_id field to
> > igt_output_t to identify all connectors that shares the BW of the
> > same link.
> >
> > Parsing the PATH property consists of finding all connectors with
> > the same X prefix in the X-Y[-Z...] path property format and assigning
> > a unique non-zero link_group_id to all such connectors. Connectors
> > without a PATH property are not an MST output, so their link_group_id
> > can be left at 0.
> >
> > IGT core helper would override the mode on all connectors that will
> > be modeset by the next igt_display_commit() call in the test. These
> > are all the connectors in igt_display_t that have a pending_pipe set
> > by the test up to the point of calling this helper.
> >
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> 
> Uh this is really not how kms is supposed to work. There are _tons_ of
> reasons why 2 crtc at the same time wont work, mst bw constraint is
> just one.
> 
> If you want to fix this, this should be fixed with atomic TEST_ONLY
In fact, we are doing the same in this series.

By parsing the PATH connector prop, igt_output_refresh() will update the
link_group_id field for each connector [1]. 

Each individual (Nx)-test will identify the connectors those are sharing
the MST bw (by reading the link_group_id field in igt_output_t), and call
the helper to find the suitable modes [2].

A helper function iterates through those N output/mode combinations. And
find the combination using the most BW by ATOMIC_TEST_ONLY and returned
to the test [3].

Am I missing anything?

[1]: https://patchwork.freedesktop.org/patch/427718
[2]: https://patchwork.freedesktop.org/patch/427720
[3]: https://patchwork.freedesktop.org/patch/427719
 N : 2,3,4,...

-Bhanu
> mode to figure out what works and what doesn't. Not by trying to
> re-implement the kernel's atomic_check configuration validation,
> because you just can't do that.
> 
> So nack on architectural reasons on this approach.
> -Daniel
> 
> >
> > Bhanuprakash Modem (5):
> >   lib/igt_kms: Add a support to read PATH connector property
> >   lib/igt_kms: Identify outputs that shares link bandwidth
> >   lib/igt_kms: helper to override the mode on all connectors
> >   tests/kms_frontbuffer_tracking: Fix mode selection for 2x tests
> >   tests/kms_cursor_legacy: Fix mode selection for 2x tests
> >
> >  lib/igt_kms.c                    | 71 ++++++++++++++++++++++++++++++++
> >  lib/igt_kms.h                    |  3 ++
> >  tests/kms_cursor_legacy.c        | 53 ++++++++++++++++++++++--
> >  tests/kms_frontbuffer_tracking.c | 35 ++++++++++++++++
> >  4 files changed, 159 insertions(+), 3 deletions(-)
> >
> > --
> > 2.20.1
> >
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> 
> 
> 
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
