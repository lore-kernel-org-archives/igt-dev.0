Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3ACE899D6
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 05:17:33 +0000 (UTC)
From: "Summers, Stuart" <stuart.summers@intel.com>
Date: Tue, 3 Dec 2019 05:17:31 +0000
Message-ID: <cfe4ff419163a5fe02ff6914a2dfe1b02b214cd3.camel@intel.com>
References: <20191202060132.31907-1-swati2.sharma@intel.com>
In-Reply-To: <20191202060132.31907-1-swati2.sharma@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 0/7] removal of
 igt_skip_on_simulation() from i915/ tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0452624492=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma,
 Swati2" <swati2.sharma@intel.com>
Cc: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Peres,
 Martin" <martin.peres@intel.com>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0452624492==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-OzcKaXAnaP/2D2TigGvl"

--=-OzcKaXAnaP/2D2TigGvl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-12-02 at 11:31 +0530, Swati Sharma wrote:
> Removing igt_skip_on_simulation() since this feature is not supported
> anymore by i915 driver. Removing it from gem, kms, i915 specific,=20

Can you be a little more specific about why we need to do this? Which
support was removed? Or is it simply that we're relying more on the IGT
infrastructure, i.e. skip, require_platform, etc, to determine whether
a test should be run in a particular environment?

Thanks,
Stuart

