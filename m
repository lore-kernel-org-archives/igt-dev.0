Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1A10E6A2
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 15:15:58 +0000 (UTC)
From: "Wu, Hersen" <hersenxs.wu@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Hung, Alex" <Alex.Hung@amd.com>, "Wang, Chao-kai (Stylon)"
 <Stylon.Wang@amd.com>, "Mahfooz, Hamza" <Hamza.Mahfooz@amd.com>, "Li, Sun
 peng (Leo)" <Sunpeng.Li@amd.com>, "petri.latvala@intel.com"
 <petri.latvala@intel.com>
Date: Fri, 11 Aug 2023 15:15:55 +0000
Message-ID: <PH8PR12MB6962A7D1BA13A1D68434D26EFD10A@PH8PR12MB6962.namprd12.prod.outlook.com>
References: <20230810145257.88389-1-hersenxs.wu@amd.com>
 <20230810145257.88389-2-hersenxs.wu@amd.com>
In-Reply-To: <20230810145257.88389-2-hersenxs.wu@amd.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/2] [i-g-t] tests/amdgpu: Fix display tests
 be skipped intermittently
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "petri.latvala@intel.com" <petri.latvala@intel.com>,
 "markyacoub@google.com" <markyacoub@google.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

[AMD Official Use Only - General]

Re-send for review request.
Thanks!
Hersen

-----Original Message-----
From: Hersen Wu <hersenxs.wu@amd.com>
Sent: Thursday, August 10, 2023 10:53 AM
To: igt-dev@lists.freedesktop.org; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.=
com>; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Hung, Alex <Alex.Hung@a=
md.com>; Wang, Chao-kai (Stylon) <Stylon.Wang@amd.com>; Mahfooz, Hamza <Ham=
za.Mahfooz@amd.com>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>
Cc: markyacoub@google.com; Wu, Hersen <hersenxs.wu@amd.com>
Subject: [PATCH 2/2] [i-g-t] tests/amdgpu: Fix display tests be skipped int=
ermittently

Use igt_display_setup to re-try igt_display_require if igt dislay require o=
utput is not valid. If previous test run suspend-resume test, current test =
igt display require output may not be valid after initial igt_display_requi=
re.
This will let current test be skipped. By re-try igt_display_require, igt d=
isplay require output could be valid.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 tests/amdgpu/amd_assr.c                | 3 +--
 tests/amdgpu/amd_bypass.c              | 3 +--
 tests/amdgpu/amd_color.c               | 3 +--
 tests/amdgpu/amd_dp_dsc.c              | 6 +++---
 tests/amdgpu/amd_freesync_video_mode.c | 3 +--
 tests/amdgpu/amd_hotplug.c             | 3 +--
 tests/amdgpu/amd_ilr.c                 | 3 +--
 tests/amdgpu/amd_link_settings.c       | 3 +--
 tests/amdgpu/amd_max_bpc.c             | 3 +--
 tests/amdgpu/amd_mem_leak.c            | 3 +--
 tests/amdgpu/amd_mode_switch.c         | 5 ++---
 tests/amdgpu/amd_plane.c               | 3 +--
 tests/amdgpu/amd_psr.c                 | 5 ++---
 tests/amdgpu/amd_vrr_range.c           | 3 +--
 14 files changed, 18 insertions(+), 31 deletions(-)

diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c index fc2367=
f99..6f4884d3b 100644
--- a/tests/amdgpu/amd_assr.c
+++ b/tests/amdgpu/amd_assr.c
@@ -281,9 +281,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Test ASSR on connected DP/eDP links"); diff --git a/t=
ests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c index d192a30ea..1c275=
6ae1 100644
--- a/tests/amdgpu/amd_bypass.c
+++ b/tests/amdgpu/amd_bypass.c
@@ -387,9 +387,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.drm_fd);
+               igt_display_setup(&data.display, data.drm_fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_subtest("8bpc-bypass-mode")
diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c index 3400=
2ed88..6918f2b3c 100644
--- a/tests/amdgpu/amd_color.c
+++ b/tests/amdgpu/amd_color.c
@@ -404,9 +404,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);=
 diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c index e=
