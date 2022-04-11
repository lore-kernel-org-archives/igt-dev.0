Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2BD10E0A1
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 14:56:56 +0000 (UTC)
Received: by mail-qt1-x82a.google.com with SMTP id z14so2261630qto.5
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220411072801.15097-1-Arunpravin.PaneerSelvam@amd.com>
 <164966514808.2972.10252855649435136555@emeril.freedesktop.org>
 <CAM0jSHPWXNf3NdhmitNa5aXLNjn+dJT_dN0GqDeyj-9hZBFT2A@mail.gmail.com>
 <3a48b6039c054a439bfa2484a063528c@intel.com>
In-Reply-To: <3a48b6039c054a439bfa2484a063528c@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 11 Apr 2022 15:56:29 +0100
Message-ID: <CAM0jSHOiGExPcGnY9kOK6vf4Dd8dd65o3BmynHdhY8HiwQZsFQ@mail.gmail.com>
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Content-Type: multipart/alternative; boundary="000000000000c72ccb05dc62275d"
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
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--000000000000c72ccb05dc62275d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Apr 2022 at 15:42, Vudum, Lakshminarayana <
lakshminarayana.vudum@intel.com> wrote:

> It=E2=80=99s related to https://gitlab.freedesktop.org/drm/intel/-/issues=
/5616
>
> igt@runner@aborted - fail - BUG: kernel NULL pointer dereference,
> address: 0000000000000008, RIP: 0010:dma_resv_add_fence
>

Ok. I assume you can still trigger shards run? This new buddy test case
should be triggered there I hope.


>
>
> @Matthew Auld <matthew.william.auld@gmail.com> Btw, from which build we
> shouldn=E2=80=99t be seeing this bug
> https://gitlab.freedesktop.org/drm/intel/-/issues/5602 ?
>

It should have been CI_DRM_11476. At least according to
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11476/git-log-oneline.txt



>
>
> Thanks,
>
> Lakshmi.
>
> *From:* Matthew Auld <matthew.william.auld@gmail.com>
> *Sent:* Monday, April 11, 2022 2:39 AM
> *To:* igt-dev@lists.freedesktop.org; Vudum, Lakshminarayana <
> lakshminarayana.vudum@intel.com>
> *Cc:* Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
> *Subject:* Re: [igt-dev] =E2=9C=97 Fi.CI.BAT: failure for tests/drm_buddy=
: Add
> drm buddy test cases
>
>
>
> On Mon, 11 Apr 2022 at 09:19, Patchwork <patchwork@emeril.freedesktop.org=
>
> wrote:
>
> *Patch Details*
>
> *Series:*
>
> tests/drm_buddy: Add drm buddy test cases
>
> *URL:*
>
> https://patchwork.freedesktop.org/series/102469/
>
> *State:*
>
> failure
>
> *Details:*
>
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html
> CI Bug Log - changes from CI_DRM_11481 -> IGTPW_6912 Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_6912 absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_6912, please notify your bug team to allow them
> to document this new failure mode, which will reduce false positives in C=
I.
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
>
>
>    - bat-dg1-5: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/bat-dg1-5/igt@=
runner@aborted.html>
>
> Lakshmi, looks like unrelated failure.
>
>
>
>
>    -
>
> Suppressed
>
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
>
>    - igt@i915_selftest@live@gt_pm:
>
>
>    - {fi-tgl-dsi}: DMESG-FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11481/fi-tgl-dsi/i=
gt@i915_selftest@live@gt_pm.html>
>       (i915#1759 <https://gitlab.freedesktop.org/drm/intel/issues/1759>)
>       -> INCOMPLETE
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/igt=
@i915_selftest@live@gt_pm.html>
>
> Known issues
>
> Here are the changes found in IGTPW_6912 that come from known issues:
> IGT changes Issues hit
>
>    - igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:
>
>
>    - fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/ig=
t@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>=
 /
>       i915#5341 <https://gitlab.freedesktop.org/drm/intel/issues/5341>)
>
>
>    - igt@prime_vgem@basic-userptr:
>
>
>    - fi-pnv-d510: NOTRUN -> SKIP
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-pnv-d510/ig=
t@prime_vgem@basic-userptr.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>=
)
>       +57 similar issues
>
>
>    - igt@runner@aborted:
>
>
>    - fi-bdw-5557u: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-bdw-5557u/i=
gt@runner@aborted.html>
>       (i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312>)
>       - fi-hsw-4770: NOTRUN -> FAIL
>       <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-hsw-4770/ig=
t@runner@aborted.html>
>       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=3D109271>=
 /
