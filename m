Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA0E10E7B1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Mar 2022 08:19:16 +0000 (UTC)
Date: Tue, 29 Mar 2022 10:19:12 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkLBAOaYNFphQQFm@kamilkon-DESK1>
References: <20220317053003.402-1-sai.gowtham.ch@intel.com>
 <20220317053003.402-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220317053003.402-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/i915/gem_basic: Added test
 description for test case.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi,

Dnia 2022-03-17 at 11:00:02 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to all the available subtests.
> 
> Cc: Melkaveri Arjun <Arjun.Melkaveri@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_basic.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/tests/i915/gem_basic.c b/tests/i915/gem_basic.c
> index 13ecce52..17ae190c 100644
> --- a/tests/i915/gem_basic.c
> +++ b/tests/i915/gem_basic.c
> @@ -39,6 +39,8 @@
>  #include "drm.h"
>  #include "i915/gem_create.h"
>  
> +IGT_TEST_DESCRIPTION("Tests basic gem_create and gem_close IOCTLs");
> +
>  static void
>  test_bad_close(int fd)
>  {
> @@ -83,10 +85,15 @@ igt_main
>  	igt_fixture
>  		fd = drm_open_driver(DRIVER_INTEL);
>  
> +	igt_describe("Verify that gem_close fails with bad params.");
>  	igt_subtest("bad-close")
>  		test_bad_close(fd);
> +
> +	igt_describe("Verify basic functionality of gem_create and gem_close.");
>  	igt_subtest("create-close")
>  		test_create_close(fd);
> +
> +	igt_describe("Verify that closing drm driver is possible with opened gem object.");
>  	igt_subtest("create-fd-close")
>  		test_create_fd_close(fd);
>  }
> -- 
> 2.35.1
> 
Looks good to me,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
