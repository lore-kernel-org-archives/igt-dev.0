Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCEC5DF82
	for <igt-dev@archiver.kernel.org>; Thu, 20 Aug 2026 08:16:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73F10E180;
	Thu, 20 Aug 2026 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eSr+d8UE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0B810E180;
 Thu, 20 Aug 2026 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787213726; x=1818749726;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=2MsanE2I8+C3aPEijOcbWf5tKzDT141ujo38QFNpfbk=;
 b=eSr+d8UEtxtoyHAxcJJCNIA4jPcQdNwM1xtLiG2t62bHFSKFqUPHZ7xi
 ZB8oOLKrqSqIbaMIKePHV64Q3ST79blVTKCIxQAfwzaSFKYcIWnIx5AsP
 e0XiN4/czRswolP7XSUoPJQomiuf1wCouG7a6hhdc966coDD/GgzHC6FP
 hGdFjpu2ksO8vipbuL+4hV5pPeldHxAl8C4UynJwhL2DJV2kQEGpu7k8y
 ZSPABAudybSC/OX1HqJWjLUTUKRKrvroR1lXLSxYzVDz5+EmrRaO43NQJ
 BnX8mXzblNQeerDuBPnklwExpNsU5jVbXmg5VoQd0btUGTK1sA2hjchfB g==;
X-CSE-ConnectionGUID: 5BMXSf91Tru6mAbKlUDxxg==
X-CSE-MsgGUID: 5Cvs/8soRtuw5Ipu0ZnqXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="98336631"
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; d="scan'208,217";a="98336631"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:15:25 -0700
X-CSE-ConnectionGUID: Lz8HyBH4TXSiqJOVggN18w==
X-CSE-MsgGUID: NAPveB2KR6aGkteUNmaziA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,232,1779174000"; 
 d="scan'208,217";a="269403129"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.245.246.134])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2026 01:15:24 -0700
Message-ID: <2566b5335ad2d92b513ca6be0090b4e9f98a659d.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 tests/device_reset: Cold reset doesn't depend on PCI reset
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 20 Aug 2026 10:15:22 +0200
In-Reply-To: <178718148061.69066.17217036699496543210@61270ab9df2a>
References: <20260819144224.1808907-2-janusz.krzysztofik@linux.intel.com>
 <178718148061.69066.17217036699496543210@61270ab9df2a>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-3s4fBjXlUxndHVKgMW0o"
User-Agent: Evolution 3.60.2 
MIME-Version: 1.0
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

--=-3s4fBjXlUxndHVKgMW0o
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Wed, 2026-08-19 at 23:18 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/device_reset: Cold reset doesn't depend on PCI reset
>=20
> URL:https://patchwork.freedesktop.org/series/172460/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/index.html
> CI Bug Log - changes from CI_DRM_19017_full -> IGTPW_15706_fullSummaryFAI=
LURE
> Serious unknown changes coming with IGTPW_15706_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15706_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_15706/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_15706_full:
> IGT changesPossible regressions *=20
>    igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a=
-
>    2:shard-rkl: NOTRUN -> ABORT [5] +1 other test abort
>  *=20
>    igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:shard-tglu: PASS [4] ->
>    DMESG-WARN [3] +2 other tests dmesg-warn
>  *=20
>    igt@kms_flip@flip-vs-dpms-off-vs-modeset:
>     - shard-tglu:         PASS [2] -> ABORT [1] +5 other tests abort

=C2=A0None of the above listed failed tests has anything to do with this IG=
T
change under pre-merge testing, which only touched igt@device_reset,
nothing more. =C2=A0Please update CBL filters and re-report.

Thanks,
Janusz

> Known issues


[1] ABORT
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/shard-tglu-2/igt@k=
ms_flip@flip-vs-dpms-off-vs-modeset.html
[2] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19017/shard-tglu-9/igt@=
kms_flip@flip-vs-dpms-off-vs-modeset.html
[3] DMESG-WARN
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/shard-tglu-5/igt@k=
ms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
[4] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19017/shard-tglu-6/igt@=
kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html
[5] ABORT
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/shard-rkl-3/igt@km=
s_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html

--=-3s4fBjXlUxndHVKgMW0o
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head>
 =20
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
<style>pre,code,address {
  margin: 0px;
}
h1,h2,h3,h4,h5,h6 {
  margin-top: 0.2em;
  margin-bottom: 0.2em;
}
ol,ul {
  margin-top: 0em;
  margin-bottom: 0em;
}
blockquote {
  margin-top: 0em;
  margin-bottom: 0em;
}
</style></head>
<body><div>Hi&nbsp;I915-ci-infra@lists.freedesktop.org,</div><div><br></div=
><div>On Wed, 2026-08-19 at 23:18 +0000, Patchwork wrote:</div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/device_reset: Cold reset doesn'=
t depend on PCI reset</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172460/">https://patchwork.freedesktop.org/series/172460/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from CI_DRM_19017_f=
ull -&gt; IGTPW_15706_full</h1><h2>Summary</h2><p><strong>FAILURE</strong><=
/p><p>Serious unknown changes coming with IGTPW_15706_full absolutely need =
to be<br> verified manually.</p><p>If you think the reported changes have n=
othing to do with the changes<br> introduced in IGTPW_15706_full, please no=
tify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> =
to document this new failure mode, which will reduce false positives in CI.=
</p><p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15706/i=
ndex.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in par=
ticipating hosts</p><h2>Possible new issues</h2><p>Here are the unknown cha=
nges that may have been introduced in IGTPW_15706_full:</p><h3>IGT changes<=
/h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2=
:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15706/shard-rkl-3/igt@kms_ccs@crc-sprite-planes-basic-y=
-tiled-gen12-rc-ccs@pipe-b-hdmi-a-2.html">ABORT</a> +1 other test abort</li=
>
</ul></li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19017/shard-tglu-6/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">=
PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15=
706/shard-tglu-5/igt@kms_flip@basic-flip-vs-dpms@d-hdmi-a1.html">DMESG-WARN=
</a> +2 other tests dmesg-warn</li>
</ul></li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p></li><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19017/shard-tglu-9/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_157=
06/shard-tglu-2/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">ABORT</a> +5=
 other tests abort</li>
</ul>
</ul></blockquote><div><br></div><div>&nbsp;None of the above listed failed=
 tests has anything to do with this IGT change under pre-merge testing, whi=
ch only touched igt@device_reset, nothing more. &nbsp;Please update CBL fil=
ters and re-report.</div><div><br></div><div>Thanks,<br>Janusz</div><div><b=
r></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2=
px #729fcf solid;padding-left:1ex"><h2>Known issues</h2></blockquote><div><=
br></div><div><span></span></div></body></html>

--=-3s4fBjXlUxndHVKgMW0o--