>       i915#2722 <https://gitlab.freedesktop.org/drm/intel/issues/2722> /
>       i915#4312 <https://gitlab.freedesktop.org/drm/intel/issues/4312> /
>       i915#5594 <https://gitlab.freedesktop.org/drm/intel/issues/5594>)
>
> {name}: This element is suppressed. This means it is ignored when computi=
ng
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes
>
>    - CI: CI-20190529 -> None
>    - IGT: IGT_6415 -> IGTPW_6912
>
> CI-20190529: 20190529
> CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://
> anongit.freedesktop.org/gfx-ci/linux
> IGTPW_6912: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.htm=
l
> IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
>
> =3D=3D Testlist changes =3D=3D
>
> +igt@drm_buddy@all
>
>

--000000000000c72ccb05dc62275d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-family:monospace,monospace">On Mon, 11 Apr 2022 at 15:42, Vudum, Lakshmin=
arayana &lt;<a href=3D"mailto:lakshminarayana.vudum@intel.com">lakshminaray=
ana.vudum@intel.com</a>&gt; wrote:<br></div></div><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex">





<div style=3D"overflow-wrap: break-word;" lang=3D"EN-US">
<div class=3D"gmail-m_1047237380836798644WordSection1">
<p class=3D"MsoNormal">It=E2=80=99s related to <a href=3D"https://gitlab.fr=
eedesktop.org/drm/intel/-/issues/5616" target=3D"_blank">
https://gitlab.freedesktop.org/drm/intel/-/issues/5616</a><u></u><u></u></p=
>
<p class=3D"MsoNormal">igt@runner@aborted - fail - BUG: kernel NULL pointer=
 dereference, address: 0000000000000008, RIP: 0010:dma_resv_add_fence</p></=
div></div></blockquote><div><br></div><div><div style=3D"font-family:monosp=
ace,monospace" class=3D"gmail_default">Ok. I assume you can still trigger s=
hards run? This new buddy test case should be triggered there I hope.</div>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><d=
iv style=3D"overflow-wrap: break-word;" lang=3D"EN-US"><div class=3D"gmail-=
m_1047237380836798644WordSection1"><p class=3D"MsoNormal"><u></u><u></u></p=
>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal"><a id=3D"gmail-m_1047237380836798644OWAAM5E7730E4706=
74FEC98FD68121A4CFA99" href=3D"mailto:matthew.william.auld@gmail.com" targe=
t=3D"_blank"><span style=3D"font-family:&quot;Calibri&quot;,sans-serif;text=
-decoration:none">@Matthew Auld</span></a> Btw, from which build we shouldn=
=E2=80=99t be seeing this bug
<a href=3D"https://gitlab.freedesktop.org/drm/intel/-/issues/5602" target=
=3D"_blank">https://gitlab.freedesktop.org/drm/intel/-/issues/5602</a> ?</p=
></div></div></blockquote><div><br></div><div><div style=3D"font-family:mon=
ospace,monospace" class=3D"gmail_default">It should have been CI_DRM_11476.=
 At least according to <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11476/git-log-oneline.txt">https://intel-gfx-ci.01.org/tree/drm-tip/=
