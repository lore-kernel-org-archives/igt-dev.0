Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E65510EE55
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Jul 2022 08:09:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="------------x66SnzaeGtR7szL9xdjn7po6"
Message-ID: <da28740c-1926-08a6-131a-23990ae2d53b@linux.intel.com>
Date: Thu, 7 Jul 2022 10:09:30 +0200
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20220706120143.1268-1-nirmoy.das@intel.com>
 <165715782931.2214.3076960591762136407@emeril.freedesktop.org>
From: "Das, Nirmoy" <nirmoy.das@linux.intel.com>
In-Reply-To: <165715782931.2214.3076960591762136407@emeril.freedesktop.org>
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_lib/i915=3A_Add_graphics_relea?=
 =?utf-8?q?se_subversion_to_device_info?=
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

This is a multi-part message in MIME format.
--------------x66SnzaeGtR7szL9xdjn7po6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/7/2022 3:37 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	series starting with [i-g-t,1/2] lib/i915: Add graphics 
> release subversion to device info
> *URL:* 	https://patchwork.freedesktop.org/series/105960/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html
>
>
>   CI Bug Log - changes from IGT_6558_full -> IGTPW_7471_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7471_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7471_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html
>
>
>     Participating hosts (7 -> 10)
>
> Additional (3): shard-rkl shard-dg1 shard-tglu
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_7471_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@drm_import_export@prime:
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb1/igt@drm_import_export@prime.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@drm_import_export@prime.html>
>

Unrelated failure.


