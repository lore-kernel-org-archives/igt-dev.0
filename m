Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0CE6E8B0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Nov 2020 12:01:12 +0000 (UTC)
Date: Fri, 20 Nov 2020 13:01:07 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20201120120107.GA68077@zkempczy-mobl2>
References: <20201119105032.43893-1-zbigniew.kempczynski@intel.com>
 <160578668114.18185.14742444569499339247@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <160578668114.18185.14742444569499339247@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2Cv6=2C1/3=5D__lib/igt=5Fdevice=5Fscan?=
 =?utf-8?q?=3A_Remember_vendor/device_for_pci_devices?=
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 19, 2020 at 11:51:21AM +0000, Patchwork wrote:
>    Patch Details
> 
>    Series:  series starting with [i-g-t,v6,1/3] lib/igt_device_scan: Remember 
>             vendor/device for pci devices                                     
>    URL:     https://patchwork.freedesktop.org/series/84060/                   
>    State:   failure                                                           
>    Details: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5196/index.html    
> 
>               CI Bug Log - changes from CI_DRM_9359 -> IGTPW_5196
> 
> Summary
> 
>    FAILURE
> 
>    Serious unknown changes coming with IGTPW_5196 absolutely need to be
>    verified manually.
> 
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_5196, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in
>    CI.
> 
>    External URL:
>    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5196/index.html
> 
> Possible new issues
> 
>    Here are the unknown changes that may have been introduced in IGTPW_5196:
> 
>   IGT changes
> 
>     Possible regressions
> 
>      * igt@gem_exec_parallel@engines@contexts:
>           * fi-icl-y: PASS -> FAIL

Changes are not related to fail above.

--
Zbigniew

> 
> Known issues
> 
>    Here are the changes found in IGTPW_5196 that come from known issues:
> 
>   IGT changes
> 
>     Issues hit
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * fi-icl-u2: PASS -> DMESG-WARN (i915#1982)
>      * igt@gem_exec_parallel@engines@fds:
> 
>           * fi-icl-y: PASS -> INCOMPLETE (i915#2295 / i915#2398)
>      * igt@gem_linear_blits@basic:
> 
>           * fi-tgl-y: PASS -> DMESG-WARN (i915#402) +1 similar issue
>      * igt@i915_pm_rpm@basic-pci-d3-state:
> 
>           * fi-byt-j1900: PASS -> DMESG-WARN (i915#1982)
>      * igt@kms_pipe_crc_basic@read-crc-pipe-a-frame-sequence:
> 
>           * fi-tgl-y: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> 
>     Possible fixes
> 
>      * igt@core_hotunplug@unbind-rebind:
> 
>           * fi-skl-lmem: DMESG-WARN (i915#2605) -> PASS
> 
>           * fi-tgl-u2: DMESG-WARN (i915#1982) -> PASS
> 
>      * igt@gem_sync@basic-each:
> 
>           * fi-tgl-y: DMESG-WARN (i915#402) -> PASS +2 similar issues
>      * igt@i915_selftest@live@gt_pm:
> 
>           * {fi-kbl-7560u}: DMESG-FAIL (i915#2524) -> PASS
>      * igt@kms_busy@basic@flip:
> 
>           * fi-kbl-soraka: DMESG-WARN (i915#1982) -> PASS
>      * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
> 
>           * fi-icl-u2: DMESG-WARN (i915#1982) -> PASS
> 
>     Warnings
> 
>      * igt@i915_pm_rpm@module-reload:
>           * fi-tgl-y: DMESG-WARN (i915#2411) -> DMESG-WARN (i915#1982 /
>             i915#2411) +1 similar issue
> 
>    {name}: This element is suppressed. This means it is ignored when
>    computing
>    the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (40 -> 35)
> 
>    Missing (5): fi-ilk-m540 fi-tgl-dsi fi-hsw-4200u fi-bsw-cyan fi-bdw-samus
> 
> Build changes
> 
>      * CI: CI-20190529 -> None
>      * IGT: IGT_5858 -> IGTPW_5196
> 
>    CI-20190529: 20190529
>    CI_DRM_9359: 5529f30897761dc08c5cfcefc6d1659f9250d622 @
>    git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_5196: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5196/index.html
>    IGT_5858: 300ee395f5c0ed53ab0757d9c5b311f9c1f641c8 @
>    git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