> tools
> and benchmark tests.
>=20
> Swati Sharma (7):
>   tests/i915/gem: remove igt_skip_on_simulation()
>   tests/i915/kms: remove igt_skip_on_simulation()
>   tests/i915: remove igt_skip_on_simulation()
>   tests: remove igt_skip_on_simulation()
>   tools: remove igt_skip_on_simulation()
>   benchmarks: remove igt_skip_on_simulation()
>   lib: remove igt_skip_on_simulation
>=20
>  benchmarks/gem_userptr_benchmark.c          | 2 --
>  lib/igt_aux.c                               | 7 -------
>  lib/intel_os.c                              | 2 --
>  tests/debugfs_test.c                        | 2 --
>  tests/i915/gem_busy.c                       | 2 --
>  tests/i915/gem_caching.c                    | 2 --
>  tests/i915/gem_concurrent_all.c             | 2 --
>  tests/i915/gem_create.c                     | 2 --
>  tests/i915/gem_cs_prefetch.c                | 2 --
>  tests/i915/gem_cs_tlb.c                     | 2 --
>  tests/i915/gem_ctx_exec.c                   | 2 --
>  tests/i915/gem_ctx_switch.c                 | 6 ------
>  tests/i915/gem_ctx_thrash.c                 | 2 --
>  tests/i915/gem_double_irq_loop.c            | 2 --
>  tests/i915/gem_eio.c                        | 2 --
>  tests/i915/gem_exec_async.c                 | 2 --
>  tests/i915/gem_exec_balancer.c              | 2 --
>  tests/i915/gem_exec_blt.c                   | 2 --
>  tests/i915/gem_exec_capture.c               | 2 --
>  tests/i915/gem_exec_fence.c                 | 2 --
>  tests/i915/gem_exec_gttfill.c               | 2 --
>  tests/i915/gem_exec_lut_handle.c            | 2 --
>  tests/i915/gem_exec_schedule.c              | 2 --
>  tests/i915/gem_exec_suspend.c               | 2 --
>  tests/i915/gem_fence_thrash.c               | 2 --
>  tests/i915/gem_fence_upload.c               | 2 --
>  tests/i915/gem_fenced_exec_thrash.c         | 2 --
>  tests/i915/gem_flink_race.c                 | 2 --
>  tests/i915/gem_gtt_cpu_tlb.c                | 2 --
>  tests/i915/gem_gtt_hog.c                    | 2 --
>  tests/i915/gem_gtt_speed.c                  | 2 --
>  tests/i915/gem_largeobject.c                | 2 --
>  tests/i915/gem_madvise.c                    | 2 --
>  tests/i915/gem_mmap_offset_exhaustion.c     | 2 --
>  tests/i915/gem_partial_pwrite_pread.c       | 2 --
>  tests/i915/gem_persistent_relocs.c          | 2 --
>  tests/i915/gem_pread_after_blit.c           | 2 --
>  tests/i915/gem_pwrite_pread.c               | 2 --
>  tests/i915/gem_pwrite_snooped.c             | 2 --
>  tests/i915/gem_read_read_speed.c            | 2 --
>  tests/i915/gem_readwrite.c                  | 2 --
>  tests/i915/gem_reloc_vs_gpu.c               | 2 --
>  tests/i915/gem_render_linear_blits.c        | 3 ---
>  tests/i915/gem_render_tiled_blits.c         | 3 ---
>  tests/i915/gem_reset_stats.c                | 1 -
>  tests/i915/gem_ringfill.c                   | 2 --
>  tests/i915/gem_set_tiling_vs_blt.c          | 2 --
>  tests/i915/gem_set_tiling_vs_gtt.c          | 2 --
>  tests/i915/gem_set_tiling_vs_pwrite.c       | 2 --
>  tests/i915/gem_shrink.c                     | 2 --
>  tests/i915/gem_softpin.c                    | 2 --
>  tests/i915/gem_spin_batch.c                 | 2 --
>  tests/i915/gem_stolen.c                     | 2 --
>  tests/i915/gem_storedw_batches_loop.c       | 2 --
>  tests/i915/gem_sync.c                       | 2 --
>  tests/i915/gem_threaded_access_tiled.c      | 2 --
>  tests/i915/gem_tiled_fence_blits.c          | 3 ---
>  tests/i915/gem_tiled_partial_pwrite_pread.c | 2 --
>  tests/i915/gem_unfence_active_buffers.c     | 2 --
>  tests/i915/gem_unref_active_buffers.c       | 2 --
>  tests/i915/gem_wait.c                       | 2 --
>  tests/i915/gem_write_read_ring_switch.c     | 2 --
>  tests/i915/i915_hangman.c                   | 2 --
>  tests/i915/i915_pm_backlight.c              | 2 --
>  tests/i915/i915_pm_dc.c                     | 1 -
>  tests/i915/i915_pm_rc6_residency.c          | 2 --
>  tests/i915/i915_pm_rps.c                    | 2 --
>  tests/i915/i915_pm_sseu.c                   | 3 ---
>  tests/i915/i915_suspend.c                   | 2 --
>  tests/kms_atomic_interruptible.c            | 2 --
>  tests/kms_atomic_transition.c               | 2 --
>  tests/kms_available_modes_crc.c             | 2 --
>  tests/kms_big_fb.c                          | 2 --
>  tests/kms_busy.c                            | 2 --
>  tests/kms_chamelium.c                       | 2 --
>  tests/kms_color.c                           | 2 --
>  tests/kms_concurrent.c                      | 2 --
>  tests/kms_content_protection.c              | 2 --
>  tests/kms_crtc_background_color.c           | 2 --
>  tests/kms_cursor_crc.c                      | 2 --
>  tests/kms_cursor_edge_walk.c                | 2 --
>  tests/kms_fence_pin_leak.c                  | 2 --
>  tests/kms_flip_event_leak.c                 | 2 --
>  tests/kms_flip_tiling.c                     | 2 --
>  tests/kms_invalid_dotclock.c                | 2 --
>  tests/kms_legacy_colorkey.c                 | 2 --
>  tests/kms_mmap_write_crc.c                  | 2 --
>  tests/kms_panel_fitting.c                   | 2 --
>  tests/kms_pipe_b_c_ivb.c                    | 2 --
>  tests/kms_pipe_crc_basic.c                  | 2 --
>  tests/kms_plane.c                           | 2 --
>  tests/kms_plane_cursor.c                    | 2 --
>  tests/kms_plane_lowres.c                    | 2 --
>  tests/kms_plane_multiple.c                  | 2 --
>  tests/kms_plane_scaling.c                   | 2 --
>  tests/kms_properties.c                      | 2 --
>  tests/kms_psr.c                             | 2 --
>  tests/kms_psr2_su.c                         | 2 --
>  tests/kms_pwrite_crc.c                      | 2 --
>  tests/kms_rmfb.c                            | 2 --
>  tests/kms_rotation_crc.c                    | 2 --
>  tests/kms_sequence.c                        | 2 --
>  tests/kms_setmode.c                         | 2 --
>  tests/kms_universal_plane.c                 | 2 --
>  tests/kms_vblank.c                          | 2 --
>  tests/kms_vrr.c                             | 2 --
>  tests/perf.c                                | 2 --
>  tests/prime_busy.c                          | 1 -
>  tests/prime_mmap_kms.c                      | 2 --
>  tests/prime_udl.c                           | 2 --
>  tests/testdisplay.c                         | 1 -
>  tests/tools_test.c                          | 2 --
>  tools/intel_dp_compliance.c                 | 2 --
>  113 files changed, 235 deletions(-)
>=20

