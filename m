Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44316CD98E4
	for <igt-dev@archiver.kernel.org>; Wed, 17 Jun 2026 10:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECF5E10EFA8;
	Wed, 17 Jun 2026 10:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqBGzvS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A82E10EFA8
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Jun 2026 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781693619; x=1813229619;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=XrrtChOnTYUHmZXDOgbvbmQqL4aYCo6fvP3auvJW7Eg=;
 b=eqBGzvS1d/J73ZWNMJ5Du91E2MNFoc+GBhua94E3SoKYkaN9cs7r4DrK
 AlgOlnefdGzFfaS3KSJ399rqNxST53mHwrukoh2VclVD87we/muX6z2gt
 ofgRC1vwEJO3ueyploPqjYxKXPqrPOGa28Qt6PhsOs0hdVsSLmrNqjy0D
 n8nTV8JuzE0mrqFEhB+UN7mXc7odeMr4LjHJKCMd62BI9ZvNqnBF1pXCD
 2hu2ux+7eN2jOt8PssPwR47ZzxouVab5mZwuiB8jYgKgpLNtaorPo0upX
 vQlxdDlZHMR12nbdu7azQTol8q2c0x87CmUWUw1uW1M8ElzAga4gtT6Fs A==;
X-CSE-ConnectionGUID: dTPEFceFRayrAuBR5/2SIg==
X-CSE-MsgGUID: LA7u7TX6Qp64Ig8exXex4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82573578"
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="82573578"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:53:38 -0700
X-CSE-ConnectionGUID: TmDADnvyRpueEmNI28fFKg==
X-CSE-MsgGUID: EktzetFCR+209yuvwEMH/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,209,1774335600"; d="scan'208";a="272098909"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.158])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2026 03:53:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Karthik B S <karthik.b.s@intel.com>, igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 2/3] lib/kms: fix last pipe check in
 igt_check_bigjoiner_support()
In-Reply-To: <a6015949-ee58-4b7d-bc71-d4b5cf175d12@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260616090610.2106378-1-jani.nikula@intel.com>
 <20260616090610.2106378-2-jani.nikula@intel.com>
 <a6015949-ee58-4b7d-bc71-d4b5cf175d12@intel.com>
Date: Wed, 17 Jun 2026 13:53:34 +0300
Message-ID: <a774811b46ca923a4b52e25443514f0b1d8748ae@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 17 Jun 2026, Karthik B S <karthik.b.s@intel.com> wrote:
> On 6/16/2026 2:36 PM, Jani Nikula wrote:
>> Fix last pipe check for non-consecutive pipes. In theory the check could
>> be too restrictive for fused off pipes, but it's unlikely we've hit the
>> issue in practise. It's better to be pedantically correct here though.
> Typo: practise -> practice

Thanks for the review, pushed the lot with the typo fixed.

BR,
Jani.


>>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> Reviewed-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c | 13 ++++++++-----
>>   1 file changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index c289d76d16e2..e82d32130666 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7344,9 +7344,10 @@ bool igt_check_force_joiner_status(int drmfd, char *connector_name)
>>    */
>>   bool igt_check_bigjoiner_support(igt_display_t *display)
>>   {
>> -	uint8_t i, total_pipes = 0, pipes_in_use = 0;
>> +	uint8_t i, pipes_in_use = 0;
>>   	igt_crtc_t *crtc;
>>   	igt_output_t *output;
>> +	enum pipe last_pipe = PIPE_NONE;
>>   	struct {
>>   		enum pipe idx;
>>   		drmModeModeInfo *mode;
>> @@ -7355,9 +7356,11 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>   	} pipes[IGT_MAX_PIPES];
>>   	int max_dotclock;
>>   
>> -	/* Get total enabled pipes. */
>> -	for_each_crtc(display, crtc)
>> -		total_pipes++;
>> +	/* Get last pipe */
>> +	for_each_crtc(display, crtc) {
>> +		if (crtc->pipe > last_pipe)
>> +			last_pipe = crtc->pipe;
>> +	}
>>   
>>   	/*
>>   	 * Get list of CRTCs in use those were set by igt_output_set_crtc()
>> @@ -7401,7 +7404,7 @@ bool igt_check_bigjoiner_support(igt_display_t *display)
>>   				 max_dotclock, pipes[i].force_joiner ? "Yes" : "No");
>>   			kmstest_dump_mode(pipes[i].mode);
>>   
>> -			if (pipes[i].idx >= (total_pipes - 1)) {
>> +			if (pipes[i].idx >= last_pipe) {
>>   				igt_info("pipe-%s: Last pipe couldn't be used as a Bigjoiner Primary.\n",
>>   					 kmstest_pipe_name(pipes[i].idx));
>>   				return false;

-- 
Jani Nikula, Intel
