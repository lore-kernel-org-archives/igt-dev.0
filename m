Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36C2FD7070
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 10:19:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6696F10E4DC;
	Tue, 17 Mar 2026 10:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hGLFxLmD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB3D10E5D4;
 Tue, 17 Mar 2026 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773742779; x=1805278779;
 h=message-id:subject:from:to:cc:in-reply-to:references:
 mime-version:date;
 bh=CU8JJpVNV3pH1Q+1ISm2sfmCAC8X/Acd2uLZd/ac2Vg=;
 b=hGLFxLmDpt1aHDLkp2hjyrHRtA7FWd8a/pW92TbevFmy0Jl7ToJWaWnP
 RtZX3WBf7nw20SjGIKoY30ggJFCRnvzETGgFxKzBURYNS74rYWS6c5m/3
 9IsuqtbA4GlKHk1gLMuMPNuqQvyBw52s6ZSTqRdlbJ6mY2SheRLLG+QYB
 mYpU4ohmqsSZ9Qw3BsMP98Ep3BoG7FQXyEWUoIrxH2ujV9s9zIWZX3Oto
 zKBWULjfqJ4h9k5yfjJl6S1VN+F5I8+fFic4PzC6c0Ix6kBUJgYvpXAlh
 XaUkJUYET2PgqK3y5r/5EtdsPRlFWDscAxC0T+3SUHMZFUt2JVe0ocvR+ w==;
X-CSE-ConnectionGUID: j928P9mhRE+3jKWzgH6GwA==
X-CSE-MsgGUID: DQz3LKUBT/y5gGFcLeXGhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="62337734"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208,217";a="62337734"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:19:38 -0700
X-CSE-ConnectionGUID: 9KqnPpAcR5aRrVffeKs7xg==
X-CSE-MsgGUID: C5WjkFwgQA6jJRaO5Sw3vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
 d="scan'208,217";a="226349157"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.40])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2026 03:19:37 -0700
Message-ID: <1324d0146226c25d529477c582637ce2e2b1d055.camel@linux.intel.com>
Subject: Re: =?UTF-8?Q?=E2=9C=97?= i915.CI.BAT: failure for
 tests/intel/gem_lmem_swapping: Expect gem leak helper crashes (rev2)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: I915-ci-infra@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
In-Reply-To: <177335561676.353004.16806170080703979382@a3b018990fe9>
References: <20260312181032.20485-5-janusz.krzysztofik@linux.intel.com>
 <177335561676.353004.16806170080703979382@a3b018990fe9>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Type: multipart/alternative; boundary="=-UlC9yjZWRU/FieA5GOLf"
MIME-Version: 1.0
Date: Tue, 17 Mar 2026 11:06:55 +0100
User-Agent: Evolution 3.58.3 
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

--=-UlC9yjZWRU/FieA5GOLf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0I915-ci-infra@lists.freedesktop.org,

