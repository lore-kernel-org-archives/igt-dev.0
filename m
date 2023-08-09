Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD0F10E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 03:23:28 +0000 (UTC)
Message-ID: <84a3b967-2e3b-07d6-aa67-cfe0593a5a24@intel.com>
Date: Wed, 9 Aug 2023 08:53:12 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-50-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-50-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 49/81] tests/kms_flip_event_leak: Document
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_flip_event_leak.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
>
> diff --git a/tests/kms_flip_event_leak.c b/tests/kms_flip_event_leak.c
> index 423ce40df..a1b614771 100644
> --- a/tests/kms_flip_event_leak.c
> +++ b/tests/kms_flip_event_leak.c
> @@ -30,6 +30,25 @@
>   
>   #include "igt_device.h"
>   #include "xe/xe_query.h"
> +/**
> + * TEST: kms flip event leak
> + * Category: Display
> + * Description: This test tries to provoke the kernel into leaking a pending
> + *              page flip event when the fd is closed before the flip has
> + *              completed. The test itself won't fail even if the kernel leaks
> + *              the event, but the resulting dmesg WARN will indicate a failure.
> + *
> + * SUBTEST: basic
> + * Description: This test tries to provoke the kernel into leaking a pending
> + *              page flip event when the fd is closed before the flip has
> + *              completed. The test itself won't fail even if the kernel leaks
> + *              the event, but the resulting dmesg WARN will indicate a failure.

Hi,

The test and subtest description are same? I understand that there is 
only one subtest currently, but could the test description be updated to 
be more a high level description may be?

Thanks,
Karthik.B.S
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   typedef struct {
>   	int drm_fd;
