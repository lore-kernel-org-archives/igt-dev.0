Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BEBCD6E57
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 16:59:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75500112148;
	Wed,  3 Jun 2026 16:59:11 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FC8112146;
 Wed,  3 Jun 2026 16:58:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7729134361104424804=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_include/drm-uapi/xe=5Fdrm?=
 =?utf-8?q?=3A_Add_srcid_to_drm=5Fxe=5Ffault_struct?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: igt-dev@lists.freedesktop.org
Date: Wed, 03 Jun 2026 16:58:48 -0000
Message-ID: <178050592873.40082.1397772758487592866@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603150122.3750541-1-jonathan.cavitt@intel.com>
In-Reply-To: <20260603150122.3750541-1-jonathan.cavitt@intel.com>
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

--===============7729134361104424804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: include/drm-uapi/xe_drm: Add srcid to drm_xe_fault struct
URL   : https://patchwork.freedesktop.org/series/167823/
State : success

== Summary ==

CI Bug Log - changes from XEIGT_8947_BAT -> XEIGTPW_15297_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between XEIGT_8947_BAT and XEIGTPW_15297_BAT:

### New IGT tests (10) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.80] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.77, 1.02] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.36, 1.42] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.28, 1.39] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.30] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - Statuses : 5 pass(s) 5 skip(s)
    - Exec time: [0.0, 4.74] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [0.68, 0.92] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.35, 1.52] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:
    - Statuses : 4 pass(s)
    - Exec time: [1.25, 1.35] s

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:
    - Statuses : 2 pass(s)
    - Exec time: [1.28, 1.32] s

  


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8947 -> IGTPW_15297
  * Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -> xe-5193-4354c70593040dcb61935903e0fe1c90ca531df7

  IGTPW_15297: baeee3a60ceb2189815bc36a92a43cc3e0f66044 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc
  xe-5193-4354c70593040dcb61935903e0fe1c90ca531df7: 4354c70593040dcb61935903e0fe1c90ca531df7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15297/index.html

--===============7729134361104424804==
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
<tr><td><b>Series:</b></td><td>include/drm-uapi/xe_drm: Add srcid to drm_xe_fault struct</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167823/">https://patchwork.freedesktop.org/series/167823/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15297/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15297/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_8947_BAT -&gt; XEIGTPW_15297_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between XEIGT_8947_BAT and XEIGTPW_15297_BAT:</p>
<h3>New IGT tests (10)</h3>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>Statuses : 5 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 4.80] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.77, 1.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.36, 1.42] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.28, 1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>Statuses : 5 pass(s) 5 skip(s)</li>
<li>Exec time: [0.0, 4.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.68, 0.92] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.35, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.25, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-d-edp-1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.28, 1.32] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8947 -&gt; IGTPW_15297</li>
<li>Linux: xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc -&gt; xe-5193-4354c70593040dcb61935903e0fe1c90ca531df7</li>
</ul>
<p>IGTPW_15297: baeee3a60ceb2189815bc36a92a43cc3e0f66044 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5186-dae47e6a1cce1d19d56c27b48b2670d4094ecbdc: dae47e6a1cce1d19d56c27b48b2670d4094ecbdc<br />
  xe-5193-4354c70593040dcb61935903e0fe1c90ca531df7: 4354c70593040dcb61935903e0fe1c90ca531df7</p>

</body>
</html>

--===============7729134361104424804==--
