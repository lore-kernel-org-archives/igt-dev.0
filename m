Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 06 Feb 2020 15:58:45 -0000
Message-ID: <158100472550.15031.204344632921757565@emeril.freedesktop.org>
References: <20200206020944.338033-1-jose.souza@intel.com>
In-Reply-To: <20200206020944.338033-1-jose.souza@intel.com>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_s?=
 =?utf-8?q?eries_starting_with_=5Bi-g-t=2C1/4=5D_tests/kms=5Ffrontbuffer?=
 =?utf-8?q?=5Ftracking=3A_Add_tiling_to_test=5Fmode?=
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

Series: series starting with [i-g-t,1/4] tests/kms_frontbuffer_tracking: Add tiling to test_mode
URL   : https://patchwork.freedesktop.org/series/73071/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

kms_frontbuffer_tracking@fbc-tiling-linear
kms_frontbuffer_tracking@fbc-tiling-x
kms_frontbuffer_tracking@fbc-tiling-y
kms_frontbuffer_tracking@fbcdrrs-tiling-linear
kms_frontbuffer_tracking@fbcdrrs-tiling-x
kms_frontbuffer_tracking@fbcdrrs-tiling-y
kms_frontbuffer_tracking@fbcpsr-tiling-linear
kms_frontbuffer_tracking@fbcpsr-tiling-x
kms_frontbuffer_tracking@fbcpsr-tiling-y
kms_frontbuffer_tracking@fbcpsrdrrs-tiling-linear
kms_frontbuffer_tracking@fbcpsrdrrs-tiling-x
kms_frontbuffer_tracking@fbcpsrdrrs-tiling-y

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/105425 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/105425
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