CI_DRM_11476/git-log-oneline.txt</a></div><br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div style=3D"overflow-wrap: br=
eak-word;" lang=3D"EN-US"><div class=3D"gmail-m_1047237380836798644WordSect=
ion1"><p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<p class=3D"MsoNormal">Thanks,<u></u><u></u></p>
<p class=3D"MsoNormal">Lakshmi.<u></u><u></u></p>
<div style=3D"border-color:rgb(225,225,225) currentcolor currentcolor;borde=
r-style:solid none none;border-width:1pt medium medium;padding:3pt 0in 0in"=
>
<p class=3D"MsoNormal"><b>From:</b> Matthew Auld &lt;<a href=3D"mailto:matt=
hew.william.auld@gmail.com" target=3D"_blank">matthew.william.auld@gmail.co=
m</a>&gt; <br>
<b>Sent:</b> Monday, April 11, 2022 2:39 AM<br>
<b>To:</b> <a href=3D"mailto:igt-dev@lists.freedesktop.org" target=3D"_blan=
k">igt-dev@lists.freedesktop.org</a>; Vudum, Lakshminarayana &lt;<a href=3D=
"mailto:lakshminarayana.vudum@intel.com" target=3D"_blank">lakshminarayana.=
vudum@intel.com</a>&gt;<br>
<b>Cc:</b> Arunpravin Paneer Selvam &lt;<a href=3D"mailto:arunpravin.paneer=
selvam@amd.com" target=3D"_blank">arunpravin.paneerselvam@amd.com</a>&gt;<b=
r>
<b>Subject:</b> Re: [igt-dev] <span style=3D"font-family:&quot;Segoe UI Sym=
bol&quot;,sans-serif">
=E2=9C=97</span> Fi.CI.BAT: failure for tests/drm_buddy: Add drm buddy test=
 cases<u></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
On Mon, 11 Apr 2022 at 09:19, Patchwork &lt;<a href=3D"mailto:patchwork@eme=
ril.freedesktop.org" target=3D"_blank">patchwork@emeril.freedesktop.org</a>=
&gt; wrote:<u></u><u></u></span></p>
</div>
</div>
<div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<p class=3D"MsoNormal"><b>Patch Details</b> <u></u><u></u></p>
<table cellpadding=3D"0" border=3D"0">
<tbody>
<tr>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><b>Series:</b><u></u><u></u></p>
</td>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal">tests/drm_buddy: Add drm buddy test cases<u></u><u><=
/u></p>
</td>
</tr>
<tr>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><b>URL:</b><u></u><u></u></p>
</td>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><a href=3D"https://patchwork.freedesktop.org/series/=
102469/" target=3D"_blank">https://patchwork.freedesktop.org/series/102469/=
</a><u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><b>State:</b><u></u><u></u></p>
</td>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal">failure<u></u><u></u></p>
</td>
</tr>
<tr>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><b>Details:</b><u></u><u></u></p>
</td>
<td style=3D"padding:0.75pt">
<p class=3D"MsoNormal"><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/=
IGTPW_6912/index.html" target=3D"_blank">https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_6912/index.html</a><u></u><u></u></p>
</td>
</tr>
</tbody>
</table>
<h1>CI Bug Log - changes from CI_DRM_11481 -&gt; IGTPW_6912<u></u><u></u></=
h1>
<h2>Summary<u></u><u></u></h2>
<p><b>FAILURE</b><u></u><u></u></p>
<p>Serious unknown changes coming with IGTPW_6912 absolutely need to be<br>
verified manually.<u></u><u></u></p>
<p>If you think the reported changes have nothing to do with the changes<br=
>
introduced in IGTPW_6912, please notify your bug team to allow them<br>
to document this new failure mode, which will reduce false positives in CI.=
<u></u><u></u></p>
<p>External URL: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_=
6912/index.html" target=3D"_blank">
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html</a><u></u><u=
></u></p>
<h2>Participating hosts (47 -&gt; 44)<u></u><u></u></h2>
<p>Additional (2): fi-pnv-d510 bat-dg1-5 <br>
Missing (5): shard-tglu fi-bsw-cyan fi-icl-u2 shard-dg1 fi-bdw-samus <u></u=
><u></u></p>
<h2>Possible new issues<u></u><u></u></h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_6912=
:<u></u><u></u></p>
<h3>IGT changes<u></u><u></u></h3>
<h4>Possible regressions<u></u><u></u></h4>
<ul type=3D"disc">
<li class=3D"MsoNormal">
igt@runner@aborted:<u></u><u></u></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
bat-dg1-5: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGTPW_6912/bat-dg1-5/igt@runner@aborted.html" target=3D"_blank">
FAIL</a><u></u><u></u></li></ul>
</ul>
</div>
</blockquote>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Courier New&quot;">=
Lakshmi, looks like unrelated failure.<u></u><u></u></span></p>
</div>
</div>
<div>
<p class=3D"MsoNormal">=C2=A0<u></u><u></u></p>
</div>
<blockquote style=3D"border-color:currentcolor currentcolor currentcolor rg=
b(204,204,204);border-style:none none none solid;border-width:medium medium=
 medium 1pt;padding:0in 0in 0in 6pt;margin-left:4.8pt;margin-right:0in">
