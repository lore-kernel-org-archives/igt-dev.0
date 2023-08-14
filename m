Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 767AE10E0DB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 04:43:15 +0000 (UTC)
Message-ID: <7aeadfd6-62e3-965c-faf7-4b36251a4482@intel.com>
Date: Mon, 14 Aug 2023 10:12:58 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-49-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-49-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 48/81] tests/kms_flip_event_leak: Document
 each subtest for testplan
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


On 8/12/2023 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> V2: - Fix test description
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_flip_event_leak.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index 423ce40df..0de2800d2 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -31,6 +31,23 @@
>   #include "igt_device.h"
>   #include "xe/xe_query.h"
>   
> +/**
> + * TEST: kms flip event leak
> + * Category: Display
> + * Description: Test to validate flip event leak
> + *
> + * SUBTEST: basic
> + * Description: This test tries to provoke the kernel into leaking a pending
> + *              page flip event when the fd is closed before the flip has
> + *              completed. The test itself won't fail even if the kernel leaks
> + *              the event, but the resulting dmesg WARN will indicate a failure.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   typedef struct {
>   	int drm_fd;
>   	igt_display_t display;
