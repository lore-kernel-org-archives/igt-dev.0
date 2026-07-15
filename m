Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D95C44508
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 20:20:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C5588DE5;
	Wed, 15 Jul 2026 20:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmwwzTeS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1A288DE5
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 20:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784146788; x=1815682788;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=GD6pbfNf/iVvravmVGOBhDOkhbeGIMFaHr0CMMMBof8=;
 b=OmwwzTeSYnDnm6VzUOdPGj+BaYLyevZT2wrsPHBDKT4MiB3zaqz8eXJU
 7a0gi5DcwP5ZESeBJmHlglJAt4T2Ilc+to2+/yIvJGTYeAhBgVszTk+HC
 hZ+zToJ0x0hSim43XqtcLdEzC2349aAqzJsPnugE+HVLzvNfLXzOFNBro
 XxTJUz8WHX3WMEl7S9kzDwlnfF+KJZrZTC2wZsh+s8OpGL44MklnKOPMu
 qjL2Z9GiBKDeVmmF0F85tftzd0u1M7fL+dadXTaDu1hT2OKQAJCmHPY9E
 +CtDxgXbmB0x5zUqvwNAiyUP0Flpipv8JI+/vZkS+18MLmzfKz4+cHxDX g==;
X-CSE-ConnectionGUID: 3Lr8cTZtT6KZItQTXNHQcg==
X-CSE-MsgGUID: 3lPaN4K9S0eul+PcsJXQfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84893328"
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="84893328"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 13:19:48 -0700
X-CSE-ConnectionGUID: ThwUsK9mT5mYVWvJGDLMWw==
X-CSE-MsgGUID: GTHrWylEQ5idYIv2qd1BFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,166,1779174000"; d="scan'208";a="259860161"
Received: from nkwan-mobl.amr.corp.intel.com (HELO [10.246.156.35])
 ([10.246.156.35])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2026 13:19:48 -0700
Message-ID: <faed1493-089b-4ecc-8ec8-69eee268dd8f@linux.intel.com>
Date: Wed, 15 Jul 2026 13:19:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] lib/igt_debugfs: Add "errno" to debug print
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 gustavo.sousa@intel.com, igt-dev@lists.freedesktop.org,
 priyanka.dandamudi@intel.com
References: <20260708225223.866079-1-ngai-mint.kwan@linux.intel.com>
 <20260713144531.ajtlp2n5nckzc7nc@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
In-Reply-To: <20260713144531.ajtlp2n5nckzc7nc@kamilkon-DESK.igk.intel.com>
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

Hi Kamil,

On 2026-07-13 07:45, Kamil Konieczny wrote:
> Hi Ngai-Mint,
> On 2026-07-08 at 15:52:12 -0700, Ngai-Mint Kwan wrote:
>> When igt_debugfs_path() fails under igt_debugfs_dir(), add "errno" to the
>> debug print for additional context of the failure.
>>
>> Signed-off-by: Ngai-Mint Kwan <ngai-mint.kwan@linux.intel.com>
>> ---
>>   lib/igt_debugfs.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/lib/igt_debugfs.c b/lib/igt_debugfs.c
>> index ed0a20773..a8c45945c 100644
>> --- a/lib/igt_debugfs.c
>> +++ b/lib/igt_debugfs.c
>> @@ -187,8 +187,12 @@ int igt_debugfs_dir(int device)
>>   	int debugfs_dir_fd;
>>   	char path[200];
>>   
>> -	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path))))
>> +	errno = 0;
>> +	if (igt_debug_on(!igt_debugfs_path(device, path, sizeof(path)))) {
>> +		igt_debug("Last errno: %i, %s\n", errno, strerror(errno));
> Problem with this is that errno should be used in place where
> the error occured, as any system function call after it occur
> can change it. imho you should add more debug prints to
> igt_debugfs_path() with errno printing there.
Agreed, but the goal of this patch is narrowly focused to improve 
debugging for
igt_debugfs_dir(). The idea is to provide a hint of the debugfs failure 
so that the
person debugging would have additional context. This also includes the 
possibility
that errno is zero and that the failure is potentially unrelated to 
system function
calls.

Regards,
Ngai-Mint Kwan
> Regards,
> Kamil
>
>> +
>>   		return -1;
>> +	}
>>   
>>   	debugfs_dir_fd = open(path, O_RDONLY);
>>   	igt_debug_on_f(debugfs_dir_fd < 0, "path: %s\n", path);
>> -- 
>> 2.43.0
>>

