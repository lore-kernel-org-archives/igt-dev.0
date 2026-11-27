Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891D9606A31C
	for <igt-dev@archiver.kernel.org>; Fri, 27 Nov 2026 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nGZgHeQe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D74710E501;
	Fri, 27 Nov 2026 12:53:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CB10E501
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Nov 2026 12:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795783963; x=1827319963;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=rji+w1wGENgr+cg/Q+BwzO2NuLYocl+m6FYR829kXv8=;
 b=nGZgHeQe/8J2sYrbXdGEJtwtnrMQ5H+Yp27q+9HcQ2ppt6xyqluTmQyC
 NtM26MVSIhd8Asxkl3Vz73q+JtlvadYkvVpiF6QDbzK2ViSSca1oE/tQk
 2w2BCi2UH6cRoSQLLO977yivDGdfWPxYV9tuY08+ZcV7NgL10lbC41HBW
 iZ4yEAhVXkK+QB5U6Fn3Yo8QVC9NSUgQbJ8FrPgIgtNmYLNhVPCD9k1Mr
 yzqpWu1M4pWwCCZZX6N0jq2DC1PSugIx0E7MTBK2pz7OZUYhq+iYT6pZ5
 xmTSGwoZDLAicvtPB+m6iNjzW1TnayZIkY2pJr4WdJYY+bIeOTECJzftc A==;
X-CSE-ConnectionGUID: P7C4GAOpTsywPvrA7B5aiw==
X-CSE-MsgGUID: k9PhCV+vQ4KUYVNC4ghZCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4606703"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4606703"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:52:42 -0800
X-CSE-ConnectionGUID: tsalyRLBSbSR1/5EPZ+Jnw==
X-CSE-MsgGUID: f6LSjNM3Rfq9M6XblhnJbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12414179"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2026 04:52:41 -0800
Date: Fri, 27 Nov 2026 13:52:22 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Roy <rongh7426@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Swati Sharma <swati2.sharma@intel.com>, 
 Karthik B S <karthik.b.s@intel.com>
Subject: Re: [PATCH i-g-t] lib/igt_eld: Accept the ASoC hdmi-codec ELD format
Message-ID: <fnflpngytwky7bsabbbkrbxhq667u4c37ozqirfbofhrp4sd5g@givkorm2oppj>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Roy <rongh7426@gmail.com>, igt-dev@lists.freedesktop.org, 
 Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
References: <20261126105345.656307-1-rongh7426@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261126105345.656307-1-rongh7426@gmail.com>
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Roy,
On 2026-11-26 at 18:53:45 +0800, Roy wrote:
> eld_parse_entry() only reports a monitor when the ELD file has
> "monitor_present 1", and eld_get_igt() also needs "eld_valid 1". Those
> two fields are printed by the HDA HDMI codec only. The ELD files of the
> ASoC hdmi-codec, used by HDMI audio on Arm boards, start at
> monitor_name, so every ELD there is treated as having no monitor.
> 
> On a Raspberry Pi 5 (vc4), kms_hdmi_inject's inject-audio fails even
> though the ELD shows the injected EDID:
> 
>   (kms_hdmi_inject) igt_eld-DEBUG: Monitor not present in ELD: /proc/asound/card0/eld#0
>   (kms_hdmi_inject) CRITICAL: HDMI ELD missing after retry
> 
> while /proc/asound/card0/eld#0 has:
> 
>   monitor_name		IGT
>   connection_type	HDMI
>   eld_version		[0x2] CEA-861D or below
> 
> When the two fields are missing, use the ELD version instead. The
> hdmi-codec shows an all-zero ELD, with eld_version [0x0], when no sink
> is connected, so a non-zero version means a monitor is present and its
> ELD is valid. ELD files that have the fields are handled as before.
> 
> Tested on a Raspberry Pi 5 (Raspberry Pi OS kernel 6.18.39):
> kms_hdmi_inject inject-audio fails before and passes after; inject-4k
> passes both times.
> 
> This change and its description were written with the help of an AI
> coding assistant (Claude); the test runs above were done on real
> hardware.

Move this note about AI use after '---' so it will not
enter git log.

> 
> Signed-off-by: Roy <rongh7426@gmail.com>

As I wrote, it is better to have full name here like
first_name last_name <your@email>
but short nick is also ok, up to you.

+cc Swati Sharma <swati2.sharma@intel.com>,
Karthik B S <karthik.b.s@intel.com>

> ---
>  lib/igt_eld.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/lib/igt_eld.c b/lib/igt_eld.c
> index 0d3c668..51d2ee7 100644
> --- a/lib/igt_eld.c
> +++ b/lib/igt_eld.c
> @@ -167,6 +167,11 @@ static bool parse_sad_field(struct eld_sad *sad, const char *key, char *value)
>   *
>   * Each entry contains one or more SAD blocks. Their contents is exposed in
>   * sadN_* fields.
> + *
> + * The monitor_present and eld_valid fields are printed by the HDA HDMI codec
> + * only. The ASoC hdmi-codec starts at monitor_name and shows an all-zero ELD
> + * (eld_version [0x0]) when no sink is connected, so without those fields a
> + * non-zero ELD version means a monitor is present and its ELD is valid.
>   */
>  static bool eld_parse_entry(const char *path, struct eld_entry *eld)
>  {
> @@ -175,6 +180,8 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
>  	char *key, *value, *sad_key;
>  	size_t len;
>  	bool monitor_present = false;
> +	bool has_present = false, has_valid = false;
> +	unsigned int eld_version = 0;
>  	bool sad_ok;
>  	int sad_index;
>  
> @@ -196,10 +203,15 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
>  		/* Skip whitespace at the beginning */
>  		value += strspn(value, ELD_DELIM);
>  
> +		has_present |= strcmp(key, "monitor_present") == 0;
> +		has_valid |= strcmp(key, "eld_valid") == 0;
> +
>  		if (strcmp(key, "monitor_present") == 0)
>  			monitor_present = strcmp(value, "1") == 0;
>  		else if (strcmp(key, "eld_valid") == 0)
>  			eld->valid = strcmp(value, "1") == 0;
> +		else if (strcmp(key, "eld_version") == 0)
> +			sscanf(value, "[0x%x]", &eld_version);
>  		else if (strcmp(key, "monitor_name") == 0)
>  			snprintf(eld->monitor_name, sizeof(eld->monitor_name),
>  				 "%s", value);
> @@ -227,6 +239,11 @@ static bool eld_parse_entry(const char *path, struct eld_entry *eld)
>  
>  	fclose(f);
>  
> +	if (!has_present)
> +		monitor_present = eld_version != 0;
> +	if (!has_valid)
> +		eld->valid = monitor_present;
> +
>  	if (!monitor_present)
>  		igt_debug("Monitor not present in ELD: %s\n", path);
>  	return monitor_present;
> -- 
> 2.51.1.windows.1
> 
