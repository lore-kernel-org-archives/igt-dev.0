Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071BEC48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 17:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6988A10E189;
	Thu, 29 Feb 2024 17:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e11Jh0Ki";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B9E510E1B8
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 17:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709226245; x=1740762245;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=clX+iUthPO0N8lSbC0DWsWsaqSPjfpikJLS06AAYxyU=;
 b=e11Jh0KiUJkgwud6yvTjwW8nRk2DWiZCXb+XkZzmUSWH61QtCqzCTrso
 luEju93x2l+qUeF3jjYAMZnn2aZsuDtNiqUdJ+p8UnenOMbl4BdtS83JC
 wKpgPoaBwodXWUPMhEY4fZm2QXXST7GAPPlxTLFuHnuj7PC2ivc1zv/aM
 znGl1ydam3/05FmvhZzEyITqrxUzs/DrjNcZik7IjKOLRLvyekHTifUWr
 HR1ITd9LYidCcGiL+0RyzWRWd2Tou7taTQ/WOS0YHJYM7z5D7LxxbNMPR
 cGbO1bYeAnsrSR4iMxtasoG4u7Sikc23iga+VLT5LFGivsZuHi+aw8Vue A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3567672"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3567672"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 09:01:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="8008538"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 09:01:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 09:01:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 09:01:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 09:01:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO5p65rePVtC81ONpDbXyRg9lzN1iJhZUC62h5hNw0+oZQ+V2keriRDnIB8bmvvCf+EwUDbYjHHPlKsxUKJ60Yc4rXfxmIu5lMNKonoZrpFyHRbgUuNU7QMn+nHcC7OTDmRj0iQnxFuzwDdValUDw3t9QNZpYTXRKxtnhdL291dklWyhHGXqNyk7yQkoXiv25Lg6sEhTP57xjBzq/NLDtaMtMQA1h7qwYjLJQCeEJ3XYVmyNUl4iF0AQe/Bp376Kzq9QibJc4IySk8JEv1PVArK4lrxYyPEfB0kNTOLfvYpObsc92AgEUV6SXsWCS0VktdEaASO4y0LXcl+8EoySbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=14JlS0S4q1wvVxDY/hAmIg8QYaU1B4hBIn+L+Jh2n1Q=;
 b=jk5k7jPLVvo6y2wgolcMnKfyoMTvB1obStqoPN772f8frNAoIYcOOZlH+miKDH0dJd06ocZ6+o/q6gJ5K1DVjyLIIYDrBFi4lLUXRP/uvW208JN7b1gTwiUaQBvhYDriZCtVlSeFDvB8rCNsLGIOWggPClbJt7odDDygwIBAL46tCVKeZ+Hovr9x0icYBhaJNpxvZ1Fw5oskZcWx8g8R+WfK4zcWLQV8T9KprGWWzpVX9OTeq5BVYKCQdnlsrETrKo2UmQkxQapk96f4AIz+FA+k2vInmQ4qEP0nu0ntB4J1tXR1IyfGSLvX5wYUOYR4RmX/vXCc8ArQI3ce25rM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CY8PR11MB7947.namprd11.prod.outlook.com (2603:10b6:930:7a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Thu, 29 Feb
 2024 17:01:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Thu, 29 Feb 2024
 17:01:31 +0000
Date: Thu, 29 Feb 2024 11:01:29 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v4 3/4] lib/igt_sysfs: Fix off-by-one in buffer size
Message-ID: <oxofhejmm73jbch4js4uhoobmjiqa36bxbcptzt6wqscmxaxmi@t4trup4np5ci>
References: <20240228223134.3908035-1-lucas.demarchi@intel.com>
 <20240228223134.3908035-3-lucas.demarchi@intel.com>
 <3709752.RUnXabflUD@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <3709752.RUnXabflUD@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: BYAPR06CA0027.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CY8PR11MB7947:EE_
