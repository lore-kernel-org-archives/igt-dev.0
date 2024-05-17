Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BB44C25B78
	for <igt-dev@archiver.kernel.org>; Fri, 17 May 2024 17:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA7C10EF44;
	Fri, 17 May 2024 17:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NYMsblzp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FECC10EF44
 for <igt-dev@lists.freedesktop.org>; Fri, 17 May 2024 17:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715968680; x=1747504680;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=VsOd7VEnK/59szC7GfTojSQTZ1qqOzdXqvA3zTsfYNo=;
 b=NYMsblzpc0SGyc0HKtuFo4QsSr+LXq6qzDd8ZGguPWEGhzSzU+Inun0V
 uhhnnxfsbSY5g3ICBapVvOewrIes9qf7dRIflZkUChqnhhidrH8Kgrcne
 Xsehf05fSvgShHBfibWW6RBkBpNUSNzmODL7wnfp28iiHpUF8gaIZ5J0I
 HNoQgZ/MhARHCqXqN3IrcOBeQ+3Sk7B4YEOg7+MHeDITgCsJqpZZOdnS4
 +HsepPn2WmgyRF0j+ban8VCp1BwSHT1MVul+zXZ9AOGdUaJsieuL4qRxJ
 PZCNYKurj9HjvZ7olMMkrFsdXEKvqLiXKSDZ3/Kj9vt/PpnktugumFvoE A==;
X-CSE-ConnectionGUID: 2BECkXtzTwud6avydtThPg==
X-CSE-MsgGUID: nTr+5iQDS/6kIlulW31wAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="37540304"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="37540304"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 10:57:59 -0700
X-CSE-ConnectionGUID: C2E5+oBoS0a/Ninp7fv1NQ==
X-CSE-MsgGUID: wHEPB3X9T0iHbKCYECVU4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="32017845"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 10:57:58 -0700
Date: Fri, 17 May 2024 19:57:55 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH i-g-t] tests/xe_pm: s3 vs s2idle: Validate only the
 platform default
Message-ID: <20240517175755.34lb3wfz6iltlqs3@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20240516180732.144162-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240516180732.144162-1-rodrigo.vivi@intel.com>
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Hi Rodrigo,
On 2024-05-16 at 14:07:32 -0400, Rodrigo Vivi wrote:

please change subject, was
[PATCH i-g-t] tests/xe_pm: s3 vs s2idle: Validate only the platform default
------------------ ^

imho should be:
[PATCH i-g-t] tests/intel/xe_pm: s3 vs s2idle: Validate only the platform default


Regards,
Kamil

