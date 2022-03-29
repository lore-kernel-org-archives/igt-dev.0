Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399BF10E36A
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Mar 2022 14:36:03 +0000 (UTC)
Date: Tue, 29 Mar 2022 16:35:59 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <YkMZT4HFHZQd8wwl@kamilkon-DESK1>
References: <20220215052347.21306-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220215052347.21306-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ringfill: Added test
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

Hi Sai,

please send any new one with this as HAX series.

Regards,
Kamil

Dnia 2022-02-15 at 10:53:47 +0530, sai.gowtham.ch@intel.com napisał(a):
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Added test description to test and subtest.
> 
> Cc: Melkaveri Arjun <arjun.melkaveri@intel.com>
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> ---
>  tests/i915/gem_ringfill.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index ecfa0bea..0d86141b 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -51,6 +51,9 @@
>  #define HIBERNATE 0x40
>  #define NEWFD 0x80
>  
> +IGT_TEST_DESCRIPTION(" This test does many tiny batchbuffer operations to catch"
> +		"errors while ring is near full.");
> +
>  static unsigned int ring_size;
>  
>  static void check_bo(int fd, uint32_t handle)
> @@ -371,6 +374,9 @@ igt_main
>  		}
>  	}
>  
> +
> +	igt_describe("Test runs on all available engines simultaniously and"
> +			" checks how the driver handles a full ring.");
>  	igt_subtest("basic-all") {
>  		const struct intel_execution_engine2 *e;
>  		intel_allocator_multiprocess_start();
> -- 
> 2.35.0
> 
