Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Jan 2020 10:43:58 -0000
Message-ID: <157977623864.1146.3509132984741382263@emeril.freedesktop.org>
References: <20200123091824.29850-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200123091824.29850-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev4=29?=
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
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev4)
URL   : https://patchwork.freedesktop.org/series/72334/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_7800 -> IGTPW_3975
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_3975 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_3975, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_3975:

### IGT changes ###

#### Possible regressions ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-n2820:       NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/fi-byt-n2820/igt@gem_exec_parallel@contexts.html

  
Known issues
------------

  Here are the changes found in IGTPW_3975 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-j1900:       [PASS][2] -> [INCOMPLETE][3] ([i915#45])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7800/fi-byt-j1900/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/fi-byt-j1900/igt@gem_close_race@basic-threads.html

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-lmem:        [PASS][4] -> [DMESG-WARN][5] ([i915#889])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7800/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/fi-skl-lmem/igt@i915_module_load@reload-with-fault-injection.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-crc-fast:
    - fi-icl-u2:          [FAIL][6] ([fdo#109635]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7800/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/fi-icl-u2/igt@kms_chamelium@hdmi-crc-fast.html

  
#### Warnings ####

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][8] ([i915#563]) -> [DMESG-FAIL][9] ([i915#553] / [i915#725])
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7800/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  
  [fdo#109635]: https://bugs.freedesktop.org/show_bug.cgi?id=109635
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#553]: https://gitlab.freedesktop.org/drm/intel/issues/553
  [i915#563]: https://gitlab.freedesktop.org/drm/intel/issues/563
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#889]: https://gitlab.freedesktop.org/drm/intel/issues/889


Participating hosts (50 -> 45)
------------------------------

  Additional (2): fi-byt-n2820 fi-elk-e7500 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5378 -> IGTPW_3975

  CI-20190529: 20190529
  CI_DRM_7800: f19910d19e19a35d567ac19939297cfd047fa976 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3975: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/index.html
  IGT_5378: 93bc97385ae25b112c34b11748a2b55fbfb0e87b @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@gem_exec_nop@poll
+igt@gem_exec_nop@preempt
+igt@gem_exec_nop@signal
+igt@gem_exec_nop@single
-igt@gem_exec_nop@blt
-igt@gem_exec_nop@bsd
-igt@gem_exec_nop@bsd1
-igt@gem_exec_nop@bsd2
-igt@gem_exec_nop@default
-igt@gem_exec_nop@poll-blt
-igt@gem_exec_nop@poll-bsd
-igt@gem_exec_nop@poll-bsd1
-igt@gem_exec_nop@poll-bsd2
-igt@gem_exec_nop@poll-default
-igt@gem_exec_nop@poll-render
-igt@gem_exec_nop@poll-vebox
-igt@gem_exec_nop@preempt-blt
-igt@gem_exec_nop@preempt-bsd
-igt@gem_exec_nop@preempt-bsd1
-igt@gem_exec_nop@preempt-bsd2
-igt@gem_exec_nop@preempt-default
-igt@gem_exec_nop@preempt-render
-igt@gem_exec_nop@preempt-vebox
-igt@gem_exec_nop@render
-igt@gem_exec_nop@signal-blt
-igt@gem_exec_nop@signal-bsd
-igt@gem_exec_nop@signal-bsd1
-igt@gem_exec_nop@signal-bsd2
-igt@gem_exec_nop@signal-default
-igt@gem_exec_nop@signal-render
-igt@gem_exec_nop@signal-vebox
-igt@gem_exec_nop@vebox

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3975/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