--=-OzcKaXAnaP/2D2TigGvl
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
PwuHX1mRETAlwqXCZa6ba8eraUCltlCb/ZiEk9UFRVLjbLNPh9IYOi+sWkS6n5CovLKAqhMCAwEA
AaOCAjMwggIvMB0GA1UdDgQWBBSgeYqvLV4nBaCUzAXLr0TeMJYR5zAfBgNVHSMEGDAWgBTaQSOc
Wo9xr1eDPiDT42XbDMsL2zBlBgNVHR8EXjBcMFqgWKBWhlRodHRwOi8vd3d3LmludGVsLmNvbS9y
ZXBvc2l0b3J5L0NSTC9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0
Qi5jcmwwgZ8GCCsGAQUFBwEBBIGSMIGPMCIGCCsGAQUFBzABhhZodHRwOi8vb2NzcC5pbnRlbC5j
b20vMGkGCCsGAQUFBzAChl1odHRwOi8vd3d3LmludGVsLmNvbS9yZXBvc2l0b3J5L2NlcnRpZmlj
YXRlcy9JbnRlbCUyMEV4dGVybmFsJTIwQmFzaWMlMjBJc3N1aW5nJTIwQ0ElMjA0Qi5jcnQwCwYD
VR0PBAQDAgeAMDwGCSsGAQQBgjcVBwQvMC0GJSsGAQQBgjcVCIbDjHWEmeVRg/2BKIWOn1OCkcAJ
Z4HevTmV8EMCAWQCAQkwHwYDVR0lBBgwFgYIKwYBBQUHAwQGCisGAQQBgjcKAwwwKQYJKwYBBAGC
NxUKBBwwGjAKBggrBgEFBQcDBDAMBgorBgEEAYI3CgMMME0GA1UdEQRGMESgKAYKKwYBBAGCNxQC
A6AaDBhzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb22BGHN0dWFydC5zdW1tZXJzQGludGVsLmNvbTAN
BgkqhkiG9w0BAQUFAAOCAQEAfyIC7rzSi6S8O+sdH384K8zyeMRJnl6vR7whl9PuEat+BkKpoxHn
jQ0SFyF/cyI4lH/n938Pm3/Ctq0Z5GTldX6hhxxcLAR0qbk6AQU0Cq2nYMlZfX4FUz3FRsazbjTW
1qObcvPRUAVScaa7SRGdensvbNV++pN1XqEdc++szxo58UzPaEgDlHIe2sEIVXnFkHnJv0ikRHG3
urcA1bdj7Rac7dJBeQOQMdZEGmrWWmmbJzvk3OmoK9tKN7wcErQSdlqyYOMLesPfa7YNyLFYEJQd
CC/N7V8U9yFZx8akWREb8lJYDl9KypirEsufleiew26CWrwcbmdlldDCFS6/HDGCAhcwggITAgEB
MIGQMHkxCzAJBgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAY
BgNVBAoTEUludGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJ
c3N1aW5nIENBIDRCAhMzAAB04Th3owY0UbEUAAAAAHThMAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0B
CQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTEyMDMwNTE3MjlaMCMGCSqGSIb3DQEJ
BDEWBBSZ0EtXqxwZEwIrHB5dNIjICKOkWjANBgkqhkiG9w0BAQEFAASCAQA0YhyHGarInhGkt87k
KRd/Wr3uxdd7a7VVVJ/srZfoND9/BB/+Jzr8TvLxuAQVrbcFoJNZLjiHk/JsxhDJzrmCHPphoI//
3EiyIP5B6Y5IW7GXu7x55/GiQR8t55uXt6rO1HE0rlrjfKh9h6d++IZgRExBkSB4p9xptGWp96tc
EuWnRD26SXD6qtAUZ4JVhFZeFe7YlwBbC5EESPdgzgKxX9eb7DMQ62NFH67g9TC8UYp4Pu04N6o5
XeEzemuNzpY9/J0H4arboa56pz2qEZuEgY5ztj5RgCjamYR3/9XfcFrfBg63PpyhGNqAhI88BflA
wktvW2QhS3eRA1tfdVrXAAAAAAAA


--=-OzcKaXAnaP/2D2TigGvl--

--===============0452624492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0452624492==--
