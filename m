Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EBEC6E5CA
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2020 17:41:30 +0000 (UTC)
Date: Thu, 19 Nov 2020 18:41:25 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20201119174125.GB6508@kdec5-desk.ger.corp.intel.com>
References: <20201105042851.19770-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105042851.19770-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Added test description for test case.
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
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 09:58:51AM +0530, sai.gowtham.ch@intel.com wrote:
> From: sai gowtham <sai.gowtham.ch@intel.com>
Name of test missing from patch subject.

> 
> Added test description to test and basic-all subtest
Maybe you could add brief descriptions to all cases?
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: sai gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_ringfill.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index c499cb0d..aebbd15a 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -50,6 +50,9 @@
>  #define HIBERNATE 0x40
>  #define NEWFD 0x80
>  
> +IGT_TEST_DESCRIPTION("This test does many tiny batchbuffer operations, in the"
> +		" hope of catching failure to manage the ring properly near full");
I would go with:
Do many tiny batchbuffer operations to catch errors while ring is near full.

Of course if that still means the same to you.
> +
>  static unsigned int ring_size;
>  
>  static void check_bo(int fd, uint32_t handle)
> @@ -348,6 +351,8 @@ igt_main
>  		}
>  	}
>  
> +	igt_describe("This test does a basic pass over on all engines simultaniously"
> +			" and checks how the driver handles a full ring.");
In my opinion description it too long, can be shortened.

Kasia
>  	igt_subtest("basic-all") {
>  		const struct intel_execution_engine2 *e;
>  
> -- 
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
