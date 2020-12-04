Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D236E190
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Dec 2020 15:44:05 +0000 (UTC)
Message-ID: <353795a9120c57657c849655bd05651cb1b21267.camel@linux.intel.com>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 04 Dec 2020 16:44:01 +0100
In-Reply-To: <160709251918.27540.15429841341274400879@emeril.freedesktop.org>
References: <20201204115138.6656-1-janusz.krzysztofik@linux.intel.com>
 <160709251918.27540.15429841341274400879@emeril.freedesktop.org>
MIME-Version: 1.0
Subject: Re: [igt-dev]
 =?utf-8?b?4pyXIEZpLkNJLklHVDogZmFpbHVyZSBmb3IgcnVubmVy?=
 =?utf-8?q?=3A_Don=27t_kill_a_test_on_taint_if_watching_timeouts?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0252614350=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0252614350==
Content-Type: multipart/alternative; boundary="=-M/kBhF2390VzgPhQG3bJ"


--=-M/kBhF2390VzgPhQG3bJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-12-04 at 14:35 +0000, Patchwork wrote:
> 
> Patch Details
> 
> Series:runner: Don't kill a test on taint if watching timeouts
> URL:https://patchwork.freedesktop.org/series/84577/
> State:failure
> 
>     Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html
> 
> 
> 
> 
>     CI Bug Log - changes from CI_DRM_9441_full -> IGTPW_5249_full
> Summary
> FAILURE
> Serious unknown changes coming with IGTPW_5249_full absolutely need to be
> 
>   verified manually.
> If you think the reported changes have nothing to do with the changes
> 
>   introduced in IGTPW_5249_full, please notify your bug team to allow them
> 
>   to document this new failure mode, which will reduce false positives in CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html
> Possible new issues
> Here are the unknown changes that may have been introduced in IGTPW_5249_full:
> IGT changes
> Possible regressions
> 
> igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
> shard-iclb:         PASS -> DMESG-WARN
> 
> 
> 

