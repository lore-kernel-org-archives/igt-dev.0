Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Mar 2020 09:47:21 -0000
Message-ID: <158400644139.4950.234093123234564451@emeril.freedesktop.org>
References: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200312090933.20001-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?gem=5Fexec=5Falignment=2Ec=3A_Update_subtests?=
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
To: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/gem_exec_alignment.c: Update subtests
URL   : https://patchwork.freedesktop.org/series/74633/
State : success

== Summary ==

CI Bug Log - changes from IGT_5506 -> IGTPW_4295
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html

Known issues
------------

  Here are the changes found in IGTPW_4295 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@active:
    - fi-bxt-dsi:         [DMESG-FAIL][1] ([i915#666]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-bxt-dsi/igt@i915_selftest@live@active.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/fi-bxt-dsi/igt@i915_selftest@live@active.html

  * igt@i915_selftest@live@execlists:
    - fi-skl-6770hq:      [INCOMPLETE][3] ([i915#1430]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-skl-6770hq/igt@i915_selftest@live@execlists.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/fi-skl-6770hq/igt@i915_selftest@live@execlists.html

  * igt@i915_selftest@live@gt_heartbeat:
    - fi-kbl-soraka:      [DMESG-FAIL][5] ([fdo#112406]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/fi-kbl-soraka/igt@i915_selftest@live@gt_heartbeat.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - {fi-kbl-7560u}:     [FAIL][7] ([i915#998]) -> [PASS][8] +5 similar issues
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-kbl-7560u/igt@kms_flip@basic-flip-vs-dpms.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/fi-kbl-7560u/igt@kms_flip@basic-flip-vs-dpms.html

  
#### Warnings ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][9] ([i915#323]) -> [FAIL][10] ([fdo#111407])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5506/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407
  [fdo#112406]: https://bugs.freedesktop.org/show_bug.cgi?id=112406
  [i915#1430]: https://gitlab.freedesktop.org/drm/intel/issues/1430
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#666]: https://gitlab.freedesktop.org/drm/intel/issues/666
  [i915#998]: https://gitlab.freedesktop.org/drm/intel/issues/998


Participating hosts (47 -> 43)
------------------------------

  Missing    (4): fi-byt-clapper fi-byt-squawks fi-bsw-cyan fi-hsw-4200u 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5506 -> IGTPW_4295

  CI-20190529: 20190529
  CI_DRM_8126: 2bd9e989a5653d4cd710e9dd2b42b0a080f1add8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4295: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html
  IGT_5506: 59fd8a0d01dac58dc6c7d86ef391ed4393ab5aae @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_alignment@pi

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4295/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
