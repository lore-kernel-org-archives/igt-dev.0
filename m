Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CF2A10E3E4
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 08:17:19 +0000 (UTC)
Date: Tue, 15 Feb 2022 09:17:14 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <Ygthio+W/Qh18coe@zkempczy-mobl2>
References: <20220214141657.21122-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220214141657.21122-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/api_intel_allocator: fix
 standalone subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 14, 2022 at 03:16:57PM +0100, Kamil Konieczny wrote:
> Subtest standalone uses igt_fork macro and after that makes
> checks of work done by children processes, but this macro start
> counting from zero, it never touches index 2. Fix it with
> corrected index.
>   This wasn't observed in CI due to HIGH_TO_LOW strategy used as
> default in allocator so first obtained offset was never zero.
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/api_intel_allocator.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index 6d7764ca..5edba27f 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -327,7 +327,7 @@ static void standalone(int fd)
>  	}
>  	igt_waitchildren();
>  	igt_assert_eq(offset, shared[1]);
> -	igt_assert_neq(offset, shared[2]);
> +	igt_assert_neq(offset, shared[0]);
>  
>  	intel_allocator_free(ahnd, handle);
>  	igt_assert_eq(intel_allocator_close(ahnd), true);
> -- 
> 2.32.0
> 

You're right - test is working on wrong indices. But before we will
merge please change also comment as well as standalone (child 0) 
should be first (currently 0 is shared and 1 standalone). My initial
idea was to detach in first child and share allocator in second one.
Then change asserts accordingly.

--
Zbigniew
