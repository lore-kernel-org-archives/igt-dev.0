Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C022CC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 15:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE8910E903;
	Mon, 21 Sep 2026 15:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PWLOGxHd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0AB10E8A0
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 15:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790004701; x=1821540701;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=n4ZVpQorTnUyLsT0JwVULqkMeJOQ1uluGcKTy3GZflA=;
 b=PWLOGxHd7TAjV7p+Q4IHrHQZG8rvGW4x1uwkOT+UPxkfnN/s5TmZwzfE
 8PkA8742L0dGeL0oWiKpB5JkMYDT6q2qFjUCAo/qZEaThdX91HpHLCuXD
 fGjY46Dia1qSHg8inOVZBgShvpK1ll1TFl3CNp00M3Ev+FqbY3e2HQL8A
 ZtzH7CYxvvmwlH6bcs8vOKhwuRUYkB6qcl1wPjt+c0pwkNjYGsR6fVIWH
 ekVjaig7YHi9fLyjWCyIeb6PV/lFW9FTOak+OA/CVeRhYXwpEEbu4Rc4T
 i4dBjbrUyjMeDxK4lR18/c3AJNPJwDfdtOwWdIAoB4mHyRDhvv8DjD1q8 Q==;
X-CSE-ConnectionGUID: yj1c7GoBQO6COUDhQ0VMLQ==
X-CSE-MsgGUID: ewBQhF7lTkW0vaAAemP/Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="93028718"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="93028718"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 08:31:41 -0700
X-CSE-ConnectionGUID: RO0WqGBBRtyG36G23J6mDg==
X-CSE-MsgGUID: gbn8MWzETviZ8Z6Df1oFgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="3995915"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 08:31:39 -0700
Date: Mon, 21 Sep 2026 17:31:36 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
Subject: Re: [PATCH i-g-t] lib/igt_aux: enable serial printk logs during
 suspend
Message-ID: <20260921153136.vr4i6jmby5fq4pk7@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik Poosa <karthik.poosa@intel.com>,
 igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 anshuman.gupta@intel.com, badal.nilawar@intel.com,
 raag.jadav@intel.com, riana.tauro@intel.com, sk.anirban@intel.com,
 mallesh.koujalagi@intel.com, soham.purkait@intel.com
References: <20260916141709.1216470-1-karthik.poosa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916141709.1216470-1-karthik.poosa@intel.com>
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

Hi Karthik,
On 2026-09-16 at 19:47:09 +0530, Karthik Poosa wrote:
> Save /proc/sys/kernel/printk, set the console loglevel to 8 before system
> suspend so suspend-stage logs reach the serial console, and restore the
> original value after resume or exit-handler cleanup.
> 
> During system suspend, userspace log collection is no longer reliable and
> the useful failure point is often before resume completes. Raise the printk
> loglevel to 8 for the suspend window so PM and driver messages reach the
> serial console, then restore the original setting after resume.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: GitHub-Copilot:GPT-5.4
LGTM
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

