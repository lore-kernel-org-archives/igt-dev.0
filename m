Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151710E40D
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:21:46 +0000 (UTC)
Message-ID: <9e80874b-2bb3-2647-e2fc-e9b044df1ac3@intel.com>
Date: Wed, 9 Aug 2023 13:51:32 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-52-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-52-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 51/81] tests/kms_getfb: Document each
 subtest for testplan
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

Hi,

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_getfb.c | 90 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
>
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index afcf07fe8..b35cd4152 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -27,6 +27,11 @@
>    *
>    */
>   
> +/**
> + * TEST: kms getfb
> + * Category: Display
> + * Description: Tests GETFB and GETFB2 ioctls.
> + */
>   #include "igt.h"
>   #include <unistd.h>
>   #include <stdlib.h>
> @@ -169,6 +174,22 @@ static uint32_t get_any_prop_id(int fd)
>   	return 0;
>   }
>   
> +/**
> + * SUBTEST: getfb-handle-%s
> + * Description: Tests error handling %arg[1]
> + * Driver requirement: any
> + * Functionality: kms_core
Should this also be 'kms_gem_interop', like in other fb related tests?
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @closed:       when passing a handle that has been closed.
> + * @not-fb:       when passing an invalid handle.
> + * @valid:        when passing an valid handle.
> + * @zero:         for a zero'd input.
> + */
>   static void test_handle_input(int fd)
>   {
>   	struct drm_mode_fb_cmd2 add = {};
> @@ -224,6 +245,30 @@ static void test_handle_input(int fd)
>   		gem_close(fd, add.handles[0]);
>   }
>   
> +/**
> + * SUBTEST: getfb-reject-ccs
> + * Description: Tests error handling while requesting CCS buffers it should
> + *              refuse because getfb supports returning a single buffer handle.
> + * Driver requirement: any
> + * Functionality: kms_core
Please add 'ccs' also here.
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: getfb-%s-different-handles
> + * Description: Tests error handling while requesting for two different handles
> + *              from %arg[1].
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @addfb:           same fd
> + * @repeated:        different fd
> + */
>   static void test_duplicate_handles(int fd)
>   {
>   	struct drm_mode_fb_cmd2 add = {};
> @@ -289,6 +334,37 @@ static void test_duplicate_handles(int fd)
>   	}
>   }
>   
> +/**
> + * SUBTEST: getfb2-accept-ccs
> + * Description: Tests outputs are correct when retrieving a CCS framebuffer.
> + * Driver requirement: any
> + * Functionality: kms_core

Please add 'ccs' also here.

Thanks,
Karthik.B.S
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: getfb2-into-addfb2
> + * Description: Output check by passing the output of GETFB2 into ADDFB2.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: getfb2-handle-%s
> + * Description: Tests error handling %arg[1].
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @closed:                  when passing a handle that has been closed
> + * @not-fb:                  when passing an invalid handle
> + * @zero:                    for a zero'd input
> + */
>   static void test_getfb2(int fd)
>   {
>   	struct drm_mode_fb_cmd2 add_basic = {};
> @@ -397,6 +473,20 @@ static void test_getfb2(int fd)
>   	}
>   }
>   
> +/**
> + * SUBTEST: %s-handle-protection
> + * Description: Make sure %arg[1] return handles if caller is non-root or non-master.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @getfb:      GETFB ioctl
> + * @getfb2:     GETFB2 ioctl
> + */
>   static void test_handle_protection(void) {
>   	int non_master_fd;
>   	struct drm_mode_fb_cmd2 non_master_add = {};