> It is very common to reach issues from other drivers when testing
> the full non-default cycle.
> 
> Get back to i915 approach and validate only the default mem_sleep
> level of the mem sleep state.
> 
> However, keep the option in place where the developer can force
> the validation of the state using an extra test argument.
> 
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  lib/igt_aux.c       | 31 +++++++++++++++++++++-----
>  lib/igt_aux.h       |  2 ++
>  tests/intel/xe_pm.c | 54 ++++++++++++++++++++++++++++++++++++++++++++-
>  3 files changed, 80 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 3407cc4f2..7770a05fc 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -852,7 +852,15 @@ static bool is_state_supported(int power_dir, enum igt_suspend_state state)
>  	return str;
>  }
>  
> -static int get_mem_sleep(void)
> +/**
> + * igt_system_get_mem_sleep:
> + *
> + * Used to query the current configured mem_sleep. In special to stash the
> + * default of the system before any test operation.
> + *
> + * Return: Current mem_sleep configured.
> + */
> +enum igt_mem_sleep igt_system_get_mem_sleep(void)
>  {
>  	char *mem_sleep_states;
>  	char *mem_sleep_state;
> @@ -891,14 +899,25 @@ static int get_mem_sleep(void)
>  	return mem_sleep;
>  }
>  
> -static void set_mem_sleep(int power_dir, enum igt_mem_sleep sleep)
> +/**
> + * igt_system_set_mem_sleep:
> + *
> + * Used to configure the mem_sleep. Useful to return the platform to its default.
> + */
> +void igt_system_set_mem_sleep(enum igt_mem_sleep sleep)
>  {
> +	int power_dir;
> +
>  	igt_assert(sleep < MEM_SLEEP_NUM);
>  
> +	igt_require((power_dir = open("/sys/power", O_RDONLY)) >= 0);
> +
>  	igt_assert_eq(faccessat(power_dir, "mem_sleep", W_OK, 0), 0);
>  
>  	igt_assert(igt_sysfs_set(power_dir, "mem_sleep",
>  				 mem_sleep_name[sleep]));
> +
> +	close(power_dir);
>  }
>  
>  static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state)
> @@ -1018,11 +1037,11 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  	igt_aux_enable_pm_suspend_dbg(power_dir);
>  
>  	if (state == SUSPEND_STATE_S3) {
> -		orig_mem_sleep = get_mem_sleep();
> +		orig_mem_sleep = igt_system_get_mem_sleep();
>  		igt_skip_on_f(!is_mem_sleep_state_supported(power_dir, MEM_SLEEP_DEEP),
>  			      "S3 not supported in this system.\n");
> -		set_mem_sleep(power_dir, MEM_SLEEP_DEEP);
> -		igt_skip_on_f(get_mem_sleep() != MEM_SLEEP_DEEP,
> +		igt_system_set_mem_sleep(MEM_SLEEP_DEEP);
> +		igt_skip_on_f(igt_system_get_mem_sleep() != MEM_SLEEP_DEEP,
>  			      "S3 not possible in this system.\n");
>  	}
>  
> @@ -1034,7 +1053,7 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  		suspend_via_sysfs(power_dir, state);
>  
>  	if (orig_mem_sleep)
> -		set_mem_sleep(power_dir, orig_mem_sleep);
> +		igt_system_set_mem_sleep(orig_mem_sleep);
>  
>  	set_pm_test(power_dir, orig_test);
>  	close(power_dir);
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 4664559dc..8fd21c37b 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -214,6 +214,8 @@ enum igt_mem_sleep {
>  	MEM_SLEEP_NUM,
>  };
>  
> +enum igt_mem_sleep igt_system_get_mem_sleep(void);
> +void igt_system_set_mem_sleep(enum igt_mem_sleep sleep);
>  void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  				   enum igt_suspend_test test);
>  void igt_set_autoresume_delay(int delay_secs);
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 9cb00c7f1..ccb15134a 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -44,11 +44,18 @@ typedef struct {
>  	struct pci_device *pci_root;
>  	char pci_slot_name[NAME_MAX];
>  	drmModeResPtr res;
> +	enum igt_mem_sleep default_mem_sleep;
>  } device_t;
>  
>  uint64_t orig_threshold;
>  int fw_handle = -1;
>  
> +static struct param {
> +	bool ignore_default_mem_sleep;
> +} params = {
> +	.ignore_default_mem_sleep = false,
> +};
> +
>  static void dpms_on_off(device_t device, int mode)
>  {
>  	int i;
> @@ -221,6 +228,21 @@ static void close_fw_handle(int sig)
>  	close(fw_handle);
>  }
>  
> +static void assert_default_mem_sleep(device_t device, enum igt_suspend_state s_state)
> +{
> +	if (s_state == NO_SUSPEND)
> +		return;
> +
> +	if (params.ignore_default_mem_sleep)
> +		return;
> +
> +	if (device.default_mem_sleep == MEM_SLEEP_S2IDLE)
> +		igt_require(s_state == SUSPEND_STATE_FREEZE);
> +
> +	if (device.default_mem_sleep == MEM_SLEEP_DEEP)
> +		igt_require(s_state == SUSPEND_STATE_S3);
> +}
> +
>  #define MAX_VMAS 2
>  /**
>   * SUBTEST: %s-basic
> @@ -327,6 +349,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>  	bool check_rpm = (d_state == IGT_ACPI_D3Hot ||
>  			  d_state == IGT_ACPI_D3Cold);
>  
> +	assert_default_mem_sleep(device, s_state);
> +
>  	igt_assert(n_exec_queues <= MAX_N_EXEC_QUEUES);
>  	igt_assert(n_execs > 0);
>  
> @@ -636,6 +660,8 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
>  {
>  	int gt;
>  
> +	assert_default_mem_sleep(device, s_state);
> +
>  	xe_for_each_gt(device.fd_xe, gt) {
>  		char path[256];
>  
> @@ -669,7 +695,28 @@ static void test_mocs_suspend_resume(device_t device, int s_state)
>  	}
>  }
>  
> -igt_main
> +static int opt_handler(int opt, int opt_index, void *data)
> +{
> +	switch(opt) {
> +	case 'm':
> +		params.ignore_default_mem_sleep = true;
> +		igt_debug("Ignoring default mem_state!\n");
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +struct option long_options[] = {
> +	{"ignore-default-mem-sleep", no_argument, NULL, 'm'},
> +	{0, 0, 0, 0}
> +};
> +
> +const char *help_str =
> +	"  --ignore-default-mem-sleep\tUsed to enable s3 tests on systems where s2idle is the default and vice-versa\n";
> +
> +igt_main_args("", long_options, help_str, opt_handler, NULL)
>  {
>  	struct drm_xe_engine_class_instance *hwe;
>  	device_t device;
> @@ -705,6 +752,7 @@ igt_main
>  
>  	igt_fixture {
>  		memset(&device, 0, sizeof(device));
> +		device.default_mem_sleep = igt_system_get_mem_sleep();
>  		device.fd_xe = drm_open_driver(DRIVER_XE);
>  		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
>  		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
> @@ -725,6 +773,7 @@ igt_main
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
> +			assert_default_mem_sleep(device, s->state);
>  			igt_system_suspend_autoresume(s->state, test);
>  		}
>  
> @@ -738,6 +787,7 @@ igt_main
>  			enum igt_suspend_test test = s->state == SUSPEND_STATE_DISK ?
>  				SUSPEND_TEST_DEVICES : SUSPEND_TEST_NONE;
>  
> +			assert_default_mem_sleep(device, s->state);
>  			igt_system_suspend_autoresume(s->state, test);
>  			xe_for_each_engine(device.fd_xe, hwe)
>  				test_exec(device, hwe, 1, 2, NO_SUSPEND,
> @@ -845,5 +895,7 @@ igt_main
>  		igt_restore_runtime_pm();
>  		drmModeFreeResources(device.res);
>  		drm_close_driver(device.fd_xe);
> +		igt_system_set_mem_sleep(device.default_mem_sleep);
>  	}
> +
>  }
> -- 
> 2.44.0
> 
