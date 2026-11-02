Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81CD606A326
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 06:32:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C21C10E4B9;
	Mon,  2 Nov 2026 06:32:03 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9708510E4B9;
 Mon,  2 Nov 2026 06:31:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3956050304533973884=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_i915=2ECI=2EBAT=3A_failure_for_fix_missing_resource_clea?=
 =?utf-8?q?nup_in_several_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
Date: Mon, 02 Nov 2026 06:31:11 -0000
Message-ID: <179360107161.100339.5813747548062822498@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
In-Reply-To: <20261102052534.3358553-5-priyanka.dandamudi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3956050304533973884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix missing resource cleanup in several tests (rev2)
URL   : https://patchwork.freedesktop.org/series/176521/
State : failure

== Summary ==

CI Bug Log - changes from IGT_9173 -> IGTPW_16082
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_16082 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_16082, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/index.html

Participating hosts (40 -> 39)
------------------------------

  Missing    (1): bat-dg2-13 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_16082:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-kbl-x1275:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-x1275/igt@runner@aborted.html
    - bat-adlp-11:        NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-11/igt@runner@aborted.html
    - fi-hsw-4770:        NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-hsw-4770/igt@runner@aborted.html
    - fi-cfl-8109u:       NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-8109u/igt@runner@aborted.html
    - fi-kbl-8809g:       NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-8809g/igt@runner@aborted.html
    - fi-ivb-3770:        NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-ivb-3770/igt@runner@aborted.html
    - bat-mtlp-8:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-mtlp-8/igt@runner@aborted.html
    - bat-dg1-6:          NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg1-6/igt@runner@aborted.html
    - fi-elk-e7500:       NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-elk-e7500/igt@runner@aborted.html
    - bat-dg2-8:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-8/igt@runner@aborted.html
    - bat-adls-6:         NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adls-6/igt@runner@aborted.html
    - fi-ilk-650:         NOTRUN -> [FAIL][12]
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-ilk-650/igt@runner@aborted.html
    - fi-tgl-1115g4:      NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-tgl-1115g4/igt@runner@aborted.html
    - fi-bsw-n3050:       NOTRUN -> [FAIL][14]
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-bsw-n3050/igt@runner@aborted.html
    - bat-adlp-6:         NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-6/igt@runner@aborted.html
    - fi-skl-6600u:       NOTRUN -> [FAIL][16]
   [16]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-skl-6600u/igt@runner@aborted.html
    - bat-arls-6:         NOTRUN -> [FAIL][17]
   [17]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arls-6/igt@runner@aborted.html
    - bat-arlh-3:         NOTRUN -> [FAIL][18]
   [18]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arlh-3/igt@runner@aborted.html
    - fi-pnv-d510:        NOTRUN -> [FAIL][19]
   [19]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-pnv-d510/igt@runner@aborted.html
    - fi-glk-j4005:       NOTRUN -> [FAIL][20]
   [20]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-glk-j4005/igt@runner@aborted.html
    - bat-adlp-9:         NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-9/igt@runner@aborted.html
    - bat-twl-2:          NOTRUN -> [FAIL][22]
   [22]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-twl-2/igt@runner@aborted.html
    - bat-rpls-4:         NOTRUN -> [FAIL][23]
   [23]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-rpls-4/igt@runner@aborted.html
    - fi-kbl-7567u:       NOTRUN -> [FAIL][24]
   [24]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-7567u/igt@runner@aborted.html
    - fi-cfl-8700k:       NOTRUN -> [FAIL][25]
   [25]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-8700k/igt@runner@aborted.html
    - bat-twl-1:          NOTRUN -> [FAIL][26]
   [26]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-twl-1/igt@runner@aborted.html
    - bat-jsl-5:          NOTRUN -> [FAIL][27]
   [27]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-jsl-5/igt@runner@aborted.html
    - bat-apl-1:          NOTRUN -> [FAIL][28]
   [28]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-apl-1/igt@runner@aborted.html
    - bat-dg2-14:         NOTRUN -> [FAIL][29]
   [29]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-14/igt@runner@aborted.html
    - fi-bsw-nick:        NOTRUN -> [FAIL][30]
   [30]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-bsw-nick/igt@runner@aborted.html
    - bat-kbl-2:          NOTRUN -> [FAIL][31]
   [31]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-kbl-2/igt@runner@aborted.html
    - bat-arls-5:         NOTRUN -> [FAIL][32]
   [32]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arls-5/igt@runner@aborted.html
    - bat-rplp-1:         NOTRUN -> [FAIL][33]
   [33]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-rplp-1/igt@runner@aborted.html
    - bat-arlh-2:         NOTRUN -> [FAIL][34]
   [34]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arlh-2/igt@runner@aborted.html
    - fi-rkl-11600:       NOTRUN -> [FAIL][35]
   [35]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-rkl-11600/igt@runner@aborted.html
    - bat-atsm-1:         NOTRUN -> [FAIL][36]
   [36]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-atsm-1/igt@runner@aborted.html
    - fi-cfl-guc:         NOTRUN -> [FAIL][37]
   [37]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-guc/igt@runner@aborted.html
    - bat-mtlp-9:         NOTRUN -> [FAIL][38]
   [38]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-mtlp-9/igt@runner@aborted.html
    - bat-dg2-9:          NOTRUN -> [FAIL][39]
   [39]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-9/igt@runner@aborted.html

  


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_9173 -> IGTPW_16082
  * Linux: CI_DRM_19420 -> CI_DRM_19424

  CI-20190529: 20190529
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_19424: abc364961b361ab626fa5a09568b22744f1e0393 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_16082: 16082
  IGT_9173: 9173

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/index.html

