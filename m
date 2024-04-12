Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00681C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 03:09:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B63110EB42;
	Fri, 12 Apr 2024 03:09:25 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A642010EB42;
 Fri, 12 Apr 2024 03:09:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0502829102779130274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_Update_compression_check_ba?=
 =?utf-8?q?sed_on_platform_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Akshata Jahagirdar" <akshata.jahagirdar@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 12 Apr 2024 03:09:22 -0000
Message-ID: <171289136267.1353801.8434851345313330397@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1712928787.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1712928787.git.akshata.jahagirdar@intel.com>
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

--===============0502829102779130274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update compression check based on platform (rev3)
URL   : https://patchwork.freedesktop.org/series/132014/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14570 -> IGTPW_11016
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html

Participating hosts (39 -> 36)
------------------------------

  Missing    (3): bat-mtlp-8 bat-dg1-7 fi-apl-guc 

Known issues
------------

  Here are the changes found in IGTPW_11016 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - bat-adls-6:         [PASS][1] -> [TIMEOUT][2] ([i915#10795])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-adls-6/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-adls-6/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@gem_exec_fence@basic-await@vecs0:
    - bat-dg2-9:          [FAIL][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-dg2-9/igt@gem_exec_fence@basic-await@vecs0.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-dg2-9/igt@gem_exec_fence@basic-await@vecs0.html

  * igt@i915_selftest@live@gt_mocs:
    - bat-dg2-14:         [ABORT][5] ([i915#10366]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-dg2-14/igt@i915_selftest@live@gt_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-dg2-14/igt@i915_selftest@live@gt_mocs.html

  
  [i915#10366]: https://gitlab.freedesktop.org/drm/intel/issues/10366
  [i915#10795]: https://gitlab.freedesktop.org/drm/intel/issues/10795


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7806 -> IGTPW_11016

  CI-20190529: 20190529
  CI_DRM_14570: d9073a139e9edfd27d830c9c4af9683651044aff @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_11016: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

-igt@gem_mmap_offset@partial-mmap
-igt@gem_mmap_offset@partial-unmap

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html

--===============0502829102779130274==
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
<tr><td><b>Series:</b></td><td>Update compression check based on platform (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132014/">https://patchwork.freedesktop.org/series/132014/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14570 -&gt; IGTPW_11016</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html</p>
<h2>Participating hosts (39 -&gt; 36)</h2>
<p>Missing    (3): bat-mtlp-8 bat-dg1-7 fi-apl-guc </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_11016 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_selftest@live@execlists:<ul>
<li>bat-adls-6:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-adls-6/igt@i915_selftest@live@execlists.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-adls-6/igt@i915_selftest@live@execlists.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10795">i915#10795</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@gem_exec_fence@basic-await@vecs0:</p>
<ul>
<li>bat-dg2-9:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-dg2-9/igt@gem_exec_fence@basic-await@vecs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-dg2-9/igt@gem_exec_fence@basic-await@vecs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@i915_selftest@live@gt_mocs:</p>
<ul>
<li>bat-dg2-14:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_14570/bat-dg2-14/igt@i915_selftest@live@gt_mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/10366">i915#10366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/bat-dg2-14/igt@i915_selftest@live@gt_mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7806 -&gt; IGTPW_11016</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14570: d9073a139e9edfd27d830c9c4af9683651044aff @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_11016: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11016/index.html<br />
  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>-igt@gem_mmap_offset@partial-mmap<br />
-igt@gem_mmap_offset@partial-unmap</p>

</body>
</html>

--===============0502829102779130274==--
