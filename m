Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C074B10E55D
 for <igt-dev@lists.freedesktop.org>; Thu, 18 May 2023 19:14:21 +0000 (UTC)
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Date: Thu, 18 May 2023 19:14:16 +0000
Message-ID: <MW3PR11MB4748DF62B46BFD48B6407A04AE7F9@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20230516165058.4047595-1-bhanuprakash.modem@intel.com>
 <20230516165058.4047595-17-bhanuprakash.modem@intel.com>
In-Reply-To: <20230516165058.4047595-17-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t 16/20] tests/xe: Use drm_close_driver() to
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

LGTM
Reviewed-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

> -----Original Message-----
> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Sent: 16 May 2023 22:21
> To: igt-dev@lists.freedesktop.org; kamil.konieczny@linux.intel.com; Kumar=
,
> Janga Rahul <janga.rahul.kumar@intel.com>
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Subject: [i-g-t 16/20] tests/xe: Use drm_close_driver() to close the drm =
fd
>=20
> To close the drm file descriptor, use igt helper drm_close_driver() inste=
ad of
> using close().
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/testdisplay.c             |  4 ++--
>  tests/xe/xe_compute.c           |  2 +-
>  tests/xe/xe_create.c            |  2 +-
>  tests/xe/xe_debugfs.c           |  2 +-
>  tests/xe/xe_dma_buf_sync.c      |  4 ++--
>  tests/xe/xe_evict.c             |  6 +++---
>  tests/xe/xe_exec_balancer.c     |  2 +-
>  tests/xe/xe_exec_basic.c        |  2 +-
>  tests/xe/xe_exec_compute_mode.c |  2 +-
>  tests/xe/xe_exec_fault_mode.c   |  2 +-
>  tests/xe/xe_exec_reset.c        |  8 ++++----
>  tests/xe/xe_exec_threads.c      |  8 ++++----
>  tests/xe/xe_guc_pc.c            |  2 +-
>  tests/xe/xe_huc_copy.c          |  2 +-
>  tests/xe/xe_intel_bb.c          |  2 +-
>  tests/xe/xe_mmap.c              |  2 +-
>  tests/xe/xe_mmio.c              |  2 +-
>  tests/xe/xe_module_load.c       |  2 +-
>  tests/xe/xe_noexec_ping_pong.c  |  2 +-
>  tests/xe/xe_pm.c                |  2 +-
>  tests/xe/xe_prime_self_import.c | 30 +++++++++++++++---------------
>  tests/xe/xe_query.c             |  2 +-
>  tests/xe/xe_vm.c                |  2 +-
>  tests/xe/xe_waitfence.c         |  2 +-
>  24 files changed, 48 insertions(+), 48 deletions(-)
>=20
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c index ee272dfb2..2=
94d4c604
> 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -548,7 +548,7 @@ int update_display(bool probe)
>=20
>  __noreturn static void cleanup_and_exit(int ret)  {
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  	exit(ret);
>  }
>=20
> @@ -779,7 +779,7 @@ out_hotplug:
>  out_mainloop:
>  	g_main_loop_unref(mainloop);
>  out_close:
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>=20
>  	igt_assert_eq(ret, 0);
>  }
> diff --git a/tests/xe/xe_compute.c b/tests/xe/xe_compute.c index
> 7ac64dfe3..5e6cd8529 100644
> --- a/tests/xe/xe_compute.c
> +++ b/tests/xe/xe_compute.c
> @@ -45,6 +45,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(xe);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  }
> diff --git a/tests/xe/xe_create.c b/tests/xe/xe_create.c index
> 5effabc83..959dd27e7 100644
> --- a/tests/xe/xe_create.c
> +++ b/tests/xe/xe_create.c
> @@ -127,6 +127,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(xe);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  }
> diff --git a/tests/xe/xe_debugfs.c b/tests/xe/xe_debugfs.c index
> 6bdd3ef06..4006981c6 100644
> --- a/tests/xe/xe_debugfs.c
> +++ b/tests/xe/xe_debugfs.c
> @@ -270,6 +270,6 @@ igt_main_args("", long_options, help_str, opt_handler=
,
> NULL)
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c inde=
x
> 8920b141b..81ece2428 100644
> --- a/tests/xe/xe_dma_buf_sync.c
> +++ b/tests/xe/xe_dma_buf_sync.c
> @@ -220,7 +220,7 @@ test_export_dma_buf(struct
> drm_xe_engine_class_instance *hwe0,
>=20
>  	for (i =3D 0; i < N_FD; ++i) {
>  		xe_device_put(fd[i]);
> -		close(fd[i]);
> +		drm_close_driver(fd[i]);
>  	}
>=20
>  }
> @@ -257,6 +257,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c index
> 7fef4efc5..4b66dd683 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -201,7 +201,7 @@ test_evict(int fd, struct drm_xe_engine_class_instanc=
e
> *eci,
>  		xe_vm_destroy(fd, vm3);
>  	}
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>=20
>  static void
> @@ -369,7 +369,7 @@ test_evict_cm(int fd, struct
> drm_xe_engine_class_instance *eci,
>  	if (flags & MULTI_VM)
>  		xe_vm_destroy(fd, vm2);
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>=20
>  struct thread_data {
> @@ -701,5 +701,5 @@ igt_main
>  	}
>=20
>  	igt_fixture
> -		close(fd);
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c in=
dex
> 2018c8104..fb4592903 100644
> --- a/tests/xe/xe_exec_balancer.c
> +++ b/tests/xe/xe_exec_balancer.c
> @@ -708,6 +708,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c index
> 2a176a5b3..d14a764f4 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -353,6 +353,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_exec_compute_mode.c
> b/tests/xe/xe_exec_compute_mode.c index 685193990..950cb6159 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -361,6 +361,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.=
c
> index a3ab17270..8cd883c09 100644
> --- a/tests/xe/xe_exec_fault_mode.c
> +++ b/tests/xe/xe_exec_fault_mode.c
> @@ -570,6 +570,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c index
> 0d72a3f20..3700b8dce 100644
> --- a/tests/xe/xe_exec_reset.c
> +++ b/tests/xe/xe_exec_reset.c
> @@ -294,7 +294,7 @@ test_balancer(int fd, int gt, int class, int n_engine=
s, int
> n_execs,
>  				xe_engine_destroy(fd, engines[i]);
>  		}
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
>  		return;
> @@ -475,7 +475,7 @@ test_legacy_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				xe_engine_destroy(fd, engines[i]);
>  		}
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
>  		return;
> @@ -655,7 +655,7 @@ test_compute_mode(int fd, struct
> drm_xe_engine_class_instance *eci,
>  				xe_engine_destroy(fd, engines[i]);
>  		}
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  		/* FIXME: wait for idle */
>  		usleep(150000);
>  		return;
> @@ -946,6 +946,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c inde=
x
> 3f2c2de9e..bde92a9c5 100644
> --- a/tests/xe/xe_exec_threads.c
> +++ b/tests/xe/xe_exec_threads.c
> @@ -245,7 +245,7 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t a=
ddr,
> uint64_t userptr,
>  		xe_vm_destroy(fd, vm);
>  	if (owns_fd) {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
>=20
> @@ -454,7 +454,7 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr,
> uint64_t userptr,
>  		xe_vm_destroy(fd, vm);
>  	if (owns_fd) {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
>=20
> @@ -698,7 +698,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr,
> uint64_t userptr,
>  		xe_vm_destroy(fd, vm);
>  	if (owns_fd) {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
>=20
> @@ -1403,6 +1403,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> 5c71ae147..56d4f9190 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -496,6 +496,6 @@ igt_main
>  		}
>  		close(sysfs);
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_huc_copy.c b/tests/xe/xe_huc_copy.c index
> fdac907d6..ccdfe8622 100644
> --- a/tests/xe/xe_huc_copy.c
> +++ b/tests/xe/xe_huc_copy.c
> @@ -192,6 +192,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(xe);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  }
> diff --git a/tests/xe/xe_intel_bb.c b/tests/xe/xe_intel_bb.c index
> 35d61608e..f43beb1a8 100644
> --- a/tests/xe/xe_intel_bb.c
> +++ b/tests/xe/xe_intel_bb.c
> @@ -1180,6 +1180,6 @@ igt_main_args("dpib", NULL, help_str, opt_handler,
> NULL)
>  	igt_fixture {
>  		xe_device_put(xe);
>  		buf_ops_destroy(bops);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  }
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c index
> 6b313a189..352cbcab4 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -77,6 +77,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_mmio.c b/tests/xe/xe_mmio.c index
> 42b6241b1..77a38b8d1 100644
> --- a/tests/xe/xe_mmio.c
> +++ b/tests/xe/xe_mmio.c
> @@ -89,6 +89,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c index
> c2d43cc20..16432c78f 100644
> --- a/tests/xe/xe_module_load.c
> +++ b/tests/xe/xe_module_load.c
> @@ -86,7 +86,7 @@ static void load_and_check_xe(const char *opts)
>  	/* driver is ready, check if it's bound */
>  	drm_fd =3D __drm_open_driver(DRIVER_XE);
>  	igt_fail_on_f(drm_fd < 0, "Cannot open the xe DRM driver after
> modprobing xe.\n");
> -	close(drm_fd);
> +	drm_close_driver(drm_fd);
>  }
>=20
>  static const char * const unwanted_drivers[] =3D { diff --git
> a/tests/xe/xe_noexec_ping_pong.c b/tests/xe/xe_noexec_ping_pong.c index
> 367671883..f276e694c 100644
> --- a/tests/xe/xe_noexec_ping_pong.c
> +++ b/tests/xe/xe_noexec_ping_pong.c
> @@ -104,5 +104,5 @@ igt_simple_main
>  	test_ping_pong(fd, xe_hw_engine(fd, 0));
>=20
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c index 44154143c..7bec294=
ed
> 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -441,6 +441,6 @@ igt_main
>  		set_d3cold_allowed(device.pci_xe, d3cold_allowed);
>  		igt_restore_runtime_pm();
>  		xe_device_put(device.fd_xe);
> -		close(device.fd_xe);
> +		drm_close_driver(device.fd_xe);
>  	}
>  }
> diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_imp=
ort.c
> index 4e8fd5d4f..a86d0e9f2 100644
> --- a/tests/xe/xe_prime_self_import.c
> +++ b/tests/xe/xe_prime_self_import.c
> @@ -122,9 +122,9 @@ static void test_with_fd_dup(void)
>  	check_bo(fd2, handle_import, fd2, handle_import);
>=20
>  	xe_device_put(fd1);
> -	close(fd1);
> +	drm_close_driver(fd1);
>  	xe_device_put(fd2);
> -	close(fd2);
> +	drm_close_driver(fd2);
>  }
>=20
>  /**
> @@ -166,9 +166,9 @@ static void test_with_two_bos(void)
>  	check_bo(fd2, handle_import, fd2, handle_import);
>=20
>  	xe_device_put(fd1);
> -	close(fd1);
> +	drm_close_driver(fd1);
>  	xe_device_put(fd2);
> -	close(fd2);
> +	drm_close_driver(fd2);
>  }
>=20
>  /**
> @@ -202,9 +202,9 @@ static void test_with_one_bo_two_files(void)
>  	igt_assert_eq_u32(handle_import, handle_open);
>=20
>  	xe_device_put(fd1);
> -	close(fd1);
> +	drm_close_driver(fd1);
>  	xe_device_put(fd2);
> -	close(fd2);
> +	drm_close_driver(fd2);
>  	close(dma_buf_fd1);
>  	close(dma_buf_fd2);
>  }
> @@ -259,10 +259,10 @@ static void test_with_one_bo(void)
>=20
>  	/* Completely rip out exporting fd. */
>  	xe_device_put(fd1);
> -	close(fd1);
> +	drm_close_driver(fd1);
>  	check_bo(fd2, handle_import1, fd2, handle_import1);
>  	xe_device_put(fd2);
> -	close(fd2);
> +	drm_close_driver(fd2);
>  }
>=20
>  static void *thread_fn_reimport_vs_close(void *p) @@ -335,7 +335,7 @@
> static void *thread_fn_reimport_vs_close(void *p)
>=20
>  	pthread_barrier_destroy(&g_barrier);
>  	xe_device_put(fds[0]);
> -	close(fds[0]);
> +	drm_close_driver(fds[0]);
>  	close(fds[1]);
>=20
>  	/* TODO: Read object count */
> @@ -343,7 +343,7 @@ static void *thread_fn_reimport_vs_close(void *p)
>=20
>  	igt_info("leaked %i objects\n", obj_count);
>=20
> -	close(fake);
> +	drm_close_driver(fake);
>=20
>  	igt_assert_eq(obj_count, 0);
>  }
> @@ -429,7 +429,7 @@ static void test_export_close_race(void)
>=20
>  	pthread_barrier_destroy(&g_barrier);
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>=20
>  	/* TODO: Read object count */
>  	obj_count =3D 0;
> @@ -437,7 +437,7 @@ static void test_export_close_race(void)
>  	igt_info("leaked %i objects\n", obj_count);
>=20
>  	xe_device_put(fake);
> -	close(fake);
> +	drm_close_driver(fake);
>=20
>  	igt_assert_eq(obj_count, 0);
>  }
> @@ -474,7 +474,7 @@ static void test_llseek_size(void)
>  	}
>=20
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>=20
>  /**
> @@ -511,7 +511,7 @@ static void test_llseek_bad(void)
>  	close(dma_buf_fd);
>=20
>  	xe_device_put(fd);
> -	close(fd);
> +	drm_close_driver(fd);
>  }
>=20
>  igt_main
> @@ -544,6 +544,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c index
> 87990370f..1c06534d4 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -491,6 +491,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(xe);
> -		close(xe);
> +		drm_close_driver(xe);
>  	}
>  }
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c index d4cec104e..9015a5a=
57
> 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -1839,6 +1839,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> diff --git a/tests/xe/xe_waitfence.c b/tests/xe/xe_waitfence.c index
> cdfcacdb4..8bfb741f6 100644
> --- a/tests/xe/xe_waitfence.c
> +++ b/tests/xe/xe_waitfence.c
> @@ -98,6 +98,6 @@ igt_main
>=20
>  	igt_fixture {
>  		xe_device_put(fd);
> -		close(fd);
> +		drm_close_driver(fd);
>  	}
>  }
> --
> 2.40.0
