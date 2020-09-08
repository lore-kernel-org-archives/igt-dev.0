Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B256E45D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2020 10:32:09 +0000 (UTC)
References: <20200908061001.20302-1-karthik.b.s@intel.com>
 <159955024394.21758.8885052579868629604@emeril.freedesktop.org>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <16202cd3-f3fc-b6ad-0d6f-d0fe5f7b34e3@intel.com>
Date: Tue, 8 Sep 2020 16:02:04 +0530
MIME-Version: 1.0
In-Reply-To: <159955024394.21758.8885052579868629604@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fasync=5Fflips=3A_Add_test_to_validate_asynchronous_flips_?=
 =?utf-8?b?KHJldjQp?=
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
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

This looks a false positive.
The patch changes only the kms_async_flips test and does not do changes 
in any other files.

Could you please take a look here.

Thanks,
Karthik.B.S

On 9/8/2020 1:00 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_async_flips: Add test to validate asynchronous flips 
> (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/79701/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_8977 -> IGTPW_4966
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_4966 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_4966, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_4966:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o
> 
>         fi-kbl-r: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@gem_exec_gttfill@basic.html>
> 
>       o
> 
>         fi-bdw-5557u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bdw-5557u/igt@gem_exec_gttfill@basic.html>
> 
>       o
> 
>         fi-skl-6600u: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@gem_exec_gttfill@basic.html>
> 
>       o
> 
>         fi-skl-lmem: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@gem_exec_gttfill@basic.html>
> 
>       o
> 
>         fi-ilk-650: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-ilk-650/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-ilk-650/igt@gem_exec_gttfill@basic.html>
> 
>   *
> 
>     igt@gem_exec_parallel@engines@basic:
> 
>       o
> 
>         fi-cfl-guc: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_parallel@engines@basic.html>
> 
>       o
> 
>         fi-cfl-8109u: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_parallel@engines@basic.html>
> 
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o fi-blb-e6850: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@gem_tiled_fence_blits@basic.html>
>   *
> 
>     igt@i915_selftest@live@gem_execbuf:
> 
>       o fi-bsw-n3050: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@i915_selftest@live@gem_execbuf.html>
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         fi-snb-2600: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@runner@aborted.html>
> 
>       o
> 
>         fi-blb-e6850: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-blb-e6850/igt@runner@aborted.html>
> 
> 
>         Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   * igt@gem_exec_gttfill@basic:
>       o {fi-kbl-7560u}: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-7560u/igt@gem_exec_gttfill@basic.html>
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_4966 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_flink_basic@flink-lifetime:
> 
>       o fi-tgl-y: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@gem_flink_basic@flink-lifetime.html>
>         (i915#402 <https://gitlab.freedesktop.org/drm/intel/issues/402>)
>         +1 similar issue
>   *
> 
>     igt@gem_tiled_fence_blits@basic:
> 
>       o fi-snb-2600: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-snb-2600/igt@gem_tiled_fence_blits@basic.html>
>         (i915#82 <https://gitlab.freedesktop.org/drm/intel/issues/82>)
>   *
> 
>     igt@i915_selftest@live@coherency:
> 
>       o fi-gdg-551: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-gdg-551/igt@i915_selftest@live@coherency.html>
>         -> DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-gdg-551/igt@i915_selftest@live@coherency.html>
>         (i915#1748 <https://gitlab.freedesktop.org/drm/intel/issues/1748>)
>   *
> 
>     igt@kms_busy@basic@flip:
> 
>       o fi-tgl-y: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@kms_busy@basic@flip.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@kms_busy@basic@flip.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) +1
>         similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_exec_gttfill@basic:
> 
>       o
> 
>         fi-cfl-8109u: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@gem_exec_gttfill@basic.html>
> 
>       o
> 
>         fi-cfl-guc: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@gem_exec_gttfill@basic.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@gem_exec_gttfill@basic.html>
> 
>   *
> 
>     igt@gem_exec_parallel@engines@contexts:
> 
>       o fi-bsw-kefka: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-kefka/igt@gem_exec_parallel@engines@contexts.html>
>   *
> 
>     igt@i915_selftest@live@gem_execbuf:
> 
>       o fi-bsw-nick: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-nick/igt@i915_selftest@live@gem_execbuf.html>
>   *
> 
>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       o fi-bsw-n3050: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>         (i915#1982
>         <https://gitlab.freedesktop.org/drm/intel/issues/1982>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-bsw-n3050/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html>
>   *
> 
>     igt@prime_vgem@basic-write:
> 
>       o fi-tgl-y: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-tgl-y/igt@prime_vgem@basic-write.html>
>         (i915#402 <https://gitlab.freedesktop.org/drm/intel/issues/402>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-tgl-y/igt@prime_vgem@basic-write.html>
>         +1 similar issue
> 
> 
>         Warnings
> 
>   *
> 
>     igt@runner@aborted:
> 
>       o
> 
>         fi-kbl-x1275: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-x1275/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186> /
>         i915#1784
>         <https://gitlab.freedesktop.org/drm/intel/issues/1784>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-x1275/igt@runner@aborted.html>
>         (i915#1186 <https://gitlab.freedesktop.org/drm/intel/issues/1186>)
> 
>       o
> 
>         fi-skl-6600u: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-6600u/igt@runner@aborted.html>
>         (i915#2398
>         <https://gitlab.freedesktop.org/drm/intel/issues/2398>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-6600u/igt@runner@aborted.html>
>         (i915#1186 <https://gitlab.freedesktop.org/drm/intel/issues/1186>)
> 
>       o
> 
>         fi-cfl-8109u: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-8109u/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-8109u/igt@runner@aborted.html>
>         (i915#2398 <https://gitlab.freedesktop.org/drm/intel/issues/2398>)
> 
>       o
> 
>         fi-skl-lmem: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-skl-lmem/igt@runner@aborted.html>
>         (i915#2398
>         <https://gitlab.freedesktop.org/drm/intel/issues/2398>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-skl-lmem/igt@runner@aborted.html>
>         (i915#1186 <https://gitlab.freedesktop.org/drm/intel/issues/1186>)
> 
>       o
> 
>         fi-kbl-r: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-r/igt@runner@aborted.html>
>         (i915#1784
>         <https://gitlab.freedesktop.org/drm/intel/issues/1784> /
>         i915#2398
>         <https://gitlab.freedesktop.org/drm/intel/issues/2398>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-r/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186> /
>         i915#1784 <https://gitlab.freedesktop.org/drm/intel/issues/1784>)
> 
>       o
> 
>         fi-kbl-guc: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-kbl-guc/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186> /
>         i915#1784
>         <https://gitlab.freedesktop.org/drm/intel/issues/1784>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-kbl-guc/igt@runner@aborted.html>
>         (i915#1186 <https://gitlab.freedesktop.org/drm/intel/issues/1186>)
> 
>       o
> 
>         fi-cml-s: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cml-s/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cml-s/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186> /
>         i915#2082 <https://gitlab.freedesktop.org/drm/intel/issues/2082>)
> 
>       o
> 
>         fi-cfl-guc: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8977/fi-cfl-guc/igt@runner@aborted.html>
>         (i915#1186
>         <https://gitlab.freedesktop.org/drm/intel/issues/1186>) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/fi-cfl-guc/igt@runner@aborted.html>
>         (i915#2398 <https://gitlab.freedesktop.org/drm/intel/issues/2398>)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> 
>     Participating hosts (44 -> 38)
> 
> Missing (6): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan 
> fi-byt-clapper fi-bdw-samus
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_5779 -> IGTPW_4966
> 
> CI-20190529: 20190529
> CI_DRM_8977: 831856ad1b43884fd9463c03f46b8e0bf78ece85 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_4966: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4966/index.html
> IGT_5779: f52bf19b5f02d52fc3e201c6467ec3f511227fba @ 
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> == Testlist changes ==
> 
> +igt@kms_async_flips@alternate-sync-async-flip
> +igt@kms_async_flips@async-flip-with-page-flip-events
> +igt@kms_async_flips@invalid-async-flip
> +igt@kms_async_flips@test-time-stamp
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
