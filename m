Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBCF10E45E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Sep 2023 03:23:04 +0000 (UTC)
Message-ID: <1fdbd286-6682-1950-dc90-2d2b18fc5ed0@intel.com>
Date: Wed, 27 Sep 2023 08:52:51 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230918104130.259103-1-swati2.sharma@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230918104130.259103-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_sequence: remove redundant
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


On 9/18/2023 4:11 PM, Swati Sharma wrote:
> We already have IGT_TEST_DESCRIPTION and even testplan
> documentation, no need to redundant documentation.

'to' -> 'for'

With this update,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_sequence.c | 5 -----
>   1 file changed, 5 deletions(-)
>
> diff --git a/tests/kms_sequence.c b/tests/kms_sequence.c
> index 9476203e9..c6d6dea00 100644
> --- a/tests/kms_sequence.c
> +++ b/tests/kms_sequence.c
> @@ -22,11 +22,6 @@
>    * IN THE SOFTWARE.
>    */
>   
> -/** @file kms_sequence.c
> - *
> - * This is a test of drmCrtcGetSequence and drmCrtcQueueSequence
> - */
> -
>   /**
>    * TEST: kms sequence
>    * Category: Display
