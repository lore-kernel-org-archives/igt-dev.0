Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 10 May 2021 18:55:31 -0000
Message-ID: <162067293174.9575.17151766065474033952@emeril.freedesktop.org>
References: <20210510175946.139597-1-kunal1.joshi@intel.com>
In-Reply-To: <20210510175946.139597-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgbGliL2ln?=
 =?utf-8?q?t=5Fchamelium=3A_Retry_DP_FSM_on_Failure_=28rev3=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1865089506=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1865089506==
Content-Type: multipart/alternative;
 boundary="===============8623237386295309272=="

--===============8623237386295309272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/igt_chamelium: Retry DP FSM on Failure (rev3)
URL   : https://patchwork.freedesktop.org/series/89770/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_10063 -> IGTPW_5799
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html

New tests
---------

  New tests have been introduced between CI_DRM_10063 and IGTPW_5799:

### New IGT tests (48) ###

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 1.35] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.56, 2.10] s

  * igt@kms_flip@basic-flip-vs-dpms@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@basic-flip-vs-dpms@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.66] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.58, 1.35] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.75] s

  * igt@kms_flip@basic-flip-vs-dpms@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.18] s

  * igt@kms_flip@basic-flip-vs-dpms@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.39] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.58, 1.36] s

  * igt@kms_flip@basic-flip-vs-dpms@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.70] s

  * igt@kms_flip@basic-flip-vs-dpms@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 0.85] s

  * igt@kms_flip@basic-flip-vs-dpms@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.68] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.58, 1.35] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.55, 2.11] s

  * igt@kms_flip@basic-flip-vs-modeset@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.03] s

  * igt@kms_flip@basic-flip-vs-modeset@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.71] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.58, 1.34] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.35, 1.54] s

  * igt@kms_flip@basic-flip-vs-modeset@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.07] s

  * igt@kms_flip@basic-flip-vs-modeset@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.37] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.59, 1.35] s

  * igt@kms_flip@basic-flip-vs-modeset@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.34, 1.58] s

  * igt@kms_flip@basic-flip-vs-modeset@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.84, 0.85] s

  * igt@kms_flip@basic-flip-vs-modeset@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.61] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.96, 1.43] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.92, 2.09] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [1.03, 1.26] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.77, 1.89] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [1.43] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.90] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.91, 1.26] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.76, 1.89] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [1.10] s

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.81] s

  * igt@kms_flip@basic-plain-flip@a-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 0.98] s

  * igt@kms_flip@basic-plain-flip@a-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.49, 1.79] s

  * igt@kms_flip@basic-plain-flip@a-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_flip@basic-plain-flip@a-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.44] s

  * igt@kms_flip@basic-plain-flip@b-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 0.99] s

  * igt@kms_flip@basic-plain-flip@b-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.41, 1.52] s

  * igt@kms_flip@basic-plain-flip@b-dvi-d1:
    - Statuses : 1 pass(s)
    - Exec time: [0.99] s

  * igt@kms_flip@basic-plain-flip@b-lvds1:
    - Statuses : 1 pass(s)
    - Exec time: [1.41] s

  * igt@kms_flip@basic-plain-flip@c-dp2:
    - Statuses : 4 pass(s)
    - Exec time: [0.60, 0.97] s

  * igt@kms_flip@basic-plain-flip@c-dsi1:
    - Statuses : 3 pass(s)
    - Exec time: [1.42, 1.52] s

  * igt@kms_flip@basic-plain-flip@c-vga1:
    - Statuses : 2 pass(s)
    - Exec time: [0.82] s

  * igt@kms_flip@basic-plain-flip@d-dsi1:
    - Statuses : 1 pass(s)
    - Exec time: [1.52] s

  

Known issues
------------

  Here are the changes found in IGTPW_5799 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload:
    - fi-tgl-y:           [PASS][1] -> [DMESG-WARN][2] ([i915#1982] / [k.org#205379])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10063/fi-tgl-y/igt@i915_module_load@reload.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/fi-tgl-y/igt@i915_module_load@reload.html

  
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [k.org#205379]: https://bugzilla.kernel.org/show_bug.cgi?id=205379


Participating hosts (42 -> 39)
------------------------------

  Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_6081 -> IGTPW_5799

  CI-20190529: 20190529
  CI_DRM_10063: da07ff0745f8eb4f079ee06bbbf04692eec85538 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_5799: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html

--===============8623237386295309272==
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
<tr><td><b>Series:</b></td><td>lib/igt_chamelium: Retry DP FSM on Failure (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/89770/">https://patchwork.freedesktop.org/series/89770/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_10063 -&gt; IGTPW_5799</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html</p>
<h2>New tests</h2>
<p>New tests have been introduced between CI_DRM_10063 and IGTPW_5799:</p>
<h3>New IGT tests (48)</h3>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.56, 2.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.66] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.58, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.75] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.39] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.58, 1.36] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.68] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.58, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.55, 2.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.71] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.58, 1.34] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.35, 1.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.37] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.59, 1.35] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.34, 1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.84, 0.85] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.61] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.96, 1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.92, 2.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [1.03, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.77, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.90] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.91, 1.26] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.76, 1.89] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [1.10] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.81] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 0.98] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.49, 1.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@a-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.41, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-dvi-d1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.99] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@b-lvds1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dp2:</p>
<ul>
<li>Statuses : 4 pass(s)</li>
<li>Exec time: [0.60, 0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-dsi1:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [1.42, 1.52] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@c-vga1:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.82] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-dsi1:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.52] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_5799 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@i915_module_load@reload:<ul>
<li>fi-tgl-y:           <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_10063/fi-tgl-y/igt@i915_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/fi-tgl-y/igt@i915_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a> / <a href="https://bugzilla.kernel.org/show_bug.cgi?id=205379">k.org#205379</a>)</li>
</ul>
</li>
</ul>
<h2>Participating hosts (42 -&gt; 39)</h2>
<p>Missing    (3): fi-ilk-m540 fi-dg1-1 fi-bdw-samus </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_6081 -&gt; IGTPW_5799</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_10063: da07ff0745f8eb4f079ee06bbbf04692eec85538 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_5799: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_5799/index.html<br />
  IGT_6081: fdff4bba7abf9cb7c8ea21abf14e36d344ebb8c1 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>

</body>
</html>

--===============8623237386295309272==--

--===============1865089506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1865089506==--
