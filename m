Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4644C10E236
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:30:35 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:30:07 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626163007.z5yquccj5o3ad3au@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-20-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-20-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 19/24] tests/kms: Use drm_close_driver() to
 close the drm fd
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Bhanuprakash,

On 2023-06-26 at 10:40:26 +0530, Bhanuprakash Modem wrote:
> To close the drm file descriptor, use igt helper drm_close_driver()
> instead of using close().
> 
> V2: - New patch for chamelium tests
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/kms_big_fb.c               | 2 +-
>  tests/i915/kms_big_joiner.c           | 2 +-
>  tests/i915/kms_busy.c                 | 2 +-
>  tests/i915/kms_ccs.c                  | 2 +-
>  tests/i915/kms_cdclk.c                | 2 +-
>  tests/i915/kms_draw_crc.c             | 2 +-
>  tests/i915/kms_dsc.c                  | 2 +-
>  tests/i915/kms_fbcon_fbt.c            | 2 +-
>  tests/i915/kms_fence_pin_leak.c       | 2 +-
>  tests/i915/kms_flip_scaled_crc.c      | 2 +-
>  tests/i915/kms_flip_tiling.c          | 2 +-
>  tests/i915/kms_frontbuffer_tracking.c | 2 +-
>  tests/i915/kms_legacy_colorkey.c      | 2 +-
>  tests/i915/kms_mmap_write_crc.c       | 2 +-
>  tests/i915/kms_pipe_b_c_ivb.c         | 2 +-
>  tests/i915/kms_psr.c                  | 2 +-
>  tests/i915/kms_psr2_sf.c              | 2 +-
>  tests/i915/kms_psr2_su.c              | 2 +-
>  tests/i915/kms_psr_stress_test.c      | 2 +-
>  tests/i915/kms_pwrite_crc.c           | 2 +-
>  tests/kms_3d.c                        | 2 +-
>  tests/kms_addfb_basic.c               | 4 ++--
>  tests/kms_async_flips.c               | 2 +-
>  tests/kms_atomic.c                    | 2 +-
>  tests/kms_atomic_interruptible.c      | 2 +-
>  tests/kms_atomic_transition.c         | 2 +-
>  tests/kms_color.c                     | 2 +-
>  tests/kms_concurrent.c                | 2 +-
>  tests/kms_content_protection.c        | 2 +-
>  tests/kms_cursor_crc.c                | 2 +-
>  tests/kms_cursor_edge_walk.c          | 2 +-
>  tests/kms_cursor_legacy.c             | 2 +-
>  tests/kms_dither.c                    | 2 +-
>  tests/kms_dp_aux_dev.c                | 2 +-
>  tests/kms_flip.c                      | 2 +-
>  tests/kms_flip_event_leak.c           | 4 ++--
>  tests/kms_force_connector_basic.c     | 4 ++--
>  tests/kms_getfb.c                     | 4 ++--
>  tests/kms_hdmi_inject.c               | 2 +-
>  tests/kms_hdr.c                       | 2 +-
>  tests/kms_invalid_mode.c              | 2 +-
>  tests/kms_lease.c                     | 4 ++--
>  tests/kms_panel_fitting.c             | 2 +-
>  tests/kms_pipe_crc_basic.c            | 2 +-
>  tests/kms_plane.c                     | 2 +-
>  tests/kms_plane_alpha_blend.c         | 2 +-
>  tests/kms_plane_cursor.c              | 2 +-
>  tests/kms_plane_lowres.c              | 2 +-
>  tests/kms_plane_multiple.c            | 2 +-
>  tests/kms_plane_scaling.c             | 2 +-
>  tests/kms_prime.c                     | 6 +++---
>  tests/kms_prop_blob.c                 | 8 ++++----
>  tests/kms_properties.c                | 2 +-
>  tests/kms_rmfb.c                      | 4 ++--
>  tests/kms_rotation_crc.c              | 2 +-
>  tests/kms_scaling_modes.c             | 2 +-
>  tests/kms_sequence.c                  | 2 +-
>  tests/kms_setmode.c                   | 2 +-
>  tests/kms_tiled_display.c             | 2 +-
>  tests/kms_tv_load_detect.c            | 2 +-
>  tests/kms_universal_plane.c           | 2 +-
>  tests/kms_vblank.c                    | 2 +-
>  62 files changed, 73 insertions(+), 73 deletions(-)
> 
> diff --git a/tests/i915/kms_big_fb.c b/tests/i915/kms_big_fb.c
> index c120a14a6..44ea117a1 100644
> --- a/tests/i915/kms_big_fb.c
> +++ b/tests/i915/kms_big_fb.c
> @@ -1054,6 +1054,6 @@ igt_main
>  	igt_fixture {
>  		igt_display_fini(&data.display);
>  		buf_ops_destroy(data.bops);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index b9dda58f6..2ff23398a 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -302,6 +302,6 @@ igt_main
>  	igt_fixture {
>  		igt_remove_fb(data.drm_fd, &data.fb);
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_busy.c b/tests/i915/kms_busy.c
> index e953b814e..ecc7f02d9 100644
> --- a/tests/i915/kms_busy.c
> +++ b/tests/i915/kms_busy.c
> @@ -513,6 +513,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		igt_display_fini(&display);
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_ccs.c b/tests/i915/kms_ccs.c
> index abe464b47..f04552dd7 100644
> --- a/tests/i915/kms_ccs.c
> +++ b/tests/i915/kms_ccs.c
> @@ -712,6 +712,6 @@ igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_cdclk.c b/tests/i915/kms_cdclk.c
> index 0f9b8dc58..40eca24f0 100644
> --- a/tests/i915/kms_cdclk.c
> +++ b/tests/i915/kms_cdclk.c
> @@ -397,6 +397,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_draw_crc.c b/tests/i915/kms_draw_crc.c
> index db6d71f2e..01ecb7bb9 100644
> --- a/tests/i915/kms_draw_crc.c
> +++ b/tests/i915/kms_draw_crc.c
> @@ -242,7 +242,7 @@ static void teardown_environment(void)
>  
>  	buf_ops_destroy(bops);
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
>  
>  static const char *format_str(int format_index)
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index c07078068..0a3e29924 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -338,6 +338,6 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
> index 6c557dca7..71c5285f1 100644
> --- a/tests/i915/kms_fbcon_fbt.c
> +++ b/tests/i915/kms_fbcon_fbt.c
> @@ -408,7 +408,7 @@ static void teardown_environment(struct drm_info *drm)
>  
>  	drmModeFreeResources(drm->res);
>  	close(drm->debugfs_fd);
> -	close(drm->fd);
> +	drm_close_driver(drm->fd);
>  	kmstest_restore_vt_mode();
>  }
>  
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> index 127c01c16..3d63acfef 100644
> --- a/tests/i915/kms_fence_pin_leak.c
> +++ b/tests/i915/kms_fence_pin_leak.c
> @@ -238,5 +238,5 @@ igt_simple_main
>  
>  	buf_ops_destroy(data.bops);
>  	igt_display_fini(&data.display);
> -	close(data.drm_fd);
> +	drm_close_driver(data.drm_fd);
>  }
> diff --git a/tests/i915/kms_flip_scaled_crc.c b/tests/i915/kms_flip_scaled_crc.c
> index f5dc430e3..30da1fcf3 100644
> --- a/tests/i915/kms_flip_scaled_crc.c
> +++ b/tests/i915/kms_flip_scaled_crc.c
> @@ -694,6 +694,6 @@ igt_main
>  		}
>  		kmstest_set_vt_text_mode();
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_flip_tiling.c b/tests/i915/kms_flip_tiling.c
> index a22f12382..02a5fe8e3 100644
> --- a/tests/i915/kms_flip_tiling.c
> +++ b/tests/i915/kms_flip_tiling.c
> @@ -240,6 +240,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_frontbuffer_tracking.c b/tests/i915/kms_frontbuffer_tracking.c
> index 8155d4e49..b2183b08e 100644
> --- a/tests/i915/kms_frontbuffer_tracking.c
> +++ b/tests/i915/kms_frontbuffer_tracking.c
> @@ -1353,7 +1353,7 @@ static void teardown_drm(void)
>  {
>  	buf_ops_destroy(drm.bops);
>  	igt_display_fini(&drm.display);
> -	close(drm.fd);
> +	drm_close_driver(drm.fd);
>  }
>  
>  static void setup_modeset(void)
> diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
> index 5b2fd64ba..450cb2e3f 100644
> --- a/tests/i915/kms_legacy_colorkey.c
> +++ b/tests/i915/kms_legacy_colorkey.c
> @@ -87,6 +87,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&display);
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_mmap_write_crc.c b/tests/i915/kms_mmap_write_crc.c
> index 07bd542dc..5a9eeec48 100644
> --- a/tests/i915/kms_mmap_write_crc.c
> +++ b/tests/i915/kms_mmap_write_crc.c
> @@ -306,7 +306,7 @@ igt_main_args("n", NULL, NULL, opt_handler, NULL)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  
>  		igt_stop_helper(&hog);
>  	}
> diff --git a/tests/i915/kms_pipe_b_c_ivb.c b/tests/i915/kms_pipe_b_c_ivb.c
> index af11e3262..192771794 100644
> --- a/tests/i915/kms_pipe_b_c_ivb.c
> +++ b/tests/i915/kms_pipe_b_c_ivb.c
> @@ -291,6 +291,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 6c89de45d..3f8f83b42 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -670,6 +670,6 @@ igt_main_args("", long_options, help_str, opt_handler, &data)
>  		close(data.debugfs_fd);
>  		buf_ops_destroy(data.bops);
>  		display_fini(&data);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_psr2_sf.c b/tests/i915/kms_psr2_sf.c
> index ffc41f983..b4734e5f1 100644
> --- a/tests/i915/kms_psr2_sf.c
> +++ b/tests/i915/kms_psr2_sf.c
> @@ -1298,6 +1298,6 @@ igt_main
>  	igt_fixture {
>  		close(data.debugfs_fd);
>  		display_fini(&data);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
> index 65e67b8c9..3081887ca 100644
> --- a/tests/i915/kms_psr2_su.c
> +++ b/tests/i915/kms_psr2_su.c
> @@ -373,6 +373,6 @@ igt_main
>  	igt_fixture {
>  		close(data.debugfs_fd);
>  		display_fini(&data);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_psr_stress_test.c b/tests/i915/kms_psr_stress_test.c
> index a4cb3194e..23dcb4077 100644
> --- a/tests/i915/kms_psr_stress_test.c
> +++ b/tests/i915/kms_psr_stress_test.c
> @@ -378,6 +378,6 @@ igt_main
>  		buf_ops_destroy(data.bops);
>  		igt_display_fini(&data.display);
>  		close(data.debugfs_fd);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 3278d876d..7bddeecba 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -193,5 +193,5 @@ igt_simple_main
>  	run_test(&data);
>  
>  	igt_display_fini(&data.display);
> -	close(data.drm_fd);
> +	drm_close_driver(data.drm_fd);
>  }
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index 437c8a481..55e1d8058 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -119,5 +119,5 @@ igt_simple_main
>  	if (is_xe_device(drm_fd))
>  		xe_device_put(drm_fd);
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index e375f3ad2..53a6a007a 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -933,7 +933,7 @@ static void master_tests(int fd)
>  		do_ioctl_err(master2_fd, DRM_IOCTL_MODE_RMFB, &f.fb_id, ENOENT);
>  
>  		igt_device_drop_master(master2_fd);
> -		close(master2_fd);
> +		drm_close_driver(master2_fd);
>  
>  		igt_device_set_master(fd);
>  	}
> @@ -1012,6 +1012,6 @@ igt_main
>  		if (is_xe_device(fd))
>  			xe_device_put(fd);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 5cb797dec..0a1199158 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -676,6 +676,6 @@ igt_main
>  		igt_display_reset(&data.display);
>  		igt_display_commit(&data.display);
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index 037db2d36..b65045abc 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -1460,6 +1460,6 @@ igt_main
>  		igt_remove_fb(display.drm_fd, &fb);
>  
>  		igt_display_fini(&display);
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_atomic_interruptible.c b/tests/kms_atomic_interruptible.c
> index 74b2e246a..2acdcb29d 100644
> --- a/tests/kms_atomic_interruptible.c
> +++ b/tests/kms_atomic_interruptible.c
> @@ -389,6 +389,6 @@ igt_main
>  	/* TODO: legacy gamma_set/get, object set/getprop, getcrtc, getconnector */
>  	igt_fixture {
>  		igt_display_fini(&display);
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 9f39d033d..6ab5267ca 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1182,6 +1182,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 1d93ebbee..b15b9572c 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -1120,6 +1120,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_concurrent.c b/tests/kms_concurrent.c
> index e1e581723..d915a98b2 100644
> --- a/tests/kms_concurrent.c
> +++ b/tests/kms_concurrent.c
> @@ -400,6 +400,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  		if (is_intel_device(data.drm_fd))
>  			intel_allocator_multiprocess_stop();
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 344cac505..6cdf81a28 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -884,6 +884,6 @@ igt_main
>  	igt_fixture {
>  		test_content_protection_cleanup();
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index bd65c2e55..0506fd6f1 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -1016,6 +1016,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		}
>  
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 5f423a18f..462b51e20 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -391,6 +391,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index f7a6202cf..c1e7c2113 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -1843,6 +1843,6 @@ igt_main
>  		if (intel_psr2_restore)
>  			i915_psr2_sel_fetch_restore(display.drm_fd);
>  		igt_display_fini(&display);
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index 95be6e136..d6c16dd0b 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -247,6 +247,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 69edc1585..19cbe216a 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -147,5 +147,5 @@ igt_simple_main
>  	igt_require(valid_connectors);
>  
>  	drmModeFreeResources(res);
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index f1e0700c1..efff06e1c 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -1930,6 +1930,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  		if (is_xe_device(drm_fd))
>  			xe_device_put(drm_fd);
>  
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index b79cd5030..7e46f5ec0 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -79,7 +79,7 @@ static void test(data_t *data, enum pipe pipe, igt_output_t *output)
>  
>  	if (is_xe_device(fd))
>  		xe_device_put(fd);
> -	ret = close(fd);
> +	ret = drm_close_driver(fd);
>  	igt_assert_eq(ret, 0);
>  
>  	igt_device_set_master(data->drm_fd);
> @@ -121,6 +121,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_force_connector_basic.c b/tests/kms_force_connector_basic.c
> index 7e35693cf..950af8d8a 100644
> --- a/tests/kms_force_connector_basic.c
> +++ b/tests/kms_force_connector_basic.c
> @@ -65,7 +65,7 @@ static void reset_connectors(void)
>  		free(param);
>  	}
>  
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
>  
>  static void force_load_detect(int drm_fd, drmModeConnectorPtr connector, drmModeRes *res)
> @@ -415,7 +415,7 @@ end:
>  
>  	igt_fixture {
>  		drmModeFreeConnector(connector);
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  
>  		reset_connectors();
>  	}
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index f44f42551..46cad39bd 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -457,7 +457,7 @@ static void test_handle_protection(void) {
>  		if (is_xe_device(non_master_fd))
>  			xe_device_get(non_master_fd);
>  
> -		close(non_master_fd);
> +		drm_close_driver(non_master_fd);
>  	}
>  }
>  
> @@ -489,6 +489,6 @@ igt_main
>  		if (is_xe_device(fd))
>  			xe_device_put(fd);
>  
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index 2085d1453..e3db34502 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -227,6 +227,6 @@ igt_main
>  		if (is_xe_device(drm_fd))
>  			xe_device_put(drm_fd);
>  
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index e9e52a9a1..ba19761e2 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -666,6 +666,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.fd);
> +		drm_close_driver(data.fd);
>  	}
>  }
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 671876308..c26f8befe 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -300,6 +300,6 @@ igt_main
>  		igt_display_fini(&data.display);
>  		igt_reset_connectors();
>  		drmModeFreeResources(data.res);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 29a774ae8..c8ae98206 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -1082,7 +1082,7 @@ static void multimaster_lease(data_t *data)
>  	drmSetClientCap(master2_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
>  	lease2_fd = create_simple_lease(master2_fd, data);
>  
> -	close(master2_fd); /* close is an implicit DropMaster */
> +	drm_close_driver(master2_fd); /* close is an implicit DropMaster */
>  	igt_assert(!is_master(lease2_fd));
>  
>  	igt_device_set_master(data->master.fd);
> @@ -1278,6 +1278,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(display);
> -		close(data.master.fd);
> +		drm_close_driver(data.master.fd);
>  	}
>  }
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index 97ef1ae48..ae1c65928 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -288,6 +288,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
> index 9ce9f5e53..95cc1d7fa 100644
> --- a/tests/kms_pipe_crc_basic.c
> +++ b/tests/kms_pipe_crc_basic.c
> @@ -511,6 +511,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index dfc6a8c57..67cff61d6 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -1336,6 +1336,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 0d03e178a..341b85c7e 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -715,6 +715,6 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>  				    COMMIT_ATOMIC : COMMIT_LEGACY);
>  
>  		igt_display_fini(&data.display);
> -		close(data.gfx_fd);
> +		drm_close_driver(data.gfx_fd);
>  	}
>  }
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 59b105c60..a7acb18e1 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -331,6 +331,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index db9f5a54c..7aaf83c41 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -342,6 +342,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index 7dd9d586d..1f2bd65c3 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -478,6 +478,6 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 77bb905b4..920290e4d 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1324,6 +1324,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index dd5ab993e..52f587961 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -431,7 +431,7 @@ igt_main
>  			if (kms_poll_disabled)
>  				kms_poll_state_restore();
>  
> -			close(second_fd_hybrid);
> +			drm_close_driver(second_fd_hybrid);
>  		}
>  	}
>  
> @@ -454,9 +454,9 @@ igt_main
>  		}
>  
>  		igt_fixture
> -			close(second_fd_vgem);
> +			drm_close_driver(second_fd_vgem);
>  	}
>  
>  	igt_fixture
> -		close(first_fd);
> +		drm_close_driver(first_fd);
>  }
> diff --git a/tests/kms_prop_blob.c b/tests/kms_prop_blob.c
> index 6a5a5f410..fc172b5a3 100644
> --- a/tests/kms_prop_blob.c
> +++ b/tests/kms_prop_blob.c
> @@ -182,7 +182,7 @@ test_lifetime(int fd)
>  	/* Make sure properties are cleaned up on client exit. */
>  	prop_id2 = create_prop(fd2);
>  	igt_assert_eq(validate_prop(fd, prop_id2), 0);
> -	igt_assert_eq(close(fd2), 0);
> +	igt_assert_eq(drm_close_driver(fd2), 0);
>  	igt_assert_eq(validate_prop(fd, prop_id2), ENOENT);
>  
>  	igt_assert_eq(validate_prop(fd, prop_id), 0);
> @@ -210,7 +210,7 @@ test_multiple(int fd)
>  		igt_assert_eq(destroy_prop(fd2, prop_ids[i]), 0);
>  		igt_assert_eq(validate_prop(fd2, prop_ids[i]), ENOENT);
>  	}
> -	igt_assert_eq(close(fd2), 0);
> +	igt_assert_eq(drm_close_driver(fd2), 0);
>  
>  	fd2 = drm_open_driver(DRIVER_ANY);
>  	igt_assert_fd(fd2);
> @@ -221,7 +221,7 @@ test_multiple(int fd)
>  		igt_assert_eq(validate_prop(fd, prop_ids[i]), 0);
>  		igt_assert_eq(validate_prop(fd2, prop_ids[i]), 0);
>  	}
> -	igt_assert_eq(close(fd2), 0);
> +	igt_assert_eq(drm_close_driver(fd2), 0);
>  
>  	for (i = 0; i < ARRAY_SIZE(prop_ids); i++)
>  		igt_assert_eq(validate_prop(fd, prop_ids[i]), ENOENT);
> @@ -350,5 +350,5 @@ igt_main
>  	prop_tests(fd);
>  
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 2fe8dfa66..8645808d1 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -810,6 +810,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&display);
> -		close(display.drm_fd);
> +		drm_close_driver(display.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index 50df42953..9a41c1d14 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -121,7 +121,7 @@ test_rmfb(struct rmfb_data *data, igt_output_t *output, enum pipe pipe, bool reo
>  	drmModeFreeCrtc(crtc);
>  
>  	if (reopen) {
> -		close(data->drm_fd);
> +		drm_close_driver(data->drm_fd);
>  
>  		data->drm_fd = drm_open_driver_master(DRIVER_ANY);
>  		drmSetClientCap(data->drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
> @@ -204,6 +204,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 0a22cc225..5ad04407d 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1292,6 +1292,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.gfx_fd);
> +		drm_close_driver(data.gfx_fd);
>  	}
>  }
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 906ae76de..31b806ae2 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -138,6 +138,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index c8a3d6bbd..1b96f0017 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -303,6 +303,6 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index a611d9382..a85f4eaf2 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -978,6 +978,6 @@ igt_main_args("det:", NULL, help_str, opt_handler, NULL)
>  		if (is_xe_device(drm_fd))
>  			xe_device_put(drm_fd);
>  
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/kms_tiled_display.c b/tests/kms_tiled_display.c
> index d9baf9878..eba1b2764 100644
> --- a/tests/kms_tiled_display.c
> +++ b/tests/kms_tiled_display.c
> @@ -623,6 +623,6 @@ igt_main
>  		free(data.conns);
>  		kmstest_restore_vt_mode();
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index 80ced9918..c8e5338d2 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -84,6 +84,6 @@ igt_main
>  
>  	igt_fixture {
>  		drmModeFreeConnector(tv_connector);
> -		close(drm_fd);
> +		drm_close_driver(drm_fd);
>  	}
>  }
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 635a136ab..957d600f1 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -918,6 +918,6 @@ igt_main
>  
>  	igt_fixture {
>  		igt_display_fini(&data.display);
> -		close(data.drm_fd);
> +		drm_close_driver(data.drm_fd);
>  	}
>  }
> diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
> index da0ada78e..1aa8c1083 100644
> --- a/tests/kms_vblank.c
> +++ b/tests/kms_vblank.c
> @@ -601,6 +601,6 @@ igt_main
>  			run_subtests_for_pipe(&data);
>  
>  	igt_fixture {
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> -- 
> 2.40.0
> 
