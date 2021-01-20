Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1632789FEA
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Jan 2021 16:10:58 +0000 (UTC)
Message-ID: <4e5a02e1cf59f474489e7994189ca3d29784e3cc.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Wed, 20 Jan 2021 17:10:52 +0100
In-Reply-To: <161115832562.8788.8324907742442673167@emeril.freedesktop.org>
References: <20210119084257.25552-1-janusz.krzysztofik@linux.intel.com>
 <161115832562.8788.8324907742442673167@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?core=5Fhotunplug=3A_Reduce_debug_noise_on_stdout?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1563783230=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1563783230==
Content-Type: multipart/alternative; boundary="=-k+N5KoRxproly0hLpH3T"


--=-k+N5KoRxproly0hLpH3T
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2021-01-20 at 15:58 +0000, Patchwork wrote:
> 
> Patch Details
> 
> Series:tests/core_hotunplug: Reduce debug noise on stdout
> URL:https://patchwork.freedesktop.org/series/86032/
> State:failure
> 
>     Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html
> 
> 
> 
> 
>     CI Bug Log - changes from CI_DRM_9640_full -> IGTPW_5402_full
> Summary
> FAILURE
> Serious unknown changes coming with IGTPW_5402_full absolutely need to be
> 
>   verified manually.
> If you think the reported changes have nothing to do with the changes
> 
>   introduced in IGTPW_5402_full, please notify your bug team to allow them
> 
>   to document this new failure mode, which will reduce false positives in CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.html
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_5402_full:
> IGT changes
> Possible regressions
> 
> 
> igt@kms_color@pipe-b-legacy-gamma-reset:
> 
> 
> shard-apl:          PASS -> FAIL
> 
> 
> shard-kbl:          PASS -> FAIL
> 
> 
> 
> 
Looks almost the same (pipe-b here vs pipe-c before) as one of those I've already commented as false positives.
Thanks,Janusz
> Known issues
> Here are the changes found in IGTPW_5402_full that come from known issues:
> IGT changes
> Issues hit
> 
> 
> igt@gem_ctx_persistence@engines-hostile:
> 
> shard-hsw:          NOTRUN -> SKIP (fdo#109271 / i915#1099) +3 similar issues
> 
> 
> 
> igt@gem_exec_fair@basic-deadline:
> 
> shard-kbl:          PASS -> FAIL ([i915#2846])
> 
> 
> 
> igt@gem_exec_fair@basic-pace@vcs0:
> 
> shard-kbl:          PASS -> FAIL ([i915#2842])
> 
> 
> 
> igt@gem_exec_fair@basic-pace@vcs1:
> 
> shard-tglb:         PASS -> FAIL ([i915#2842])
> 
> 
> 
> igt@gem_exec_fair@basic-throttle@rcs0:
> 
> shard-iclb:         PASS -> FAIL ([i915#2842])
> 
> 
> 
> igt@gem_exec_reloc@basic-many-active@rcs0:
> 
> 
> shard-tglb:         NOTRUN -> FAIL (i915#2389) +4 similar issues
> 
> 
> shard-hsw:          PASS -> FAIL (i915#2389)
> 
> 
> 
> 
> igt@gem_exec_reloc@basic-wide-active@bcs0:
> 
> shard-hsw:          NOTRUN -> FAIL (i915#2389) +3 similar issues
> 
> 
> 
> igt@gem_exec_whisper@basic-queues-priority-all:
> 
> shard-glk:          PASS -> DMESG-WARN (i915#118 / [i915#95])
> 
> 
> 
> igt@gem_pread@exhaustion:
> 
> shard-hsw:          NOTRUN -> WARN ([i915#2658])
> 
> 
> 
> igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:
> 
> 
> shard-glk:          NOTRUN -> SKIP (fdo#109271) +6 similar issues
> 
> 
> shard-iclb:         NOTRUN -> SKIP ([i915#768])
> 
> 
> 
> 
> igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:
> 
> shard-kbl:          NOTRUN -> SKIP (fdo#109271) +31 similar issues
> 
> 
> 
> igt@gem_userptr_blits@readonly-pwrite-unsync:
> 
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#110426 / i915#1704)
> 
> 
> shard-iclb:         NOTRUN -> SKIP (fdo#110426 / i915#1704)
> 
> 
> 
> 
> igt@gen9_exec_parse@allowed-all:
> 
> shard-glk:          PASS -> DMESG-WARN (i915#1436 / [i915#716])
> 
> 
> 
> igt@i915_module_load@reload-with-fault-injection:
> 
> shard-snb:          PASS -> INCOMPLETE ([i915#2880])
> 
> 
> 
> igt@i915_pm_rpm@dpms-non-lpsp:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#111644 / i915#1397 / i915#2411)
> 
> 
> 
> igt@i915_pm_rpm@pm-tiling:
> 
> 
> shard-kbl:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-apl:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-tglb:         PASS -> SKIP ([i915#579])
> 
> 
> shard-glk:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-iclb:         PASS -> SKIP ([i915#579])
> 
> 
> 
> 
> igt@i915_selftest@live@active:
> 
> shard-iclb:         PASS -> DMESG-FAIL (i915#2291)
> 
> 
> 
> igt@kms_big_fb@y-tiled-8bpp-rotate-90:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#111614)
> 
> 
> 
> igt@kms_ccs@pipe-d-missing-ccs-buffer:
> 
> shard-iclb:         NOTRUN -> SKIP (fdo#109278) +2 similar issues
> 
> 
> 
> igt@kms_chamelium@dp-frame-dump:
> 
> 
> shard-iclb:         NOTRUN -> SKIP (fdo#109284 / fdo#111827)
> 
> 
> shard-glk:          NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
> 
> shard-kbl:          NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#109284 / fdo#111827) +2 similar issues
> 
> 
> shard-apl:          NOTRUN -> SKIP (fdo#109271 / fdo#111827)
> 
> 
> 
> 
> igt@kms_color@pipe-c-legacy-gamma-reset:
> 
> 
> shard-kbl:          PASS -> FAIL ([i915#2964])
> 
> 
> shard-apl:          PASS -> FAIL ([i915#2964])
> 
> 
> shard-glk:          PASS -> FAIL ([i915#2964])
> 
> 
> shard-hsw:          PASS -> FAIL ([i915#2964])
> 
> 
> 
> 
> igt@kms_color_chamelium@pipe-c-ctm-limited-range:
> 
> shard-hsw:          NOTRUN -> SKIP (fdo#109271 / fdo#111827) +13 similar issues
> 
> 
> 
> igt@kms_content_protection@atomic:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#111828)
> 
> 
> 
> igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#109279)
> 
> 
> 
> igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
> 
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#111825) +12 similar issues
> 
> 
> shard-iclb:         NOTRUN -> SKIP (fdo#109274 / fdo#109278)
> 
> 
> 
> 
> igt@kms_fbcon_fbt@psr-suspend:
> 
> 
> shard-iclb:         PASS -> INCOMPLETE (i915#1185)
> 
> 
> shard-tglb:         PASS -> INCOMPLETE (i915#1436 / i915#1602 / i915#1887 / i915#2411 / [i915#456])
> 
> 
> 
> 
> igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:
> 
> shard-hsw:          PASS -> INCOMPLETE (i915#2055 / i915#2295)
> 
> 
> 
> igt@kms_frontbuffer_tracking@fbc-suspend:
> 
> 
> shard-kbl:          PASS -> INCOMPLETE (i915#155)
> 
> 
> shard-apl:          PASS -> DMESG-WARN ([i915#2635])
> 
> 
> 
> 
> igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:
> 
> shard-hsw:          NOTRUN -> SKIP (fdo#109271) +213 similar issues
> 
> 
> 
> igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:
> 
> 
> shard-iclb:         NOTRUN -> SKIP (fdo#109280) +2 similar issues
> 
> 
> shard-apl:          NOTRUN -> SKIP (fdo#109271) +8 similar issues
> 
> 
> 
> 
> igt@kms_hdr@bpc-switch-suspend:
> 
> 
> shard-kbl:          PASS -> INCOMPLETE (i915#155 / [i915#2828])
> 
> 
> shard-apl:          PASS -> DMESG-FAIL (i915#1188)
> 
> 
> shard-glk:          PASS -> DMESG-WARN ([i915#2635]) +1 similar issue
> 
> 
> shard-iclb:         PASS -> DMESG-WARN (i915#1602)
> 
> 
> shard-hsw:          PASS -> DMESG-WARN ([i915#2637])
> 
> 
> shard-tglb:         PASS -> DMESG-WARN (i915#1436 / i915#1602 / i915#1887 / i915#2411)
> 
> 
> 
> 
> igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#109289)
> 
> 
> 
> igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:
> 
> 
> shard-glk:          NOTRUN -> SKIP (fdo#109271 / [i915#533])
> 
> 
> shard-apl:          NOTRUN -> SKIP (fdo#109271 / [i915#533])
> 
> 
> 
> 
> igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:
> 
> shard-kbl:          NOTRUN -> SKIP (fdo#109271 / [i915#533]) +1 similar issue
> 
> 
> 
> igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:
> 
> shard-hsw:          NOTRUN -> DMESG-WARN ([i915#2637])
> 
> 
> 
> igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
> shard-kbl:          NOTRUN -> SKIP (fdo#109271 / [i915#658])
> 
> 
> 
> igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:
> 
> shard-tglb:         NOTRUN -> SKIP ([i915#2920])
> 
> 
> 
> igt@kms_psr@psr2_cursor_mmap_cpu:
> 
> shard-iclb:         PASS -> SKIP (fdo#109441) +2 similar issues
> 
> 
> 
> igt@nouveau_crc@pipe-d-ctx-flip-detection:
> 
> shard-tglb:         NOTRUN -> SKIP (i915#2530)
> 
> 
> 
> igt@prime_nv_test@i915_blt_fill_nv_read:
> 
> shard-tglb:         NOTRUN -> SKIP (fdo#109291) +1 similar issue
> 
> 
> 
> igt@runner@aborted:
> 
> shard-hsw:          NOTRUN -> (FAIL, FAIL) (fdo#109271 / i915#2295 / i915#2505)
> 
> 
> 
> Possible fixes
> 
> 
> igt@gem_ctx_persistence@close-replace-race:
> 
> shard-glk:          TIMEOUT ([i915#2918]) -> PASS
> 
> 
> 
> igt@gem_exec_balancer@waits:
> 
> shard-tglb:         INCOMPLETE ([i915#2931]) -> PASS
> 
> 
> 
> igt@gem_exec_endless@dispatch@vcs0:
> 
> shard-iclb:         INCOMPLETE -> PASS
> 
> 
> 
> igt@gem_exec_fair@basic-pace@rcs0:
> 
> shard-kbl:          FAIL -> PASS
> 
> 
> 
> igt@gem_exec_fair@basic-pace@vcs0:
> 
> shard-tglb:         FAIL ([i915#2842]) -> PASS
> 
> 
> 
> igt@gem_exec_fair@basic-pace@vecs0:
> 
> shard-kbl:          FAIL ([i915#2842]) -> PASS +2 similar issues
> 
> 
> 
> igt@i915_pm_dc@dc6-psr:
> 
> shard-iclb:         FAIL ([i915#454]) -> PASS
> 
> 
> 
> igt@kms_flip@flip-vs-expired-vblank@a-edp1:
> 
> shard-tglb:         FAIL (i915#2598) -> PASS
> 
> 
> 
> igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:
> 
> shard-kbl:          DMESG-WARN (i915#180) -> PASS
> 
> 
> 
> igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
> 
> shard-snb:          SKIP (fdo#109271) -> PASS +3 similar issues
> 
> 
> 
> igt@kms_psr@psr2_cursor_render:
> 
> shard-iclb:         SKIP (fdo#109441) -> PASS +2 similar issues
> 
> 
> 
> igt@tools_test@sysfs_l3_parity:
> 
> shard-hsw:          INCOMPLETE -> PASS
> 
> 
> 
> Warnings
> 
> 
> igt@gem_exec_fair@basic-none-rrul@rcs0:
> 
> shard-iclb:         FAIL ([i915#2842]) -> FAIL ([i915#2852])
> 
> 
> 
> igt@i915_pm_rc6_residency@rc6-idle:
> 
> shard-iclb:         WARN (i915#1804 / [i915#2684]) -> WARN ([i915#2681] / [i915#2684])
> 
> 
> 
> igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:
> 
> shard-iclb:         SKIP ([i915#2920]) -> SKIP ([i915#658])
> 
> 
> 
> igt@kms_psr2_sf@plane-move-sf-dmg-area-0:
> 
> shard-iclb:         SKIP ([i915#658]) -> SKIP ([i915#2920]) +1 similar issue
> 
> 
> 
> igt@runner@aborted:
> 
> 
> shard-iclb:         FAIL (i915#2295 / [i915#2724]) -> (FAIL, FAIL, FAIL) (i915#1814 / i915#2295 / [i915#2724])
> 
> 
> shard-apl:          FAIL (i915#2295) -> (FAIL, FAIL, FAIL) (fdo#109271 / i915#1814 / i915#2295)
> 
> 
> shard-glk:          FAIL (i915#2295 / [k.org#202321]) -> (FAIL, FAIL, FAIL, FAIL) (i915#1814 / i915#2295 / [k.org#202321])
> 
> 
> shard-tglb:         FAIL (i915#2295 / [i915#2667]) -> (FAIL, FAIL, FAIL) (i915#1602 / i915#1814 / i915#2295 / [i915#2667])
> 
> 
> 
> 
> 
> 
> 

--=-k+N5KoRxproly0hLpH3T
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" dir=3D"ltr"><head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8">
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body style=3D"text-align:left; direction:ltr;"><div>On Wed, 2021-01-20 at =
15:58 +0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/core_hotunplug: Reduce debug no=
ise on stdout</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/86032/">https://patchwork.freedesktop.org/series/86032/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5402/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_9640_full -&gt; IGTPW_5402_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5402_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5402_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5402=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_color@pipe-b-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl7/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-apl1/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a></p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-kbl6/igt@kms_color@pipe-b-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-kbl1/igt@kms_color@pipe-b-legacy-gamma-reset.html">FAIL</a></p>
</li>
</ul>
</li>
</ul>
</blockquote><div>Looks almost the same (pipe-b here vs pipe-c before) as o=
ne of those I've already commented as false positives.</div><div><br></div>=
<div>Thanks,</div><div>Janusz</div><div><br></div><blockquote type=3D"cite"=
 style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex=
"><h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5402_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@engines-hostile:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@gem_ctx_persistence@engines-hostile=
.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1099">i915#1099</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-deadline:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-kbl7/igt@gem_exec_fair@basic-deadline.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl=
3/igt@gem_exec_fair@basic-deadline.html">FAIL</a> ([i915#2846])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kb=
l7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-t=
glb1/igt@gem_exec_fair@basic-pace@vcs1.html">FAIL</a> ([i915#2842])</li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-throttle@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb1/igt@gem_exec_fair@basic-throttle@rcs0.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-iclb8/igt@gem_exec_fair@basic-throttle@rcs0.html">FAIL</a> ([i915#2842])=
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-many-active@rcs0:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-tglb8/igt@gem_exec_reloc@basic-many-active@rc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +4 similar issues</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/s=
hard-hsw6/igt@gem_exec_reloc@basic-many-active@rcs0.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/2389">i915#2389</a>)</p=
>
</li>
</ul>
</li>
<li>
<p>igt@gem_exec_reloc@basic-wide-active@bcs0:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_exec_reloc@basic-wide-active@bc=
s0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/2389">i915#2389</a>) +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_exec_whisper@basic-queues-priority-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-glk4/igt@gem_exec_whisper@basic-queues-priority-all.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5402/shard-glk2/igt@gem_exec_whisper@basic-queues-priority-all.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i=
915#118</a> / [i915#95])</li>
</ul>
</li>
<li>
<p>igt@gem_pread@exhaustion:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@gem_pread@exhaustion.html">WARN</a>=
 ([i915#2658])</li>
</ul>
</li>
<li>
<p>igt@gem_render_copy@yf-tiled-mc-ccs-to-vebox-y-tiled:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-glk2/igt@gem_render_copy@yf-tiled-mc-ccs-to-v=
ebox-y-tiled.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109271">fdo#109271</a>) +6 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb3/igt@gem_render_copy@yf-tiled-mc-ccs-to-=
vebox-y-tiled.html">SKIP</a> ([i915#768])</p>
</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@mmap-offset-invalidate-active@wb:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@gem_userptr_blits@mmap-offset-inval=
idate-active@wb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) +31 similar issues</li>
</ul>
</li>
<li>
<p>igt@gem_userptr_blits@readonly-pwrite-unsync:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-tglb1/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D110426">fdo#110426</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1704">i915#1704</a>)</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb4/igt@gem_userptr_blits@readonly-pwrite-u=
nsync.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D110426">fdo#110426</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/intel/issues/1704">i915#1704</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@gen9_exec_parse@allowed-all:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-glk8/igt@gen9_exec_parse@allowed-all.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6=
/igt@gen9_exec_parse@allowed-all.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / [i915#716])</l=
i>
</ul>
</li>
<li>
<p>igt@i915_module_load@reload-with-fault-injection:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-snb2/igt@i915_module_load@reload-with-fault-injection.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5402/shard-snb7/igt@i915_module_load@reload-with-fault-injection.html">IN=
COMPLETE</a> ([i915#2880])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">f=
do#111644</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1397">i915#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2411">i915#2411</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@pm-tiling:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-kbl6/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl7/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl1/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-tglb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/igt@=
i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-glk2/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@i9=
15_pm_rpm@pm-tiling.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-iclb5/igt@i915_pm_rpm@pm-tiling.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@=
i915_pm_rpm@pm-tiling.html">SKIP</a> ([i915#579])</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@active:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb8/igt@i915_selftest@live@active.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb2=
/igt@i915_selftest@live@active.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2291">i915#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11614">fdo#111614</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@pipe-d-missing-ccs-buffer:</p>
<ul>
<li>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-iclb6/igt@kms_ccs@pipe-d-missing-ccs-buffer.=
html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09278">fdo#109278</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-frame-dump:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb7/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-glk6/igt@kms_chamelium@dp-frame-dump.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_chamelium@dp-frame-dump.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>)</p>
</li>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_chamelium@dp-frame-dump.html">S=
KIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109284">=
fdo#109284</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D=
111827">fdo#111827</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-apl7/igt@kms_chamelium@dp-frame-dump.html">SK=
IP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">f=
do#109271</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
11827">fdo#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-c-legacy-gamma-reset:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-kbl6/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-kbl7/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl8/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-apl1/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-glk8/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-glk1/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sha=
rd-hsw4/igt@kms_color@pipe-c-legacy-gamma-reset.html">FAIL</a> ([i915#2964]=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color_chamelium@pipe-c-ctm-limited-range:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_color_chamelium@pipe-c-ctm-limi=
ted-range.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://bugs.freedesktop.org/s=
how_bug.cgi?id=3D111827">fdo#111827</a>) +13 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb8/igt@kms_content_protection@atomic.html=
">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D11182=
8">fdo#111828</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-512x170-offscreen:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@kms_cursor_crc@pipe-c-cursor-512x1=
70-offscreen.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_b=
ug.cgi?id=3D109279">fdo#109279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>
<p>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-tglb2/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D111825">fdo#111825</a>) +12 similar issues</p>
</li>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb8/igt@kms_cursor_legacy@cursora-vs-flipb-=
atomic.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109274">fdo#109274</a> / <a href=3D"https://bugs.freedesktop.org/show=
_bug.cgi?id=3D109278">fdo#109278</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-iclb6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/=
igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1185">i915#1185</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-tglb6/igt@kms_fbcon_fbt@psr-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb2/=
igt@kms_fbcon_fbt@psr-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</a> /=
 [i915#456])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-hsw4/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a=
1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_5402/shard-hsw6/igt@kms_flip@flip-vs-suspend-interruptible@c-hdmi-a1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/i=
ssues/2055">i915#2055</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/2295">i915#2295</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-kbl4/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sh=
ard-kbl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</a>)<=
/p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl7/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sh=
ard-apl1/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> ([i9=
15#2635])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-cpu:</p=
>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@kms_frontbuffer_tracking@psr-1p-off=
scren-pri-indfb-draw-mmap-cpu.html">SKIP</a> (<a href=3D"https://bugs.freed=
esktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +213 similar issues</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>
<p>shard-iclb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb3/igt@kms_frontbuffer_tracking@psr-2p-scn=
dscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freede=
sktop.org/show_bug.cgi?id=3D109280">fdo#109280</a>) +2 similar issues</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-apl6/igt@kms_frontbuffer_tracking@psr-2p-scnd=
scrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) +8 similar issues</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-kbl1/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kbl1/i=
gt@kms_hdr@bpc-switch-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/155">i915#155</a> / [i915#2828])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl3/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/intel/issues/1188">i915#1188</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-glk4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk6/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#2635]) +1 similar=
 issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-iclb5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-hsw7/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/i=
gt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> ([i915#2637])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-tglb5/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6=
/igt@kms_hdr@bpc-switch-suspend.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i915#1887</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i915#2411</=
a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_b_c_ivb@pipe-b-double-modeset-then-modeset-pipe-c:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_pipe_b_c_ivb@pipe-b-double-mod=
eset-then-modeset-pipe-c.html">SKIP</a> (<a href=3D"https://bugs.freedeskto=
p.org/show_bug.cgi?id=3D109289">fdo#109289</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc-pipe-d:</p>
<ul>
<li>
<p>shard-glk:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-glk1/igt@kms_pipe_crc_basic@hang-read-crc-pip=
e-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
<li>
<p>shard-apl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-apl2/igt@kms_pipe_crc_basic@hang-read-crc-pip=
e-d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109271">fdo#109271</a> / [i915#533])</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-pipe-d-frame-sequence:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-kbl1/igt@kms_pipe_crc_basic@nonblocking-crc-=
pipe-d-frame-sequence.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.o=
rg/show_bug.cgi?id=3D109271">fdo#109271</a> / [i915#533]) +1 similar issue<=
/li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc-pipe-c:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@kms_pipe_crc_basic@suspend-read-crc=
-pipe-c.html">DMESG-WARN</a> ([i915#2637])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-kbl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-kbl7/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bu=
g.cgi?id=3D109271">fdo#109271</a> / [i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area-4:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb5/igt@kms_psr2_sf@overlay-primary-update=
-sf-dmg-area-4.html">SKIP</a> ([i915#2920])</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_mmap_cpu:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb2/igt@kms_psr@psr2_cursor_mmap_cpu.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-ic=
lb6/igt@kms_psr@psr2_cursor_mmap_cpu.html">SKIP</a> (<a href=3D"https://bug=
s.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar issu=
es</li>
</ul>
</li>
<li>
<p>igt@nouveau_crc@pipe-d-ctx-flip-detection:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@nouveau_crc@pipe-d-ctx-flip-detect=
ion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2530">i915#2530</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_nv_test@i915_blt_fill_nv_read:</p>
<ul>
<li>shard-tglb:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5402/shard-tglb3/igt@prime_nv_test@i915_blt_fill_nv_rea=
d.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=
=3D109291">fdo#109291</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-hsw:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/drm-tip/IGTPW_5402/shard-hsw6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-hsw7/igt@=
runner@aborted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/intel/issues/2505">i915#2505</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_ctx_persistence@close-replace-race:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-glk1/igt@gem_ctx_persistence@close-replace-race.html">TI=
MEOUT</a> ([i915#2918]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_5402/shard-glk2/igt@gem_ctx_persistence@close-replace-race.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_balancer@waits:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-tglb6/igt@gem_exec_balancer@waits.html">INCOMPLETE</a> (=
[i915#2931]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5402/shard-tglb2/igt@gem_exec_balancer@waits.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_endless@dispatch@vcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb4/igt@gem_exec_endless@dispatch@vcs0.html">INCOMPLET=
E</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/=
shard-iclb1/igt@gem_exec_endless@dispatch@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@rcs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@rcs0.html">FAIL</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-kb=
l7/igt@gem_exec_fair@basic-pace@rcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vcs0:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-tglb7/igt@gem_exec_fair@basic-pace@vcs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5402/shard-tglb1/igt@gem_exec_fair@basic-pace@vcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_fair@basic-pace@vecs0:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-kbl2/igt@gem_exec_fair@basic-pace@vecs0.html">FAIL</a> (=
[i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5402/shard-kbl7/igt@gem_exec_fair@basic-pace@vecs0.html">PASS</a> +2 simi=
lar issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_dc@dc6-psr:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb6/igt@i915_pm_dc@dc6-psr.html">FAIL</a> ([i915#454])=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard=
-iclb6/igt@i915_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-tglb5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2598">i=
915#2598</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5402/shard-tglb8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-dp1:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-kbl2/igt@kms_flip@flip-vs-suspend-interruptible@b-dp1.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/180">i915#180</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5402/shard-kbl3/igt@kms_flip@flip-vs-suspend-interruptible@b-dp=
1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-snb2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/sho=
w_bug.cgi?id=3D109271">fdo#109271</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5402/shard-snb2/igt@kms_frontbuffer_tracking@fb=
c-1p-offscren-pri-shrfb-draw-render.html">PASS</a> +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_render:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb5/igt@kms_psr@psr2_cursor_render.html">SKIP</a> (<a =
href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sh=
ard-iclb2/igt@kms_psr@psr2_cursor_render.html">PASS</a> +2 similar issues</=
li>
</ul>
</li>
<li>
<p>igt@tools_test@sysfs_l3_parity:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-hsw4/igt@tools_test@sysfs_l3_parity.html">INCOMPLETE</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard=
-hsw4/igt@tools_test@sysfs_l3_parity.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_fair@basic-none-rrul@rcs0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL<=
/a> ([i915#2842]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5402/shard-iclb5/igt@gem_exec_fair@basic-none-rrul@rcs0.html">FAIL</=
a> ([i915#2852])</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb3/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#1804=
</a> / [i915#2684]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_5402/shard-iclb8/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a>=
 ([i915#2681] / [i915#2684])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb2/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area-2=
.html">SKIP</a> ([i915#2920]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5402/shard-iclb5/igt@kms_psr2_sf@overlay-plane-update-sf=
-dmg-area-2.html">SKIP</a> ([i915#658])</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area-0:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9640/shard-iclb4/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKI=
P</a> ([i915#658]) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5402/shard-iclb2/igt@kms_psr2_sf@plane-move-sf-dmg-area-0.html">SKI=
P</a> ([i915#2920]) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-iclb3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#2724=
]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sh=
ard-iclb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5402/shard-iclb7/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-i=
clb7/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#2724])</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-apl2/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl7/igt@ru=
nner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/dr=
m-tip/IGTPW_5402/shard-apl1/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-apl3/igt@runner@ab=
orted.html">FAIL</a>) (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi=
?id=3D109271">fdo#109271</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/2295">i915#2295</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-glk7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [k.org#2023=
21]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/=
shard-glk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_5402/shard-glk4/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-g=
lk6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/drm-tip/IGTPW_5402/shard-glk7/igt@runner@aborted.html">FAIL</a>) (<=
a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#=
2295</a> / [k.org#202321])</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9640/shard-tglb1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#2667=
]) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/sh=
ard-tglb1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/drm-tip/IGTPW_5402/shard-tglb6/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5402/shard-t=
glb2/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / [i915#2667])</p>
</li>
</ul>
</li>
</ul>



</blockquote></body></html>

--=-k+N5KoRxproly0hLpH3T--


--===============1563783230==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1563783230==--
