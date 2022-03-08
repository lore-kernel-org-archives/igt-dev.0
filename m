Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C5410E22F
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Mar 2022 13:40:09 +0000 (UTC)
Date: Tue, 8 Mar 2022 14:40:06 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YidctraQwkoou6lc@kamilkon-DESK1>
References: <20220225080831.44981-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220225080831.44981-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/vgem_basic: Added test
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

Hi Priyanka,

Dnia 2022-02-25 at 13:38:31 +0530, priyanka.dandamudi@intel.com napisał(a):
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description to all the available subtests.
> 
> v2: rebase
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/vgem_basic.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)

Please send your descripton patches as HAX series, e.g.
add second patch with file tests/intel-ci/fast-feedback.testlist
containing only one line:

igt@meta_test@fail-result

and in cover letter Subject put "HAX add description to [put name of test here]"

See e-mail from Zbigniew on 3 Mar 2022,
"Use HAX for series which add igt_describe"

> 
> diff --git a/tests/vgem_basic.c b/tests/vgem_basic.c
> index 57c575e2..5920a99a 100644
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
> +	igt_describe("Check the working of DRM_IOCTL_SET_VERSION ioctl.");
---------------------------------------------- ^^^^^
You already have IOCTL here, so either shorten this to
"SET_VERSION ioctl", e.g.
s/DRM_IOCTL_SET_VERSION ioctl/SET_VERSION ioctl/

or drop "ioctl" from end.

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
> +	igt_describe("Create a vgem handle and check if it can mmap the handle.");

s/it can mmap the handle./it can be mmaped./

>  	igt_subtest_f("mmap")
>  		test_mmap(fd);
>  
> @@ -433,10 +438,13 @@ igt_main
>  		igt_fixture {
>  			igt_require(has_prime_export(fd));
>  		}
> -
> +		igt_describe("Check whether it can export/import the vgem handle"
> +			     " using prime.");
>  		igt_subtest("dmabuf-export")
>  			test_dmabuf_export(fd);
> -
> +		igt_describe("Export the vgem handle along with RDWR capabilities"
> +			     " using prime and check if it can mmap the exported"
> +			     " handle.");

Same here, shorten end of description to "it can be mmaped", e.g.
			     " using prime and check if it can be mmaped.");


>  		igt_subtest("dmabuf-mmap")
>  			test_dmabuf_mmap(fd);
>  
> @@ -444,16 +452,22 @@ igt_main
>  			igt_fixture {
>  				igt_require(vgem_has_fences(fd));
>  			}
> -
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

Regards,
Kamil
