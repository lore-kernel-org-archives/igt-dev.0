Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E288107BCE8
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 21:23:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF010EB8B;
	Fri, 13 Mar 2026 21:23:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172010EB8B;
 Fri, 13 Mar 2026 21:23:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1912498199403250468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_tests/kms=5Fbw=3A_Skip_tes?=
 =?utf-8?q?ts_when_outputs_don=27t_support_the_mode_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jason-JH Lin" <jason-jh.lin@mediatek.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 13 Mar 2026 21:23:33 -0000
Message-ID: <177343701344.357999.5110075948017506369@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260312141709.2334871-1-jason-jh.lin@mediatek.com>
In-Reply-To: <20260312141709.2334871-1-jason-jh.lin@mediatek.com>
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
Reply-To: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

--===============1912498199403250468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_bw: Skip tests when outputs don't support the mode (rev2)
URL   : https://patchwork.freedesktop.org/series/162150/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_8799_FULL -> XEIGTPW_14749_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_14749_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_14749_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_14749_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-lnl:          [PASS][1] -> [SKIP][2] +7 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_14749_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#1407])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#373])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#4354] / [Intel XE#5882])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#656])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@xe_eudebug_online@set-breakpoint-sigint-debugger:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#4837] / [Intel XE#6665])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7599])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-6/igt@xe_prefetch_fault@prefetch-fault.html

  
#### Possible fixes ####

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][10] ([Intel XE#7340]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html

  
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599


Build changes
-------------

  * IGT: IGT_8799 -> IGTPW_14749

  IGTPW_14749: 14749
  IGT_8799: 8799
  xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a: 3ccc0e3404591e404d0dee79406cd013f377356a

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/index.html

--===============1912498199403250468==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>tests/kms_bw: Skip tests when outputs don&#x27;t support the mode (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162150/">https://patchwork.freedesktop.org/series/162150/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8799_FULL -&gt; XEIGTPW_14749_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_14749_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_14749_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_14749_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/shard-lnl-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-4/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_14749_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-7/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-4/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-sigint-debugger:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-5/igt@xe_eudebug_online@set-breakpoint-sigint-debugger.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-6/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pm_dc@dc6-dpms:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8799/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14749/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8799 -&gt; IGTPW_14749</li>
</ul>
<p>IGTPW_14749: 14749<br />
  IGT_8799: 8799<br />
  xe-4707-3ccc0e3404591e404d0dee79406cd013f377356a: 3ccc0e3404591e404d0dee79406cd013f377356a</p>

</body>
</html>

--===============1912498199403250468==--
