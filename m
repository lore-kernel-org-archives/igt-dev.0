Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167CFCD1284
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:12:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3A610EDD2;
	Thu, 11 Apr 2024 13:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6f4ACsF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7865B10EDD2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841173; x=1744377173;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version:content-transfer-encoding;
 bh=HG6g+yR/iuV2HNAhY/hJxUInLTVMrHdu2SB+0+ypRSo=;
 b=C6f4ACsFV3iFpzBktXYuQlY7ED4DugjqUhQ6d4eTgECCR9I9+Nirk5V+
 SSNcvhzIK3KK/QDXjlNKpXotNrUPllQeQyqSx8PNXfjQH+0G/+RD7ug+t
 E2USwsOWE5fCalvkdDJk3g/tU89b+MEMeHlp1Ap0LLUGBF3MHIloEMsag
 5v7XNirn0uF0Ukr5XTKXms9Z7ml0wY9/IAb7PlYDF41ksejNruADoKC5J
 FCsl8Sv3VFTBsXoawGzkGpARlR18FAghgzDzk5h+Li3KcSFfMvfK5TO7F
 U7ul8iWKO0Nt5fJg0k/DUk6HO3kxaBUGmlANZ11u/8yr6WgGHNM2CzGWh g==;
X-CSE-ConnectionGUID: CqTIByheQsKGMqOdQZN/aw==
X-CSE-MsgGUID: p/hJEOMMRCKV9r9biVWoOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="30730075"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="30730075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:12:52 -0700
X-CSE-ConnectionGUID: sRBrIHXqTFinjYbJ1hqvig==
X-CSE-MsgGUID: SkAxeQBeRNeNFwO8/nFPcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20900660"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:12:51 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 03/13] tools/intel_vbt_decode: Allow blocks to be
 named without full decoding
In-Reply-To: <87bk6g6qde.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
 <20240322204125.17212-4-ville.syrjala@linux.intel.com>
 <87bk6g6qde.fsf@intel.com>
Date: Thu, 11 Apr 2024 16:12:47 +0300
Message-ID: <87frvs59gw.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 11 Apr 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> On Fri, 22 Mar 2024, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>
>> Make it possible to give blocks a name without having to
>> implement full decoding.
>>
>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Good idea!
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I was expecting to see a patch adding all those block names without
decoding. In the follow-up, then?

BR,
Jani.


>
>
>> ---
>>  tools/intel_vbt_decode.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
>> index b7cd2b3bfa69..1d1ba46db6e7 100644
>> --- a/tools/intel_vbt_decode.c
>> +++ b/tools/intel_vbt_decode.c
>> @@ -2672,11 +2672,10 @@ static bool dump_section(struct context *context=
, int section_id)
>>  		}
>>  	}
>>=20=20
>> -	if (dumper && dumper->name)
>> -		printf("BDB block %d (%d bytes) - %s:\n", block->id, block->size, dum=
per->name);
>> -	else
>> -		printf("BDB block %d (%d bytes) - Unknown, no decoding available:\n",
>> -		       block->id, block->size);
>> +	printf("BDB block %d (%d bytes) - %s%s:\n",
>> +	       block->id, block->size,
>> +	       dumper ? dumper->name : "Unknown",
>> +	       dumper && !dumper->dump ? ", no decoding available" : "");
>>=20=20
>>  	if (context->hexdump)
>>  		hex_dump_block(block);

--=20
Jani Nikula, Intel
