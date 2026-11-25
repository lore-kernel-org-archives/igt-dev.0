Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3B1606A33E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jIXmnF+V
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A03A110E0EF;
	Wed, 25 Nov 2026 11:19:35 +0000 (UTC)
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE0510E886
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 11:18:31 +0000 (UTC)
Received: by mail-dl1-f44.google.com with SMTP id
 a92af1059eb24-1a2af4c8d00so3744779c88.0
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 03:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795605511; x=1796210311; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=zzdfJuV5XIOVMg8bn/YBToEyka6g8qIL2H30EiD8Lpc=;
 b=jIXmnF+V/PfC6S+WCcjkpdhUvlEWTms5fhzC3zi9XuE22BPPnNdQ6NkQc09HtsFLR6
 DiBeVaaR9hkBznzpTW7YmqfBDkC/A+u8FPOVAJEBXMLURc78L7R/+Yhz6wOU/6DVzi0Y
 vpYWiT7+oA2etuo4UTtmyZgjwaQ0PRS/Pn078zEtylgrcvdaSCIMCxiwSOEeqlH3Z4YW
 Hjsz711mw+27LvJMl6M0CZykJXww3gNVVlvNSXjZ0wgMqlt2F0XC9GJXSKjR1UAwnd3b
 SBNMAJl7CbEDBQ54a5rIqiBxHvnf5TyPS4f1a4oXKOhntywFVS8EUOTcQVELUmlmrOLC
 2u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795605511; x=1796210311;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zzdfJuV5XIOVMg8bn/YBToEyka6g8qIL2H30EiD8Lpc=;
 b=mYKZsmIaxH4p4YSPNAmToB5N6/dAJz2E1jRWchKgQ/8RWcH/GoZrnjCK3KwkzAyciU
 8aSS4xKDMd0YJRz+WjuIC9q7U86UWNO6nA926d9M1e4AJBWULJmbU5wVC3obRrMpzx9V
 4cgj0ENoQiwdYVQzIkDGBMz2aviSmLP6Frw6DgkLSVFoaLROqwvGkrv0V563YGggRw0z
 R37c5A825l87CV09tBkkJLq/NBjloJ0KGDBltoJiJCAwL1QumLa4Tzc3AFvhYYjE35RG
 wbjPn3yZsDoQEa/9dg+AiCb71oc76/v0ez/BF/pllH+857/tz0I6Jk0yvJhkIJbtZ/15
 UFyg==
X-Forwarded-Encrypted: i=1;
 AL+hErHln54iMZq9Hm84Aoiu0dpAO3clFes1fFbpBf1LKZ3jrx7Q96158tMUyZKOPxA6CZ6UnTm97KEZ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9hILf7xnN6QBLHopDFta6P73nYrgxH6A6LeQMtId8+YTn7kR1T
 bZka7jVOSo4Na08hXbe6AQP5HNN02nwss0axpihmnM9OYSNyveYrCcas
X-Gm-Gg: AZFdTZecn6iIm9EumbfBrWB/f/X6QEeoue0tLX/YXQRXa5TC3l/1uV7yd8qoEFyJW3p
 aISmKujnI/JZp4wS4rQA09+xF7gA4M55NrsWRp7VqXDriyOd05+i3AkUSxPba4d1IUSzdovhnIj
 563DcJNwekUmMgHIjrzYsVhwFm6d9VuUviFvxM7oKHBwQ0J8DWXDWdb3YqG8RGtwpuvYKBxoT/Y
 pBZhuCsG/78r1cHSAG1f8kxErNniLfSwpAvLCPbDF23TLNR9ZqhYdOnpPzX0/7LzKCBVg2nK0ke
 ptlpj+CFFeodjOf5XPl0K8g/V5HtMPymqPVUzl6QDONVD+II6Ejm4bk80NtoZ5J5OXTsF1dSfd2
 amaxCWCkIUWSmA9IZQdsoFOMdGapONA9TiKLFcFZ6TRlX7sglB2hLJ/kphH/yQod61SLWP5PG0F
 QaAmrtfoJxaUMHhuXzfAPvkuBwmjINO5qTbWsUrYwEnbzKrCCC2se5Oi/kFVq8bwHXtDIHA+pmy
 sPSMnlAuUl7rjjOQ/blvlnV/olrmKqDSdHbalUNKG18n3X0o6Pwa/sMtcgAHzzsBwi67FICMvN4
 MlKUAJQYW27/Ygh6MeFJ6etTHSP/Homsy/HBAPooVrnFO6IyvrfFo0B+naMQPkfawrbWU/HdNsp
 //T8qQz89dr9TJoqHgQ==
