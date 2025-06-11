Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8926BC71141
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 17:41:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D9910E6E1;
	Wed, 11 Jun 2025 17:41:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dVTJsXU6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10E210E6E1
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 17:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749663676; x=1781199676;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Cq8VxZlbHJ/Vo/qBp0o1Nf2d/k0ztQxU/7EA3YCXsO0=;
 b=dVTJsXU60wMqYsO6ilnTuo9VxHdS1dEKWmHLC+X2i6SS1rcEl1HkI812
 fy1mSn9kae2+//QfcwfBZ+DmNLWz4KI1gIsVbFDucyVNmjs49xND+D4jJ
 lrZHFLC0HRu3ebhBfEOsjslc3V16NaNjoeZDawn1mOYTfUnC1xP9f6QFZ
 QgZHuN7VpzWBRemkWKOWFAk9dhPymdHRg1OpEaS80BWGLYPlYY5Hnr8CH
 lDImrydEc6kQIlWPswtm5gpkSWPw/jITXfqw2uOiiHcAOB1vTHP7torbe
 kDpCPzyRssmQY5v6NCNkDBDmooMSYnAbQtDN9AngrwHArrM7pjKyd/IOa w==;
X-CSE-ConnectionGUID: UnmUvRNqQaOrSpvYBmWAbg==
X-CSE-MsgGUID: vYpJ72pBT6uR96Q0bqwqFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="69256160"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="69256160"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 10:41:16 -0700
X-CSE-ConnectionGUID: ChgEUS/QT4y7ey+xWSYuSA==
X-CSE-MsgGUID: m9qJUx2QTy+yFFRLNT63vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; d="scan'208";a="148169865"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa009-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 10:41:13 -0700
Date: Wed, 11 Jun 2025 19:41:11 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Cc: igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
Subject: Re: [PATCH i-g-t v2] tests/kms_content_protection: Skip empty vendor
 names in blocklist
Message-ID: <20250611174111.mfa6w6spgwjvki4y@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 suraj.kandpal@intel.com, mohammed.thasleem@intel.com
References: <20250609065936.415814-1-santhosh.reddy.guddati@intel.com>
 <20250609073228.416135-1-santhosh.reddy.guddati@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250609073228.416135-1-santhosh.reddy.guddati@intel.com>
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

Hi Santhosh,
On 2025-06-09 at 13:02:28 +0530, Santhosh Reddy Guddati wrote:
> Avoids false positives by returning false early when the vendor name is
> NULL, empty, or a single whitespace character.
> 
> log message in kms_content_protection by printing skipped outputs instead
> of asserting.

Technically igt_require() skips this and all next, it is not assert.

> 
> V2: Add Fixes tag (Suraj)
> 
> Fixes: 6a256bfe3 (tests/kms_content_protection: Whitelist check for panel
> support)

No empty line after 'Fixes: ' and s-o-b, also please use correct format:

Fixes: 6a256bfe3025 ("tests/kms_content_protection: Whitelist check for panel support")

> 
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>  lib/igt_panel.c                | 8 ++++++--

Please split this into two patches, one for a fix,
second for functional change from igt_require (which skips tests)
into continue testing.


>  tests/kms_content_protection.c | 9 ++++++---
>  2 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/igt_panel.c b/lib/igt_panel.c
> index c89bf9123..c51fd7d54 100644
> --- a/lib/igt_panel.c
> +++ b/lib/igt_panel.c
> @@ -20,11 +20,15 @@
>   * true if the vendor name is found in the blocklist, false otherwise.
>   */
>  bool igt_is_panel_blocked(const char *vendor_name,
> -			    const char *const blocklist[],
> -			    size_t blocklist_size)
> +				const char *const blocklist[],
> +				size_t blocklist_size)
>  {
>  	int i;
>  
> +	if (!vendor_name || vendor_name[0] == '\0' ||
> +		(vendor_name[0] == ' ' && vendor_name[1] == '\0'))
> +			return false;

Correct align, you can use checkpatch.pl script from Linux kernel.
See CONTRIBUTING.md for some helpfull options.

> +
>  	for (i = 0; i < blocklist_size; i++) {
>  		if (strstr(blocklist[i], vendor_name) != NULL)
>  			return true;
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index b0d0b0234..51fc1d3be 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -637,9 +637,6 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>  	}
>  
>  	for_each_connected_output(display, output) {
> -		igt_require_f(!is_output_hdcp_test_exempt(output),
> -			      "Skipped as the panel is blacklisted");
> -
>  		for_each_pipe(display, pipe) {
>  			igt_display_reset(display);
>  
> @@ -652,6 +649,12 @@ test_content_protection(enum igt_commit_style commit_style, int content_type)
>  			if (!output_hdcp_capable(output, content_type))
>  				continue;
>  
> +			if (is_output_hdcp_test_exempt(output)) {
> +				igt_info("Skipping HDCP test on %s, as the panel is blocklisted\n",
> +					  output->name);

Same here, align.

Regards,
Kamil

> +				continue;
> +			}
> +
>  			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name)
>  				test_content_protection_on_output(output, pipe, commit_style, content_type);
>  
> -- 
> 2.34.1
> 
