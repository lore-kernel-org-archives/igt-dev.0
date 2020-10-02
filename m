Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F376E0AF
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2020 10:27:33 +0000 (UTC)
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
Date: Fri, 2 Oct 2020 10:27:28 +0000
Message-ID: <de9db2f391780bee699498b4f8a82183bb032a10.camel@intel.com>
References: <20201002065442.30037-1-dominik.grzegorzek@intel.com>
 <160162773252.3609.2945305843910909346@emeril.freedesktop.org>
In-Reply-To: <160162773252.3609.2945305843910909346@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <B7508A95CA37D64BB64E393485838BA2@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHM6?=
 =?utf-8?q?_Remove_libdrm_dependency_=28rev3=29?=
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
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, 2020-10-02 at 08:35 +0000, Patchwork wrote:
> Patch Details
> Series:	tests: Remove libdrm dependency (rev3)
> URL:	https://patchwork.freedesktop.org/series/82203/
> State:	failure
> Details:	
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5036/index.html
> CI Bug Log - changes from IGT_5797_full -> IGTPW_5036_full
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_5036_full absolutely need
> to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5036_full, please notify your bug team to allow
> them
> to document this new failure mode, which will reduce false positives
> in CI.
> 
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5036/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in
> IGTPW_5036_full:
> 
> IGT changes
> Possible regressions
> igt@gem_tiled_blits@basic:
> 
> shard-glk: PASS -> FAIL
this one is expected.
> igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
> 
> shard-hsw: PASS -> INCOMPLETE
this is unrelated to changes made.

---
Dominik
> Known issues
> Here are the changes found in IGTPW_5036_full that come from known
> issues:
> 
> IGT changes
> Issues hit
> igt@gem_eio@in-flight-suspend:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#180)
> igt@gem_exec_reloc@basic-many-active@vecs0:
> 
> shard-glk: PASS -> FAIL (i915#2389) +2 similar issues
> igt@gem_exec_whisper@basic-queues-forked:
> 
> shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95) +1 similar issue
> igt@gem_tiled_blits@basic:
> 
> shard-apl: PASS -> FAIL (i915#1635)
> igt@i915_pm_dc@dc6-psr:
> 
> shard-iclb: PASS -> FAIL (i915#1899)
> igt@kms_cursor_legacy@cursor-vs-flip-varying-size:
> 
> shard-hsw: PASS -> FAIL (i915#2370)
> igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
> 
> shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982) +1 similar
> issue
> igt@kms_flip@2x-wf_vblank-ts-check@ab-hdmi-a1-hdmi-a2:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-pwrite:
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982)
> igt@kms_psr@psr2_cursor_plane_move:
> 
> shard-iclb: PASS -> SKIP (fdo#109441) +2 similar issues
> Possible fixes
> igt@gem_mmap_offset@blt-coherency:
> 
> shard-apl: FAIL (i915#1635) -> PASS
> igt@kms_atomic_transition@2x-modeset-transitions-nonblocking:
> 
> shard-hsw: INCOMPLETE -> PASS
> igt@kms_cursor_crc@pipe-a-cursor-64x21-onscreen:
> 
> shard-apl: FAIL (i915#1635 / i915#54) -> PASS
> igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
> shard-hsw: FAIL (i915#96) -> PASS
> igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ab-vga1-hdmi-a1:
> 
> shard-hsw: DMESG-WARN (i915#1982) -> PASS
> igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a2:
> 
> shard-glk: FAIL (i915#79) -> PASS +1 similar issue
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
> shard-glk: FAIL (i915#49) -> PASS
> igt@kms_frontbuffer_tracking@fbc-stridechange:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_psr2_su@frontbuffer:
> 
> shard-iclb: SKIP (fdo#109642 / fdo#111068) -> PASS
> igt@kms_psr@psr2_sprite_plane_move:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
> igt@kms_setmode@basic:
> 
> shard-apl: FAIL (i915#1635 / i915#31) -> PASS
> igt@prime_vgem@sync@bcs0:
> 
> shard-tglb: INCOMPLETE (i915#409) -> PASS
> Warnings
> igt@i915_pm_dc@dc3co-vpb-simulation:
> 
> shard-tglb: SKIP (i915#1904) -> DMESG-WARN (i915#2411)
> igt@i915_pm_dc@dc6-psr:
> 
> shard-tglb: FAIL (i915#454) -> FAIL (i915#1899)
> igt@kms_content_protection@atomic:
> 
> shard-apl: TIMEOUT (i915#1319 / i915#1635) -> FAIL (fdo#110321 /
> fdo#110336 / i915#1635)
> igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
> shard-apl: DMESG-FAIL (fdo#108145 / i915#1635 / i915#1982) -> FAIL
> (fdo#108145 / i915#1635 / i915#265)
> igt@kms_vblank@pipe-d-ts-continuation-dpms-suspend:
> 
> shard-tglb: DMESG-WARN (i915#2411) -> INCOMPLETE (i915#1436 /
> i915#1602 / i915#1887)
> igt@runner@aborted:
> 
> shard-tglb: FAIL (i915#409) -> FAIL (i915#1602)
> {name}: This element is suppressed. This means it is ignored when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (8 -> 8)
> No changes in participating hosts
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5797 -> IGTPW_5036
> CI-20190529: 20190529
> CI_DRM_9091: 1e20b6560332c04881daeeac61536a9ae9a4d539 @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5036: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5036/index.html
> IGT_5797: 1a7ef7eb5e99c9a8f4ffbc13cdae399a01a9aa12 @
> git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
