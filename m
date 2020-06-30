Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1CB389C07
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2020 06:25:45 +0000 (UTC)
Date: Tue, 30 Jun 2020 11:53:28 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20200630062325.GA2976@arjun-NUC8i7BEH>
References: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200629125948.8734-1-priyanka.dandamudi@intel.com>
Subject: Re: [igt-dev] [PATCH] [PATCH i-g-t] i915/gem_reg_read: Added
 description for test case
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 06:29:48PM +0530, priyanka.dandamudi@intel.com wrote:
> From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> 
> Added test description for test and to all 3 subtests.
> 
> Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
> ---
>  tests/i915/gem_reg_read.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
> index 79facc1f..dfc2560e 100644
> --- a/tests/i915/gem_reg_read.c
> +++ b/tests/i915/gem_reg_read.c
> @@ -32,6 +32,7 @@
>  #include <sys/utsname.h>
>  #include <time.h>
>  
> +IGT_TEST_DESCRIPTION("Test the basic register read ioctl.");
Can you add more information about type of registers this test would check in description.
>  
>  static bool is_x86_64;
>  static bool has_proper_timestamp;
> @@ -156,14 +157,19 @@ igt_main
>  		has_proper_timestamp = check_timestamp(fd);
>  	}
>  
> +	igt_describe("Verifies reading bad register result in error or not.");
>  	igt_subtest("bad-register")
>  		igt_assert_eq(read_register(fd, 0x12345678, &val), -EINVAL);
>  
> +	igt_describe("Checks whether the timestamp register is getting"
> +		     " updated when any operation(noop) is being performed.");
>  	igt_subtest("timestamp-moving") {
>  		igt_skip_on(timer_query(fd, &val) != 0);
>  		test_timestamp_moving(fd);
>  	}
>  
> +	igt_describe("Checks whether timestamp is monotonic while performing"
> +		     " an operation(noop) in a loop.");
>  	igt_subtest("timestamp-monotonic") {
>  		igt_skip_on(timer_query(fd, &val) != 0);
>  		test_timestamp_monotonic(fd);
> -- 
> 2.26.2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
