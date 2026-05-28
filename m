Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42AD3CD5BD1
	for <igt-dev@archiver.kernel.org>; Thu, 28 May 2026 08:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DACB210EDC8;
	Thu, 28 May 2026 08:24:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9Kcuc8X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56BD10EDC7;
 Thu, 28 May 2026 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779956625; x=1811492625;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=sp3gsdt7xPV0Ew2Y7XE8TP2oMfkefhmE/lCHZMH89jE=;
 b=Z9Kcuc8XBG/dHSmmH/PNy7Hs7aVgdTH56IzaFGMwIzwKmj/Wg9g+VpFH
 Z1dZUkVFXuNFXS/bwpHI7GTkMyCbEMvcuBtAzhDfyxL1gk0yx2UigcgPl
 UCwDtD9+M3pr9x2hG7zIT0cfhi+4mo/Q4O0J8jyf0iKN25pC44GbZILRX
 Ys/TcyltTiYpOh3jIsJxdsFtupjv4O6osB2NUMjP+7meETa1U2W6UtVvo
 RsLiCNuhpgedQx3ZQAwjmh2iymgR/lEFPfwFyAhN9PRIqaqW/D+gYYdV6
 04Vma1aS61HJIqGbnIGli29bwmiiM8OalBY8jY/DuWjX5pKTT7DW1zoF9 A==;
X-CSE-ConnectionGUID: WiJ1xMfJQty7VflUdI82iw==
X-CSE-MsgGUID: aRPOP4cxQiCEeqjF3b36dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80520781"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208,217";a="80520781"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 01:23:44 -0700
X-CSE-ConnectionGUID: LME6CuxXS5edZ1rKWstQcQ==
X-CSE-MsgGUID: /FxOqEWLRMyD3NLRs6ltnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; 
 d="scan'208,217";a="266089873"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 mwiniars-MOBL.ger.corp.intel.com) ([10.245.246.37])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 01:23:43 -0700
Message-ID: <7e1205c9d969f5266c07162dd588f24b442158d1.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 tests/intel/gem_softpin: Show debug info also on success
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 28 May 2026 10:23:40 +0200
In-Reply-To: <177993477148.18056.14356319126940088709@6beec6c84f66>
References: <20260527120430.3323133-2-janusz.krzysztofik@linux.intel.com>
 <177993477148.18056.14356319126940088709@6beec6c84f66>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-/no0bDZ+EC9OjgZiREeq"
User-Agent: Evolution 3.58.3 
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

--=-/no0bDZ+EC9OjgZiREeq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org

On Thu, 2026-05-28 at 02:19 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/intel/gem_softpin: Show debug info also on success
>=20
> URL:https://patchwork.freedesktop.org/series/167375/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15255/index.html
> CI Bug Log - changes from IGT_8939_full -> IGTPW_15255_fullSummaryFAILURE
> Serious unknown changes coming with IGTPW_15255_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15255_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_15255/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_15255_full:
> IGT changesPossible regressions * igt@kms_ccs@crc-primary-suspend-y-tiled=
-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
>     - shard-tglu:         PASS [2] -> INCOMPLETE [1]

The change only touched igt@gem_softpin@safe-alignment, nothing more, then
the above failure is not related. =C2=A0Please update CBL filters and re-re=
port.

Thanks,
Janusz

> New testsNew tests have been introduced between IGT_8939_full and
> IGTPW_15255_full:
...

[1] INCOMPLETE
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15255/shard-tglu-2/igt@k=
ms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html
[2] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8939/shard-tglu-7/igt@kms_=
ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

--=-/no0bDZ+EC9OjgZiREeq
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
<body><div>Hi&nbsp;<a href=3D"mailto:I915-ci-infra@lists.freedesktop.org">I=
915-ci-infra@lists.freedesktop.org</a></div><div><br></div><div>On Thu, 202=
6-05-28 at 02:19 +0000, Patchwork wrote:</div><blockquote type=3D"cite" sty=
le=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><d=
iv><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel/gem_softpin: Show debug i=
nfo also on success</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/167375/">https://patchwork.freedesktop.org/series/167375/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15255/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15255/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from IGT_8939_full =
-&gt; IGTPW_15255_full</h1><h2>Summary</h2><p><strong>FAILURE</strong></p><=
p>Serious unknown changes coming with IGTPW_15255_full absolutely need to b=
e<br> verified manually.</p><p>If you think the reported changes have nothi=
ng to do with the changes<br> introduced in IGTPW_15255_full, please notify=
 your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> to d=
ocument this new failure mode, which will reduce false positives in CI.</p>=
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15255/index=
.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in partici=
pating hosts</p><h2>Possible new issues</h2><p>Here are the unknown changes=
 that may have been introduced in IGTPW_15255_full:</p><h3>IGT changes</h3>=
<h4>Possible regressions</h4><ul>
<li>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1=
:</li><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8939/shard-tglu-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs=
-cc@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/drm-tip/IGTPW_15255/shard-tglu-2/igt@kms_ccs@crc-primary-suspend-=
y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">INCOMPLETE</a></li>
</ul>
</ul></blockquote><div><br></div><div>The change only touched <a href=3D"ma=
ilto:igt@gem">igt@gem</a><a href=3D"mailto:_softpin@safe-alignment">_softpi=
n@safe-alignment</a>, nothing more, then the above failure is not related. =
&nbsp;Please update CBL filters and re-report.</div><div><br></div><div>Tha=
nks,<br>Janusz</div><div><br></div><blockquote type=3D"cite" style=3D"margi=
n:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><h2>New tests=
</h2><p>New tests have been introduced between IGT_8939_full and IGTPW_1525=
5_full:</p></blockquote><div>...</div><div><span></span></div></body></html=
>

--=-/no0bDZ+EC9OjgZiREeq--
