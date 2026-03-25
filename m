Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE489109E52E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 23:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968C010E096;
	Wed, 25 Mar 2026 23:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XVs5acUS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E29A10E096
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 23:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774481986; x=1806017986;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version:content-id;
 bh=8KaEXFHqS+m90KC4DoAP1GEyNBS+fAnBaWRjuIKKe8M=;
 b=XVs5acUSpZvlyHdBGDHvVbnSB3Kvwrkxly1Sv4MHPaOEESiOOlcw7t49
 oJEVg5F8uafZVn9mnUWKJXGZWKYbnJ5I/SsGCfYNLkMe3d7unw6dNrUWf
 Zd12d+hEXt7cAAdMqgBAyErNTPx7PfDwbrGCYG88zkl2j6/3I0hqcXFCv
 f1yKbDzIElFjnfxfbgqLrbqAWEQLaHbdz6No3hk2wW9PhnlGk3RkaviOU
 0n1kTR29zSWH7xrOYLSpYZ0yJYdY9EjNjUfkCvCs8twl+6HPp3rTNN52e
 7A3+4a5JA4JEFQPRkdmMHiK8k0icszmcBRTyi9yze14pBS0h35HyPWOyk A==;
X-CSE-ConnectionGUID: rgMt85yJQ9WITLNirK8rUA==
X-CSE-MsgGUID: kfXnkmqVQXmWRtasXo8oAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="79386822"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="79386822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 16:39:46 -0700
X-CSE-ConnectionGUID: O6ZPddiTS/21fnQr6G937A==
X-CSE-MsgGUID: IJ/Mxbx5QJ+LPblgu6eqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="262749475"
Received: from administrator-system-product-name.igk.intel.com
 ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 16:39:45 -0700
Date: Thu, 26 Mar 2026 00:39:43 +0100 (CET)
From: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
cc: =?ISO-8859-2?Q?Micha=B3_Grzelak?= <michal.grzelak@intel.com>, 
 igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t v8 4/6] tests/kms_flip: limit number of outputs
 wrt suspend
In-Reply-To: <9784b105-06b7-4ef5-9ccf-55de50ab57ae@intel.com>
Message-ID: <1610eea6-4b7b-1cdc-31bd-3850e5cac232@intel.com>
References: <20260309092528.3336467-1-michal.grzelak@intel.com>
 <20260309092528.3336467-5-michal.grzelak@intel.com>
 <9784b105-06b7-4ef5-9ccf-55de50ab57ae@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-661329068-1774479196=:320572"
Content-ID: <4edac0a8-5142-bf00-15bb-79a9eab9abc4@intel.com>
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

--8323329-661329068-1774479196=:320572
Content-Type: text/plain; CHARSET=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <b01d2008-eae6-029e-987c-90328dd0a1db@intel.com>

On Sat, 14 Mar 2026, Thasleem, Mohammed wrote:
>
> On 09-03-2026 02:55 pm, Micha³ Grzelak wrote:
>> When running suspend subtests on single output, we can still hit the
>> timeout by testing too much outputs. Default to testing 3 outputs. Add
>> command-line parameter to run on all outputs.
>> 
>> Signed-off-by: Micha³ Grzelak <michal.grzelak@intel.com>
>> ---
>>   tests/kms_flip.c | 21 ++++++++++++++++++---
>>   1 file changed, 18 insertions(+), 3 deletions(-)
>> 
>> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
>> index 917c5ed6f..ae38096aa 100755
>> --- a/tests/kms_flip.c
>> +++ b/tests/kms_flip.c
>> @@ -264,12 +264,14 @@
>>   #define RUN_PAIR		2
>>     #define PAIR_LIMIT 		3
>> +#define CONN_LIMIT 		3
>>     #ifndef DRM_CAP_TIMESTAMP_MONOTONIC
>>   #define DRM_CAP_TIMESTAMP_MONOTONIC 6
>>   #endif
>>     static bool all_crtcs = false;
>> +static bool all_conns = false;
>>   static bool all_pairs = false;
>>     drmModeRes *resources;
>> @@ -1822,6 +1824,7 @@ static void run_test(int duration, int flags)
>>   {
>>   	struct test_output o;
>>   	int i, n, modes = 0;
>> +	int conn_count = 0;
>>     	/* No tiling support in XE. */
>>   	if (is_xe_device(drm_fd) && flags & TEST_FENCE_STRESS)
>> @@ -1887,6 +1890,10 @@ static void run_test(int duration, int flags)
>>   			if ((flags & TEST_SUSPEND) && !all_crtcs && n != 0)
>>   				continue;
>>   +			/* Limit number of displays run */
>> +			if ((flags & TEST_SUSPEND) && !all_conns && 
>> conn_count >= CONN_LIMIT)
>> +				continue;
>> +
>>   			memset(&o, 0, sizeof(o));
>>   			o.count = 1;
>>   			o._connector[0] = resources->connectors[i];
>> @@ -1895,8 +1902,15 @@ static void run_test(int duration, int flags)
>>   			o.depth = 24;
>>     			crtc_idx = n;
>> -			run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
>> -					     resources->count_crtcs, 
>> duration);
>> +
>> +			connector_find_preferred_mode(o._connector[0], n, 
>> &o);
>> +			if (o.mode_valid) {
>> +				run_test_on_crtc_set(&o, &crtc_idx, RUN_TEST,
>> +						     resources->count_crtcs, 
>> duration);
>> +				conn_count++;
>> +			} else {
>> +				free_test_output(&o);
>> +			}
>>   		}
>>   	}
>>   @@ -2071,10 +2085,11 @@ static int opt_handler(int opt, int opt_index, 
>> void *data)
>>   }
>
> Here:  Below entry seems to missing...
> static int opt_handler(int opt, int opt_index, void *data)
>
> +        case 'c':
> +        all_conns = true;
> +         break;
>            ...........
> }

Thanks for catching that. Will include it in next version.

BR,
Micha³

>
>>     const char *help_str =
>> +	"  -c \tRun on all connectors. (By default suspend subtests will run 
>> on 3 connectors)\n"
>>   	"  -e \tRun on all CRTCs. (By default subtests will run on two 
>> CRTCs)\n"
>>   	"  -p \tRun on all output pairs. (By default 2x-* suspend subtests 
>> will run on 3 pairs)\n";
>>   -int igt_main_args("ep", NULL, help_str, opt_handler, NULL)
>> +int igt_main_args("cep", NULL, help_str, opt_handler, NULL)
>>   {
>>   	struct {
>>   		int duration;
>
--8323329-661329068-1774479196=:320572--
