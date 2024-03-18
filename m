Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C4EC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 14:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C6810F791;
	Mon, 18 Mar 2024 14:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr20KrSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A723710F791
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 14:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710770691; x=1742306691;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=Vrz0ZYpqzj2OrTZ6IMeqrRLhC7wngjLo+Jd8ppEhrRU=;
 b=Vr20KrSdnQ611swee5uFz2Ey9xEVyLcUlkQzwYMe3q1GuAPXwzqYaPI7
 xwKCQI7nwVZ9F2nLR5CfiQSX57f4ox3g1dX0qFxQXjOB/SdjeehvP7yvi
 h7liPgZ4SHCde3Y3eYauUsex20UB9HW2pmH/y6m8YzK020Copdpew4b71
 kLTdGHOhfB0DhU1mV6SDdbpLLTyOpfGOXSYrbmOLW2uzVXUxZccGWJffR
 4hTAXBLYvHK/lqv+Hftd5LTmHtRVK1WngxwpDSsc6pyF4xvtpB6UyCVIG
 LbHyIYHQvKQSPoAefBQPnftMlqkbMGR+WmPoT2rGP0XT2sylXhynBn5Vc Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="9409963"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="9409963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:04:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13534703"
Received: from ahmedess-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.53.133])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 07:04:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 arthurgrillo@riseup.net, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com, Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Petri Latvala <adrinael@adrinael.net>
Subject: Re: [PATCH i-g-t] CONTRIBUTING: Add coding style guidelines
In-Reply-To: <20240318114329.drrzkqmirdaahigm@kamilkon-desk.igk.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240315-add_coding_style-v1-1-50ad93cfa250@bootlin.com>
 <20240318114329.drrzkqmirdaahigm@kamilkon-desk.igk.intel.com>
Date: Mon, 18 Mar 2024 16:04:43 +0200
Message-ID: <87cyrrpres.fsf@intel.com>
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

On Mon, 18 Mar 2024, Kamil Konieczny <kamil.konieczny@linux.intel.com> wrote:
> Hi Louis,
> On 2024-03-15 at 17:08:37 +0100, Louis Chauvet wrote:
>> As explained in [1], the submitted patches should follow the same style as
>> the Linux kernel and must be checked against checkpatch.pl, so add this
>> recommendation in the CONTRIBUTING.md file.
>> 
>> [1]: https://lore.kernel.org/all/20240314170643.77vzqqoie2otyu4w@kamilkon-desk.igk.intel.com/
>> 
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>> 
>> To: igt-dev@lists.freedesktop.org
> -^^^^^^^^^^^^^^
> Drop this.
>
>> Cc: miquel.raynal@bootlin.com
>> Cc: thomas.petazzoni@bootlin.com
>> Cc: jeremie.dautheribes@bootlin.com
>> Cc: arthurgrillo@riseup.net
>> Cc: seanpaul@google.com
>> Cc: marcheu@google.com
>> Cc: nicolejadeyee@google.com
>> Cc: kamil.konieczny@linux.intel.com
>
> These should be before your s-o-b above.
> I will add here few more maintainers:
>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Petri Latvala <adrinael@adrinael.net>
>
>> ---
>
> Here you could add your notes which will be ignored by git
> at merging but I do not see any?
>
>> To: igt-dev@lists.freedesktop.org
>> Cc: miquel.raynal@bootlin.com
>> Cc: thomas.petazzoni@bootlin.com
>> Cc: jeremie.dautheribes@bootlin.com
>> Cc: arthurgrillo@riseup.net
>> Cc: seanpaul@google.com
>> Cc: marcheu@google.com
>> Cc: nicolejadeyee@google.com
>> Cc: kamil.konieczny@linux.intel.com
>> 
>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Looks like you didn't run checkpatch on this contribution! ;D

>> ---
>>  CONTRIBUTING.md | 2 ++
>>  1 file changed, 2 insertions(+)
>> 
>> diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
>> index 2ab8a48f6ae9..ec8debb4091e 100644
>> --- a/CONTRIBUTING.md
>> +++ b/CONTRIBUTING.md
>> @@ -78,6 +78,8 @@ Sending Patches
>>  - Changes to the testcases are automatically tested. Take the results into
>>    account before merging.
>>  
>> +- The coding rules are the same as for the Linux kernel. To check for common
> -------------------------^
> insert 'almost' here: s/are the same/are almost the same/
>
>> +  style problems, you need to use the kernel's checkpatch.pl script.
>
> There are known variations like we do not have MAINTAINERS, or
> we allow to use typdefs, allow to have (reasonable) longer lines
> and few others differences.

You could define the checkpatch.pl options to use. Maybe even add a
script wrapper to run, with the options set.

For example, we use these command-line options for i915:

scripts/checkpatch.pl -q --emacs --strict --show-types --max-line-length=100 --ignore=BIT_MACRO,SPLIT_STRING,LONG_LINE_STRING,BOOL_MEMBER

Alternatively, define a clang-format configuration file and use that
instead of checkpatch. Linux repo root has .clang-format.


BR,
Jani.


>
> Regards,
> Kamil
>
>>  
>>  Commit Rights
>>  -------------
>> 
>> ---
>> base-commit: ed47dd9fb6b5be6c88513c2816f0f7cfdd0e02f6
>> change-id: 20240315-add_coding_style-b755454de958
>> 
>> Best regards,
>> -- 
>> Louis Chauvet <louis.chauvet@bootlin.com>
>> 

-- 
Jani Nikula, Intel