>  *
>
>
>         Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>   * igt@kms_vblank@pipe-a-wait-idle-hang:
>       o {shard-dg1}: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-dg1-17/igt@kms_vblank@pipe-a-wait-idle-hang.html>
>
>
>     Known issues
>
> Here are the changes found in IGTPW_7471_full that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@device_reset@unbind-reset-rebind:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb4/igt@device_reset@unbind-reset-rebind.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb7/igt@device_reset@unbind-reset-rebind.html>
>         (i915#4528 <https://gitlab.freedesktop.org/drm/intel/issues/4528>)
>  *
>
>     igt@gem_create@create-massive:
>
>       o shard-glk: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk1/igt@gem_create@create-massive.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>  *
>
>     igt@gem_ctx_persistence@legacy-engines-mixed:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#1099 <https://gitlab.freedesktop.org/drm/intel/issues/1099>)
>  *
>
>     igt@gem_eio@in-flight-contexts-10ms:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html>
>         -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>  *
>
>     igt@gem_eio@in-flight-contexts-1us:
>
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl2/igt@gem_eio@in-flight-contexts-1us.html>
>         (i915#3063 <https://gitlab.freedesktop.org/drm/intel/issues/3063>)
>  *
>
>     igt@gem_eio@kms:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb7/igt@gem_eio@kms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_eio@kms.html>
>         (i915#5784 <https://gitlab.freedesktop.org/drm/intel/issues/5784>)
>  *
>
>     igt@gem_exec_balancer@parallel-balancer:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>  *
>
>     igt@gem_exec_balancer@parallel-contexts:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html>
>         (i915#4525 <https://gitlab.freedesktop.org/drm/intel/issues/4525>)
>  *
>
>     igt@gem_exec_fair@basic-deadline:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_exec_fair@basic-deadline.html>
>         (i915#6141 <https://gitlab.freedesktop.org/drm/intel/issues/6141>)
>  *
>
>     igt@gem_exec_fair@basic-none-share@rcs0:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-none-solo@rcs0:
>
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-none@vcs1:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) +1
>         similar issue
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_exec_fair@basic-throttle@rcs0:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         (i915#2842 <https://gitlab.freedesktop.org/drm/intel/issues/2842>)
>  *
>
>     igt@gem_lmem_swapping@heavy-verify-random-ccs:
>
>      o
>
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +1
>         similar issue
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html>
>         (i915#4613 <https://gitlab.freedesktop.org/drm/intel/issues/4613>)
>
>  *
>
>     igt@gem_lmem_swapping@parallel-multi:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_lmem_swapping@parallel-multi.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#4613
>         <https://gitlab.freedesktop.org/drm/intel/issues/4613>) +5
>         similar issues
>  *
>
>     igt@gem_pread@exhaustion:
>
>       o shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@gem_pread@exhaustion.html>
>         (i915#2658 <https://gitlab.freedesktop.org/drm/intel/issues/2658>)
>  *
>
>     igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html>
>         (i915#768 <https://gitlab.freedesktop.org/drm/intel/issues/768>)
>  *
>
>     igt@gem_userptr_blits@input-checking:
>
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@gem_userptr_blits@input-checking.html>
>         (i915#4991 <https://gitlab.freedesktop.org/drm/intel/issues/4991>)
>  *
>
>     igt@gem_workarounds@suspend-resume-context:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html>
>         (i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>)
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb2/igt@i915_selftest@live@hangcheck.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb5/igt@i915_selftest@live@hangcheck.html>
>         (i915#3921 <https://gitlab.freedesktop.org/drm/intel/issues/3921>)
>  *
>
>     igt@i915_suspend@sysfs-reader:
>
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@i915_suspend@sysfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@i915_suspend@sysfs-reader.html>
>         (i915#3614
>         <https://gitlab.freedesktop.org/drm/intel/issues/3614> /
>         i915#4817
>         <https://gitlab.freedesktop.org/drm/intel/issues/4817> /
>         i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +121
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb8/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689> /
>         i915#6095 <https://gitlab.freedesktop.org/drm/intel/issues/6095>)
>  *
>
>     igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk6/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +35
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#3886
>         <https://gitlab.freedesktop.org/drm/intel/issues/3886>) +16
>         similar issues
>  *
>
>     igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html>
>         (i915#3689
>         <https://gitlab.freedesktop.org/drm/intel/issues/3689>) +1
>         similar issue
>  *
>
>     igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278>) +2
>         similar issues
>  *
>
>     igt@kms_chamelium@hdmi-audio-edid:
>
>      o
>
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk2/igt@kms_chamelium@hdmi-audio-edid.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +2
>         similar issues
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_chamelium@hdmi-audio-edid.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>
>  *
>
>     igt@kms_color_chamelium@pipe-b-ctm-limited-range:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +8
>         similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-c-ctm-0-5:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +32
>         similar issues
>  *
>
>     igt@kms_color_chamelium@pipe-d-ctm-0-5:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         (fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         (fdo#109278
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109278> /
>         fdo#109284
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109284> /
>         fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>
>      o
>
>         shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb4/igt@kms_color_chamelium@pipe-d-ctm-0-5.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         fdo#111827
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111827>) +1
>         similar issue
>
>  *
>
>     igt@kms_content_protection@srm:
>
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_content_protection@srm.html>
>         (i915#1319
>         <https://gitlab.freedesktop.org/drm/intel/issues/1319>) +1
>         similar issue
>  *
>
>     igt@kms_fbcon_fbt@fbc-suspend:
>
>       o shard-kbl: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#4939 <https://gitlab.freedesktop.org/drm/intel/issues/4939>)
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:
>
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html>
>         (i915#2672
>         <https://gitlab.freedesktop.org/drm/intel/issues/2672>) +4
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:
>
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +30
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280> /
>         fdo#111825
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111825>) +4
>         similar issues
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
>
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html>
>         (fdo#109280
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109280>) +4
>         similar issues
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html>
>         (i915#433 <https://gitlab.freedesktop.org/drm/intel/issues/433>)
>  *
>
>     igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:
>
>      o
>
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html>
>         (fdo#109289 <https://bugs.freedesktop.org/show_bug.cgi?id=109289>)
>
>  *
>
>     igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) +3
>         similar issues
>  *
>
>     igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:
>
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html>
>         (fdo#108145
>         <https://bugs.freedesktop.org/show_bug.cgi?id=108145> /
>         i915#265
>         <https://gitlab.freedesktop.org/drm/intel/issues/265>) +3
>         similar issues
>  *
>
>     igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +5
>         similar issues
>  *
>
>     igt@kms_psr@psr2_primary_page_flip:
>
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>  *
>
>     igt@kms_psr@psr2_sprite_plane_move:
>
>      o
>
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html>
>         (fdo#109441 <https://bugs.freedesktop.org/show_bug.cgi?id=109441>)
>
>      o
>
>         shard-tglb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@kms_psr@psr2_sprite_plane_move.html>
>         (i915#132
>         <https://gitlab.freedesktop.org/drm/intel/issues/132> /
>         i915#3467 <https://gitlab.freedesktop.org/drm/intel/issues/3467>)
>
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (i915#5519 <https://gitlab.freedesktop.org/drm/intel/issues/5519>)
>  *
>
>     igt@kms_sysfs_edid_timing:
>
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_sysfs_edid_timing.html>
>         (IGT#2
>         <https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2>)
>  *
>
>     igt@kms_vblank@pipe-a-ts-continuation-suspend:
>
>       o shard-apl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +2
>         similar issues
>  *
>
>     igt@kms_vblank@pipe-b-ts-continuation-suspend:
>
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) +2
>         similar issues
>  *
>
>     igt@kms_vblank@pipe-d-wait-idle:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#533 <https://gitlab.freedesktop.org/drm/intel/issues/533>)
>  *
>
>     igt@prime_nv_pcopy@test2:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@prime_nv_pcopy@test2.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271>) +355
>         similar issues
>  *
>
>     igt@sysfs_clients@fair-0:
>
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl1/igt@sysfs_clients@fair-0.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +1
>         similar issue
>  *
>
>     igt@sysfs_clients@sema-10:
>
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk6/igt@sysfs_clients@sema-10.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994 <https://gitlab.freedesktop.org/drm/intel/issues/2994>)
>  *
>
>     igt@sysfs_clients@split-10:
>
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@sysfs_clients@split-10.html>
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#2994
>         <https://gitlab.freedesktop.org/drm/intel/issues/2994>) +5
>         similar issues
>
>
>         Possible fixes
>
>  *
>
>     igt@feature_discovery@psr2:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb7/igt@feature_discovery@psr2.html>
>         (i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@feature_discovery@psr2.html>
>  *
>
>     igt@gem_ctx_isolation@preservation-s3@bcs0:
>
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html>
>         +1 similar issue
>  *
>
>     igt@gem_exec_fair@basic-none@vecs0:
>
>       o shard-apl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html>
>         +2 similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace-share@rcs0:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         +2 similar issues
>  *
>
>     igt@gem_exec_fair@basic-pace-solo@rcs0:
>
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html>
>  *
>
>     igt@gem_exec_fair@basic-pace@vecs0:
>
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html>
>         (i915#2842
>         <https://gitlab.freedesktop.org/drm/intel/issues/2842>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html>
>         +4 similar issues
>  *
>
>     igt@gen9_exec_parse@allowed-all:
>
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk7/igt@gen9_exec_parse@allowed-all.html>
>         (i915#5566
>         <https://gitlab.freedesktop.org/drm/intel/issues/5566> /
>         i915#716
>         <https://gitlab.freedesktop.org/drm/intel/issues/716>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk2/igt@gen9_exec_parse@allowed-all.html>
>  *
>
>     igt@i915_module_load@reload-with-fault-injection:
>
>       o shard-snb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html>
>         (i915#6201
>         <https://gitlab.freedesktop.org/drm/intel/issues/6201>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html>
>  *
>
>     igt@i915_selftest@live@hangcheck:
>
>       o shard-tglb: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb8/igt@i915_selftest@live@hangcheck.html>
>         (i915#5591
>         <https://gitlab.freedesktop.org/drm/intel/issues/5591>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@i915_selftest@live@hangcheck.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:
>
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>         (i915#79 <https://gitlab.freedesktop.org/drm/intel/issues/79>)
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-dp1:
>
>       o shard-apl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>         +2 similar issues
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
>
>       o shard-glk: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>         (i915#118
>         <https://gitlab.freedesktop.org/drm/intel/issues/118> /
>         i915#1888
>         <https://gitlab.freedesktop.org/drm/intel/issues/1888>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html>
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:
>
>       o shard-kbl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html>
>  *
>
>     igt@kms_psr@psr2_primary_mmap_cpu:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html>
>         (fdo#109441
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109441>) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_psr2_sf@overlay-plane-update-continuous-sf:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html>
>         (i915#2920 <https://gitlab.freedesktop.org/drm/intel/issues/2920>)
>  *
>
>     igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
>
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (i915#2920
>         <https://gitlab.freedesktop.org/drm/intel/issues/2920>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html>
>         (fdo#111068
>         <https://bugs.freedesktop.org/show_bug.cgi?id=111068> /
>         i915#658
>         <https://gitlab.freedesktop.org/drm/intel/issues/658>) +1
>         similar issue
>  *
>
>     igt@runner@aborted:
>
>       o shard-kbl: (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html>)
>         (fdo#109271
>         <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>         i915#180 <https://gitlab.freedesktop.org/drm/intel/issues/180>
>         / i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257>) ->
>         (FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html>,
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html>)
>         (i915#180
>         <https://gitlab.freedesktop.org/drm/intel/issues/180> /
>         i915#3002
>         <https://gitlab.freedesktop.org/drm/intel/issues/3002> /
>         i915#4312
>         <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>         i915#5257
>         <https://gitlab.freedesktop.org/drm/intel/issues/5257> /
>         i915#92 <https://gitlab.freedesktop.org/drm/intel/issues/92>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_6558 -> IGTPW_7471
>
> CI-20190529: 20190529
> CI_DRM_11852: e247779f60c02de690f6e36d3b907aa439aea502 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7471: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html
> IGT_6558: f214bdcb75124f6e83921fea828195417dd4b346 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
--------------x66SnzaeGtR7szL9xdjn7po6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/7/2022 3:37 AM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:165715782931.2214.3076960591762136407@emeril.freedesktop.org">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>series starting with [i-g-t,1/2] lib/i915: Add graphics
              release subversion to device info</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/105960/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/105960/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
                href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from IGT_6558_full -&gt; IGTPW_7471_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_7471_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_7471_full, please notify your bug team to
        allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html</a></p>
      <h2>Participating hosts (7 -&gt; 10)</h2>
      <p>Additional (3): shard-rkl shard-dg1 shard-tglu </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_7471_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@drm_import_export@prime:
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb1/igt@drm_import_export@prime.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@drm_import_export@prime.html"
                moz-do-not-send="true">INCOMPLETE</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p><br>
    </p>
    <p>Unrelated failure.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:165715782931.2214.3076960591762136407@emeril.freedesktop.org">
      <ul>
        <li>
          <ul>
          </ul>
        </li>
      </ul>
      <h4>Suppressed</h4>
      <p>The following results come from untrusted machines, tests, or
        statuses.<br>
        They do not affect the overall result.</p>
      <ul>
        <li>igt@kms_vblank@pipe-a-wait-idle-hang:
          <ul>
            <li>{shard-dg1}: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-dg1-17/igt@kms_vblank@pipe-a-wait-idle-hang.html"
                moz-do-not-send="true">SKIP</a></li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in IGTPW_7471_full that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@device_reset@unbind-reset-rebind:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb4/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb7/igt@device_reset@unbind-reset-rebind.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4528"
                moz-do-not-send="true">i915#4528</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_create@create-massive:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk1/igt@gem_create@create-massive.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4991"
                moz-do-not-send="true">i915#4991</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb4/igt@gem_ctx_persistence@legacy-engines-mixed.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1099"
                moz-do-not-send="true">i915#1099</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-contexts-10ms:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@gem_eio@in-flight-contexts-10ms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@gem_eio@in-flight-contexts-10ms.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3063"
                moz-do-not-send="true">i915#3063</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@in-flight-contexts-1us:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl2/igt@gem_eio@in-flight-contexts-1us.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3063"
                moz-do-not-send="true">i915#3063</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_eio@kms:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb7/igt@gem_eio@kms.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_eio@kms.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5784"
                moz-do-not-send="true">i915#5784</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-balancer:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb5/igt@gem_exec_balancer@parallel-balancer.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_balancer@parallel-contexts:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb1/igt@gem_exec_balancer@parallel-contexts.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb5/igt@gem_exec_balancer@parallel-contexts.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4525"
                moz-do-not-send="true">i915#4525</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-deadline:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_exec_fair@basic-deadline.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6141"
                moz-do-not-send="true">i915#6141</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb5/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_exec_fair@basic-none-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@gem_exec_fair@basic-none-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vcs1:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_exec_fair@basic-none@vcs1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@gem_exec_fair@basic-none@vcs1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl4/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@gem_exec_fair@basic-throttle@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@heavy-verify-random-ccs:</p>
          <ul>
            <li>
              <p>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl7/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                  moz-do-not-send="true">i915#4613</a>) +1 similar issue</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                  moz-do-not-send="true">i915#4613</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@gem_lmem_swapping@heavy-verify-random-ccs.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                  moz-do-not-send="true">i915#4613</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@gem_lmem_swapping@parallel-multi:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_lmem_swapping@parallel-multi.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4613"
                moz-do-not-send="true">i915#4613</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_pread@exhaustion:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@gem_pread@exhaustion.html"
                moz-do-not-send="true">WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2658"
                moz-do-not-send="true">i915#2658</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@gem_render_copy@y-tiled-mc-ccs-to-vebox-yf-tiled.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/768"
                moz-do-not-send="true">i915#768</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_userptr_blits@input-checking:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@gem_userptr_blits@input-checking.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4991"
                moz-do-not-send="true">i915#4991</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_workarounds@suspend-resume-context:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_workarounds@suspend-resume-context.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_workarounds@suspend-resume-context.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb2/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb5/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3921"
                moz-do-not-send="true">i915#3921</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@i915_suspend@sysfs-reader:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@i915_suspend@sysfs-reader.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@i915_suspend@sysfs-reader.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3614"
                moz-do-not-send="true">i915#3614</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4817"
                moz-do-not-send="true">i915#4817</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4939"
                moz-do-not-send="true">i915#4939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +121 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb8/igt@kms_ccs@pipe-a-random-ccs-data-4_tiled_dg2_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6095"
                moz-do-not-send="true">i915#6095</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_ccs@pipe-b-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk6/igt@kms_ccs@pipe-c-bad-aux-stride-yf_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +35 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_ccs@pipe-c-ccs-on-another-bo-y_tiled_gen12_rc_ccs_cc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3886"
                moz-do-not-send="true">i915#3886</a>) +16 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb1/igt@kms_ccs@pipe-c-crc-primary-basic-y_tiled_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3689"
                moz-do-not-send="true">i915#3689</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_ccs@pipe-d-bad-aux-stride-y_tiled_gen12_mc_ccs.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109278"
                moz-do-not-send="true">fdo#109278</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium@hdmi-audio-edid:</p>
          <ul>
            <li>
              <p>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk2/igt@kms_chamelium@hdmi-audio-edid.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +2 similar
                issues</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_chamelium@hdmi-audio-edid.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109284"
                  moz-do-not-send="true">fdo#109284</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +1 similar
                issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-b-ctm-limited-range:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_color_chamelium@pipe-b-ctm-limited-range.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +8 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-c-ctm-0-5:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_color_chamelium@pipe-c-ctm-0-5.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                moz-do-not-send="true">fdo#111827</a>) +32 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_chamelium@pipe-d-ctm-0-5:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb8/igt@kms_color_chamelium@pipe-d-ctm-0-5.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109284"
                  moz-do-not-send="true">fdo#109284</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +1 similar
                issue</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_color_chamelium@pipe-d-ctm-0-5.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109278"
                  moz-do-not-send="true">fdo#109278</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109284"
                  moz-do-not-send="true">fdo#109284</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>)</p>
            </li>
            <li>
              <p>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb4/igt@kms_color_chamelium@pipe-d-ctm-0-5.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                  moz-do-not-send="true">fdo#109271</a> / <a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=111827"
                  moz-do-not-send="true">fdo#111827</a>) +1 similar
                issue</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@srm:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_content_protection@srm.html"
                moz-do-not-send="true">TIMEOUT</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1319"
                moz-do-not-send="true">i915#1319</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbcon_fbt@fbc-suspend:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_fbcon_fbt@fbc-suspend.html"
                moz-do-not-send="true">INCOMPLETE</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4939"
                moz-do-not-send="true">i915#4939</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a1.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/79"
                moz-do-not-send="true">i915#79</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2672"
                moz-do-not-send="true">i915#2672</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu:</p>
          <ul>
            <li>shard-snb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +30 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
          <ul>
            <li>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-mmap-wc.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a> / <a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111825"
                moz-do-not-send="true">fdo#111825</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
          <ul>
            <li>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109280"
                moz-do-not-send="true">fdo#109280</a>) +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb7/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/433"
                moz-do-not-send="true">i915#433</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c:</p>
          <ul>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                  moz-do-not-send="true">fdo#109289</a>)</p>
            </li>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_pipe_b_c_ivb@disable-pipe-b-enable-pipe-c.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109289"
                  moz-do-not-send="true">fdo#109289</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=108145"
                moz-do-not-send="true">fdo#108145</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                moz-do-not-send="true">i915#265</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-alpha-opaque-fb.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=108145"
                moz-do-not-send="true">fdo#108145</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/265"
                moz-do-not-send="true">i915#265</a>) +3 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) +5 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_page_flip:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb7/igt@kms_psr@psr2_primary_page_flip.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_sprite_plane_move:</p>
          <ul>
            <li>
              <p>shard-iclb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb6/igt@kms_psr@psr2_sprite_plane_move.html"
                  moz-do-not-send="true">SKIP</a> (<a
                  href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                  moz-do-not-send="true">fdo#109441</a>)</p>
            </li>
            <li>
              <p>shard-tglb: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@kms_psr@psr2_sprite_plane_move.html"
                  moz-do-not-send="true">FAIL</a> (<a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/132"
                  moz-do-not-send="true">i915#132</a> / <a
                  href="https://gitlab.freedesktop.org/drm/intel/issues/3467"
                  moz-do-not-send="true">i915#3467</a>)</p>
            </li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb7/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5519"
                moz-do-not-send="true">i915#5519</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sysfs_edid_timing:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_sysfs_edid_timing.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/2"
                moz-do-not-send="true">IGT#2</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-a-ts-continuation-suspend:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl6/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"
                moz-do-not-send="true">PASS</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl4/igt@kms_vblank@pipe-a-ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-b-ts-continuation-suspend:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_vblank@pipe-b-ts-continuation-suspend.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@pipe-d-wait-idle:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@kms_vblank@pipe-d-wait-idle.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/533"
                moz-do-not-send="true">i915#533</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@prime_nv_pcopy@test2:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@prime_nv_pcopy@test2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a>) +355 similar
              issues</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@fair-0:</p>
          <ul>
            <li>shard-apl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl1/igt@sysfs_clients@fair-0.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                moz-do-not-send="true">i915#2994</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@sema-10:</p>
          <ul>
            <li>shard-glk: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk6/igt@sysfs_clients@sema-10.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                moz-do-not-send="true">i915#2994</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sysfs_clients@split-10:</p>
          <ul>
            <li>shard-kbl: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@sysfs_clients@split-10.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2994"
                moz-do-not-send="true">i915#2994</a>) +5 similar issues</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@feature_discovery@psr2:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb7/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@feature_discovery@psr2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_ctx_isolation@preservation-s3@bcs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@gem_ctx_isolation@preservation-s3@bcs0.html"
                moz-do-not-send="true">PASS</a> +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-none@vecs0:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl7/igt@gem_exec_fair@basic-none@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@gem_exec_fair@basic-none@vecs0.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-share@rcs0:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk5/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@gem_exec_fair@basic-pace-share@rcs0.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace-solo@rcs0:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb1/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb2/igt@gem_exec_fair@basic-pace-solo@rcs0.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@gem_exec_fair@basic-pace@vecs0:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2842"
                moz-do-not-send="true">i915#2842</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@gem_exec_fair@basic-pace@vecs0.html"
                moz-do-not-send="true">PASS</a> +4 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@gen9_exec_parse@allowed-all:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk7/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5566"
                moz-do-not-send="true">i915#5566</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/716"
                moz-do-not-send="true">i915#716</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk2/igt@gen9_exec_parse@allowed-all.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_module_load@reload-with-fault-injection:</p>
          <ul>
            <li>shard-snb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-snb5/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/6201"
                moz-do-not-send="true">i915#6201</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-snb2/igt@i915_module_load@reload-with-fault-injection.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@i915_selftest@live@hangcheck:</p>
          <ul>
            <li>shard-tglb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-tglb8/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5591"
                moz-do-not-send="true">i915#5591</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-tglb5/igt@i915_selftest@live@hangcheck.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html"
                moz-do-not-send="true">FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/79"
                moz-do-not-send="true">i915#79</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a2.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
          <ul>
            <li>shard-apl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-apl3/igt@kms_flip@flip-vs-suspend@c-dp1.html"
                moz-do-not-send="true">PASS</a> +2 similar issues</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-glk: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-glk2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">DMESG-FAIL</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/118"
                moz-do-not-send="true">i915#118</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/1888"
                moz-do-not-send="true">i915#1888</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-glk8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt:</p>
          <ul>
            <li>shard-kbl: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">INCOMPLETE</a> -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-gtt.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb1/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109441"
                moz-do-not-send="true">fdo#109441</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@kms_psr@psr2_primary_mmap_cpu.html"
                moz-do-not-send="true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_psr2_sf@overlay-plane-update-continuous-sf:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb7/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-continuous-sf.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2920"
                moz-do-not-send="true">i915#2920</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
          <ul>
            <li>shard-iclb: <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-iclb2/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/2920"
                moz-do-not-send="true">i915#2920</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-iclb3/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html"
                moz-do-not-send="true">SKIP</a> (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=111068"
                moz-do-not-send="true">fdo#111068</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/658"
                moz-do-not-send="true">i915#658</a>) +1 similar issue</li>
          </ul>
        </li>
        <li>
          <p>igt@runner@aborted:</p>
          <ul>
            <li>shard-kbl: (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl4/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_6558/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://bugs.freedesktop.org/show_bug.cgi?id=109271"
                moz-do-not-send="true">fdo#109271</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3002"
                moz-do-not-send="true">i915#3002</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                moz-do-not-send="true">i915#4312</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5257"
                moz-do-not-send="true">i915#5257</a>) -&gt; (<a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl1/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl4/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>, <a
href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/shard-kbl7/igt@runner@aborted.html"
                moz-do-not-send="true">FAIL</a>) (<a
                href="https://gitlab.freedesktop.org/drm/intel/issues/180"
                moz-do-not-send="true">i915#180</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/3002"
                moz-do-not-send="true">i915#3002</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/4312"
                moz-do-not-send="true">i915#4312</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/5257"
                moz-do-not-send="true">i915#5257</a> / <a
                href="https://gitlab.freedesktop.org/drm/intel/issues/92"
                moz-do-not-send="true">i915#92</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_6558 -&gt; IGTPW_7471</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_11852: e247779f60c02de690f6e36d3b907aa439aea502 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_7471:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7471/index.html</a><br>
        IGT_6558: f214bdcb75124f6e83921fea828195417dd4b346 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
    </blockquote>
  </body>
</html>

--------------x66SnzaeGtR7szL9xdjn7po6--