<div>
<ul type=3D"disc">
<li class=3D"MsoNormal">
<u></u>=C2=A0<u></u></li></ul>
<h4>Suppressed<u></u><u></u></h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br>
They do not affect the overall result.<u></u><u></u></p>
<ul type=3D"disc">
<li class=3D"MsoNormal">
igt@i915_selftest@live@gt_pm:<u></u><u></u></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
{fi-tgl-dsi}: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_11=
481/fi-tgl-dsi/igt@i915_selftest@live@gt_pm.html" target=3D"_blank">
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/=
1759" target=3D"_blank">i915#1759</a>) -&gt;
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-tgl-dsi/i=
gt@i915_selftest@live@gt_pm.html" target=3D"_blank">
INCOMPLETE</a><u></u><u></u></li></ul>
</ul>
<h2>Known issues<u></u><u></u></h2>
<p>Here are the changes found in IGTPW_6912 that come from known issues:<u>=
</u><u></u></p>
<h3>IGT changes<u></u><u></u></h3>
<h4>Issues hit<u></u><u></u></h4>
<ul type=3D"disc">
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pipe-c:<u></u><u></u></l=
i></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
fi-pnv-d510: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6912/fi-pnv-d510/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-pi=
pe-c.html" target=3D"_blank">
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
 target=3D"_blank">fdo#109271</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5341" target=3D"=
_blank">i915#5341</a>)<u></u><u></u></li></ul>
</ul>
<ul type=3D"disc">
<li>igt@prime_vgem@basic-userptr:<u></u><u></u></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li class=3D"MsoNormal">
fi-pnv-d510: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_6912/fi-pnv-d510/igt@prime_vgem@basic-userptr.html" target=3D"_bla=
nk">
SKIP</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
 target=3D"_blank">fdo#109271</a>) +57 similar issues<u></u><u></u></li></u=
l>
</ul>
<ul type=3D"disc">
<li>igt@runner@aborted:<u></u><u></u></li></ul>
<ul type=3D"disc">
<ul type=3D"circle">
<li>fi-bdw-5557u: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
drm-tip/IGTPW_6912/fi-bdw-5557u/igt@runner@aborted.html" target=3D"_blank">
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312" =
target=3D"_blank">i915#4312</a>)<u></u><u></u></li><li>fi-hsw-4770: NOTRUN =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/fi-hsw=
-4770/igt@runner@aborted.html" target=3D"_blank">
FAIL</a> (<a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109271"=
 target=3D"_blank">fdo#109271</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/2722" target=3D"=
_blank">i915#2722</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/4312" target=3D"=
_blank">i915#4312</a> /
<a href=3D"https://gitlab.freedesktop.org/drm/intel/issues/5594" target=3D"=
_blank">i915#5594</a>)<u></u><u></u></li></ul>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br>
the status of the difference (SUCCESS, WARNING, or FAILURE).<u></u><u></u><=
/p>
<h2>Build changes<u></u><u></u></h2>
<ul type=3D"disc">
<li class=3D"MsoNormal">
CI: CI-20190529 -&gt; None<u></u><u></u></li><li class=3D"MsoNormal">
IGT: IGT_6415 -&gt; IGTPW_6912<u></u><u></u></li></ul>
<p>CI-20190529: 20190529<br>
CI_DRM_11481: 9bf68eb47288411da23ce5c9967f27dba43bda1d @ git://<a href=3D"h=
ttp://anongit.freedesktop.org/gfx-ci/linux" target=3D"_blank">anongit.freed=
esktop.org/gfx-ci/linux</a><br>
IGTPW_6912: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/=
index.html" target=3D"_blank">
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_6912/index.html</a><br>
IGT_6415: c3b690bd5f7fb1fb7ed786ab0f3b815930a6a55f @ <a href=3D"https://git=
lab.freedesktop.org/drm/igt-gpu-tools.git" target=3D"_blank">
https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><u></u><u></u></p>
<p>=3D=3D Testlist changes =3D=3D<u></u><u></u></p>
<p>+igt@drm_buddy@all<u></u><u></u></p>
</div>
</blockquote>
</div>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000c72ccb05dc62275d--
