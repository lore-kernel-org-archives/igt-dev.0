Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E69C5DF7D
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 08:38:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7A910EC7E;
	Fri, 21 Aug 2026 08:38:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TxyzKmWA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591D310E965;
 Fri, 21 Aug 2026 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787301468; x=1818837468;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=Jk3dYOKBBm2ccuUoqwG8oNEVIRYLv4hmXL2r96/yWaw=;
 b=TxyzKmWAj1txQgoNPm+r489QKInr1gCcq+38MvDIS9qkjhfKhDjGe/0r
 eJll/gh/bxcDIGVO58wzeqzJ9fu27fSmOs2LRJLHTsAuHHCflW7GdfVCX
 P7wZaRKbWPbZAywoR8lcaVx5lJBPNWJQZ4XatdZXEBXrmQWCLh/zinilo
 SxDBbkl9tR7qt1AFlsyLeVjwG29d39Mj174SWzeEwJeiwWeQO6pcK0t2B
 Jy7q7U59nkhUHmDr5+o/I8BWg9YioXG/k6OpoR9vpSLv1/WYYShUjoO0A
 DwkWq9zi6vPMToIuq3EZwC/OeYzPTQjsljPC0DSoobFoa8vemN8gWl3WX Q==;
X-CSE-ConnectionGUID: Ld651nlOQ16JlxkH5pi8LA==
X-CSE-MsgGUID: jb25aWUdTrO+SEc5cHJU4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98441607"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; d="scan'208,217";a="98441607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:37:47 -0700
X-CSE-ConnectionGUID: RUDD9ktTRNKzjmLdnbMbjQ==
X-CSE-MsgGUID: kGUuLkUGQOypw/DWTEghvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
 d="scan'208,217";a="264995147"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.165])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 01:37:47 -0700
Message-ID: <9bc6e193280f66b4f34e701ae4b9511a1f38d44a.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for
 tests/intel/i915_module_load: Ignore missing PCI reset
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 21 Aug 2026 10:37:43 +0200
In-Reply-To: <178727652239.72177.12635209613133945054@61270ab9df2a>
References: <20260820184304.1968012-2-janusz.krzysztofik@linux.intel.com>
 <178727652239.72177.12635209613133945054@61270ab9df2a>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-kjX0ghQH4BogaSmEH/F7"
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

--=-kjX0ghQH4BogaSmEH/F7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Fri, 2026-08-21 at 01:42 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/intel/i915_module_load: Ignore missing PCI reset
>=20
> URL:https://patchwork.freedesktop.org/series/172541/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/index.html
> CI Bug Log - changes from CI_DRM_19025_full -> IGTPW_15714_fullSummaryFAI=
LURE
> Serious unknown changes coming with IGTPW_15714_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15714_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_15714/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_15714_full:
> IGT changesPossible regressions *=20
>    igt@kms_cursor_edge_walk@256x256-top-edge:shard-rkl: NOTRUN -> ABORT [=
4]
>    +1 other test abort
>  *=20
>    igt@kms_plane@plane-position-covered:shard-tglu: NOTRUN -> ABORT [3] +=
1
>    other test abort
>  *=20
>    igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
>     - shard-snb:          PASS [2] -> DMESG-WARN [1]

The change under this pre-merge testing only
touches=C2=A0igt@i915_module_load@fault-injection=C2=A0subtest, nothing mor=
e. =C2=A0The
above failures are not related. =C2=A0Please update CBL filters and re-repo=
rt.

Thanks,
Janusz

> Known issues
...

[1] DMESG-WARN
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/shard-snb4/igt@kms=
_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
[2] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19025/shard-snb1/igt@km=
s_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
[3] ABORT
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/shard-tglu-2/igt@k=
ms_plane@plane-position-covered.html
[4] ABORT
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/shard-rkl-5/igt@km=
s_cursor_edge_walk@256x256-top-edge.html

--=-kjX0ghQH4BogaSmEH/F7
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
><div>On Fri, 2026-08-21 at 01:42 +0000, Patchwork wrote:</div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel/i915_module_load: Ignore =
missing PCI reset</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/172541/">https://patchwork.freedesktop.org/series/172541/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from CI_DRM_19025_f=
ull -&gt; IGTPW_15714_full</h1><h2>Summary</h2><p><strong>FAILURE</strong><=
/p><p>Serious unknown changes coming with IGTPW_15714_full absolutely need =
to be<br> verified manually.</p><p>If you think the reported changes have n=
othing to do with the changes<br> introduced in IGTPW_15714_full, please no=
tify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> =
to document this new failure mode, which will reduce false positives in CI.=
</p><p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15714/i=
ndex.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in par=
ticipating hosts</p><h2>Possible new issues</h2><p>Here are the unknown cha=
nges that may have been introduced in IGTPW_15714_full:</p><h3>IGT changes<=
/h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge:</p><ul>
<li>shard-rkl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15714/shard-rkl-5/igt@kms_cursor_edge_walk@256x256-top-=
edge.html">ABORT</a> +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_plane@plane-position-covered:</p><ul>
<li>shard-tglu:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_15714/shard-tglu-2/igt@kms_plane@plane-position-covered=
.html">ABORT</a> +1 other test abort</li>
</ul></li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p></li><ul>
<li>shard-snb:          <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19025/shard-snb1/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi=
-a-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-t=
ip/IGTPW_15714/shard-snb4/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdm=
i-a-1.html">DMESG-WARN</a></li>
</ul>
</ul></blockquote><div><br></div><div>The change under this pre-merge testi=
ng only touches&nbsp;<a href=3D"mailto:igt@i915">igt@i915</a><a href=3D"mai=
lto:_module_load@fault-injection">_module_load@fault-injection</a>&nbsp;sub=
test, nothing more. &nbsp;The above failures are not related. &nbsp;Please =
update CBL filters and re-report.</div><div><br></div><div>Thanks,<br>Janus=
z</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;=
 border-left:2px #729fcf solid;padding-left:1ex"><h2>Known issues</h2></blo=
ckquote><div>...</div><div><span></span></div></body></html>

--=-kjX0ghQH4BogaSmEH/F7--
