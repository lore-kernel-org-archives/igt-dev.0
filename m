Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE95C61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 21:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4BF10E03F;
	Wed,  2 Sep 2026 21:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzCH2kuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EFA810E03F
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 21:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788385269; x=1819921269;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5kHJ+6RR1uZ/XfNrdMjNmK5AI7Ig2wivdFA0Lq2YtVY=;
 b=PzCH2kuQH7W+0l8GF9/WawVSF9FdWUZrcfaNcqDqk/PrmCHdvp9ZIHrY
 qpInHDgsmJ+dFZIa5JSZVceGT35CnFMlU1HAOupdMMMEkgd1AkhAYOcY+
 e8ltzixqx0lrBTf+PvsNniV4dGnbkLRuRSFYXaNTwbIj5rCt2tkwBDNMT
 YizZqJvXViN/B8A3xhNGScdOH5YvzYXHr8AiLIybn3pqBCv4ybpoWU7wK
 qrusj2iZuueb596aeiX1R7M5rE8xT8z4BRLUFCzZD4BsaTEfMIWA26Y+D
 Sx15J1h91BHjmfB2jYVSqOwwrAPEMcxI8pNLerLepuMPWCJG7bRcfdhoP w==;
X-CSE-ConnectionGUID: mGezVIyJTOyquIUekFCHXw==
X-CSE-MsgGUID: 4oKI6mMUTXe11PnUhRnPOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="106222830"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="106222830"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 14:40:59 -0700
X-CSE-ConnectionGUID: 5F8+rxC2Qv6XHXpsVHyhYg==
X-CSE-MsgGUID: l0Bm9uWbSWaQ+vAY2GG88A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; d="scan'208";a="299401870"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.236])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2026 14:40:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, ville.syrjala@linux.intel.com, Karthik
 B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 2/4] tests/intel/kms_joiner_helper: iterate CRTCs
 instead of pipes
In-Reply-To: <20260902144516.2zpativ7ii32zsdv@kamilkon-DESK.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <cover.1788252273.git.jani.nikula@intel.com>
 <a9a1b7c524e682ec6e1a8a7dd12534f661ac598a.1788252273.git.jani.nikula@intel.com>
 <20260902144516.2zpativ7ii32zsdv@kamilkon-DESK.igk.intel.com>
Date: Thu, 03 Sep 2026 00:40:54 +0300
Message-ID: <0b75f984893404cd108db3e21001242e7e107d64@intel.com>
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

On Wed, 02 Sep 2026, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Jani,
> On 2026-09-01 at 11:46:38 +0300, Jani Nikula wrote:
>> Reduce the direct pipe usage.
>> 
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  tests/intel/kms_joiner_helper.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>> 
>> diff --git a/tests/intel/kms_joiner_helper.c b/tests/intel/kms_joiner_helper.c
>> index da0ac7f624f3..5bacf6cb9e27 100644
>> --- a/tests/intel/kms_joiner_helper.c
>> +++ b/tests/intel/kms_joiner_helper.c
>> @@ -101,13 +101,14 @@ static enum pipe get_next_master_pipe(uint32_t pipe_mask)
>>   */
>>  void igt_set_all_master_pipes_for_platform(igt_display_t *display, uint32_t *master_pipes)
>>  {
>> -	enum pipe pipe;
>> +	igt_crtc_t *crtc;
>>  
>>  	*master_pipes = 0;
>> -	for (pipe = PIPE_A; pipe < IGT_MAX_PIPES - 1; pipe++) {
>> -		if (igt_crtc_for_pipe(display, pipe) && igt_crtc_for_pipe(display, pipe + 1)) {
>> -			*master_pipes |= BIT(pipe);
>> -			igt_info("Found master pipe %s\n", kmstest_pipe_name(pipe));
>> +
>> +	for_each_crtc(display, crtc) {
>> +		if (igt_crtc_for_pipe(display, crtc->pipe + 1)) {
>
> I am not sure here as this is not 1:1, original code has two
> conditions. +cc Swati and Karthik.

The original had igt_crtc_for_pipe(display, pipe) to ensure there's a
valid CRTC for that pipe, but for_each_crtc() iterates valid CRTCs
only. Only need to check pipe + 1.

BR,
Jani.

>
>
> Regards,
> Kamil
>
>> +			*master_pipes |= BIT(crtc->pipe);
>> +			igt_info("Found master pipe %s\n", igt_crtc_name(crtc));
>>  		}
>>  	}
>>  }
>> -- 
>> 2.47.3
>> 

-- 
Jani Nikula, Intel
