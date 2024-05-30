Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF35C25B74
	for <igt-dev@archiver.kernel.org>; Thu, 30 May 2024 19:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A4610E258;
	Thu, 30 May 2024 19:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lt1Qs775";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D56210E258
 for <igt-dev@lists.freedesktop.org>; Thu, 30 May 2024 19:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717098038; x=1748634038;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=hyY2VsmH2QLOPsKLdc2PNXZTVc2lK9rDJkl+8RnsJ0Y=;
 b=lt1Qs775dq1tyGY+Ee6+2522EIsitjNmXnMrVeQ42v2teyLG0d5kx4nw
 md/ikiXgTSO8PB/BCkA5LuKaMVhCAHm9TyrUCjtPx/DIkj9QoR/IYvdAq
 oI5feudv5Me0DC/cbXkMxKy3bFfGSlE/+r85Glr4bynveneCDtZV4UhjB
 m78UDq/xDZfHv0XBI8dsjK7RjRqW/b83tKUhxe7ENHORDBMeF3MmGkzkj
 8KxgNzEcMPbXGz8mNKsmVypo2mfiff2cczoILNbSuauKKe8DDNpu2nKZm
 /8BzEVhI/q/ZP/n1pfW0yjDJjO19aXmw31BkXF8qj1QDn+/NeaV2Vkjs5 w==;
X-CSE-ConnectionGUID: 5NLWPQaAQP6fUAqyGoCzFQ==
X-CSE-MsgGUID: PbSJqewHRnaR/eRtHkikYA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31143668"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="31143668"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:40:37 -0700
X-CSE-ConnectionGUID: ZOrjBfrVSJW017FhhJbeLA==
X-CSE-MsgGUID: Hg1vk+29SWie8t50wI7oTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="36027272"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.167])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 12:40:37 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t] man: Add --decode to intel_reg.rst
In-Reply-To: <87bk4ngkdg.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240530193325.1072381-1-lucas.demarchi@intel.com>
 <87bk4ngkdg.fsf@intel.com>
Date: Thu, 30 May 2024 22:40:32 +0300
Message-ID: <878qzrgkb3.fsf@intel.com>
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

On Thu, 30 May 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 30 May 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>
> I like to have a commit message, even if it's short, rather than empty.
>
> IMO something can be added while applying,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Argh, just as I hit send, noticed you need s/implicitely/implicitly/g.

>
>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  man/intel_reg.rst | 22 +++++++++++-----------
>>  1 file changed, 11 insertions(+), 11 deletions(-)
>>
>> diff --git a/man/intel_reg.rst b/man/intel_reg.rst
>> index d452f7927..0e6c49927 100644
>> --- a/man/intel_reg.rst
>> +++ b/man/intel_reg.rst
>> @@ -41,8 +41,13 @@ Some options are global, and some specific to commands.
>>  --binary
>>      Output binary values.
>>  
>> +--decode
>> +    Decode registers. By default it only uses the raw offsets, unless
>> +    it's a command that would otherwise not work without it or another
>> +    option forces it enabled. See COMMANDS below for details.
>> +
>>  --all
>> -    Decode registers for all known platforms.
>> +    Decode registers for all known platforms. This option implies --decode.
>>  
>>  --mmio=FILE
>>      Use MMIO bar from FILE.
>> @@ -53,7 +58,7 @@ Some options are global, and some specific to commands.
>>  
>>  --spec=PATH
>>      Read register spec from directory or file specified by PATH; see REGISTER
>> -    SPEC DEFINITIONS below for details.
>> +    SPEC DEFINITIONS below for details. This option implies --decode.
>>  
>>  --help
>>      Show brief help.
>> @@ -76,23 +81,18 @@ Write each VALUE to corresponding REGISTER.
>>  dump [--mmio=FILE --devid=DEVID]
>>  --------------------------------
>>  
>> -Dump all registers specified in the register spec.
>> +Dump all registers specified in the register spec. The option
>> +--decode is implicitely enabled.
>>  
>>  decode REGISTER VALUE
>>  ---------------------
>>  
>> -Decode REGISTER VALUE.
>> -
>> -snapshot
>> ---------
>> -
>> -Output the MMIO bar to stdout. The output can be used for a later invocation of
>> -dump or read with the --mmio=FILE and --devid=DEVID parameters.
>> +Decode REGISTER VALUE. The option --decode is implicitely enabled.
>>  
>>  list
>>  ----
>>  
>> -List the known registers.
>> +List the known registers. The option --decode is implicitely enabled.
>>  
>>  help
>>  ----

-- 
Jani Nikula, Intel
