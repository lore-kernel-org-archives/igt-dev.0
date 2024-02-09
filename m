Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A309BC4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53C0310F320;
	Fri,  9 Feb 2024 11:02:03 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE92010F163;
 Fri,  9 Feb 2024 11:02:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6121599029201572774=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Fi=2ECI=2EBAT=3A_success_for_tests/intel/kms=5Fccs=3A_Ad?=
 =?utf-8?q?d_Xe2_ccs_crc_tests_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Date: Fri, 09 Feb 2024 11:02:02 -0000
Message-ID: <170747652297.1128958.10185771274546713965@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240209100854.528387-1-juhapekka.heikkila@gmail.com>
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

--===============6121599029201572774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/intel/kms_ccs: Add Xe2 ccs crc tests (rev2)
URL   : https://patchwork.freedesktop.org/series/129593/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_14247 -> IGTPW_10654
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html

Participating hosts (34 -> 35)
------------------------------

  Additional (2): fi-kbl-7567u fi-pnv-d510 
  Missing    (1): fi-snb-2520m 

Known issues
------------

  Here are the changes found in IGTPW_10654 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@debugfs_test@read_all_entries:
    - fi-kbl-7567u:       NOTRUN -> [ABORT][1] ([i915#8913])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html

  * igt@gem_lmem_swapping@basic:
    - fi-pnv-d510:        NOTRUN -> [SKIP][2] ([fdo#109271]) +28 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/fi-pnv-d510/igt@gem_lmem_swapping@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#8913]: https://gitlab.freedesktop.org/drm/intel/issues/8913


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_7708 -> IGTPW_10654

  CI-20190529: 20190529
  CI_DRM_14247: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_10654: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html
  IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git


Testlist changes
----------------

+igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html

--===============6121599029201572774==
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
<tr><td><b>Series:</b></td><td>tests/intel/kms_ccs: Add Xe2 ccs crc tests (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129593/">https://patchwork.freedesktop.org/series/129593/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_14247 -&gt; IGTPW_10654</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html</p>
<h2>Participating hosts (34 -&gt; 35)</h2>
<p>Additional (2): fi-kbl-7567u fi-pnv-d510 <br />
  Missing    (1): fi-snb-2520m </p>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_10654 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@debugfs_test@read_all_entries:</p>
<ul>
<li>fi-kbl-7567u:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/fi-kbl-7567u/igt@debugfs_test@read_all_entries.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/8913">i915#8913</a>)</li>
</ul>
</li>
<li>
<p>igt@gem_lmem_swapping@basic:</p>
<ul>
<li>fi-pnv-d510:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/fi-pnv-d510/igt@gem_lmem_swapping@basic.html">SKIP</a> (<a href="https://bugs.freedesktop.org/show_bug.cgi?id=109271">fdo#109271</a>) +28 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_7708 -&gt; IGTPW_10654</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_14247: 6a21fc66f5c81c19baa24407cd7e8d2720edd2eb @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_10654: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_10654/index.html<br />
  IGT_7708: c2ecf4ba307d3342682745de6f608d307a06782c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</p>
<h2>Testlist changes</h2>
<p>+igt@kms_ccs@pipe-a-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-a-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-b-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-c-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-d-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-e-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-f-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-g-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-h-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-i-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-j-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-k-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-l-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-m-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-n-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-o-random-ccs-data-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-bad-rotation-90-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-primary-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-primary-rotation-180-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-crc-sprite-planes-basic-4-tiled-xe2-ccs<br />
+igt@kms_ccs@pipe-p-random-ccs-data-4-tiled-xe2-ccs</p>

</body>
</html>

--===============6121599029201572774==--
