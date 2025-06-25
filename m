Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A609BC7EE2A
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 13:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C3BA10E700;
	Wed, 25 Jun 2025 13:01:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E342610E6FA;
 Wed, 25 Jun 2025 13:01:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3172498506484331073=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_extend_link_training_test?=
 =?utf-8?q?_cases_for_eDP_connector?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kunal Joshi" <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 25 Jun 2025 13:01:03 -0000
Message-ID: <175085646392.107834.17633699800643542752@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250625123402.3929358-1-kunal1.joshi@intel.com>
In-Reply-To: <20250625123402.3929358-1-kunal1.joshi@intel.com>
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

--===============3172498506484331073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: extend link training test cases for eDP connector
URL   : https://patchwork.freedesktop.org/series/150748/
State : success

== Summary ==

CI Bug Log - changes from IGT_8425 -> IGTPW_13350
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/index.html

Participating hosts (45 -> 44)
------------------------------

  Missing    (1): fi-snb-2520m 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_13350:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - bat-dg2-14:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-14/igt@kms_link_training@non-uhbr-mst.html
    - bat-mtlp-8:         NOTRUN -> [SKIP][2] +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@kms_link_training@non-uhbr-mst.html
    - bat-dg2-8:          NOTRUN -> [SKIP][3] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-8/igt@kms_link_training@non-uhbr-mst.html
    - bat-adls-6:         NOTRUN -> [SKIP][4] +3 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adls-6/igt@kms_link_training@non-uhbr-mst.html
    - bat-jsl-1:          NOTRUN -> [SKIP][5] +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-jsl-1/igt@kms_link_training@non-uhbr-mst.html
    - bat-arlh-3:         NOTRUN -> [SKIP][6] +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-3/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - bat-mtlp-9:         NOTRUN -> [FAIL][7] +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@kms_link_training@non-uhbr-sst.html
    - bat-arls-6:         NOTRUN -> [SKIP][8] +5 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arls-6/igt@kms_link_training@non-uhbr-sst.html
    - bat-arlh-3:         NOTRUN -> [FAIL][9] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-3/igt@kms_link_training@non-uhbr-sst.html
    - bat-twl-1:          NOTRUN -> [FAIL][10] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-1/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_link_training@uhbr-mst} (NEW):
    - bat-adlp-9:         NOTRUN -> [SKIP][11] +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-9/igt@kms_link_training@uhbr-mst.html
    - bat-rpls-4:         NOTRUN -> [SKIP][12] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rpls-4/igt@kms_link_training@uhbr-mst.html
    - bat-twl-1:          NOTRUN -> [SKIP][13] +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-1/igt@kms_link_training@uhbr-mst.html
    - bat-arls-5:         NOTRUN -> [SKIP][14] +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arls-5/igt@kms_link_training@uhbr-mst.html
    - bat-dg1-7:          NOTRUN -> [SKIP][15] +5 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg1-7/igt@kms_link_training@uhbr-mst.html

  * {igt@kms_link_training@uhbr-sst} (NEW):
    - bat-rplp-1:         NOTRUN -> [SKIP][16] +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rplp-1/igt@kms_link_training@uhbr-sst.html
    - fi-rkl-11600:       NOTRUN -> [SKIP][17] +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-rkl-11600/igt@kms_link_training@uhbr-sst.html
    - bat-dg2-9:          NOTRUN -> [SKIP][18] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-9/igt@kms_link_training@uhbr-sst.html
    - bat-adlp-6:         NOTRUN -> [SKIP][19] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-6/igt@kms_link_training@uhbr-sst.html

  * {igt@kms_linktrain_fallback@dsc-fallback} (NEW):
    - bat-twl-2:          NOTRUN -> [SKIP][20] +3 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-2/igt@kms_linktrain_fallback@dsc-fallback.html
    - bat-dg2-11:         NOTRUN -> [SKIP][21] +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-11/igt@kms_linktrain_fallback@dsc-fallback.html
    - bat-mtlp-9:         NOTRUN -> [SKIP][22] +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@kms_linktrain_fallback@dsc-fallback.html

  * {igt@kms_linktrain_fallback@lt-fallback} (NEW):
    - fi-tgl-1115g4:      NOTRUN -> [SKIP][23] +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-tgl-1115g4/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-adlp-6:         NOTRUN -> [FAIL][24] +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-6/igt@kms_linktrain_fallback@lt-fallback.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][25] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-skl-6600u/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-twl-2:          NOTRUN -> [FAIL][26] +1 other test fail
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-2/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][27] +2 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-jsl-1:          NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-jsl-1/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-rplp-1:         NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rplp-1/igt@kms_linktrain_fallback@lt-fallback.html

  
New tests
---------

  New tests have been introduced between IGT_8425 and IGTPW_13350:

