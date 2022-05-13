Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA0010E26B
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 07:01:21 +0000 (UTC)
Message-ID: <c08963b8-4f2b-952f-b01d-46f67e8427f5@intel.com>
Date: Fri, 13 May 2022 12:30:59 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
References: <20220513053615.3194-1-karthik.b.s@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220513053615.3194-1-karthik.b.s@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_dp_tiled_display: Close fd
 after igt_display_fini
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: kunal1.joshi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM
Reviewed-by:
Swati Sharma <swati2.sharma@intel.com>

On 13-May-22 11:06 AM, Karthik B S wrote:
> Close fd after igt_display_fini to avoid bad fd failure.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_dp_tiled_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index f030254d..8f503e40 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -497,8 +497,8 @@ igt_main
>   	#endif
>   	igt_fixture {
>   		free(data.conns);
> -		close(data.drm_fd);
>   		kmstest_restore_vt_mode();
>   		igt_display_fini(data.display);
> +		close(data.drm_fd);
>   	}
>   }

-- 
~Swati Sharma
