Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 28 Jan 2020 09:00:25 -0000
Message-ID: <158020202560.20537.9570179163536528866@emeril.freedesktop.org>
References: <20200128081558.26688-1-krishnaiah.bommu@intel.com>
In-Reply-To: <20200128081558.26688-1-krishnaiah.bommu@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3IgdGVzdHMv?=
 =?utf-8?q?i915/gem=5Fctx=5Fpersistence=3A_Set_context_with_supported_engi?=
 =?utf-8?q?nes_=28rev4=29?=
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
To: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: tests/i915/gem_ctx_persistence: Set context with supported engines (rev4)
URL   : https://patchwork.freedesktop.org/series/71810/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_7828 -> IGTPW_4012
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in IGTPW_4012:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a:
    - {fi-kbl-7560u}:     NOTRUN -> [DMESG-WARN][1] +2 similar issues
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/fi-kbl-7560u/igt@kms_pipe_crc_basic@suspend-read-crc-pipe-a.html

  
Known issues
------------

  Here are the changes found in IGTPW_4012 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@gem_close_race@basic-threads:
    - fi-byt-n2820:       [PASS][2] -> [INCOMPLETE][3] ([i915#45])
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/fi-byt-n2820/igt@gem_close_race@basic-threads.html
   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/fi-byt-n2820/igt@gem_close_race@basic-threads.html

  * igt@i915_selftest@live_gem_contexts:
    - fi-skl-lmem:        [PASS][4] -> [INCOMPLETE][5] ([i915#424])
   [4]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html
   [5]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/fi-skl-lmem/igt@i915_selftest@live_gem_contexts.html

  
#### Possible fixes ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [FAIL][6] ([fdo#111096] / [i915#323]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_7828/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [7]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [fdo#111096]: https://bugs.freedesktop.org/show_bug.cgi?id=111096
  [i915#323]: https://gitlab.freedesktop.org/drm/intel/issues/323
  [i915#424]: https://gitlab.freedesktop.org/drm/intel/issues/424
  [i915#45]: https://gitlab.freedesktop.org/drm/intel/issues/45


Participating hosts (40 -> 39)
------------------------------

  Additional (7): fi-bsw-n3050 fi-cfl-8109u fi-bsw-kefka fi-kbl-7560u fi-bsw-nick fi-skl-6600u fi-snb-2600 
  Missing    (8): fi-hsw-peppy fi-skl-guc fi-byt-squawks fi-cfl-8700k fi-ctg-p8600 fi-blb-e6850 fi-byt-clapper fi-bdw-samus 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5390 -> IGTPW_4012

  CI-20190529: 20190529
  CI_DRM_7828: 0af593e4d6eb72946a292a3cb80516c35c442e50 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4012: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html
  IGT_5390: b5a4fcb43909a7d1f0e9f358ed5b5ba8f3a98482 @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4012/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
