Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Date: Fri, 25 Aug 2023 17:32:04 +0530
Message-Id: <20230825120205.802246-1-aravind.iddamsetty@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC i-g-t v2 0/1] A tool to demonstrate use of netlink
 sockets to read RAS error counters
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Oded Gabbay <ogabbay@kernel.org>, igt-dev@lists.freedesktop.org,
 Tomer Tayar <ttayar@habana.ai>, Daniel Vetter <daniel@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This tool is to demonstrate the use of netlink sockets to read RAS error
counters, which is being proposed via series
"[RFC v2 0/5] Proposal to use netlink for RAS and Telemetry across drm subsystem".

The tool supports the following commands:
READ_ONE, READ_ALL, WAIT_ON_EVENT, LIST_ERRORS

read single error counter:

$ ./drm_ras READ_ONE --device=drm:/dev/dri/card1 --error_id=0x0000000000000005
counter value 0

read all error counters:

$ ./drm_ras READ_ALL --device=drm:/dev/dri/card1
name                                                    config-id               counter

error-gt0-correctable-guc                               0x0000000000000001      0
error-gt0-correctable-slm                               0x0000000000000003      0
error-gt0-correctable-eu-ic                             0x0000000000000004      0
error-gt0-correctable-eu-grf                            0x0000000000000005      0
error-gt0-fatal-guc                                     0x0000000000000009      0
error-gt0-fatal-slm                                     0x000000000000000d      0
error-gt0-fatal-eu-grf                                  0x000000000000000f      0
error-gt0-fatal-fpu                                     0x0000000000000010      0
error-gt0-fatal-tlb                                     0x0000000000000011      0
error-gt0-fatal-l3-fabric                               0x0000000000000012      0
error-gt0-correctable-subslice                          0x0000000000000013      0
error-gt0-correctable-l3bank                            0x0000000000000014      0
error-gt0-fatal-subslice                                0x0000000000000015      0
error-gt0-fatal-l3bank                                  0x0000000000000016      0
error-gt0-sgunit-correctable                            0x0000000000000017      0
error-gt0-sgunit-nonfatal                               0x0000000000000018      0
error-gt0-sgunit-fatal                                  0x0000000000000019      0
error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a      0
error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b      0
error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c      0
error-gt0-soc-fatal-punit                               0x000000000000001d      0
error-gt0-soc-fatal-psf-0                               0x000000000000001e      0
error-gt0-soc-fatal-psf-1                               0x000000000000001f      0
error-gt0-soc-fatal-psf-2                               0x0000000000000020      0
error-gt0-soc-fatal-cd0                                 0x0000000000000021      0
error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022      0
error-gt0-soc-fatal-mdfi-east                           0x0000000000000023      0
error-gt0-soc-fatal-mdfi-south                          0x0000000000000024      0
error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025      0
error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026      0
error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027      0
error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028      0
error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029      0
error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a      0
error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b      0
error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c      0
error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d      0
error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e      0
error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f      0
error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030      0
error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031      0
error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032      0
error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033      0
error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034      0
error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035      0
error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036      0
error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037      0
error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038      0
error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039      0
error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a      0
error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b      0
error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c      0
error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d      0
error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e      0
error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f      0
error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040      0
error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041      0
error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042      0
error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043      0
error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044      0
error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045      0
error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046      0
error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047      0
error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048      0
error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049      0
error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a      0
error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b      0
error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c      0
error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d      0
error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e      0
error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f      0
error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050      0
error-gt1-correctable-guc                               0x1000000000000001      0
error-gt1-correctable-slm                               0x1000000000000003      0
error-gt1-correctable-eu-ic                             0x1000000000000004      0
error-gt1-correctable-eu-grf                            0x1000000000000005      0
error-gt1-fatal-guc                                     0x1000000000000009      0
error-gt1-fatal-slm                                     0x100000000000000d      0
error-gt1-fatal-eu-grf                                  0x100000000000000f      0
error-gt1-fatal-fpu                                     0x1000000000000010      0
error-gt1-fatal-tlb                                     0x1000000000000011      0
error-gt1-fatal-l3-fabric                               0x1000000000000012      0
error-gt1-correctable-subslice                          0x1000000000000013      0
error-gt1-correctable-l3bank                            0x1000000000000014      0
error-gt1-fatal-subslice                                0x1000000000000015      0
error-gt1-fatal-l3bank                                  0x1000000000000016      0
error-gt1-sgunit-correctable                            0x1000000000000017      0
error-gt1-sgunit-nonfatal                               0x1000000000000018      0
error-gt1-sgunit-fatal                                  0x1000000000000019      0
error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a      0
error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b      0
error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c      0
error-gt1-soc-fatal-punit                               0x100000000000001d      0
error-gt1-soc-fatal-psf-0                               0x100000000000001e      0
error-gt1-soc-fatal-psf-1                               0x100000000000001f      0
error-gt1-soc-fatal-psf-2                               0x1000000000000020      0
error-gt1-soc-fatal-cd0                                 0x1000000000000021      0
error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022      0
error-gt1-soc-fatal-mdfi-east                           0x1000000000000023      0
error-gt1-soc-fatal-mdfi-south                          0x1000000000000024      0
error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025      0
error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026      0
error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027      0
error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028      0
error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029      0
error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a      0
error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b      0
error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c      0
error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d      0
error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e      0
error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f      0
error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030      0
error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031      0
error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032      0
error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033      0
error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034      0
error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035      0
error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036      0
error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037      0
error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038      0
error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039      0
error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a      0
error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b      0
error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c      0
error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d      0
error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e      0
error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f      0
error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040      0
error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041      0
error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042      0
error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043      0
error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044      0

