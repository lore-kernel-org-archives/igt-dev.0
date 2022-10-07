Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com
 [IPv6:2607:f8b0:4864:20::e2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4159210E117
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Oct 2022 23:20:13 +0000 (UTC)
Received: by mail-vs1-xe2a.google.com with SMTP id v68so5537493vsb.1
 for <igt-dev@lists.freedesktop.org>; Fri, 07 Oct 2022 16:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221007220221.3189750-1-jfree@freebsd.org>
 <166518339296.15732.9874907279766034822@emeril.freedesktop.org>
In-Reply-To: <166518339296.15732.9874907279766034822@emeril.freedesktop.org>
From: Jake Freeland <jake@technologyfriends.net>
Date: Fri, 7 Oct 2022 18:20:01 -0500
Message-ID: <CAOgZAGaL50EgcVRndkLivxJuht=VmnkgTs5SwApA3bJ2SUHJiQ@mail.gmail.com>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Content-Type: multipart/alternative; boundary="00000000000037940705ea7a0d3c"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?i915/gem=5Fmmap=5F*=3A_Add_NULL_to_ptrace=28=29_calls_?=
	=?utf-8?b?KHJldjIp?=
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

--00000000000037940705ea7a0d3c
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana,

I believe this is a false-negative.

Thank you,
Jake Freeland

On Fri, Oct 7, 2022 at 5:56 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/i915/gem_mmap_*: Add NULL to ptrace() calls (rev2)
> *URL:* https://patchwork.freedesktop.org/series/109495/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html CI
> Bug Log - changes from CI_DRM_12226 -> IGTPW_7930 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7930 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7930, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html
> Participating hosts (44 -> 44)
>
> Additional (2): fi-hsw-4770 bat-atsm-1
> Missing (2): fi-ctg-p8600 fi-hsw-4200u
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7930:
> IGT changes Possible regressions
>
>    -
>
>    igt@gem_render_tiled_blits@basic:
>    - fi-apl-guc: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-apl-guc/igt@gem_render_tiled_blits@basic.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-apl-guc/igt@gem_render_tiled_blits@basic.html>
>    -
>
>    igt@i915_selftest@live@reset:
>    - bat-adlp-4: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-adlp-4/igt@i915_selftest@live@reset.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/bat-adlp-4/igt@i915_selftest@live@reset.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@i915_pm_rpm@basic-rte:
>       - {bat-rplp-1}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html>
>       -> DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html>
>
> Known issues
>
> Here are the changes found in IGTPW_7930 that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@gem_softpin@allocator-basic-reserve:
>    - fi-hsw-4770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserve.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +9 similar issues
>    -
>
>    igt@i915_pm_backlight@basic-brightness:
>    - fi-hsw-4770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#3012 <https://gitlab.freedesktop.org/drm/intel/issues/3012>)
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - fi-hsw-g3258: NOTRUN -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html>
>       (i915#3303 <https://gitlab.freedesktop.org/drm/intel/issues/3303> /
>       i915#4785 <https://gitlab.freedesktop.org/drm/intel/issues/4785>)
>    -
>
>    igt@kms_chamelium@common-hpd-after-suspend:
>    - fi-bdw-5557u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>    -
>
>    igt@kms_chamelium@dp-crc-fast:
>    - fi-hsw-4770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       +8 similar issues
>    -
>
>    igt@kms_psr@sprite_plane_onoff:
>    - fi-hsw-4770: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#1072 <https://gitlab.freedesktop.org/drm/intel/issues/1072>)
>       +3 similar issues
>    -
>
>    igt@runner@aborted:
>    - fi-hsw-g3258: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@runner@aborted.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> Possible fixes
>
>    -
>
>    igt@gem_exec_suspend@basic-s3@lmem0:
>    - {bat-dg2-11}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html>
>       (i915#6816 <https://gitlab.freedesktop.org/drm/intel/issues/6816>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html>
>    -
>
>    igt@i915_selftest@live@gt_timelines:
>    - fi-hsw-g3258: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html>
>    -
>
>    igt@i915_selftest@live@guc:
>    - {bat-rpls-2}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-rpls-2/igt@i915_selftest@live@guc.html>
>       (i915#6471 <https://gitlab.freedesktop.org/drm/intel/issues/6471>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/bat-rpls-2/igt@i915_selftest@live@guc.html>
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - {fi-ehl-2}: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
>       (i915#5153 <https://gitlab.freedesktop.org/drm/intel/issues/5153>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-ehl-2/igt@i915_selftest@live@hangcheck.html>
>    -
>
>    igt@i915_suspend@basic-s3-without-i915:
>    - fi-bdw-5557u: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html>
>       (i915#146 <https://gitlab.freedesktop.org/drm/intel/issues/146> /
>       i915#6712 <https://gitlab.freedesktop.org/drm/intel/issues/6712>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html>
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7003 -> IGTPW_7930
>
> CI-20190529: 20190529
> CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7930: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/index.html
> IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--00000000000037940705ea7a0d3c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana,=C2=A0<br><div><br></div><div>I believe=
 this is a false-negative.</div><div><br></div><div>Thank you,</div><div>Ja=
ke Freeland</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Fri, Oct 7, 2022 at 5:56 PM Patchwork &lt;<a href=3D"ma=
ilto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.org</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div=
 class=3D"msg4594628061533193831">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/i915/gem_mmap_*: Add NULL to pt=
race() calls (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109495/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
9495/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7930/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7930/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12226 -&gt; IGTPW_7930</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7930 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7930, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7930/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7930/index.html</a></p>
<h2>Participating hosts (44 -&gt; 44)</h2>
<p>Additional (2): fi-hsw-4770 bat-atsm-1 <br>
  Missing    (2): fi-ctg-p8600 fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7930=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@gem_render_tiled_blits@basic:</p>
<ul>
<li>fi-apl-guc:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-apl-guc/igt@gem_render_tiled_blits@basic.html" target=3D"_=
blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_7930/fi-apl-guc/igt@gem_render_tiled_blits@basic.html" target=3D"_blan=
k">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@reset:</p>
<ul>
<li>bat-adlp-4:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-adlp-4/igt@i915_selftest@live@reset.html" target=3D"_blan=
k">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW=
_7930/bat-adlp-4/igt@i915_selftest@live@reset.html" target=3D"_blank">INCOM=
PLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_pm_rpm@basic-rte:<ul>
<li>{bat-rplp-1}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html" target=3D"_blank">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_79=
30/bat-rplp-1/igt@i915_pm_rpm@basic-rte.html" target=3D"_blank">DMESG-WARN<=
/a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7930 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@gem_softpin@allocator-basic-reserve:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@gem_softpin@allocator-basic-reserv=
e.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org=
/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>) +9 similar iss=
ues</li>
</ul>
</li>
<li>
<p>igt@i915_pm_backlight@basic-brightness:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@i915_pm_backlight@basic-brightness=
.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/=
show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/intel/issues/3012" target=3D"_blank">i915#3=
012</a>)</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@i915_selftest@live@hangcheck.html=
" target=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/intel/issues/3303" target=3D"_blank">i915#3303</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/intel/issues/4785" target=3D"_blank">i915#47=
85</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>fi-bdw-5557u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-su=
spend.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop=
.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=
=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank=
">fdo#111827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@dp-crc-fast:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@kms_chamelium@dp-crc-fast.html" ta=
rget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.=
cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">fdo#111827</a>=
) +8 similar issues</li>
</ul>
</li>
<li>
<p>igt@kms_psr@sprite_plane_onoff:</p>
<ul>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-4770/igt@kms_psr@sprite_plane_onoff.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/1072" target=3D"_blank">i915#1072</a>)=
 +3 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-hsw-g3258:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@runner@aborted.html" target=3D"_b=
lank">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D1=
09271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html" target=
=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6816" target=3D"_blank">i915#6816</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/bat-dg2-11/igt@gem_exec_suspen=
d@basic-s3@lmem0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-hsw-g3258:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html" target=
=3D"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7930/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html"=
 target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@guc:</p>
<ul>
<li>{bat-rpls-2}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-rpls-2/igt@i915_selftest@live@guc.html" target=3D"_blank"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues=
/6471" target=3D"_blank">i915#6471</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_7930/bat-rpls-2/igt@i915_selftest@live@guc.htm=
l" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>{fi-ehl-2}:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-ehl-2/igt@i915_selftest@live@hangcheck.html" target=3D"_bl=
ank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/5153" target=3D"_blank">i915#5153</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-ehl-2/igt@i915_selftest@live@hangc=
heck.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_suspend@basic-s3-without-i915:</p>
<ul>
<li>fi-bdw-5557u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html" tar=
get=3D"_blank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/intel/issues/146" target=3D"_blank">i915#146</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/intel/issues/6712" target=3D"_blank">i915#6712</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7930/fi-bd=
w-5557u/igt@i915_suspend@basic-s3-without-i915.html" target=3D"_blank">PASS=
</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7003 -&gt; IGTPW_7930</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7930: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_793=
0/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7930/index.html</a><br>
  IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--00000000000037940705ea7a0d3c--
