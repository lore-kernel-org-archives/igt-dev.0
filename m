Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
Date: Thu, 12 Dec 2019 10:48:04 -0000
Message-ID: <157614768475.32008.8004542173184990220@emeril.freedesktop.org>
References: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
In-Reply-To: <20191212102924.1194130-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_i?=
 =?utf-8?q?915=3A_Rename_gem=5Fexec=5Fparse_and_gem=5Fexec=5Fparse=5Fblt?=
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: i915: Rename gem_exec_parse and gem_exec_parse_blt
URL   : https://patchwork.freedesktop.org/series/70819/
State : failure

== Summary ==

ERROR! This series introduces new undocumented tests:

gen7_exec_parse
gen7_exec_parse@basic-allocation
gen7_exec_parse@basic-allowed
gen7_exec_parse@basic-offset
gen7_exec_parse@basic-rejected
gen7_exec_parse@batch-without-end
gen7_exec_parse@bitmasks
gen7_exec_parse@chained-batch
gen7_exec_parse@cmd-crossing-page
gen7_exec_parse@load-register-reg
gen7_exec_parse@oacontrol-tracking
gen7_exec_parse@test-lri-OACONTROL
gen7_exec_parse@test-lri-OASTATUS2
gen7_exec_parse@test-lri-SO_WRITE_OFFSET_0
gen9_exec_parse
gen9_exec_parse@allowed-all
gen9_exec_parse@allowed-single
gen9_exec_parse@basic-rejected
gen9_exec_parse@basic-rejected-ctx-param
gen9_exec_parse@batch-invalid-length
gen9_exec_parse@batch-without-end
gen9_exec_parse@batch-zero-length
gen9_exec_parse@bb-chained
gen9_exec_parse@bb-secure
gen9_exec_parse@bb-start-cmd
gen9_exec_parse@bb-start-far
gen9_exec_parse@bb-start-out
gen9_exec_parse@bb-start-param
gen9_exec_parse@cmd-crossing-page
gen9_exec_parse@secure-batches
gen9_exec_parse@unaligned-access
gen9_exec_parse@unaligned-jump
gen9_exec_parse@valid-registers

Can you document them as per the requirement in the [CONTRIBUTING.md]?

[Documentation] has more details on how to do this.

Here are few examples:
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa46108296b27f3982ec93200c7a6e
https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b492ee17bf4f4d891029eb7a205d

Thanks in advance!

[CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blob/master/CONTRIBUTING.md#L19
[Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gpu-tools-Core.html#igt-describe

Other than that, pipeline status: SUCCESS.

see https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88063 for the overview.

== Logs ==

For more details see: https://gitlab.freedesktop.org/gfx-ci/igt-ci-tags/pipelines/88063
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
