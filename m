Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 28 May 2020 09:07:56 -0000
Message-ID: <159065687687.684.2918986060114837734@emeril.freedesktop.org>
References: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
In-Reply-To: <20200528082737.32284-1-dominik.grzegorzek@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgaTkxNS9n?=
 =?utf-8?q?em=5Fexec=5Ffence=3A_Reduce_non-preemptible_workload?=
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

Series: i915/gem_exec_fence: Reduce non-preemptible workload
URL   : https://patchwork.freedesktop.org/series/77735/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8545 -> IGTPW_4618
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html

Known issues
------------

  Here are the changes found in IGTPW_4618 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-kbl-7500u:       [PASS][1] -> [FAIL][2] ([i915#262])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/fi-kbl-7500u/igt@kms_chamelium@dp-crc-fast.html

  
#### Warnings ####

  * igt@i915_pm_rpm@basic-pci-d3-state:
    - fi-kbl-guc:         [SKIP][3] ([fdo#109271]) -> [FAIL][4] ([i915#138])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8545/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/fi-kbl-guc/igt@i915_pm_rpm@basic-pci-d3-state.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#138]: https://gitlab.freedesktop.org/drm/intel/issues/138
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (49 -> 43)
------------------------------

  Additional (2): fi-bdw-gvtdvm fi-cfl-8700k 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5681 -> IGTPW_4618

  CI-20190529: 20190529
  CI_DRM_8545: 76540f7be4ff04851e47d0865c2bb07a15106bcb @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4618: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html
  IGT_5681: 2991a5d60b1bbf2b2b6004669cd0f9471bd687a2 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4618/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
