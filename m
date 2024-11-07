Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAE1D44D56
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 10:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BF510E222;
	Thu,  7 Nov 2024 10:47:03 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39C210E222;
 Thu,  7 Nov 2024 10:47:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0984410090676133279=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2ExeBAT=3A_success_for_tests/chamelium=3A_Reduce_edid?=
 =?utf-8?q?_count_to_avoid_timeout_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pranay Samala" <pranay.samala@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 07 Nov 2024 10:47:01 -0000
Message-ID: <173097642198.1421567.8606019120486849940@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241107095326.1842621-1-pranay.samala@intel.com>
In-Reply-To: <20241107095326.1842621-1-pranay.samala@intel.com>
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

--===============0984410090676133279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/chamelium: Reduce edid count to avoid timeout (rev6)
URL   : https://patchwork.freedesktop.org/series/140426/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8100_BAT -> XEIGTPW_12059_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in XEIGTPW_12059_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
    - bat-lnl-1:          NOTRUN -> [SKIP][1] ([Intel XE#373])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-pvc-2:          NOTRUN -> [SKIP][2] ([Intel XE#1024])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-pvc-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2252])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-bmg-1:          NOTRUN -> [SKIP][4] ([Intel XE#2252])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-7:         NOTRUN -> [SKIP][5] ([Intel XE#373])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-lnl-2:          NOTRUN -> [SKIP][6] ([Intel XE#373])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-dg2-oem2:       NOTRUN -> [SKIP][7] ([Intel XE#373])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-dg2-oem2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#1024])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-atsm-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
    - bat-adlp-vf:        NOTRUN -> [SKIP][9] ([Intel XE#2463])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-vf/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][10] -> [FAIL][11] ([Intel XE#886]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][12] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][13] ([Intel XE#288]) +32 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#2229])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-bmg-1:          [INCOMPLETE][15] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][16] +1 other test pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-adlp-7:         [INCOMPLETE][17] ([Intel XE#2874]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_8100 -> IGTPW_12059
  * Linux: xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c -> xe-2181-6f358787ded211657532e2ee4df2e446b03d860f

  IGTPW_12059: 12059
  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c: 438ef86a725b59a171dba81fc258bb23a0ff536c
  xe-2181-6f358787ded211657532e2ee4df2e446b03d860f: 6f358787ded211657532e2ee4df2e446b03d860f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/index.html

--===============0984410090676133279==
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
<tr><td><b>Series:</b></td><td>tests/chamelium: Reduce edid count to avoid timeout (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140426/">https://patchwork.freedesktop.org/series/140426/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8100_BAT -&gt; XEIGTPW_12059_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_12059_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:</p>
<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>bat-pvc-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-pvc-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-1/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-dg2-oem2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-atsm-2/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>)</li>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-vf/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2463">Intel XE#2463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8100/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_12059/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8100 -&gt; IGTPW_12059</li>
<li>Linux: xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c -&gt; xe-2181-6f358787ded211657532e2ee4df2e446b03d860f</li>
</ul>
<p>IGTPW_12059: 12059<br />
  IGT_8100: 84e42580f918da926481fd2fb37be01451d6ee9a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2179-438ef86a725b59a171dba81fc258bb23a0ff536c: 438ef86a725b59a171dba81fc258bb23a0ff536c<br />
  xe-2181-6f358787ded211657532e2ee4df2e446b03d860f: 6f358787ded211657532e2ee4df2e446b03d860f</p>

</body>
</html>

--===============0984410090676133279==--
