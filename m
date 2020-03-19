Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 19 Mar 2020 20:04:44 -0000
Message-ID: <158464828439.17935.5164899994929919390@emeril.freedesktop.org>
References: <20200319193644.7417-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20200319193644.7417-1-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_t?=
 =?utf-8?q?ests/kms=5Fbig=5Ffb=3A_Add_max_HW_stride_length_tests_=28rev2?=
 =?utf-8?q?=29?=
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

Series: tests/kms_big_fb: Add max HW stride length tests (rev2)
URL   : https://patchwork.freedesktop.org/series/74883/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

kms_big_fb@linear-max-hw-stride-32bpp-rotate-0
kms_big_fb@linear-max-hw-stride-32bpp-rotate-180
kms_big_fb@linear-max-hw-stride-64bpp-rotate-0
kms_big_fb@linear-max-hw-stride-64bpp-rotate-180
kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0
kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180
kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0
kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180
kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0
kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0
kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0
kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0
kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/121928 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/121928
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
