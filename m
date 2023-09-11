Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3356110E0C8
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Sep 2023 07:51:22 +0000 (UTC)
Message-ID: <326f21bb-1c2b-db10-bf54-e0ca83e92bb3@linux.intel.com>
Date: Mon, 11 Sep 2023 09:50:51 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org
References: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
 <169420070241.14896.15682482918777177241@emeril.freedesktop.org>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <169420070241.14896.15682482918777177241@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgbGliL3hl?=
 =?utf-8?q?=5Fspin=3A_introduced_fixed_duration_xe=5Fspin_=28rev4=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 9/8/2023 9:18 PM, Patchwork wrote:
> *Patch Details*
> *Series:*	lib/xe_spin: introduced fixed duration xe_spin (rev4)
> *URL:*	https://patchwork.freedesktop.org/series/122624/ 
> <https://patchwork.freedesktop.org/series/122624/>
> *State:*	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html 
> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html>
> 
> 
>   CI Bug Log - changes from IGT_7477 -> IGTPW_9758
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_9758 absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_9758, please notify your bug team 
> (lgci.bug.filing@intel.com) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html
> 
> 
>     Participating hosts (42 -> 39)
> 
> Missing (3): fi-kbl-soraka fi-hsw-4770 fi-snb-2520m
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in IGTPW_9758:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1:
>       o bat-dg2-8: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-8/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-1.html>
> 


Unrelated to the change.

-- 
Marcin
> 
>     Known issues
> 
> Here are the changes found in IGTPW_9758 that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@i915_selftest@live@gt_heartbeat:
> 
>       o fi-glk-j4005: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html> (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>   *
> 
>     igt@i915_selftest@live@gt_lrc:
> 
>       o bat-dg2-11: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/bat-dg2-11/igt@i915_selftest@live@gt_lrc.html> (i915#7609 <https://gitlab.freedesktop.org/drm/intel/issues/7609> / i915#7913 <https://gitlab.freedesktop.org/drm/intel/issues/7913>)
> 
> 
>     Build changes
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_7477 -> IGTPW_9758
> 
> CI-20190529: 20190529
> CI_DRM_13613: 25ec37710fd81562fd25eccebaac156d9334ff0c @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_9758: 9758
> IGT_7477: 7477
> 
> 
>     Testlist changes
> 
> +igt@xe_spin_batch@spin-fixed-duration
> 
