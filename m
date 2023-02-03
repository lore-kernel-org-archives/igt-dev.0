Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFE610E20A
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 16:59:17 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id eq11so5785147edb.6
 for <igt-dev@lists.freedesktop.org>; Fri, 03 Feb 2023 08:59:17 -0800 (PST)
MIME-Version: 1.0
References: <20230201181215.30500-1-markyacoub@google.com>
 <167527738655.25546.1927977876668648118@emeril.freedesktop.org>
 <CAJUqKUoRGa8=Som60+OyieGFjNKObq06_XQSWq=zS8BpntZhrg@mail.gmail.com>
 <Y9zdqjsQEO3+UKX5@adrinael.net>
In-Reply-To: <Y9zdqjsQEO3+UKX5@adrinael.net>
From: Mark Yacoub <markyacoub@google.com>
Date: Fri, 3 Feb 2023 11:59:05 -0500
Message-ID: <CAC0gqY7JddirOCtLN44ykYq1701FO40e-Kh1i7DANprUEjyHXA@mail.gmail.com>
To: Petri Latvala <adrinael@adrinael.net>
Content-Type: multipart/alternative; boundary="00000000000001267205f3ce9af0"
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
Cc: igt-dev@lists.freedesktop.org, "Vudum,
 Lakshminarayana" <lakshminarayana.vudum@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--00000000000001267205f3ce9af0
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 3, 2023 at 5:10 AM Petri Latvala <adrinael@adrinael.net> wrote:

> On Wed, Feb 01, 2023 at 04:02:35PM -0500, Mark Yacoub wrote:
> > Hi Lakshminarayana, the failure seems unrelated - can we get a rerun
> please?
>
>
> The failure is very related. The failure is:
>
> "GetChameleondLogs" is not supported
>
> You need to check with chamelium_supports_method whether
> GetChameleondLogs is there. Btw, what chameleond version does that
> need?
>
It runs on V3 - I added a number of safeguards to make sure everything is
happy.

>
> --
> Petri Latvala
>
>
> >
> > On Wed, Feb 1, 2023 at 1:49 PM Patchwork <
> patchwork@emeril.freedesktop.org>
> > wrote:
> >
> > > *Patch Details*
> > > *Series:* Chamelium: Get Chamelium Logs on RPC failure.
> > > *URL:* https://patchwork.freedesktop.org/series/113567/
> > > *State:* failure
> > > *Details:*
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html CI
> > > Bug Log - changes from CI_DRM_12680 -> IGTPW_8428 Summary
> > >
> > > *FAILURE*
> > >
> > > Serious unknown changes coming with IGTPW_8428 absolutely need to be
> > > verified manually.
> > >
> > > If you think the reported changes have nothing to do with the changes
> > > introduced in IGTPW_8428, please notify your bug team to allow them
> > > to document this new failure mode, which will reduce false positives
> in CI.
> > >
> > > External URL:
> > > https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> > > Participating hosts (26 -> 25)
> > >
> > > Missing (1): fi-snb-2520m
> > > Possible new issues
> > >
> > > Here are the unknown changes that may have been introduced in
> IGTPW_8428:
> > > IGT changes Possible regressions
> > >
> > >    - igt@kms_chamelium_frames@hdmi-crc-fast:
> > >       - fi-kbl-7567u: PASS
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
> >
> > >       -> FAIL
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fast.html
> >
> > >       +3 similar issues
> > >
> > > Warnings
> > >
> > >    - igt@kms_chamelium_hpd@vga-hpd-fast:
> > >       - fi-kbl-7567u: SKIP
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >
> > >       (fdo#109271 <https://bugs.freedesktop.org/show_bug.cgi?id=109271
> >)
> > >       -> FAIL
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html
> >
> > >       +4 similar issues
> > >
> > > Known issues
> > >
> > > Here are the changes found in IGTPW_8428 that come from known issues:
> > > IGT changes Issues hit
> > >
> > >    - igt@i915_selftest@live@gt_heartbeat:
> > >       - fi-glk-j4005: PASS
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
> >
> > >       -> DMESG-FAIL
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html
> >
> > >       (i915#5334 <https://gitlab.freedesktop.org/drm/intel/issues/5334
> >)
> > >
> > > Possible fixes
> > >
> > >    - igt@i915_selftest@live@migrate:
> > >       - {bat-dg2-11}: DMESG-WARN
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.html
> >
> > >       (i915#7699 <https://gitlab.freedesktop.org/drm/intel/issues/7699
> >)
> > >       -> PASS
> > >       <
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@migrate.html
> >
> > >
> > > {name}: This element is suppressed. This means it is ignored when
> computing
> > > the status of the difference (SUCCESS, WARNING, or FAILURE).
> > > Build changes
> > >
> > >    - CI: CI-20190529 -> None
> > >    - IGT: IGT_7143 -> IGTPW_8428
> > >
> > > CI-20190529: 20190529
> > > CI_DRM_12680: 06086656e6f03cbcbb4b99273734a7943e923fc9 @ git://
> > > anongit.freedesktop.org/gfx-ci/linux
> > > IGTPW_8428:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/index.html
> > > IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @
> > > https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> > >
>

