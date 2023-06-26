Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A0C10E23C
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:19:34 +0000 (UTC)
Date: Mon, 26 Jun 2023 18:19:30 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230626161930.gwzwmmoxsmvxirge@kamilkon-desk1>
References: <20230626051031.2363120-1-bhanuprakash.modem@intel.com>
 <20230626051031.2363120-7-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230626051031.2363120-7-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [V4 i-g-t 06/24] tests/i915: Close the fd before exit
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
On 2023-06-26 at 10:40:13 +0530, Bhanuprakash Modem wrote:
> Close the file descriptor before exiting the test.
> 
> V2: - Drop tests those are initializing the fd with igt_fd_t
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/dmabuf_sync_file.c        | 3 +++
>  tests/i915/gem_barrier_race.c   | 3 +++
>  tests/i915/gem_concurrent_all.c | 5 +++++
>  tests/i915/gem_ctx_exec.c       | 3 +++
>  tests/i915/gem_ctx_freq.c       | 3 +++
>  tests/i915/gem_eio.c            | 3 +++
>  tests/i915/i915_pm_rps.c        | 3 +++
>  7 files changed, 23 insertions(+)
> 
> diff --git a/tests/dmabuf_sync_file.c b/tests/dmabuf_sync_file.c
> index 25bb6ad75..cfa73117b 100644
> --- a/tests/dmabuf_sync_file.c
> +++ b/tests/dmabuf_sync_file.c
> @@ -380,4 +380,7 @@ igt_main
>  		     "operations.");
>  	igt_subtest("import-multiple-read-write")
>  		test_import_multiple(fd, true);
> +
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index be71d20e7..0ac1da3a4 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -165,4 +165,7 @@ igt_main
>  			break;
>  		}
>  	}
> +
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
> index fb3b5f5d8..0bf46c0a2 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -2015,4 +2015,9 @@ igt_main
>  			}
>  		}
>  	}
> +
> +	igt_fixture {
> +		drm_close_driver(fd);
> +		drm_close_driver(vgem_drv);
> +	}
>  }
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index bd6671ec8..f3939df86 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -605,4 +605,7 @@ igt_main
>  		gem_context_destroy(fd, ctx_id);
>  		put_ahnd(ahnd);
>  	}
> +
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/gem_ctx_freq.c b/tests/i915/gem_ctx_freq.c
> index d15f83600..8c0d7db3c 100644
> --- a/tests/i915/gem_ctx_freq.c
> +++ b/tests/i915/gem_ctx_freq.c
> @@ -261,4 +261,7 @@ igt_main
>  			igt_dynamic_f("gt%u", gt)
>  				sysfs_range(dirfd, gt);
>  	}
> +
> +	igt_fixture
> +		drm_close_driver(i915);
>  }
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index a5ebe6d2d..38fd19e89 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -1321,4 +1321,7 @@ igt_main
>  			intel_allocator_multiprocess_stop();
>  		}
>  	}
> +
> +	igt_fixture
> +		drm_close_driver(fd);
>  }
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index eaacc7c90..238d39240 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -999,4 +999,7 @@ igt_main
>  		waitboost(drm_fd, true);
>  		igt_disallow_hang(drm_fd, hang);
>  	}
> +
> +	igt_fixture
> +		drm_close_driver(drm_fd);
>  }
> -- 
> 2.40.0
> 