wait on a error event:

$ ./drm_ras WAIT_ON_EVENT --device=drm:/dev/dri/card1
waiting for error event
error event received
counter value 0

list all errors:

$ ./drm_ras LIST_ERRORS --device=drm:/dev/dri/card1
name                                                    config-id

error-gt0-correctable-guc                               0x0000000000000001
error-gt0-correctable-slm                               0x0000000000000003
error-gt0-correctable-eu-ic                             0x0000000000000004
error-gt0-correctable-eu-grf                            0x0000000000000005
error-gt0-fatal-guc                                     0x0000000000000009
error-gt0-fatal-slm                                     0x000000000000000d
error-gt0-fatal-eu-grf                                  0x000000000000000f
error-gt0-fatal-fpu                                     0x0000000000000010
error-gt0-fatal-tlb                                     0x0000000000000011
error-gt0-fatal-l3-fabric                               0x0000000000000012
error-gt0-correctable-subslice                          0x0000000000000013
error-gt0-correctable-l3bank                            0x0000000000000014
error-gt0-fatal-subslice                                0x0000000000000015
error-gt0-fatal-l3bank                                  0x0000000000000016
error-gt0-sgunit-correctable                            0x0000000000000017
error-gt0-sgunit-nonfatal                               0x0000000000000018
error-gt0-sgunit-fatal                                  0x0000000000000019
error-gt0-soc-fatal-psf-csc-0                           0x000000000000001a
error-gt0-soc-fatal-psf-csc-1                           0x000000000000001b
error-gt0-soc-fatal-psf-csc-2                           0x000000000000001c
error-gt0-soc-fatal-punit                               0x000000000000001d
error-gt0-soc-fatal-psf-0                               0x000000000000001e
error-gt0-soc-fatal-psf-1                               0x000000000000001f
error-gt0-soc-fatal-psf-2                               0x0000000000000020
error-gt0-soc-fatal-cd0                                 0x0000000000000021
error-gt0-soc-fatal-cd0-mdfi                            0x0000000000000022
error-gt0-soc-fatal-mdfi-east                           0x0000000000000023
error-gt0-soc-fatal-mdfi-south                          0x0000000000000024
error-gt0-soc-fatal-hbm-ss0-0                           0x0000000000000025
error-gt0-soc-fatal-hbm-ss0-1                           0x0000000000000026
error-gt0-soc-fatal-hbm-ss0-2                           0x0000000000000027
error-gt0-soc-fatal-hbm-ss0-3                           0x0000000000000028
error-gt0-soc-fatal-hbm-ss0-4                           0x0000000000000029
error-gt0-soc-fatal-hbm-ss0-5                           0x000000000000002a
error-gt0-soc-fatal-hbm-ss0-6                           0x000000000000002b
error-gt0-soc-fatal-hbm-ss0-7                           0x000000000000002c
error-gt0-soc-fatal-hbm-ss1-0                           0x000000000000002d
error-gt0-soc-fatal-hbm-ss1-1                           0x000000000000002e
error-gt0-soc-fatal-hbm-ss1-2                           0x000000000000002f
error-gt0-soc-fatal-hbm-ss1-3                           0x0000000000000030
error-gt0-soc-fatal-hbm-ss1-4                           0x0000000000000031
error-gt0-soc-fatal-hbm-ss1-5                           0x0000000000000032
error-gt0-soc-fatal-hbm-ss1-6                           0x0000000000000033
error-gt0-soc-fatal-hbm-ss1-7                           0x0000000000000034
error-gt0-soc-fatal-hbm-ss2-0                           0x0000000000000035
error-gt0-soc-fatal-hbm-ss2-1                           0x0000000000000036
error-gt0-soc-fatal-hbm-ss2-2                           0x0000000000000037
error-gt0-soc-fatal-hbm-ss2-3                           0x0000000000000038
error-gt0-soc-fatal-hbm-ss2-4                           0x0000000000000039
error-gt0-soc-fatal-hbm-ss2-5                           0x000000000000003a
error-gt0-soc-fatal-hbm-ss2-6                           0x000000000000003b
error-gt0-soc-fatal-hbm-ss2-7                           0x000000000000003c
error-gt0-soc-fatal-hbm-ss3-0                           0x000000000000003d
error-gt0-soc-fatal-hbm-ss3-1                           0x000000000000003e
error-gt0-soc-fatal-hbm-ss3-2                           0x000000000000003f
error-gt0-soc-fatal-hbm-ss3-3                           0x0000000000000040
error-gt0-soc-fatal-hbm-ss3-4                           0x0000000000000041
error-gt0-soc-fatal-hbm-ss3-5                           0x0000000000000042
error-gt0-soc-fatal-hbm-ss3-6                           0x0000000000000043
error-gt0-soc-fatal-hbm-ss3-7                           0x0000000000000044
error-gt0-gsc-correctable-sram-ecc                      0x0000000000000045
error-gt0-gsc-nonfatal-mia-shutdown                     0x0000000000000046
error-gt0-gsc-nonfatal-mia-int                          0x0000000000000047
error-gt0-gsc-nonfatal-sram-ecc                         0x0000000000000048
error-gt0-gsc-nonfatal-wdg-timeout                      0x0000000000000049
error-gt0-gsc-nonfatal-rom-parity                       0x000000000000004a
error-gt0-gsc-nonfatal-ucode-parity                     0x000000000000004b
error-gt0-gsc-nonfatal-glitch-det                       0x000000000000004c
error-gt0-gsc-nonfatal-fuse-pull                        0x000000000000004d
error-gt0-gsc-nonfatal-fuse-crc-check                   0x000000000000004e
error-gt0-gsc-nonfatal-selfmbist                        0x000000000000004f
error-gt0-gsc-nonfatal-aon-parity                       0x0000000000000050
error-gt1-correctable-guc                               0x1000000000000001
error-gt1-correctable-slm                               0x1000000000000003
error-gt1-correctable-eu-ic                             0x1000000000000004
error-gt1-correctable-eu-grf                            0x1000000000000005
error-gt1-fatal-guc                                     0x1000000000000009
error-gt1-fatal-slm                                     0x100000000000000d
error-gt1-fatal-eu-grf                                  0x100000000000000f
error-gt1-fatal-fpu                                     0x1000000000000010
error-gt1-fatal-tlb                                     0x1000000000000011
error-gt1-fatal-l3-fabric                               0x1000000000000012
error-gt1-correctable-subslice                          0x1000000000000013
error-gt1-correctable-l3bank                            0x1000000000000014
error-gt1-fatal-subslice                                0x1000000000000015
error-gt1-fatal-l3bank                                  0x1000000000000016
error-gt1-sgunit-correctable                            0x1000000000000017
error-gt1-sgunit-nonfatal                               0x1000000000000018
error-gt1-sgunit-fatal                                  0x1000000000000019
error-gt1-soc-fatal-psf-csc-0                           0x100000000000001a
error-gt1-soc-fatal-psf-csc-1                           0x100000000000001b
error-gt1-soc-fatal-psf-csc-2                           0x100000000000001c
error-gt1-soc-fatal-punit                               0x100000000000001d
error-gt1-soc-fatal-psf-0                               0x100000000000001e
error-gt1-soc-fatal-psf-1                               0x100000000000001f
error-gt1-soc-fatal-psf-2                               0x1000000000000020
error-gt1-soc-fatal-cd0                                 0x1000000000000021
error-gt1-soc-fatal-cd0-mdfi                            0x1000000000000022
error-gt1-soc-fatal-mdfi-east                           0x1000000000000023
error-gt1-soc-fatal-mdfi-south                          0x1000000000000024
error-gt1-soc-fatal-hbm-ss0-0                           0x1000000000000025
error-gt1-soc-fatal-hbm-ss0-1                           0x1000000000000026
error-gt1-soc-fatal-hbm-ss0-2                           0x1000000000000027
error-gt1-soc-fatal-hbm-ss0-3                           0x1000000000000028
error-gt1-soc-fatal-hbm-ss0-4                           0x1000000000000029
error-gt1-soc-fatal-hbm-ss0-5                           0x100000000000002a
error-gt1-soc-fatal-hbm-ss0-6                           0x100000000000002b
error-gt1-soc-fatal-hbm-ss0-7                           0x100000000000002c
error-gt1-soc-fatal-hbm-ss1-0                           0x100000000000002d
error-gt1-soc-fatal-hbm-ss1-1                           0x100000000000002e
error-gt1-soc-fatal-hbm-ss1-2                           0x100000000000002f
error-gt1-soc-fatal-hbm-ss1-3                           0x1000000000000030
error-gt1-soc-fatal-hbm-ss1-4                           0x1000000000000031
error-gt1-soc-fatal-hbm-ss1-5                           0x1000000000000032
error-gt1-soc-fatal-hbm-ss1-6                           0x1000000000000033
error-gt1-soc-fatal-hbm-ss1-7                           0x1000000000000034
error-gt1-soc-fatal-hbm-ss2-0                           0x1000000000000035
error-gt1-soc-fatal-hbm-ss2-1                           0x1000000000000036
error-gt1-soc-fatal-hbm-ss2-2                           0x1000000000000037
error-gt1-soc-fatal-hbm-ss2-3                           0x1000000000000038
error-gt1-soc-fatal-hbm-ss2-4                           0x1000000000000039
error-gt1-soc-fatal-hbm-ss2-5                           0x100000000000003a
error-gt1-soc-fatal-hbm-ss2-6                           0x100000000000003b
error-gt1-soc-fatal-hbm-ss2-7                           0x100000000000003c
error-gt1-soc-fatal-hbm-ss3-0                           0x100000000000003d
error-gt1-soc-fatal-hbm-ss3-1                           0x100000000000003e
error-gt1-soc-fatal-hbm-ss3-2                           0x100000000000003f
error-gt1-soc-fatal-hbm-ss3-3                           0x1000000000000040
error-gt1-soc-fatal-hbm-ss3-4                           0x1000000000000041
error-gt1-soc-fatal-hbm-ss3-5                           0x1000000000000042
error-gt1-soc-fatal-hbm-ss3-6                           0x1000000000000043
error-gt1-soc-fatal-hbm-ss3-7                           0x1000000000000044

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Tomer Tayar <ttayar@habana.ai>


Aravind Iddamsetty (1):
  tools/RAS: A tool to read error counters

 include/drm-uapi/drm_netlink.h |  66 ++++++
 meson.build                    |   4 +
 tools/drm_ras.c                | 403 +++++++++++++++++++++++++++++++++
 tools/meson.build              |   5 +
 4 files changed, 478 insertions(+)
 create mode 100644 include/drm-uapi/drm_netlink.h
 create mode 100644 tools/drm_ras.c

-- 
2.25.1
