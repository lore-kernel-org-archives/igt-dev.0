Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5C2810EA9A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 09:39:45 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id t7so15715179qta.10
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 02:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
 <164966514808.2972.10252855649435136555@emeril.freedesktop.org>
In-Reply-To: <164966514808.2972.10252855649435136555@emeril.freedesktop.org>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 11 Apr 2022 10:39:17 +0100
Message-ID: <CAM0jSHPWXNf3NdhmitNa5aXLNjn+dJT_dN0GqDeyj-9hZBFT2A@mail.gmail.com>
To: igt-dev@lists.freedesktop.org, lakshminarayana.vudum@intel.com
Content-Type: multipart/alternative; boundary="0000000000006d48fb05dc5db986"
Subject: Re: [igt-dev]
	=?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
	=?utf-8?q?drm=5Fbuddy=3A_Add_drm_buddy_test_cases?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--0000000000006d48fb05dc5db986
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Apr 2022 at 09:19, Patchwork <patchwork@emeril.freedesktop.org>
wrote:

> *Patch Details*
> *Series:* tests/drm_buddy: Add drm buddy test cases
> *URL:* https://patchwork.freedesktop.org/series/102469/
> *State:* failure
> *Details:* https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html CI
> Bug Log - changes from CI_DRM_11481 -> IGTPW_6912 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6912 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6912, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
> External URL:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html
> Participating hosts (47 -> 44)
>
> Additional (2): fi-pnv-d510 bat-dg1-5
> Missing (5): shard-tglu fi-bsw-cyan fi-icl-u2 shard-dg1 fi-bdw-samus
> Possible new issues
>
> Here are the unknown changes that may have been introduced in IGTPW_6912:
> IGT changes Possible regressions
>
>    - igt@runner@aborted:
>       - bat-dg1-5: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/bat-dg1-5/igt@runner@aborted.html>
>
> Lakshmi, looks like unrelated failure.


>
>    -
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@i915_selftest@live@gt_pm:
>       - {fi-tgl-dsi}: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11481/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html>
>       (i915#1759 <https://gitlab.freedesktop.org/drm/intel/issues/1759>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6912 that come from known issues:
> IGT changes Issues hit
>
>    -
>
>    igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>    - fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#5341 <https://gitlab.freedesktop.org/drm/intel/issues/5341>)
>    -
>
>    igt@prime_vgem@basic-userptr:
>    - fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@prime_vgem@basic-userptr.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271>)
>       +57 similar issues
>    -
>
>    igt@runner@aborted:
>    -
>
>       fi-bdw-5557u: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-bdw-5557u/igt@runner@aborted.html>
>       (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       -
>
>       fi-hsw-4770: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-hsw-4770/igt@runner@aborted.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271> /
>       i915#2722 <https://gitlab.freedesktop.org/drm/intel/issues/2722> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>       i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
>
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6415 -> IGTPW_6912
>
> CI-20190529: 20190529
> CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_6912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html
> IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
> == Testlist changes ==
>
> +igt@drm_buddy@all
>

--0000000000006d48fb05dc5db986
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace">On Mon, 11 Apr 2022 at 09:19, Patchwork &lt;<=
a href=3D"mailto:patchwork@emeril.freedesktop.org">patchwork@emeril.freedes=
ktop.org</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
<u></u>

=20
 =20
 =20
 =20

<div>


<b>Patch Details</b>
<table>
<tbody><tr><td><b>Series:</b></td><td>tests/drm_buddy: Add drm buddy test c=
ases</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/102469/" target=3D"_blank">https://patchwork.freedesktop.org/series/10=
2469/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6912/index.html" target=3D"_blank">https://intel-gfx-ci.=
01.org/tree/drm-tip/IGTPW_6912/index.html</a></td></tr>

</tbody></table>


    <h1>CI Bug Log - changes from CI_DRM_11481 -&gt; IGTPW_6912</h1>
<h2>Summary</h2>
<p><b>FAILURE</b></p>
<p>Serious unknown changes coming with IGTPW_6912 absolutely need to be<br>
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
  introduced in IGTPW_6912, please notify your bug team to allow them<br>
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6912/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6912/index.html</a></p>
<h2>Participating hosts (47 -&gt; 44)</h2>
<p>Additional (2): fi-pnv-d510 bat-dg1-5 <br>
  Missing    (5): shard-tglu fi-bsw-cyan fi-icl-u2 shard-dg1 fi-bdw-samus <=
/p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6912=
:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-dg1-5:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6912/bat-dg1-5/igt@runner@aborted.html" target=3D"_blan=
k">FAIL</a></li></ul></li></ul></div></blockquote><div><div style=3D"font-f=
amily:monospace,monospace" class=3D"gmail_default"></div><div style=3D"font=
-family:monospace,monospace" class=3D"gmail_default">Lakshmi, looks like un=
related failure.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div><ul><li><ul>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
  They do not affect the overall result.</p>
<ul>
<li>igt@i915_selftest@live@gt_pm:<ul>
<li>{fi-tgl-dsi}:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_11481/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html" target=3D"_blan=
k">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issu=
es/1759" target=3D"_blank">i915#1759</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/igt@i915_selftest@live@gt_pm=
.html" target=3D"_blank">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_6912 that come from known issues:</p=
>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-san=
itycheck-pipe-c.html" target=3D"_blank">SKIP</a> (<a href=3D"https://bugs.f=
reedesktop.org/show_bug.cgi?id=3D109271" target=3D"_blank">fdo#109271</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5341" target=3D=
"_blank">i915#5341</a>)</li>
</ul>
</li>
<li>
<p>igt@prime_vgem@basic-userptr:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_6912/fi-pnv-d510/igt@prime_vgem@basic-userptr.html" tar=
get=3D"_blank">SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.c=
gi?id=3D109271" target=3D"_blank">fdo#109271</a>) +57 similar issues</li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>
<p>fi-bdw-5557u:       NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6912/fi-bdw-5557u/igt@runner@aborted.html" target=3D"_bl=
ank">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4=
312" target=3D"_blank">i915#4312</a>)</p>
</li>
<li>
<p>fi-hsw-4770:        NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_6912/fi-hsw-4770/igt@runner@aborted.html" target=3D"_bla=
nk">FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109=
271" target=3D"_blank">fdo#109271</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/intel/issues/2722" target=3D"_blank">i915#2722</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/intel/issues/4312" target=3D"_blank">i91=
5#4312</a> / <a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/559=
4" target=3D"_blank">i915#5594</a>)</p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6415 -&gt; IGTPW_6912</li>
</ul>
<p>CI-20190529: 20190529<br>
  CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://<a href=3D=
"http://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.fre=
edesktop.org/gfx-ci/linux</a><br>
  IGTPW_6912: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_691=
2/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_6912/index.html</a><br>
  IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ <a href=3D"https://g=
itlab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">https://gitl=
ab.freedesktop.org/drm/igt-gpu-tools.git</a></p>
<p>=3D=3D Testlist changes =3D=3D</p>
<p>+igt@drm_buddy@all</p>

</div>

</blockquote></div></div>

--0000000000006d48fb05dc5db986--
