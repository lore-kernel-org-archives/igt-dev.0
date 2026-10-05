Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A99CA5FCE
	for <igt-dev@archiver.kernel.org>; Mon,  5 Oct 2026 08:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A7910E139;
	Mon,  5 Oct 2026 08:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d+v9wNS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF2A510EC1E;
 Mon,  5 Oct 2026 08:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791188010; x=1822724010;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version;
 bh=Cc4oHLy/vFmkh/zqyOY4/uRcB1sBBq7KDAY4nRjSVjg=;
 b=d+v9wNS4zfJtS7O7i6Qu/XCSkclJWpDHpZDi7fiqXul+7QGwP0VSXtgt
 46MWNX9BOc+ByHFwG9DygHG1/ZLEFWDY6hsLrGTj6zHJLUB5oAAaDC0TM
 fWZnlRWlz6hoVZvWVXOLcs5Yd1BcUP6MK/rowcL52qjbUgc8VBqhg+1bd
 47yJzpAcyn1+QnImjH7XaBQ/K+Twf/Y+rFneUCoXFN+oq/KnKzh2P/k48
 bKAO/wwZBUuZPXyKpmiLQR0F0+VScT1OXFSfSnBneGQXlrmVSATbL4ERN
 vn05S8/ircrPf8VL+nUx4JIhmdLUNaRgGtrX5uGqZ+66UI7Gm1O/Fcfye A==;
X-CSE-ConnectionGUID: 7izw7OzqSf6Tk4GOYXLH0Q==
X-CSE-MsgGUID: 3FCJtrF3S620EG891Csn8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90801933"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; d="scan'208,217";a="90801933"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:13:30 -0700
X-CSE-ConnectionGUID: tqdW4cPqS6+sL60Pux4u/w==
X-CSE-MsgGUID: 1DJaAxPeT8aKPhFz45QM4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
 d="scan'208,217";a="275388277"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.ger.corp.intel.com) ([10.245.246.73])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2026 01:13:28 -0700
Message-ID: <b686f1e04539972035a956484ba2d1c64c826ffd.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.Full: failure for tests/intel:
 Don't probe intel_allocator offsets without full-ppgtt (rev2)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 05 Oct 2026 10:13:25 +0200
In-Reply-To: <179098253053.235005.17621157884243839447@61270ab9df2a>
References: <20260924152443.829382-4-janusz.krzysztofik@linux.intel.com>
 <179098253053.235005.17621157884243839447@61270ab9df2a>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-Mk2b8YsWg4kzqRBiNJKy"
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

--=-Mk2b8YsWg4kzqRBiNJKy
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Fri, 2026-10-02 at 23:08 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/intel: Don't probe intel_allocator offsets without full-
> ppgtt (rev2)
>=20
> URL:https://patchwork.freedesktop.org/series/174930/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/index.html
> CI Bug Log - changes from CI_DRM_19262_full -> IGTPW_15931_fullSummaryFAI=
LURE
> Serious unknown changes coming with IGTPW_15931_full absolutely need to
> be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15931_full, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_15931/index.html
> Participating hosts (10 -> 10)No changes in participating hosts
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_15931_full:
> IGT changesPossible regressions *=20
>    igt@i915_selftest@live:shard-tglu: PASS [4] -> DMESG-FAIL [3]shard-mtl=
p:
>    PASS [6] -> DMESG-FAIL [5]
>  *=20
>    igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:
>     - shard-mtlp:         PASS [2] -> ABORT [1] +1 other test abort

My series tested under this pre-merge run introduces changes to two tests:
gem_softpin and gem_close_races. =C2=A0None of them has been reported as
failing, and the above failures are not related. =C2=A0Please update CBL fi=
lters
and re-report.

Thanks,
Janusz

> Known issues
...

[1] ABORT
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/shard-mtlp-2/igt@k=
ms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
[2] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19262/shard-mtlp-2/igt@=
kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1.html
[3] DMESG-FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/shard-tglu-10/igt@=
i915_selftest@live.html
[4] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19262/shard-tglu-9/igt@=
i915_selftest@live.html
[5] DMESG-FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/shard-mtlp-2/igt@i=
915_selftest@live.html
[6] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19262/shard-mtlp-5/igt@=
i915_selftest@live.html

--=-Mk2b8YsWg4kzqRBiNJKy
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
><div>On Fri, 2026-10-02 at 23:08 +0000, Patchwork wrote:</div><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel: Don't probe intel_alloca=
tor offsets without full-ppgtt (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/174930/">https://patchwork.freedesktop.org/series/174930/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from CI_DRM_19262_f=
ull -&gt; IGTPW_15931_full</h1><h2>Summary</h2><p><strong>FAILURE</strong><=
/p><p>Serious unknown changes coming with IGTPW_15931_full absolutely need =
to be<br> verified manually.</p><p>If you think the reported changes have n=
othing to do with the changes<br> introduced in IGTPW_15931_full, please no=
tify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br> =
to document this new failure mode, which will reduce false positives in CI.=
</p><p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/i=
ndex.html</p><h2>Participating hosts (10 -&gt; 10)</h2><p>No changes in par=
ticipating hosts</p><h2>Possible new issues</h2><p>Here are the unknown cha=
nges that may have been introduced in IGTPW_15931_full:</p><h3>IGT changes<=
/h3><h4>Possible regressions</h4><ul>
<li>
<p>igt@i915_selftest@live:</p><ul>
<li>shard-tglu:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19262/shard-tglu-9/igt@i915_selftest@live.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/shard-tglu-10/i=
gt@i915_selftest@live.html">DMESG-FAIL</a></li>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19262/shard-mtlp-5/igt@i915_selftest@live.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15931/shard-mtlp-2/ig=
t@i915_selftest@live.html">DMESG-FAIL</a></li>
</ul></li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-edp-1:</p></li><ul>
<li>shard-mtlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/CI_DRM_19262/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-resume@pi=
pe-d-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/drm-tip/IGTPW_15931/shard-mtlp-2/igt@kms_async_flips@async-flip-suspend-re=
sume@pipe-d-edp-1.html">ABORT</a> +1 other test abort</li>
</ul>
</ul></blockquote><div><br></div><div>My series tested under this pre-merge=
 run introduces changes to two tests:<br>gem_softpin and gem_close_races. &=
nbsp;None of them has been reported as<br>failing, and the above failures a=
re not related. &nbsp;Please update CBL filters<br>and re-report.</div><div=
><br></div><div>Thanks,<br>Janusz</div><div><br></div><blockquote type=3D"c=
ite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left=
:1ex"><h2>Known issues</h2></blockquote><div>...</div><div><span></span></d=
iv></body></html>

--=-Mk2b8YsWg4kzqRBiNJKy--
