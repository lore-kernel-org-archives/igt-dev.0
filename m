Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2EF010EC74
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Apr 2022 09:46:45 +0000 (UTC)
Date: Mon, 4 Apr 2022 11:46:41 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ykq+gYSMaiZ7NDrM@kamilkon-DESK1>
References: <20220404084852.24975-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220404084852.24975-1-zbigniew.kempczynski@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_eio: Fix missing
 multiprocess allocator environment
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

Dnia 2022-04-04 at 10:48:52 +0200, Zbigniew Kempczyński napisał(a):
> On discrete we need to ensure that allocator is able to run in
> multiprocess mode otherwise we encounter crashes.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/4928
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/gem_eio.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 39cd6a1deb..d9689534d5 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -1111,9 +1111,14 @@ igt_main
>  
>  			igt_display_require(&display, fd);
>  			igt_display_require_output(&display);
> +			intel_allocator_multiprocess_start();
>  		}
>  
>  		igt_subtest("kms")
>  			test_kms(fd, &display);
> +
> +		igt_fixture {
> +			intel_allocator_multiprocess_stop();
> +		}
>  	}
>  }
> -- 
> 2.32.0
> 
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil
