Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 16 Apr 2020 06:58:29 -0000
Message-ID: <158702030931.20886.14800683028521465266@emeril.freedesktop.org>
References: <20200416061014.16130-1-mika.kahola@intel.com>
In-Reply-To: <20200416061014.16130-1-mika.kahola@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?kms=5Fcursor=5Flegacy=3A_Wait_for_an_extra_vblank_=28rev4=29?=
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
To: Mika Kahola <mika.kahola@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/kms_cursor_legacy: Wait for an extra vblank (rev4)
URL   : https://patchwork.freedesktop.org/series/75413/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8307 -> IGTPW_4472
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4472:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@gem_wait@busy@all}:
    - fi-elk-e7500:       [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/fi-elk-e7500/igt@gem_wait@busy@all.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/fi-elk-e7500/igt@gem_wait@busy@all.html

  
Known issues
------------

  Here are the changes found in IGTPW_4472 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - fi-skl-6770hq:      [PASS][3] -> [FAIL][4] ([fdo#103375])
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/fi-skl-6770hq/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
#### Possible fixes ####

  * igt@i915_selftest@live@ring_submission:
    - fi-bwr-2160:        [INCOMPLETE][5] ([i915#489]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8307/fi-bwr-2160/igt@i915_selftest@live@ring_submission.html
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/fi-bwr-2160/igt@i915_selftest@live@ring_submission.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#103375]: https://bugs.freedesktop.org/show_bug.cgi?id=103375
  [i915#489]: https://gitlab.freedesktop.org/drm/intel/issues/489


Participating hosts (51 -> 46)
------------------------------

  Additional (1): fi-kbl-7560u 
  Missing    (6): fi-hsw-4200u fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5591 -> IGTPW_4472

  CI-20190529: 20190529
  CI_DRM_8307: 547ca85e9cbca6fcfcadc6bf5e0e7b9a34a089d8 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4472: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html
  IGT_5591: f57b7fdbe8d04ce3edf0433a03c7d9d5c3d96680 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4472/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
