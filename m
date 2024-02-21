Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253FFC48BF6
	for <igt-dev@archiver.kernel.org>; Wed, 21 Feb 2024 09:13:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 870F210E40E;
	Wed, 21 Feb 2024 09:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ls6dip8J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E04710E40E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2024 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708506783; x=1740042783;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rUiTPL//A4o1LldLtIrYffFvbOlGasUYVRWSwZc6X18=;
 b=Ls6dip8JbU1Hav5muNWgi/MOkh0cJLWIQqDC4OJDXafIb3LEDEnbWEed
 h7OZbmnD2v1/Qcr683LtrgBEL820jYIiDVAYJAnly1sUP41sKCzF15Auz
 H8NIoiI9lLF50U6IVBfftR6SKK0FXqI2jHwQgjp+dCQGD+FO+zEjOEnnO
 iUWkxFfP1UcMKcRtU14Rpj791AfowheJexIfqydIDjjtxNPO+lIeGyWyt
 LYhLnW8c7pU2f1WcdhTu96qxuE/FThQm9Hv+xOf8cS8AqZa4n10qAvM2E
 NTO567PWtfDGrRRfOqJM1fzIyZtYWkvC5bm2euloGXUw/Gl+S4qPgthdc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2523930"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2523930"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:13:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9634446"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa003-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 01:12:59 -0800
Date: Wed, 21 Feb 2024 10:12:56 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH i-g-t] tests/amdgpu: refactor the ABM test to use the new
 sysfs interface
Message-ID: <20240221091256.fvg2sjskk6lqvzkw@kamilkon-desk.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>,
 igt-dev@lists.freedesktop.org, Alex Hung <alex.hung@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Rodrigo Siqueira <rodrigo.siqueira@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <20240220191625.27749-1-hamza.mahfooz@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240220191625.27749-1-hamza.mahfooz@amd.com>
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

Hi Hamza,
On 2024-02-20 at 14:16:25 -0500, Hamza Mahfooz wrote:
> The "abm level" DRM property is being dropped in favour of a sysfs
> interface. So, change the ABM test to use the new way to set the desired
> ABM level from user space.
> 
> Link: https://lore.kernel.org/r/20240216153334.83372-1-mario.limonciello@amd.com/
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
>  tests/amdgpu/amd_abm.c | 62 ++++++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 33 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
> index 082da7ed6..e56000e02 100644
> --- a/tests/amdgpu/amd_abm.c
> +++ b/tests/amdgpu/amd_abm.c
> @@ -35,11 +35,11 @@
>  #define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
>  #define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
>  #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
> +#define PANEL_POWER_SAVINGS_PATH "/sys/class/drm/card0-%s/amdgpu/panel_power_savings"
>  
>  typedef struct data {
>  	igt_display_t display;
>  	int drm_fd;
> -	uint32_t abm_prop_id;
>  } data_t;
>  
>  
> @@ -104,14 +104,22 @@ static int backlight_write_brightness(int value)
>  	return 0;
>  }
>  
> -static void set_abm_level(int drm_fd, int level, uint32_t abm_prop_id, uint32_t output_id)
> +static void set_abm_level(char *connector_name, int level)
>  {
> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
> -	int ret;
> +	char buf[PATH_MAX];
> +	int fd;
> +
> +	igt_assert(snprintf(buf, PATH_MAX, PANEL_POWER_SAVINGS_PATH,
> +			    connector_name) < PATH_MAX);
> +
> +	fd = open(buf, O_WRONLY);
> +
> +	igt_assert(fd != -1);
>  
> -	ret = drmModeObjectSetProperty(drm_fd, output_id, type,
> -				       abm_prop_id, level);

Keep in mind that you replaced drmMode...() call with new
debugfs (or sysfs), imho this is not the same.

I will merge this if this is ok, Alex?

Regards,
Kamil

> -	igt_assert_eq(ret, 0);
> +	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
> +		      write(fd, buf, 1));
> +
> +	igt_assert_eq(close(fd), 0);
>  }
>  
>  static int backlight_read_max_brightness(int *result)
> @@ -142,31 +150,19 @@ static int backlight_read_max_brightness(int *result)
>  static void test_init(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> +	drmModeConnectorPtr conn;
>  	int i;
> -	bool abm_prop_exists;
> -	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
> -	uint32_t output_id;
> -
> -	for (i = 0; i < display->n_outputs; i++)
> -		if (display->outputs[i].config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> -			break;
> -	igt_skip_on_f(i ==  display->n_outputs, "no eDP connector found\n");
> -
> -	abm_prop_exists = false;
>  
>  	for (i = 0; i < display->n_outputs; i++) {
> -		output_id = display->outputs[i].id;
> +		conn = display->outputs[i].config.connector;
>  
> -		abm_prop_exists = kmstest_get_property(
> -			data->drm_fd, output_id, type, "abm level",
> -			&data->abm_prop_id, NULL, NULL);
> -
> -		if (abm_prop_exists)
> -			break;
> +		if (conn->connector_type == DRM_MODE_CONNECTOR_eDP &&
> +		    conn->connection == DRM_MODE_CONNECTED) {
> +			return;
> +		}
>  	}
>  
> -	if (!abm_prop_exists)
> -		igt_skip("No abm level property on any connector.\n");
> +	igt_skip("No eDP connector found\n");
>  }
>  
>  
> @@ -187,7 +183,7 @@ static void backlight_dpms_cycle(data_t *data)
>  		ret = backlight_read_max_brightness(&max_brightness);
>  		igt_assert_eq(ret, 0);
>  
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>  		backlight_write_brightness(max_brightness / 2);
>  		usleep(100000);
>  		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -218,7 +214,7 @@ static void backlight_monotonic_basic(data_t *data)
>  
>  		brightness_step = max_brightness / 10;
>  
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>  		backlight_write_brightness(max_brightness);
>  		usleep(100000);
>  		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -252,7 +248,7 @@ static void backlight_monotonic_abm(data_t *data)
>  
>  		brightness_step = max_brightness / 10;
>  		for (i = 1; i < 5; i++) {
> -			set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +			set_abm_level(output->name, 0);
>  			backlight_write_brightness(max_brightness);
>  			usleep(100000);
>  			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
> @@ -284,14 +280,14 @@ static void abm_enabled(data_t *data)
>  		ret = backlight_read_max_brightness(&max_brightness);
>  		igt_assert_eq(ret, 0);
>  
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>  		backlight_write_brightness(max_brightness);
>  		usleep(100000);
>  		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>  		pwm_without_abm = prev_pwm;
>  
>  		for (i = 1; i < 5; i++) {
> -			set_abm_level(data->drm_fd, i, data->abm_prop_id, output->id);
> +			set_abm_level(output->name, i);
>  			usleep(100000);
>  			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
>  			igt_assert(pwm <= prev_pwm);
> @@ -318,7 +314,7 @@ static void abm_gradual(data_t *data)
>  
>  		igt_assert_eq(ret, 0);
>  
> -		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 0);
>  		backlight_write_brightness(max_brightness);
>  
>  		sleep(convergence_delay);
> @@ -326,7 +322,7 @@ static void abm_gradual(data_t *data)
>  		curr = read_current_backlight_pwm(data->drm_fd, output->name);
>  
>  		igt_assert_eq(prev_pwm, curr);
> -		set_abm_level(data->drm_fd, 4, data->abm_prop_id, output->id);
> +		set_abm_level(output->name, 4);
>  		for (i = 0; i < 10; i++) {
>  			usleep(100000);
>  			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
> -- 
> 2.43.0
> 
