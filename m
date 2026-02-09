Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEF9E7E0BE
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 10:13:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8254788F78;
	Mon,  9 Feb 2026 10:13:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m64NkI2p";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF36888F78
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 10:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770631988; x=1802167988;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=I0eltcBC+TCxp4xInw0r/OmYrXEDJx/MAyjvzx+Sszc=;
 b=m64NkI2pnlnHU85L4PmVNywNmBA3yvzAnrqQxx2BETnL6zOQwr/7I1on
 fFHKhVXHE9ZJOTyaTsz2O5taOuzG1yW0DFnMFD8Xy5zh70dDvYSm6T9ER
 5pf9vMGWlcQbTlaj03b5OnMB4IMcjgxizEEIPa+POhUNnFWIZCQZ/kWQz
 cu04QcYZNZbEdVMZlyd6kKAShh0Vc4xfZQ04uK7KsTiRfqabWQmC/HEX4
 n9d1iRaAZjUXs8xcgUIm1yzEntkhqC3bWLJYsclInVfh8GFU7OkJXUQP8
 wRO4rR4Zx0grtbt2bpjPZCM60Ddqc6pEfMylVzPkoGEa0lqwYyhzE/kDh w==;
X-CSE-ConnectionGUID: iy0WCFeJRLOVnJW4k1FolQ==
X-CSE-MsgGUID: yUhMA9okTAus8POUdvGa5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="70946590"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; d="scan'208";a="70946590"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:13:08 -0800
X-CSE-ConnectionGUID: LUPegeciT4yMN22czu0w6A==
X-CSE-MsgGUID: 705cV+YiS2qC0SpGuecdZQ==
X-ExtLoop1: 1
Received: from jthakur-mobl.gar.corp.intel.com (HELO [10.247.183.166])
 ([10.247.183.166])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2026 02:13:06 -0800
Message-ID: <b4fe08d4-9655-4138-9aa3-dddccab1c4d3@intel.com>
Date: Mon, 9 Feb 2026 15:42:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t, v1] tests/kms_content_protection: Fix MST outputs assigned
 to same pipe
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, mohammed.thasleem@intel.com
References: <20260209080028.1464575-1-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20260209080028.1464575-1-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hello Santhosh,

On 09-02-2026 13:30, Santhosh Reddy Guddati wrote:
> dp-mst subtests fails with both are both outputs trying to use pipe A.
Fix commit subject,
> The test finds a free CRTC and this CRTC is not being used and instead
> uses a hard coded pipe with igt_output_set_crtc.
>
> Fix by using the found CRTC directly and remove unused pipe variable.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Add fixes tag if  it's fixing a commit.

Thanks and Regards
Kunal Joshi
> ---
>   tests/kms_content_protection.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 40f9c418d..d2bbea351 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -867,15 +867,12 @@ test_content_protection_mst(int content_type)
>   	igt_output_t *output;
>   	int valid_outputs = 0, dp_mst_outputs = 0, ret, count, max_pipe = 0, i;
>   	igt_crtc_t *crtc;
> -	enum pipe pipe;
>   	bool pipe_found;
>   	igt_output_t *hdcp_mst_output[IGT_MAX_PIPES];
>   
>   	for_each_crtc(display, crtc)
>   		max_pipe++;
>   
> -	pipe = PIPE_A;
> -
>   	for_each_connected_output(display, output) {
>   		if (!output_is_dp_mst(output, dp_mst_outputs))
>   			continue;
> @@ -891,8 +888,7 @@ test_content_protection_mst(int content_type)
>   
>   		igt_assert_f(pipe_found, "No valid pipe found for %s\n", output->name);
>   
> -		igt_output_set_crtc(output,
> -				    igt_crtc_for_pipe(output->display, pipe));
> +		igt_output_set_crtc(output, crtc);
>   		prepare_modeset_on_mst_output(output, false);
>   		dp_mst_outputs++;
>   		if (output_hdcp_capable(output, content_type))