X-Received: by 2002:a05:7022:1587:b0:168:3243:c911 with SMTP id
 a92af1059eb24-1b556903a3bmr20121104c88.37.1795605510684; 
 Wed, 25 Nov 2026 03:18:30 -0800 (PST)
Received: from [192.55.55.46] ([192.55.55.46])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-38566cd40c5sm63757025eec.10.2026.11.25.03.18.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2026 03:18:30 -0800 (PST)
Message-ID: <75071cde-1468-4881-8225-09975b0f5654@gmail.com>
Date: Wed, 25 Nov 2026 13:18:25 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/3] lib/igt_aux: Add hibernate autoresume helper
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20261120134400.1888895-1-swati2.sharma@intel.com>
 <20261120134400.1888895-2-swati2.sharma@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>
In-Reply-To: <20261120134400.1888895-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

look ok.
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 20/11/2026 15.43, Swati Sharma wrote:
> Move the hibernation checks and GRUB kernel selection into a reusable
> igt_system_hibernate_autoresume() helper.
> 
> The helper verifies hibernation support, swap availability, and the
> resume kernel configuration, then configures GRUB to boot the running
> kernel before starting the suspend-to-disk cycle. Update kms_ccs to use
> the shared helper.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_aux.c         | 143 +++++++++++++++++++++++++++++++++++++
>   lib/igt_aux.h         |   1 +
>   tests/intel/kms_ccs.c | 162 +-----------------------------------------
>   3 files changed, 145 insertions(+), 161 deletions(-)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 18053db8f..dec8073d3 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -1120,6 +1120,149 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>   	close(power_dir);
>   }
>   
> +static bool igt_aux_hibernation_supported(void)
> +{
> +	char buffer[2048];
> +	ssize_t state_bytes;
> +	size_t cmdline_bytes;
> +	FILE *cmdline;
> +	int fd;
> +
> +	fd = open("/sys/power/state", O_RDONLY);
> +	if (fd < 0) {
> +		igt_debug("Failed to open /sys/power/state\n");
> +		return false;
> +	}
> +
> +	state_bytes = read(fd, buffer, sizeof(buffer) - 1);
> +	close(fd);
> +	if (state_bytes <= 0) {
> +		igt_debug("Failed to read /sys/power/state\n");
> +		return false;
> +	}
> +
> +	buffer[state_bytes] = '\0';
> +	if (!strstr(buffer, "disk")) {
> +		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
> +		return false;
> +	}
> +
> +	cmdline = fopen("/proc/cmdline", "r");
> +	if (!cmdline) {
> +		igt_debug("Failed to open /proc/cmdline\n");
> +		return false;
> +	}
> +
> +	cmdline_bytes = fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> +	fclose(cmdline);
> +	buffer[cmdline_bytes] = '\0';
> +	if (!strstr(buffer, "resume=")) {
> +		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
> +static bool igt_aux_ensure_grub_boots_same_kernel(void)
> +{
> +	char cmdline[1024];
> +	char current_kernel[256];
> +	char last_menuentry[512] = "";
> +	char grub_entry[512];
> +	char command[1024];
> +	char line[1024];
> +	FILE *cmdline_file, *grub_cfg;
> +	char *kernel_arg, *kernel_end;
> +	bool kernel_found = false;
> +
> +	cmdline_file = fopen("/proc/cmdline", "r");
> +	if (!cmdline_file) {
> +		igt_debug("Failed to open /proc/cmdline\n");
> +		return false;
> +	}
> +
> +	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> +		fclose(cmdline_file);
> +		igt_debug("Failed to read /proc/cmdline\n");
> +		return false;
> +	}
> +	fclose(cmdline_file);
> +
> +	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> +	if (!kernel_arg) {
> +		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
> +		return false;
> +	}
> +
> +	kernel_arg += strlen("BOOT_IMAGE=");
> +	kernel_end = strchr(kernel_arg, ' ');
> +	if (!kernel_end)
> +		kernel_end = kernel_arg + strlen(kernel_arg);
> +
> +	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> +		 (int)(kernel_end - kernel_arg), kernel_arg);
> +	igt_debug("Current kernel image: %s\n", current_kernel);
> +
> +	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
> +	if (!grub_cfg) {
> +		igt_debug("Failed to open GRUB configuration file\n");
> +		return false;
> +	}
> +
> +	while (fgets(line, sizeof(line), grub_cfg)) {
> +		if (strstr(line, "menuentry")) {
> +			char *start = strchr(line, '\'');
> +			char *end = start ? strchr(start + 1, '\'') : NULL;
> +
> +			if (start && end)
> +				snprintf(last_menuentry, sizeof(last_menuentry), "%.*s",
> +					 (int)(end - start - 1), start + 1);
> +		}
> +
> +		if (strstr(line, current_kernel)) {
> +			snprintf(grub_entry, sizeof(grub_entry), "%s", last_menuentry);
> +			kernel_found = true;
> +			break;
> +		}
> +	}
> +	fclose(grub_cfg);
> +
> +	if (!kernel_found) {
> +		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
> +			  current_kernel);
> +		return false;
> +	}
> +
> +	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> +	if (system(command) != 0) {
> +		igt_debug("Failed to set GRUB boot target to: %s\n", grub_entry);
> +		return false;
> +	}
> +
> +	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> +		  current_kernel, grub_entry);
> +	return true;
> +}
> +
> +/**
> + * igt_system_hibernate_autoresume:
> + *
> + * Prepare GRUB to boot the running kernel on the next boot, then perform a
> + * full suspend-to-disk cycle and automatically resume.
> + */
> +void igt_system_hibernate_autoresume(void)
> +{
> +	igt_require_f(igt_aux_hibernation_supported(),
> +		      "Kernel is not configured for hibernation resume\n");
> +	igt_require_f(igt_get_total_swap_mb(),
> +		      "Suspend to disk requires swap space.\n");
> +	igt_require_f(igt_aux_ensure_grub_boots_same_kernel(),
> +		      "Couldn't find correct kernel in grub.cfg\n");
> +
> +	igt_system_suspend_autoresume(SUSPEND_STATE_DISK, SUSPEND_TEST_NONE);
> +}
> +
>   static int original_autoresume_delay;
>   
>   static void igt_restore_autoresume_delay(int sig)
> diff --git a/lib/igt_aux.h b/lib/igt_aux.h
> index 30530a404..8d7168fe7 100644
> --- a/lib/igt_aux.h
> +++ b/lib/igt_aux.h
> @@ -216,6 +216,7 @@ enum igt_mem_sleep {
>   
>   void igt_system_suspend_autoresume(enum igt_suspend_state state,
>   				   enum igt_suspend_test test);
> +void igt_system_hibernate_autoresume(void);
>   void igt_set_autoresume_delay(int delay_secs);
>   int igt_get_autoresume_delay(enum igt_suspend_state state);
>   
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 4d0bda6a7..9740fe1ae 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -270,161 +270,6 @@ static const struct {
>   #define MAX_SPRITE_PLANE_WIDTH 2000
>   
>   
> -/**
> - * check_hibernation_support:
> - *
> - * Return: True if kernel is configured with resume point for hibernate.
> - */
> -static bool check_hibernation_support(void)
> -{
> -	int fd;
> -	char buffer[2048];
> -	ssize_t bytes_read;
> -	FILE *cmdline;
> -
> -	/* Check if hibernation is supported in /sys/power/state */
> -	fd = open("/sys/power/state", O_RDONLY);
> -
> -	if (fd <= 0) {
> -		igt_debug("Failed to open /sys/power/state\n");
> -		return false;
> -	}
> -
> -	bytes_read = read(fd, buffer, sizeof(buffer) - 1);
> -	close(fd);
> -
> -	if (bytes_read <= 0) {
> -		igt_debug("Failed to read /sys/power/state");
> -		return false;
> -	}
> -
> -	buffer[bytes_read] = '\0';
> -	if (strstr(buffer, "disk") == NULL) {
> -		igt_debug("Hibernation (suspend to disk) is not supported on this system.\n");
> -		return false;
> -	}
> -
> -	/* Check if resume is configured in kernel command line */
> -	cmdline = fopen("/proc/cmdline", "r");
> -
> -	if (!cmdline) {
> -		igt_debug("Failed to open /proc/cmdline");
> -		return false;
> -	}
> -
> -	fread(buffer, 1, sizeof(buffer) - 1, cmdline);
> -	fclose(cmdline);
> -
> -	if (strstr(buffer, "resume=") == NULL) {
> -		igt_debug("Kernel does not have 'resume' parameter configured for hibernation.\n");
> -		return false;
> -	}
> -
> -	return true;
> -}
> -
> -/**
> - * Ensure_grub_boots_same_kernel:
> - *
> - * Return: True if kernel was found and set for next reboot.
> - */
> -static bool ensure_grub_boots_same_kernel(void)
> -{
> -	char cmdline[1024];
> -	char current_kernel[256];
> -	char last_menuentry[512] = "";
> -	char grub_entry[512];
> -	char command[1024];
> -	FILE *cmdline_file, *grub_cfg;
> -	char line[1024];
> -	bool kernel_found = false;
> -	char *kernel_arg;
> -	char *kernel_end;
> -
> -	/* Read /proc/cmdline to get the current kernel image */
> -	cmdline_file = fopen("/proc/cmdline", "r");
> -	if (!cmdline_file) {
> -		igt_debug("Failed to open /proc/cmdline");
> -		return false;
> -	}
> -
> -	if (!fgets(cmdline, sizeof(cmdline), cmdline_file)) {
> -		fclose(cmdline_file);
> -		igt_debug("Failed to read /proc/cmdline");
> -		return false;
> -	}
> -	fclose(cmdline_file);
> -
> -	/* Parse the kernel image from cmdline */
> -	kernel_arg = strstr(cmdline, "BOOT_IMAGE=");
> -	if (!kernel_arg) {
> -		igt_debug("BOOT_IMAGE= not found in /proc/cmdline\n");
> -		return false;
> -	}
> -
> -	kernel_arg += strlen("BOOT_IMAGE=");
> -	kernel_end = strchr(kernel_arg, ' ');
> -
> -	if (!kernel_end)
> -		kernel_end = kernel_arg + strlen(kernel_arg);
> -
> -	snprintf(current_kernel, sizeof(current_kernel), "%.*s",
> -		 (int)(kernel_end - kernel_arg), kernel_arg);
> -	igt_debug("Current kernel image: %s\n", current_kernel);
> -
> -	/* Open GRUB config file to find matching entry */
> -	grub_cfg = fopen("/boot/grub/grub.cfg", "r");
> -	if (!grub_cfg) {
> -		igt_debug("Failed to open GRUB configuration file");
> -		return false;
> -	}
> -
> -	while (fgets(line, sizeof(line), grub_cfg)) {
> -		/* Check if the line contains a menuentry */
> -		if (strstr(line, "menuentry")) {
> -		/* Store the menuentry line */
> -			char *start = strchr(line, '\'');
> -			char *end = start ? strchr(start + 1, '\'') : NULL;
> -
> -			if (start && end) {
> -				snprintf(last_menuentry,
> -					 sizeof(last_menuentry),
> -					 "%.*s", (int)(end - start - 1),
> -					 start + 1);
> -			}
> -		}
> -
> -		/* Check if the current line contains the kernel */
> -		if (strstr(line, current_kernel)) {
> -			/* Use the last seen menuentry as the match */
> -			snprintf(grub_entry, sizeof(grub_entry), "%s",
> -				 last_menuentry);
> -			kernel_found = true;
> -			break;
> -		}
> -	}
> -
> -	fclose(grub_cfg);
> -
> -	if (!kernel_found) {
> -		igt_debug("Failed to find matching GRUB entry for kernel: %s\n",
> -			  current_kernel);
> -		return false;
> -	}
> -
> -	/* Set the GRUB boot target using grub-reboot */
> -	snprintf(command, sizeof(command), "grub-reboot \"%s\"", grub_entry);
> -	if (system(command) != 0) {
> -		igt_debug("Failed to set GRUB boot target to: %s\n",
> -			  grub_entry);
> -		return false;
> -	}
> -
> -	igt_debug("Set GRUB to boot kernel: %s (GRUB entry: %s)\n",
> -		  current_kernel, grub_entry);
> -	return true;
> -}
> -
>   static void addfb_init(struct igt_fb *fb, struct drm_mode_fb_cmd2 *f)
>   {
>   	int i;
> @@ -994,12 +839,7 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
>   	if (ret == 0 && !(fb_flags & TEST_BAD_ROTATION_90) && crc) {
>   		if (data->flags & TEST_SUSPEND && fb_flags & FB_COMPRESSED) {
>   			if (data->do_hibernate) {
> -				igt_require_f(check_hibernation_support(),
> -					      "Kernel is not cofigured for resume\n");
> -				igt_require_f(ensure_grub_boots_same_kernel(),
> -					      "Couldn't find correct kernel in grub.cfg\n");
> -				igt_system_suspend_autoresume(SUSPEND_STATE_DISK,
> -							      SUSPEND_TEST_NONE);
> +				igt_system_hibernate_autoresume();
>   			} else {
>   				igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>   							      SUSPEND_TEST_NONE);

