Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2806FC982DA
	for <igt-dev@archiver.kernel.org>; Fri, 18 Sep 2026 10:09:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B2810F2CC;
	Fri, 18 Sep 2026 10:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E11sn8yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5250010F2CB
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Sep 2026 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789726148; x=1821262148;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=nC5cHGCdt7f9Rp0TrTxd1x8Q/ZeAYP/+nnzy+Xfv64A=;
 b=E11sn8yhZ1ST5cBTveR5Zw+gXjyYCbko65Gfw/jUsbB3naVYZQwP7dra
 Juwl1BGsaaZbF8rf5f9tOt0SWkyhSJoU4RJHI07wgrQ++Zvl41rwaRM4k
 Q+oM/Y52zD+faLeljO5RYuHevRC7SuOoYpoFtckWxXnVMYmZmudK9LXf3
 oHB29OF34aXtFtmZ3U4d95m6dRodnf9NPF4CqG5oYTRXoCb+6sz1hfaoL
 FcrRkVkXCl4Whv6fSu6DP9JZw+JbUxdMID0b++gUUJUCY/fXaxx4bFg2O
 zlWQygKLjPmtvetDRW2Iz1BnPkriGNZbNPnH67gij4paCdY3t7ceAoQYK Q==;
X-CSE-ConnectionGUID: 04S9OsudROW9PRrhmwjxOQ==
X-CSE-MsgGUID: RSMugWpUR6Si4MFE1efc5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="92730640"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="92730640"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:09:08 -0700
X-CSE-ConnectionGUID: GPTeP6u8Sw6M5ugVbEzErw==
X-CSE-MsgGUID: II0CYqnqTie2JS7TaAhl+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="297800818"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO [10.245.245.205])
 ([10.245.245.205])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 03:09:07 -0700
Message-ID: <72eea6f1-69a5-4ca1-b2cc-dfea19858cbd@linux.intel.com>
Date: Fri, 18 Sep 2026 12:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t, v5 3/3] tests/kms_atomic: skip BACKGROUND_COLOR in
 CRTC state checks
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20260917191835.977425-1-swati2.sharma@intel.com>
 <20260917191835.977425-4-swati2.sharma@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <20260917191835.977425-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hey,

On 9/17/26 21:18, Swati Sharma wrote:
> BACKGROUND_COLOR is initialized to opaque black, while the generic CRTC
> state snapshot does not read it back. Comparing the property causes
> atomic tests to fail during setup. Exclude it from the generic state
> comparison while keeping the valid opaque default.
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>  tests/kms_atomic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> index ce5b00cd3..09b7915af 100644
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -218,7 +218,8 @@ static void plane_commit_atomic_err(igt_plane_t *plane,
>  
>  static bool crtc_filter(enum igt_atomic_crtc_properties prop)
>  {
> -	if (prop == IGT_CRTC_MODE_ID || prop == IGT_CRTC_ACTIVE)
> +	if (prop == IGT_CRTC_MODE_ID || prop == IGT_CRTC_ACTIVE ||
> +	    prop == IGT_CRTC_BACKGROUND_COLOR)
>  		return false;
>  
>  	return true;

Seems reasonable.

If this happens again in the future, we should switch the test from a denylist to an allowlist.

Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
