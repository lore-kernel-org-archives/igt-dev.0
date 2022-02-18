Return-path: <SRS0=2yIq=TB=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24EB10EC3F
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Feb 2022 12:40:32 +0000 (UTC)
Date: Fri, 18 Feb 2022 13:40:28 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Yg+JgIbBLT1eVQ0C@kamilkon-DESK1>
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
Cc: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

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

Remove space from beginning and try to avoid starting global
description with "This test does".  You can also reuse comment
from begginig of this test, it is:
 * This is a test of doing many tiny batchbuffer operations, in the hope of
 * catching failure to manage the ring properly near full.
so you can rephrase it like "Create many tiny ...".

> +		"errors while ring is near full.");
Space before "errors" needed.
Please compile and run with --describe to catch missing spaces.

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
----------------------- ^
Please align under previous string.

Last question: may you describe also dynamic tests ?

>  	igt_subtest("basic-all") {
>  		const struct intel_execution_engine2 *e;
>  		intel_allocator_multiprocess_start();
> -- 
> 2.35.0
> 

Regards,
Kamil
