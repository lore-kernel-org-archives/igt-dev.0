Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A7A6E0DB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 15:31:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id 22so20748087lfy.12
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 08:31:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210712163116.384942-1-markyacoub@chromium.org>
 <162612151196.23770.4366764183722483102@emeril.freedesktop.org>
In-Reply-To: <162612151196.23770.4366764183722483102@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 13 Jul 2021 11:31:25 -0400
Message-ID: <CAJUqKUoG_sEMoNYQRf71ZjZNO1=m8SfT7Wv5DzZU34hhrWcaCQ@mail.gmail.com>
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?kms=5Fconcurrent=3A_Replace_fb_modifier_to_DRM=5FFORMAT?=
	=?utf-8?q?=5FMOD=5FLINEAR?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1088639666=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1088639666==
Content-Type: multipart/alternative; boundary="000000000000f130c405c702eeba"

--000000000000f130c405c702eeba
Content-Type: text/plain; charset="UTF-8"

I don't see my changes affecting the failing tests. looks like a false
positive.

On Mon, Jul 12, 2021 at 4:25 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/kms_concurrent: Replace fb modifier to
> DRM_FORMAT_MOD_LINEAR
> *URL:* https://patchwork.freedesktop.org/series/92444/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/index.html CI
> Bug Log - changes from CI_DRM_10334_full -> IGTPW_6015_full Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6015_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6015_full, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/index.html
> Possible new issues
>
> Here are the unknown changes that may have been introduced in
> IGTPW_6015_full:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_exec_endless@dispatch@rcs0:
>    - shard-glk: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk5/igt@gem_exec_endless@dispatch@rcs0.html>
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk2/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6015_full that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@drm_read@short-buffer-nonblock:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk3/igt@drm_read@short-buffer-nonblock.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@drm_read@short-buffer-nonblock.html>
>       ([i915#118] / [i915#95]) +1 similar issue
>    -
>
>    igt@feature_discovery@display-4x:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@feature_discovery@display-4x.html>
>       ([i915#1839])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb7/igt@feature_discovery@display-4x.html>
>       ([i915#1839])
>       -
>
>    igt@gem_create@create-massive:
>    -
>
>       shard-iclb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb6/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-snb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-snb5/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-tglb: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>       shard-glk: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk9/igt@gem_create@create-massive.html>
>       ([i915#3002])
>       -
>
>    igt@gem_ctx_isolation@preservation-s3@vcs0:
>    - shard-kbl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@vcs0.html>
>       ([i915#180]) +6 similar issues
>    -
>
>    igt@gem_ctx_persistence@legacy-engines-mixed:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-snb2/igt@gem_ctx_persistence@legacy-engines-mixed.html>
>       ([fdo#109271] / [i915#1099]) +4 similar issues
>    -
>
>    igt@gem_exec_fair@basic-none-share@rcs0:
>    -
>
>       shard-iclb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([i915#2842])
>       -
>
>       shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html>
>       ([i915#2842])
>       -
>
>    igt@gem_exec_fair@basic-none@vecs0:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-pace@bcs0:
>    - shard-tglb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html>
>       ([i915#2842])
>    -
>
>    igt@gem_exec_fair@basic-throttle@rcs0:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html>
>       ([i915#2849])
>    -
>
>    igt@gem_exec_suspend@basic-s3:
>    - shard-apl: NOTRUN -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl1/igt@gem_exec_suspend@basic-s3.html>
>       ([i915#180])
>    -
>
>    igt@gem_mmap_gtt@big-copy-odd:
>    - shard-glk: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html>
>       ([i915#307])
>    -
>
>    igt@gem_mmap_gtt@coherency:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_mmap_gtt@coherency.html>
>       ([fdo#111656])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@gem_mmap_gtt@coherency.html>
>       ([fdo#109292])
>       -
>
>    igt@gem_userptr_blits@readonly-pwrite-unsync:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-unsync.html>
>       ([i915#3297]) +1 similar issue
>    -
>
>    igt@gem_userptr_blits@unsync-unmap-after-close:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-after-close.html>
>       ([i915#3297]) +1 similar issue
>    -
>
>    igt@gen3_render_linear_blits:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@gen3_render_linear_blits.html>
>       ([fdo#109289]) +3 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb7/igt@gen3_render_linear_blits.html>
>       ([fdo#109289]) +3 similar issues
>       -
>
>    igt@gen9_exec_parse@basic-rejected:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@gen9_exec_parse@basic-rejected.html>
>       ([fdo#112306]) +2 similar issues
>    -
>
>    igt@gen9_exec_parse@bb-start-out:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@gen9_exec_parse@bb-start-out.html>
>       ([fdo#112306]) +3 similar issues
>    -
>
>    igt@i915_pm_dc@dc6-psr:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb7/igt@i915_pm_dc@dc6-psr.html>
>       ([i915#3698])
>    -
>
>    igt@i915_pm_rpm@modeset-non-lpsp-stress:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#111644] / [i915#1397] / [i915#2411])
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress.html>
>       ([fdo#110892])
>       -
>
>    igt@kms_atomic_transition@plane-all-modeset-transition:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb8/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>       ([i915#1769])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_atomic_transition@plane-all-modeset-transition.html>
>       ([i915#1769])
>       -
>
>    igt@kms_big_fb@linear-16bpp-rotate-90:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>       ([fdo#111614])
>    -
>
>    igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html>
>       ([fdo#111615]) +1 similar issue
>    -
>
>    igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs.html>
>       ([i915#3689]) +8 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-crc-nonplanar-formats:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk7/igt@kms_chamelium@hdmi-crc-nonplanar-formats.html>
>       ([fdo#109271] / [fdo#111827]) +7 similar issues
>    -
>
>    igt@kms_chamelium@hdmi-hpd-fast:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-snb6/igt@kms_chamelium@hdmi-hpd-fast.html>
>       ([fdo#109271] / [fdo#111827]) +23 similar issues
>    -
>
>    igt@kms_chamelium@vga-edid-read:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl6/igt@kms_chamelium@vga-edid-read.html>
>       ([fdo#109271] / [fdo#111827]) +18 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red-to-blue.html>
>       ([fdo#109284] / [fdo#111827]) +7 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-b-ctm-0-75:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-75.html>
>       ([fdo#109284] / [fdo#111827]) +7 similar issues
>    -
>
>    igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blue-to-red.html>
>       ([fdo#109278] / [fdo#109284] / [fdo#111827])
>    -
>
>    igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes.html>
>       ([fdo#109271] / [fdo#111827]) +14 similar issues
>    -
>
>    igt@kms_content_protection@atomic:
>    - shard-kbl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl4/igt@kms_content_protection@atomic.html>
>       ([i915#1319]) +1 similar issue
>    -
>
>    igt@kms_content_protection@atomic-dpms:
>    - shard-apl: NOTRUN -> TIMEOUT
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_content_protection@atomic-dpms.html>
>       ([i915#1319]) +1 similar issue
>    -
>
>    igt@kms_content_protection@content_type_change:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_content_protection@content_type_change.html>
>       ([fdo#109300] / [fdo#111066]) +2 similar issues
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_content_protection@content_type_change.html>
>       ([fdo#111828]) +2 similar issues
>       -
>
>    igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen.html>
>       ([i915#3319])
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement.html>
>       ([i915#3359]) +2 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-512x170-random:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x170-random.html>
>       ([fdo#109278] / [fdo#109279]) +2 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-512x512-random:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x512-random.html>
>       ([fdo#109279] / [i915#3359]) +2 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-suspend:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html>
>       ([i915#3444])
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen.html>
>       ([fdo#109271]) +165 similar issues
>    -
>
>    igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen.html>
>       ([fdo#109278]) +23 similar issues
>    -
>
>    igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html>
>       ([fdo#109274] / [fdo#109278]) +2 similar issues
>    -
>
>    igt@kms_cursor_legacy@pipe-d-torture-bo:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>       ([fdo#109271] / [i915#533])
>       -
>
>       shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.html>
>       ([fdo#109271] / [i915#533]) +2 similar issues
>       -
>
>    igt@kms_dp_tiled_display@basic-test-pattern:
>    -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pattern.html>
>       ([i915#426])
>       -
>
>    igt@kms_flip@2x-plain-flip-ts-check:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.html>
>       ([fdo#111825]) +25 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb6/igt@kms_flip@2x-plain-flip-ts-check.html>
>       ([fdo#109274]) +2 similar issues
>       -
>
>    igt@kms_flip@flip-vs-suspend@c-dp1:
>    - shard-kbl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html>
>       ([i915#180]) +6 similar issues
>    -
>
>    igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:
>    - shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs.html>
>       ([fdo#109271] / [i915#2672])
>    -
>
>    igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
>    - shard-snb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html>
>       ([fdo#109271]) +430 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt.html>
>       ([fdo#109280]) +20 similar issues
>    -
>
>    igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:
>    - shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu.html>
>       ([fdo#109271]) +72 similar issues
>    -
>
>    igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:
>    - shard-apl: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.html>
>       ([i915#180])
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb.html>
>       ([fdo#108145] / [i915#265]) +1 similar issue
>    -
>
>    igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:
>    - shard-kbl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb.html>
>       ([i915#265])
>    -
>
>    igt@kms_psr2_sf@cursor-plane-update-sf:
>    - shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf.html>
>       ([i915#2920]) +2 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1.html>
>       ([i915#658]) +2 similar issues
>    -
>
>    igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:
>    -
>
>       shard-kbl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>       -
>
>       shard-glk: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3.html>
>       ([fdo#109271] / [i915#658]) +2 similar issues
>       -
>
>    igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5.html>
>       ([fdo#109271] / [i915#658]) +3 similar issues
>    -
>
>    igt@kms_psr@psr2_cursor_plane_onoff:
>    - shard-iclb: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html>
>       ([fdo#109441]) +2 similar issues
>    -
>
>    igt@kms_psr@psr2_primary_mmap_cpu:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html>
>       ([fdo#109441]) +1 similar issue
>    -
>
>    igt@kms_psr@psr2_sprite_render:
>    - shard-tglb: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_psr@psr2_sprite_render.html>
>       ([i915#132] / [i915#3467]) +2 similar issues
>    -
>
>    igt@kms_sysfs_edid_timing:
>    - shard-apl: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_sysfs_edid_timing.html>
>       ([IGT#2])
>    -
>
>    igt@kms_writeback@writeback-pixel-formats:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_writeback@writeback-pixel-formats.html>
>       ([fdo#109271] / [i915#2437])
>    -
>
>    igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl2/igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame.html>
>       ([fdo#109271]) +201 similar issues
>    -
>
>    igt@nouveau_crc@pipe-c-ctx-flip-detection:
>    - shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-detection.html>
>       ([i915#2530]) +1 similar issue
>    -
>
>    igt@nouveau_crc@pipe-d-ctx-flip-detection:
>    -
>
>       shard-tglb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>       ([i915#2530]) +2 similar issues
>       -
>
>       shard-iclb: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-detection.html>
>       ([fdo#109278] / [i915#2530])
>       -
>
>    igt@sysfs_clients@recycle:
>    - shard-apl: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-apl6/igt@sysfs_clients@recycle.html>
>       ([fdo#109271] / [i915#2994])
>    -
>
>    igt@vgem_basic@unload:
>    - shard-snb: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-snb5/igt@vgem_basic@unload.html>
>       ([i915#3744])
>
> Possible fixes
>
>    -
>
>    igt@gem_exec_fair@basic-none@rcs0:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html>
>       +3 similar issues
>    -
>
>    igt@gem_exec_fair@basic-pace@rcs0:
>    - shard-kbl: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html>
>       ([fdo#109271]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html>
>       +1 similar issue
>    -
>
>    igt@gem_exec_fair@basic-pace@vecs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html>
>       ([i915#2842]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0.html>
>       +2 similar issues
>    -
>
>    igt@gen9_exec_parse@allowed-all:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk6/igt@gen9_exec_parse@allowed-all.html>
>       ([i915#1436] / [i915#716]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@gen9_exec_parse@allowed-all.html>
>    -
>
>    igt@kms_big_fb@linear-32bpp-rotate-180:
>    - shard-glk: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>       ([i915#118] / [i915#95]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk3/igt@kms_big_fb@linear-32bpp-rotate-180.html>
>    -
>
>    igt@kms_cursor_crc@pipe-a-cursor-64x64-random:
>    - shard-kbl: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>       ([i915#3444]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl3/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html>
>    -
>
>    igt@kms_cursor_crc@pipe-c-cursor-256x85-random:
>    - shard-iclb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.html>
>       +1 similar issue
>    -
>
>    igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:
>    - shard-kbl: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       ([i915#180]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.html>
>       +5 similar issues
>    -
>
>    igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html>
>       ([i915#2122]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html>
>    -
>
>    igt@kms_psr@psr2_dpms:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb8/igt@kms_psr@psr2_dpms.html>
>       ([fdo#109441]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_psr@psr2_dpms.html>
>       +2 similar issues
>    -
>
>    igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
>    - shard-kbl: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html>
>       ([i915#155] / [i915#2828]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html>
>    -
>
>    igt@kms_vblank@pipe-c-accuracy-idle:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html>
>       ([i915#43]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@kms_vblank@pipe-c-accuracy-idle.html>
>    -
>
>    igt@perf@polling-parameterized:
>    - shard-glk: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-glk2/igt@perf@polling-parameterized.html>
>       ([i915#1542]) -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk9/igt@perf@polling-parameterized.html>
>
> Warnings
>
>    -
>
>    igt@gem_exec_fair@basic-none-solo@rcs0:
>    - shard-tglb: FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       ([i915#2849]) -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_exec_fair@basic-none-solo@rcs0.html>
>       ([i915#2842])
>    -
>
>    igt@i915_pm_rc6_residency@rc6-idle:
>    - shard-iclb: WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html>
>       ([i915#2684]) -> WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html>
>       ([i915#1804] / [i915#2684])
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>       ([i915#2920]) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html>
>       ([i915#658]) +1 similar issue
>    -
>
>    igt@kms_psr2_sf@plane-move-sf-dmg-area-3:
>    - shard-iclb: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
>       ([i915#658]) -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html>
>       ([i915#2920]) +2 similar issues
>    -
>
>    igt@runner@aborted:
>    - shard-kbl: (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl6/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl3/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@runner@aborted.html>)
>       ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#2722] /
>       [i915#3002] / [i915#3363] / [i915#3744]) -> (FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl7/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl3/igt@runner@aborted.html>,
>       FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@runner@aborted.html>,
>       FAIL <https://intel-gfx-ci.01.org/tre>, [FAIL][145], [FAIL][146])
>       ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#2722] /
>       [i915#3363] / [i915#3744] / [i915#602])
>
>

--000000000000f130c405c702eeba
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t see my changes affecting the failing tests. lo=
oks like a false positive.</div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr" class=3D"gmail_attr">On Mon, Jul 12, 2021 at 4:25 PM Patchwork &lt;<a =
href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedeskt=
op.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/kms_concurrent: Replace fb modi=
fier to DRM_FORMAT_MOD_LINEAR</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/92444/" target=3D"_blank">https://patchwork.freedesktop.org/series/924=
44/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6015/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_10334_full -&gt; IGTPW_6015_full</=
h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_6015_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_6015_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6015/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6015/index.html</a></p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6015=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_exec_endless@dispatch@rcs0:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-glk5/igt@gem_exec_endless@dispatch@rcs0.html=
" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk8/igt@kms_frontbuffer_tracking@fbc-1p-shrfb-fliptrac=
k-mmap-gtt.html" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk2/igt@kms_frontbuffer_tracki=
ng@fbc-1p-shrfb-fliptrack-mmap-gtt.html" target=3D"_blank">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6015_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@drm_read@short-buffer-nonblock:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk3/igt@drm_read@short-buffer-nonblock.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6015/shard-glk1/igt@drm_read@short-buffer-nonblock.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#118] / [i915#95]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@feature_discovery@display-4x:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb7/igt@feature_discovery@display-4x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb7/igt@feature_discovery@display-4x.html" =
target=3D"_blank">SKIP</a> ([i915#1839])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_create@create-massive:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb6/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-snb5/igt@gem_create@create-massive.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb2/igt@gem_create@create-massive.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-glk9/igt@gem_create@create-massive.html" targ=
et=3D"_blank">DMESG-WARN</a> ([i915#3002])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_ctx_isolation@preservation-s3@vcs0:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@gem_ctx_isolation@preservation-s3@v=
cs0.html" target=3D"_blank">DMESG-WARN</a> ([i915#180]) +6 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@gem_ctx_persistence@legacy-engines-mixed:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-snb2/igt@gem_ctx_persistence@legacy-engines-=
mixed.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#1099]) +4 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none-share@rcs0:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb6/igt@gem_exec_fair@basic-none-share@rcs0=
.html" target=3D"_blank">FAIL</a> ([i915#2842])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_10334/shard-glk8/igt@gem_exec_fair@basic-none-share@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6015/shard-glk1/igt@gem_exec_fair@basic-none-share@rcs0.html" ta=
rget=3D"_blank">FAIL</a> ([i915#2842])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-none@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl1/igt@gem_exec_fair@basic-none@vecs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6015/shard-kbl6/igt@gem_exec_fair@basic-none@vecs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@bcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-tglb3/igt@gem_exec_fair@basic-pace@bcs0.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6015/shard-tglb6/igt@gem_exec_fair@basic-pace@bcs0.html" target=3D"_=
blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb6/igt@gem_exec_fair@basic-throttle@rcs0.html" targe=
t=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm=
-tip/IGTPW_6015/shard-iclb2/igt@gem_exec_fair@basic-throttle@rcs0.html" tar=
get=3D"_blank">FAIL</a> ([i915#2849])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl1/igt@gem_exec_suspend@basic-s3.html" tar=
get=3D"_blank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@big-copy-odd:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html" target=3D"_bla=
nk">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_6015/shard-glk7/igt@gem_mmap_gtt@big-copy-odd.html" target=3D"_blank">FAI=
L</a> ([i915#307])</li>
</ul>
</li>
<li>
<p>igt@gem_mmap_gtt@coherency:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> ([fdo#111656])</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb2/igt@gem_mmap_gtt@coherency.html" target=
=3D"_blank">SKIP</a> ([fdo#109292])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@gem_userptr_blits@readonly-pwrite-=
unsync.html" target=3D"_blank">SKIP</a> ([i915#3297]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@unsync-unmap-after-close:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_userptr_blits@unsync-unmap-aft=
er-close.html" target=3D"_blank">SKIP</a> ([i915#3297]) +1 similar issue</l=
i>
</ul>
</li>
<li>
<p>igt@gen3_render_linear_blits:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb7/igt@gen3_render_linear_blits.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb7/igt@gen3_render_linear_blits.html" targ=
et=3D"_blank">SKIP</a> ([fdo#109289]) +3 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@basic-rejected:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@gen9_exec_parse@basic-rejected.htm=
l" target=3D"_blank">SKIP</a> ([fdo#112306]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@bb-start-out:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@gen9_exec_parse@bb-start-out.html"=
 target=3D"_blank">SKIP</a> ([fdo#112306]) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb7/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015=
/shard-iclb7/igt@i915_pm_dc@dc6-psr.html" target=3D"_blank">DMESG-WARN</a> =
([i915#3698])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#111644] / [i915#1397] / [i915#2411]=
)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb7/igt@i915_pm_rpm@modeset-non-lpsp-stress=
.html" target=3D"_blank">SKIP</a> ([fdo#110892])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb8/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_atomic_transition@plane-all-mod=
eset-transition.html" target=3D"_blank">SKIP</a> ([i915#1769])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_big_fb@linear-16bpp-rotate-90.=
html" target=3D"_blank">SKIP</a> ([fdo#111614])</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_big_fb@yf-tiled-max-hw-stride-=
32bpp-rotate-0-async-flip.html" target=3D"_blank">SKIP</a> ([fdo#111615]) +=
1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-a-bad-pixel-format-y_tiled_gen12_mc_ccs:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_ccs@pipe-a-bad-pixel-format-y_=
tiled_gen12_mc_ccs.html" target=3D"_blank">SKIP</a> ([i915#3689]) +8 simila=
r issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-glk7/igt@kms_chamelium@hdmi-crc-nonplanar-fo=
rmats.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +7 sim=
ilar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@hdmi-hpd-fast:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-snb6/igt@kms_chamelium@hdmi-hpd-fast.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +23 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@vga-edid-read:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl6/igt@kms_chamelium@vga-edid-read.html" t=
arget=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]) +18 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-a-ctm-red-to-blue:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb6/igt@kms_color_chamelium@pipe-a-ctm-red=
-to-blue.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-b-ctm-0-75:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_color_chamelium@pipe-b-ctm-0-7=
5.html" target=3D"_blank">SKIP</a> ([fdo#109284] / [fdo#111827]) +7 similar=
 issues</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-d-ctm-blue-to-red:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_color_chamelium@pipe-d-ctm-blu=
e-to-red.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109284] / [f=
do#111827])</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-invalid-gamma-lut-sizes:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_color_chamelium@pipe-invalid-ga=
mma-lut-sizes.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [fdo#111827]=
) +14 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl4/igt@kms_content_protection@atomic.html"=
 target=3D"_blank">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_content_protection@atomic-dpms.=
html" target=3D"_blank">TIMEOUT</a> ([i915#1319]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content_type_change:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_content_protection@content_type=
_change.html" target=3D"_blank">SKIP</a> ([fdo#109300] / [fdo#111066]) +2 s=
imilar issues</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_content_protection@content_type=
_change.html" target=3D"_blank">SKIP</a> ([fdo#111828]) +2 similar issues</=
p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-32x32-onscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_cursor_crc@pipe-a-cursor-32x32=
-onscreen.html" target=3D"_blank">SKIP</a> ([i915#3319])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-32x10-rapid-movement:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-32x10=
-rapid-movement.html" target=3D"_blank">SKIP</a> ([i915#3359]) +2 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-random:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-random.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [fdo#109279]) +2=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x512-random:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_cursor_crc@pipe-c-cursor-512x5=
12-random.html" target=3D"_blank">SKIP</a> ([fdo#109279] / [i915#3359]) +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl3/igt@kms_cursor_crc@pipe-c-cursor-suspend.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6015/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-suspend.html"=
 target=3D"_blank">FAIL</a> ([i915#3444])</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-256x256-onscreen:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@kms_cursor_crc@pipe-d-cursor-256x25=
6-onscreen.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +165 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-d-cursor-32x10-offscreen:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_cursor_crc@pipe-d-cursor-32x10=
-offscreen.html" target=3D"_blank">SKIP</a> ([fdo#109278]) +23 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb8/igt@kms_cursor_legacy@2x-flip-vs-curso=
r-atomic.html" target=3D"_blank">SKIP</a> ([fdo#109274] / [fdo#109278]) +2 =
similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@pipe-d-torture-bo:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-kbl7/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-apl8/igt@kms_cursor_legacy@pipe-d-torture-bo.=
html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#533]) +2 similar iss=
ues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_dp_tiled_display@basic-test-pattern:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb3/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb7/igt@kms_dp_tiled_display@basic-test-pat=
tern.html" target=3D"_blank">SKIP</a> ([i915#426])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb6/igt@kms_flip@2x-plain-flip-ts-check.htm=
l" target=3D"_blank">SKIP</a> ([fdo#111825]) +25 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb6/igt@kms_flip@2x-plain-flip-ts-check.htm=
l" target=3D"_blank">SKIP</a> ([fdo#109274]) +2 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl7/igt@kms_flip@flip-vs-suspend@c-dp1.html" target=3D=
"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6015/shard-kbl1/igt@kms_flip@flip-vs-suspend@c-dp1.html" target=3D"_=
blank">DMESG-WARN</a> ([i915#180]) +6 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_flip_scaled_crc@flip-64bpp-ytil=
e-to-32bpp-ytilercccs.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i91=
5#2672])</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-snb7/igt@kms_frontbuffer_tracking@fbc-2p-pri=
mscrn-shrfb-msflip-blt.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +430=
 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-shrfb-fliptrack-mmap-gtt:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-shrfb-fliptrack-mmap-gtt.html" target=3D"_blank">SKIP</a> ([fdo#109280]) +=
20 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-cpu:</p>
<ul>
<li>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-glk5/igt@kms_frontbuffer_tracking@psr-rgb565=
-draw-mmap-cpu.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +72 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b:</p>
<ul>
<li>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-apl1/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-b.htm=
l" target=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_pipe_crc_basic@suspend-read-crc-=
pipe-b.html" target=3D"_blank">DMESG-WARN</a> ([i915#180])</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-opaque-fb:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
opaque-fb.html" target=3D"_blank">FAIL</a> ([fdo#108145] / [i915#265]) +1 s=
imilar issue</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@pipe-a-alpha-transparent-fb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@kms_plane_alpha_blend@pipe-a-alpha-=
transparent-fb.html" target=3D"_blank">FAIL</a> ([i915#265])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-update-sf:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb2/igt@kms_psr2_sf@cursor-plane-update-sf=
.html" target=3D"_blank">SKIP</a> ([i915#2920]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-1:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-s=
f-dmg-area-1.html" target=3D"_blank">SKIP</a> ([i915#658]) +2 similar issue=
s</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-3:</p>
<ul>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +3 =
similar issues</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-glk4/igt@kms_psr2_sf@overlay-plane-update-sf-=
dmg-area-3.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) +2 =
similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-5:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl6/igt@kms_psr2_sf@overlay-primary-update-=
sf-dmg-area-5.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#658]) =
+3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_onoff:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb2/igt@kms_psr@psr2_cursor_plane_onoff.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6015/shard-iclb7/igt@kms_psr@psr2_cursor_plane_onoff.html" target=
=3D"_blank">SKIP</a> ([fdo#109441]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_primary_mmap_cpu:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb4/igt@kms_psr@psr2_primary_mmap_cpu.html=
" target=3D"_blank">SKIP</a> ([fdo#109441]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_sprite_render:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@kms_psr@psr2_sprite_render.html" t=
arget=3D"_blank">FAIL</a> ([i915#132] / [i915#3467]) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_sysfs_edid_timing.html" target=
=3D"_blank">FAIL</a> ([IGT#2])</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl3/igt@kms_writeback@writeback-pixel-forma=
ts.html" target=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2437])</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-b-ctx-flip-skip-current-frame:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl2/igt@nouveau_crc@pipe-b-ctx-flip-skip-cu=
rrent-frame.html" target=3D"_blank">SKIP</a> ([fdo#109271]) +201 similar is=
sues</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-c-ctx-flip-detection:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb5/igt@nouveau_crc@pipe-c-ctx-flip-detect=
ion.html" target=3D"_blank">SKIP</a> ([i915#2530]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-tglb2/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([i915#2530]) +2 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6015/shard-iclb5/igt@nouveau_crc@pipe-d-ctx-flip-detecti=
on.html" target=3D"_blank">SKIP</a> ([fdo#109278] / [i915#2530])</p>
</li>
</ul>
</li>
<li>
<p>igt@sysfs_clients@recycle:</p>
<ul>
<li>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-apl6/igt@sysfs_clients@recycle.html" target=
=3D"_blank">SKIP</a> ([fdo#109271] / [i915#2994])</li>
</ul>
</li>
<li>
<p>igt@vgem_basic@unload:</p>
<ul>
<li>shard-snb:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-snb5/igt@vgem_basic@unload.html" target=3D"_=
blank">INCOMPLETE</a> ([i915#3744])</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk3/igt@gem_exec_fair@basic-none@rcs0.html" target=3D"=
_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-glk7/igt@gem_exec_fair@basic-none@rcs0.html"=
 target=3D"_blank">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl6/igt@gem_exec_fair@basic-pace@rcs0.html" target=3D"=
_blank">SKIP</a> ([fdo#109271]) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@gem_exec_fair@basic-pace@rcs0.html=
" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-tglb3/igt@gem_exec_fair@basic-pace@vecs0.html" target=
=3D"_blank">FAIL</a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6015/shard-tglb6/igt@gem_exec_fair@basic-pace@vecs0=
.html" target=3D"_blank">PASS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk6/igt@gen9_exec_parse@allowed-all.html" target=3D"_b=
lank">DMESG-WARN</a> ([i915#1436] / [i915#716]) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@gen9_exec_parse@al=
lowed-all.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk4/igt@kms_big_fb@linear-32bpp-rotate-180.html" targe=
t=3D"_blank">DMESG-WARN</a> ([i915#118] / [i915#95]) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk3/igt@kms_big_fb@li=
near-32bpp-rotate-180.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-a-cursor-64x64-random:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl4/igt@kms_cursor_crc@pipe-a-cursor-64x64-random.html=
" target=3D"_blank">FAIL</a> ([i915#3444]) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl3/igt@kms_cursor_crc@pipe-a-c=
ursor-64x64-random.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x85-random:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-256x85-random.ht=
ml" target=3D"_blank">FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@kms_cursor_crc@pipe-c-cursor-256x8=
5-random.html" target=3D"_blank">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl1/igt@kms_flip@flip-vs-suspend-interruptible@a-dp1.h=
tml" target=3D"_blank">DMESG-WARN</a> ([i915#180]) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl6/igt@kms_flip@flip-v=
s-suspend-interruptible@a-dp1.html" target=3D"_blank">PASS</a> +5 similar i=
ssues</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk4/igt@kms_flip@plain-flip-ts-check-interruptible@a-h=
dmi-a1.html" target=3D"_blank">FAIL</a> ([i915#2122]) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-glk1/igt@kms_flip@pla=
in-flip-ts-check-interruptible@a-hdmi-a1.html" target=3D"_blank">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_dpms:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb8/igt@kms_psr@psr2_dpms.html" target=3D"_blank">SKI=
P</a> ([fdo#109441]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_6015/shard-iclb2/igt@kms_psr@psr2_dpms.html" target=3D"_blank">PA=
SS</a> +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-kbl3/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html" target=3D"_blank">INCOMPLETE</a> ([i915#155] / [i915#2828]) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt=
@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html" target=3D"_blank">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-c-accuracy-idle:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk6/igt@kms_vblank@pipe-c-accuracy-idle.html" target=
=3D"_blank">FAIL</a> ([i915#43]) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_6015/shard-glk1/igt@kms_vblank@pipe-c-accuracy-idle.h=
tml" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@perf@polling-parameterized:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-glk2/igt@perf@polling-parameterized.html" target=3D"_bl=
ank">FAIL</a> ([i915#1542]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_6015/shard-glk9/igt@perf@polling-parameterized.html" targe=
t=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-solo@rcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-tglb2/igt@gem_exec_fair@basic-none-solo@rcs0.html" targ=
et=3D"_blank">FAIL</a> ([i915#2849]) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6015/shard-tglb3/igt@gem_exec_fair@basic-none-sol=
o@rcs0.html" target=3D"_blank">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html" target=
=3D"_blank">WARN</a> ([i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_6015/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle=
.html" target=3D"_blank">WARN</a> ([i915#1804] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html" ta=
rget=3D"_blank">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_6015/shard-iclb1/igt@kms_psr2_sf@plane-move-sf-=
dmg-area-0.html" target=3D"_blank">SKIP</a> ([i915#658]) +1 similar issue</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-3:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_10334/shard-iclb5/igt@kms_psr2_sf@plane-move-sf-dmg-area-3.html" ta=
rget=3D"_blank">SKIP</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_6015/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-d=
mg-area-3.html" target=3D"_blank">SKIP</a> ([i915#2920]) +2 similar issues<=
/li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/CI_DRM_10334/shard-kbl1/igt@runner@aborted.html" target=3D"_blank">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-=
kbl2/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl6/igt@runner@abort=
ed.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/CI_DRM_10334/shard-kbl3/igt@runner@aborted.html" target=3D"_b=
lank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_=
10334/shard-kbl1/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl2/igt@=
runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/drm-tip/CI_DRM_10334/shard-kbl1/igt@runner@aborted.html" =
target=3D"_blank">FAIL</a>) ([i915#1436] / [i915#180] / [i915#1814] / [i915=
#2505] / [i915#2722] / [i915#3002] / [i915#3363] / [i915#3744]) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl1/igt@r=
unner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@runner@aborted.html" tar=
get=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_6015/shard-kbl7/igt@runner@aborted.html" target=3D"_blank">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl7=
/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shard-kbl2/igt@runner@aborted.htm=
l" target=3D"_blank">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6015/shard-kbl3/igt@runner@aborted.html" target=3D"_blank">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6015/shar=
d-kbl6/igt@runner@aborted.html" target=3D"_blank">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tre" target=3D"_blank">FAIL</a>, [FAIL][145], [FAIL=
][146]) ([i915#1436] / [i915#180] / [i915#1814] / [i915#2505] / [i915#2722]=
 / [i915#3363] / [i915#3744] / [i915#602])</li>
</ul>
</li>
</ul>

</div>

</blockquote></div>

--000000000000f130c405c702eeba--

--===============1088639666==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1088639666==--
