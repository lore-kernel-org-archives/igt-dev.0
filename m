Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Wed, 08 Apr 2020 22:13:06 -0000
Message-ID: <158638398665.19348.15892327930029935172@emeril.freedesktop.org>
References: <20200408201925.31566-1-jose.souza@intel.com>
In-Reply-To: <20200408201925.31566-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Ffbcon=5Ffbt=3A_Mak?=
 =?utf-8?q?e_FBC_wait=5Funtil=5Fupdate=28=29_more_reliable?=
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
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_fbcon_fbt: Make FBC wait_until_update() more reliable
URL   : https://patchwork.freedesktop.org/series/75701/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8280 -> IGTPW_4435
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4435 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4435, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4435:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - fi-bwr-2160:        NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/fi-bwr-2160/igt@runner@aborted.html

  
#### Warnings ####

  * igt@amdgpu/amd_prime@i915-to-amd:
    - fi-bwr-2160:        [SKIP][2] ([fdo#109271]) -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/fi-bwr-2160/igt@amdgpu/amd_prime@i915-to-amd.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/fi-bwr-2160/igt@amdgpu/amd_prime@i915-to-amd.html

  
Known issues
------------

  Here are the changes found in IGTPW_4435 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@dp-crc-fast:
    - fi-cml-u2:          [PASS][4] -> [FAIL][5] ([i915#262])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8280/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/fi-cml-u2/igt@kms_chamelium@dp-crc-fast.html

  
  [fdo#109271]: https://bugs.freedesktop.org/show_bug.cgi?id=109271
  [i915#262]: https://gitlab.freedesktop.org/drm/intel/issues/262


Participating hosts (53 -> 46)
------------------------------

  Missing    (7): fi-ilk-m540 fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-byt-clapper fi-bdw-samus fi-kbl-r 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5581 -> IGTPW_4435

  CI-20190529: 20190529
  CI_DRM_8280: b87cec89f6a2e5e65c54a39bef2336695138afc3 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4435: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/index.html
  IGT_5581: ab0620e555119ec55f12ba9ab9e6e9246d407648 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4435/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