--00000000000001267205f3ce9af0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 3, 2023 at 5:10 AM Petri =
Latvala &lt;<a href=3D"mailto:adrinael@adrinael.net">adrinael@adrinael.net<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">O=
n Wed, Feb 01, 2023 at 04:02:35PM -0500, Mark Yacoub wrote:<br>
&gt; Hi Lakshminarayana, the failure seems unrelated - can we get a rerun p=
lease?<br>
<br>
<br>
The failure is very related. The failure is:<br>
<br>
&quot;GetChameleondLogs&quot; is not supported<br>
<br>
You need to check with chamelium_supports_method whether<br>
GetChameleondLogs is there. Btw, what chameleond version does that<br>
need?<br></blockquote><div>It runs on V3 - I added a number of safeguards t=
o make sure everything is happy.=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
-- <br>
Petri Latvala<br>
<br>
<br>
&gt; <br>
&gt; On Wed, Feb 1, 2023 at 1:49 PM Patchwork &lt;<a href=3D"mailto:patchwo=
rk@emeril.freedesktop.org" target=3D"_blank">patchwork@emeril.freedesktop.o=
rg</a>&gt;<br>
&gt; wrote:<br>
&gt; <br>
&gt; &gt; *Patch Details*<br>
&gt; &gt; *Series:* Chamelium: Get Chamelium Logs on RPC failure.<br>
&gt; &gt; *URL:* <a href=3D"https://patchwork.freedesktop.org/series/113567=
/" rel=3D"noreferrer" target=3D"_blank">https://patchwork.freedesktop.org/s=
eries/113567/</a><br>
&gt; &gt; *State:* failure<br>
&gt; &gt; *Details:* <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_8428/index.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx=
-ci.01.org/tree/drm-tip/IGTPW_8428/index.html</a> CI<br>
&gt; &gt; Bug Log - changes from CI_DRM_12680 -&gt; IGTPW_8428 Summary<br>
&gt; &gt;<br>
&gt; &gt; *FAILURE*<br>
&gt; &gt;<br>
&gt; &gt; Serious unknown changes coming with IGTPW_8428 absolutely need to=
 be<br>
