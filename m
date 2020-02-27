Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 27 Feb 2020 15:02:02 -0000
Message-ID: <158281572248.29658.17165026725393462854@emeril.freedesktop.org>
References: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1582810023-28424-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Frotation=5Fcrc=3A_remove_redundant_work?=
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_rotation_crc: remove redundant work
URL   : https://patchwork.freedesktop.org/series/74020/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8018 -> IGTPW_4235
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4235:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@runner@aborted:
    - {fi-tgl-u}:         NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/fi-tgl-u/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in IGTPW_4235 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@i915_selftest@live@perf:
    - fi-apl-guc:         [PASS][2] -> [INCOMPLETE][3] ([fdo#103927])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/fi-apl-guc/igt@i915_selftest@live@perf.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/fi-apl-guc/igt@i915_selftest@live@perf.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][4] ([fdo#111096] / [i915#323]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8018/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103927]: https://bugs.freedesktop.org/show_bug.cgi?id=103927
  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#1233]: https://gitlab.freedesktop.org/drm/intel/issues/1233
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323


Participating hosts (49 -> 45)
------------------------------

  Additional (2): fi-kbl-7560u fi-byt-n2820 
  Missing    (6): fi-ilk-m540 fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-tgl-y fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5473 -> IGTPW_4235

  CI-20190529: 20190529
  CI_DRM_8018: d2d7fd43fafd159b7d9d957340e4ed9775ab20b0 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4235: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html
  IGT_5473: d22b3507ff2678a05d69d47c0ddf6f0e72ee7ffd @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4235/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
