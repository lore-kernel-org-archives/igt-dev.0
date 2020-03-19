Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 18:06:47 -0000
Message-ID: <158464120750.17932.11457429769359072748@emeril.freedesktop.org>
References: <20200318004914.236815-1-lyude@redhat.com>
In-Reply-To: <20200318004914.236815-1-lyude@redhat.com>
Subject: [igt-dev] =?utf-8?b?4pyTIEZpLkNJLkJBVDogc3VjY2VzcyBmb3Igc2VyaWVz?=
 =?utf-8?q?_starting_with_=5Bi-g-t=2C1/2=5D_tests/kms=5Fpipe=5Fcrc=5Fbasic?=
 =?utf-8?b?OiBVc2UgaWd0X2Rpc3BsYXlfcmVxdWlyZV9vdXRwdXRfb25fcGlwZSgpIChy?=
 =?utf-8?q?ev2=29?=
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
To: Lyude <lyude@redhat.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: series starting with [i-g-t,1/2] tests/kms_pipe_crc_basic: Use igt_display_require_output_on_pipe() (rev2)
URL   : https://patchwork.freedesktop.org/series/74808/
State : success

== Summary ==

CI Bug Log - changes from CI_DRM_8160 -> IGTPW_4327
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html

Known issues
------------

  Here are the changes found in IGTPW_4327 that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_chamelium@hdmi-hpd-fast:
    - fi-kbl-7500u:       [PASS][1] -> [FAIL][2] ([fdo#111407])
   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_8160/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html
   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/fi-kbl-7500u/igt@kms_chamelium@hdmi-hpd-fast.html

  
  [fdo#111407]: https://bugs.freedesktop.org/show_bug.cgi?id=111407


Participating hosts (37 -> 40)
------------------------------

  Additional (7): fi-bsw-n3050 fi-byt-j1900 fi-cfl-8109u fi-skl-6700k2 fi-kbl-7560u fi-bsw-nick fi-skl-6600u 
  Missing    (4): fi-bsw-kefka fi-byt-clapper fi-byt-squawks fi-bsw-cyan 


Build changes
-------------

  * CI: CI-20190529 -> None
  * IGT: IGT_5523 -> IGTPW_4327

  CI-20190529: 20190529
  CI_DRM_8160: 6ba1729e5025761ab74914f6b8aa3288f493e9c7 @ git://anongit.freedesktop.org/gfx-ci/linux
  IGTPW_4327: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html
  IGT_5523: cf6d524007ac51a7d5a48503ea3dd5f01fd4ebab @ git://anongit.freedesktop.org/xorg/app/intel-gpu-tools



== Testlist changes ==

+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-a
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-b
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-c
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-d
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-e
+igt@kms_pipe_crc_basic@disable-crc-after-crtc-pipe-f

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_4327/index.html
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
