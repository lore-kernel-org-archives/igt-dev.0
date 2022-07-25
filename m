Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE503113971
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jul 2022 06:38:18 +0000 (UTC)
Message-ID: <77b51065-3eb5-09cd-4598-a0ce5611ab12@intel.com>
Date: Mon, 25 Jul 2022 12:08:10 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
References: <20220723191255.2700675-1-lucas.demarchi@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220723191255.2700675-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Force rescan when module is loaded
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

Hi Lucas,

Please add Fixes tag
https://gitlab.freedesktop.org/drm/intel/-/issues/5174

With that
Reviewed-by:  Swati Sharma <swati2.sharma@intel.com>

On 24-Jul-22 12:42 AM, Lucas De Marchi wrote:
> Whenever we load a drm module we need to force a rescan of igt devices
> so we update the list. Otherwise any place trying to open the device and
> then falling back to loading the driver and loading it, will not have a
> proper fallback.  Currently this makes igt@i915_pm_rpm@module-reload
> to skip on DG2 as the previous test makes igt@i915_pm_rpm to cause a
> module reload.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   lib/drmtest.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 09a9a229..4f9d8a11 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -313,6 +313,7 @@ void drm_load_module(unsigned int chipset)
>   		}
>   	}
>   	pthread_mutex_unlock(&mutex);
> +	igt_devices_scan(true);
>   }
>   
>   static int __open_driver(const char *base, int offset, unsigned int chipset, int as_idx)

-- 
~Swati Sharma
