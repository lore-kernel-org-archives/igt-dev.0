Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5747C47DDC
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 08:38:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF4710E964;
	Wed, 24 Jan 2024 08:38:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC75C10E964
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 08:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706085482; x=1737621482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yNNMcpcXwAd9c07EGTU3VkWldO07LHGFaWS8Xj6F6wc=;
 b=GJamqThspfT/3RggAFgGl1rXhuw8ycz/qPetJ3rt+B8Hqt5lOa9oi/PX
 /q6df493V04qhNv4HtEwnJ/c13vYr36fwbfgCGdL3xH7pxwkFA9GqVxLt
 TKR780GqxDqherYuhUfWbXjnFri9QW8hLmznEF6MerbveJsKDOtgV6mMF
 DUSk423ct1g4dimKrL9WJIhTiHjHyNlVxh6iNQ0n/6D8flsf/aHqWv3RF
 Ip3hlGlaqQN+2k4W7clwJuQ0NNuywr3Ilfic7COOcBRA+7A9pcH4hCpu/
 iTLqvNKznpstgzkYgkEIHgbhgvoyyu0Zc9RYOdoGN6c5avBfAsp/9xsWm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15302835"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="15302835"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 00:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820383499"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="820383499"
Received: from gmcfarla-mobl1.ger.corp.intel.com (HELO [10.252.15.165])
 ([10.252.15.165])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 00:37:58 -0800
Message-ID: <9ff41e6a-de8b-48c6-b341-e665423b9cf2@intel.com>
Date: Wed, 24 Jan 2024 08:37:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/intel_blt: use BYTE_COPY mode on xe2
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
References: <20240123183323.173424-1-matthew.auld@intel.com>
 <20240123183323.173424-2-matthew.auld@intel.com>
 <20240124045608.5cph37f2evqkdsl2@zkempczy-mobl2>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240124045608.5cph37f2evqkdsl2@zkempczy-mobl2>
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
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On 24/01/2024 04:56, Zbigniew Kempczyński wrote:
> On Tue, Jan 23, 2024 at 06:33:23PM +0000, Matthew Auld wrote:
>> Currently we see various CAT errors and timeouts on xe2 when running
>> xe_copy_basic. If selecting PAGE_COPY mode for MEM_COPY, the page size
>> is defined as 256B block as xe2. Also the width should be defined in
>> number of pages, and not bytes, which likely explains the CAT errors.
>> However the caller in xe_copy_basic is not using a size that is aligned
>> to 256B, so rather just select the more general BYTE_COPY mode instead,
>> which should work for any reasonable number of bytes.
>>
>> BSpec: 57561
>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
>> ---
>>   lib/intel_blt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index e41e261ea..25d251c4f 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -1613,7 +1613,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
>>   	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
>>   
>>   	i = 0;
>> -	batch[i++] = MEM_COPY_CMD | (1 << 19) | optype;
>> +	batch[i++] = MEM_COPY_CMD | optype;
>>   	batch[i++] = mem->src.width - 1;
>>   	batch[i++] = mem->src.height - 1;
>>   	batch[i++] = mem->src.pitch - 1;
>> -- 
>> 2.43.0
>>
> 
> +Sai
> 
> At first glance I don't like removing (1 << 19). For M_MATRIX
> we require BYTE_COPY. I'm not sure Sai is working on such tests
> but we discussed offline sometime I would like to have such
> tests here.

This patch is enabling BYTE_COPY mode. Setting bit 19 turns on the 
PAGE_COPY mode.  Matrix Copy looks to require BYTE_COPY. Also there 
doesn't seem to be a bit 19 on PVC, it seems to only support byte copy.

> 
> --
> Zbigniew
