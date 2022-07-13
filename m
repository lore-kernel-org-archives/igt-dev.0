Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B699411BF02
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 07:45:04 +0000 (UTC)
Message-ID: <29367be8-e3f9-ed9d-041c-0db98ae95d53@intel.com>
Date: Wed, 13 Jul 2022 13:14:59 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20220711141940.610063-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220711141940.610063-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/kms_cursor_legacy: Avoid usage of same
 pipe on multiple outputs
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

LGTM
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 11-Jul-22 7:49 PM, Bhanuprakash Modem wrote:
> Sanitize the system state before starting the subtest.
> 
> Fixes: https://gitlab.freedesktop.org/drm/intel/-/issues/6198
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_cursor_legacy.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
> index fc4a291d..c5b2bd30 100644
> --- a/tests/kms_cursor_legacy.c
> +++ b/tests/kms_cursor_legacy.c
> @@ -429,6 +429,8 @@ static void flip(igt_display_t *display,
>   	results = mmap(NULL, PAGE_SIZE, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
>   	igt_assert(results != MAP_FAILED);
>   
> +	igt_display_reset(display);
> +
>   	flip_pipe = find_connected_pipe(display, !!flip_pipe);
>   	cursor_pipe = find_connected_pipe(display, !!cursor_pipe);
>   

-- 
~Swati Sharma
