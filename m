Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D58CAC5BB
	for <igt-dev@archiver.kernel.org>; Wed,  1 Oct 2025 17:50:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56BA889137;
	Wed,  1 Oct 2025 17:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U2enbPuS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DD7889137
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Oct 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759341006; x=1790877006;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+kZQCQCjAE5DpV2bQbj7fhu8RerhErsGrFGKd5NZIP8=;
 b=U2enbPuSNR8sGRa7B+vlIcMBZGTSUUvkdsrneNjwYhgm9FSGr2Zq/hnG
 iE+bN3O8PC5dtt9+35lzAOAg2t3/ml+cwTx/UYTjxN2lN5EcOolLUPoM1
 NH8t0DxlysKXSQODIlPqJvcX3vyNwaSXFo/cvpMGqylFXrTd8kmvTmMvB
 ofU2iTWX2b90GKGKfyGmoncX7UAPbtEXhoQ+qiq4zzDsj2Gx4GDZNCFqG
 tELY0nvQAP329MXAvvNHRz42GLYt/8rHRWgqbotgJ+CTRY5E45UO8AXJ6
 OkT03BWjhWxMwwgjyFuPrGbwTNWnr5C4ltCDPLMgNMgctX+ZriAhuWT1c A==;
X-CSE-ConnectionGUID: ikV0HaUeR3y9AFbkz0TaKQ==
X-CSE-MsgGUID: 6cGilkSoQP+E2dZj7e+SGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65445818"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65445818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 10:50:05 -0700
X-CSE-ConnectionGUID: RLD7+8SYQ4qZ5mepMC55rA==
X-CSE-MsgGUID: onef4PzNROmj2mTyLSdyvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="177962392"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO [10.245.246.232])
 ([10.245.246.232])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 10:50:04 -0700
Message-ID: <ddb7f247-9bc0-485d-9c5f-89bae340eee4@intel.com>
Date: Wed, 1 Oct 2025 19:50:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 i-g-t 01/10] lib/xe_eudebug: Fix safe_pipe_read
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
References: <20251001115447.11843-1-dominik.karol.piatkowski@intel.com>
 <20251001115447.11843-2-dominik.karol.piatkowski@intel.com>
 <nfbsoyylux5qyvteu7xcuiwteamx2zjry4x6fiyj4u6ve2ghke@yzttaaj55nc3>
Content-Language: en-US
From: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <nfbsoyylux5qyvteu7xcuiwteamx2zjry4x6fiyj4u6ve2ghke@yzttaaj55nc3>
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

Hi,

On 1.10.2025 14:04, Zbigniew Kempczyński wrote:
> On Wed, Oct 01, 2025 at 01:54:38PM +0200, Dominik Karol Piątkowski wrote:
>> In case of poll() failure, safe_pipe_read returns -ETIMEDOUT that can be
>> misleading, as the underlying error may be different. Do an early return
>> with -errno if the poll fails, unless errno is set to EINTR - repeat the
>> poll in this case.

That makes sense however...

>>
> 
> LGTM, but for being sure let's wait for CI.
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> 
> --
> Zbigniew
> 
>> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
>> ---
>>   lib/xe/xe_eudebug.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/xe/xe_eudebug.c b/lib/xe/xe_eudebug.c
>> index 667c31c6e..840b501c5 100644
>> --- a/lib/xe/xe_eudebug.c
>> +++ b/lib/xe/xe_eudebug.c
>> @@ -271,6 +271,10 @@ static int safe_pipe_read(int pipe[2], void *buf, int nbytes, int timeout_ms)
>>   		if (!ret) {
>>   			catch_child_failure();
>>   			t += interval_ms;
>> +		} else if (ret == -1) {
>> +			if (errno == EINTR)
>> +				continue;

...this won't poll again for EINTR because ret == -1 so !ret is false 
and we exit the loop.

Regards,
Christoph
>> +			return -errno;
>>   		}
>>   	} while (!ret && t < timeout_ms);
>>   
>> -- 
>> 2.34.1
>>

