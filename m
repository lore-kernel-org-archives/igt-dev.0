Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1990E10E460
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 03:23:54 +0000 (UTC)
Message-ID: <93a04b26-bef7-b61a-47b4-e2ceb68e9fc5@intel.com>
Date: Wed, 27 Sep 2023 08:53:31 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918112216.260019-1-swati2.sharma@intel.com>
 <20230918112216.260019-2-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230918112216.260019-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_lease: remove redundant
 test doc
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


On 9/18/2023 4:52 PM, Swati Sharma wrote:
> We already have IGT_TEST_DESCRIPTION and even testplan
> documentation, no need to redundant documentation.
'to' -> 'for'

With this update,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_lease.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/kms_lease.c b/tests/kms_lease.c
> index 9ada6d5ea..1a91b3eb4 100644
> --- a/tests/kms_lease.c
> +++ b/tests/kms_lease.c
> @@ -21,11 +21,6 @@
>    * IN THE SOFTWARE.
>    */
>   
> -/** @file kms_lease.c
> - *
> - * This is a test of DRM leases
> - */
> -
>   /**
>    * TEST: kms lease
>    * Category: Display
