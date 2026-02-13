Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A182EF48F9
	for <igt-dev@archiver.kernel.org>; Fri, 13 Feb 2026 09:12:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ECB710E7C8;
	Fri, 13 Feb 2026 09:12:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PrFTjE3w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1292410E7B7
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Feb 2026 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770973950; x=1802509950;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=rodzZ7jAH4X8g95DoQGbzq+UyRa+FMsJrPYdd73wlcg=;
 b=PrFTjE3w6U+6e9ZTDGYULNHfjwN4vDpUBcm5YcJD3UxKssysXgQD9g1y
 FdOV68w+/ZbBGHVsfF3qkTrKarwNWcnjnU3/RrYaBvR6Ht20wxrjfCm/Z
 7u0SpcWllqNhUGlRr+LqN0ANz2/1+hegVAbFtePa9he3WqDi4PXGxAKpk
 nh9YIOFeZoBqnQ7P9EKbrt6Y1LimoPfHWk2EVy6d3veKWEF6EwhNMA1C3
 aC6InNGUKTrqRkGxGweZGj2juz8FHpReOZXMweOAw/LsdpgxRdiy6Scte
 BF9BxzqA97g6drd5T42iSVoMd1xz5XWlZf1WCk3wA/FrUUZsPxc2z/7R4 w==;
X-CSE-ConnectionGUID: rup0JllsRRGbt3Ts+tIVPQ==
X-CSE-MsgGUID: B3xuSKGdRfmdFsa5iRTVfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="72051149"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="72051149"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:12:29 -0800
X-CSE-ConnectionGUID: Ytx4eVBmR3+sdRVhazrMaw==
X-CSE-MsgGUID: NWJL5s6uSCKCjz3kWCemjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="235843283"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:12:28 -0800
Date: Fri, 13 Feb 2026 10:12:26 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Sharma, Swati2" <swati2.sharma@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org, 
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: Re: [PATCH i-g-t v4 0/4] kms_flip: limit number of subtests run
In-Reply-To: <dfc99a00-1369-4575-ba50-95ed3dcf83ea@intel.com>
Message-ID: <1346f34b-bc6f-a900-e37c-a2bbd90f3aa1@intel.com>
References: <20260212111023.189261-1-michal.grzelak@intel.com>
 <dfc99a00-1369-4575-ba50-95ed3dcf83ea@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="1527428566-1875849429-1770973949=:252369"
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--1527428566-1875849429-1770973949=:252369
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Thu, 12 Feb 2026, Sharma, Swati2 wrote:

> Hi Michal,
>
> There seems to be build failure with your patches, can you please float new 
> rev?

Huh, interesting because I git fetch'ed && git rebase'ed straight
before sending patches. Apparently some conflicting changes must have
been merged after I sent patches, but before they have been applied by
Patchwork, which resulted in build failure:

Patchwork, timestamp of sending to ML:
 	Subject: [PATCH i-g-t v4 0/4] kms_flip: limit number of subtests run
 	Date: Thu, 12 Feb 2026 12:10:18 +0100

Conflicting change, git log --oneline --pretty=fuller -- tests/kms_flip.c:
 	commit 2978b9a78
 	[...]
 	CommitDate: Thu Feb 12 13:20:19 2026 +0200

Patchwork, timestamp of patch application:
 	Subject: ✗ Fi.CI.BUILD: failure for kms_flip: limit number of subtests run (rev3)
 	Date: Thu, 12 Feb 2026 15:47:28 -0000

Almost impossible to happen, yet still non-zero chances. Let's hope it
won't happen for second time in a row. :)

BR,
Michał

>
> On 12-02-2026 04:40 pm, Michał Grzelak wrote:
>> Next version of [1]. This series addresses both 2x-* and single output
>> tests. This series has been tested on config with 4 outputs connected.
>> 
>> [1] 
>> https://lore.kernel.org/igt-dev/20260210225546.153728-1-michal.grzelak@intel.com
>> 
>> BR,
>> Michał
>> 
>> ---
>> Changelog:
>> v3->v4
>> - change \gt into \ge sign
>> 
>> v2->v3
>> - ease counting of pairs of outputs
>> - limit number of tested outputs
>> - narrow pair & output limiting to suspend subtests
>> - add separate param for pair and connector limiting
>> 
>> v1->v2
>> - split pipe limiting into 2x- and single subtests
>> - add output pair limiting
>> 
>> 
>> 
>> Michał Grzelak (4):
>>    tests/kms_flip: test suspend on one pair of pipes
>>    tests/kms_flip: run suspend tests on one pipe per output
>>    tests/kms_flip: limit output pairs when testing suspend
>>    tests/kms_flip: limit number of outputs wrt suspend
>>
>>   tests/kms_flip.c | 74 +++++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 61 insertions(+), 13 deletions(-)
>> 
>
--1527428566-1875849429-1770973949=:252369--
