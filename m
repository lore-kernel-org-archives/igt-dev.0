Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA626E527
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 13:42:28 +0000 (UTC)
Date: Thu, 19 Nov 2020 14:42:24 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201119134224.GX6508@kdec5-desk.ger.corp.intel.com>
References: <20201103175827.78443-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201103175827.78443-1-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_flink_basic: Add subtests
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
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Nov 03, 2020 at 11:28:27PM +0530, apoorva1.singh@intel.com wrote:
> From: Apoorva Singh <apoorva1.singh@intel.com>
> 
Be more expressive in commit msg. Why the change is needed?

> Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
> Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_flink_basic.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/i915/gem_flink_basic.c b/tests/i915/gem_flink_basic.c
> index 48b0b8b1..a67fb8fc 100644
> --- a/tests/i915/gem_flink_basic.c
> +++ b/tests/i915/gem_flink_basic.c
> @@ -161,16 +161,24 @@ igt_main
>  	igt_fixture
>  		fd = drm_open_driver(DRIVER_INTEL);
>  
> +	igt_describe("Basic test for GEM_FLINK and GEM_OPEN ioctls");
This description tells what is used, not why or what for.
Let's try one:
igt_describe("Check if gem obj names can be coverted to handles and opened.");

>  	igt_subtest("basic")
>  		test_flink(fd);
> +
For more please refer to Gem Objects naming documentation.
Kasia
> +	igt_describe("Tests that multiple flinks for the same gem object share the same name");
>  	igt_subtest("double-flink")
>  		test_double_flink(fd);
> +
> +	igt_describe("Verify that GEM_FLINK ioctl with invalid gem object retuns relevant error");
>  	igt_subtest("bad-flink")
>  		test_bad_flink(fd);
> +
> +	igt_describe("Verify that GEM_OPEN ioctl with invalid flink name retuns relevant error");
>  	igt_subtest("bad-open")
>  		test_bad_open(fd);
>  
>  	/* Flink lifetime is limited to that of the gem object it points to */
> +	igt_describe("Tests flink lifetime by referencing it from multiple fd's");
>  	igt_subtest("flink-lifetime")
>  		test_flink_lifetime(fd);
>  }
> -- 
> 2.25.1
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
