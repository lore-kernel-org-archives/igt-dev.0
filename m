Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7163C04D2B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Apr 2024 13:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8F510E125;
	Thu, 11 Apr 2024 13:24:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ioWmap36";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A4D10E125
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2024 13:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712841890; x=1744377890;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BRRxenebxtd3hd7RoajMGBXBlSMNnBmNdvpVEJgPEJM=;
 b=ioWmap365tC9EyPAQ0kn82iLg9akKh5+aU6JF0E3OIGUm7Is/+FrVivB
 Bxida5ckiODUSS+/b3PFQ9R3dHFyW8F2L57wMwu+HT0A0Ln8MPZ0rFCdX
 aD36srGIAHxWjtvxQgkteEu8eJCddlvIy5pH/EpVp4ob27oSVp5dJxXJO
 2/SjfPcpG+ntjnhguJIBixmFUPUMrmo8my3MiE+pz/5Y0Hh0nYdqI99R1
 4dWDKi/gily4jsOA/bMrySpUtMv4Bv2QWVmP6B50FREn6vhlCRPD1gQaT
 vtwEJfnWcRbyxHezLNbbbWZiD6d1r8yjjKR1fpUpINaR1QbsqK65qZk3O A==;
X-CSE-ConnectionGUID: ePbDbI7UQQiypv76iciw5Q==
X-CSE-MsgGUID: H6z0JtehQzWP70PCg2zI0A==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="18958269"
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="18958269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:24:48 -0700
X-CSE-ConnectionGUID: xKd1w8qaSF+6e8uoOkR4aw==
X-CSE-MsgGUID: wm/Fy34nTZm1mP05lFJnqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,193,1708416000"; d="scan'208";a="20948100"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2024 06:24:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: igt-dev@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 Ville Syrjala <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH i-g-t] intel_reg: Stop warning if register spec is not
 there
In-Reply-To: <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240410231710.3113867-1-lucas.demarchi@intel.com>
 <87le5k7028.fsf@intel.com>
 <bwwkqrnrd75zdnllhhtw3bapgz3fzdv2gjestlahdr4rxohxx5@5xgdosdtqwsa>
Date: Thu, 11 Apr 2024 16:24:43 +0300
Message-ID: <87cyqw58x0.fsf@intel.com>
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

On Thu, 11 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Thu, Apr 11, 2024 at 11:53:03AM +0300, Jani Nikula wrote:
>>On Wed, 10 Apr 2024, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> Stop suffering when using igt from the git checkout, which is the case
>>> for all/most developers.
>>>
>>> 	$ sudo ./build/tools/intel_reg write 0x2358 0xdeadbeef
>>> 	Warning: stat '/usr/local/share/igt-gpu-tools/registers' failed: No such file or directory. Using builtin register spec.
>>>
>>> Pretty annoying when you have a bunch of commands to run and don't want
>>> to simply ignore stderr.  Keep the other warnings as if the file is
>>> there and can't be read for some reason, it's good to give a warning.
>>> However if the file simply isn't there, let it pass.
>>
>>The TL;DR is,
>>
>>Acked-by: Jani Nikula <jani.nikula@intel.com>
>>
>>---
>>
>>We have the "register specs" in plain text files so that anyone could
>>update them at runtime without building the source. And conceivably they
>>could be generated from a more authoritative source. It would be nice if
>>we could incorporate the info to the binary at build time as the builtin
>>register specs (so no data dir lookups at all), but also be able to
>>override them e.g. using a command-line parameter if the user wishes.
>>
>>I don't think that would even be so hard. But it would arguably be a bit
>>wasted effort as long as the register files under tools/registers/
>>aren't updated for newer platforms. (The current builtin register specs
>>are completely out of date.)
>
> I don't really get why one would want the tools/registers actually. When
> I'm using intel_reg I'm already working on a very low level interface
> with the hardware and can simply pass/read the raw offsets.

Something we wanted but never materialized was decoding register
contents, like the builtin decoding does. But I think with the pace of
registers added and meanings changing from platform to platform, etc,
with no automated import of the specs, it was just too laborous by hand.

And there's also the dumping, and it's kind of platform specific what
should be included. I think that's where the tools/registers files
originated.

BR,
Jani.




>
> I think a reg spec like that is nice when we are e.g. tracing, so we
> don't have to lookup all the registers that are showing up. I think
> Gustavo had something wip related to that. However for intel_reg I don't
> have a use case.
>
> Lucas De Marchi
>
>>
>>The tool could use some love again. It's been almost 10 years since
>>commit dfda0b6aecce ("intel_reg: introduce one intel_reg tool to rule
>>them all").
>>
>>BR,
>>Jani.
>>
>>>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  tools/intel_reg.c | 6 +-----
>>>  1 file changed, 1 insertion(+), 5 deletions(-)
>>>
>>> diff --git a/tools/intel_reg.c b/tools/intel_reg.c
>>> index 6c37e14d1..ec311a05a 100644
>>> --- a/tools/intel_reg.c
>>> +++ b/tools/intel_reg.c
>>> @@ -1114,12 +1114,8 @@ static int read_reg_spec(struct config *config)
>>>  		path = IGT_DATADIR"/registers";
>>>
>>>  	r = stat(path, &st);
>>> -	if (r) {
>>> -		fprintf(stderr, "Warning: stat '%s' failed: %s. "
>>> -			"Using builtin register spec.\n",
>>> -			path, strerror(errno));
>>> +	if (r)
>>>  		goto builtin;
>>> -	}
>>>
>>>  	if (S_ISDIR(st.st_mode)) {
>>>  		r = get_reg_spec_file(buf, sizeof(buf), path, config->devid);
>>
>>-- 
>>Jani Nikula, Intel

-- 
Jani Nikula, Intel
