Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0A36C87FDA
	for <igt-dev@archiver.kernel.org>; Mon,  4 Aug 2025 06:08:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36610E011;
	Mon,  4 Aug 2025 06:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OjUwsVZf";
	dkim-atps=neutral
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7114710E720
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Jul 2025 08:06:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 900236020C;
 Thu, 31 Jul 2025 08:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825F0C4CEF5;
 Thu, 31 Jul 2025 08:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753949200;
 bh=7SMBQ1WU0Kqw0GFNNGkIR8EUmmMCKLouyiotBs6G6UM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OjUwsVZfXCtXqRyxY5drc2fTz7GqcuiefFYzcKywD6h2UURG1ZpaqUr7nZM3X/oTn
 hyKNSSS+IXz8TNKYMLZjCYcBZsEVt3fP3XvUSLX5gKptnOKcsx2gvllcWG5cdSZbWz
 URAhoiSLBsbXUdTdnmDtlwdqsNIoDLL+ugBDLcyTNjiB1uA6n5KJCknWdsM65iWTYK
 X+D/Xw4QvZws3huwaZ3MTtJzzrhhIrk7dvrRc4fcaW6o4JPXuJwmk0EkLoGoqv/xdG
 bLeoFMEjj1nfZm7T4FAxS89kWlfs4X1/WjBuKa325kZ80kqLP9Fxrs1mXNsM6arAP7
 rM+30B9FXjpCw==
Message-ID: <d696461e-bf6d-4f68-a826-02e3c362518e@kernel.org>
Date: Thu, 31 Jul 2025 17:04:06 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/igt_pm: Skip LPM policy control on unsupported
 SATA hosts
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: imre.deak@intel.com, anshuman.gupta@intel.com
References: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20250731074106.2495505-1-chaitanya.kumar.borah@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 04 Aug 2025 06:08:50 +0000
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

On 7/31/25 4:41 PM, Chaitanya Kumar Borah wrote:
> With [1], LPM policy control is now disabled for external SATA ports.
> This led to a regression in our CI runs [2]. Discussions on the regression
> resulted in patch [3] which introduces a new sysfs entry, querying
> which we can determine if LPM policy control is allowed on a host or not.
> 
> Store/Re-store LPM policy only when it is allowed. If the sysfs entry is
> not present assume LPM policy control is allowed. This  maintains backward
> compatibility.

Note: allowed, yes, but that does not mean it will actually work or do
anything, since the port or the device may not be supporting LPN at all.

> 
> [1] https://lore.kernel.org/linux-ide/20250701125321.69496-8-dlemoal@kernel.org/
> [2] https://lore.kernel.org/linux-ide/07563042-6576-41cd-9a95-de83cfc95de1@intel.com/
> [3] https://lore.kernel.org/linux-ide/20250730001947.332661-1-dlemoal@kernel.org/
> 
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Patch looks OK to me (nit below though).

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>


> ---
>  lib/igt_pm.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/lib/igt_pm.c b/lib/igt_pm.c
> index cf1c442f8..1ffcdcef3 100644
> --- a/lib/igt_pm.c
> +++ b/lib/igt_pm.c
> @@ -321,6 +321,35 @@ void igt_pm_enable_audio_runtime_pm(void)
>  		igt_debug("Failed to enable audio runtime PM! (%d)\n", -err);
>  }
>  
> +static bool lpm_supported_by_sata_host(int host_num)
> +{
> +	int fd;
> +	ssize_t len;
> +	char buf[2];
> +	char file_name[PATH_MAX];
> +
> +	snprintf(file_name, PATH_MAX,
> +		 "/sys/class/scsi_host/host%d/link_power_management_supported",
> +		 host_num);
> +
> +	fd = open(file_name, O_RDONLY);
> +
> +	/* assume LPM is supported if sysfs entry is absent. This preserves default behaviour */
> +	if (fd < 0)
> +		return true;
> +
> +	len = read(fd, buf, 1);
> +
> +	close(fd);

Nit: this would all be a lot simpler using scanf:
	
	snprintf(file_name, PATH_MAX,
		 "/sys/class/scsi_host/host%d/link_power_management_supported",
		 host_num);

	/*
	 * If sysfs entry is absent, assume that LPM is supported to
	 * preserve the default behaviour.
	 */
	if (scanf(file_name, "%d", &supported) != 1)
		return true;

	return supported;

> +
> +	if (len <= 0)
> +		return true;
> +
> +	buf[len] = '\0';
> +
> +	return buf[0] == '1';
> +}
> +
>  static void __igt_pm_enable_sata_link_power_management(void)
>  {
>  	int fd, i;
> @@ -372,6 +401,9 @@ static void __igt_pm_enable_sata_link_power_management(void)
>  	igt_install_exit_handler(__igt_pm_sata_link_pm_exit_handler);
>  
>  	for (i = 0; i < __scsi_host_cnt; i++) {
> +		if (!lpm_supported_by_sata_host(i))
> +			continue;
> +
>  		snprintf(file_name, PATH_MAX,
>  			 "/sys/class/scsi_host/host%d/link_power_management_policy",
>  			 i);
> @@ -412,6 +444,9 @@ static void __igt_pm_restore_sata_link_power_management(void)
>  	for (i = 0; i < __scsi_host_cnt; i++) {
>  		int8_t policy;
>  
> +		if (!lpm_supported_by_sata_host(i))
> +			continue;
> +
>  		if (__sata_pm_policies[i] == POLICY_UNKNOWN)
>  			continue;
>  		else


-- 
Damien Le Moal
Western Digital Research
