Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rohith Iyer" <quic_rohiiyer@quicinc.com>
Date: Thu, 23 Jun 2022 01:04:52 -0000
Message-ID: <165594629223.17070.9026875670182081062@emeril.freedesktop.org>
References: <20220623004522.23997-1-quic_rohiiyer@quicinc.com>
In-Reply-To: <20220623004522.23997-1-quic_rohiiyer@quicinc.com>
Subject: [igt-dev] =?utf-8?b?4pyXIEZpLkNJLkJVSUxEOiBmYWlsdXJlIGZvciB0ZXN0?=
 =?utf-8?q?s/kms=5Fwriteback=3A_Enhance_kms=5Fwriteback_for_custom_modes?=
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

Series: tests/kms_writeback: Enhance kms_writeback for custom modes
URL   : https://patchwork.freedesktop.org/series/105522/
State : failure

== Summary ==

IGT patchset build failed on latest successful build
02153f109bd422d93cfce7f5aa9d7b0e22fab13c tests/kms_panel_fitting: Convert test to dynamic

    &data.user_mode.hskew, &data.user_mode.vdisplay,
                           ~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_writeback.c:430:47: warning: format ‘%u’ expects argument of type ‘unsigned int *’, but argument 10 has type ‘uint16_t *’ {aka ‘short unsigned int *’} [-Wformat=]
  return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
                                              ~^
                                              %hu
../tests/kms_writeback.c:434:4:
    &data.user_mode.vsync_start, &data.user_mode.vsync_end,
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~                 
../tests/kms_writeback.c:430:50: warning: format ‘%u’ expects argument of type ‘unsigned int *’, but argument 11 has type ‘uint16_t *’ {aka ‘short unsigned int *’} [-Wformat=]
  return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
                                                 ~^
                                                 %hu
../tests/kms_writeback.c:434:33:
    &data.user_mode.vsync_start, &data.user_mode.vsync_end,
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~
../tests/kms_writeback.c:430:53: warning: format ‘%u’ expects argument of type ‘unsigned int *’, but argument 12 has type ‘uint16_t *’ {aka ‘short unsigned int *’} [-Wformat=]
  return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
                                                    ~^
                                                    %hu
../tests/kms_writeback.c:435:4:
    &data.user_mode.vtotal, &data.user_mode.vscan,
    ~~~~~~~~~~~~~~~~~~~~~~                            
../tests/kms_writeback.c:430:56: warning: format ‘%u’ expects argument of type ‘unsigned int *’, but argument 13 has type ‘uint16_t *’ {aka ‘short unsigned int *’} [-Wformat=]
  return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
                                                       ~^
                                                       %hu
../tests/kms_writeback.c:435:28:
    &data.user_mode.vtotal, &data.user_mode.vscan,
                            ~~~~~~~~~~~~~~~~~~~~~        
../tests/kms_writeback.c:430:68: warning: format ‘%s’ expects argument of type ‘char *’, but argument 17 has type ‘char (*)[32]’ [-Wformat=]
  return sscanf(optarg, "%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%u:%s", &data.user_mode.clock,
                                                                   ~^
../tests/kms_writeback.c:437:27:
    &data.user_mode.flags, &data.user_mode.name);
                           ~~~~~~~~~~~~~~~~~~~~                      
../tests/kms_writeback.c: In function ‘__igt_unique____real_main479’:
../tests/kms_writeback.c:531:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   drmModePropertyBlobRes *formats_blob = get_writeback_formats_blob(output);
   ^~~~~~~~~~~~~~~~~~~~~~
../tests/kms_writeback.c:553:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   igt_fb_t invalid_output_fb;
   ^~~~~~~~
../tests/kms_writeback.c:569:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   igt_fb_t output_fb;
   ^~~~~~~~
../tests/kms_writeback.c:584:3: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
   igt_fb_t output_fb;
   ^~~~~~~~
ninja: build stopped: subcommand failed.

