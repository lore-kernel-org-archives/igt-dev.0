Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2482C44532
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 13:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1910E349;
	Tue, 21 Jul 2026 13:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n6Wcw6xk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A5610E349;
 Tue, 21 Jul 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784640407; x=1816176407;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=HgNYyfudiHJ3akvUV4hdi0iAjdUULWgcaB+0htfNA4o=;
 b=n6Wcw6xk4GZUJbHEASow9oUL8urJn4ljusdPc0rzXFS/ES99qYd2Q5Ix
 i0VP0HEU/4fwNP0k6wbFwgXkGzVNZpHA7JIZpiE84ueEQ9RLSZYx/2YYP
 +MQQJ+CCuswS4GH5BY/96MWql0uc06rpI5j+ZhuGOY2gcS/KiXFQZZgJW
 pFlKSMdZDpeMAjx6m4vDMl8RjveNg+GJDFSZI3eBJsP5Y+n5pPXuBpZ/+
 J2sBZ3Wkm354CFm0UATE31vhEzLlRtSE6OO+KrSKPtTE7/9adv/jEtmwc
 Nt7k6pV3tAM5kfbOyDthl1xJIasyUA6XGdXK4FqJaC+Gr2cSdHezHYBdP A==;
X-CSE-ConnectionGUID: gx9g8yyyRliFN9Dq8ZyLfA==
X-CSE-MsgGUID: wF343GpZTQaSSPmwm16ufg==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="102790139"
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
 d="scan'208,217";a="102790139"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:26:47 -0700
X-CSE-ConnectionGUID: WVl4XF3VRCGNXQERNnHEKw==
X-CSE-MsgGUID: ZTqGUVfoTVut3zi0/r+vPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,176,1779174000"; 
 d="scan'208,217";a="253856091"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.122])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2026 06:26:46 -0700
Message-ID: <2ce82e7a69e467354292aaf38b2d944697199d85.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for lib/igt_store:
 Fix unexpected reuse of allocated offset
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Tue, 21 Jul 2026 15:26:42 +0200
In-Reply-To: <178463671256.210834.11363806943046060917@6beec6c84f66>
References: <20260720055919.1945692-2-janusz.krzysztofik@linux.intel.com>
 <178463671256.210834.11363806943046060917@6beec6c84f66>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-BThNUKi1j/58wiph5KVN"
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

--=-BThNUKi1j/58wiph5KVN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Tue, 2026-07-21 at 12:25 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:lib/igt_store: Fix unexpected reuse of allocated offset
>=20
> URL:https://patchwork.freedesktop.org/series/170694/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/index.html
> CI Bug Log - changes from IGT_9015_full -> IGTPW_15561_fullSummaryFAILURE
> Serious unknown changes coming with IGTPW_15561_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15561_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_15561/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_15561_full:
> IGT changesPossible regressions *=20
>    igt@gem_linear_blits@basic:shard-mtlp: PASS [4] -> SKIP [3]
>  *=20
>    igt@kms_big_fb@4-tiled-64bpp-rotate-0:
>     - shard-mtlp:         PASS [2] -> INCOMPLETE [1]

Since none of the above two tests depends on igt_store_word() function=C2=
=A0
modified by the patch under test, those failures are not related. =C2=A0Ple=
ase=C2=A0
update CBL filters and re-report.

Thanks,
Janusz

> New tests
...


[1] INCOMPLETE
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/shard-mtlp-7/igt@k=
ms_big_fb@4-tiled-64bpp-rotate-0.html
[2] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9015/shard-mtlp-4/igt@kms_=
big_fb@4-tiled-64bpp-rotate-0.html
[3] SKIP
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/shard-mtlp-7/igt@g=
em_linear_blits@basic.html
[4] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_9015/shard-mtlp-8/igt@gem_=
linear_blits@basic.html

--=-BThNUKi1j/58wiph5KVN
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
915-ci-infra@lists.freedesktop.org</a>,</div><div><br></div><div>On Tue, 20=
26-07-21 at 12:25 +0000, Patchwork wrote:</div><blockquote type=3D"cite" st=
yle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><=
div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>lib/igt_store: Fix unexpected reuse o=
f allocated offset</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/170694/">https://patchwork.freedesktop.org/series/170694/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from IGT_9015_full =
-&gt; IGTPW_15561_full</h1><h2>Summary</h2><p><strong>FAILURE</strong></p><=
p>Serious unknown changes coming with IGTPW_15561_full absolutely need to b=
e<br> verified manually.</p><p>If you think the reported changes have nothi=
ng to do with the changes<br> introduced in IGTPW_15561_full, please notify=
 your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> to d=
ocument this new failure mode, which will reduce false positives in CI.</p>=
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/index=
.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in partici=
pating hosts</p><h2>Possible new issues</h2><p>Here are the unknown changes=
 that may have been introduced in IGTPW_15561_full:</p><h3>IGT changes</h3>=
<h4>Possible regressions</h4><ul>
<li>
<p>igt@gem_linear_blits@basic:</p><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9015/shard-mtlp-8/igt@gem_linear_blits@basic.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/shard-mtlp-7/ig=
t@gem_linear_blits@basic.html">SKIP</a></li>
</ul></li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p></li><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_9015/shard-mtlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15561/shar=
d-mtlp-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">INCOMPLETE</a></li>
</ul>
</ul></blockquote><div><br></div><div>Since none of the above two tests dep=
ends on igt_store_word() function&nbsp;</div><div>modified by the patch und=
er test, those failures are not related. &nbsp;Please&nbsp;</div><div>updat=
e CBL filters and re-report.</div><div><br></div><div>Thanks,<br>Janusz</di=
v><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; bord=
er-left:2px #729fcf solid;padding-left:1ex"><h2>New tests</h2></blockquote>=
<div>...</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"></blockquote><div><br></div><div><=
span></span></div></body></html>

--=-BThNUKi1j/58wiph5KVN--
