Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Mon, 31 Aug 2020 15:43:02 -0000
Message-ID: <159888858241.7426.9442544704886796766@emeril.freedesktop.org>
References: <20200831133457.23752-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200831133457.23752-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fflip=5Fscaled=5Fcrc=3A_add_flip_to_downscaled_subtests_?=
 =?utf-8?b?KHJldjYp?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1238933667=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1238933667==
Content-Type: multipart/alternative;
 boundary="===============5580613873497728800=="

--===============5580613873497728800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tests/kms_flip_scaled_crc: add flip to downscaled subtests (rev6)
URL   : https://patchwork.freedesktop.org/series/81109/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8946 -> IGTPW_4927
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4927:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@gem_exec_parallel@engines@fds:
    - {fi-ehl-1}:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-ehl-1/igt@gem_exec_parallel@engines@fds.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-ehl-1/igt@gem_exec_parallel@engines@fds.html

  
Known issues
------------

  Here are the changes found in IGTPW_4927 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - fi-icl-u2:          [PASS][3] -> [DMESG-WARN][4] ([i915#1982]) +1 similar issue
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:
    - fi-skl-guc:         [PASS][5] -> [DMESG-WARN][6] ([i915#2203])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html

  
#### Possible fixes ####

  * igt@gem_exec_parallel@engines@basic:
    - fi-bxt-dsi:         [INCOMPLETE][7] ([i915#1635] / [i915#2398]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-bxt-dsi/igt@gem_exec_parallel@engines@basic.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-bxt-dsi/igt@gem_exec_parallel@engines@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#1635]: https://gitlab.freedesktop.org/drm/intel/issues/1635
  [i915#1982]: https://gitlab.freedesktop.org/drm/intel/issues/1982
  [i915#2203]: https://gitlab.freedesktop.org/drm/intel/issues/2203
  [i915#2398]: https://gitlab.freedesktop.org/drm/intel/issues/2398


Participating hosts (38 -> 33)
------------------------------

  Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5774 -> IGTPW_4927

  CI-20190529: 20190529
  CI_DRM_8946: e2a5eec44f19c7732c7114c62410914fda06e106 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html

--===============5580613873497728800==
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
<tr><td><b>Series:</b></td><td>tests/kms_flip_scaled_crc: add flip to downscaled subtests (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/81109/">https://patchwork.freedesktop.org/series/81109/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from CI_DRM_8946 -&gt; IGTPW_4927</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<p>External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in IGTPW_4927:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@gem_exec_parallel@engines@fds:<ul>
<li>{fi-ehl-1}:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-ehl-1/igt@gem_exec_parallel@engines@fds.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-ehl-1/igt@gem_exec_parallel@engines@fds.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in IGTPW_4927 that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>fi-icl-u2:          <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-icl-u2/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1982">i915#1982</a>) +1 similar issue</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2:</p>
<ul>
<li>fi-skl-guc:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-skl-guc/igt@kms_flip@basic-flip-vs-wf_vblank@c-hdmi-a2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2203">i915#2203</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@gem_exec_parallel@engines@basic:<ul>
<li>fi-bxt-dsi:         <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8946/fi-bxt-dsi/igt@gem_exec_parallel@engines@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1635">i915#1635</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2398">i915#2398</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/fi-bxt-dsi/igt@gem_exec_parallel@engines@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Participating hosts (38 -&gt; 33)</h2>
<p>Missing    (5): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper </p>
<h2>Build changes</h2>
<ul>
<li>CI: CI-20190529 -&gt; None</li>
<li>IGT: IGT_5774 -&gt; IGTPW_4927</li>
</ul>
<p>CI-20190529: 20190529<br />
  CI_DRM_8946: e2a5eec44f19c7732c7114c62410914fda06e106 @ git://anongit.freedesktop.org/gfx-ci/linux<br />
  IGTPW_4927: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4927/index.html<br />
  IGT_5774: 2a5db9f60241383272aeec176e1b97b3f487209f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools</p>
<p>== Testlist changes ==</p>
<p>+igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs<br />
+igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile<br />
+igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs</p>

</body>
</html>

--===============5580613873497728800==--

--===============1238933667==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1238933667==--
