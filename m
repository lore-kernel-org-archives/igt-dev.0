Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8E4C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 12:28:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214A710E8BD;
	Thu, 30 May 2024 12:28:22 +0000 (UTC)
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8010110E69D;
 Thu, 30 May 2024 12:28:16 +0000 (UTC)
Received: from 85-76-80-116-nat.elisa-mobile.fi ([85.76.80.116]
 helo=[192.168.8.10])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97) (envelope-from <luca@coelho.fi>)
 id 1sCetA-00000001IPs-2JxQ; Thu, 30 May 2024 15:28:14 +0300
Message-ID: <08a500f4657d2c7f62a8f8e0d822701944592a92.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Luca Coelho <luciano.coelho@intel.com>
Date: Thu, 30 May 2024 15:26:39 +0300
In-Reply-To: <171706348999.2237379.17019887461316108923@8e613ede5ea5>
References: <20240530085908.564733-1-luciano.coelho@intel.com>
 <171706348999.2237379.17019887461316108923@8e613ede5ea5>
Content-Type: multipart/alternative; boundary="=-RPPpf+WG/UafgvA7KnwZ"
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
Subject: Re: =?UTF-8?Q?=E2=9C=97?= Fi.CI.BAT: failure for check
 drmModeGetConnector() return value in some missing places (rev4)
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--=-RPPpf+WG/UafgvA7KnwZ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

This failure is not related to my test. =C2=A0Can this please be re-
reported?

Thanks!

--
Cheers,
Luca.


On Thu, 2024-05-30 at 10:04 +0000, Patchwork wrote:
> Patch Details
> Series:check drmModeGetConnector() return value in some missing
> places (rev4)
> URL:https://patchwork.freedesktop.org/series/133953/
> State:failure
> Details:
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11206/index.html
> CI Bug Log - changes from CI_DRM_14849 -> IGTPW_11206SummaryFAILURE
> Serious unknown changes coming with IGTPW_11206 absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_11206, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives
> in CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_11206/index.html
> Participating hosts (42 -> 33)Missing (9): bat-dg1-7 bat-kbl-2 fi-bsw-n30=
50 fi-kbl-8809g bat-atsm-1
> fi-elk-e7500 bat-jsl-3 bat-dg2-11 bat-arls-1=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_11206:
> IGT changesPossible regressions * igt@i915_selftest@live@gt_mocs:bat-adlp=
-9: PASS -> INCOMPLETE
> Known issuesHere are the changes found in IGTPW_11206 that come from know=
n
> issues:
> IGT changesPossible fixes * igt@gem_lmem_swapping@basic@lmem0:bat-dg2-8: =
FAIL (i915#10378) ->
>    PASS
>  * igt@i915_module_load@load:bat-dg2-8: DMESG-WARN (i915#10014) -> PASS
> {name}: This element is suppressed. This means it is ignored when
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> Build changes * CI: CI-20190529 -> None
>  * IGT: IGT_7873 -> IGTPW_11206
> CI-20190529: 20190529
> CI_DRM_14849: 55d6179b96e0390025f2ba101c03b94b50cab7a1 @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_11206: 11206
> IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


--=-RPPpf+WG/UafgvA7KnwZ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;"><div>Hi,</div><div><br></div><div>This failure is =
not related to my test. &nbsp;Can this please be re-reported?</div><div><br=
></div><div>Thanks!</div><div><br></div><div>--</div><div>Cheers,</div><div=
>Luca.</div><div><br></div><div><br></div><div>On Thu, 2024-05-30 at 10:04 =
+0000, Patchwork wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 =
0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><b>Patch Detai=
ls</b></div><div><table><tbody><tr><td><b>Series:</b></td><td>check drmMode=
GetConnector() return value in some missing places (rev4)</td></tr><tr><td>=
<b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/series/133=
953/">https://patchwork.freedesktop.org/series/133953/</a></td></tr><tr><td=
><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td><td><a=
 href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11206/index.html">h=
ttps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11206/index.html</a></td></tr=
></tbody></table> </div><h1>CI Bug Log - changes from CI_DRM_14849 -&gt; IG=
TPW_11206</h1><h2>Summary</h2><p><strong>FAILURE</strong></p><p>Serious unk=
nown changes coming with IGTPW_11206 absolutely need to be<br> verified man=
ually.</p><p>If you think the reported changes have nothing to do with the =
changes<br> introduced in IGTPW_11206, please notify your bug team (I915-ci=
-infra@lists.freedesktop.org) to allow them<br> to document this new failur=
e mode, which will reduce false positives in CI.</p><p>External URL: https:=
//intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11206/index.html</p><h2>Participat=
ing hosts (42 -&gt; 33)</h2><p>Missing (9): bat-dg1-7 bat-kbl-2 fi-bsw-n305=
0 fi-kbl-8809g bat-atsm-1 fi-elk-e7500 bat-jsl-3 bat-dg2-11 bat-arls-1 </p>=
<h2>Possible new issues</h2><p>Here are the unknown changes that may have b=
een introduced in IGTPW_11206:</p><h3>IGT changes</h3><h4>Possible regressi=
ons</h4><ul><li>igt@i915_selftest@live@gt_mocs:<ul><li>bat-adlp-9: <a href=
=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14849/bat-adlp-9/igt@i9=
15_selftest@live@gt_mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/drm-tip/IGTPW_11206/bat-adlp-9/igt@i915_selftest@live@gt_moc=
s.html">INCOMPLETE</a></li></ul></li></ul><h2>Known issues</h2><p>Here are =
the changes found in IGTPW_11206 that come from known issues:</p><h3>IGT ch=
anges</h3><h4>Possible fixes</h4><ul><li><p>igt@gem_lmem_swapping@basic@lme=
m0:</p><ul><li>bat-dg2-8: <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/CI_DRM_14849/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10378">=
i915#10378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/I=
GTPW_11206/bat-dg2-8/igt@gem_lmem_swapping@basic@lmem0.html">PASS</a></li><=
/ul></li><li><p>igt@i915_module_load@load:</p><ul><li>bat-dg2-8: <a href=3D=
"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14849/bat-dg2-8/igt@i915_m=
odule_load@load.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/i915/kernel/-/issues/10014">i915#10014</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11206/bat-dg2-8/igt@i915_module_l=
oad@load.html">PASS</a></li></ul></li></ul><p>{name}: This element is suppr=
essed. This means it is ignored when computing<br> the status of the differ=
ence (SUCCESS, WARNING, or FAILURE).</p><h2>Build changes</h2><ul><li>CI: C=
I-20190529 -&gt; None</li><li>IGT: IGT_7873 -&gt; IGTPW_11206</li></ul><p>C=
I-20190529: 20190529<br> CI_DRM_14849: 55d6179b96e0390025f2ba101c03b94b50ca=
b7a1 @ git://anongit.freedesktop.org/gfx-ci/linux<br> IGTPW_11206: 11206<br=
> IGT_7873: b9bcded9123ac56ce05748de6c4870fb49451b87 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git</p></blockquote><div><br></div><div><span>=
</span></div></body></html>

--=-RPPpf+WG/UafgvA7KnwZ--