> ---
>  lib/igt_aux.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 86 insertions(+)
> 
> diff --git a/lib/igt_aux.c b/lib/igt_aux.c
> index 0d250ae2f..510266319 100644
> --- a/lib/igt_aux.c
> +++ b/lib/igt_aux.c
> @@ -699,9 +699,13 @@ void igt_print_activity(void)
>  static int autoresume_delay;
>  bool __console_suspend_saved_state;
>  bool __pm_debug_messages_state;
> +static char __printk_saved_state[64];
> +static ssize_t __printk_saved_state_len = -1;
>  
>  #define SYSFS_MODULE_PRINTK "/sys/module/printk/parameters/"
> +#define PROC_SYS_KERNEL_PRINTK "/proc/sys/kernel/printk"
>  #define CONSOLE_SUSPEND_DISABLE false
> +#define SERIAL_CONSOLE_LOGLEVEL "8\n"
>  
>  static const char *suspend_state_name[] = {
>  	[SUSPEND_STATE_FREEZE] = "freeze",
> @@ -915,6 +919,23 @@ static bool is_mem_sleep_state_supported(int power_dir, enum igt_mem_sleep state
>  static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
>  {
>  	int sysfs_fd, power_dir;
> +	int fd;
> +	ssize_t written;
> +
> +	if (__printk_saved_state_len > 0) {
> +		fd = open(PROC_SYS_KERNEL_PRINTK, O_WRONLY);
> +		if (fd >= 0) {
> +			written = write(fd, __printk_saved_state, __printk_saved_state_len);
> +			if (written != __printk_saved_state_len)
> +				igt_warn("Unable to restore %s Err:%d\n",
> +					 PROC_SYS_KERNEL_PRINTK, errno);
> +			close(fd);
> +		} else {
> +			igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +		}
> +
> +		__printk_saved_state_len = -1;
> +	}
>  
>  	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
>  	if (sysfs_fd < 0)
> @@ -933,6 +954,67 @@ static void igt_aux_pm_suspend_dbg_restore_exit_handler(int sig)
>  	close(power_dir);
>  }
>  
> +static void igt_aux_enable_suspend_serial_logs(void)
> +{
> +	int fd;
> +	ssize_t len;
> +	ssize_t written;
> +
> +	fd = open(PROC_SYS_KERNEL_PRINTK, O_RDWR);
> +	if (fd < 0) {
> +		igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +		return;
> +	}
> +
> +	len = read(fd, __printk_saved_state, sizeof(__printk_saved_state) - 1);
> +	if (len < 0) {
> +		igt_warn("Unable to read %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +		close(fd);
> +		return;
> +	}
> +
> +	__printk_saved_state[len] = '\0';
> +	__printk_saved_state_len = len;
> +
> +	if (lseek(fd, 0, SEEK_SET) < 0) {
> +		igt_warn("Unable to seek %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +		close(fd);
> +		return;
> +	}
> +
> +	written = write(fd, SERIAL_CONSOLE_LOGLEVEL, strlen(SERIAL_CONSOLE_LOGLEVEL));
> +	if (written != strlen(SERIAL_CONSOLE_LOGLEVEL)) {
> +		igt_warn("Unable to set %s to %s Err:%d\n",
> +			 PROC_SYS_KERNEL_PRINTK, SERIAL_CONSOLE_LOGLEVEL, errno);
> +		__printk_saved_state_len = -1;
> +	}
> +
> +	close(fd);
> +}
> +
> +static void igt_aux_restore_suspend_serial_logs(void)
> +{
> +	int fd;
> +	ssize_t written;
> +
> +	if (__printk_saved_state_len <= 0)
> +		return;
> +
> +	fd = open(PROC_SYS_KERNEL_PRINTK, O_WRONLY);
> +	if (fd < 0) {
> +		igt_warn("Unable to open %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +		return;
> +	}
> +
> +	written = write(fd, __printk_saved_state, __printk_saved_state_len);
> +	if (written != __printk_saved_state_len)
> +		igt_warn("Unable to restore %s Err:%d\n", PROC_SYS_KERNEL_PRINTK, errno);
> +	else
> +		__printk_saved_state_len = -1;
> +
> +	close(fd);
> +}
> +
>  /**
>   * igt_aux_enable_pm_suspend_dbg:
>   * @power_dir: /sys/power/ dir fd
> @@ -949,6 +1031,8 @@ static void igt_aux_enable_pm_suspend_dbg(int power_dir)
>  {
>  	int sysfs_fd;
>  
> +	igt_aux_enable_suspend_serial_logs();
> +
>  	sysfs_fd = open(SYSFS_MODULE_PRINTK, O_RDONLY);
>  	if (sysfs_fd > 0) {
>  		__console_suspend_saved_state = igt_sysfs_get_boolean(sysfs_fd, "console_suspend");
> @@ -1027,6 +1111,8 @@ void igt_system_suspend_autoresume(enum igt_suspend_state state,
>  	else
>  		suspend_via_sysfs(power_dir, state);
>  
> +	igt_aux_restore_suspend_serial_logs();
> +
>  	if (orig_mem_sleep)
>  		set_mem_sleep(power_dir, orig_mem_sleep);
>  
> -- 
> 2.25.1
> 
