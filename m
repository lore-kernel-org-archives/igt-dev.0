Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965BFCA0EE6
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 08:49:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B44010E251;
	Fri, 15 Aug 2025 08:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="j5DxN9uX";
	dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCE910E251
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 08:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MsullaVpncsOgBrzrBchaw/lj+UnqQWXTx1lG6W4oZs=; b=j5DxN9uXe32CMH65j5wATvUAx+
 shl5cXcPf8ZGf7fJc/dP4qw5rRK7+GA9vzZzqKAJd3T11uHecoyAMRH2pZi8nloir+ZU50ttQ76R9
 4k5EQ6OEU2XDXivjBD9Kbf4AE69OkHswT8WFBbQAD7lgxV0n0EpU6Wcu3onSSoKf7Q8h7y+ERrOjW
 RkURR+fy4Q+pZZwD1BtW3BQDybjr1QZ4k6Jz1Uz4b7TujapKfhXK31gAryfzUCxKZWpk+qw+pzSRx
 Wgs28zexBOIXyEPrTIF/4vTl8kJ9BtFAe2Sgae0lkkA+m5zkFVQagmdLQ8evbZxihbBVJ8Lk5/2b/
 TWMBoYZQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1umq82-00EXrC-49; Fri, 15 Aug 2025 10:49:38 +0200
Message-ID: <36b3a4ad-40e0-4941-ba9f-3c391ebac4fe@igalia.com>
Date: Fri, 15 Aug 2025 09:49:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] lib/intel/veboxcopy: Respect buffer MOCS index
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>,
 =?UTF-8?Q?Juha-Pekka_Heikkil=C3=A4?= <juha-pekka.heikkila@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
References: <20250722073906.99759-1-tvrtko.ursulin@igalia.com>
 <t3zwmxdcdavanvt2u3spd4zcdeyktym2mvfvow3tph2pni455a@mynl6lwvyy3p>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <t3zwmxdcdavanvt2u3spd4zcdeyktym2mvfvow3tph2pni455a@mynl6lwvyy3p>
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


On 14/08/2025 05:48, Zbigniew Kempczyński wrote:
> On Tue, Jul 22, 2025 at 08:39:06AM +0100, Tvrtko Ursulin wrote:
>> Set the MOCS indices in surface state from the source and
>> destination buffers. So far it was done only for the input
>> buffer and only for 4Tile formats. Always setting it alings
>> with how rendercopy does it and it fixes the AuxCCS tests on
>> ADL when target is of the MC flavour.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Imre Deak <imre.deak@intel.com>
>> Cc: Juha-Pekka Heikkilä <juha-pekka.heikkila@intel.com>
>> Cc: Mika Kahola <mika.kahola@intel.com>
>> ---
>> Lets see what the CI will think of this change.
>>
>> Curiously the AuxCCS tests where target is RC, so rendercopy
>> which does set the MOCS correctly is used, are still flaky so
>> that sounds like a different problem.
>> ---
>>   lib/veboxcopy_gen12.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
>> index 4e3aefaf1f44..2193433a1c00 100644
>> --- a/lib/veboxcopy_gen12.c
>> +++ b/lib/veboxcopy_gen12.c
>> @@ -258,6 +258,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>>   
>>   	if (HAS_4TILE(ibb->devid))
>>   		tc->tc1_2.input_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
>> +	else
>> +		tc->tc1_2.input_mocs_idx = src->mocs_index;
>>   
>>   	tc->tc1_2.input_tiled_resource_mode = src->tiling == I915_TILING_Yf;
>>   
>> @@ -278,6 +280,8 @@ static void emit_tiling_convert_cmd(struct intel_bb *ibb,
>>   			dst->compression == I915_COMPRESSION_RENDER;
>>   	}
>>   
>> +	tc->tc3_4.output_mocs_idx = dst->mocs_index;
>> +
>>   	if (HAS_4TILE(ibb->devid))
>>   		tc->tc3_4.output_mocs_idx = IS_DG2(ibb->devid) ? 3 : 9;
>>   
>> -- 
>> 2.48.0
>>
> 
> According how intel_buf selects uc mocs index in the initialization
> part (for DEFAULT_MOCS_INDEX) it looks good to me.
> 
> Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Thank you!

I have pushed it so I can respin the AuxCCS xe series and fingers 
crossed get some green results.

Regards,

Tvrtko

