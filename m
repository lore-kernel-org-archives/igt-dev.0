Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6A710E19E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Feb 2023 21:02:47 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id h16so18509656wrz.12
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Feb 2023 13:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20230201181215.30500-1-markyacoub@google.com>
 <167527738655.25546.1927977876668648118@emeril.freedesktop.org>
In-Reply-To: <167527738655.25546.1927977876668648118@emeril.freedesktop.org>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 1 Feb 2023 16:02:35 -0500
Message-ID: <CAJUqKUoRGa8=Som60+OyieGFjNKObq06_XQSWq=zS8BpntZhrg@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="0000000000002271f605f3a9c519"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgQ2hhbWVs?=
	=?utf-8?q?ium=3A_Get_Chamelium_Logs_on_RPC_failure=2E?=
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

--0000000000002271f605f3a9c519
Content-Type: text/plain; charset="UTF-8"

Hi Lakshminarayana, the failure seems unrelated - can we get a rerun please?

On Wed, Feb 1, 2023 at 1:49 PM Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* Chamelium: Get Chamelium Logs on RPC failure.
> *URL:* https://patchwork.freedesktop.org/series/113567/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html CI
> Bug Log - changes from CI_DRM_12680 -> IGTPW_8428 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_8428 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_8428, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> Participating hosts (26 -> 25)
>
> Missing (1): fi-snb-2520m
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_8428:
> IGT changes Possible regressions
>
>    - igt@kms_chamelium_frames@hdmi-crc-fast:
>       - fi-kbl-7567u: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>       +3 similar issues
>
> Warnings
>
>    - igt@kms_chamelium_hpd@vga-hpd-fast:
>       - fi-kbl-7567u: SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html>
>       +4 similar issues
>
> Known issues
>
> Here are the changes found in IGTPW_8428 that come from known issues:
> IGT changes Issues hit
>
>    - igt@i915_selftest@live@gt_heartbeat:
>       - fi-glk-j4005: PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html>
>       -> DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html>
>       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334>)
>
> Possible fixes
>
>    - igt@i915_selftest@live@migrate:
>       - {bat-dg2-11}: DMESG-WARN
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.html>
>       (i915#7699 <https://gitlab.freedesktop.org/drm/intel/issues/7699>)
>       -> PASS
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@migrate.html>
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_7143 -> IGTPW_8428
>
> CI-20190529: 20190529
> CI_DRM_12680: 06086656e6f03cbcbb4b99273734a7943e923fc9 @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_8428: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>

--0000000000002271f605f3a9c519
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Lakshminarayana, the failure seems unrelated - can=
 we get a rerun please?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Wed, Feb 1, 2023 at 1:49 PM Patchwork &lt;<a href=
=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedesktop.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div class=3D"msg-3503601011243973074">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>Chamelium: Get Chamelium Logs on RPC =
failure.</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/113567/" target=3D"_blank">https://patchwork.freedesktop.org/series/11=
3567/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8428/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_8428/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_12680 -&gt; IGTPW_8428</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_8428 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_8428, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
8428/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_8428/index.html</a></p>
<h2>Participating hosts (26 -&gt; 25)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_8428=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_chamelium_frames@hdmi-crc-fast:<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html" tar=
get=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html"=
 target=3D"_blank">FAIL</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_chamelium_hpd@vga-hpd-fast:<ul>
<li>fi-kbl-7567u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html" target=
=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?=
id=3D109271" target=3D"_blank">fdo#109271</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd=
@vga-hpd-fast.html" target=3D"_blank">FAIL</a> +4 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_8428 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@gt_heartbeat:<ul>
<li>fi-glk-j4005:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html" target=
=3D"_blank">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html" targe=
t=3D"_blank">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
intel/issues/5334" target=3D"_blank">i915#5334</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@i915_selftest@live@migrate:<ul>
<li>{bat-dg2-11}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.html" target=3D"_bl=
ank">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/is=
sues/7699" target=3D"_blank">i915#7699</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/drm-tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@mig=
rate.html" target=3D"_blank">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7143 -&gt; IGTPW_8428</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_12680: 06086656e6f03cbcbb4b99273734a7943e923fc9 @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_8428: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_842=
8/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8428/index.html</a><br>
  IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>

</div>

</div></blockquote></div>

--0000000000002271f605f3a9c519--
