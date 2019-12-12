Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A4B6ED3C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Dec 2019 12:53:11 +0000 (UTC)
Date: Thu, 12 Dec 2019 18:22:44 +0530
From: Ramalingam C <ramalingam.c@intel.com>
Message-ID: <20191212125244.GB10488@intel.com>
References: <20191212123501.4598-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212123501.4598-1-anshuman.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_content_protection: Fix
 uevent subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 2019-12-12 at 18:05:01 +0530, Anshuman Gupta wrote:
> uevent hdcp subtest was failing because hdcp_event()
> has been called with NULL udev_monitor, which was
> causing udev_monitor_receive_device() to return a
> NULL udev.
> 
> v2: Using double pointer for udev_monitor and udev. [Ram]
> 
> Cc: Ramalingam C <ramalingam.c@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>  tests/kms_content_protection.c | 30 ++++++++++++++++++------------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index e676b60b..eb279c4e 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -165,24 +165,24 @@ static void hdcp_udev_fini(struct udev_monitor *uevent_monitor,
>  		udev_unref(udev);
>  }
>  
> -static int hdcp_udev_init(struct udev_monitor *uevent_monitor,
> -			  struct udev *udev)
> +static int hdcp_udev_init(struct udev_monitor **uevent_monitor,
> +			  struct udev **udev, int *udev_fd)
>  {
>  	int ret = -EINVAL;
>  
> -	udev = udev_new();
> -	if (!udev) {
> +	*udev = udev_new();
> +	if (!*udev) {
>  		igt_info("failed to create udev object\n");
>  		goto out;
>  	}
>  
> -	uevent_monitor = udev_monitor_new_from_netlink(udev, "udev");
> -	if (!uevent_monitor) {
> +	*uevent_monitor = udev_monitor_new_from_netlink(*udev, "udev");
> +	if (!*uevent_monitor) {
>  		igt_info("failed to create udev event monitor\n");
>  		goto out;
>  	}
>  
> -	ret = udev_monitor_filter_add_match_subsystem_devtype(uevent_monitor,
> +	ret = udev_monitor_filter_add_match_subsystem_devtype(*uevent_monitor,
>  							      "drm",
>  							      "drm_minor");
>  	if (ret < 0) {
> @@ -190,16 +190,23 @@ static int hdcp_udev_init(struct udev_monitor *uevent_monitor,
>  		goto out;
>  	}
>  
> -	ret = udev_monitor_enable_receiving(uevent_monitor);
> +	ret = udev_monitor_enable_receiving(*uevent_monitor);
>  	if (ret < 0) {
>  		igt_info("failed to enable udev event reception\n");
>  		goto out;
>  	}
>  
> -	return udev_monitor_get_fd(uevent_monitor);
> +	*udev_fd = udev_monitor_get_fd(*uevent_monitor);
> +	if (*udev_fd < 0) {
> +		igt_info("failed to get udev_fd on uevent monitor\n");
> +		ret = *udev_fd;
> +		goto out;
> +	}
> +
> +	return ret;
On success udev_monitor_enable_receiving might return >= 0. incase if we
want 0 on success, use ret only on error case.

But as caller is concerned only for error state, this shouldn't matter.
I leave that to your decision.

Either way:
Reviewed-by: Ramalingam C <ramalingam.c@intel.com>
>  
>  out:
> -	hdcp_udev_fini(uevent_monitor, udev);
> +	hdcp_udev_fini(*uevent_monitor, *udev);
>  	return ret;
>  }
>  
> @@ -214,8 +221,7 @@ static bool wait_for_hdcp_event(uint32_t conn_id, uint32_t prop_id,
>  	struct epoll_event event, events[MAX_EVENTS];
>  	bool ret = false;
>  
> -	udev_fd = hdcp_udev_init(uevent_monitor, udev);
> -	if (udev_fd < 0)
> +	if (hdcp_udev_init(&uevent_monitor, &udev, &udev_fd) < 0)
>  		return false;
>  
>  	epoll_fd = epoll_create1(0);
> -- 
> 2.24.0
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
