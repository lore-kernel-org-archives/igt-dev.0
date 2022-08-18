Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mohammed Thasleem" <mohammed.thasleem@intel.com>
Date: Thu, 18 Aug 2022 09:17:19 -0000
Message-ID: <166081423950.16680.9235525656802056824@emeril.freedesktop.org>
References: <20220421145044.39871-1-mohammed.thasleem@intel.com>
In-Reply-To: <20220421145044.39871-1-mohammed.thasleem@intel.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Flease=3A_IGT_test_Cleanup?=
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

Series: tests/kms_lease: IGT test Cleanup
URL   : https://patchwork.freedesktop.org/series/107439/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
b5e2222c9a988015bdf237e6ebb9f5b6d87ac7e1 tools/intel_vbt_decode: Extract dp_vswing()/dp_preemph()

../tests/kms_lease.c: In function ‘cursor_implicit_plane’:
../tests/kms_lease.c:390:34: error: ‘data_t’ {aka ‘struct <anonymous>’} has no member named ‘output’
  cleanup_crtc(&data->master, data->output);
                                  ^~
In file included from ../lib/igt.h:38,
                 from ../tests/kms_lease.c:30:
../tests/kms_lease.c: In function ‘__igt_unique____real_main1149’:
../tests/kms_lease.c:1199:61: error: invalid type argument of ‘->’ (have ‘data_t’ {aka ‘struct <anonymous>’})
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
                                                             ^~
../lib/igt_kms.h:544:38: note: in definition of macro ‘for_each_if’
 #define for_each_if(condition) if (!(condition)) {} else
                                      ^~~~~~~~~
../tests/kms_lease.c:1199:5: note: in expansion of macro ‘for_each_pipe_with_valid_output’
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_lease.c:1199:61: error: invalid type argument of ‘->’ (have ‘data_t’ {aka ‘struct <anonymous>’})
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
                                                             ^~
../lib/igt_kms.h:544:38: note: in definition of macro ‘for_each_if’
 #define for_each_if(condition) if (!(condition)) {} else
                                      ^~~~~~~~~
../lib/igt_kms.h:604:7: note: in expansion of macro ‘igt_pipe_connector_valid’
       igt_pipe_connector_valid((pipe), (output))))
       ^~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_lease.c:1199:5: note: in expansion of macro ‘for_each_pipe_with_valid_output’
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_lease.c:1199:61: error: invalid type argument of ‘->’ (have ‘data_t’ {aka ‘struct <anonymous>’})
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
                                                             ^~
../lib/igt_kms.h:544:38: note: in definition of macro ‘for_each_if’
 #define for_each_if(condition) if (!(condition)) {} else
                                      ^~~~~~~~~
../lib/igt_kms.h:604:7: note: in expansion of macro ‘igt_pipe_connector_valid’
       igt_pipe_connector_valid((pipe), (output))))
       ^~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_lease.c:1199:5: note: in expansion of macro ‘for_each_pipe_with_valid_output’
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/igt_kms.h:603:57: warning: left-hand operand of comma expression has no effect [-Wunused-value]
    for_each_if ((((output) = &(display)->outputs[con__]), \
                                                         ^
../lib/igt_kms.h:544:38: note: in definition of macro ‘for_each_if’
 #define for_each_if(condition) if (!(condition)) {} else
                                      ^~~~~~~~~
../tests/kms_lease.c:1199:5: note: in expansion of macro ‘for_each_pipe_with_valid_output’
     for_each_pipe_with_valid_output(display, data.pipe, data->output) {
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ninja: build stopped: subcommand failed.