On Thu, 2026-03-12 at 22:46 +0000, Patchwork wrote:
> Patch Details
>=20
> Series:tests/intel/gem_lmem_swapping: Expect gem leak helper crashes
> (rev2)
>=20
> URL:https://patchwork.freedesktop.org/series/162418/
>=20
> State:failure
> Details:https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.html
> CI Bug Log - changes from IGT_8799 -> IGTPW_14752SummaryFAILURE
> Serious unknown changes coming with IGTPW_14752 absolutely need to be
> verified manually.
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_14752, please notify your bug team (I915-ci-
> infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in
> CI.
> External URL: https://intel-gfx-ci.01.org/tree/drm-
> tip/IGTPW_14752/index.html
> Participating hosts (40 -> 39)Additional (1): bat-arls-5=20
> Missing (2): bat-dg2-13 fi-snb-2520m=20
> Possible new issuesHere are the unknown changes that may have been introd=
uced in
> IGTPW_14752:
> IGT changesPossible regressions * igt@i915_module_load@load:
>     - fi-skl-6600u:       PASS [57] -> TIMEOUT [56]

Not the test modified by this change, not a discrete platform -- not
related.=C2=A0
Please update filters and re-report.

Thanks,
Janusz

> Known issuesHere are the changes found in IGTPW_14752 that come from know=
n issues:
> IGT changesIssues hit *=20
>    igt@gem_lmem_swapping@basic:bat-arls-5: NOTRUN -> SKIP [55] (i915#1021=
3
>    [54] / i915#11671 [53]) +3 other tests skip
>  *=20
>    igt@gem_mmap@basic:bat-arls-5: NOTRUN -> SKIP [52] (i915#4083 [51])
>  *=20
>    igt@gem_render_tiled_blits@basic:bat-arls-5: NOTRUN -> SKIP [50]
>    (i915#10197 [49] / i915#10211 [48] / i915#4079 [47])
>  *=20
>    igt@gem_tiled_blits@basic:bat-arls-5: NOTRUN -> SKIP [46] (i915#12637
>    [15] / i915#4077 [14]) +2 other tests skip
>  *=20
>    igt@gem_tiled_pread_basic@basic:bat-arls-5: NOTRUN -> SKIP [45]
>    (i915#15657 [44])
>  *=20
>    igt@i915_module_load@load:fi-bsw-n3050: PASS [43] -> DMESG-WARN [42]
>    (i915#15498 [41])
>  *=20
>    igt@i915_pm_rps@basic-api:bat-arls-5: NOTRUN -> SKIP [40] (i915#10209
>    [39] / i915#11681 [38])
>  *=20
>    igt@intel_hwmon@hwmon-read:bat-arls-5: NOTRUN -> SKIP [37] (i915#7707
>    [36]) +1 other test skip
>  *=20
>    igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:bat-arls-5: NOTRUN ->
>    SKIP [35] (i915#10200 [32] / i915#12203 [34])
>  *=20
>    igt@kms_addfb_basic@clobberred-modifier:bat-arls-5: NOTRUN -> SKIP [33=
]
>    (i915#10200 [32]) +8 other tests skip
>  *=20
>    igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:bat-arls-5:
>    NOTRUN -> SKIP [31] (i915#10202 [30]) +1 other test skip
>  *=20
>    igt@kms_dsc@dsc-basic:bat-arls-5: NOTRUN -> SKIP [29] (i915#9886 [28])
>  *=20
>    igt@kms_force_connector_basic@force-load-detect:bat-arls-5: NOTRUN ->
>    SKIP [27] (i915#10207 [26])
>  *=20
>    igt@kms_pm_backlight@basic-brightness:bat-arls-5: NOTRUN -> SKIP [25]
>    (i915#9812 [24])
>  *=20
>    igt@kms_psr@psr-primary-page-flip:bat-arls-5: NOTRUN -> SKIP [23]
>    (i915#9732 [22]) +3 other tests skip
>  *=20
>    igt@kms_setmode@basic-clone-single-crtc:bat-arls-5: NOTRUN -> SKIP [21=
]
>    (i915#10208 [20] / i915#8809 [19])
>  *=20
>    igt@prime_vgem@basic-fence-read:bat-arls-5: NOTRUN -> SKIP [18]
>    (i915#10212 [17] / i915#3708 [9])
>  *=20
>    igt@prime_vgem@basic-gtt:bat-arls-5: NOTRUN -> SKIP [16] (i915#12637
>    [15] / i915#3708 [9] / i915#4077 [14]) +1 other test skip
>  *=20
>    igt@prime_vgem@basic-read:bat-arls-5: NOTRUN -> SKIP [13] (i915#10214
>    [12] / i915#3708 [9])
>  *=20
>    igt@prime_vgem@basic-write:bat-arls-5: NOTRUN -> SKIP [11] (i915#10216
>    [10] / i915#3708 [9])
> Possible fixes *=20
>    igt@i915_selftest@live:bat-mtlp-8: DMESG-FAIL [8] (i915#12061 [1]) ->
>    PASS [7] +1 other test pass
>  *=20
>    igt@i915_selftest@live@requests:bat-atsm-1: INCOMPLETE [6] (i915#14564
>    [3]) -> PASS [5]
> Warnings * igt@i915_selftest@live:bat-atsm-1:         INCOMPLETE [4] (i91=
5#12061 [1]/i915#1
>    4564 [3]) -> DMESG-FAIL [2] (i915#12061 [1])
> Build changes * CI: CI-20190529 -> None
>  * IGT: IGT_8799 -> IGTPW_14752
>  * Linux: CI_DRM_18137 -> CI_DRM_18139
> CI-20190529: 20190529
> CI_DRM_18137: 3ccc0e3404591e404d0dee79406cd013f377356a @
> git://anongit.freedesktop.org/gfx-ci/linux
> CI_DRM_18139: 3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d @
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_14752: 14752
> IGT_8799: 8799


[1] i915#12061
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
[2] DMESG-FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-atsm-1/igt@i91=
5_selftest@live.html
[3] i915#14564
    https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564
[4] INCOMPLETE
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8799/bat-atsm-1/igt@i915_s=
elftest@live.html
[5] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-atsm-1/igt@i91=
5_selftest@live@requests.html
[6] INCOMPLETE
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8799/bat-atsm-1/igt@i915_s=
elftest@live@requests.html
[7] PASS
    https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-mtlp-8/igt@i91=
5_selftest@live.html
[8] DMESG-FAIL
    https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8799/bat-mtlp-8/igt@i915_s=
elftest@live.html
[9] i915#3708 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3708
[10] i915#10216
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10216
[11] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@pr=
ime_vgem@basic-write.html
[12] i915#10214
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10214
[13] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@pr=
ime_vgem@basic-read.html
[14] i915#4077 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4077
[15] i915#12637
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637
[16] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@pr=
ime_vgem@basic-gtt.html
[17] i915#10212
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10212
[18] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@pr=
ime_vgem@basic-fence-read.html
[19] i915#8809 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8809
[20] i915#10208
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10208
[21] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_setmode@basic-clone-single-crtc.html
[22] i915#9732 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9732
[23] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_psr@psr-primary-page-flip.html
[24] i915#9812 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9812
[25] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_pm_backlight@basic-brightness.html
[26] i915#10207
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10207
[27] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_force_connector_basic@force-load-detect.html
[28] i915#9886 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886
[29] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_dsc@dsc-basic.html
[30] i915#10202
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10202
[31] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
[32] i915#10200
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10200
[33] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_addfb_basic@clobberred-modifier.html
[34] i915#12203
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12203
[35] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@km=
s_addfb_basic@addfb25-y-tiled-small-legacy.html
[36] i915#7707 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/7707
[37] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@in=
tel_hwmon@hwmon-read.html
[38] i915#11681
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11681
[39] i915#10209
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10209
[40] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@i9=
15_pm_rps@basic-api.html
[41] i915#15498
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15498
[42] DMESG-WARN
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/fi-bsw-n3050/igt@=
i915_module_load@load.html
[43] PASS
     https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8799/fi-bsw-n3050/igt@i91=
5_module_load@load.html
[44] i915#15657
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15657
[45] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@ge=
m_tiled_pread_basic@basic.html
[46] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@ge=
m_tiled_blits@basic.html
[47] i915#4079 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4079
[48] i915#10211
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10211
[49] i915#10197
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10197
[50] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@ge=
m_render_tiled_blits@basic.html
[51] i915#4083 https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083
[52] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@ge=
m_mmap@basic.html
[53] i915#11671
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11671
[54] i915#10213
     https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10213
[55] SKIP
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@ge=
m_lmem_swapping@basic.html
[56] TIMEOUT
     https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/fi-skl-6600u/igt@=
i915_module_load@load.html
[57] PASS
     https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8799/fi-skl-6600u/igt@i91=
5_module_load@load.html

--=-UlC9yjZWRU/FieA5GOLf
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
<body style=3D"overflow-wrap: break-word; -webkit-nbsp-mode: space; line-br=
eak: after-white-space;"><div>Hi&nbsp;<a href=3D"mailto:I915-ci-infra@lists=
.freedesktop.org">I915-ci-infra@lists.freedesktop.org,</a></div><div><br></=
div><div>On Thu, 2026-03-12 at 22:46 +0000, Patchwork wrote:</div><blockquo=
te type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;=
padding-left:1ex"><div><b>Patch Details</b></div>
<div><table>
<tbody><tr><td><b>Series:</b></td><td>tests/intel/gem_lmem_swapping: Expect=
 gem leak helper crashes (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162418/">https://patchwork.freedesktop.org/series/162418/</a></td></tr=
>
<tr><td><b>State:</b></td><td>failure</td></tr> <tr><td><b>Details:</b></td=
><td><a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.=
html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.html</a></=
td></tr></tbody></table> </div><h1>CI Bug Log - changes from IGT_8799 -&gt;=
 IGTPW_14752</h1><h2>Summary</h2><p><strong>FAILURE</strong></p><p>Serious =
unknown changes coming with IGTPW_14752 absolutely need to be<br> verified =
manually.</p><p>If you think the reported changes have nothing to do with t=
he changes<br> introduced in IGTPW_14752, please notify your bug team (I915=
-ci-infra@lists.freedesktop.org) to allow them<br> to document this new fai=
lure mode, which will reduce false positives in CI.</p><p>External URL: htt=
ps://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/index.html</p><h2>Partici=
pating hosts (40 -&gt; 39)</h2><p>Additional (1): bat-arls-5 <br> Missing (=
2): bat-dg2-13 fi-snb-2520m </p><h2>Possible new issues</h2><p>Here are the=
 unknown changes that may have been introduced in IGTPW_14752:</p><h3>IGT c=
hanges</h3><h4>Possible regressions</h4><ul>
<li>igt@i915_module_load@load:</li><ul>
<li>fi-skl-6600u:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8799/fi-skl-6600u/igt@i915_module_load@load.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/fi-skl-6600u/igt=
@i915_module_load@load.html">TIMEOUT</a></li>
</ul>
</ul></blockquote><div><br></div><div>Not the test modified by this change,=
 not a discrete platform -- not related.&nbsp;</div><div>Please update filt=
ers and re-report.</div><div><br></div><div>Thanks,<br>Janusz</div><div><br=
></div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2p=
x #729fcf solid;padding-left:1ex"><h2>Known issues</h2><p>Here are the chan=
ges found in IGTPW_14752 that come from known issues:</p><h3>IGT changes</h=
3><h4>Issues hit</h4><ul>
<li>
<p>igt@gem_lmem_swapping@basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@gem_lmem_swapping@basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10=
213">i915#10213</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ke=
rnel/-/issues/11671">i915#11671</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_mmap@basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@gem_mmap@basic.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/4083">i915#=
4083</a>)</li>
</ul></li>
<li>
<p>igt@gem_render_tiled_blits@basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@gem_render_tiled_blits@basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/10197">i915#10197</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10211">i915#10211</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/4079">i915#4079</a>)</li>
</ul></li>
<li>
<p>igt@gem_tiled_blits@basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@gem_tiled_blits@basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1263=
7">i915#12637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/4077">i915#4077</a>) +2 other tests skip</li>
</ul></li>
<li>
<p>igt@gem_tiled_pread_basic@basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@gem_tiled_pread_basic@basic.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/15657">i915#15657</a>)</li>
</ul></li>
<li>
<p>igt@i915_module_load@load:</p><ul>
<li>fi-bsw-n3050:       <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8799/fi-bsw-n3050/igt@i915_module_load@load.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14752/fi-bsw-n3050/igt=
@i915_module_load@load.html">DMESG-WARN</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/15498">i915#15498</a>)</li>
</ul></li>
<li>
<p>igt@i915_pm_rps@basic-api:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@i915_pm_rps@basic-api.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1020=
9">i915#10209</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/11681">i915#11681</a>)</li>
</ul></li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@intel_hwmon@hwmon-read.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/770=
7">i915#7707</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_addfb_basic@addfb25-y-tiled-sm=
all-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i9=
15/kernel/-/issues/10200">i915#10200</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/i915/kernel/-/issues/12203">i915#12203</a>)</li>
</ul></li>
<li>
<p>igt@kms_addfb_basic@clobberred-modifier:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_addfb_basic@clobberred-modifie=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10200">i915#10200</a>) +8 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_cursor_legacy@basic-busy-flip-=
before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/i915/kernel/-/issues/10202">i915#10202</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@kms_dsc@dsc-basic:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_dsc@dsc-basic.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9886">i9=
15#9886</a>)</li>
</ul></li>
<li>
<p>igt@kms_force_connector_basic@force-load-detect:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_force_connector_basic@force-lo=
ad-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/10207">i915#10207</a>)</li>
</ul></li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_pm_backlight@basic-brightness.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/9812">i915#9812</a>)</li>
</ul></li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_psr@psr-primary-page-flip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/9732">i915#9732</a>) +3 other tests skip</li>
</ul></li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@kms_setmode@basic-clone-single-crt=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel=
/-/issues/10208">i915#10208</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/i915/kernel/-/issues/8809">i915#8809</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-fence-read:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@prime_vgem@basic-fence-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/10212">i915#10212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-gtt:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@prime_vgem@basic-gtt.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12637=
">i915#12637</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/3708">i915#3708</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/i915/kernel/-/issues/4077">i915#4077</a>) +1 other test skip</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-read:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@prime_vgem@basic-read.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1021=
4">i915#10214</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kern=
el/-/issues/3708">i915#3708</a>)</li>
</ul></li>
<li>
<p>igt@prime_vgem@basic-write:</p><ul>
<li>bat-arls-5:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/drm-tip/IGTPW_14752/bat-arls-5/igt@prime_vgem@basic-write.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/102=
16">i915#10216</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/ker=
nel/-/issues/3708">i915#3708</a>)</li>
</ul></li>
</ul><h4>Possible fixes</h4><ul>
<li>
<p>igt@i915_selftest@live:</p><ul>
<li>bat-mtlp-8:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8799/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#120=
61</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_147=
52/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul></li>
<li>
<p>igt@i915_selftest@live@requests:</p><ul>
<li>bat-atsm-1:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8799/bat-atsm-1/igt@i915_selftest@live@requests.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14564">i=
915#14564</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/IG=
TPW_14752/bat-atsm-1/igt@i915_selftest@live@requests.html">PASS</a></li>
</ul></li>
</ul><h4>Warnings</h4><ul>
<li>igt@i915_selftest@live:<ul>
<li>bat-atsm-1:         <a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip=
/IGT_8799/bat-atsm-1/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#120=
61</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues=
/14564">i915#14564</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/d=
rm-tip/IGTPW_14752/bat-atsm-1/igt@i915_selftest@live.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i=
915#12061</a>)</li>
</ul></li>
</ul><h2>Build changes</h2><ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8799 -&gt; IGTPW_14752</li>
<li>Linux: CI_DRM_18137 -&gt; CI_DRM_18139</li>
</ul><p>CI-20190529: 20190529<br> CI_DRM_18137: 3ccc0e3404591e404d0dee79406=
cd013f377356a @ git://anongit.freedesktop.org/gfx-ci/linux<br> CI_DRM_18139=
: 3fb8dfc6a69ee530c365c36f13bb79ef7f35af1d @ git://anongit.freedesktop.org/=
gfx-ci/linux<br> IGTPW_14752: 14752<br> IGT_8799: 8799</p></blockquote><div=
><br></div><div><span></span></div></body></html>

--=-UlC9yjZWRU/FieA5GOLf--
