Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546BF6E2A3
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 12:04:05 +0000 (UTC)
Date: Thu, 28 Oct 2021 15:02:42 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YXqRYl1YVp5LKOp5@platvala-desk.ger.corp.intel.com>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
 <163542067104.4340.13995173589313503127@emeril.freedesktop.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <163542067104.4340.13995173589313503127@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbmdl?=
 =?utf-8?q?_duplicate_names?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 11:31:11AM +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Change duplicate names
> URL   : https://patchwork.freedesktop.org/series/96381/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from CI_DRM_10806 -> IGTPW_6360
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_6360 absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_6360, please notify your bug team to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html
> 
> Participating hosts (35 -> 32)
> ------------------------------
> 
>   Additional (1): fi-pnv-d510 
>   Missing    (4): bat-adlp-4 fi-kbl-8809g bat-dg1-6 bat-dg1-5 
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_6360:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@i915_selftest@live@hangcheck:
>     - fi-icl-u2:          [PASS][1] -> [DMESG-WARN][2] +1 similar issue
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@hangcheck.html
>    [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@hangcheck.html


Lakshmi, false positives here.


-- 
Petri Latvala



> 
>   
> Known issues
> ------------
> 
>   Here are the changes found in IGTPW_6360 that come from known issues:
> 
> ### IGT changes ###
> 
> #### Issues hit ####
> 
>   * igt@i915_pm_rpm@module-reload:
>     - fi-icl-u2:          [PASS][3] -> [FAIL][4] ([i915#3049])
>    [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
>    [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_pm_rpm@module-reload.html
> 
>   * igt@i915_selftest@live@objects:
>     - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([i915#2867]) +3 similar issues
>    [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10806/fi-icl-u2/igt@i915_selftest@live@objects.html
>    [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-icl-u2/igt@i915_selftest@live@objects.html
> 
>   * igt@prime_vgem@basic-userptr:
>     - fi-pnv-d510:        NOTRUN -> [SKIP][7] ([fdo#109271]) +53 similar issues
>    [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/fi-pnv-d510/igt@prime_vgem@basic-userptr.html
> 
>   
>   {name}: This element is suppressed. This means it is ignored when computing
>           the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
>   [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
>   [i915#2867]: https://gitlab.freedesktop.org/drm/intel/issues/2867
>   [i915#3049]: https://gitlab.freedesktop.org/drm/intel/issues/3049
>   [i915#3303]: https://gitlab.freedesktop.org/drm/intel/issues/3303
> 
> 
> Build changes
> -------------
> 
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6262 -> IGTPW_6360
> 
>   CI-20190529: 20190529
>   CI_DRM_10806: c5b79188b859e8ba29efe0637a3897f7cccd4f99 @ git://anongit.freedesktop.org/gfx-ci/linux
>   IGTPW_6360: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html
>   IGT_6262: d1c793b26e31cc6ae3f9fa3239805a9bbcc749fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> 
> 
> 
> == Testlist changes ==
> 
> +igt@gem_exec_whisper@contexts-engine
> +igt@gem_exec_whisper@contexts-forked-engine
> +igt@gem_exec_whisper@contexts-interruptible-engine
> +igt@gem_exec_whisper@contexts-priority-engine
> +igt@gem_exec_whisper@contexts-sync-engine
> +igt@gem_exec_whisper@fds-engine
> +igt@gem_exec_whisper@fds-forked-engine
> +igt@gem_exec_whisper@fds-interruptible-engine
> +igt@gem_exec_whisper@fds-priority-engine
> +igt@gem_exec_whisper@fds-sync-engine
> +igt@gem_exec_whisper@forked-engine
> +igt@gem_exec_whisper@interruptible-engine
> +igt@gem_exec_whisper@normal-engine
> +igt@gem_exec_whisper@queues-engine
> +igt@gem_exec_whisper@queues-forked-engine
> +igt@gem_exec_whisper@queues-interruptible-engine
> +igt@gem_exec_whisper@queues-priority-engine
> +igt@gem_exec_whisper@queues-sync-engine
> +igt@gem_exec_whisper@sync-engine
> +igt@gem_sync@legacy-active
> +igt@gem_sync@legacy-active-wakeup
> +igt@gem_sync@legacy-default
> +igt@gem_sync@legacy-double-wakeup
> +igt@gem_sync@legacy-forked
> +igt@gem_sync@legacy-forked-store
> +igt@gem_sync@legacy-forked-switch
> +igt@gem_sync@legacy-idle
> +igt@gem_sync@legacy-many
> +igt@gem_sync@legacy-store
> +igt@gem_sync@legacy-switch
> +igt@gem_sync@legacy-wakeup
> -igt@gem_exec_whisper@contexts
> -igt@gem_exec_whisper@contexts-forked
> -igt@gem_exec_whisper@contexts-interruptible
> -igt@gem_exec_whisper@contexts-priority
> -igt@gem_exec_whisper@contexts-sync
> -igt@gem_exec_whisper@fds
> -igt@gem_exec_whisper@fds-forked
> -igt@gem_exec_whisper@fds-interruptible
> -igt@gem_exec_whisper@fds-priority
> -igt@gem_exec_whisper@fds-sync
> -igt@gem_exec_whisper@forked
> -igt@gem_exec_whisper@interruptible
> -igt@gem_exec_whisper@normal
> -igt@gem_exec_whisper@queues
> -igt@gem_exec_whisper@queues-forked
> -igt@gem_exec_whisper@queues-interruptible
> -igt@gem_exec_whisper@queues-priority
> -igt@gem_exec_whisper@queues-sync
> -igt@gem_exec_whisper@sync
> -igt@gem_sync@active
> -igt@gem_sync@active-wakeup
> -igt@gem_sync@default
> -igt@gem_sync@double-wakeup
> -igt@gem_sync@forked
> -igt@gem_sync@forked-store
> -igt@gem_sync@forked-switch
> -igt@gem_sync@idle
> -igt@gem_sync@many
> -igt@gem_sync@store
> -igt@gem_sync@switch
> -igt@gem_sync@wakeup
> 
> == Logs ==
> 
> For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6360/index.html
