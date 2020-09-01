Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948F36E448
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2020 14:50:02 +0000 (UTC)
Date: Tue, 1 Sep 2020 16:49:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20200901144956.GA10717@zkempczy-mobl2>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
 <159889183684.7425.3670644245393193920@emeril.freedesktop.org>
 <20200901064339.GP7444@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200901064339.GP7444@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgUmVtb3Zl?=
 =?utf-8?q?_libdrm_in_rendercopy_=28rev32=29?=
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 09:43:39AM +0300, Petri Latvala wrote:
> On Mon, Aug 31, 2020 at 04:37:16PM +0000, Patchwork wrote:
> > ### IGT changes ###
> > 
> > #### Possible regressions ####
> > 
> >   * igt@gem_sync@basic-store-all:
> >     - shard-tglb:         [PASS][1] -> [FAIL][2]
> >    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8945/shard-tglb7/igt@gem_sync@basic-store-all.html
> >    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-tglb2/igt@gem_sync@basic-store-all.html
> >     - shard-iclb:         [PASS][3] -> [FAIL][4]
> >    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8945/shard-iclb5/igt@gem_sync@basic-store-all.html
> >    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-iclb1/igt@gem_sync@basic-store-all.html
> > 
> >   
> > New tests
> > ---------
> > 
> >   New tests have been introduced between CI_DRM_8945_full and IGTPW_4925_full:
> > 
> > ### New IGT tests (17) ###
> > 
> >   * igt@api_intel_bb@check-canonical:
> >     - Statuses : 5 pass(s) 2 skip(s)
> >     - Exec time: [0.0, 0.01] s
> > 
> >   * igt@api_intel_bb@lot-of-buffers:
> >     - Statuses : 7 pass(s)
> >     - Exec time: [0.69, 4.54] s
> > 
> >   * igt@api_intel_bb@render:
> >     - Statuses :
> >     - Exec time: [None] s
> > 
> >   * igt@api_intel_bb@render-ccs:
> >     - Statuses : 1 incomplete(s) 4 pass(s) 1 skip(s)
> >     - Exec time: [0.0, 0.47] s
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4925/shard-apl8/igt@api_intel_bb@render-ccs.html
> 
> SIGSEGV on that test. And you also revealed an igt_runner bug, that
> should have been reported as CRASH, not INCOMPLETE.
> 
> 
> 
> -- 
> Petri Latvala

Thanks for pointing out, I missed that. I have to check it in APL.

--
Zbigniew
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
