Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A986E4FF
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 23:56:51 +0000 (UTC)
References: <20200129230252.29249-1-antonio.argenziano@intel.com>
 <158034210462.5461.4005769971141766558@emeril.freedesktop.org>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <67c83629-307f-2658-26e8-48a720f23b81@intel.com>
Date: Wed, 29 Jan 2020 15:56:50 -0800
MIME-Version: 1.0
In-Reply-To: <158034210462.5461.4005769971141766558@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fpersistent=5Frelocs=3A_remove_test_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>



On 29/01/20 15:55, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/i915/gem_persistent_relocs: remove test (rev2)
> URL   : https://patchwork.freedesktop.org/series/72746/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_5405 -> IGTPW_4037
> ====================================================
> 
> Summary
> -------
> 
>    **FAILURE**
> 
>    Serious unknown changes coming with IGTPW_4037 absolutely need to be
>    verified manually.
>    
>    If you think the reported changes have nothing to do with the changes
>    introduced in IGTPW_4037, please notify your bug team to allow them
>    to document this new failure mode, which will reduce false positives in CI.
> 
>    External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/index.html
> 
> Possible new issues
> -------------------
> 
>    Here are the unknown changes that may have been introduced in IGTPW_4037:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>    * igt@i915_selftest@live_execlists:
>      - fi-glk-dsi:         [PASS][1] -> [TIMEOUT][2]
>     [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-glk-dsi/igt@i915_selftest@live_execlists.html
>     [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-glk-dsi/igt@i915_selftest@live_execlists.html
> 
>    * igt@kms_flip@basic-flip-vs-dpms:
>      - fi-skl-6770hq:      [PASS][3] -> [INCOMPLETE][4]
>     [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
>     [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-skl-6770hq/igt@kms_flip@basic-flip-vs-dpms.html
> 
>    * igt@runner@aborted:
>      - fi-bsw-nick:        NOTRUN -> [FAIL][5]
>     [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-bsw-nick/igt@runner@aborted.html

I doubt this was me... Can I merge?

Antonio

> 
>    
> Known issues
> ------------
> 
>    Here are the changes found in IGTPW_4037 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>    * igt@gem_close_race@basic-threads:
>      - fi-byt-j1900:       [PASS][6] -> [TIMEOUT][7] ([fdo#112271] / [i915#816])
>     [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-j1900/igt@gem_close_race@basic-threads.html
>     [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-byt-j1900/igt@gem_close_race@basic-threads.html
> 
>    * igt@i915_selftest@live_blt:
>      - fi-hsw-4770r:       [PASS][8] -> [DMESG-FAIL][9] ([i915#553] / [i915#725])
>     [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-4770r/igt@i915_selftest@live_blt.html
>     [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-hsw-4770r/igt@i915_selftest@live_blt.html
> 
>    * igt@i915_selftest@live_execlists:
>      - fi-icl-u2:          [PASS][10] -> [INCOMPLETE][11] ([i915#140])
>     [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-icl-u2/igt@i915_selftest@live_execlists.html
>     [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-icl-u2/igt@i915_selftest@live_execlists.html
>      - fi-icl-dsi:         [PASS][12] -> [INCOMPLETE][13] ([i915#140])
>     [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-icl-dsi/igt@i915_selftest@live_execlists.html
>     [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-icl-dsi/igt@i915_selftest@live_execlists.html
> 
>    
> #### Possible fixes ####
> 
>    * igt@gem_close_race@basic-threads:
>      - fi-hsw-peppy:       [TIMEOUT][14] ([fdo#112271]) -> [PASS][15]
>     [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
>     [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-hsw-peppy/igt@gem_close_race@basic-threads.html
> 
>    * igt@i915_selftest@live_blt:
>      - fi-hsw-4770:        [DMESG-FAIL][16] ([i915#725]) -> [PASS][17]
>     [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-hsw-4770/igt@i915_selftest@live_blt.html
>     [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-hsw-4770/igt@i915_selftest@live_blt.html
> 
>    * igt@i915_selftest@live_execlists:
>      - fi-skl-guc:         [INCOMPLETE][18] -> [PASS][19]
>     [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-skl-guc/igt@i915_selftest@live_execlists.html
>     [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-skl-guc/igt@i915_selftest@live_execlists.html
> 
>    * igt@kms_chamelium@hdmi-hpd-fast:
>      - fi-kbl-7500u:       [FAIL][20] ([fdo#111096] / [i915#323]) -> [PASS][21]
>     [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
>     [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
> 
>    
> #### Warnings ####
> 
>    * igt@gem_exec_parallel@contexts:
>      - fi-byt-n2820:       [FAIL][22] ([i915#694]) -> [TIMEOUT][23] ([fdo#112271])
>     [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
>     [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-byt-n2820/igt@gem_exec_parallel@contexts.html
> 
>    * igt@i915_selftest@live_blt:
>      - fi-ivb-3770:        [DMESG-FAIL][24] ([i915#725]) -> [DMESG-FAIL][25] ([i915#770])
>     [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-ivb-3770/igt@i915_selftest@live_blt.html
>     [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-ivb-3770/igt@i915_selftest@live_blt.html
> 
>    * igt@i915_selftest@live_execlists:
>      - fi-icl-y:           [DMESG-FAIL][26] ([fdo#108569]) -> [INCOMPLETE][27] ([i915#140])
>     [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5405/fi-icl-y/igt@i915_selftest@live_execlists.html
>     [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/fi-icl-y/igt@i915_selftest@live_execlists.html
> 
>    
>    [fdo#108569]: https://bugs.freedesktop.org/show_bug.cgi?id=108569
>    [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
>    [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
>    [i915#140]: https://gitlab.freedesktop.org/drm/intel/issues/140
>    [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
>    [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
>    [i915#694]: https://gitlab.freedesktop.org/drm/intel/issues/694
>    [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
>    [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
>    [i915#816]: https://gitlab.freedesktop.org/drm/intel/issues/816
> 
> 
> Participating hosts (46 -> 46)
> ------------------------------
> 
>    Additional (6): fi-bdw-gvtdvm fi-snb-2520m fi-gdg-551 fi-elk-e7500 fi-bsw-nick fi-skl-6700k2
>    Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-kbl-7560u fi-tgl-y fi-bdw-samus
> 
> 
> Build changes
> -------------
> 
>    * CI: CI-20190529 -> None
>    * IGT: IGT_5405 -> IGTPW_4037
> 
>    CI-20190529: 20190529
>    CI_DRM_7838: d3d96beea538c8de906a1c4d7e6793a47d17a471 @ git://anongit.freedesktop.org/gfx-ci/linux
>    IGTPW_4037: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/index.html
>    IGT_5405: add505d102f5d27e38cb4d926524664e161c2a1a @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
> 
> == Testlist changes ==
> 
> -igt@gem_persistent_relocs@forked
> -igt@gem_persistent_relocs@forked-interruptible
> -igt@gem_persistent_relocs@forked-interruptible-thrashing
> -igt@gem_persistent_relocs@forked-interruptible-thrash-inactive
> -igt@gem_persistent_relocs@forked-thrashing
> -igt@gem_persistent_relocs@forked-thrash-inactive
> -igt@gem_persistent_relocs@interruptible
> -igt@gem_persistent_relocs@normal
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4037/index.html
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
