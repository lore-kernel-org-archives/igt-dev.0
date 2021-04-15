Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B77B6E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 07:49:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so13278814wrt.12
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 00:49:45 -0700 (PDT)
References: <20210414082556.14053-1-juhapekka.heikkila@gmail.com>
 <161839686780.4308.3128764735564059610@emeril.freedesktop.org>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <5ba616eb-9d94-76a3-8884-55edc06da3d4@gmail.com>
Date: Thu, 15 Apr 2021 10:49:37 +0300
MIME-Version: 1.0
In-Reply-To: <161839686780.4308.3128764735564059610@emeril.freedesktop.org>
Content-Language: en-US
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Fcrc=3A_Let=27s_not_create_full_screen_framebuffe?=
 =?utf-8?q?rs_in_a_loop?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Lakshmi,

here would be again 'false positives'. I was patching kms_cursor_crc 
only and those skips on cursor tests are expected skips as not supported 
cursor size.

/Juha-Pekka

On 14.4.2021 13.41, Patchwork wrote:
> *Patch Details*
> *Series:*	tests/kms_cursor_crc: Let's not create full screen 
> framebuffers in a loop
> *URL:*	https://patchwork.freedesktop.org/series/89063/
> *State:*	failure
> *Details:*	https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html
> 
> 
>   CI Bug Log - changes from CI_DRM_9967_full -> IGTPW_5743_full
> 
> 
>     Summary
> 
> *FAILURE*
> 
> Serious unknown changes coming with IGTPW_5743_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_5743_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/index.html
> 
> 
>     Possible new issues
> 
> Here are the unknown changes that may have been introduced in 
> IGTPW_5743_full:
> 
> 
>       IGT changes
> 
> 
>         Possible regressions
> 
>   *
> 
>     igt@i915_selftest@perf@region:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@i915_selftest@perf@region.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_selftest@perf@region.html>
>         +3 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_cursor_crc@pipe-b-cursor-32x10-offscreen.html>
> 
> 
>         Warnings
> 
>   * igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen:
>       o shard-tglb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
>         ([i915#3319]) -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb8/igt@kms_cursor_crc@pipe-a-cursor-32x10-offscreen.html>
>         +13 similar issues
> 
> 
>     Known issues
> 
> Here are the changes found in IGTPW_5743_full that come from known issues:
> 
> 
>       IGT changes
> 
> 
>         Issues hit
> 
>   *
> 
>     igt@gem_ctx_isolation@preservation-s3@vecs0:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl8/igt@gem_ctx_isolation@preservation-s3@vecs0.html>
>         ([i915#180])
>   *
> 
>     igt@gem_ctx_persistence@clone:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_ctx_persistence@clone.html>
>         ([fdo#109271] / [i915#1099]) +5 similar issues
>   *
> 
>     igt@gem_ctx_ringsize@create:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_ctx_ringsize@create.html>
>         ([i915#180] / [i915#62])
>   *
> 
>     igt@gem_exec_fair@basic-none@vcs0:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_exec_fair@basic-none@vcs0.html>
>         ([i915#2842]) +2 similar issues
>   *
> 
>     igt@gem_exec_fair@basic-pace-share@rcs0:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_fair@basic-pace-share@rcs0.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vcs1:
> 
>       o shard-tglb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vcs1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vcs1.html>
>         ([i915#2842])
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o
> 
>         shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html>
>         ([i915#2842]) +1 similar issue
> 
>       o
> 
>         shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_exec_fair@basic-pace@vecs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_exec_fair@basic-pace@vecs0.html>
>         ([i915#2842])
> 
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2849])
>   *
> 
>     igt@gem_exec_params@no-blt:
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_exec_params@no-blt.html>
>         ([fdo#109283])
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@gem_exec_params@no-blt.html>
>         ([fdo#109283])
> 
>   *
> 
>     igt@gem_exec_reloc@basic-wide-active@rcs0:
> 
>       o shard-snb: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@gem_exec_reloc@basic-wide-active@rcs0.html>
>         ([i915#2389]) +2 similar issues
>   *
> 
>     igt@gem_mmap_gtt@cpuset-basic-small-copy-xy:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_mmap_gtt@cpuset-basic-small-copy-xy.html>
>         ([i915#307])
>   *
> 
>     igt@gem_pread@exhaustion:
> 
>       o shard-snb: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@gem_pread@exhaustion.html>
>         ([i915#2658])
>   *
> 
>     igt@gem_pwrite@basic-exhaustion:
> 
>       o
> 
>         shard-kbl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
> 
>       o
> 
>         shard-apl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@gem_pwrite@basic-exhaustion.html>
>         ([i915#2658])
> 
>   *
> 
>     igt@gem_render_copy@linear-to-vebox-yf-tiled:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@gem_render_copy@linear-to-vebox-yf-tiled.html>
>         ([i915#768])
>   *
> 
>     igt@gem_render_copy@y-tiled-to-vebox-x-tiled:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@gem_render_copy@y-tiled-to-vebox-x-tiled.html>
>         ([fdo#109271]) +53 similar issues
>   *
> 
>     igt@gem_userptr_blits@input-checking:
> 
>       o shard-apl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@gem_userptr_blits@input-checking.html>
>         ([i915#3002])
>   *
> 
>     igt@gem_userptr_blits@process-exit-mmap@wb:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@gem_userptr_blits@process-exit-mmap@wb.html>
>         ([fdo#109271] / [i915#1699]) +3 similar issues
>   *
> 
>     igt@gem_userptr_blits@set-cache-level:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@gem_userptr_blits@set-cache-level.html>
>         ([i915#3324])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@gem_userptr_blits@set-cache-level.html>
>         ([i915#3324])
> 
>   *
> 
>     igt@gem_workarounds@suspend-resume:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_workarounds@suspend-resume.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@gem_workarounds@suspend-resume.html>
>         ([i915#180]) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@batch-zero-length:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gen9_exec_parse@batch-zero-length.html>
>         ([fdo#112306]) +1 similar issue
>   *
> 
>     igt@gen9_exec_parse@bb-secure:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@gen9_exec_parse@bb-secure.html>
>         ([fdo#112306]) +1 similar issue
>   *
> 
>     igt@i915_hangman@engine-error@vecs0:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@i915_hangman@engine-error@vecs0.html>
>         ([fdo#109271]) +208 similar issues
>   *
> 
>     igt@i915_module_load@reload:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@i915_module_load@reload.html>
>         ([i915#180] / [i915#203] / [i915#62])
>   *
> 
>     igt@i915_suspend@debugfs-reader:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb4/igt@i915_suspend@debugfs-reader.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@i915_suspend@debugfs-reader.html>
>         ([i915#1185])
>   *
> 
>     igt@kms_async_flips@test-time-stamp:
> 
>       o shard-snb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-snb7/igt@kms_async_flips@test-time-stamp.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb2/igt@kms_async_flips@test-time-stamp.html>
>         ([fdo#109271]) +1 similar issue
>   *
> 
>     igt@kms_big_fb@yf-tiled-addfb:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_big_fb@yf-tiled-addfb.html>
>         ([fdo#111615]) +1 similar issue
>   *
> 
>     igt@kms_big_joiner@invalid-modeset:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_big_joiner@invalid-modeset.html>
>         ([fdo#109271] / [i915#2705])
>   *
> 
>     igt@kms_chamelium@dp-frame-dump:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_chamelium@dp-frame-dump.html>
>         ([fdo#109284] / [fdo#111827]) +4 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@kms_chamelium@dp-frame-dump.html>
>         ([fdo#109271] / [fdo#111827]) +6 similar issues
> 
>   *
> 
>     igt@kms_chamelium@dp-hpd-for-each-pipe:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl3/igt@kms_chamelium@dp-hpd-for-each-pipe.html>
>         ([fdo#109271] / [fdo#111827]) +17 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-a-ctm-0-25:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb5/igt@kms_color_chamelium@pipe-a-ctm-0-25.html>
>         ([fdo#109271] / [fdo#111827]) +20 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-c-ctm-0-25:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_color_chamelium@pipe-c-ctm-0-25.html>
>         ([fdo#109284] / [fdo#111827]) +4 similar issues
>   *
> 
>     igt@kms_color_chamelium@pipe-d-ctm-limited-range:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@kms_color_chamelium@pipe-d-ctm-limited-range.html>
>         ([fdo#109271] / [fdo#111827]) +12 similar issues
>   *
> 
>     igt@kms_content_protection@atomic-dpms:
> 
>       o shard-kbl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_content_protection@atomic-dpms.html>
>         ([i915#1319]) +2 similar issues
>   *
> 
>     igt@kms_content_protection@dp-mst-lic-type-1:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         ([i915#3116])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         ([i915#3116])
> 
>   *
> 
>     igt@kms_content_protection@lic:
> 
>       o shard-apl: NOTRUN -> TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_content_protection@lic.html>
>         ([i915#1319])
>   *
> 
>     igt@kms_content_protection@mei_interface:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_content_protection@mei_interface.html>
>         ([fdo#109300] / [fdo#111066])
>   *
> 
>     igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_cursor_crc@pipe-a-cursor-32x32-offscreen.html>
>         ([i915#3319]) +2 similar issues
>   *
> 
>     igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_cursor_crc@pipe-d-cursor-32x32-rapid-movement.html>
>         ([fdo#109278]) +7 similar issues
>   *
> 
>     igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge:
> 
>       o shard-snb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-snb7/igt@kms_cursor_edge_walk@pipe-d-128x128-right-edge.html>
>         ([fdo#109271]) +363 similar issues
>   *
> 
>     igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html>
>         ([fdo#109274] / [fdo#109278]) +1 similar issue
>   *
> 
>     igt@kms_cursor_legacy@pipe-d-torture-bo:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +3 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk6/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
> 
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk8/igt@kms_draw_crc@draw-method-rgb565-mmap-gtt-ytiled.html>
>         ([i915#52] / [i915#54])
>   *
> 
>     igt@kms_flip@2x-modeset-vs-vblank-race:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@kms_flip@2x-modeset-vs-vblank-race.html>
>         ([fdo#109274])
>   *
> 
>     igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
> 
>       o shard-kbl: NOTRUN -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>         ([i915#180]) +9 similar issues
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs:
> 
>       o
> 
>         shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2641])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2587])
> 
>       o
> 
>         shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2628])
> 
>       o
> 
>         shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs.html>
>         ([i915#2641])
> 
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs.html>
>         ([fdo#109271] / [i915#2672])
>   *
> 
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile.html>
>         ([fdo#109271] / [i915#2642]) +1 similar issue
>   *
> 
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-move.html>
>         ([fdo#109280]) +10 similar issues
>   *
> 
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
> 
>       o shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html>
>         ([fdo#111825]) +12 similar issues
>   *
> 
>     igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb5/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         ([fdo#109289])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb7/igt@kms_pipe_b_c_ivb@from-pipe-c-to-b-with-3-lanes.html>
>         ([fdo#109289])
> 
>   *
> 
>     igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-d.html>
>         ([fdo#109271] / [i915#533]) +1 similar issue
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-alpha-basic:
> 
>       o shard-glk: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_alpha_blend@pipe-b-alpha-basic.html>
>         ([fdo#108145] / [i915#265])
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max:
> 
>       o shard-apl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_plane_alpha_blend@pipe-b-constant-alpha-max.html>
>         ([fdo#108145] / [i915#265]) +3 similar issues
>   *
> 
>     igt@kms_plane_alpha_blend@pipe-c-alpha-basic:
> 
>       o shard-kbl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@kms_plane_alpha_blend@pipe-c-alpha-basic.html>
>         ([fdo#108145] / [i915#265]) +2 similar issues
>   *
> 
>     igt@kms_plane_cursor@pipe-a-primary-size-128:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@kms_plane_cursor@pipe-a-primary-size-128.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_plane_cursor@pipe-a-primary-size-128.html>
>         ([i915#62]) +3 similar issues
>   *
> 
>     igt@kms_plane_cursor@pipe-a-primary-size-64:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk7/igt@kms_plane_cursor@pipe-a-primary-size-64.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@kms_plane_cursor@pipe-a-primary-size-64.html>
>         ([i915#2657])
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
>       o
> 
>         shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +5 similar issues
> 
>       o
> 
>         shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([fdo#109271] / [i915#658]) +2 similar issues
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2.html>
>         ([i915#658])
> 
>   *
> 
>     igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>         ([fdo#109271] / [i915#658]) +7 similar issues
>   *
> 
>     igt@kms_psr2_su@page_flip:
> 
>       o shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb1/igt@kms_psr2_su@page_flip.html>
>         ([fdo#109642] / [fdo#111068] / [i915#658])
>   *
> 
>     igt@kms_psr@psr2_cursor_render:
> 
>       o shard-iclb: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb2/igt@kms_psr@psr2_cursor_render.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@kms_psr@psr2_cursor_render.html>
>         ([fdo#109441]) +2 similar issues
>   *
> 
>     igt@kms_universal_plane@disable-primary-vs-flip-pipe-c:
> 
>       o shard-kbl: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl6/igt@kms_universal_plane@disable-primary-vs-flip-pipe-c.html>
>         ([i915#180] / [i915#62]) +4 similar issues
>   *
> 
>     igt@kms_vblank@pipe-c-accuracy-idle:
> 
>       o shard-glk: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk9/igt@kms_vblank@pipe-c-accuracy-idle.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk7/igt@kms_vblank@pipe-c-accuracy-idle.html>
>         ([i915#43])
>   *
> 
>     igt@kms_writeback@writeback-fb-id:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl1/igt@kms_writeback@writeback-fb-id.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@kms_writeback@writeback-pixel-formats:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@kms_writeback@writeback-pixel-formats.html>
>         ([fdo#109271] / [i915#2437])
>   *
> 
>     igt@nouveau_crc@pipe-a-source-rg:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb4/igt@nouveau_crc@pipe-a-source-rg.html>
>         ([i915#2530]) +1 similar issue
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@nouveau_crc@pipe-a-source-rg.html>
>         ([i915#2530]) +1 similar issue
> 
>   *
> 
>     igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl6/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html>
>         ([fdo#109271]) +192 similar issues
>   *
> 
>     igt@prime_nv_pcopy@test3_3:
> 
>       o
> 
>         shard-iclb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb8/igt@prime_nv_pcopy@test3_3.html>
>         ([fdo#109291])
> 
>       o
> 
>         shard-tglb: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb2/igt@prime_nv_pcopy@test3_3.html>
>         ([fdo#109291])
> 
>   *
> 
>     igt@sysfs_clients@recycle-many:
> 
>       o shard-apl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-apl7/igt@sysfs_clients@recycle-many.html>
>         ([fdo#109271] / [i915#2994]) +2 similar issues
>   *
> 
>     igt@sysfs_clients@sema-50:
> 
>       o shard-glk: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk3/igt@sysfs_clients@sema-50.html>
>         ([fdo#109271] / [i915#2994])
>   *
> 
>     igt@sysfs_clients@split-50:
> 
>       o shard-kbl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@sysfs_clients@split-50.html>
>         ([fdo#109271] / [i915#2994]) +1 similar issue
> 
> 
>         Possible fixes
> 
>   *
> 
>     igt@gem_create@create-clear:
> 
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_create@create-clear.html>
>         ([i915#3160]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb6/igt@gem_create@create-clear.html>
>   *
> 
>     igt@gem_eio@in-flight-contexts-1us:
> 
>       o shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb8/igt@gem_eio@in-flight-contexts-1us.html>
>         ([i915#3063]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@in-flight-contexts-1us.html>
>   *
> 
>     igt@gem_eio@unwedge-stress:
> 
>       o
> 
>         shard-tglb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_eio@unwedge-stress.html>
>         ([i915#2369] / [i915#3063]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb1/igt@gem_eio@unwedge-stress.html>
> 
>       o
> 
>         shard-iclb: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@gem_eio@unwedge-stress.html>
>         ([i915#2369] / [i915#2481] / [i915#3070]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_eio@unwedge-stress.html>
> 
>   *
> 
>     igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
>       o shard-kbl: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl1/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl7/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-pace@vecs0:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb5/igt@gem_exec_fair@basic-pace@vecs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html>
>   *
> 
>     igt@gem_exec_fair@basic-throttle@rcs0:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk8/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         ([i915#2842]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk5/igt@gem_exec_fair@basic-throttle@rcs0.html>
>         +1 similar issue
>   *
> 
>     igt@gem_exec_whisper@basic-queues-forked-all:
> 
>       o shard-glk: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk2/igt@gem_exec_whisper@basic-queues-forked-all.html>
>         ([i915#118] / [i915#95]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk9/igt@gem_exec_whisper@basic-queues-forked-all.html>
>   *
> 
>     igt@gem_exec_whisper@basic-queues-priority:
> 
>       o shard-iclb: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb7/igt@gem_exec_whisper@basic-queues-priority.html>
>         ([i915#1895]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb3/igt@gem_exec_whisper@basic-queues-priority.html>
>   *
> 
>     igt@gem_workarounds@suspend-resume-fd:
> 
>       o shard-kbl: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl4/igt@gem_workarounds@suspend-resume-fd.html>
>         ([i915#155] / [i915#2405]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl2/igt@gem_workarounds@suspend-resume-fd.html>
>   *
> 
>     igt@i915_suspend@debugfs-reader:
> 
>       o shard-kbl: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-kbl2/igt@i915_suspend@debugfs-reader.html>
>         ([i915#180]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-kbl4/igt@i915_suspend@debugfs-reader.html>
>         +2 similar issues
>   *
> 
>     igt@kms_async_flips@test-time-stamp:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb3/igt@kms_async_flips@test-time-stamp.html>
>         ([i915#2574]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb3/igt@kms_async_flips@test-time-stamp.html>
>   *
> 
>     igt@kms_draw_crc@draw-method-rgb565-render-ytiled:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html>
>         ([i915#52] / [i915#54]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_draw_crc@draw-method-rgb565-render-ytiled.html>
>         +6 similar issues
>   *
> 
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
> 
>       o shard-tglb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-tglb2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>         ([i915#79]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-tglb6/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html>
>   *
> 
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt:
> 
>       o shard-glk: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-glk3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>         ([i915#49]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-gtt.html>
>   *
> 
>     igt@kms_psr2_su@frontbuffer:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb8/igt@kms_psr2_su@frontbuffer.html>
>         ([fdo#109642] / [fdo#111068] / [i915#658]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr2_su@frontbuffer.html>
>   *
> 
>     igt@kms_psr@psr2_basic:
> 
>       o shard-iclb: SKIP
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb3/igt@kms_psr@psr2_basic.html>
>         ([fdo#109441]) -> PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@kms_psr@psr2_basic.html>
>         +2 similar issues
> 
> 
>         Warnings
> 
>   * igt@gem_exec_fair@basic-none-rrul@rcs0:
>       o shard-iclb: FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9967/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2842]) -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5743/shard-iclb2/igt@gem_exec_fair@basic-none-rrul@rcs0.html>
>         ([i915#2852])
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
