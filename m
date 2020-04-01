Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 01 Apr 2020 17:04:41 -0000
Message-ID: <158576068141.25625.10896022836976201379@emeril.freedesktop.org>
References: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
In-Reply-To: <20200331123857.1212432-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgQ2hhbWVs?=
 =?utf-8?q?ium_and_TypeC_=28rev2=29?=
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

Series: Chamelium and TypeC (rev2)
URL   : https://patchwork.freedesktop.org/series/75319/
State : success

== Summary ==

CI Bug Log - changes from IGT_5554 -> IGTPW_4392
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with IGTPW_4392 need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4392, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4392:

### IGT changes ###

#### Warnings ####

  * igt@kms_chamelium@hdmi-edid-read:
    - fi-kbl-8809g:       [SKIP][1] ([fdo#109271]) -> [FAIL][2] +27 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/fi-kbl-8809g/igt@kms_chamelium@hdmi-edid-read.html

  * igt@prime_vgem@basic-fence-flip:
    - fi-kbl-8809g:       [SKIP][3] ([fdo#109271]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/fi-kbl-8809g/igt@prime_vgem@basic-fence-flip.html

  
Known issues
------------

  Here are the changes found in IGTPW_4392 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@execlists:
    - fi-bxt-dsi:         [PASS][5] -> [INCOMPLETE][6] ([i915#656])
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-bxt-dsi/igt@i915_selftest@live@execlists.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/fi-bxt-dsi/igt@i915_selftest@live@execlists.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@hangcheck:
    - fi-icl-dsi:         [INCOMPLETE][7] ([i915#1580]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html
   [8]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/fi-icl-dsi/igt@i915_selftest@live@hangcheck.html

  * igt@kms_chamelium@common-hpd-after-suspend:
    - fi-cml-u2:          [DMESG-WARN][9] ([IGT#4]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_5554/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/fi-cml-u2/igt@kms_chamelium@common-hpd-after-suspend.html

  
  [IGT#4]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/4
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#1580]: https://gitlab.freedesktop.org/drm/intel/issues/1580
  [i915#656]: https://gitlab.freedesktop.org/drm/intel/issues/656


Participating hosts (49 -> 43)
------------------------------

  Additional (2): fi-skl-guc fi-bwr-2160 
  Missing    (8): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-kbl-7560u fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5554 -> IGTPW_4392

  CI-20190529: 20190529
  CI_DRM_8233: 0862243a5514a9da625520bd4f554f8348077594 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4392: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html
  IGT_5554: f3ba9eca8b0a1c0074bd43b0ee5dbebe833f5f09 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_chamelium@dp-hpd-enable-disable-mode
+igt@kms_chamelium@dp-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-enable-disable-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode
+igt@kms_chamelium@hdmi-hpd-with-enabled-mode

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4392/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
