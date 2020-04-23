Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 23 Apr 2020 10:27:54 -0000
Message-ID: <158763767474.26748.7852120584445593950@emeril.freedesktop.org>
References: <20200422230151.29558-1-kunal1.joshi@intel.com>
In-Reply-To: <20200422230151.29558-1-kunal1.joshi@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fchamelium=3A_Capture_on_type-c_=28rev4=29?=
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
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_chamelium: Capture on type-c (rev4)
URL   : https://patchwork.freedesktop.org/series/76004/
State : failure

== Summary ==

CI Bug Log - changes from CI_DRM_8351 -> IGTPW_4502
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with IGTPW_4502 absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in IGTPW_4502, please notify your bug team to allow them
  to document this new failure mode, which will reduce false positives in CI.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4502:

### IGT changes ###

#### Possible regressions ####

  * igt@i915_selftest@live@execlists:
    - fi-cml-u2:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8351/fi-cml-u2/igt@i915_selftest@live@execlists.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/fi-cml-u2/igt@i915_selftest@live@execlists.html

  * igt@kms_chamelium@dp-frame-dump:
    - fi-icl-u2:          NOTRUN -> [FAIL][3] +2 similar issues
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/fi-icl-u2/igt@kms_chamelium@dp-frame-dump.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_chamelium@hdmi-hpd-with-enabled-mode}:
    - fi-kbl-7500u:       NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-with-enabled-mode.html

  
Known issues
------------

  Here are the changes found in IGTPW_4502 that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@i915_selftest@live@gt_timelines:
    - fi-bwr-2160:        [INCOMPLETE][5] ([i915#489]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8351/fi-bwr-2160/igt@i915_selftest@live@gt_timelines.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/fi-bwr-2160/igt@i915_selftest@live@gt_timelines.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (50 -> 44)
------------------------------

  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5608 -> IGTPW_4502

  CI-20190529: 20190529
  CI_DRM_8351: 63580ab8ee4dc3b1b824be6637085ac6b2c8ba6d @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4502: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/index.html
  IGT_5608: e7bcaf1dd251d454706c7cd64282f531aec50183 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4502/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
