Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 15:32:13 -0000
Message-ID: <158463193373.17932.11931681126904044616@emeril.freedesktop.org>
References: <20200319144453.1131507-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200319144453.1131507-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fvm=5Fcreate=3A_Update_of_active_VM_disallowed?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_vm_create: Update of active VM disallowed
URL   : https://patchwork.freedesktop.org/series/74878/
State : success

== Summary ==

CI Bug Log - changes from IGT_5523 -> IGTPW_4326
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html

Known issues
------------

  Here are the changes found in IGTPW_4326 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_pm_rpm@basic-rte:
    - fi-icl-dsi:         [PASS][1] -> [INCOMPLETE][2] ([i915#189])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-icl-dsi/igt@i915_pm_rpm@basic-rte.html

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [PASS][3] -> [DMESG-FAIL][4] ([i915#730] / [i915#933])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@execlists:
    - fi-bsw-nick:        [DMESG-FAIL][5] ([i915#1314]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-bsw-nick/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-bsw-nick/igt@i915_selftest@live@execlists.html
    - fi-skl-6700k2:      [INCOMPLETE][7] ([i915#1430] / [i915#656]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-skl-6700k2/igt@i915_selftest@live@execlists.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-skl-6700k2/igt@i915_selftest@live@execlists.html
    - fi-bxt-dsi:         [INCOMPLETE][9] ([fdo#103927] / [i915#656]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
    - {fi-kbl-7560u}:     [INCOMPLETE][11] ([fdo#112259] / [i915#1430] / [i915#656]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-kbl-7560u/igt@i915_selftest@live@execlists.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-kbl-7560u/igt@i915_selftest@live@execlists.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][13] ([fdo#111407]) -> [FAIL][14] ([i915#323])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5523/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112259]: https://bugs.freedesktop.org/show_bug.cgi?id=112259
  [i915#1314]: https://gitlab.freedesktop.org/drm/intel/issues/1314
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#189]: https://gitlab.freedesktop.org/drm/intel/issues/189
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (44 -> 41)
------------------------------

  Missing    (3): fi-byt-clapper fi-byt-squawks fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4326

  CI-20190529: 20190529
  CI_DRM_8159: 00b2e0f1e7b3ea36379d68855f46a86400935411 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4326: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4326/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
