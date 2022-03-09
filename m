Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999BF10E97E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Mar 2022 12:19:52 +0000 (UTC)
Date: Wed, 9 Mar 2022 13:19:48 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YiibZLnPkXJw1Rfh@kamilkon-DESK1>
References: <20220309092017.140761-1-priyanka.dandamudi@intel.com>
 <20220309092017.140761-2-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220309092017.140761-2-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/vgem_basic: Added test
 description for test case
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

Dnia 2022-03-09 at 14:50:16 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: rebase
> 
> v3: Minor corrections to descriptions.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/vgem_basic.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 57c575e2..2a2900f8 100644
> --- a/tests/vgem_basic.c
> +++ b/tests/vgem_basic.c
> @@ -410,6 +410,7 @@ igt_main
>  {
>  	int fd = -1;
>  
> +	igt_describe("Basic test for handling of module unload.");
>  	igt_subtest("unload")
>  		test_unload();
>  
> @@ -417,15 +418,19 @@ igt_main
>  		fd = drm_open_driver(DRIVER_VGEM);
>  	}
>  
> +	igt_describe("Check the working of SET_VERSION ioctl.");
>  	igt_subtest_f("setversion")
>  		test_setversion(fd);
>  
> +	igt_describe("Check whether it can open multiple clients.");
>  	igt_subtest_f("second-client")
>  		test_client(fd);
>  
> +	igt_describe("Check the basic working of vgem_create ioctl.");
>  	igt_subtest_f("create")
>  		test_create(fd);
>  
> +	igt_describe("Create a vgem handle and check if it can be mmaped.");
>  	igt_subtest_f("mmap")
>  		test_mmap(fd);
>  
> @@ -434,9 +439,13 @@ igt_main
>  			igt_require(has_prime_export(fd));
>  		}
>  
> +		igt_describe("Check whether it can export/import the vgem handle"
> +			     " using prime.");
>  		igt_subtest("dmabuf-export")
>  			test_dmabuf_export(fd);
>  
> +		igt_describe("Export the vgem handle along with RDWR capabilities"
> +			     " using prime and check if it can be mmaped.");
>  		igt_subtest("dmabuf-mmap")
>  			test_dmabuf_mmap(fd);
>  
> @@ -445,15 +454,22 @@ igt_main
>  				igt_require(vgem_has_fences(fd));
>  			}
>  
> +			igt_describe("Check the working of dma-buf fence interop.");
>  			igt_subtest("dmabuf-fence")
>  				test_dmabuf_fence(fd);
> +			igt_describe("Attach a fence before exporting a vgem handle"
> +				     " and check the working of fence.");
>  			igt_subtest("dmabuf-fence-before")
>  				test_dmabuf_fence_before(fd);
>  		}
>  	}
>  
> +	igt_describe("Check the basic access to sysfs and also try to"
> +		     " read entries in the directory.");
>  	igt_subtest("sysfs")
>  		test_sysfs_read(fd);
> +	igt_describe("Check the basic access to debugfs and also try to"
> +		     " read entries in the directory.");
>  	igt_subtest("debugfs")
>  		test_debugfs_read(fd);
>  
> -- 
> 2.25.1
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
