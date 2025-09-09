Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CC1CAC587
	for <igt-dev@archiver.kernel.org>; Tue,  9 Sep 2025 09:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D35CF10E349;
	Tue,  9 Sep 2025 09:23:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B5V2DYY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E728D10E349
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Sep 2025 09:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757409784; x=1788945784;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YNPvkFUxdOBzzwfaq4yPCdO1RBBz5AbkL2JEbeI8kpQ=;
 b=B5V2DYY8unIIgN4DKD6fwdKue1FevoYAVhL0/1nM0miQ6+Vhcb3J3G2Q
 dicpQkcJOW1cI0B+gIr5LwXQgMsaWy6ZduL7VgrJsch8lV47/Mmd7P80F
 8AD6lE4awMdelR0BNZSsrE+H+NeQyb8S6t0hKpWezwKI55+uj0yIXxtVT
 n4jNSBzaDRE5AYeI63E/yizq9zsfYx7rZWo4dRLFe1N4OyryRP0FYVaaQ
 CE/34lmvHA1mCkR3P6jsYqKI1laofoVcSkFjJyt5mL2oUnGF6/cdmpphI
 TP1dLHjPwS5VE9A2pgFJf/DCL4Wn1szgXOlzKKg/ArtmGy7EVZDhCAB1d w==;
X-CSE-ConnectionGUID: 1oB9q/cdSKmjPsRLxswvww==
X-CSE-MsgGUID: dGlxneDUTGu5/o90pxKpag==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85134556"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="85134556"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:23:03 -0700
X-CSE-ConnectionGUID: NYcBNogQTwS5QIC37/3idA==
X-CSE-MsgGUID: i4GVFtmgQHm2rSle01Wgzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172952291"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO [10.245.244.145])
 ([10.245.244.145])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:23:03 -0700
Message-ID: <08b08315-ebc5-4e1e-8f73-e22e9ed24684@intel.com>
Date: Tue, 9 Sep 2025 10:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_ccs: stop using l3 enabled PAT index
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
References: <20250908182045.66769-2-matthew.auld@intel.com>
 <obup452b5kpktfxhgadbzrcviy3mtlq6tpttzluz2ztmnkurfn@5o6xnpf7iiml>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <obup452b5kpktfxhgadbzrcviy3mtlq6tpttzluz2ztmnkurfn@5o6xnpf7iiml>
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

On 09/09/2025 08:23, Zbigniew Kempczyński wrote:
> On Mon, Sep 08, 2025 at 07:20:46PM +0100, Matthew Auld wrote:
>> When populating the fb using an l3 compression enabled PAT index some or
>> all of the data may end up cached. However the HW looks to only perform
>> the compression step in this case upon evicting those entries, when also
>> trying to write them back to VRAM. This seems to be the cause of this
>> test randomly failing on BMG with the CCS state appearing to sometimes
>> be zeroed even after doing a compression enabled copy. From
>> experimentation adding a sleep before the surface copy cures the
>> failure, which fits since this will give plenty of time to enter rc6
>> which will indirectly also nuke the l3.  Grabbing a forcewake around the
>> sleep brings back the failure which also makes sense since this will
>> inhibit the flush and also rules out missing synchronisation hidden by
>> the sleep. Using a large fb also cures the issue, which also fits since
>> the fb will now be larger than the entire l3, so some data will have to
>> be compressed when evicted.
>>
>> To fix this don't use an l3 enabled PAT index prior to taking a snapshot
>> of the raw CCS state. Probably this also means the test is maybe too
>> much looking at implementation details, by assuming that zeroed CCS
>> state must also imply that there is no compression, even if compression
>> is merely delayed until the data is evicted.
> 
> Display is reading directly from vram, so IIUC at moment of scanout
> to properly decompress fb it should have an access to flushed surface

Right, it might be that some modes allow scanout with compression so it 
might also be able to read CCS, so no need to decompress, but not 
completely sure.

> and its CCS data, am I right? Blit to WT surface with delayed flush of
> CCS data creates such race - WT surface is flushed, but CCS is not.

I don't think it's a delayed flush of CCS, but rather the compressor 
stage is delayed until actually writing data to VRAM. At the point of 
writing to VRAM I guess the compressor makes the decision on whether to 
write to CSS or VRAM, depending on whether stuff is compressible? So if 
you peek at the CCS state too early you might not see it in some cases. 
I think that makes sense?

Also I'm not sure if the WT thing actually works as expected, since the 
WT seems to only apply to l4, and not l3, according to BSpec, but AFAIK 
there is no l4 on BMG. So I think index 15 and 11 are perhaps the same 
on BMG?

> What causes access_flat_ccs_surface() called before cache flush is a
> problem and there's no problem with scanout? For me access (regardless
> surf-copy or scanout) looks similar, only timing may vary.

Right, display is not coherent (goes directly to VRAM) so you can't use 
standard l3 caching, but you can use l3:xd, which is the transient 
display version, and those special cache entries will be flushed by KMD 
when doing the display flip, so before the scanout happens. And 
flushing/evicting looks to trigger compression as needed, if cached.

So for scanout there is an existing transient flush to handle l3:xd, but 
for access_flat_ccs_surface(), there is no guaranteed flush anywhere, 
unless you get "lucky" with rc6, or the fb is somehow larger than the 
l2, in which you should be guaranteed to see at least some compression, 
since something will have to get evicted.

> 
> I don't understand why WT in this case causes delayed CCS flush,
> where UC_COMP is not. Does UC_COMP applies to CCS data as well?
> 
> --
> Zbigniew
> 
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5941
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5376
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
>> ---
>>   tests/intel/kms_ccs.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>> index cb0c80f03..ab081aa75 100644
>> --- a/tests/intel/kms_ccs.c
>> +++ b/tests/intel/kms_ccs.c
>> @@ -812,7 +812,7 @@ static struct igt_fb *get_fb(data_t *data, u64 modifier, double r, double g,
>>   		fb = get_fb(data, modifier, r, g, b, width, height,
>>   			    data->format);
>>   
>> -		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_wt(fb->fd));
>> +		igt_xe2_blit_with_dst_pat(fb, temp_fb, intel_get_pat_idx_uc_comp(fb->fd));
>>   		access_flat_ccs_surface(fb, true);
>>   		return fb;
>>   
>> -- 
>> 2.51.0
>>