&gt; &gt; verified manually.<br>
&gt; &gt;<br>
&gt; &gt; If you think the reported changes have nothing to do with the cha=
nges<br>
&gt; &gt; introduced in IGTPW_8428, please notify your bug team to allow th=
em<br>
&gt; &gt; to document this new failure mode, which will reduce false positi=
ves in CI.<br>
&gt; &gt;<br>
&gt; &gt; External URL:<br>
&gt; &gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_8428/in=
dex.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/=
tree/drm-tip/IGTPW_8428/index.html</a><br>
&gt; &gt; Participating hosts (26 -&gt; 25)<br>
&gt; &gt;<br>
&gt; &gt; Missing (1): fi-snb-2520m<br>
&gt; &gt; Possible new issues<br>
&gt; &gt;<br>
&gt; &gt; Here are the unknown changes that may have been introduced in IGT=
PW_8428:<br>
&gt; &gt; IGT changes Possible regressions<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - igt@kms_chamelium_frames@hdmi-crc-fast:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- fi-kbl-7567u: PASS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-cr=
c-fast.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.o=
rg/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc=
-fast.html</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-=
fast.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_frames@hdmi-crc-fas=
t.html</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+3 similar issues<br>
&gt; &gt;<br>
&gt; &gt; Warnings<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - igt@kms_chamelium_hpd@vga-hpd-fast:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- fi-kbl-7567u: SKIP<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fa=
st.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/t=
ree/drm-tip/CI_DRM_12680/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.ht=
ml</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(fdo#109271 &lt;<a href=3D"https://bugs=
.freedesktop.org/show_bug.cgi?id=3D109271" rel=3D"noreferrer" target=3D"_bl=
ank">https://bugs.freedesktop.org/show_bug.cgi?id=3D109271</a>&gt;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; FAIL<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast=
.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tre=
e/drm-tip/IGTPW_8428/fi-kbl-7567u/igt@kms_chamelium_hpd@vga-hpd-fast.html</=
a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0+4 similar issues<br>
&gt; &gt;<br>
&gt; &gt; Known issues<br>
&gt; &gt;<br>
&gt; &gt; Here are the changes found in IGTPW_8428 that come from known iss=
ues:<br>
&gt; &gt; IGT changes Issues hit<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - igt@i915_selftest@live@gt_heartbeat:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- fi-glk-j4005: PASS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartb=
eat.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/=
tree/drm-tip/CI_DRM_12680/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.=
html</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; DMESG-FAIL<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbea=
t.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tr=
ee/drm-tip/IGTPW_8428/fi-glk-j4005/igt@i915_selftest@live@gt_heartbeat.html=
</a>&gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#5334 &lt;<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/5334" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/drm/intel/issues/5334</a>&gt;)<br>
&gt; &gt;<br>
&gt; &gt; Possible fixes<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - igt@i915_selftest@live@migrate:<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0- {bat-dg2-11}: DMESG-WARN<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.htm=
l" rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tree/dr=
m-tip/CI_DRM_12680/bat-dg2-11/igt@i915_selftest@live@migrate.html</a>&gt;<b=
r>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0(i915#7699 &lt;<a href=3D"https://gitla=
b.freedesktop.org/drm/intel/issues/7699" rel=3D"noreferrer" target=3D"_blan=
k">https://gitlab.freedesktop.org/drm/intel/issues/7699</a>&gt;)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-&gt; PASS<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://intel-gfx-ci.01.=
org/tree/drm-tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@migrate.html"=
 rel=3D"noreferrer" target=3D"_blank">https://intel-gfx-ci.01.org/tree/drm-=
tip/IGTPW_8428/bat-dg2-11/igt@i915_selftest@live@migrate.html</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; {name}: This element is suppressed. This means it is ignored when=
 computing<br>
&gt; &gt; the status of the difference (SUCCESS, WARNING, or FAILURE).<br>
&gt; &gt; Build changes<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 - CI: CI-20190529 -&gt; None<br>
&gt; &gt;=C2=A0 =C2=A0 - IGT: IGT_7143 -&gt; IGTPW_8428<br>
&gt; &gt;<br>
&gt; &gt; CI-20190529: 20190529<br>
&gt; &gt; CI_DRM_12680: 06086656e6f03cbcbb4b99273734a7943e923fc9 @ git://<b=
r>
&gt; &gt; <a href=3D"http://anongit.freedesktop.org/gfx-ci/linux" rel=3D"no=
referrer" target=3D"_blank">anongit.freedesktop.org/gfx-ci/linux</a><br>
&gt; &gt; IGTPW_8428: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_8428/index.html" rel=3D"noreferrer" target=3D"_blank">https://intel-gf=
x-ci.01.org/tree/drm-tip/IGTPW_8428/index.html</a><br>
&gt; &gt; IGT_7143: c7b12dcc460fc2348e1fa7f4dcb791bb82e29e44 @<br>
&gt; &gt; <a href=3D"https://gitlab.freedesktop.org/drm/igt-gpu-tools.git" =
rel=3D"noreferrer" target=3D"_blank">https://gitlab.freedesktop.org/drm/igt=
-gpu-tools.git</a><br>
&gt; &gt;<br>
</blockquote></div></div>

--00000000000001267205f3ce9af0--