--===============3956050304533973884==
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
<tr><td><b>Series:</b></td><td>fix missing resource cleanup in several tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176521/">https://patchwork.freedesktop.org/series/176521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_9173 -&gt; IGTPW_16082</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with IGTPW_16082 absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in IGTPW_16082, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/index.html</p>
<h2>Participating hosts (40 -&gt; 39)</h2>
<p>Missing    (1): bat-dg2-13 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_16082:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>fi-kbl-x1275:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-x1275/igt@runner@aborted.html">FAIL</a></li>
<li>bat-adlp-11:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-11/igt@runner@aborted.html">FAIL</a></li>
<li>fi-hsw-4770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-hsw-4770/igt@runner@aborted.html">FAIL</a></li>
<li>fi-cfl-8109u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-8109u/igt@runner@aborted.html">FAIL</a></li>
<li>fi-kbl-8809g:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-8809g/igt@runner@aborted.html">FAIL</a></li>
<li>fi-ivb-3770:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-ivb-3770/igt@runner@aborted.html">FAIL</a></li>
<li>bat-mtlp-8:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-mtlp-8/igt@runner@aborted.html">FAIL</a></li>
<li>bat-dg1-6:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg1-6/igt@runner@aborted.html">FAIL</a></li>
<li>fi-elk-e7500:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-elk-e7500/igt@runner@aborted.html">FAIL</a></li>
<li>bat-dg2-8:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-8/igt@runner@aborted.html">FAIL</a></li>
<li>bat-adls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adls-6/igt@runner@aborted.html">FAIL</a></li>
<li>fi-ilk-650:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-ilk-650/igt@runner@aborted.html">FAIL</a></li>
<li>fi-tgl-1115g4:      NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-tgl-1115g4/igt@runner@aborted.html">FAIL</a></li>
<li>fi-bsw-n3050:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-bsw-n3050/igt@runner@aborted.html">FAIL</a></li>
<li>bat-adlp-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-6/igt@runner@aborted.html">FAIL</a></li>
<li>fi-skl-6600u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-skl-6600u/igt@runner@aborted.html">FAIL</a></li>
<li>bat-arls-6:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arls-6/igt@runner@aborted.html">FAIL</a></li>
<li>bat-arlh-3:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arlh-3/igt@runner@aborted.html">FAIL</a></li>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-pnv-d510/igt@runner@aborted.html">FAIL</a></li>
<li>fi-glk-j4005:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-glk-j4005/igt@runner@aborted.html">FAIL</a></li>
<li>bat-adlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-adlp-9/igt@runner@aborted.html">FAIL</a></li>
<li>bat-twl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-twl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-rpls-4:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-rpls-4/igt@runner@aborted.html">FAIL</a></li>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-kbl-7567u/igt@runner@aborted.html">FAIL</a></li>
<li>fi-cfl-8700k:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-8700k/igt@runner@aborted.html">FAIL</a></li>
<li>bat-twl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-twl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-jsl-5:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-jsl-5/igt@runner@aborted.html">FAIL</a></li>
<li>bat-apl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-apl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-dg2-14:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-14/igt@runner@aborted.html">FAIL</a></li>
<li>fi-bsw-nick:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-bsw-nick/igt@runner@aborted.html">FAIL</a></li>
<li>bat-kbl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-kbl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-arls-5:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arls-5/igt@runner@aborted.html">FAIL</a></li>
<li>bat-rplp-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-rplp-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-arlh-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-arlh-2/igt@runner@aborted.html">FAIL</a></li>
<li>fi-rkl-11600:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-rkl-11600/igt@runner@aborted.html">FAIL</a></li>
<li>bat-atsm-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-atsm-1/igt@runner@aborted.html">FAIL</a></li>
<li>fi-cfl-guc:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/fi-cfl-guc/igt@runner@aborted.html">FAIL</a></li>
<li>bat-mtlp-9:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-mtlp-9/igt@runner@aborted.html">FAIL</a></li>
<li>bat-dg2-9:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_16082/bat-dg2-9/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_9173 -&gt; IGTPW_16082</li>
<li>Linux: CI_DRM_19420 -&gt; CI_DRM_19424</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_19420: 238c1e3e984e2b7f948cb24165314b8d719a23d6 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_19424: abc364961b361ab626fa5a09568b22744f1e0393 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_16082: 16082<br />
  IGT_9173: 9173</p>

</body>
</html>

--===============3956050304533973884==--
