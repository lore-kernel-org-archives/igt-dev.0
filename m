Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFEF810E143
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Oct 2023 04:53:27 +0000 (UTC)
Message-ID: <f7d97c3e-8f37-4311-b366-44102751dbda@intel.com>
Date: Mon, 23 Oct 2023 10:23:22 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Lee Shawn C <shawn.c.lee@intel.com>, igt-dev@lists.freedesktop.org
References: <20231022135416.1868389-1-shawn.c.lee@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231022135416.1868389-1-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH] lib/i915/drrs: close file handler after
 update DRRS setting
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

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 22-Oct-23 7:24 PM, Lee Shawn C wrote:
> After configure DRRS status, test tool has to release file handler
> properly to avoid unexpected problem.
> 
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vidya Srinivas <vidya.srinivas@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>   lib/i915/intel_drrs.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/i915/intel_drrs.c b/lib/i915/intel_drrs.c
> index 2f83e1394a61..deaec90d3f59 100644
> --- a/lib/i915/intel_drrs.c
> +++ b/lib/i915/intel_drrs.c
> @@ -69,6 +69,7 @@ static void drrs_set(int device, enum pipe pipe, unsigned int val)
>   	dir = igt_debugfs_pipe_dir(device, pipe, O_DIRECTORY);
>   	igt_require_fd(dir);
>   	ret = igt_sysfs_write(dir, "i915_drrs_ctl", buf, sizeof(buf) - 1);
> +	close(dir);
>   
>   	/*
>   	 * drrs_enable() is called on DRRS capable platform only,