### New IGT tests (6) ###

  * igt@kms_link_training@non-uhbr-mst:
    - Statuses : 1 pass(s) 42 skip(s)
    - Exec time: [0.0, 5.35] s

  * igt@kms_link_training@non-uhbr-sst:
    - Statuses : 7 fail(s) 12 pass(s) 24 skip(s)
    - Exec time: [0.0, 20.37] s

  * igt@kms_link_training@uhbr-mst:
    - Statuses : 43 skip(s)
    - Exec time: [0.0, 3.14] s

  * igt@kms_link_training@uhbr-sst:
    - Statuses : 3 fail(s) 40 skip(s)
    - Exec time: [0.0, 20.46] s

  * igt@kms_linktrain_fallback@dsc-fallback:
    - Statuses : 3 pass(s) 40 skip(s)
    - Exec time: [0.0, 1.79] s

  * igt@kms_linktrain_fallback@lt-fallback:
    - Statuses : 9 fail(s) 10 pass(s) 24 skip(s)
    - Exec time: [0.0, 20.36] s

  

Known issues
------------

  Here are the changes found in IGTPW_13350 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * {igt@kms_link_training@non-uhbr-mst} (NEW):
    - fi-cfl-8700k:       NOTRUN -> [SKIP][30] +5 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-8700k/igt@kms_link_training@non-uhbr-mst.html
    - fi-bsw-nick:        NOTRUN -> [SKIP][31] +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-bsw-nick/igt@kms_link_training@non-uhbr-mst.html
    - bat-kbl-2:          NOTRUN -> [SKIP][32] +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-kbl-2/igt@kms_link_training@non-uhbr-mst.html
    - bat-atsm-1:         NOTRUN -> [SKIP][33] ([i915#6078]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-atsm-1/igt@kms_link_training@non-uhbr-mst.html
    - fi-hsw-4770:        NOTRUN -> [SKIP][34] +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-hsw-4770/igt@kms_link_training@non-uhbr-mst.html
    - fi-ivb-3770:        NOTRUN -> [SKIP][35] +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-ivb-3770/igt@kms_link_training@non-uhbr-mst.html
    - fi-elk-e7500:       NOTRUN -> [SKIP][36] +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-elk-e7500/igt@kms_link_training@non-uhbr-mst.html
    - fi-kbl-guc:         NOTRUN -> [SKIP][37] +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-guc/igt@kms_link_training@non-uhbr-mst.html

  * {igt@kms_link_training@non-uhbr-sst} (NEW):
    - fi-bsw-n3050:       NOTRUN -> [SKIP][38] +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-bsw-n3050/igt@kms_link_training@non-uhbr-sst.html
    - fi-pnv-d510:        NOTRUN -> [SKIP][39] +5 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-pnv-d510/igt@kms_link_training@non-uhbr-sst.html
    - fi-glk-j4005:       NOTRUN -> [SKIP][40] +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-glk-j4005/igt@kms_link_training@non-uhbr-sst.html

  * {igt@kms_link_training@uhbr-mst} (NEW):
    - bat-apl-1:          NOTRUN -> [SKIP][41] +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-apl-1/igt@kms_link_training@uhbr-mst.html

  * {igt@kms_link_training@uhbr-sst} (NEW):
    - bat-arlh-2:         NOTRUN -> [SKIP][42] ([i915#11346]) +5 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-2/igt@kms_link_training@uhbr-sst.html
    - fi-kbl-x1275:       NOTRUN -> [SKIP][43] +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-x1275/igt@kms_link_training@uhbr-sst.html
    - bat-adlp-11:        NOTRUN -> [SKIP][44] ([i915#10470]) +5 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-11/igt@kms_link_training@uhbr-sst.html
    - fi-cfl-8109u:       NOTRUN -> [SKIP][45] +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-8109u/igt@kms_link_training@uhbr-sst.html
    - fi-kbl-7567u:       NOTRUN -> [SKIP][46] +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-7567u/igt@kms_link_training@uhbr-sst.html
    - fi-cfl-guc:         NOTRUN -> [SKIP][47] +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-guc/igt@kms_link_training@uhbr-sst.html

  * {igt@kms_linktrain_fallback@dsc-fallback} (NEW):
    - fi-skl-6600u:       NOTRUN -> [SKIP][48] +3 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-skl-6600u/igt@kms_linktrain_fallback@dsc-fallback.html

  * {igt@kms_linktrain_fallback@lt-fallback} (NEW):
    - fi-kbl-8809g:       NOTRUN -> [SKIP][49] +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-8809g/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-dg1-6:          NOTRUN -> [SKIP][50] ([i915#12311]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg1-6/igt@kms_linktrain_fallback@lt-fallback.html
    - fi-ilk-650:         NOTRUN -> [SKIP][51] +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-ilk-650/igt@kms_linktrain_fallback@lt-fallback.html
    - bat-mtlp-6:         NOTRUN -> [SKIP][52] ([i915#9792]) +5 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-6/igt@kms_linktrain_fallback@lt-fallback.html

  
#### Possible fixes ####

  * igt@i915_module_load@load:
    - bat-mtlp-9:         [DMESG-WARN][53] ([i915#13494]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-mtlp-9/igt@i915_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@i915_module_load@load.html

  * igt@i915_selftest@live:
    - bat-mtlp-8:         [DMESG-FAIL][55] ([i915#12061]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-mtlp-8/igt@i915_selftest@live.html
   [56]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@i915_selftest@live.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-11:         [DMESG-FAIL][57] ([i915#12061]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-dg2-11/igt@i915_selftest@live@workarounds.html
   [58]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-11/igt@i915_selftest@live@workarounds.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#10470]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470
  [i915#11346]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12311]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311
  [i915#13494]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494
  [i915#6078]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078
  [i915#9792]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8425 -> IGTPW_13350

  CI-20190529: 20190529
  CI_DRM_16754: e4196e8184ee5a9c70c136f659dccef786c263b3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_13350: 00089dacbf78c7ff3db14ef4d24efea066708fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8425: 8425

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/index.html

--===============3172498506484331073==
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
<tr><td><b>Series:</b></td><td>extend link training test cases for eDP connector</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150748/">https://patchwork.freedesktop.org/series/150748/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8425 -&gt; IGTPW_13350</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/index.html</p>
<h2>Participating hosts (45 -&gt; 44)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_13350:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-14/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-8/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adls-6/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-jsl-1/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-3/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +2 other tests fail</li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arls-6/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-3/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +2 other tests fail</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-1/igt@kms_link_training@non-uhbr-sst.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-mst} (NEW):</p>
<ul>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-9/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rpls-4/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-1/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arls-5/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg1-7:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg1-7/igt@kms_link_training@uhbr-mst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rplp-1/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-rkl-11600/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-9/igt@kms_link_training@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-6/igt@kms_link_training@uhbr-sst.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-2/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +3 other tests skip</li>
<li>bat-dg2-11:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-11/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@lt-fallback} (NEW):</p>
<ul>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-tgl-1115g4/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-6/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-skl-6600u/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-twl-2/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +1 other test fail</li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a> +2 other tests fail</li>
<li>bat-jsl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-jsl-1/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-rplp-1/igt@kms_linktrain_fallback@lt-fallback.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between IGT_8425 and IGTPW_13350:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_link_training@non-uhbr-mst:</p>
<ul>
<li>Statuses : 1 pass(s) 42 skip(s)</li>
<li>Exec time: [0.0, 5.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@non-uhbr-sst:</p>
<ul>
<li>Statuses : 7 fail(s) 12 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 20.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-mst:</p>
<ul>
<li>Statuses : 43 skip(s)</li>
<li>Exec time: [0.0, 3.14] s</li>
</ul>
</li>
<li>
<p>igt@kms_link_training@uhbr-sst:</p>
<ul>
<li>Statuses : 3 fail(s) 40 skip(s)</li>
<li>Exec time: [0.0, 20.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>Statuses : 3 pass(s) 40 skip(s)</li>
<li>Exec time: [0.0, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_linktrain_fallback@lt-fallback:</p>
<ul>
<li>Statuses : 9 fail(s) 10 pass(s) 24 skip(s)</li>
<li>Exec time: [0.0, 20.36] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_13350 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>{igt@kms_link_training@non-uhbr-mst} (NEW):</p>
<ul>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-8700k/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-bsw-nick/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-kbl-2/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-atsm-1/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6078">i915#6078</a>) +5 other tests skip</li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-hsw-4770/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-ivb-3770/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-elk-e7500/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
<li>fi-kbl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-guc/igt@kms_link_training@non-uhbr-mst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@non-uhbr-sst} (NEW):</p>
<ul>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-bsw-n3050/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-pnv-d510/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-glk-j4005/igt@kms_link_training@non-uhbr-sst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-mst} (NEW):</p>
<ul>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-apl-1/igt@kms_link_training@uhbr-mst.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_link_training@uhbr-sst} (NEW):</p>
<ul>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-arlh-2/igt@kms_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11346">i915#11346</a>) +5 other tests skip</li>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-x1275/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-adlp-11/igt@kms_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10470">i915#10470</a>) +5 other tests skip</li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-8109u/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-7567u/igt@kms_link_training@uhbr-sst.html">SKIP</a> +3 other tests skip</li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-cfl-guc/igt@kms_link_training@uhbr-sst.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@dsc-fallback} (NEW):</p>
<ul>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-skl-6600u/igt@kms_linktrain_fallback@dsc-fallback.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_linktrain_fallback@lt-fallback} (NEW):</p>
<ul>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-kbl-8809g/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg1-6/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12311">i915#12311</a>) +5 other tests skip</li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/fi-ilk-650/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> +5 other tests skip</li>
<li>bat-mtlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-6/igt@kms_linktrain_fallback@lt-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9792">i915#9792</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_module_load@load:</p>
<ul>
<li>bat-mtlp-9:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-mtlp-9/igt@i915_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13494">i915#13494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-9/igt@i915_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-mtlp-8:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-mtlp-8/igt@i915_selftest@live.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-mtlp-8/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-11:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8425/bat-dg2-11/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13350/bat-dg2-11/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8425 -&gt; IGTPW_13350</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16754: e4196e8184ee5a9c70c136f659dccef786c263b3 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_13350: 00089dacbf78c7ff3db14ef4d24efea066708fca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8425: 8425</p>

</body>
</html>

--===============3172498506484331073==--
