Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FF36E3EC
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 12:33:23 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:36:48 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YVWvYKMFfbR/RxiM@platvala-desk.ger.corp.intel.com>
References: <20210930122050.2033508-1-jigar.bhatt@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930122050.2033508-1-jigar.bhatt@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc: Changing sysfs
 open attribute to O_RDONLY
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Jigar Bhatt <jigar.bhatt@intel.com>
Cc: igt-dev@lists.freedesktop.org, nischal.varide@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Sep 30, 2021 at 05:50:50PM +0530, Jigar Bhatt wrote:
> Opening /sys/module/drm_kms_helper/parameters/ in read only mode to
> avoid permission issue in dc9-dpms test.
> 
> Signed-off-by: Jigar Bhatt <jigar.bhatt@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index d70ee060..4c9b871c 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -419,7 +419,7 @@ static void setup_dc9_dpms(data_t *data, int dc_target)
>  {
>  	int prev_dc, sysfs_fd;
>  
> -	igt_require((sysfs_fd = open(KMS_HELPER, O_RDWR)) >= 0);
> +	igt_require((sysfs_fd = open(KMS_HELPER, O_RDONLY)) >= 0);
>  	kms_poll_saved_state = igt_sysfs_get_boolean(sysfs_fd, "poll");
>  	igt_sysfs_set_boolean(sysfs_fd, "poll", KMS_POLL_DISABLE);
>  	close(sysfs_fd);
> @@ -449,7 +449,7 @@ static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
>  
> -	sysfs_fd = open(KMS_HELPER, O_WRONLY);
> +	sysfs_fd = open(KMS_HELPER, O_RDONLY);
>  	if (sysfs_fd >= 0) {
>  		igt_sysfs_set_boolean(sysfs_fd, "poll", kms_poll_saved_state);

Shouldn't this stay WRONLY?


-- 
Petri Latvala


>  		close(sysfs_fd);
> -- 
> 2.25.1
> 
