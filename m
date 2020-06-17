Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6895D6E071
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2020 06:24:41 +0000 (UTC)
References: <20200616105812.21558-1-ankit.k.nautiyal@intel.com>
 <20200616105812.21558-3-ankit.k.nautiyal@intel.com>
 <20200616140304.GA26166@intel.com> <20200617041828.GK14085@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Message-ID: <ba79f89c-570e-3839-2f95-0bc1cf564aeb@intel.com>
Date: Wed, 17 Jun 2020 11:54:38 +0530
MIME-Version: 1.0
In-Reply-To: <20200617041828.GK14085@intel.com>
Subject: Re: [igt-dev] [Patch][i-g-t 2/2] tests/kms_content_protection: Use
 library functions for handling uevents
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
To: Anshuman Gupta <anshuman.gupta@intel.com>, Ramalingam C <ramalingam.c@intel.com>, arkadiusz.hiler@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ram, Arek, and Anshuman,

Thanks for your comments and suggestions.

As we are discussing about the naming of the APIs, I have taken liberty 
to reply in a single mail.

Please find my responses inline:


On 6/17/2020 9:48 AM, Anshuman Gupta wrote:
> On 2020-06-16 at 19:33:04 +0530, Ramalingam C wrote:
>> On 2020-06-16 at 16:28:12 +0530, Ankit Nautiyal wrote:
>>> Currently, the test has its own version of uevent handling used
>>> for detecting hdcp events. This patch modifies the test to use
>>> the igt_kms lib support for handling the uevent monitor and detect
>>> hdcp events.
>>>
>>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>> ---
>>>   tests/kms_content_protection.c | 145 ++-------------------------------
>>>   1 file changed, 6 insertions(+), 139 deletions(-)
>>>
>>> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
>>> index 3b9cedcb..475a5089 100644
>>> --- a/tests/kms_content_protection.c
>>> +++ b/tests/kms_content_protection.c
>>> @@ -39,6 +39,7 @@ struct data {
>>>   	igt_display_t display;
>>>   	struct igt_fb red, green;
>>>   	unsigned int cp_tests;
>>> +	struct udev_monitor *uevent_monitor;
>>>   } data;
>>>   
>>>   /* Test flags */
>>> @@ -112,143 +113,6 @@ static int wait_flip_event(void)
>>>   	return rc;
>>>   }
>>>   
>>> -static bool hdcp_event(struct udev_monitor *uevent_monitor,
>>> -		       struct udev *udev, uint32_t conn_id, uint32_t prop_id)
>>> -{
>>> -	struct udev_device *dev;
>>> -	dev_t udev_devnum;
>>> -	struct stat s;
>>> -	const char *hotplug, *connector, *property;
>>> -	bool ret = false;
>>> -
>>> -	dev = udev_monitor_receive_device(uevent_monitor);
>>> -	if (!dev)
>>> -		goto out;
>>> -
>>> -	udev_devnum = udev_device_get_devnum(dev);
>>> -	fstat(data.display.drm_fd, &s);
>>> -
>>> -	hotplug = udev_device_get_property_value(dev, "HOTPLUG");
>>> -	if (!(memcmp(&s.st_rdev, &udev_devnum, sizeof(dev_t)) == 0 &&
>>> -	    hotplug && atoi(hotplug) == 1)) {
>>> -		igt_debug("Not a Hotplug event\n");
>>> -		goto out_dev;
>>> -	}
>>> -
>>> -	connector = udev_device_get_property_value(dev, "CONNECTOR");
>>> -	if (!(memcmp(&s.st_rdev, &udev_devnum, sizeof(dev_t)) == 0 &&
>>> -	    connector && atoi(connector) == conn_id)) {
>>> -		igt_debug("Not for connector id: %u\n", conn_id);
>>> -		goto out_dev;
>>> -	}
>>> -
>>> -	property = udev_device_get_property_value(dev, "PROPERTY");
>>> -	if (!(memcmp(&s.st_rdev, &udev_devnum, sizeof(dev_t)) == 0 &&
>>> -	    property && atoi(property) == prop_id)) {
>>> -		igt_debug("Not for property id: %u\n", prop_id);
>>> -		goto out_dev;
>>> -	}
>>> -	ret = true;
>>> -
>>> -out_dev:
>>> -	udev_device_unref(dev);
>>> -out:
>>> -	return ret;
>>> -}
>>> -
>>> -static void hdcp_udev_fini(struct udev_monitor *uevent_monitor,
>>> -			   struct udev *udev)
>>> -{
>>> -	if (uevent_monitor)
>>> -		udev_monitor_unref(uevent_monitor);
>>> -	if (udev)
>>> -		udev_unref(udev);
>>> -}
>>> -
>>> -static int hdcp_udev_init(struct udev_monitor **uevent_monitor,
>>> -			  struct udev **udev, int *udev_fd)
>>> -{
>>> -	int ret = -EINVAL;
>>> -
>>> -	*udev = udev_new();
>>> -	if (!*udev) {
>>> -		igt_info("failed to create udev object\n");
>>> -		goto out;
>>> -	}
>>> -
>>> -	*uevent_monitor = udev_monitor_new_from_netlink(*udev, "udev");
>>> -	if (!*uevent_monitor) {
>>> -		igt_info("failed to create udev event monitor\n");
>>> -		goto out;
>>> -	}
>>> -
>>> -	ret = udev_monitor_filter_add_match_subsystem_devtype(*uevent_monitor,
>>> -							      "drm",
>>> -							      "drm_minor");
>>> -	if (ret < 0) {
>>> -		igt_info("failed to filter for drm events\n");
>>> -		goto out;
>>> -	}
>>> -
>>> -	ret = udev_monitor_enable_receiving(*uevent_monitor);
>>> -	if (ret < 0) {
>>> -		igt_info("failed to enable udev event reception\n");
>>> -		goto out;
>>> -	}
>>> -
>>> -	*udev_fd = udev_monitor_get_fd(*uevent_monitor);
>>> -	if (*udev_fd < 0) {
>>> -		igt_info("failed to get udev_fd on uevent monitor\n");
>>> -		ret = *udev_fd;
>>> -		goto out;
>>> -	}
>>> -
>>> -	return ret;
>>> -
>>> -out:
>>> -	hdcp_udev_fini(*uevent_monitor, *udev);
>>> -	return ret;
>>> -}
>>> -
>>> -#define MAX_EVENTS	10
>>> -static bool wait_for_hdcp_event(uint32_t conn_id, uint32_t prop_id,
>>> -				uint32_t timeout_mSec)
>>> -{
>>> -
>>> -	struct udev_monitor *uevent_monitor = NULL;
>>> -	struct udev *udev = NULL;
>>> -	int udev_fd, epoll_fd;
>>> -	struct epoll_event event, events[MAX_EVENTS];
>>> -	bool ret = false;
>>> -
>>> -	if (hdcp_udev_init(&uevent_monitor, &udev, &udev_fd) < 0)
>>> -		return false;
>>> -
>>> -	epoll_fd = epoll_create1(0);
>>> -	if (epoll_fd == -1) {
>>> -		igt_info("Failed to create epoll fd. %d\n", epoll_fd);
>>> -		goto out_ep_create;
>>> -	}
>>> -
>>> -	event.events = EPOLLIN | EPOLLERR;
>>> -	event.data.fd = 0;
>>> -
>>> -	if (epoll_ctl(epoll_fd, EPOLL_CTL_ADD, udev_fd, &event)) {
>>> -		igt_info("failed to fd into epoll\n");
>>> -		goto out_ep_ctl;
>>> -	}
>>> -
>>> -	if (epoll_wait(epoll_fd, events, MAX_EVENTS, timeout_mSec))
>>> -		ret = hdcp_event(uevent_monitor, udev, conn_id, prop_id);
>>> -
>>> -out_ep_ctl:
>>> -	if (close(epoll_fd))
>>> -		igt_info("failed to close the epoll fd\n");
>>> -out_ep_create:
>>> -	hdcp_udev_fini(uevent_monitor, udev);
>>> -	return ret;
>>> -}
>>> -
>>>   static bool
>>>   wait_for_prop_value(igt_output_t *output, uint64_t expected,
>>>   		    uint32_t timeout_mSec)
>>> @@ -257,9 +121,9 @@ wait_for_prop_value(igt_output_t *output, uint64_t expected,
>>>   	int i;
>>>   
>>>   	if (data.cp_tests & CP_UEVENT && expected != CP_UNDESIRED) {
>>> -		igt_assert_f(wait_for_hdcp_event(output->id,
>>> +		igt_assert_f(igt_conn_event_detected(data.uevent_monitor, output->id,
>>>   			     output->props[IGT_CONNECTOR_CONTENT_PROTECTION],
>>> -			     timeout_mSec), "uevent is not received");
>>> +			     timeout_mSec / 1000), "uevent is not received");
>>>   
>>>   		val = igt_output_get_prop(output,
>>>   					  IGT_CONNECTOR_CONTENT_PROTECTION);
>>> @@ -702,7 +566,10 @@ igt_main
>>>   	igt_subtest("uevent") {
>>>   		igt_require(data.display.is_atomic);
>>>   		data.cp_tests = CP_UEVENT;
>>> +		data.uevent_monitor = igt_watch_hotplug();
>> Ankit, this is really good.
>>
>> Any benefit with sporadic hdcp event missing issue?
> yes there is absolute benifit wait_for_hdcp_event() every times
> prepare a necessary infrasture before triggering epoll_wait().
> Sometimes due to scheduling delays connector HOTPLUG events get disposed
> even before a call to epoll_wait() here.
> Many thanks to Arek here for debugging inputs by "udev monitor".

The missing hdcp uevent issuse, seems to be quite sporadic, and I was 
not able to reproduce with/without patch.
But this certainly should help in that case, as mentioned by Anshuman.

>> I would prefer to create generic implementations like igt_watch_udev.
>> Similarly for igt_flush_hotplugs and igt_cleanup_hotplug.
> There are two calls from kerenl for HOTPLUG uevent.
> drm_sysfs_hotplug_event -> for HOTPLUG events only with HOTPLUG=1 string
> drm_sysfs_connector_status_event-> for HOTPLUG events with additional
> connector id and prop id string. so i belive in line to that there
> is no need to change existing API name change.
> Probably igt_conn_event_detected can be changed to
> igt_connector_hotplug_detected or igt_connector_event_detected for more
> readability.
> Thanks,
> Anshuman Gupta.

As mentioned by Anshuman, both the calls have HOTPLUG=1 string, so we 
can let the APIs same if we want.
But I am open for suggestions on naming here if it makes sense to have a 
generic name with future requirements in mind.

Regarding the igt_conn_event_detected() I can change the name here as 
well to igt_connector_hotplug_detected().
But I have not added checking for HOTPLUG=1 for hdcp event. Probably I 
should add that as well
along with "CONNECTOR" and "PROPERTY", in line with the current IGT, and 
also as in the weston userspace.

Thanks & Regards,
Ankit

>> -Ram.
>>> +		igt_flush_hotplugs(data.uevent_monitor);
>>>   		test_content_protection(COMMIT_ATOMIC, HDCP_CONTENT_TYPE_0);
>>> +		igt_cleanup_hotplug(data.uevent_monitor);
>>>   	}
>>>   
>>>   	/*
>>> -- 
>>> 2.17.1
>>>

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
