Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com
 [IPv6:2607:f8b0:4864:20::a2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24D910E01F
 for <igt-dev@lists.freedesktop.org>; Sun,  9 Oct 2022 16:54:53 +0000 (UTC)
Received: by mail-vk1-xa2a.google.com with SMTP id a66so1726030vkc.3
 for <igt-dev@lists.freedesktop.org>; Sun, 09 Oct 2022 09:54:53 -0700 (PDT)
MIME-Version: 1.0
References: <20221007232757.3210308-1-jfree@freebsd.org>
 <166518863984.22339.14920866252398400473@emeril.freedesktop.org>
In-Reply-To: <166518863984.22339.14920866252398400473@emeril.freedesktop.org>
From: Jake Freeland <jake@technologyfriends.net>
Date: Sun, 9 Oct 2022 11:54:42 -0500
Message-ID: <CAOgZAGZ-9j55Jg8wK_ur-X7Ta2GcmzaR+Xr1jLEsg+RtL+TGeQ@mail.gmail.com>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Content-Type: multipart/alternative; boundary="000000000000dd85e305ea9ce68d"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgSW50cm9k?=
	=?utf-8?q?uce_FreeBSD_support?=
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

--000000000000dd85e305ea9ce68d
Content-Type: text/plain; charset="UTF-8"

Lakshminarayana,

Another false-negative here as well, I believe.

Thanks,
Jake Freeland

On Fri, Oct 7, 2022 at 19:24 Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Introduce FreeBSD support
> *URL:* https://patchwork.freedesktop.org/series/109501/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/index.html CI
> Bug Log - changes from CI_DRM_12226 -> IGTPW_7932 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7932 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7932, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/index.html
> Participating hosts (44 -> 42)
>
> Additional (1): bat-atsm-1
> Missing (3): fi-ctg-p8600 fi-tgl-dsi fi-hsw-4200u
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7932:
> IGT changes Possible regressions
>
>    - igt@i915_selftest@live@execlists:
>       - fi-bsw-nick: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-bsw-nick/igt@i915_selftest@live@execlists.html>
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@i915_selftest@live@slpc:
>       - {bat-adlm-1}: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-adlm-1/igt@i915_selftest@live@slpc.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/bat-adlm-1/igt@i915_selftest@live@slpc.html>
>
> Known issues
>
> Here are the changes found in IGTPW_7932 that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@i915_selftest@live@hangcheck:
>    - fi-snb-2600: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-snb-2600/igt@i915_selftest@live@hangcheck.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-snb-2600/igt@i915_selftest@live@hangcheck.html>
>       (i915#6992 <https://gitlab.freedesktop.org/drm/intel/issues/6992>)
>    -
>
>    igt@kms_chamelium@common-hpd-after-suspend:
>    -
>
>       fi-hsw-g3258: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -
>
>       fi-bdw-5557u: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-suspend.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       fdo#111827 <https://bugs.freedesktop.org/show_bug.cgi?id=111827>)
>       -
>
>    igt@runner@aborted:
>    - fi-bsw-nick: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-bsw-nick/igt@runner@aborted.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>
> Possible fixes
>
>    -
>
>    igt@gem_exec_suspend@basic-s0@smem:
>    - {bat-rplp-1}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html>
>       (i915#2867 <https://gitlab.freedesktop.org/drm/intel/issues/2867>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html>
>    -
>
>    igt@gem_exec_suspend@basic-s3@lmem0:
>    - {bat-dg2-11}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html>
>       (i915#6816 <https://gitlab.freedesktop.org/drm/intel/issues/6816>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html>
>    -
>
>    igt@i915_selftest@live@gt_timelines:
>    - fi-hsw-g3258: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html>
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html>
>    -
>
>    igt@i915_suspend@basic-s3-without-i915:
>    - fi-bdw-5557u: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12226/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html>
>       (i915#146 <https://gitlab.freedesktop.org/drm/intel/issues/146> /
>       i915#6712 <https://gitlab.freedesktop.org/drm/intel/issues/6712>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-bdw-5557u/igt@i915_suspend@basic-s3-without-i915.html>
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7003 -> IGTPW_7932
>
> CI-20190529: 20190529
> CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7932: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/index.html
> IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--000000000000dd85e305ea9ce68d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Lakshminarayana,</div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Another false-negative here as well, I believe.</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Jake Free=
land</div><div dir=3D"auto"><br></div><div><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 7, 2022 at 19:24 Patchwork &lt=
;<a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freed=
esktop.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
padding-left:1ex;border-left-color:rgb(204,204,204)">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Introduce FreeBSD support</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109501/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
9501/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7932/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7932/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12226 -&gt; IGTPW_7932</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7932 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7932, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7932/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7932/index.html</a></p>
<h2>Participating hosts (44 -&gt; 42)</h2>
<p>Additional (1): bat-atsm-1 <br>
  Missing    (3): fi-ctg-p8600 fi-tgl-dsi fi-hsw-4200u </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7932=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>fi-bsw-nick:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-bsw-nick/igt@i915_selftest@live@execlists.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7932/fi-bsw-nick/igt@i915_selftest@live@execlists.html" target=3D"_bl=
ank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@slpc:<ul>
<li>{bat-adlm-1}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-adlm-1/igt@i915_selftest@live@slpc.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7932/bat-adlm-1/igt@i915_selftest@live@slpc.html" target=3D"_blank">DMESG-F=
AIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7932 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@i915_selftest@live@hangcheck:</p>
<ul>
<li>fi-snb-2600:        <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-snb-2600/igt@i915_selftest@live@hangcheck.html" target=3D"=
_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_7932/fi-snb-2600/igt@i915_selftest@live@hangcheck.html" target=3D"_bl=
ank">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/6992" target=3D"_blank">i915#6992</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium@common-hpd-after-suspend:</p>
<ul>
<li>
<p>fi-hsw-g3258:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7932/fi-hsw-g3258/igt@kms_chamelium@common-hpd-after-sus=
pend.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">f=
do#111827</a>)</p>
</li>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7932/fi-bdw-5557u/igt@kms_chamelium@common-hpd-after-sus=
pend.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> / <a href=3D=
"https://bugs.freedesktop.org/show_bug.cgi?id=3D111827" target=3D"_blank">f=
do#111827</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_7932/fi-bsw-nick/igt@runner@aborted.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D10=
9271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/intel/issues/4312" target=3D"_blank">i915#4312</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_suspend@basic-s0@smem:</p>
<ul>
<li>{bat-rplp-1}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-rplp-1/igt@gem_exec_suspend@basic-s0@smem.html" target=3D=
"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/inte=
l/issues/2867" target=3D"_blank">i915#2867</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/bat-rplp-1/igt@gem_exec_suspend@b=
asic-s0@smem.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@gem_exec_suspend@basic-s3@lmem0:</p>
<ul>
<li>{bat-dg2-11}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/bat-dg2-11/igt@gem_exec_suspend@basic-s3@lmem0.html" target=
=3D"_blank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i=
ntel/issues/6816" target=3D"_blank">i915#6816</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/bat-dg2-11/igt@gem_exec_suspen=
d@basic-s3@lmem0.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_timelines:</p>
<ul>
<li>fi-hsw-g3258:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12226/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html" target=
=3D"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_7932/fi-hsw-g3258/igt@i915_selftest@live@gt_timelines.html"=
 target=3D"_blank">PASS</a></li>
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
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7932/fi-bd=
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
<li>IGT: IGT_7003 -&gt; IGTPW_7932</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12226: bcc9e3eb1e7ba32651eae68b842df07db01e63be @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7932: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_793=
2/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7932/index.html</a><br>
  IGT_7003: 1ea9ec5e7295fbc1cb784be4692971fd342bea53 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</blockquote></div></div>

--000000000000dd85e305ea9ce68d--
