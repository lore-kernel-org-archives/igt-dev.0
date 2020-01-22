Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 22 Jan 2020 11:32:59 -0000
Message-ID: <157969277910.22393.12451940793757112112@emeril.freedesktop.org>
References: <20200122104710.10971-1-arjun.melkaveri@intel.com>
In-Reply-To: <20200122104710.10971-1-arjun.melkaveri@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Fnop=3AAdjusted_test_to_utilize_all_available_engine?=
 =?utf-8?q?s_=28rev2=29?=
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

Series: i915/gem_exec_nop:Adjusted test to utilize all available engines (rev2)
URL   : https://patchwork.freedesktop.org/series/72334/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7789 -> IGTPW_3965
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html

Known issues
------------

  Here are the changes found in IGTPW_3965 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_module_load@reload-with-fault-injection:
    - fi-skl-6700k2:      [PASS][1] -> [INCOMPLETE][2] ([i915#671])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-skl-6700k2/igt@i915_module_load@reload-with-fault-injection.html
    - fi-kbl-7500u:       [PASS][3] -> [INCOMPLETE][4] ([i915#879])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-kbl-7500u/igt@i915_module_load@reload-with-fault-injection.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-icl-u2:          [PASS][5] -> [DMESG-WARN][6] ([IGT#4] / [i915#263])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-icl-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
#### Possible fixes ####

  * igt@i915_selftest@live_blt:
    - fi-ivb-3770:        [DMESG-FAIL][7] ([i915#725]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-ivb-3770/igt@i915_selftest@live_blt.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-ivb-3770/igt@i915_selftest@live_blt.html

  
#### Warnings ####

  * igt@gem_exec_parallel@contexts:
    - fi-byt-j1900:       [INCOMPLETE][9] ([i915#45]) -> [TIMEOUT][10] ([fdo#112271])
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-byt-j1900/igt@gem_exec_parallel@contexts.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-byt-j1900/igt@gem_exec_parallel@contexts.html

  * igt@i915_selftest@live_blt:
    - fi-hsw-4770r:       [DMESG-FAIL][11] ([i915#725]) -> [DMESG-FAIL][12] ([i915#770])
   [11]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-hsw-4770r/igt@i915_selftest@live_blt.html
   [12]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-hsw-4770r/igt@i915_selftest@live_blt.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-cfl-8700k:       [INCOMPLETE][13] ([i915#424]) -> [DMESG-FAIL][14] ([i915#623])
   [13]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7789/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html
   [14]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/fi-cfl-8700k/igt@i915_selftest@live_gem_contexts.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#112271]: https://bugs.freedesktop.org/show_bug.cgi?id=112271
  [i915#263]: https://gitlab.freedesktop.org/drm/intel/issues/263
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45
  [i915#623]: https://gitlab.freedesktop.org/drm/intel/issues/623
  [i915#671]: https://gitlab.freedesktop.org/drm/intel/issues/671
  [i915#725]: https://gitlab.freedesktop.org/drm/intel/issues/725
  [i915#770]: https://gitlab.freedesktop.org/drm/intel/issues/770
  [i915#879]: https://gitlab.freedesktop.org/drm/intel/issues/879


Participating hosts (45 -> 40)
------------------------------

  Additional (2): fi-hsw-peppy fi-kbl-x1275 
  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5377 -> IGTPW_3965

  CI-20190529: 20190529
  CI_DRM_7789: ad538420f468637d707bae774a858da3592d823f @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_3965: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html
  IGT_5377: 1e6cb3e75925cf623df04f78430ae9299632ec3f @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



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

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_3965/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
