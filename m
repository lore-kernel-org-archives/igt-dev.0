Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A83F6ED91
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2020 22:45:27 +0000 (UTC)
References: <20200306172829.45696-1-don.hiatt@intel.com>
From: Sujaritha <sujaritha.sundaresan@intel.com>
Message-ID: <a05de69c-ce28-1e51-894a-4edba4c79220@intel.com>
Date: Fri, 6 Mar 2020 14:14:56 -0800
MIME-Version: 1.0
In-Reply-To: <20200306172829.45696-1-don.hiatt@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_pm: Adjust pm status check
 timeout and log timing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: don.hiatt@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


On 3/6/20 9:28 AM, don.hiatt@intel.com wrote:
> From: Don Hiatt <don.hiatt@intel.com>
>
> Increase the overall time we wait to achieve the desired runtime
> status to 15 seconds to fix an occasional timeout and do so
> in 1 second increments to speed up exiting. Also log the
> amount of time we waited to get a handle on how much variation
> we run into.
>
> Signed-off-by: Don Hiatt <don.hiatt@intel.com>
> ---
>   lib/igt_pm.c | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index 9d441e1b76ff..13675fca0c9d 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -747,8 +747,8 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
>    * igt_wait_for_pm_status:
>    * @status: desired runtime PM status
>    *
> - * Waits until for the driver to switch to into the desired runtime PM status,
> - * with a 10 second timeout.
> + * Waits for the driver to switch into the desired runtime PM status,
> + * with up to a 15 second timeout in 1 second increments.
>    *
>    * Returns:
>    * True if the desired runtime PM status was attained, false if the operation
> @@ -758,7 +758,7 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
>   {
>   	enum igt_runtime_pm_status expected = status;
>   	bool ret;
> -	int fd;
> +	int fd, i;
>   
>   	if (__igt_pm_power < 0)
>   		return false;
> @@ -766,8 +766,16 @@ bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
>   	fd = openat(__igt_pm_power, "runtime_status", O_RDONLY);
>   	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
>   
> -	ret = igt_wait((status = __igt_get_runtime_pm_status(fd)) == expected,
> -		       10000, 100);
> +	for (i=1; i < 16; ++i) {
> +		ret = igt_wait((status = __igt_get_runtime_pm_status(fd)) == expected,
> +				1000, 100);
> +
> +		if (ret) {
> +			igt_info("Got expected (%s) runtime pm status in %d second(s)\n",
> +				 _pm_status_name(expected), i);
> +			break;
> +		}
> +	}
>   	close(fd);
>   
>   	if (!ret)

We are still not sure as to why the status switch is taking longer now 
but having this change and allowing the

time to be logged, should help in further understanding this failure 
seen on various pm tests.


Reviewed-by : Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
