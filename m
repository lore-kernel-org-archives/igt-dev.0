Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BC3C3601E
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 08:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6811510E7F0;
	Thu, 10 Apr 2025 08:51:27 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F6310E7EC;
 Thu, 10 Apr 2025 08:51:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5578804394389473896=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_i915=2ECI=2EBAT=3A_success_for_Add_PMU_test_for_GT_frequ?=
 =?utf-8?q?ency_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Thu, 10 Apr 2025 08:51:26 -0000
Message-ID: <174427508626.55177.1873212838509056935@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250410013314.613109-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250410013314.613109-1-vinay.belgaumkar@intel.com>
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

--===============5578804394389473896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add PMU test for GT frequency (rev2)
URL   : https://patchwork.freedesktop.org/series/147350/
State : success

== Summary ==

CI Bug Log - changes from IGT_8312 -> IGTPW_12952
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/index.html

Participating hosts (42 -> 41)
------------------------------

  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_12952 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@dmabuf@all-tests@dma_fence_chain:
    - fi-bsw-n3050:       [PASS][1] -> [INCOMPLETE][2] ([i915#12904]) +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html

  
#### Possible fixes ####

  * igt@i915_selftest@live:
    - bat-arlh-2:         [INCOMPLETE][3] ([i915#14046]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-arlh-2/igt@i915_selftest@live.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-arlh-2/igt@i915_selftest@live.html

  * igt@i915_selftest@live@late_gt_pm:
    - fi-cfl-8109u:       [DMESG-WARN][5] ([i915#13735]) -> [PASS][6] +82 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html

  * igt@i915_selftest@live@workarounds:
    - bat-dg2-14:         [DMESG-FAIL][7] ([i915#12061]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-dg2-14/igt@i915_selftest@live@workarounds.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-dg2-14/igt@i915_selftest@live@workarounds.html
    - bat-arls-6:         [DMESG-FAIL][9] ([i915#12061]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-arls-6/igt@i915_selftest@live@workarounds.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-arls-6/igt@i915_selftest@live@workarounds.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-apl-1:          [DMESG-WARN][11] ([i915#13735]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_pipe_crc_basic@read-crc:
    - fi-cfl-8109u:       [DMESG-WARN][13] ([i915#13735] / [i915#13890]) -> [PASS][14] +49 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html

  
  [i915#12061]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
  [i915#12904]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
  [i915#13735]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735
  [i915#13890]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890
  [i915#14046]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_8312 -> IGTPW_12952
  * Linux: CI_DRM_16393 -> CI_DRM_16394

  CI-20190529: 20190529
  CI_DRM_16393: 2ee1c41fdfba60eb67d2c659239e31216c2610ee @ git://anongit.freedesktop.org/gfx-ci/linux
  CI_DRM_16394: c54633598106dbdb97f3aa589587b8176009b6d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_12952: 12952
  IGT_8312: 8312

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/index.html

--===============5578804394389473896==
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
<tr><td><b>Series:</b></td><td>Add PMU test for GT frequency (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147350/">https://patchwork.freedesktop.org/series/147350/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from IGT_8312 -&gt; IGTPW_12952</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/index.html</p>
<h2>Participating hosts (42 -&gt; 41)</h2>
<p>Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_12952 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@dmabuf@all-tests@dma_fence_chain:<ul>
<li>fi-bsw-n3050:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-bsw-n3050/igt@dmabuf@all-tests@dma_fence_chain.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904">i915#12904</a>) +1 other test incomplete</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@i915_selftest@live:</p>
<ul>
<li>bat-arlh-2:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-arlh-2/igt@i915_selftest@live.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14046">i915#14046</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-arlh-2/igt@i915_selftest@live.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@late_gt_pm:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-cfl-8109u/igt@i915_selftest@live@late_gt_pm.html">PASS</a> +82 other tests pass</li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@workarounds:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-dg2-14/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-dg2-14/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
<li>bat-arls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-arls-6/igt@i915_selftest@live@workarounds.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061">i915#12061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-arls-6/igt@i915_selftest@live@workarounds.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-apl-1:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/bat-apl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc:</p>
<ul>
<li>fi-cfl-8109u:       <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8312/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13735">i915#13735</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13890">i915#13890</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12952/fi-cfl-8109u/igt@kms_pipe_crc_basic@read-crc.html">PASS</a> +49 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_8312 -&gt; IGTPW_12952</li>
<li>Linux: CI_DRM_16393 -&gt; CI_DRM_16394</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_16393: 2ee1c41fdfba60eb67d2c659239e31216c2610ee @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  CI_DRM_16394: c54633598106dbdb97f3aa589587b8176009b6d8 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_12952: 12952<br />
  IGT_8312: 8312</p>

</body>
</html>

--===============5578804394389473896==--
