Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64372D35162
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 11:58:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1328010F0AF;
	Wed,  1 Apr 2026 11:58:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlUv/fxH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B8E210F0AF
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 11:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775044689; x=1806580689;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=e1PyXQU0v2FSEOIazw6pMnOB6t2gvO6g3r57WC0apBE=;
 b=RlUv/fxH8QJXVC8Nb8knHeKLpg2wOvYq7roi2ACUwOKvx28FtzbRldTl
 bzJTg+Kyrtm3FGBwknhpAFVK2U0onJXh1u8E+YJUyNFSXI7I7pYd3wTcb
 CGLj72nRrlGRGm8P7+5lnUsiL3OU7zdsEEd26Qm0K9eGQERsLSBavCUOv
 ofMis09JzeCEWTv+DISiPrcnBG883XnuqliyJ6CVLrIcB3J4A5jjGScro
 Mk8bDh6AGKjMXSqKDbUBZT3f1oCiSCyaIGJN9uAcqND98HmkKHu5fmp94
 zzNqJvi3myfi7m67V/+WWkIUlSwS4owpEnL3YBbLAprl2/fMr1nXsgYcu w==;
X-CSE-ConnectionGUID: IZYYne9zQXKaJHorAgK1Vg==
X-CSE-MsgGUID: 3ddlVbP1QECM/hfc4jaowg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="79965214"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="79965214"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:58:09 -0700
X-CSE-ConnectionGUID: mn1KWxkFR2C0e6sUG7LTUw==
X-CSE-MsgGUID: v/BYECqSQQKZ0IfCvqC/xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="223367591"
Received: from pravik2x-mobl.gar.corp.intel.com (HELO [10.247.196.34])
 ([10.247.196.34])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 04:58:08 -0700
Message-ID: <6910a1ea-6edd-4738-89eb-36ff25aa8a15@intel.com>
Date: Wed, 1 Apr 2026 17:27:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] lib/igt_kms: Fix max_non_joiner_mode_found
To: Jani Nikula <jani.nikula@intel.com>, igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260401115542.1074290-1-kunal1.joshi@intel.com>
 <20260401115542.1074290-4-kunal1.joshi@intel.com>
 <be0e25ff0c1c0af619c3e774dba96d137fb6b200@intel.com>
Content-Language: en-US
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <be0e25ff0c1c0af619c3e774dba96d137fb6b200@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hello Jani,

On 01-04-2026 17:14, Jani Nikula wrote:
> On Wed, 01 Apr 2026, Kunal Joshi <kunal1.joshi@intel.com> wrote:
>> Previously the function, instead of giving the highest possible mode the
>> connector could support, started the check by looking if the mode was
>> equal to max_pipe_hdisplay. There may be corner cases where a connector never supports the highest mode our source can
>> drive (e.g. a 4K mode on a 5K-capable platform).
>>
>> Fix this by iterating all modes and tracking the best one (highest
>> hdisplay, then highest clock as a tiebreaker) that does not require a
>> big joiner, as determined by igt_bigjoiner_possible(). This correctly
>> handles connectors with any max resolution.
> I'm not requesting changes right now, but I keep wondering about having
> the joiner code in igt_kms.[ch] at all. It's an Intel implementation
> detail. Why is so much of that in the generic file instead of hidden in
> some Intel specific file or directory?
>
> BR,
> Jani.
Yeah right,
We actually have a helper for joiner related function (kms_joiner_helper),
Do you think that this approach makes sense to have feature helpers?

Thanks and Regards
Kunal Joshi
>
>
>> v2: Reword commit message (Suraj)
>>
>> Fixes: 3830ca6a5068 ("lib/igt_kms: Add support to check joiner mode limit")
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   lib/igt_kms.c | 17 +++++++++++------
>>   1 file changed, 11 insertions(+), 6 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index 04b1f3972..dbd419a9b 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6979,21 +6979,26 @@ bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>    * false otherwise.
>>    */
>>   bool max_non_joiner_mode_found(int drm_fd, drmModeConnector *connector,
>> -			   int max_dotclock, drmModeModeInfo *mode)
>> +			       int max_dotclock, drmModeModeInfo *mode)
>>   {
>> -	int max_hdisplay = get_max_pipe_hdisplay(drm_fd);
>> +	bool found = false;
>>   
>>   	for (int i = 0; i < connector->count_modes; i++) {
>>   		drmModeModeInfo *current_mode = &connector->modes[i];
>>   
>> -		if (current_mode->hdisplay == max_hdisplay &&
>> -		    current_mode->clock < max_dotclock) {
>> +		if (igt_bigjoiner_possible(drm_fd, current_mode, max_dotclock))
>> +			continue;
>> +
>> +		if (!found ||
>> +		    current_mode->hdisplay > mode->hdisplay ||
>> +		    (current_mode->hdisplay == mode->hdisplay &&
>> +		     current_mode->clock > mode->clock)) {
>>   			*mode = *current_mode;
>> -			return true;
>> +			found = true;
>>   		}
>>   	}
>>   
>> -	return false;
>> +	return found;
>>   }
>>   
>>   /* TODO: Move these lib functions to the joiner-specific library file
