Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F260510E121
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 22:38:45 +0000 (UTC)
Message-ID: <f030d413-24aa-272e-b476-44cd26aeca0d@amd.com>
Date: Fri, 11 Aug 2023 16:38:41 -0600
Content-Language: en-US
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, stylon.wang@amd.com,
 hamza.mahfooz@amd.com, sunpeng.li@amd.com
References: <20230811221223.57193-1-hersenxs.wu@amd.com>
 <20230811221223.57193-2-hersenxs.wu@amd.com>
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20230811221223.57193-2-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 2023-08-11 16:12, Hersen Wu wrote:
> Use igt_display_require_retry to re-try igt_display_require
> if igt dislay require output is not valid. If previous test
> run suspend-resume test, current test igt display require
> output may not be valid after initial igt_display_require.
> This will let current test be skipped. By re-try
> igt_display_require, igt display require output could be
> valid.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_assr.c                | 3 +--
>   tests/amdgpu/amd_bypass.c              | 3 +--
>   tests/amdgpu/amd_color.c               | 3 +--
>   tests/amdgpu/amd_dp_dsc.c              | 6 +++---
>   tests/amdgpu/amd_freesync_video_mode.c | 3 +--
>   tests/amdgpu/amd_hotplug.c             | 3 +--
>   tests/amdgpu/amd_ilr.c                 | 3 +--
>   tests/amdgpu/amd_link_settings.c       | 3 +--
>   tests/amdgpu/amd_max_bpc.c             | 3 +--
>   tests/amdgpu/amd_mem_leak.c            | 3 +--
>   tests/amdgpu/amd_mode_switch.c         | 5 ++---
>   tests/amdgpu/amd_plane.c               | 3 +--
>   tests/amdgpu/amd_psr.c                 | 5 ++---
>   tests/amdgpu/amd_vrr_range.c           | 3 +--
>   14 files changed, 18 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_assr.c b/tests/amdgpu/amd_assr.c
> index fc2367f99..796c79eec 100644
> --- a/tests/amdgpu/amd_assr.c
> +++ b/tests/amdgpu/amd_assr.c
> @@ -281,9 +281,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Test ASSR on connected DP/eDP links");
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index d192a30ea..351742205 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -387,9 +387,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_retry(&data.display, data.drm_fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_subtest("8bpc-bypass-mode")
> diff --git a/tests/amdgpu/amd_color.c b/tests/amdgpu/amd_color.c
> index 34002ed88..c2f2f1824 100644
> --- a/tests/amdgpu/amd_color.c
> +++ b/tests/amdgpu/amd_color.c
> @@ -404,9 +404,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_subtest("crtc-linear-degamma") test_crtc_linear_degamma(&data);
> diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
> index e782ce84a..2c2f4c0ff 100644
> --- a/tests/amdgpu/amd_dp_dsc.c
> +++ b/tests/amdgpu/amd_dp_dsc.c
> @@ -526,12 +526,12 @@ igt_main
>   	{
>   		data.fd = drm_open_driver_master(DRIVER_ANY);
>   
> -		igt_display_require(&data.display, data.fd);
> +		kmstest_set_vt_graphics_mode();
> +
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   
>   		igt_amd_require_dsc(&data.display, data.fd);
> -		kmstest_set_vt_graphics_mode();
>   	}
>   
>   	igt_describe("Forces DSC on/off & ensures it is reset properly");
> diff --git a/tests/amdgpu/amd_freesync_video_mode.c b/tests/amdgpu/amd_freesync_video_mode.c
> index 7716598dc..226ea7d37 100644
> --- a/tests/amdgpu/amd_freesync_video_mode.c
> +++ b/tests/amdgpu/amd_freesync_video_mode.c
> @@ -871,9 +871,8 @@ igt_main {
>   			igt_skip("Not an amdgpu driver.\n");
>   		}
>   		kmstest_set_vt_graphics_mode();
> -		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_retry(&data.display, data.drm_fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	/* Expectation: Modeset happens instantaneously without blanking */
> diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
> index c13bf49d3..698446826 100644
> --- a/tests/amdgpu/amd_hotplug.c
> +++ b/tests/amdgpu/amd_hotplug.c
> @@ -165,9 +165,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   
>   		igt_amd_require_hpd(&data.display, data.fd);
>   	}
> diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
> index 50ca93a14..e332ce57d 100644
> --- a/tests/amdgpu/amd_ilr.c
> +++ b/tests/amdgpu/amd_ilr.c
> @@ -264,9 +264,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_retry(&data.display, data.drm_fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Test ILR by trying training link rate at all supported ILRs");
> diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
> index 6a7e8cc53..41bb5ac45 100644
> --- a/tests/amdgpu/amd_link_settings.c
> +++ b/tests/amdgpu/amd_link_settings.c
> @@ -237,9 +237,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_retry(&data.display, data.drm_fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Retrieves all link settings configurations and retrains "
> diff --git a/tests/amdgpu/amd_max_bpc.c b/tests/amdgpu/amd_max_bpc.c
> index effe830a2..d67abf0ad 100644
> --- a/tests/amdgpu/amd_max_bpc.c
> +++ b/tests/amdgpu/amd_max_bpc.c
> @@ -132,9 +132,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Tests overly high 'max bpc' should not affect 4K modes on HDMI");
> diff --git a/tests/amdgpu/amd_mem_leak.c b/tests/amdgpu/amd_mem_leak.c
> index e4a4b5c47..52b28a57f 100644
> --- a/tests/amdgpu/amd_mem_leak.c
> +++ b/tests/amdgpu/amd_mem_leak.c
> @@ -219,9 +219,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 5, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Test memory leaks after resume from suspend");
> diff --git a/tests/amdgpu/amd_mode_switch.c b/tests/amdgpu/amd_mode_switch.c
> index 270b1b9f6..e7ac81800 100644
> --- a/tests/amdgpu/amd_mode_switch.c
> +++ b/tests/amdgpu/amd_mode_switch.c
> @@ -191,9 +191,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> -		igt_require(&data.display.is_atomic);
> -		igt_display_require_output(&data.display);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
> +		igt_require(data.display.is_atomic);
>   	}
>   
>   	for (i = 0; i < MAX_PIPES; i++) {
> diff --git a/tests/amdgpu/amd_plane.c b/tests/amdgpu/amd_plane.c
> index ee7de5778..394fdf31f 100644
> --- a/tests/amdgpu/amd_plane.c
> +++ b/tests/amdgpu/amd_plane.c
> @@ -910,9 +910,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("MPO with 4K planes");
> diff --git a/tests/amdgpu/amd_psr.c b/tests/amdgpu/amd_psr.c
> index 9da161a09..d1c332924 100644
> --- a/tests/amdgpu/amd_psr.c
> +++ b/tests/amdgpu/amd_psr.c
> @@ -715,9 +715,8 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> -		igt_require(&data.display.is_atomic);
> -		igt_display_require_output(&data.display);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
> +		igt_require(data.display.is_atomic);
>   
>   		/* check if visual confirm option available */
>   		if (opt.visual_confirm) {
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index a77895622..223f99c62 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -388,9 +388,8 @@ igt_main
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_display_require(&data.display, data.fd);
> +		igt_display_require_retry(&data.display, data.fd, 2, 2);
>   		igt_require(data.display.is_atomic);
> -		igt_display_require_output(&data.display);
>   	}
>   
>   	igt_describe("Hard coded Freesync EDID parsing");