X-MS-Office365-Filtering-Correlation-Id: 093f266b-a4ce-44ef-4328-08dc394813ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VfiQoZjEr/iPEbJIZKtYTsUREizzu++ySllYLF8zru1txba82T8ljhngsXqRasIfBWdO2n9GBO/67M03zOgXExLDVm/FCg3f0m4nnaxPmwoDNbHu/1RqTMJxLmqMaME3DKdXvigksCNLjqewtsHDH3F+6cUkzbUME8iigqiSdsQpmHH7DWB/L61fxX3+JNvvGj0dcP8cHU8ARIbuVklxx1zZfH0/miu6APxd4cZl+i3b/uzkXxKsT6tNKhTiB4t058059W0ZJJMLtW+MIpcQk6z6qjViw3yiG7Tug0W4WeVqzCRyfBp/BpgXtU9JFzhaSxQweJesnS1GL0eCKINRf+a5SngYD9RiZeWAz/tOzJsfcJOPaLLO5xQ1Y/iVd7lrYHXqibx3bnr3zfbTevOmjQVU141QNz9Ba44QLM1HTbigyDdtEwYJyrA3QHPtGluhv3j34fyt0b9lu00n0fcX6/5qv5uYdvZeIZfs3dxjayNyOZRI3hm1mcSId5u+jCb4uZlW3OLBvHnTZ6TbvL5dle7pDSzlpeWMabeuC8SG6iHVoOlmXwz3lIgnAruec+ayBpHUC6pjOh2nc1/smEoD8dgZx37k9SC98TJn+PJDBOtDytsTpBha6hviWJbu8oVL9bm9LKzhbr6YilO7fdvlaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hh0eDw35b6DeH6Bg7iQhoIZ4NnytQ4sYL0Z4dnOnFuIHLl6xmdPLR7xsdE7j?=
 =?us-ascii?Q?M2UhwP1lwrTxj3BstihsaYXWWawkemWo/19U+Hxl4N/AAQsHN+8twOyPK61c?=
 =?us-ascii?Q?0o3vppURwFbDaglr/kFBg49RXs7yLfZpMjqDUDXGyVXXq5/XVxU7UCbw+rVs?=
 =?us-ascii?Q?VQX3nhO/l5/bbDuMK1laeOuVKGN22RZNj5gFCLrHLcU3I2XBJ3ViDAHiCSRw?=
 =?us-ascii?Q?ag5GcoLB94nfz7KE35FfXf2X0JPPLvTmRxBEjQENnbkcAMSg5n4sIzlfI1nd?=
 =?us-ascii?Q?n6x6YrQ920QwUUBsBe7dNpzuUoTFs/StLmMwnW8fdkY0bhDSyfzsK4Y0XJVj?=
 =?us-ascii?Q?0n/6Qsh15N/vv1Fd3LKt61MU8/DR6O5geII/Of3vTVEgT/Qxb2JoSTpX+UuY?=
 =?us-ascii?Q?3w5Wm2HxJl3eBWMydTWMEbshpQZUzFpFp93iyCXMWYs76813amRK+le30/Sd?=
 =?us-ascii?Q?wz5lYXaD24DZ4A+LuU8Tb3j2RJLJQ8BF98e6SuzLD0sRFWIbYtBKRKjhFM7h?=
 =?us-ascii?Q?BBVDB14xHsH6OO7UvsJqRdH6Wyo7lUFXg0TsKbEBenq4PmJct3ifuF3ODdSn?=
 =?us-ascii?Q?O/wl5K4azv4w+gze4R+R6Gxz6iitiMxHy+2GvzGu1+KkzcUjMGtTPSxsAP7o?=
 =?us-ascii?Q?5ABHPhdlZSEr3/fkPRVDicsbI/SdHJpQlW47W0lLNeYUh4s53lRe6nn2BVYV?=
 =?us-ascii?Q?XaZzQ6aWfy0YZZnpqOwW7+sYGwhNxbnFp18/v4V5lDUelseu6vulTqoPhuRt?=
 =?us-ascii?Q?TFR/5JdkG2WtEGGFGiP/BOQLp2Utex8rvB9VW/giX2CaX7EsUH2cTg95Cx/S?=
 =?us-ascii?Q?yUv0svsHMSMj50FyXnoqJYSPvDP4DB9AD7al5edxpauqnxxfbpaugpCV7hX3?=
 =?us-ascii?Q?cjlZQf1JnIi2miuzdAAwkO4oRlVYqWaN8mVKyEYU4mLYoF+3/Qn6wELQg5dV?=
 =?us-ascii?Q?6TzqFJMpeHW7SdklVkHo0Bm8Oc8xun9b7HjGFYAcsQYt376uWmJvIj2kaQft?=
 =?us-ascii?Q?aOW2VYJTvpOXbf2OumAP7jd1wk2lY1oPEWM+ZxL8PRLGqVfrU+bOQycgmCjH?=
 =?us-ascii?Q?ZISSVCwbgX+L7gUf1iY0c/UcgK5u3X44SuNc32F4vb9SJFfFTSG3asbgD5xp?=
 =?us-ascii?Q?j07k3MIriv7LH5nSphPu4FprFOJuldYfCmj1+4mj0zkaI92SJtX0iI/urF+K?=
 =?us-ascii?Q?vJbkSRyINf66tZMuV3JyculE+p/DaTJnEowV+8bh/B827voR16UdG0vy7xzv?=
 =?us-ascii?Q?e+oVKFsKrO7NYS7kq19WiNoUi09IumyR+yHz+B82UL7w+cg0zgiWzykn/8dG?=
 =?us-ascii?Q?r+AppL/6dpeH2wJvL1TPEkgqnbp7LW1TeDesx2l8msKJivjdDl/L2XEMf6QT?=
 =?us-ascii?Q?iGqZor3ljOWl8XhLRwoxz2uVWmHu3y3wmMOPuJbRi9KptQwZ5Lm7zVwFTPlo?=
 =?us-ascii?Q?gzs89kXGxcpVet7fjAt59esqPf9WBZh3rx8PMzbR+hGJMI5538xDia2wkkde?=
 =?us-ascii?Q?8VNQUTPZD8ENSlgi6QE/1PoK5ATGghnHKNP0HNexq7Id/s7NpmCyEsND0EoC?=
 =?us-ascii?Q?7zt/UjZFDdfGCKP1Th8XjzxUWTYEKHgGXuB91bG756O6aUnIY5s3vdKmRqKc?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 093f266b-a4ce-44ef-4328-08dc394813ea
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Feb 2024 17:01:31.5797 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oDcOoqa3kLxEsMULtk0iqW0Nf5GWdmUdhDDUpBGJoKlLpT6wbeqGaOlyfBpOzTJMImn/gzk1b/UhvAMqBQHFUa/bYDduJvUj5Us3ksl0bIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7947
X-OriginatorOrg: intel.com
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

