Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F5FF6E9E3
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Oct 2021 05:02:13 +0000 (UTC)
Date: Fri, 29 Oct 2021 07:02:09 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211029050209.GA4112@zkempczy-mobl2>
References: <20211028182322.34133-1-zbigniew.kempczynski@intel.com>
 <163545549441.4339.8853193205288038090@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163545549441.4339.8853193205288038090@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbmdl?=
 =?utf-8?q?_gem=5Fsync_to_no-reloc?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 09:11:34PM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  Change gem_sync to no-reloc                                    
>    URL:     https://patchwork.freedesktop.org/series/96401/                
>    State:   failure                                                        
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6362/index.html 
> 
>               CI Bug Log - changes from CI_DRM_10809 -> IGTPW_6362
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_6362 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_6362, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6362/index.html
> 
> Participating hosts (36 -> 34)
> 
>    Additional (1): fi-pnv-d510
>    Missing (3): bat-adlp-4 bat-dg1-6 bat-dg1-5
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_6362:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * fi-kbl-8809g: PASS -> INCOMPLETE
>      * igt@kms_addfb_basic@too-high:
> 
>           * fi-kbl-8809g: PASS -> FAIL +2 similar issues
>      * igt@kms_force_connector_basic@force-connector-state:
> 
>           * fi-kbl-8809g: PASS -> DMESG-FAIL
>      * igt@kms_force_connector_basic@force-edid:
> 
>           * fi-kbl-8809g: PASS -> CRASH

It seems problem occurs on kbl and is not related to test I've changed.

--
Zbigniew


> 
> Known issues
> 
>    Here are the changes found in IGTPW_6362 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@kms_addfb_basic@unused-modifier:
> 
>           * fi-kbl-8809g: PASS -> SKIP (fdo#109271) +18 similar issues
>      * igt@prime_vgem@basic-userptr:
> 
>           * fi-pnv-d510: NOTRUN -> SKIP (fdo#109271) +53 similar issues
>      * igt@runner@aborted:
> 
>           * fi-kbl-8809g: NOTRUN -> FAIL (i915#2283 / i915#2426 / i915#3363 /
>             i915#4312)
> 
>     Possible fixes
> 
>      * igt@gem_exec_suspend@basic-s3:
> 
>           * fi-tgl-1115g4: FAIL (i915#1888) -> PASS
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-b:
> 
>           * fi-kbl-8809g: SKIP (fdo#109271) -> PASS +15 similar issues
>      * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-d:
> 
>           * fi-kbl-8809g: SKIP (fdo#109271 / i915#533) -> PASS
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_6264 -> IGTPW_6362
> 
>    CI-20190529: 20190529
>    CI_DRM_10809: 9959c5de92d04f2336d749a5a331799aa41cfb1f @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_6362: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6362/index.html
>    IGT_6264: 3458490c14afe3cb8aa873fa9e520e1c815ea068 @
>    https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
