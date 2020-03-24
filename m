Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Tue, 24 Mar 2020 19:20:38 -0000
Message-ID: <158507763877.5746.18119901039984779444@emeril.freedesktop.org>
References: <20200318004914.236815-1-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpipe=5Fcrc=5Fbasic?=
 =?utf-8?b?OiBVc2UgaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXRfb25fcGlwZSgpIChy?=
 =?utf-8?q?ev3=29?=
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
To: Lyude Paul <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev3)
URL   : https://patchwork.freedesktop.org/series/74808/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8183 -> IGTPW_4347
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html

Known issues
------------

  Here are the changes found in IGTPW_4347 that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@i915_selftest@live@gem_contexts:
    - fi-cfl-8700k:       [DMESG-FAIL][1] ([i915#481]) -> [DMESG-FAIL][2] ([i915#730] / [i915#933])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8183/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/fi-cfl-8700k/igt@i915_selftest@live@gem_contexts.html

  
  [i915#481]: https://gitlab.freedesktop.org/drm/intel/issues/481
  [i915#730]: https://gitlab.freedesktop.org/drm/intel/issues/730
  [i915#933]: https://gitlab.freedesktop.org/drm/intel/issues/933


Participating hosts (45 -> 39)
------------------------------

  Additional (5): fi-kbl-7560u fi-kbl-7500u fi-cfl-8109u fi-skl-lmem fi-blb-e6850 
  Missing    (11): fi-hsw-4200u fi-hsw-peppy fi-byt-squawks fi-bsw-cyan fi-ctg-p8600 fi-gdg-551 fi-ivb-3770 fi-bdw-samus fi-byt-clapper fi-bsw-nick fi-skl-6700k2 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5535 -> IGTPW_4347

  CI-20190529: 20190529
  CI_DRM_8183: 795894daf2cc32246af94541733e08649d082470 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4347: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html
  IGT_5535: d1dcf40cc6869ac858586c5ad9f09af6617ce2ee @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4347/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
