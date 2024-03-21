Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB61C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 15:27:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D6B710E6A1;
	Thu, 21 Mar 2024 15:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="l98A1JHh";
	dkim-atps=neutral
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9136910E6A1
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 15:27:33 +0000 (UTC)
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4V0q8N4RTDz9sj3;
 Thu, 21 Mar 2024 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1711034852; bh=jW/OaxQ2SZ9lIWNwpDvkvAjShkZSXFf6cbt/+pG+3Mc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=l98A1JHhf5DMpxU4z6dRYcOUQz0vBtM06S4PC3497aw9YBLWAeNrX/SL6pZKJFQD5
 zdXGHjiXNkEX31ncyv+7Yu5uDYcHG9P4zIrvDmKeX5nPmzWeWo9m4zkZmSnk6lDvWR
 w8o48gs9PAPbAKL0+m6LhFO+bUxX2nni0FaLtImc=
X-Riseup-User-ID: 9A8718C9B62DB18787D1EB75F14CCDDDFE740B2093402BD2DF236BDDB1A12FF0
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4V0q8F5pXhzJrS2;
 Thu, 21 Mar 2024 15:27:24 +0000 (UTC)
Message-ID: <cde03f01-76b2-4628-bcb8-2fd2754b5fd8@riseup.net>
Date: Thu, 21 Mar 2024 12:27:20 -0300
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t v3 0/7] benchmarks/kms_fb_stress: Test all possible
 combinations of formats
Content-Language: en-US
To: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
References: <20240307-kms_fb_stress-dev-v3-0-d5b948a541be@riseup.net>
 <20240320174201.3b49c82a.pekka.paalanen@collabora.com>
From: Arthur Grillo <arthurgrillo@riseup.net>
In-Reply-To: <20240320174201.3b49c82a.pekka.paalanen@collabora.com>
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



On 20/03/24 12:42, Pekka Paalanen wrote:
> On Thu, 07 Mar 2024 16:41:02 -0300
> Arthur Grillo <arthurgrillo@riseup.net> wrote:
> 
>> After some discussion[1], I changed how to tackle the problem.
>>
>> With the upcoming addition of YUV format to VKMS[2] it would be great to
>> test the their performance. So, test all possible combinations of
>> formats.
> 
> Hi Arthur,
> 
> what do you gain by testing all possible combinations of formats on
> planes?
> 
> I would have thought that if you can pick and choose a format, then you
> don't need to test combinations. Each format alone (but as plane source
> and writeback destination separately) would exercise all the VKMS code
> there is for that format, given that VKMS uses the intermediate pixel
> format for all blending etc. operations.

Yeah, that does make a lot more sense. I think I was overcomplicating
things, sorry XD. About "but as plane source and writeback destination
separately", I didn't quite understand that part, could you talk more
about it?

> 
> 
> What will the standard benchmark results printout look like?
> 
> I imagine it should be a simple table that people could put in their
> commit message, something like this:
> 
> kms_fb_stress test results, plane source:
> 
>             before    after    difference
>   ARGB8888   3.6 s    3.7 s       +2.7 %
>   ABGR8888   3.6 s    3.8 s       +5.6 %
>   YUV420    15.5 s    9.9 s        -36 %
>   YUV410         -    8.8 s          -
> 
> and another table for writeback destination, if that's interesting.
> 
> But that requires both before and after runs, so one would need to save
> results in a file, and use a tool to generate the table. Well, maybe
> something to consider in the future. One could also get even fancier
> with statistical analysis, but I guess this would be plenty already.

Interesting ideas, maybe, for now, just the format and the time it took
run would suffice? What do you think?

Best Regards,
~Arthur Grillo

> 
> 
> Thanks,
> pq
> 
>> Also, to focus in an combination subset, add command-line options to
>> arbitrarily select the format of each plane and writeback.
>>
>> - PATCH #1: Just a non-related assert that I found needed while developing
>> - PATCH #2: Log the KMS structure
>> - PATCH #3: Moving code, should be noop
>> - PATCH #4 & #5: Fix a couple of bugs found while developing patch #6
>> - PATCH #6: Test all possible combinations
>> - PATCH #7: Add command-line options
>>
>> [1]: https://lore.kernel.org/all/6979cd2e-2b00-4dc4-8e41-66b435cf7ea8@riseup.net/
>> [2]: https://lore.kernel.org/all/20240304-yuv-v4-11-76beac8e9793@bootlin.com/
>>
>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
>> ---
>> Changes in v3:
>> - Make the help message and commit message more clear on how the
>>   command-line options work (Louis Chauvet)
>> - Link to v2: https://lore.kernel.org/r/20240305-kms_fb_stress-dev-v2-0-78888a38e563@riseup.net
>>
>> Changes in v2:
>> - Change how the command-line options work, now they pin the specific
>>   format and let the other change.
>> - Add a patch to test all the possible formats combination
>> - Add a couple of patches to fix some bugs
>> - Move the KMS logging patch to the beginning of the series
>> - Move the default_kms definition to the static struct data_t variable
>> - Link to v1: https://lore.kernel.org/r/20240226-kms_fb_stress-dev-v1-0-1c14942b1244@riseup.net
>>
>> ---
>> Arthur Grillo (7):
>>       benchmarks/kms_fb_stress: Assert that we have an supported pipe
>>       benchmarks/kms_fb_stress: Log the KMS structure
>>       benchmarks/kms_fb_stress: Move the stress procedure to its own function
>>       benchmarks/kms_fb_stress: Free resources on the stress procedure
>>       benchmarks/kms_fb_stress: Don't paint the FB's if the format is DRM_FORMAT_RGB565
>>       benchmarks/kms_fb_stress: Test every possible format combinations
>>       benchmarks/kms_fb_stress: Add command line options to pin the planes or writeback formats
>>
>>  benchmarks/kms_fb_stress.c | 342 ++++++++++++++++++++++++++++++++++++---------
>>  1 file changed, 273 insertions(+), 69 deletions(-)
>> ---
>> base-commit: 32369affc1fdb8194c4e7274d1d4dfd74f4aae88
>> change-id: 20240226-kms_fb_stress-dev-c93ae176f901
>>
>> Best regards,
> 
