Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Zhang" <dingchen.zhang@amd.com>
Date: Tue, 05 Apr 2022 14:58:31 -0000
Message-ID: <164917071181.24159.13665014785635687829@emeril.freedesktop.org>
References: <20220405142434.40630-1-dingchen.zhang@amd.com>
In-Reply-To: <20220405142434.40630-1-dingchen.zhang@amd.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciBhZGQg?=
 =?utf-8?q?PSR-SU_FFU_test_case_w/_visual_confirm?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: igt-dev@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

== Series Details ==

Series: add PSR-SU FFU test case w/ visual confirm
URL   : https://patchwork.freedesktop.org/series/102199/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
cc359d5d2d3fc8be50340ba0379bacaf5c37bc5f intel-gpu-top: Add support for per client stats

  if ((expr)) igt_skip_check("!(" #expr ")" , NULL); \
       ^~~~
../tests/amdgpu/amd_psr.c:485:17: warning: nested extern declaration of ‘igt_amd_dm_has_visual_confirm’ [-Wnested-externs]
    igt_skip_on(!igt_amd_dm_has_visual_confirm(data.fd));
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1012:7: note: in definition of macro ‘igt_skip_on’
  if ((expr)) igt_skip_check("!(" #expr ")" , NULL); \
       ^~~~
../tests/amdgpu/amd_psr.c:486:19: error: implicit declaration of function ‘igt_amd_dm_set_visual_confirm’ [-Werror=implicit-function-declaration]
    igt_skip_on_f(!igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1062:7: note: in definition of macro ‘igt_skip_on_f’
  if ((expr)) igt_skip_check("!("#expr")", f); \
       ^~~~
../tests/amdgpu/amd_psr.c:486:19: warning: nested extern declaration of ‘igt_amd_dm_set_visual_confirm’ [-Wnested-externs]
    igt_skip_on_f(!igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1062:7: note: in definition of macro ‘igt_skip_on_f’
  if ((expr)) igt_skip_check("!("#expr")", f); \
       ^~~~
../tests/amdgpu/amd_psr.c:486:58: error: ‘VISUAL_CONFIRM_PSR’ undeclared (first use in this function)
    igt_skip_on_f(!igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
                                                          ^~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1062:7: note: in definition of macro ‘igt_skip_on_f’
  if ((expr)) igt_skip_check("!("#expr")", f); \
       ^~~~
../tests/amdgpu/amd_psr.c:486:58: note: each undeclared identifier is reported only once for each function it appears in
    igt_skip_on_f(!igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_PSR),
                                                          ^~~~~~~~~~~~~~~~~~
../lib/igt_core.h:1062:7: note: in definition of macro ‘igt_skip_on_f’
  if ((expr)) igt_skip_check("!("#expr")", f); \
       ^~~~
../tests/amdgpu/amd_psr.c:489:16: error: implicit declaration of function ‘igt_amd_dm_get_visual_confirm’ [-Werror=implicit-function-declaration]
    igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
  if (!(expr)) igt_skip_check(#expr , NULL); \
        ^~~~
../tests/amdgpu/amd_psr.c:489:16: warning: nested extern declaration of ‘igt_amd_dm_get_visual_confirm’ [-Wnested-externs]
    igt_require(igt_amd_dm_get_visual_confirm(data.fd) == VISUAL_CONFIRM_PSR);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_core.h:997:8: note: in definition of macro ‘igt_require’
  if (!(expr)) igt_skip_check(#expr , NULL); \
        ^~~~
../tests/amdgpu/amd_psr.c:510:43: error: ‘VISUAL_CONFIRM_DISABLE’ undeclared (first use in this function); did you mean ‘PIPEACONF_DISABLE’?
    igt_amd_dm_set_visual_confirm(data.fd, VISUAL_CONFIRM_DISABLE);
                                           ^~~~~~~~~~~~~~~~~~~~~~
                                           PIPEACONF_DISABLE
cc1: some warnings being treated as errors
ninja: build stopped: subcommand failed.

