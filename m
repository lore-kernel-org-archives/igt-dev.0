Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8750B6E0D5
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2020 21:33:55 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Wed, 2 Sep 2020 21:33:53 +0000
Message-ID: <0ed9ef486f5a3e711bf7c16143d204832f23de0c.camel@intel.com>
References: <20200901173414.15012-1-jose.souza@intel.com>
 <159908219881.2094.8535417091709193036@emeril.freedesktop.org>
In-Reply-To: <159908219881.2094.8535417091709193036@emeril.freedesktop.org>
Content-Language: en-US
Content-ID: <FAC02CEA904E13448871829FEE48A355@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyTIEZpLkNJLklHVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?psr=3A_Check_for_DRRS_enabled_in_no=5Fdrrs_test_=28rev2=29?=
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

On Wed, 2020-09-02 at 21:29 +0000, Patchwork wrote:
> Patch Details
> Series:	tests/psr: Check for DRRS enabled in no_drrs test (rev2)
> URL:	https://patchwork.freedesktop.org/series/81234/
> State:	success
> Details:	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4937/index.html
> CI Bug Log - changes from IGT_5776_full -> IGTPW_4937_full
> Summary
> SUCCESS
> 
> No regressions found.

Pushed, thanks for the review GG.

> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4937/index.html
> 
> Known issues
> Here are the changes found in IGTPW_4937_full that come from known issues:
> 
> IGT changes
> Issues hit
> igt@gem_ctx_isolation@preservation-s3@bcs0:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#180) +6 similar issues
> igt@gem_exec_reloc@basic-concurrent0:
> 
> shard-glk: PASS -> TIMEOUT (i915#1958) +5 similar issues
> igt@gem_exec_reloc@basic-many-active@rcs0:
> 
> shard-apl: PASS -> FAIL (i915#1635 / i915#2389)
> 
> shard-hsw: PASS -> FAIL (i915#2389)
> 
> igt@gem_exec_whisper@basic-contexts:
> 
> shard-kbl: PASS -> TIMEOUT (i915#1958)
> igt@gem_exec_whisper@basic-contexts-forked:
> 
> shard-apl: PASS -> TIMEOUT (i915#1635 / i915#1958) +4 similar issues
> igt@gem_exec_whisper@basic-forked:
> 
> shard-iclb: PASS -> TIMEOUT (i915#1958) +2 similar issues
> igt@gem_partial_pwrite_pread@writes-after-reads-display:
> 
> shard-apl: PASS -> FAIL (i915#1635)
> igt@gem_sync@basic-store-all:
> 
> shard-iclb: PASS -> FAIL (i915#2356)
> igt@i915_selftest@mock@contexts:
> 
> shard-hsw: PASS -> INCOMPLETE (i915#2278)
> igt@kms_big_fb@y-tiled-64bpp-rotate-0:
> 
> shard-glk: PASS -> DMESG-FAIL (i915#118 / i915#95)
> igt@kms_color@pipe-b-legacy-gamma:
> 
> shard-kbl: PASS -> FAIL (i915#71)
> 
> shard-apl: PASS -> FAIL (i915#1635 / i915#71)
> 
> igt@kms_cursor_crc@pipe-a-cursor-128x128-sliding:
> 
> shard-kbl: PASS -> FAIL (i915#54)
> igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
> 
> shard-hsw: PASS -> FAIL (i915#96)
> igt@kms_flip@2x-dpms-vs-vblank-race@ab-hdmi-a1-hdmi-a2:
> 
> shard-glk: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> igt@kms_flip@2x-flip-vs-absolute-wf_vblank@ab-vga1-hdmi-a1:
> 
> shard-hsw: PASS -> DMESG-WARN (i915#1982)
> igt@kms_frontbuffer_tracking@fbc-2p-shrfb-fliptrack:
> 
> shard-glk: PASS -> FAIL (i915#49)
> igt@kms_frontbuffer_tracking@fbc-modesetfrombusy:
> 
> shard-tglb: PASS -> DMESG-WARN (i915#1982)
> igt@kms_psr@psr2_cursor_mmap_cpu:
> 
> shard-iclb: PASS -> SKIP (fdo#109441)
> igt@kms_universal_plane@universal-plane-gen9-features-pipe-a:
> 
> shard-kbl: PASS -> DMESG-WARN (i915#1982) +1 similar issue
> Possible fixes
> igt@gem_exec_reloc@basic-many-active@vecs0:
> 
> shard-glk: FAIL (i915#2389) -> PASS +2 similar issues
> igt@gem_exec_whisper@basic-fds-forked:
> 
> shard-glk: TIMEOUT (i915#1958) -> PASS
> igt@gem_exec_whisper@basic-forked:
> 
> shard-kbl: TIMEOUT (i915#1958) -> PASS
> igt@gem_exec_whisper@basic-forked-all:
> 
> shard-glk: DMESG-WARN (i915#118 / i915#95) -> PASS
> igt@gem_partial_pwrite_pread@reads-display:
> 
> shard-apl: FAIL (i915#1635) -> PASS
> igt@i915_selftest@mock@requests:
> 
> shard-apl: INCOMPLETE (i915#1635 / i915#2278) -> PASS
> igt@i915_suspend@debugfs-reader:
> 
> shard-kbl: INCOMPLETE (i915#155) -> PASS
> igt@kms_cursor_crc@pipe-b-cursor-256x85-onscreen:
> 
> shard-apl: FAIL (i915#1635 / i915#54) -> PASS
> 
> shard-kbl: FAIL (i915#54) -> PASS
> 
> igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
> 
> shard-hsw: FAIL -> PASS
> igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
> shard-hsw: FAIL (i915#2370) -> PASS
> igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
> shard-kbl: DMESG-WARN (i915#180) -> PASS +6 similar issues
> igt@kms_flip@plain-flip-fb-recreate@c-dp1:
> 
> shard-kbl: FAIL (i915#2122) -> PASS
> igt@kms_frontbuffer_tracking@fbc-badstride:
> 
> shard-glk: DMESG-WARN (i915#1982) -> PASS
> igt@kms_frontbuffer_tracking@psr-rgb565-draw-render:
> 
> shard-tglb: DMESG-WARN (i915#1982) -> PASS +1 similar issue
> igt@kms_psr@psr2_cursor_plane_move:
> 
> shard-iclb: SKIP (fdo#109441) -> PASS
> Warnings
> igt@kms_content_protection@atomic:
> 
> shard-apl: FAIL (fdo#110321 / fdo#110336 / i915#1635) -> TIMEOUT (i915#1319 / i915#1635 / i915#1958)
> igt@kms_vblank@pipe-d-ts-continuation-suspend:
> 
> shard-tglb: INCOMPLETE -> DMESG-WARN (i915#2411)
> igt@runner@aborted:
> 
> shard-hsw: FAIL (i915#2283) -> (FAIL, FAIL) (i915#1436 / i915#2283)
> Participating hosts (8 -> 8)
> No changes in participating hosts
> 
> Build changes
> CI: CI-20190529 -> None
> IGT: IGT_5776 -> IGTPW_4937
> CI-20190529: 20190529
> CI_DRM_8951: 5f8c53e35ef01a1d5e97db6005d3c308d3734bac @ git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_4937: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4937/index.html
> IGT_5776: 46e4315096bcaa2465c82c547274627365b1a69e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
