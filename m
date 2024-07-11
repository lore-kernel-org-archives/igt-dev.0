Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029D0C3DA47
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jul 2024 09:36:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF6510E1E9;
	Thu, 11 Jul 2024 09:36:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HJPuCZtt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF93110E1E9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jul 2024 09:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720690571; x=1752226571;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=R6og5Jj7Dyu53Pv1AUrJXvuc2h0DlKgK3WAX2U8cgJM=;
 b=HJPuCZttcpb+tYH9fmICtRGcN7TZjAaS42AorL//AB4zspH7CZTrPZq4
 DO/nrKBF1vD0pw0pcPbcgjak7BRWrFOCKhO6ivwqnoMq6Q0eH3tLxEdDc
 1EyznY8aYB+X5J72iggkjBJ36EPHmtnXMKF7MesUsFmQaWwlzKzPqgWbd
 d+oP4YfH+IrJgL9fVXQLVa10VFhKh2V3H69xaH92irB2VN14C9LwKi58i
 I7S7q93udq0hllR6JsiyU9qUbpJcwpyNvwES0V8qrsQnJHP5SPzuB/l6f
 6Y8+l2i5ZoWuPes2q+mEWhqrqB2Blb15jUMe5/R60xUuWg1qSP7RwiMmf Q==;
X-CSE-ConnectionGUID: vvj32d3kTpKJg4h6HqTlYg==
X-CSE-MsgGUID: vTyp7XDQR2iXryO9LlNXFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17673982"
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="17673982"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:36:10 -0700
X-CSE-ConnectionGUID: xlLAQ8HnTnqObk7E9fbPgw==
X-CSE-MsgGUID: 71agVdGFSTiSmG7uFJYuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="48495177"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO [10.246.28.172])
 ([10.246.28.172])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2024 02:36:09 -0700
Message-ID: <32c5fb34-ed96-4b01-b2b2-b2c5da0f5856@linux.intel.com>
Date: Thu, 11 Jul 2024 11:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV
 stress tests
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>,
 "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20240710152446.827476-1-marcin.bernatowicz@linux.intel.com>
 <20240710152446.827476-2-marcin.bernatowicz@linux.intel.com>
 <BL1PR11MB54455EBD1E63A5C23C6D21B0E5A42@BL1PR11MB5445.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <BL1PR11MB54455EBD1E63A5C23C6D21B0E5A42@BL1PR11MB5445.namprd11.prod.outlook.com>
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



On 7/10/2024 9:00 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Marcin Bernatowicz
> Sent: Wednesday, July 10, 2024 8:25 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>; Adam Miszczak <adam.miszczak@linux.intel.com>; Laguna, Lukasz <lukasz.laguna@intel.com>; Kolakowski, Jakub1 <jakub1.kolakowski@intel.com>; Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH i-g-t 1/2] tests/intel-ci/xe.blocklist: Blocklist SR-IOV stress tests
>>
>> Blocklist several SR-IOV tests that are identified as too stressful
>> or time-consuming.
> 
> It might be better to word this differently as to clarify that we
> still plan on running the tests, just not in the normal CI
> execution path for the above reasons.  But otherwise:

I'll update the description, what we want to have is:

BAT:
igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all
igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1

FULL:
igt@sriov_basic@enable-vfs-autoprobe-off
igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all

I noticed one change is needed in xe-blocklist.txt:
igt@sriov_basic@enable-vfs-autoprobe-on -> 
igt@sriov_basic@enable-vfs-autoprobe-on$
to prevent blocking igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1 in 
BAT runs

Thanks for review,
> 
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>>
>> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
>> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
>> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   tests/intel-ci/xe.blocklist.txt | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/intel-ci/xe.blocklist.txt b/tests/intel-ci/xe.blocklist.txt
>> index 828baf324..dd7c05041 100644
>> --- a/tests/intel-ci/xe.blocklist.txt
>> +++ b/tests/intel-ci/xe.blocklist.txt
>> @@ -83,3 +83,9 @@ igt@kms_prime@.*
>>   ##################################################################
>>   igt@kms_cursor_legacy@modeset-atomic-cursor-hotspot
>>   ##################################################################
>> +# SR-IOV tests that are too stressful or time-consuming
>> +##################################################################
>> +igt@sriov_basic@enable-vfs-autoprobe-on
>> +igt@sriov_basic@enable-vfs-bind-unbind-each$
>> +igt@sriov_basic@bind-unbind-vf
>> +##################################################################
>> -- 
>> 2.31.1
>>
>>
