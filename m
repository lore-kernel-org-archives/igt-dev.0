Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 081C8C3DA4A
	for <igt-dev@archiver.kernel.org>; Fri,  9 Aug 2024 05:22:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90FFB10E85C;
	Fri,  9 Aug 2024 05:22:51 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB9B10E71D;
 Fri,  9 Aug 2024 05:22:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6723374256638642060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_tests/amdgpu=3A_add_KGQ_test_i?=
 =?utf-8?q?n_queue_reset_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Aug 2024 05:22:51 -0000
Message-ID: <172318097116.551641.15709234526868420004@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240809041449.2740836-1-jesse.zhang@amd.com>
In-Reply-To: <20240809041449.2740836-1-jesse.zhang@amd.com>
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

--===============6723374256638642060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/amdgpu: add KGQ test in queue reset (rev3)
URL   : https://patchwork.freedesktop.org/series/137021/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7963_BAT -> XEIGTPW_11548_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_11548_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_11548_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_11548_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@unused-offsets:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-bmg-1/igt@kms_addfb_basic@unused-offsets.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-bmg-1/igt@kms_addfb_basic@unused-offsets.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_11548_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [PASS][3] -> [FAIL][4] ([Intel XE#886]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][5] ([Intel XE#2229] / [Intel XE#455])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vf:        NOTRUN -> [SKIP][6] ([Intel XE#2229]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [SKIP][7] ([Intel XE#1192]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][9] ([Intel XE#358]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][11] ([Intel XE#1192]) -> [SKIP][12] ([Intel XE#455])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * IGT: IGT_7963 -> IGTPW_11548
  * Linux: xe-1737-26337128da9b0df8c914cb7cd04fb4535e63d6c9 -> xe-1738-f37a832448fd9e646996449fbd44ad35c387564c

  IGTPW_11548: 11548
  IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1737-26337128da9b0df8c914cb7cd04fb4535e63d6c9: 26337128da9b0df8c914cb7cd04fb4535e63d6c9
  xe-1738-f37a832448fd9e646996449fbd44ad35c387564c: f37a832448fd9e646996449fbd44ad35c387564c

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/index.html

--===============6723374256638642060==
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
<tr><td><b>Series:</b></td><td>tests/amdgpu: add KGQ test in queue reset (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137021/">https://patchwork.freedesktop.org/series/137021/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7963_BAT -&gt; XEIGTPW_11548_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_11548_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_11548_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_11548_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_addfb_basic@unused-offsets:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-bmg-1/igt@kms_addfb_basic@unused-offsets.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-bmg-1/igt@kms_addfb_basic@unused-offsets.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_11548_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp@render:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7963/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11548/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7963 -&gt; IGTPW_11548</li>
<li>Linux: xe-1737-26337128da9b0df8c914cb7cd04fb4535e63d6c9 -&gt; xe-1738-f37a832448fd9e646996449fbd44ad35c387564c</li>
</ul>
<p>IGTPW_11548: 11548<br />
  IGT_7963: 3f8b9bc4d3f292f788935243bf0a26a4284d8f18 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1737-26337128da9b0df8c914cb7cd04fb4535e63d6c9: 26337128da9b0df8c914cb7cd04fb4535e63d6c9<br />
  xe-1738-f37a832448fd9e646996449fbd44ad35c387564c: f37a832448fd9e646996449fbd44ad35c387564c</p>

</body>
</html>

--===============6723374256638642060==--
