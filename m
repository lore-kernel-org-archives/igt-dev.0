Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D090710E949
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 13:59:13 +0000 (UTC)
Message-ID: <b6b228c4-c5fc-139c-49d4-56a77598ea67@intel.com>
Date: Tue, 27 Sep 2022 19:29:03 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Kunal Joshi <kunal1.joshi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-5-kunal1.joshi@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20220926185321.2897136-5-kunal1.joshi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1 4/5] tests/kms_invalid_mode.c
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

Hi Kunal,

Drop .c from subj. Complete your subj and add commit message.

On 27-Sep-22 12:23 AM, Kunal Joshi wrote:
> -> close drm_fd
> 
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>   tests/kms_invalid_mode.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index 0ae98a31..f1c38669 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -306,5 +306,6 @@ igt_main
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		igt_reset_connectors();
> +		close(data.drm_fd);
>   	}
>   }

-- 
~Swati Sharma
