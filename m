Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: multipart/alternative;
 boundary="===============9128191683754032000=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Bhanuprakash Modem" <bhanuprakash.modem@intel.com>
Date: Fri, 25 Aug 2023 11:17:26 -0000
Message-ID: <169296224655.10952.355529690280738814@emeril.freedesktop.org>
References: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20230825082541.905799-1-bhanuprakash.modem@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_CI=2ExeBAT=3A_failure_for_Fix_Bigj?=
 =?utf-8?q?oiner_checks_=28rev9=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============9128191683754032000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix Bigjoiner checks (rev9)
URL   : https://patchwork.freedesktop.org/series/115712/
State : failure

== Summary ==

CI Bug Log - changes from XEIGT_7452_BAT -> XEIGTPW_9660_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with XEIGTPW_9660_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in XEIGTPW_9660_BAT, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in XEIGTPW_9660_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html

  
#### Warnings ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][3] ([Intel XE#275]) -> [SKIP][4] +3 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  
Known issues
------------

  Here are the changes found in XEIGTPW_9660_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - bat-dg2-oem2:       [PASS][5] -> [INCOMPLETE][6] ([Intel XE#543])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html

  
#### Warnings ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][7] ([Intel XE#277]) -> [SKIP][8] ([Intel XE#277] / [Intel XE#540]) +2 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  
  [Intel XE#275]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/275
  [Intel XE#277]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/277
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/543


Build changes
-------------

  * IGT: IGT_7452 -> IGTPW_9660

  IGTPW_9660: 9660
  IGT_7452: 7452
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5



--===============9128191683754032000==
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
<tr><td><b>Series:</b></td><td>Fix Bigjoiner checks (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/115712/">https://patchwork.freedesktop.org/series/115712/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

</table>


    <h1>CI Bug Log - changes from XEIGT_7452_BAT -&gt; XEIGTPW_9660_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with XEIGTPW_9660_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in XEIGTPW_9660_BAT, please notify your bug team to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in XEIGTPW_9660_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-dp-3.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/275">Intel XE#275</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 similar issues</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in XEIGTPW_9660_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@suspend-read-crc:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-dg2-oem2/igt@kms_pipe_crc_basic@suspend-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/543">Intel XE#543</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_force_connector_basic@force-connector-state:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGT_7452/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_9660/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/277">Intel XE#277</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +2 similar issues</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7452 -&gt; IGTPW_9660</li>
</ul>
<p>IGTPW_9660: 9660<br />
  IGT_7452: 7452<br />
  xe-340-c77796cf84361b4716839141f2e48de2bf7f4bd5: c77796cf84361b4716839141f2e48de2bf7f4bd5</p>

</body>
</html>

--===============9128191683754032000==--
