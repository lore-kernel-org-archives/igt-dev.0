Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 14 Apr 2020 14:14:29 -0000
Message-ID: <158687366940.30379.1212807283170857030@emeril.freedesktop.org>
References: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200414081447.1451675-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/3=5D_test/kms=5Fchamelium=3A_Start_?=
 =?utf-8?q?with_disabling_modeset?=
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/3] test/kms_chamelium: Start with disabling modeset
URL   : https://patchwork.freedesktop.org/series/75910/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8294 -> IGTPW_4455
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/index.html

Known issues
------------

  Here are the changes found in IGTPW_4455 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@gt_contexts:
    - fi-bwr-2160:        [PASS][1] -> [DMESG-WARN][2] ([i915#1706])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8294/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/fi-bwr-2160/igt@i915_selftest@live@gt_contexts.html

  
  [i915#1706]: https://gitlab.freedesktop.org/drm/intel/issues/1706


Participating hosts (48 -> 43)
------------------------------

  Additional (1): fi-kbl-r 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-cfl-8700k fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5589 -> IGTPW_4455

  CI-20190529: 20190529
  CI_DRM_8294: b1631d3c1d7ff53437d9e67f740e2c6057de4fea @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4455: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/index.html
  IGT_5589: 31962324ac86f029e2841e56e97c42cf9d572956 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@vga-hpd-enable-disable-mode
+igt@kms_chamelium@vga-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4455/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