I can't believe the change in igt_runner to not abort immediately on kernel taint could cause the driver to fail with a warning and trigger that taint.  There  must be some other reason.
> Warnings
> 
> 
> igt@gem_exec_reloc@basic-parallel:
> 
> 
> shard-kbl:          TIMEOUT (i915#1729) -> TIMEOUT
> 
> 
> shard-tglb:         TIMEOUT (i915#1729) -> TIMEOUT
> 
> 
> shard-apl:          TIMEOUT (i915#1729) -> TIMEOUT
> 
> 
> shard-iclb:         TIMEOUT (i915#1729) -> TIMEOUT
> 
> 
> shard-glk:          TIMEOUT (i915#1729) -> TIMEOUT
> 
> 
> 
> 
Hmm, I have no idea why output from this test is now less complete than before.  My expectation was we should get more, not less. 
Petri, do you think this may be related my implementation of  the change?
Thanks,Janusz
> Known issues
> Here are the changes found in IGTPW_5249_full that come from known issues:
> IGT changes
> Issues hit
> 
> 
> igt@i915_pm_backlight@fade_with_suspend:
> 
> 
> shard-tglb:         PASS -> DMESG-WARN (i915#1436 / i915#1602 / i915#1887 / i915#2411)
> 
> 
> shard-iclb:         PASS -> DMESG-WARN (i915#1602)
> 
> 
> 
> 
> igt@i915_pm_rpm@dpms-non-lpsp:
> 
> 
> shard-kbl:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-apl:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-glk:          PASS -> SKIP (fdo#109271)
> 
> 
> shard-hsw:          PASS -> SKIP (fdo#109271)
> 
> 
> 
> 
> igt@i915_suspend@forcewake:
> 
> shard-kbl:          PASS -> DMESG-WARN (i915#180)
> 
> 
> 
> igt@kms_async_flips@test-time-stamp:
> 
> shard-tglb:         PASS -> FAIL (i915#2597)
> 
> 
> 
> igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:
> 
> 
> shard-kbl:          PASS -> FAIL (i915#54)
> 
> 
> shard-glk:          PASS -> FAIL (i915#54)
> 
> 
> shard-apl:          PASS -> FAIL (i915#54)
> 
> 
> 
> 
> igt@kms_draw_crc@fill-fb:
> 
> shard-snb:          PASS -> SKIP (fdo#109271) +2 similar issues
> 
> 
> 
> igt@kms_psr@psr2_cursor_plane_move:
> 
> shard-iclb:         PASS -> SKIP (fdo#109441) +2 similar issues
> 
> 
> 
> igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:
> 
> 
> shard-hsw:          PASS -> DMESG-WARN (i915#2637)
> 
> 
> shard-kbl:          PASS -> INCOMPLETE (i915#155)
> 
> 
> shard-apl:          PASS -> DMESG-WARN (i915#2635)
> 
> 
> shard-glk:          PASS -> DMESG-WARN (i915#2635)
> 
> 
> shard-tglb:         PASS -> INCOMPLETE (i915#1436 / i915#1602 / i915#1798 / i915#1887 / i915#1982 / i915#2411 / i915#456)
> 
> 
> 
> 
> Possible fixes
> 
> 
> igt@gem_exec_gttfill@engines@rcs0:
> 
> shard-glk:          DMESG-WARN (i915#118 / i915#95) -> PASS +2 similar issues
> 
> 
> 
> igt@i915_pm_rpm@sysfs-read:
> 
> 
> shard-iclb:         SKIP (i915#579) -> PASS
> 
> 
> shard-tglb:         SKIP (i915#579) -> PASS
> 
> 
> 
> 
> igt@kms_color@pipe-a-ctm-max:
> 
> 
> shard-kbl:          FAIL (i915#1292) -> PASS
> 
> 
> shard-apl:          FAIL (i915#1292) -> PASS
> 
> 
> 
> 
> igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
> 
> shard-glk:          FAIL (i915#72) -> PASS
> 
> 
> 
> igt@kms_cursor_legacy@cursor-vs-flip-toggle:
> 
> shard-hsw:          FAIL (i915#2370) -> PASS
> 
> 
> 
> igt@kms_fbcon_fbt@fbc-suspend:
> 
> shard-kbl:          INCOMPLETE (i915#155 / i915#180) -> PASS
> 
> 
> 
> igt@kms_psr@psr2_no_drrs:
> 
> shard-iclb:         SKIP (fdo#109441) -> PASS +1 similar issue
> 
> 
> 
> igt@perf_pmu@rc6-runtime-pm:
> 
> 
> shard-glk:          SKIP (fdo#109271) -> PASS +1 similar issue
> 
> 
> shard-apl:          SKIP (fdo#109271) -> PASS +1 similar issue
> 
> 
> shard-kbl:          SKIP (fdo#109271) -> PASS +1 similar issue
> 
> 
> shard-tglb:         SKIP (fdo#111719) -> PASS
> 
> 
> shard-hsw:          SKIP (fdo#109271) -> PASS +1 similar issue
> 
> 
> shard-iclb:         SKIP (i915#293) -> PASS
> 
> 
> 
> 
> Warnings
> 
> 
> igt@i915_pm_rc6_residency@rc6-fence:
> 
> shard-iclb:         WARN (i915#1804 / i915#2684) -> WARN (i915#2681 / i915#2684)
> 
> 
> 
> igt@i915_pm_rc6_residency@rc6-idle:
> 
> shard-iclb:         WARN (i915#2684) -> WARN (i915#2681 / i915#2684)
> 
> 
> 
> igt@i915_pm_rpm@dpms-non-lpsp:
> 
> 
> shard-tglb:         SKIP (fdo#111644 / i915#1397 / i915#2411) -> SKIP (i915#579)
> 
> 
> shard-iclb:         SKIP (fdo#110892) -> SKIP (i915#579)
> 
> 
> 
> 
> igt@i915_pm_rpm@modeset-pc8-residency-stress:
> 
> 
> shard-tglb:         SKIP (i915#579) -> SKIP (fdo#109506 / i915#2411)
> 
> 
> shard-iclb:         SKIP (i915#579) -> SKIP (fdo#109293 / fdo#109506)
> 
> 
> 
> 
> igt@runner@aborted:
> 
> 
> shard-kbl:          (FAIL, FAIL) (i915#2295 / i915#2722 / i915#483 / i915#92) -> (FAIL, FAIL, FAIL) (i915#1814 / i915#2295 / i915#2722 / i915#483 / i915#602)
> 
> 
> shard-iclb:         FAIL (i915#2295 / i915#2722 / i915#483) -> (FAIL, FAIL, FAIL) (i915#1814 / i915#2295 / i915#2722 / i915#483)
> 
> 
> shard-apl:          FAIL (i915#2295 / i915#2722) -> (FAIL, FAIL) (i915#1814 / i915#2295 / i915#2722)
> 
> 
> shard-glk:          FAIL (i915#2295 / i915#2722 / k.org#202321) -> (FAIL, FAIL) (i915#1814 / i915#2295 / i915#2722 / k.org#202321)
> 
> 
> shard-tglb:         FAIL (i915#2295 / i915#2722) -> (FAIL, FAIL, FAIL) (i915#1602 / i915#2295 / i915#2722)
> 
> 
> 
> 
> Participating hosts (10 -> 8)
> Missing    (2): pig-skl-6260u pig-glk-j5005 
> Build changes
> 
> CI: CI-20190529 -> None
> IGT: IGT_5880 -> IGTPW_5249
> Piglit: piglit_4509 -> None
> 
> CI-20190529: 20190529
> 
>   CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.freedesktop.org/gfx-ci/linux
> 
>   IGTPW_5249: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.html
> 
>   IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools
> 
>   piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.freedesktop.org/piglit
> 
> 
> 

--=-M/kBhF2390VzgPhQG3bJ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns=3D"http://www.w3.org/1999/xhtml" dir=3D"ltr"><head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8">
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body style=3D"text-align:left; direction:ltr;"><div>On Fri, 2020-12-04 at =
14:35 +0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>runner: Don't kill a test on taint if=
 watching timeouts</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/84577/">https://patchwork.freedesktop.org/series/84577/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_5249/index.html">https://intel-gfx-ci.01.org/tree/drm-ti=
p/IGTPW_5249/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_9441_full -&gt; IGTPW_5249_full</h=
1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_5249_full absolutely need to b=
e<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_5249_full, please notify your bug team to allow them<=
br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.=
html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_5249=
_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_5249/shard-iclb6/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.ht=
ml">DMESG-WARN</a></li>
</ul>
</li>
</ul>
</blockquote><div><br></div><div>I can't believe the change in igt_runner t=
o not abort immediately on kernel taint&nbsp;</div><div>could cause the dri=
ver to fail with a warning and trigger that taint. &nbsp;</div><div>There  =
must be some other reason.</div><div><br></div><blockquote type=3D"cite" st=
yle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><=
h4>Warnings</h4>
<ul>
<li>
<p>igt@gem_exec_reloc@basic-parallel:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl2/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#1729=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/=
shard-kbl4/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb7/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#172=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249=
/shard-tglb1/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl4/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#1729=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/=
shard-apl4/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb7/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#172=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249=
/shard-iclb5/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk5/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1729">i915#1729=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/=
shard-glk5/igt@gem_exec_reloc@basic-parallel.html">TIMEOUT</a></p>
</li>
</ul>
</li>
</ul>
</blockquote><div>Hmm, I have no idea why output from this test is now less=
 complete than before.  </div><div>My expectation was we should get more, n=
ot less. </div><div><br></div><div>Petri, do you think this may be related =
my implementation of  the change?</div><div><br></div><div>Thanks,</div><di=
v>Janusz</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 =
0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><h2>Known issues</h=
2>
<p>Here are the changes found in IGTPW_5249_full that come from known issue=
s:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_pm_backlight@fade_with_suspend:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/sh=
ard-tglb1/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1436">i915#1436</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#16=
02</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1887">i=
915#1887</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2=
411">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb8/igt@i915_pm_backlight@fade_with_suspend.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/sh=
ard-iclb2/igt@i915_pm_backlight@fade_with_suspend.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1602">i915#1602</a>=
)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl4/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-kbl2/ig=
t@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl7/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-apl2/ig=
t@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk3/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-glk2/ig=
t@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw2/igt@i915_pm_rpm@dpms-non-lpsp.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-hsw7/ig=
t@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://bugs.freedes=
ktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_suspend@forcewake:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-kbl4/igt@i915_suspend@forcewake.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-kbl2/igt@=
i915_suspend@forcewake.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/180">i915#180</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-time-stamp:</p>
<ul>
<li>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-tglb1/igt@kms_async_flips@test-time-stamp.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard=
-tglb2/igt@kms_async_flips@test-time-stamp.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2597">i915#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl4/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5249/shard-kbl1/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5249/shard-glk3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl3/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
5249/shard-apl8/igt@kms_cursor_crc@pipe-c-cursor-256x85-sliding.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/54">i915#54=
</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-snb2/igt@kms_draw_crc@fill-fb.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-snb2/igt@km=
s_draw_crc@fill-fb.html">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271">fdo#109271</a>) +2 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_cursor_plane_move:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb2/igt@kms_psr@psr2_cursor_plane_move.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
iclb4/igt@kms_psr@psr2_cursor_plane_move.html">SKIP</a> (<a href=3D"https:/=
/bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend:</p>
<ul>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-hsw7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2637">i915#2637</a>)</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl7/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-kbl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/155">i915#155</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl1/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-apl2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk4/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-glk2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/2635">i915#2635</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb8/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_5249/shard-tglb2/igt@kms_vblank@pipe-b-ts-continuation-dpms-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1436">i915#1436</a> / <a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/1798">i915#1798</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1887">i915#1887</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/1982">i915#1982</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2411">i915#2411</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/456">i915#456</a>)</p>
</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_gttfill@engines@rcs0:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-glk7/igt@gem_exec_gttfill@engines@rcs0.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/118">i915#1=
18</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/95">i91=
5#95</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5=
249/shard-glk1/igt@gem_exec_gttfill@engines@rcs0.html">PASS</a> +2 similar =
issues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@sysfs-read:</p>
<ul>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb3/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-iclb=
7/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb2/igt@i915_pm_rpm@sysfs-read.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-tglb=
5/igt@i915_pm_rpm@sysfs-read.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_color@pipe-a-ctm-max:</p>
<ul>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl3/igt@kms_color@pipe-a-ctm-max.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1292">i915#1292</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-kb=
l1/igt@kms_color@pipe-a-ctm-max.html">PASS</a></p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl6/igt@kms_color@pipe-a-ctm-max.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/1292">i915#1292</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-ap=
l8/igt@kms_color@pipe-a-ctm-max.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-glk1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/72">i915#72</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_5249/shard-glk6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.=
html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-toggle:</p>
<ul>
<li>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-hsw1/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2370">i=
915#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-hsw7/igt@kms_cursor_legacy@cursor-vs-flip-toggle.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/155">i915#155</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/180">i915#1=
80</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_524=
9/shard-kbl2/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2_no_drrs:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb7/igt@kms_psr@psr2_no_drrs.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109441">fdo#109441</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
iclb2/igt@kms_psr@psr2_no_drrs.html">PASS</a> +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@perf_pmu@rc6-runtime-pm:</p>
<ul>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
glk3/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl2/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
apl8/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-kbl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-kbl6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
kbl3/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111719">fdo#111719</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
tglb3/igt@perf_pmu@rc6-runtime-pm.html">PASS</a></p>
</li>
<li>
<p>shard-hsw:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-hsw6/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271">fdo#109271</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
hsw2/igt@perf_pmu@rc6-runtime-pm.html">PASS</a> +1 similar issue</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb1/igt@perf_pmu@rc6-runtime-pm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/293">i915#293</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-iclb=
4/igt@perf_pmu@rc6-runtime-pm.html">PASS</a></p>
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@i915_pm_rc6_residency@rc6-fence:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb7/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1804">i915#180=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i9=
15#2684</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5249/shard-iclb8/igt@i915_pm_rc6_residency@rc6-fence.html">WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#268=
4</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rc6_residency@rc6-idle:</p>
<ul>
<li>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-iclb2/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/=
shard-iclb1/igt@i915_pm_rc6_residency@rc6-idle.html">WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/intel/issues/2681">i915#2681</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/intel/issues/2684">i915#2684</a>)</=
li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb3/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111644">fdo#111644</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1397">i915#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2411">i=
915#2411</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGT=
PW_5249/shard-tglb2/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb8/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a hr=
ef=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110892">fdo#110892</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shar=
d-iclb6/igt@i915_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/intel/issues/579">i915#579</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@i915_pm_rpm@modeset-pc8-residency-stress:</p>
<ul>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb6/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i=
915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5249/shard-tglb7/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109506">fdo#=
109506</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/241=
1">i915#2411</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb1/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/579">i=
915#579</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTP=
W_5249/shard-iclb4/igt@i915_pm_rpm@modeset-pc8-residency-stress.html">SKIP<=
/a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109293">fdo#=
109293</a> / <a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1095=
06">fdo#109506</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>shard-kbl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_9441/shard-kbl6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_9441/shard-kbl2/igt@runner@abort=
ed.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/iss=
ues/2295">i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/int=
el/issues/2722">i915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/intel/issues/483">i915#483</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/92">i915#92</a>) -&gt; (<a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5249/shard-kbl2/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-kbl=
4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5249/shard-kbl2/igt@runner@aborted.html">FAIL</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#22=
95</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i=
915#2722</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
83">i915#483</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/602">i915#602</a>)</p>
</li>
<li>
<p>shard-iclb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-iclb6/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/intel/issues/483">i915#483</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-=
iclb2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_5249/shard-iclb1/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-iclb6=
/igt@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/intel/issues/1814">i915#1814</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/intel/issues/483">i915#483</a>)</p>
</li>
<li>
<p>shard-apl:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-apl3/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-apl2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/drm-tip/IGTPW_5249/shard-apl7/igt@runner@aborted.html">FAIL</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1814</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722">i91=
5#2722</a>)</p>
</li>
<li>
<p>shard-glk:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-glk1/igt@runner@aborted.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a> / <a hr=
ef=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D202321">k.org#202321</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/sh=
ard-glk2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/drm-tip/IGTPW_5249/shard-glk4/igt@runner@aborted.html">FAIL</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/1814">i915#1=
814</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2295">=
i915#2295</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
2722">i915#2722</a> / <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?i=
d=3D202321">k.org#202321</a>)</p>
</li>
<li>
<p>shard-tglb:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_9441/shard-tglb7/igt@runner@aborted.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/intel/issues/2722">i915#2722</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-tglb=
1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_5249/shard-tglb6/igt@runner@aborted.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/shard-tglb2/igt=
@runner@aborted.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/intel/issues/1602">i915#1602</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/intel/issues/2295">i915#2295</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/intel/issues/2722">i915#2722</a>)</p>
</li>
</ul>
</li>
</ul>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): pig-skl-6260u pig-glk-j5005 </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5880 -&gt; IGTPW_5249</li>
<li>Piglit: piglit_4509 -&gt; None</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_9441: 6e992bb7585d1bee238776d8fe0512a70a22a1a0 @ git://anongit.fre=
edesktop.org/gfx-ci/linux<br>
  IGTPW_5249: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5249/index.htm=
l<br>
  IGT_5880: d67bad61dc9a7515f94a7eecadd3bcd6b4f9d49e @ git://anongit.freede=
sktop.org/xorg/app/intel-gpu-tools<br>
  piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ git://anongit.fre=
edesktop.org/piglit</p>



</blockquote></body></html>

--=-M/kBhF2390VzgPhQG3bJ--


--===============0252614350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0252614350==--
