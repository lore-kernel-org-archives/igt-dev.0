Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B5710E847
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Nov 2022 14:57:25 +0000 (UTC)
Message-ID: <9b3c4cab-8d91-0c4f-5c9f-49b6849b4835@intel.com>
Date: Thu, 10 Nov 2022 20:27:11 +0530
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220927062839.2718582-1-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20220927062839.2718582-1-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] i915/i915_pm_rps: Actual freq can be 0
 when idle or in RC6
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



On 27-09-2022 11:58, Ashutosh Dixit wrote:
> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> 
> Actual freq read from sysfs can be 0, i.e. less than RPn, in certain
> situations. For example when the device is idle (without the runtime PM
> wakeref) actual freq read from sysfs will be 0. Also on Gen12+ actual freq
> read from HW will be 0 in RC6. Therefore modify checks comparing actual
> freq with RPn.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/i915/i915_pm_rps.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_rps.c b/tests/i915/i915_pm_rps.c
> index db39ec69865c..4865ed1f0042 100644
> --- a/tests/i915/i915_pm_rps.c
> +++ b/tests/i915/i915_pm_rps.c
> @@ -483,14 +483,15 @@ static void idle_check(void)
>   		read_freqs(freqs);
>   		dump(freqs);
>   		check_freq_constraints(freqs);
> -		if (freqs[ACT] == freqs[RPn])
> +		if (freqs[ACT] <= freqs[RPn])
>   			break;
>   		usleep(1000 * IDLE_WAIT_TIMESTEP_MSEC);
>   		wait += IDLE_WAIT_TIMESTEP_MSEC;
>   	} while (wait < IDLE_WAIT_TIMEOUT_MSEC);
>   
>   	igt_debugfs_dump(drm_fd, "i915_rps_boost_info");
> -	igt_assert_eq(freqs[ACT], freqs[RPn]);
> +	/* Actual freq may be 0 when idle or in RC6 */
> +	igt_assert_lte(freqs[ACT], freqs[RPn]);
>   	igt_debug("Required %d msec to reach cur=idle\n", wait);
>   }
>   
