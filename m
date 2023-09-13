Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A4210E4B3
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Sep 2023 12:51:19 +0000 (UTC)
Message-ID: <7118f6bb-172b-3bb8-ba94-39e23954789d@linux.intel.com>
Date: Wed, 13 Sep 2023 14:50:47 +0200
MIME-Version: 1.0
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org, saix.nandan.yedireswarapu@intel.com,
 ravitejax.veesam@intel.com, sanjux.marikkar@intel.com,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
References: <20230908171300.2749840-1-marcin.bernatowicz@linux.intel.com>
 <169460472157.31250.16379602034574897656@emeril.freedesktop.org>
 <fbc2e140-0e65-61db-f041-f63001d5bccc@linux.intel.com>
In-Reply-To: <fbc2e140-0e65-61db-f041-f63001d5bccc@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgbGliL3hl?=
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

As not related to my change, could you supress them, no need for respin.
--
marcin

On 9/13/2023 2:28 PM, Bernatowicz, Marcin wrote:
> 
> 
> On 9/13/2023 1:32 PM, Patchwork wrote:
>> *Patch Details*
>> *Series:*    lib/xe_spin: introduced fixed duration xe_spin (rev4)
>> *URL:*    https://patchwork.freedesktop.org/series/122624/ 
>> <https://patchwork.freedesktop.org/series/122624/>
>> *State:*    failure
>> *Details:* 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html 
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html>
>>
>>
>>   CI Bug Log - changes from IGT_7477_full -> IGTPW_9758_full
>>
>>
>>     Summary
>>
>> *FAILURE*
>>
>> Serious unknown changes coming with IGTPW_9758_full absolutely need to be
>> verified manually.
>>
>> If you think the reported changes have nothing to do with the changes
>> introduced in IGTPW_9758_full, please notify your bug team 
>> (lgci.bug.filing@intel.com) to allow them
>> to document this new failure mode, which will reduce false positives 
>> in CI.
>>
>> External URL: 
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/index.html
>>
>>
>>     Participating hosts (9 -> 9)
>>
>> No changes in participating hosts
>>
>>
>>     Possible new issues
>>
>> Here are the unknown changes that may have been introduced in 
>> IGTPW_9758_full:
>>
>>
>>       IGT changes
>>
>>
>>         Possible regressions
>>
>>   *
>>
>>     igt@i915_module_load@reload-with-fault-injection:
>>
>>       o shard-snb: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-snb6/igt@i915_module_load@reload-with-fault-injection.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html>
>>   *
>>
>>     igt@perf_pmu@rc6@other-idle-gt1:
>>
>>       o shard-mtlp: NOTRUN -> INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@perf_pmu@rc6@other-idle-gt1.html>
>>   *
>>
>>     igt@perf_pmu@rc6@runtime-pm-long-gt1:
>>
>>       o shard-mtlp: NOTRUN -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@perf_pmu@rc6@runtime-pm-long-gt1.html> +5 other tests dmesg-warn
>>
> 
> Not related to the change.
> -- 
> marcin
> 
>>
>>         Warnings
>>
>>   *
>>
>>     igt@gem_ccs@suspend-resume:
>>
>>       o
>>
>>         shard-rkl: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-4/igt@gem_ccs@suspend-resume.html> (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@gem_ccs@suspend-resume.html> +1 other test skip
>>
>>       o
>>
>>         shard-dg1: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-18/igt@gem_ccs@suspend-resume.html> (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-13/igt@gem_ccs@suspend-resume.html> +2 other tests skip
>>
>>       o
>>
>>         shard-tglu: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-10/igt@gem_ccs@suspend-resume.html> (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@gem_ccs@suspend-resume.html> +2 other tests skip
>>
>>       o
>>
>>         shard-mtlp: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-1/igt@gem_ccs@suspend-resume.html> (i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@gem_ccs@suspend-resume.html>
>>
>>   *
>>
>>     igt@gem_userptr_blits@vma-merge:
>>
>>       o
>>
>>         shard-apl: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-apl3/igt@gem_userptr_blits@vma-merge.html> (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-apl1/igt@gem_userptr_blits@vma-merge.html>
>>
>>       o
>>
>>         shard-glk: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk1/igt@gem_userptr_blits@vma-merge.html> (i915#3318 <https://gitlab.freedesktop.org/drm/intel/issues/3318>) -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk9/igt@gem_userptr_blits@vma-merge.html>
>>
>>   *
>>
>>     igt@perf_pmu@rc6@gt0:
>>
>>       o shard-mtlp: INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-8/igt@perf_pmu@rc6@gt0.html> (i915#9268 <https://gitlab.freedesktop.org/drm/intel/issues/9268>) -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@perf_pmu@rc6@gt0.html>
>>
>>
>>     New tests
>>
>> New tests have been introduced between IGT_7477_full and IGTPW_9758_full:
>>
>>
>>       New IGT tests (10)
>>
>>   *
>>
>>     
>> igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-a-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     
>> igt@kms_atomic_transition@plane-primary-toggle-with-vblank-wait@pipe-b-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-a-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_cursor_crc@cursor-offscreen-64x64@pipe-d-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_cursor_crc@cursor-random-64x21@pipe-a-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_cursor_crc@cursor-random-64x21@pipe-d-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_plane_multiple@tiling-y@pipe-a-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_plane_multiple@tiling-y@pipe-b-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_plane_multiple@tiling-y@pipe-c-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>   *
>>
>>     igt@kms_plane_multiple@tiling-y@pipe-d-hdmi-a-4:
>>
>>       o Statuses : 1 pass(s)
>>       o Exec time: [0.0] s
>>
>>
>>     Known issues
>>
>> Here are the changes found in IGTPW_9758_full that come from known 
>> issues:
>>
>>
>>       IGT changes
>>
>>
>>         Issues hit
>>
>>   *
>>
>>     igt@device_reset@unbind-cold-reset-rebind:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@device_reset@unbind-cold-reset-rebind.html> (i915#7701 <https://gitlab.freedesktop.org/drm/intel/issues/7701>)
>>   *
>>
>>     igt@drm_buddy@drm_buddy_test:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@drm_buddy@drm_buddy_test.html> (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
>>   *
>>
>>     igt@drm_fdinfo@most-busy-check-all@rcs0:
>>
>>       o shard-rkl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-6/igt@drm_fdinfo@most-busy-check-all@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@drm_fdinfo@most-busy-check-all@rcs0.html> (i915#7742 <https://gitlab.freedesktop.org/drm/intel/issues/7742>) +1 other test fail
>>   *
>>
>>     igt@drm_fdinfo@virtual-busy-idle:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@drm_fdinfo@virtual-busy-idle.html> (i915#8414 <https://gitlab.freedesktop.org/drm/intel/issues/8414>) +13 other tests skip
>>   *
>>
>>     igt@feature_discovery@display-3x:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@feature_discovery@display-3x.html> (i915#1839 <https://gitlab.freedesktop.org/drm/intel/issues/1839>)
>>
>>   *
>>
>>     igt@feature_discovery@psr1:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-6/igt@feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 other test skip
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@feature_discovery@psr1.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 other test skip
>>
>>   *
>>
>>     igt@gem_bad_reloc@negative-reloc:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-13/igt@gem_bad_reloc@negative-reloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 other test skip
>>   *
>>
>>     igt@gem_basic@multigpu-create-close:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@gem_basic@multigpu-create-close.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>) +1 other test skip
>>   *
>>
>>     igt@gem_close_race@multigpu-basic-process:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_close_race@multigpu-basic-process.html> (i915#7697 <https://gitlab.freedesktop.org/drm/intel/issues/7697>)
>>   *
>>
>>     igt@gem_ctx_freq@sysfs@gt0:
>>
>>       o shard-dg2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-2/igt@gem_ctx_freq@sysfs@gt0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@gem_ctx_freq@sysfs@gt0.html> (i915#6786 <https://gitlab.freedesktop.org/drm/intel/issues/6786>)
>>   *
>>
>>     igt@gem_ctx_param@set-priority-not-supported:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@gem_ctx_param@set-priority-not-supported.html> (fdo#109314 <https://bugs.freedesktop.org/show_bug.cgi?id=109314>)
>>   *
>>
>>     igt@gem_ctx_persistence@engines-mixed:
>>
>>       o shard-snb: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb1/igt@gem_ctx_persistence@engines-mixed.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>>   *
>>
>>     igt@gem_ctx_persistence@hang:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@gem_ctx_persistence@hang.html> (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>>   *
>>
>>     igt@gem_ctx_persistence@heartbeat-close:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_ctx_persistence@heartbeat-close.html> (i915#8555 <https://gitlab.freedesktop.org/drm/intel/issues/8555>)
>>   *
>>
>>     igt@gem_ctx_sseu@invalid-sseu:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@gem_ctx_sseu@invalid-sseu.html> (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>>   *
>>
>>     igt@gem_ctx_sseu@mmap-args:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_ctx_sseu@mmap-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>) +1 other test skip
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@gem_ctx_sseu@mmap-args.html> (i915#280 <https://gitlab.freedesktop.org/drm/intel/issues/280>)
>>
>>   *
>>
>>     igt@gem_eio@hibernate:
>>
>>       o shard-tglu: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-6/igt@gem_eio@hibernate.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-10/igt@gem_eio@hibernate.html> (i915#7975 <https://gitlab.freedesktop.org/drm/intel/issues/7975> / i915#8213 <https://gitlab.freedesktop.org/drm/intel/issues/8213> / i915#8398 <https://gitlab.freedesktop.org/drm/intel/issues/8398>)
>>   *
>>
>>     igt@gem_eio@in-flight-suspend:
>>
>>       o shard-mtlp: NOTRUN -> ABORT
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@gem_eio@in-flight-suspend.html> (i915#7892 <https://gitlab.freedesktop.org/drm/intel/issues/7892> / i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>)
>>   *
>>
>>     igt@gem_exec_balancer@bonded-dual:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@gem_exec_balancer@bonded-dual.html> (i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>>   *
>>
>>     igt@gem_exec_balancer@parallel-bb-first:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@gem_exec_balancer@parallel-bb-first.html> (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>) +1 other test skip
>>   *
>>
>>     igt@gem_exec_capture@capture-invisible@lmem0:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@gem_exec_capture@capture-invisible@lmem0.html> (i915#6334 <https://gitlab.freedesktop.org/drm/intel/issues/6334>) +1 other test skip
>>   *
>>
>>     igt@gem_exec_fair@basic-none-share:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@gem_exec_fair@basic-none-share.html> (i915#4473 <https://gitlab.freedesktop.org/drm/intel/issues/4473> / i915#4771 <https://gitlab.freedesktop.org/drm/intel/issues/4771>)
>>   *
>>
>>     igt@gem_exec_fair@basic-pace-share@rcs0:
>>
>>       o shard-glk: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>>   *
>>
>>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>>
>>       o shard-rkl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-6/igt@gem_exec_fair@basic-pace-solo@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@gem_exec_fair@basic-pace-solo@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +2 other tests fail
>>   *
>>
>>     igt@gem_exec_fair@basic-throttle:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@gem_exec_fair@basic-throttle.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>) +2 other tests skip
>>   *
>>
>>     igt@gem_exec_fence@parallel@bcs0:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-3/igt@gem_exec_fence@parallel@bcs0.html> -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@gem_exec_fence@parallel@bcs0.html> (i915#8962 <https://gitlab.freedesktop.org/drm/intel/issues/8962> / i915#9121 <https://gitlab.freedesktop.org/drm/intel/issues/9121>) +1 other test dmesg-fail
>>   *
>>
>>     igt@gem_exec_fence@parallel@vcs0:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-3/igt@gem_exec_fence@parallel@vcs0.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@gem_exec_fence@parallel@vcs0.html> (i915#9121 <https://gitlab.freedesktop.org/drm/intel/issues/9121>)
>>   *
>>
>>     igt@gem_exec_fence@parallel@vecs0:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-3/igt@gem_exec_fence@parallel@vecs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@gem_exec_fence@parallel@vecs0.html> (i915#8957 <https://gitlab.freedesktop.org/drm/intel/issues/8957>) +2 other tests fail
>>   *
>>
>>     igt@gem_exec_fence@submit:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@gem_exec_fence@submit.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>>   *
>>
>>     igt@gem_exec_fence@submit67:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_exec_fence@submit67.html> (i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>)
>>   *
>>
>>     igt@gem_exec_flush@basic-batch-kernel-default-cmd:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_exec_flush@basic-batch-kernel-default-cmd.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +7 other tests skip
>>   *
>>
>>     igt@gem_exec_flush@basic-batch-kernel-default-wb:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@gem_exec_flush@basic-batch-kernel-default-wb.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539> / i915#4852 <https://gitlab.freedesktop.org/drm/intel/issues/4852>) +2 other tests skip
>>   *
>>
>>     igt@gem_exec_flush@basic-uc-prw-default:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@gem_exec_flush@basic-uc-prw-default.html> (i915#3539 <https://gitlab.freedesktop.org/drm/intel/issues/3539>)
>>   *
>>
>>     igt@gem_exec_params@secure-non-master:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-9/igt@gem_exec_params@secure-non-master.html> (fdo#112283 <https://bugs.freedesktop.org/show_bug.cgi?id=112283>)
>>   *
>>
>>     igt@gem_exec_reloc@basic-cpu-gtt-noreloc:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@gem_exec_reloc@basic-cpu-gtt-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +1 other test skip
>>   *
>>
>>     igt@gem_exec_reloc@basic-write-cpu-noreloc:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@gem_exec_reloc@basic-write-cpu-noreloc.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +5 other tests skip
>>   *
>>
>>     igt@gem_exec_reloc@basic-write-read-active:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_exec_reloc@basic-write-read-active.html> (i915#3281 <https://gitlab.freedesktop.org/drm/intel/issues/3281>) +14 other tests skip
>>   *
>>
>>     igt@gem_exec_schedule@deep@rcs0:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@gem_exec_schedule@deep@rcs0.html> (i915#4537 <https://gitlab.freedesktop.org/drm/intel/issues/4537>)
>>   *
>>
>>     igt@gem_exec_schedule@preempt-queue-chain:
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@gem_exec_schedule@preempt-queue-chain.html> (i915#4537 <https://gitlab.freedesktop.org/drm/intel/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1 other test skip
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_exec_schedule@preempt-queue-chain.html> (i915#4537 <https://gitlab.freedesktop.org/drm/intel/issues/4537> / i915#4812 <https://gitlab.freedesktop.org/drm/intel/issues/4812>) +1 other test skip
>>
>>   *
>>
>>     igt@gem_exec_schedule@preemptive-hang@ccs0:
>>
>>       o shard-mtlp: NOTRUN -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@ccs0.html> (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>) +1 other test dmesg-warn
>>   *
>>
>>     igt@gem_exec_schedule@preemptive-hang@vcs0:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@gem_exec_schedule@preemptive-hang@vcs0.html> (i915#9051 <https://gitlab.freedesktop.org/drm/intel/issues/9051>)
>>   *
>>
>>     igt@gem_fenced_exec_thrash@no-spare-fences:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@gem_fenced_exec_thrash@no-spare-fences.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>)
>>   *
>>
>>     igt@gem_fenced_exec_thrash@no-spare-fences-interruptible:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@gem_fenced_exec_thrash@no-spare-fences-interruptible.html> (i915#4860 <https://gitlab.freedesktop.org/drm/intel/issues/4860>) +1 other test skip
>>   *
>>
>>     igt@gem_lmem_swapping@heavy-verify-random:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@gem_lmem_swapping@heavy-verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-9/igt@gem_lmem_swapping@heavy-verify-random.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1 other test skip
>>
>>   *
>>
>>     igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@gem_lmem_swapping@heavy-verify-random-ccs@lmem0.html> (i915#4565 <https://gitlab.freedesktop.org/drm/intel/issues/4565>)
>>   *
>>
>>     igt@gem_lmem_swapping@parallel-random-verify:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@gem_lmem_swapping@parallel-random-verify.html> (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +2 other tests skip
>>   *
>>
>>     igt@gem_lmem_swapping@smem-oom@lmem0:
>>
>>       o shard-dg2: NOTRUN -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_lmem_swapping@smem-oom@lmem0.html> (i915#4936 <https://gitlab.freedesktop.org/drm/intel/issues/4936> / i915#5493 <https://gitlab.freedesktop.org/drm/intel/issues/5493>)
>>   *
>>
>>     igt@gem_media_fill@media-fill:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_media_fill@media-fill.html> (i915#8289 <https://gitlab.freedesktop.org/drm/intel/issues/8289>)
>>   *
>>
>>     igt@gem_mmap@bad-size:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@gem_mmap@bad-size.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>>   *
>>
>>     igt@gem_mmap_gtt@cpuset-basic-small-copy-odd:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@gem_mmap_gtt@cpuset-basic-small-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +2 other tests skip
>>   *
>>
>>     igt@gem_mmap_gtt@cpuset-big-copy-odd:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_mmap_gtt@cpuset-big-copy-odd.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +12 other tests skip
>>   *
>>
>>     igt@gem_mmap_gtt@fault-concurrent:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@gem_mmap_gtt@fault-concurrent.html> (i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>) +10 other tests skip
>>   *
>>
>>     igt@gem_mmap_wc@write-wc-read-gtt:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-7/igt@gem_mmap_wc@write-wc-read-gtt.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>) +9 other tests skip
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@gem_mmap_wc@write-wc-read-gtt.html> (i915#4083 <https://gitlab.freedesktop.org/drm/intel/issues/4083>)
>>
>>   *
>>
>>     igt@gem_partial_pwrite_pread@reads-uncached:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-7/igt@gem_partial_pwrite_pread@reads-uncached.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +9 other tests skip
>>   *
>>
>>     igt@gem_pread@snoop:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@gem_pread@snoop.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>) +2 other tests skip
>>   *
>>
>>     igt@gem_pxp@create-valid-protected-context:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@gem_pxp@create-valid-protected-context.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>   *
>>
>>     igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@gem_pxp@dmabuf-shared-protected-dst-is-context-refcounted.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +2 other tests skip
>>   *
>>
>>     igt@gem_pxp@reject-modify-context-protection-on:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gem_pxp@reject-modify-context-protection-on.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>) +1 other test skip
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-14/igt@gem_pxp@reject-modify-context-protection-on.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>
>>   *
>>
>>     igt@gem_pxp@verify-pxp-execution-after-suspend-resume:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@gem_pxp@verify-pxp-execution-after-suspend-resume.html> (i915#4270 <https://gitlab.freedesktop.org/drm/intel/issues/4270>)
>>   *
>>
>>     igt@gem_readwrite@new-obj:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@gem_readwrite@new-obj.html> (i915#3282 <https://gitlab.freedesktop.org/drm/intel/issues/3282>)
>>   *
>>
>>     igt@gem_render_copy@yf-tiled-ccs-to-y-tiled:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@gem_render_copy@yf-tiled-ccs-to-y-tiled.html> (i915#8428 <https://gitlab.freedesktop.org/drm/intel/issues/8428>) +3 other tests skip
>>   *
>>
>>     igt@gem_softpin@evict-snoop:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@gem_softpin@evict-snoop.html> (i915#4885 <https://gitlab.freedesktop.org/drm/intel/issues/4885>)
>>   *
>>
>>     igt@gem_tiled_pread_pwrite:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@gem_tiled_pread_pwrite.html> (i915#4079 <https://gitlab.freedesktop.org/drm/intel/issues/4079>) +2 other tests skip
>>   *
>>
>>     igt@gem_userptr_blits@coherency-unsync:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@gem_userptr_blits@coherency-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +2 other tests skip
>>   *
>>
>>     igt@gem_userptr_blits@create-destroy-unsync:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@gem_userptr_blits@create-destroy-unsync.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +3 other tests skip
>>   *
>>
>>     igt@gem_userptr_blits@map-fixed-invalidate:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-7/igt@gem_userptr_blits@map-fixed-invalidate.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297> / i915#4880 <https://gitlab.freedesktop.org/drm/intel/issues/4880>)
>>   *
>>
>>     igt@gem_userptr_blits@unsync-unmap-cycles:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@gem_userptr_blits@unsync-unmap-cycles.html> (i915#3297 <https://gitlab.freedesktop.org/drm/intel/issues/3297>) +1 other test skip
>>   *
>>
>>     igt@gen3_render_linear_blits:
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@gen3_render_linear_blits.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@gen3_render_linear_blits.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +2 other tests skip
>>
>>   *
>>
>>     igt@gen7_exec_parse@basic-rejected:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@gen7_exec_parse@basic-rejected.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>) +3 other tests skip
>>   *
>>
>>     igt@gen7_exec_parse@cmd-crossing-page:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@gen7_exec_parse@cmd-crossing-page.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-3/igt@gen7_exec_parse@cmd-crossing-page.html> (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>>
>>   *
>>
>>     igt@gen9_exec_parse@basic-rejected:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-3/igt@gen9_exec_parse@basic-rejected.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527> / i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>>   *
>>
>>     igt@gen9_exec_parse@bb-start-far:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@gen9_exec_parse@bb-start-far.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>)
>>   *
>>
>>     igt@gen9_exec_parse@bb-start-param:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@gen9_exec_parse@bb-start-param.html> (i915#2856 <https://gitlab.freedesktop.org/drm/intel/issues/2856>) +3 other tests skip
>>   *
>>
>>     igt@gen9_exec_parse@unaligned-jump:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@gen9_exec_parse@unaligned-jump.html> (i915#2527 <https://gitlab.freedesktop.org/drm/intel/issues/2527>)
>>   *
>>
>>     igt@i915_fb_tiling:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-7/igt@i915_fb_tiling.html> (i915#4881 <https://gitlab.freedesktop.org/drm/intel/issues/4881>)
>>   *
>>
>>     igt@i915_hangman@detector@vcs0:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@i915_hangman@detector@vcs0.html> (i915#8456 <https://gitlab.freedesktop.org/drm/intel/issues/8456>) +2 other tests fail
>>   *
>>
>>     igt@i915_pm_rc6_residency@rc6-idle@rcs0:
>>
>>       o shard-dg1: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-13/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@i915_pm_rc6_residency@rc6-idle@rcs0.html> (i915#3591 <https://gitlab.freedesktop.org/drm/intel/issues/3591>)
>>   *
>>
>>     igt@i915_pm_rpm@dpms-lpsp:
>>
>>       o shard-rkl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-7/igt@i915_pm_rpm@dpms-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@i915_pm_rpm@dpms-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) +2 other tests skip
>>   *
>>
>>     igt@i915_pm_rpm@dpms-mode-unset-lpsp:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>>
>>       o
>>
>>         shard-dg1: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-19/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@i915_pm_rpm@dpms-mode-unset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>>
>>   *
>>
>>     igt@i915_pm_rpm@gem-execbuf-stress-pc8:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> (fdo#109506 <https://bugs.freedesktop.org/show_bug.cgi?id=109506>)
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@i915_pm_rpm@gem-execbuf-stress-pc8.html> (fdo#109293 <https://bugs.freedesktop.org/show_bug.cgi?id=109293>)
>>
>>   *
>>
>>     igt@i915_pm_rpm@modeset-lpsp:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@i915_pm_rpm@modeset-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>>   *
>>
>>     igt@i915_pm_rpm@modeset-non-lpsp:
>>
>>       o shard-dg2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-6/igt@i915_pm_rpm@modeset-non-lpsp.html> -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@i915_pm_rpm@modeset-non-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>>   *
>>
>>     igt@i915_pm_rpm@modeset-non-lpsp-stress:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@i915_pm_rpm@modeset-non-lpsp-stress.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>)
>>   *
>>
>>     igt@i915_pm_rps@min-max-config-loaded:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@i915_pm_rps@min-max-config-loaded.html> (i915#6621 <https://gitlab.freedesktop.org/drm/intel/issues/6621>) +1 other test skip
>>   *
>>
>>     igt@i915_pm_rps@thresholds-idle-park@gt0:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@i915_pm_rps@thresholds-idle-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@i915_pm_rps@thresholds-idle-park@gt0.html> (i915#8925 <https://gitlab.freedesktop.org/drm/intel/issues/8925>)
>>
>>   *
>>
>>     igt@i915_pm_sseu@full-enable:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@i915_pm_sseu@full-enable.html> (i915#4387 <https://gitlab.freedesktop.org/drm/intel/issues/4387>)
>>   *
>>
>>     igt@i915_query@query-topology-known-pci-ids:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@i915_query@query-topology-known-pci-ids.html> (fdo#109303 <https://bugs.freedesktop.org/show_bug.cgi?id=109303>)
>>   *
>>
>>     igt@i915_selftest@live@gt_engines:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@i915_selftest@live@gt_engines.html> (i915#9278 <https://gitlab.freedesktop.org/drm/intel/issues/9278> / i915#9290 <https://gitlab.freedesktop.org/drm/intel/issues/9290>)
>>   *
>>
>>     igt@i915_selftest@live@gt_pm:
>>
>>       o shard-mtlp: NOTRUN -> DMESG-FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@i915_selftest@live@gt_pm.html> (i915#9270 <https://gitlab.freedesktop.org/drm/intel/issues/9270>)
>>   *
>>
>>     igt@i915_suspend@basic-s3-without-i915:
>>
>>       o shard-snb: NOTRUN -> DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb1/igt@i915_suspend@basic-s3-without-i915.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) +5 other tests dmesg-warn
>>   *
>>
>>     igt@i915_suspend@forcewake:
>>
>>       o shard-dg2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-2/igt@i915_suspend@forcewake.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@i915_suspend@forcewake.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>>   *
>>
>>     igt@kms_addfb_basic@clobberred-modifier:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_addfb_basic@clobberred-modifier.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>)
>>   *
>>
>>     igt@kms_addfb_basic@framebuffer-vs-set-tiling:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_addfb_basic@framebuffer-vs-set-tiling.html> (i915#4212 <https://gitlab.freedesktop.org/drm/intel/issues/4212>) +2 other tests skip
>>   *
>>
>>     igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-7/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html> (i915#3826 <https://gitlab.freedesktop.org/drm/intel/issues/3826>)
>>
>>   *
>>
>>     igt@kms_async_flips@crc@pipe-a-hdmi-a-2:
>>
>>       o shard-dg2: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_async_flips@crc@pipe-a-hdmi-a-2.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 other tests fail
>>   *
>>
>>     igt@kms_async_flips@crc@pipe-c-hdmi-a-1:
>>
>>       o shard-dg1: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@kms_async_flips@crc@pipe-c-hdmi-a-1.html> (i915#8247 <https://gitlab.freedesktop.org/drm/intel/issues/8247>) +3 other tests fail
>>   *
>>
>>     igt@kms_async_flips@invalid-async-flip:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@kms_async_flips@invalid-async-flip.html> (i915#6228 <https://gitlab.freedesktop.org/drm/intel/issues/6228>)
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@kms_async_flips@invalid-async-flip.html> (i915#6228 <https://gitlab.freedesktop.org/drm/intel/issues/6228>)
>>
>>   *
>>
>>     igt@kms_atomic@plane-primary-overlay-mutable-zpos:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html> (i915#404 <https://gitlab.freedesktop.org/drm/intel/issues/404>)
>>   *
>>
>>     
>> igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
>>
>>       o shard-snb: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / i915#1769 <https://gitlab.freedesktop.org/drm/intel/issues/1769>)
>>   *
>>
>>     igt@kms_big_fb@4-tiled-32bpp-rotate-0:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html> (i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 other test skip
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-7/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 other test skip
>>
>>   *
>>
>>     igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5286 <https://gitlab.freedesktop.org/drm/intel/issues/5286>) +1 other test skip
>>   *
>>
>>     
>> igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (i915#3743 <https://gitlab.freedesktop.org/drm/intel/issues/3743>)
>>   *
>>
>>     igt@kms_big_fb@linear-16bpp-rotate-270:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-8/igt@kms_big_fb@linear-16bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 other test skip
>>   *
>>
>>     igt@kms_big_fb@x-tiled-16bpp-rotate-270:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +4 other tests skip
>>   *
>>
>>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614> / i915#3638 <https://gitlab.freedesktop.org/drm/intel/issues/3638>) +2 other tests skip
>>   *
>>
>>     igt@kms_big_fb@x-tiled-64bpp-rotate-90:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html> (fdo#111614 <https://bugs.freedesktop.org/show_bug.cgi?id=111614>) +1 other test skip
>>   *
>>
>>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html> (i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +21 other tests skip
>>   *
>>
>>     igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +1 other test skip
>>   *
>>
>>     igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html> (fdo#110723 <https://bugs.freedesktop.org/show_bug.cgi?id=110723>)
>>   *
>>
>>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html> (i915#4538 <https://gitlab.freedesktop.org/drm/intel/issues/4538> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +6 other tests skip
>>   *
>>
>>     
>> igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615>) +7 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@kms_ccs@pipe-a-bad-aux-stride-y_tiled_gen12_rc_ccs_cc.html> (i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_ccs@pipe-a-ccs-on-another-bo-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +10 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_ccs@pipe-a-crc-primary-basic-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +4 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html> (i915#3734 <https://gitlab.freedesktop.org/drm/intel/issues/3734> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 other tests skip
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-7/igt@kms_ccs@pipe-a-crc-sprite-planes-basic-y_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 other tests skip
>>
>>   *
>>
>>     igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_ccs@pipe-a-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +68 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-16/igt@kms_ccs@pipe-b-bad-aux-stride-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>   *
>>
>>     igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_ccs@pipe-b-bad-rotation-90-4_tiled_dg2_rc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +3 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_ccs@pipe-b-bad-rotation-90-yf_tiled_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +29 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_ccs@pipe-c-bad-rotation-90-y_tiled_gen12_mc_ccs.html> (i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#3886 <https://gitlab.freedesktop.org/drm/intel/issues/3886> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>>   *
>>
>>     igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_ccs@pipe-d-crc-primary-basic-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +7 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4_tiled_dg2_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +16 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-12/igt@kms_ccs@pipe-d-missing-ccs-buffer-4_tiled_mtl_mc_ccs.html> (i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@kms_ccs@pipe-d-random-ccs-data-y_tiled_ccs.html> (i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +27 other tests skip
>>   *
>>
>>     igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_ccs@pipe-d-random-ccs-data-yf_tiled_ccs.html> (fdo#111615 <https://bugs.freedesktop.org/show_bug.cgi?id=111615> / i915#3689 <https://gitlab.freedesktop.org/drm/intel/issues/3689> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354> / i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>) +5 other tests skip
>>   *
>>
>>     igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-3.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087> / i915#7213 <https://gitlab.freedesktop.org/drm/intel/issues/7213>) +3 other tests skip
>>   *
>>
>>     igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_cdclk@plane-scaling@pipe-d-hdmi-a-1.html> (i915#4087 <https://gitlab.freedesktop.org/drm/intel/issues/4087>) +3 other tests skip
>>   *
>>
>>     igt@kms_chamelium_color@ctm-limited-range:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_chamelium_color@ctm-limited-range.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>   *
>>
>>     igt@kms_chamelium_color@gamma:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_chamelium_color@gamma.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>>   *
>>
>>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +1 other test skip
>>   *
>>
>>     igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +10 other tests skip
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +2 other tests skip
>>
>>   *
>>
>>     igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +3 other tests skip
>>   *
>>
>>     igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html> (i915#7828 <https://gitlab.freedesktop.org/drm/intel/issues/7828>) +8 other tests skip
>>   *
>>
>>     igt@kms_concurrent@pipe-d:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@kms_concurrent@pipe-d.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +2 other tests skip
>>   *
>>
>>     igt@kms_content_protection@atomic:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_content_protection@atomic.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>)
>>   *
>>
>>     igt@kms_content_protection@dp-mst-type-0:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_content_protection@dp-mst-type-0.html> (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-6/igt@kms_content_protection@dp-mst-type-0.html> (i915#3116 <https://gitlab.freedesktop.org/drm/intel/issues/3116>)
>>
>>   *
>>
>>     igt@kms_content_protection@dp-mst-type-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_content_protection@dp-mst-type-1.html> (i915#3299 <https://gitlab.freedesktop.org/drm/intel/issues/3299>)
>>   *
>>
>>     igt@kms_content_protection@lic:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@kms_content_protection@lic.html> (i915#6944 <https://gitlab.freedesktop.org/drm/intel/issues/6944>)
>>   *
>>
>>     igt@kms_cursor_crc@cursor-offscreen-512x512:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 other test skip
>>   *
>>
>>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_cursor_crc@cursor-offscreen-max-size.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>   *
>>
>>     igt@kms_cursor_crc@cursor-onscreen-32x32:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_cursor_crc@cursor-onscreen-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>   *
>>
>>     igt@kms_cursor_crc@cursor-random-32x10:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_cursor_crc@cursor-random-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +1 other test skip
>>   *
>>
>>     igt@kms_cursor_crc@cursor-rapid-movement-512x512:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html> (i915#3359 <https://gitlab.freedesktop.org/drm/intel/issues/3359>) +1 other test skip
>>   *
>>
>>     igt@kms_cursor_crc@cursor-sliding-32x10:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-7/igt@kms_cursor_crc@cursor-sliding-32x10.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +10 other tests skip
>>   *
>>
>>     igt@kms_cursor_crc@cursor-sliding-32x32:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@kms_cursor_crc@cursor-sliding-32x32.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8814 <https://gitlab.freedesktop.org/drm/intel/issues/8814>) +1 other test skip
>>   *
>>
>>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +5 other tests skip
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +1 other test skip
>>
>>   *
>>
>>     igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-14/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>)
>>   *
>>
>>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html> (i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>) +1 other test skip
>>   *
>>
>>     igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#5354 <https://gitlab.freedesktop.org/drm/intel/issues/5354>) +6 other tests skip
>>   *
>>
>>     igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html> (fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#3546 <https://gitlab.freedesktop.org/drm/intel/issues/3546>)
>>   *
>>
>>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>>
>>       o shard-glk: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>>   *
>>
>>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>>
>>       o shard-apl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-apl7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-apl4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>)
>>   *
>>
>>     
>> igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103> / i915#4213 <https://gitlab.freedesktop.org/drm/intel/issues/4213>) +1 other test skip
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html> (i915#4103 <https://gitlab.freedesktop.org/drm/intel/issues/4103>)
>>
>>   *
>>
>>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-1.html> (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>>   *
>>
>>     igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html> (i915#3804 <https://gitlab.freedesktop.org/drm/intel/issues/3804>)
>>   *
>>
>>     igt@kms_dsc@dsc-with-bpc:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-3/igt@kms_dsc@dsc-with-bpc.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>>   *
>>
>>     igt@kms_dsc@dsc-with-bpc-formats:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>) +1 other test skip
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>) +1 other test skip
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_dsc@dsc-with-bpc-formats.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#3840 <https://gitlab.freedesktop.org/drm/intel/issues/3840>)
>>
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html> (i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>) +2 other tests skip
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>)
>>
>>       o
>>
>>         shard-snb: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> / fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767>) +1 other test skip
>>
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-fences:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@kms_flip@2x-flip-vs-fences.html> (i915#8381 <https://gitlab.freedesktop.org/drm/intel/issues/8381>)
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-fences-interruptible:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_flip@2x-flip-vs-fences-interruptible.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>>   *
>>
>>     igt@kms_flip@2x-flip-vs-rmfb-interruptible:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@kms_flip@2x-flip-vs-rmfb-interruptible.html> (fdo#111767 <https://bugs.freedesktop.org/show_bug.cgi?id=111767> / i915#3637 <https://gitlab.freedesktop.org/drm/intel/issues/3637>)
>>   *
>>
>>     igt@kms_flip@2x-modeset-vs-vblank-race:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_flip@2x-modeset-vs-vblank-race.html> (fdo#109274 <https://bugs.freedesktop.org/show_bug.cgi?id=109274>) +8 other tests skip
>>   *
>>
>>     igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2:
>>
>>       o shard-glk: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk6/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk1/igt@kms_flip@2x-plain-flip-ts-check@ab-hdmi-a1-hdmi-a2.html> (i915#2122 <https://gitlab.freedesktop.org/drm/intel/issues/2122>)
>>   *
>>
>>     igt@kms_flip@flip-vs-suspend@d-edp1:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-2/igt@kms_flip@flip-vs-suspend@d-edp1.html> -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_flip@flip-vs-suspend@d-edp1.html> (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>) +1 other test dmesg-warn
>>   *
>>
>>     
>> igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +4 other tests skip
>>   *
>>
>>     
>> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>)
>>
>>   *
>>
>>     
>> igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-default-mode.html> (i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672> / i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>)
>>   *
>>
>>     
>> igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8810 <https://gitlab.freedesktop.org/drm/intel/issues/8810>)
>>   *
>>
>>     
>> igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling@pipe-a-valid-mode.html> (i915#2587 <https://gitlab.freedesktop.org/drm/intel/issues/2587> / i915#2672 <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +1 other test skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
>>
>>       o shard-dg2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-3/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) +1 other test fail
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +1 other test skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +7 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
>>
>>       o shard-dg2: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>)
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-pwrite.html> (fdo#109280 <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +14 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-gtt.html> (i915#8708 <https://gitlab.freedesktop.org/drm/intel/issues/8708>) +32 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-13/igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +4 other tests skip
>>   *
>>
>>     
>> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-pwrite.html> (i915#3458 <https://gitlab.freedesktop.org/drm/intel/issues/3458>) +15 other tests skip
>>   *
>>
>>     
>> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
>>
>>       o shard-apl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-apl3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +1 other test skip
>>   *
>>
>>     
>> igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +5 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html> (fdo#111825 <https://bugs.freedesktop.org/show_bug.cgi?id=111825> / i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +21 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html> (i915#5439 <https://gitlab.freedesktop.org/drm/intel/issues/5439>)
>>   *
>>
>>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-plflip-blt.html> (i915#3023 <https://gitlab.freedesktop.org/drm/intel/issues/3023>) +12 other tests skip
>>   *
>>
>>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-mmap-cpu.html> (i915#1825 <https://gitlab.freedesktop.org/drm/intel/issues/1825>) +9 other tests skip
>>   *
>>
>>     igt@kms_getfb@getfb-reject-ccs:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_getfb@getfb-reject-ccs.html> (i915#6118 <https://gitlab.freedesktop.org/drm/intel/issues/6118>)
>>   *
>>
>>     igt@kms_hdr@invalid-metadata-sizes:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@kms_hdr@invalid-metadata-sizes.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>) +1 other test skip
>>   *
>>
>>     igt@kms_hdr@static-toggle-suspend:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_hdr@static-toggle-suspend.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8228 <https://gitlab.freedesktop.org/drm/intel/issues/8228>) +2 other tests skip
>>   *
>>
>>     igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html> (i915#4816 <https://gitlab.freedesktop.org/drm/intel/issues/4816>)
>>   *
>>
>>     igt@kms_panel_fitting@legacy:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_panel_fitting@legacy.html> (i915#6301 <https://gitlab.freedesktop.org/drm/intel/issues/6301>)
>>   *
>>
>>     igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1:
>>
>>       o shard-apl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-apl2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-dp-1.html> (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>>   *
>>
>>     igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes:
>>
>>       o shard-mtlp: NOTRUN -> ABORT
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a-planes.html> (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>) +8 other tests abort
>>   *
>>
>>     igt@kms_plane_lowres@tiling-y:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_plane_lowres@tiling-y.html> (i915#8821 <https://gitlab.freedesktop.org/drm/intel/issues/8821>)
>>   *
>>
>>     igt@kms_plane_lowres@tiling-yf:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@kms_plane_lowres@tiling-yf.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8821 <https://gitlab.freedesktop.org/drm/intel/issues/8821>)
>>   *
>>
>>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1:
>>
>>       o shard-tglu: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-8/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-1.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>>   *
>>
>>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-2.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>>   *
>>
>>     igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3:
>>
>>       o shard-dg1: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-13/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-3.html> (i915#8292 <https://gitlab.freedesktop.org/drm/intel/issues/8292>)
>>   *
>>
>>     
>> igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-a-hdmi-a-4.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_plane_scaling@plane-downscale-with-modifiers-factor-0-25@pipe-c-hdmi-a-2.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +11 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@kms_plane_scaling@plane-downscale-with-pixel-format-factor-0-25@pipe-b-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +5 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@kms_plane_scaling@plane-downscale-with-rotation-factor-0-5@pipe-c-edp-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +7 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-c-hdmi-a-1:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-8/igt@kms_plane_scaling@plane-scaler-with-rotation-unity-scaling@pipe-c-hdmi-a-1.html> (i915#5176 <https://gitlab.freedesktop.org/drm/intel/issues/5176>) +7 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-b-hdmi-a-2.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +5 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-12/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +15 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d-edp-1.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +11 other tests skip
>>   *
>>
>>     
>> igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-a-hdmi-a-3.html> (i915#5235 <https://gitlab.freedesktop.org/drm/intel/issues/5235>) +15 other tests skip
>>   *
>>
>>     igt@kms_prime@basic-modeset-hybrid:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524> / i915#6805 <https://gitlab.freedesktop.org/drm/intel/issues/6805>)
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-19/igt@kms_prime@basic-modeset-hybrid.html> (i915#6524 <https://gitlab.freedesktop.org/drm/intel/issues/6524>)
>>
>>   *
>>
>>     igt@kms_psr2_sf@plane-move-sf-dmg-area:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_psr2_sf@plane-move-sf-dmg-area.html> (i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +2 other tests skip
>>   *
>>
>>     igt@kms_psr2_su@frontbuffer-xrgb8888:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1 other test skip
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html> (fdo#109642 <https://bugs.freedesktop.org/show_bug.cgi?id=109642> / fdo#111068 <https://bugs.freedesktop.org/show_bug.cgi?id=111068> / i915#658 <https://gitlab.freedesktop.org/drm/intel/issues/658>)
>>
>>   *
>>
>>     igt@kms_psr2_su@page_flip-nv12:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-1/igt@kms_psr2_su@page_flip-nv12.html> (i915#4348 <https://gitlab.freedesktop.org/drm/intel/issues/4348>)
>>   *
>>
>>     igt@kms_psr@dpms:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@kms_psr@dpms.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>>   *
>>
>>     igt@kms_psr@psr2_dpms:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_psr@psr2_dpms.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +13 other tests skip
>>   *
>>
>>     igt@kms_psr@psr2_sprite_plane_move:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_psr@psr2_sprite_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +3 other tests skip
>>   *
>>
>>     igt@kms_psr@psr2_sprite_plane_onoff:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-10/igt@kms_psr@psr2_sprite_plane_onoff.html> (fdo#110189 <https://bugs.freedesktop.org/show_bug.cgi?id=110189>) +13 other tests skip
>>   *
>>
>>     igt@kms_rotation_crc@bad-pixel-format:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@kms_rotation_crc@bad-pixel-format.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>) +1 other test skip
>>   *
>>
>>     igt@kms_rotation_crc@primary-rotation-270:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@kms_rotation_crc@primary-rotation-270.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235>)
>>   *
>>
>>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>>
>>       o shard-rkl: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> -> INCOMPLETE <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html> (i915#8875 <https://gitlab.freedesktop.org/drm/intel/issues/8875>)
>>   *
>>
>>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html> (i915#4235 <https://gitlab.freedesktop.org/drm/intel/issues/4235> / i915#5190 <https://gitlab.freedesktop.org/drm/intel/issues/5190>) +1 other test skip
>>   *
>>
>>     igt@kms_selftest@drm_cmdline:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-14/igt@kms_selftest@drm_cmdline.html> (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>)
>>   *
>>
>>     igt@kms_selftest@drm_damage:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_selftest@drm_damage.html> (i915#8661 <https://gitlab.freedesktop.org/drm/intel/issues/8661>) +4 other tests skip
>>   *
>>
>>     igt@kms_tiled_display@basic-test-pattern:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@kms_tiled_display@basic-test-pattern.html> (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>>   *
>>
>>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>>
>>       o
>>
>>         shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html> (i915#8623 <https://gitlab.freedesktop.org/drm/intel/issues/8623>)
>>
>>   *
>>
>>     igt@kms_tv_load_detect@load-detect:
>>
>>       o
>>
>>         shard-snb: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb4/igt@kms_tv_load_detect@load-detect.html> (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +228 other tests skip
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@kms_tv_load_detect@load-detect.html> (fdo#109309 <https://bugs.freedesktop.org/show_bug.cgi?id=109309>)
>>
>>   *
>>
>>     igt@kms_vblank@pipe-c-wait-busy:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@kms_vblank@pipe-c-wait-busy.html> (i915#4070 <https://gitlab.freedesktop.org/drm/intel/issues/4070> / i915#6768 <https://gitlab.freedesktop.org/drm/intel/issues/6768>) +4 other tests skip
>>   *
>>
>>     igt@kms_vblank@pipe-d-ts-continuation-suspend:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-1/igt@kms_vblank@pipe-d-ts-continuation-suspend.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html> (i915#9262 <https://gitlab.freedesktop.org/drm/intel/issues/9262>) +4 other tests abort
>>   *
>>
>>     igt@kms_vrr@flip-basic:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@kms_vrr@flip-basic.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#8808 <https://gitlab.freedesktop.org/drm/intel/issues/8808>)
>>   *
>>
>>     igt@kms_writeback@writeback-check-output:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-6/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>>
>>       o
>>
>>         shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-5/igt@kms_writeback@writeback-check-output.html> (i915#2437 <https://gitlab.freedesktop.org/drm/intel/issues/2437>)
>>
>>   *
>>
>>     igt@perf@mi-rpc:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@perf@mi-rpc.html> (i915#2434 <https://gitlab.freedesktop.org/drm/intel/issues/2434>)
>>   *
>>
>>     igt@perf@polling-small-buf:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@perf@polling-small-buf.html> (i915#1722 <https://gitlab.freedesktop.org/drm/intel/issues/1722>)
>>   *
>>
>>     igt@perf_pmu@all-busy-idle-check-all:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@perf_pmu@all-busy-idle-check-all.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>)
>>
>>       o
>>
>>         shard-dg1: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-12/igt@perf_pmu@all-busy-idle-check-all.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-14/igt@perf_pmu@all-busy-idle-check-all.html> (i915#5234 <https://gitlab.freedesktop.org/drm/intel/issues/5234>)
>>
>>   *
>>
>>     igt@perf_pmu@busy-double-start@vecs1:
>>
>>       o shard-dg2: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-6/igt@perf_pmu@busy-double-start@vecs1.html> -> FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@perf_pmu@busy-double-start@vecs1.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +3 other tests fail
>>   *
>>
>>     igt@perf_pmu@busy-idle-check-all@bcs0:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@perf_pmu@busy-idle-check-all@bcs0.html> (i915#4521 <https://gitlab.freedesktop.org/drm/intel/issues/4521>) +2 other tests fail
>>   *
>>
>>     igt@perf_pmu@frequency@gt0:
>>
>>       o shard-dg2: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@perf_pmu@frequency@gt0.html> (i915#6806 <https://gitlab.freedesktop.org/drm/intel/issues/6806>)
>>   *
>>
>>     igt@perf_pmu@semaphore-busy@rcs0:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-6/igt@perf_pmu@semaphore-busy@rcs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) +11 other tests fail
>>   *
>>
>>     igt@prime_vgem@basic-blt:
>>
>>       o shard-mtlp: NOTRUN -> FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@prime_vgem@basic-blt.html> (i915#8445 <https://gitlab.freedesktop.org/drm/intel/issues/8445>)
>>   *
>>
>>     igt@prime_vgem@basic-fence-read:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@prime_vgem@basic-fence-read.html> (i915#3291 <https://gitlab.freedesktop.org/drm/intel/issues/3291> / i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1 other test skip
>>   *
>>
>>     igt@prime_vgem@basic-gtt:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@prime_vgem@basic-gtt.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708> / i915#4077 <https://gitlab.freedesktop.org/drm/intel/issues/4077>)
>>   *
>>
>>     igt@prime_vgem@fence-flip-hang:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-7/igt@prime_vgem@fence-flip-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>>   *
>>
>>     igt@prime_vgem@fence-read-hang:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>) +1 other test skip
>>
>>       o
>>
>>         shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@prime_vgem@fence-read-hang.html> (i915#3708 <https://gitlab.freedesktop.org/drm/intel/issues/3708>)
>>
>>   *
>>
>>     igt@sysfs_timeslice_duration@timeout@vecs0:
>>
>>       o shard-mtlp: PASS
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-7/igt@sysfs_timeslice_duration@timeout@vecs0.html> -> ABORT <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-8/igt@sysfs_timeslice_duration@timeout@vecs0.html> (i915#8521 <https://gitlab.freedesktop.org/drm/intel/issues/8521> / i915#8865 <https://gitlab.freedesktop.org/drm/intel/issues/8865>)
>>   *
>>
>>     igt@v3d/v3d_perfmon@get-values-valid-perfmon:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@v3d/v3d_perfmon@get-values-valid-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +2 other tests skip
>>   *
>>
>>     igt@v3d/v3d_submit_cl@simple-flush-cache:
>>
>>       o shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@v3d/v3d_submit_cl@simple-flush-cache.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +22 other tests skip
>>   *
>>
>>     igt@v3d/v3d_submit_csd@bad-perfmon:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-2/igt@v3d/v3d_submit_csd@bad-perfmon.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +8 other tests skip
>>   *
>>
>>     igt@v3d/v3d_submit_csd@job-perfmon:
>>
>>       o shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@v3d/v3d_submit_csd@job-perfmon.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315>) +5 other tests skip
>>   *
>>
>>     igt@v3d/v3d_submit_csd@valid-submission:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@v3d/v3d_submit_csd@valid-submission.html> (fdo#109315 <https://bugs.freedesktop.org/show_bug.cgi?id=109315> / i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +1 other test skip
>>   *
>>
>>     igt@vc4/vc4_label_bo@set-bad-handle:
>>
>>       o shard-tglu: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@vc4/vc4_label_bo@set-bad-handle.html> (i915#2575 <https://gitlab.freedesktop.org/drm/intel/issues/2575>) +3 other tests skip
>>   *
>>
>>     igt@vc4/vc4_purgeable_bo@access-purged-bo-mem:
>>
>>       o shard-mtlp: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-3/igt@vc4/vc4_purgeable_bo@access-purged-bo-mem.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +8 other tests skip
>>   *
>>
>>     igt@vc4/vc4_wait_bo@unused-bo-0ns:
>>
>>       o shard-dg1: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-16/igt@vc4/vc4_wait_bo@unused-bo-0ns.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>)
>>   *
>>
>>     igt@vc4/vc4_wait_seqno@bad-seqno-1ns:
>>
>>       o
>>
>>         shard-dg2: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +12 other tests skip
>>
>>       o
>>
>>         shard-rkl: NOTRUN -> SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@vc4/vc4_wait_seqno@bad-seqno-1ns.html> (i915#7711 <https://gitlab.freedesktop.org/drm/intel/issues/7711>) +6 other tests skip
>>
>>
>>         Possible fixes
>>
>>   *
>>
>>     igt@gem_eio@reset-stress:
>>
>>       o shard-dg1: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-18/igt@gem_eio@reset-stress.html> (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-17/igt@gem_eio@reset-stress.html>
>>   *
>>
>>     igt@gem_exec_endless@dispatch@bcs0:
>>
>>       o shard-dg2: TIMEOUT
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-3/igt@gem_exec_endless@dispatch@bcs0.html> (i915#3778 <https://gitlab.freedesktop.org/drm/intel/issues/3778> / i915#7016 <https://gitlab.freedesktop.org/drm/intel/issues/7016> / i915#7921 <https://gitlab.freedesktop.org/drm/intel/issues/7921>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-1/igt@gem_exec_endless@dispatch@bcs0.html>
>>   *
>>
>>     igt@gem_exec_fair@basic-deadline:
>>
>>       o shard-rkl: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html> (i915#2846 <https://gitlab.freedesktop.org/drm/intel/issues/2846>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-6/igt@gem_exec_fair@basic-deadline.html>
>>   *
>>
>>     igt@gem_exec_fair@basic-none-share@rcs0:
>>
>>       o shard-glk: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk9/igt@gem_exec_fair@basic-none-share@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html> +1 other test pass
>>   *
>>
>>     igt@gem_exec_fair@basic-throttle@rcs0:
>>
>>       o shard-rkl: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-6/igt@gem_exec_fair@basic-throttle@rcs0.html> (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@gem_exec_fair@basic-throttle@rcs0.html>
>>   *
>>
>>     igt@i915_module_load@reload-with-fault-injection:
>>
>>       o shard-dg2: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-3/igt@i915_module_load@reload-with-fault-injection.html> (i915#7061 <https://gitlab.freedesktop.org/drm/intel/issues/7061> / i915#8617 <https://gitlab.freedesktop.org/drm/intel/issues/8617>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@i915_module_load@reload-with-fault-injection.html>
>>   *
>>
>>     igt@i915_pm_rpm@dpms-lpsp:
>>
>>       o shard-dg2: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-1/igt@i915_pm_rpm@dpms-lpsp.html> (i915#1397 <https://gitlab.freedesktop.org/drm/intel/issues/1397>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-10/igt@i915_pm_rpm@dpms-lpsp.html>
>>   *
>>
>>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
>>
>>       o shard-glk: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-glk7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html> (i915#2346 <https://gitlab.freedesktop.org/drm/intel/issues/2346>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-glk4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html>
>>   *
>>
>>     igt@kms_cursor_legacy@forked-bo@all-pipes:
>>
>>       o shard-mtlp: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html> (i915#2017 <https://gitlab.freedesktop.org/drm/intel/issues/2017>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-mtlp-4/igt@kms_cursor_legacy@forked-bo@all-pipes.html>
>>   *
>>
>>     igt@kms_fbcon_fbt@fbc-suspend:
>>
>>       o shard-dg2: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-11/igt@kms_fbcon_fbt@fbc-suspend.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-3/igt@kms_fbcon_fbt@fbc-suspend.html>
>>   *
>>
>>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt:
>>
>>       o shard-dg2: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html> (i915#6880 <https://gitlab.freedesktop.org/drm/intel/issues/6880>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-msflip-blt.html>
>>   *
>>
>>     igt@kms_sysfs_edid_timing:
>>
>>       o shard-dg2: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-3/igt@kms_sysfs_edid_timing.html> (IGT#2 <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_sysfs_edid_timing.html>
>>   *
>>
>>     igt@kms_vblank@pipe-d-ts-continuation-suspend:
>>
>>       o shard-tglu: INCOMPLETE
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-5/igt@kms_vblank@pipe-d-ts-continuation-suspend.html> (i915#8797 <https://gitlab.freedesktop.org/drm/intel/issues/8797>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-6/igt@kms_vblank@pipe-d-ts-continuation-suspend.html>
>>   *
>>
>>     igt@perf_pmu@busy@vecs0:
>>
>>       o
>>
>>         shard-dg2: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-1/igt@perf_pmu@busy@vecs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-2/igt@perf_pmu@busy@vecs0.html>
>>
>>       o
>>
>>         shard-dg1: FAIL
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-18/igt@perf_pmu@busy@vecs0.html> (i915#4349 <https://gitlab.freedesktop.org/drm/intel/issues/4349>) -> PASS <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-18/igt@perf_pmu@busy@vecs0.html> +2 other tests pass
>>
>>
>>         Warnings
>>
>>   *
>>
>>     igt@debugfs_test@basic-hwmon:
>>
>>       o
>>
>>         shard-rkl: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-7/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/intel/issues/9318>)
>>
>>       o
>>
>>         shard-tglu: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-6/igt@debugfs_test@basic-hwmon.html> (i915#7456 <https://gitlab.freedesktop.org/drm/intel/issues/7456>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-8/igt@debugfs_test@basic-hwmon.html> (i915#9318 <https://gitlab.freedesktop.org/drm/intel/issues/9318>)
>>
>>   *
>>
>>     igt@feature_discovery@chamelium:
>>
>>       o shard-tglu: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-2/igt@feature_discovery@chamelium.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@feature_discovery@chamelium.html> (fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827> / i915#2065 <https://gitlab.freedesktop.org/drm/intel/issues/2065>)
>>   *
>>
>>     igt@gem_ccs@ctrl-surf-copy:
>>
>>       o
>>
>>         shard-rkl: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-6/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-7/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 other tests skip
>>
>>       o
>>
>>         shard-dg1: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-18/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 other tests skip
>>
>>       o
>>
>>         shard-tglu: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-tglu-7/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-tglu-4/igt@gem_ccs@ctrl-surf-copy.html> (i915#3555 <https://gitlab.freedesktop.org/drm/intel/issues/3555>) +2 other tests skip
>>
>>   *
>>
>>     igt@gem_ccs@ctrl-surf-copy-new-ctx:
>>
>>       o shard-rkl: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-2/igt@gem_ccs@ctrl-surf-copy-new-ctx.html> (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098> / i915#5325 <https://gitlab.freedesktop.org/drm/intel/issues/5325>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-4/igt@gem_ccs@ctrl-surf-copy-new-ctx.html> (i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>   *
>>
>>     igt@gem_ctx_isolation@preservation-s3@rcs0:
>>
>>       o shard-snb: DMESG-WARN
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-snb5/igt@gem_ctx_isolation@preservation-s3@rcs0.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) -> DMESG-FAIL <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb7/igt@gem_ctx_isolation@preservation-s3@rcs0.html> (fdo#103375 <https://bugs.freedesktop.org/show_bug.cgi?id=103375>)
>>   *
>>
>>     igt@kms_content_protection@content_type_change:
>>
>>       o shard-dg2: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg2-6/igt@kms_content_protection@content_type_change.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg2-11/igt@kms_content_protection@content_type_change.html> (i915#7118 <https://gitlab.freedesktop.org/drm/intel/issues/7118> / i915#7162 <https://gitlab.freedesktop.org/drm/intel/issues/7162>)
>>   *
>>
>>     igt@kms_content_protection@mei_interface:
>>
>>       o shard-dg1: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-15/igt@kms_content_protection@mei_interface.html> (fdo#109300 <https://bugs.freedesktop.org/show_bug.cgi?id=109300>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-15/igt@kms_content_protection@mei_interface.html> (i915#7116 <https://gitlab.freedesktop.org/drm/intel/issues/7116>)
>>   *
>>
>>     igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1:
>>
>>       o shard-snb: ABORT
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-snb2/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>) -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-snb4/igt@kms_cursor_crc@cursor-suspend@pipe-b-vga-1.html> (i915#8841 <https://gitlab.freedesktop.org/drm/intel/issues/8841>)
>>   *
>>
>>     igt@kms_force_connector_basic@force-load-detect:
>>
>>       o shard-rkl: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-rkl-7/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-rkl-1/igt@kms_force_connector_basic@force-load-detect.html> (fdo#109285 <https://bugs.freedesktop.org/show_bug.cgi?id=109285> / i915#4098 <https://gitlab.freedesktop.org/drm/intel/issues/4098>)
>>   *
>>
>>     igt@kms_psr@cursor_plane_move:
>>
>>       o shard-dg1: SKIP
>>         
>> <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7477/shard-dg1-16/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072> / i915#4078 <https://gitlab.freedesktop.org/drm/intel/issues/4078>) -> SKIP <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_9758/shard-dg1-14/igt@kms_psr@cursor_plane_move.html> (i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>) +1 other test skip
>>
>> {name}: This element is suppressed. This means it is ignored when 
>> computing
>> the status of the difference (SUCCESS, WARNING, or FAILURE).
>>
>>
>>     Build changes
>>
>>   * CI: CI-201
>>
