Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF1F10E29C
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 16:49:10 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 63so17685423ybq.4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Oct 2022 09:49:10 -0700 (PDT)
MIME-Version: 1.0
References: <20221018145926.4014906-1-markyacoub@chromium.org>
 <166610815984.20426.16735639176272897494@emeril.freedesktop.org>
In-Reply-To: <166610815984.20426.16735639176272897494@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 18 Oct 2022 12:48:58 -0400
Message-ID: <CAJUqKUrEPg245vu6bhM3xxOHuUs39rfHGAKvMHBfD7i_noZXdA@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="00000000000000db1305eb51dfe1"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgUmVmYWN0?=
	=?utf-8?q?or_Display_Outputs_to_handle_MST_Connectors=2E?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--00000000000000db1305eb51dfe1
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana,
i have feeling it's irrelevant, so let's rerun.

Also, i like how the KIs are much less now!

On Tue, Oct 18, 2022 at 11:49 AM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Refactor Display Outputs to handle MST Connectors.
> *URL:* https://patchwork.freedesktop.org/series/109831/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html CI
> Bug Log - changes from IGT_7019 -> IGTPW_7977 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_7977 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_7977, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html
> Participating hosts (42 -> 41)
>
> Missing (1): bat-adlm-1
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_7977:
> IGT changes Possible regressions
>
>    - igt@i915_pm_rpm@module-reload:
>       - fi-bdw-5557u: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html>
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html>
>
> Known issues
>
> Here are the changes found in IGTPW_7977 that come from known issues:
> IGT changes Possible fixes
>
>    - igt@fbdev@read:
>       - {bat-rpls-2}: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/bat-rpls-2/igt@fbdev@read.html>
>       (i915#2582 <https://gitlab.freedesktop.org/drm/intel/issues/2582>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/bat-rpls-2/igt@fbdev@read.html>
>       +4 similar issues
>
> Warnings
>
>    - igt@gem_lmem_swapping@random-engines:
>       - fi-bdw-5557u: INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGT_7019/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html>
>       -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7019 -> IGTPW_7977
>
> CI-20190529: 20190529
> CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_7977: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_7977/index.html
> IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--00000000000000db1305eb51dfe1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Lakshminarayana,<div>i have feeling it&#39;s irrelevant=
, so let&#39;s rerun.</div><div><br></div><div>Also, i like how the KIs are=
 much less now!</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Oct 18, 2022 at 11:49 AM Patchwork &lt;<a href=
=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg-5460314360011642413">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Refactor Display Outputs to handle MS=
T Connectors.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/109831/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
9831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_7977/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_7977/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from IGT_7019 -&gt; IGTPW_7977</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_7977 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_7977, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7977/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7977/index.html</a></p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): bat-adlm-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_7977=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@i915_pm_rpm@module-reload:<ul>
<li>fi-bdw-5557u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html" target=3D"_blank=
">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
7977/fi-bdw-5557u/igt@i915_pm_rpm@module-reload.html" target=3D"_blank">INC=
OMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_7977 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@fbdev@read:<ul>
<li>{bat-rpls-2}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/bat-rpls-2/igt@fbdev@read.html" target=3D"_blank">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/intel/issues/2582" target=3D"_blan=
k">i915#2582</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_7977/bat-rpls-2/igt@fbdev@read.html" target=3D"_blank">PASS</a> +4 s=
imilar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@gem_lmem_swapping@random-engines:<ul>
<li>fi-bdw-5557u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_7019/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html" target=3D=
"_blank">INCOMPLETE</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_7977/fi-bdw-5557u/igt@gem_lmem_swapping@random-engines.html" t=
arget=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug=
.cgi?id=3D109271" target=3D"_blank">fdo#109271</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7019 -&gt; IGTPW_7977</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12257: b249abef9f86f788e6bacc657ae8eb7743948200 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_7977: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_797=
7/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_7977/index.html</a><br>
  IGT_7019: fdbafce2b74e84739bb1d81223ae6f01fb442980 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--00000000000000db1305eb51dfe1--