782ce84a..aa5e2ed08 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -526,12 +526,12 @@ igt_main
        {
                data.fd =3D drm_open_driver_master(DRIVER_ANY);

-               igt_display_require(&data.display, data.fd);
+               kmstest_set_vt_graphics_mode();
+
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);

                igt_amd_require_dsc(&data.display, data.fd);
-               kmstest_set_vt_graphics_mode();
        }

        igt_describe("Forces DSC on/off & ensures it is reset properly"); d=
iff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_frees=
ync_video_mode.c
index 7716598dc..54c2121a8 100644
--- a/tests/amdgpu/amd_freesync_video_mode.c
+++ b/tests/amdgpu/amd_freesync_video_mode.c
@@ -871,9 +871,8 @@ igt_main {
                        igt_skip("Not an amdgpu driver.\n");
                }
                kmstest_set_vt_graphics_mode();
-               igt_display_require(&data.display, data.drm_fd);
+               igt_display_setup(&data.display, data.drm_fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        /* Expectation: Modeset happens instantaneously without blanking */=
 diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c index=
 c13bf49d3..73e3fef35 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -165,9 +165,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);

                igt_amd_require_hpd(&data.display, data.fd);
        }
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c index 50ca93a1=
4..ca63e9c28 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -264,9 +264,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.drm_fd);
+               igt_display_setup(&data.display, data.drm_fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Test ILR by trying training link rate at all supporte=
d ILRs"); diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_=
link_settings.c
index 6a7e8cc53..4509e7f9c 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -237,9 +237,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.drm_fd);
+               igt_display_setup(&data.display, data.drm_fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Retrieves all link settings configurations and retrai=
ns "
diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c index =
effe830a2..9fe71d946 100644
--- a/tests/amdgpu/amd_max_bpc.c
+++ b/tests/amdgpu/amd_max_bpc.c
@@ -132,9 +132,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Tests overly high 'max bpc' should not affect 4K mode=
s on HDMI"); diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_me=
m_leak.c index e4a4b5c47..7fc7f608c 100644
--- a/tests/amdgpu/amd_mem_leak.c
+++ b/tests/amdgpu/amd_mem_leak.c
@@ -219,9 +219,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 5);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Test memory leaks after resume from suspend"); diff -=
-git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c inde=
x 270b1b9f6..5b69269b9 100644
--- a/tests/amdgpu/amd_mode_switch.c
+++ b/tests/amdgpu/amd_mode_switch.c
@@ -191,9 +191,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
-               igt_require(&data.display.is_atomic);
-               igt_display_require_output(&data.display);
+               igt_display_setup(&data.display, data.fd, 2);
+               igt_require(data.display.is_atomic);
        }

        for (i =3D 0; i < MAX_PIPES; i++) {
diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c index ee7d=
e5778..6dadca37f 100644
--- a/tests/amdgpu/amd_plane.c
+++ b/tests/amdgpu/amd_plane.c
@@ -910,9 +910,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("MPO with 4K planes");
diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c index 9da161a0=
9..d753f0499 100644
--- a/tests/amdgpu/amd_psr.c
+++ b/tests/amdgpu/amd_psr.c
@@ -715,9 +715,8 @@ igt_main_args("", long_options, help_str, opt_handler, =
NULL)

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
-               igt_require(&data.display.is_atomic);
-               igt_display_require_output(&data.display);
+               igt_display_setup(&data.display, data.fd, 2);
+               igt_require(data.display.is_atomic);

                /* check if visual confirm option available */
                if (opt.visual_confirm) {
diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c in=
dex a77895622..a626e607d 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -388,9 +388,8 @@ igt_main

                kmstest_set_vt_graphics_mode();

-               igt_display_require(&data.display, data.fd);
+               igt_display_setup(&data.display, data.fd, 2);
                igt_require(data.display.is_atomic);
-               igt_display_require_output(&data.display);
        }

        igt_describe("Hard coded Freesync EDID parsing");
--
2.25.1
