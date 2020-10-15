Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707B56E120
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Oct 2020 09:12:43 +0000 (UTC)
Message-ID: <43b99d5261e63a4ae6dc4e73723c8c598ebfc323.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Thu, 15 Oct 2020 11:12:39 +0200
In-Reply-To: <160270370898.21206.2344858637500034519@emeril.freedesktop.org>
References: <20201014165535.25668-1-janusz.krzysztofik@linux.intel.com>
 <160270370898.21206.2344858637500034519@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Take_care_of_closing_fences_before_failing?=
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
To: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

On Wed, 2020-10-14 at 19:28 +0000, Patchwork wrote:
> Patch Details
> Series:	tests/core_hotunplug: Take care of closing fences before failing
> URL:	https://patchwork.freedesktop.org/series/82684/
> State:	failure
> Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5069/index.html
> CI Bug Log - changes from IGT_5815_full -> IGTPW_5069_full
> Summary
> FAILURE
> 
> Serious unknown changes coming with IGTPW_5069_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5069_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5069/index.html
> 
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_5069_full:
> 
> IGT changes
> Possible regressions
> igt@kms_plane@plane-position-hole-pipe-b-planes:
> shard-iclb: PASS -> FAIL

Another false positive, not related to the change, not preceded in its
CI run by the test modified by the patch.

Thanks,
Janusz
 
> Known issues
> Here are the changes found in IGTPW_5069_full that come from known issues:
> 
> IGT changes
> Issues hit
> igt@gem_exec_reloc@basic-many-active@bcs0:
> 
> shard-glk: PASS -> FAIL (i915#2389)
> igt@gem_exec_whisper@basic-contexts-priority-all:
> 
> shard-glk: PASS -> DMESG-WARN (i915#118 / i915#95)
> igt@kms_big_fb@linear-16bpp-rotate-0:
> 
> shard-snb: PASS -> SKIP (fdo#109271) +1 similar issue
> igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
> 
> shard-apl: PASS -> DMESG-WARN (i915#1635 / i915#1982)
> igt@kms_cursor_crc@pipe-c-cursor-128x128-sliding:
> 
> shard-kbl: PASS -> FAIL (i915#54)
> 
> shard-glk: PASS -> FAIL (i915#54)
> 
> shard-apl: PASS -> FAIL (i915#1635 / i915#54)
> 
> igt@kms_cursor_edge_walk@pipe-c-256x256-top-edge:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
> 
> shard-tglb: PASS -> FAIL (i915#2416)
> igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-cpu:
> 
> shard-glk: PASS -> FAIL (i915#49)
> igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982)
> igt@kms_psr@psr2_dpms:
> 
> shard-iclb: PASS -> SKIP (fdo#109441) +1 similar issue
> igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
> 
> shard-kbl: PASS -> INCOMPLETE (i915#155)
> igt@perf_pmu@most-busy-idle-check-all@vecs0:
> 
> shard-iclb: PASS -> DMESG-WARN (i915#1982)
> Possible fixes
> igt@feature_discovery@psr2:
> 
> shard-iclb: SKIP (i915#658) -> PASS
> igt@gem_exec_whisper@basic-fds-forked-all:
> 
> shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS +1 similar issue
> igt@gem_mmap_offset@blt-coherency:
> 
> shard-apl: FAIL (i915#1635) -> PASS
> igt@kms_big_fb@linear-8bpp-rotate-0:
> 
> shard-kbl: DMESG-WARN (i915#1982) -> PASS
> igt@kms_draw_crc@draw-method-xrgb8888-render-untiled:
> 
> shard-glk: FAIL (i915#177 / i915#52 / i915#54) -> PASS
> igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
> 
> shard-glk: FAIL (i915#79) -> PASS
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-plflip-blt:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS
> igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-pwrite:
> 
> shard-apl: FAIL (i915#1635 / i915#49) -> PASS
> 
> shard-kbl: FAIL (i915#49) -> PASS
> 
> igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
> 
> shard-tglb: FAIL (i915#2416) -> PASS +1 similar issue
> igt@kms_psr@psr2_sprite_plane_move:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS +1 similar issue
> igt@perf@non-system-wide-paranoid:
> 
> shard-apl: SKIP (fdo#109271 / i915#1354 / i915#1635) -> PASS
> 
> shard-glk: SKIP (fdo#109271 / i915#1354) -> PASS
> 
> shard-iclb: SKIP (i915#1354) -> PASS
> 
> shard-kbl: SKIP (fdo#109271 / i915#1354) -> PASS
> 
> shard-tglb: SKIP (i915#1354) -> PASS
> 
> Warnings
> igt@kms_dp_dsc@basic-dsc-enable-edp:
> 
> shard-iclb: SKIP (fdo#109349) -> DMESG-WARN (i915#1226)
> igt@kms_frontbuffer_tracking@fbcpsr-1p-pri-indfb-multidraw:
> 
> shard-tglb: FAIL (i915#2416) -> DMESG-FAIL (i915#1982)
> igt@kms_frontbuffer_tracking@psr-rgb101010-draw-blt:
> 
> shard-tglb: DMESG-FAIL (i915#1982) -> FAIL (i915#2416)
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Participating hosts (8 -> 8)
> No changes in participating hosts
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5815 -> IGTPW_5069
> CI-20190529: 20190529
> CI_DRM_9138: 5e4234f97efbaa30f0beb243dcf98fe0a0bb0945 @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_5069: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5069/index.html
> IGT_5815: 0c3b29498a624ad42033a219d031cb9dd475405b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