On Thu, Feb 29, 2024 at 12:07:01PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Wednesday, 28 February 2024 23:31:33 CET Lucas De Marchi wrote:
>> vsnprintf() should receive the buffer size as argument, here called `len`,
>> including the trailing '\0'. There was truncation if the return is "size
>> or more". In this second call to vsnprintf() the value should be exactly
>> the same as in the first call, otherwise something really unexpected
>> happened.
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 2997925e5..a1ff5655d 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -529,8 +529,8 @@ int igt_sysfs_vprintf(int dir, const char *attr, const
>char *fmt, va_list ap)
>>  			goto end;
>>  		}
>>
>> -		ret = vsnprintf(buf, ret, fmt, ap);
>> -		if (igt_debug_on(ret > len)) {
>> +		ret = vsnprintf(buf, len, fmt, ap);
>
>Oh, so I missed that we didn't use the len variable, initialized with a
>calculated value of required buffer length, when allocating that buffer --
>good catch.  OTOH, since we then pass the buffer to a function that doesn't
>care for a terminating null char, a buffer of ret length, with no room for
>that terminating null char, should be sufficient.  But anyway, let's request
>that extra byte so the code is less confusing.
>
>> +		if (igt_debug_on(ret != len - 1)) {
>
>OK, let's also take care of strict consistency of the result with that from
>the initial vsnprintf().
>
>But then, the len variable is really needed only for that comparison with the
>new result  The required size of the buffer doesn't need to be calculated from
>ret as ret + 1 in advance, only just when passing it as an argument to
>malloc().  Under such circumstances, wouldn't that be more clear if we changed
>semantics of len to always carry an initially detected length of the data to
>be printed, not the required buffer length, and then compare it directly with
>the new result, without recalculating that initial value back from the buffer
>length?

this patch only fixes the bug. Path 4 is already reworking this to make
it prettier, which afaiu includes this reasoning, with len always being
the length of the string, not mixed with buffer size.

Lucas De Marchi

>
>Thanks,
>Janusz
>
>>  			ret = -EINVAL;
>>  			goto free_buf;
>>  		}
>>
>
>
>
>
