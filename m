Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7ADC47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 15:55:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A88010E039;
	Wed, 28 Feb 2024 15:55:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lVsGbcqk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A8610E039
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 15:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709135712; x=1740671712;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sHlgpFb3uSrlVWSLyeiU/rBVjpGfQ686UBjIjwtER6o=;
 b=lVsGbcqk5JPvGB69N7XJ8oNhIP6BlHZRQ/OHBFERpIIJ7h25FIcBGRxO
 ejaWUGfNiehutEqqT6UQ+GqiGkRxEc5oQSab85r+iMoc5KrQoqjTAMRO6
 Vjgp/p5/ekGtbBwMqOxMiknr4Uzq8UgvtPciAP6gHH8X0g70592SU8ZqX
 b178oRfpFpY5u9rYEFjY+YBf4+/jRvvl3mxY3Iz7x2nqmS48eLlYuI9rz
 op5rnNwLBhKKwXCNnXnFWL6F18GwsgRCAbYuh4fyzzGy/S/eBtPX4w2ze
 DFXathHK54sAkjntuMJORZvafBCpJjM4qHsmUA0Psh4upMQl/0a3IC/FV Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3661342"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3661342"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; d="scan'208";a="38496449"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Feb 2024 07:55:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:55:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 07:55:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 07:55:10 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 28 Feb 2024 07:55:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gRtbp1DK/xIxcYpwYnWlWUHvRkOpfMR8+JxLh+ZQ3aXjnGDx3IJlfN5T7tRNPc5kMbs7UYyrOCPc2y/ioHUOcw59z45mrLTw5KBvnl+Z2yUyzrOskChazZLwOKt4DkZe0AkOccvZsEDxJskZdh2s+weSHxlhVgyvKuCAyoJNmneVoKmwEBS6bw+LnYXyRgaDKU2xGiXo5JQYwy49LFnhbOOPudF7O4ZJysp3RjnymEMh30lx6aE9PxjSau35rdzU/lo04IiXJzn4wdB3l/Kp1S8AJPuMtceIv/K6keDBXXRLrYfFz1o/xoARDUhC5GzA2XFnj+xg6wo8mkvq185o4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YoU3M4GGz3TPOV05mZr6bpkAvj4K67Mws0NFAs4f+3w=;
 b=eGR9BWPllysDnJjMhHPTOUyHQTpT/8W0Jqp8mX+ng6ibkpM1DpU24N7cA9k0P2uGQXKWlL6xWdBjASUlUZamclAvtv9Rovwxxn3LJudETEpP6Ac0xQ0JLia892ZyU1odtcMzuUcXOE+BKrZ2IvtgUttf56FdUM0zXttUDgGXWQH3v4suLh4nNkGFdpLWNpw34xvVCMbGKOFRTJERVazHT7RFybNTlJT7zAsSLCn8ru26FIpom+WrOhqZl9/aUMNFQkUdPUgcTRhzC+ElePj3PULBl3/4p97bELu2aO8XD/eKPGLWdk+WTd74pojCyWMoI+rgX94ZqeVPfYKNRkYfxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB6446.namprd11.prod.outlook.com (2603:10b6:8:c5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.22; Wed, 28 Feb
 2024 15:55:02 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Wed, 28 Feb 2024
 15:55:02 +0000
Date: Wed, 28 Feb 2024 09:54:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t v3 3/3] lib/igt_sysfs: make sure to write empty
 strings
Message-ID: <3ciefsqutvjv2b32gdd57fm2pcqkt3ht2uzlkzbk6xqsevfndo@4j5bzgsku4ue>
References: <20240228063211.3662862-1-lucas.demarchi@intel.com>
 <20240228063211.3662862-3-lucas.demarchi@intel.com>
 <4978543.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4978543.0VBMTVartN@jkrzyszt-mobl2.ger.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0360.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: 504ac4ea-b02d-4a51-6849-08dc38759f7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+zQZfu8Ehcr31IEUofyA8GJXsspw7Vp8yNbbeTa+YImx+cmCrInRvqB9XG4XZOvh4ZUjTn5Hcm/Yvo/lXW2VNQBs85EAa1gdasRHVEA3FE0eMvsLXnyZQ2EOYdh0tGcpnycrmQd1WO4zrzJTNDBIFrZAnEOUbei1HZJzNpF85Ir4lVeWrM/mrdqbTF8K8M7DsxPZAlgsfZPkBxn7U6DX7u2eenMtINGIXhEk/XY/MIlW3A9NCgxkLxQTDp4TU3JNsrblQbOXf+iO9yS7LwXksqGLtGtTtD5sZIXIAU4NY/YRWGYJMSZp21KJoztQhxMzYPy1pdB6nnQ5BbBZUaZP58Vpbin5edZ6ryoArDD8h2B7jkBBfF1m7nIrwq0ApSDIpVwMcMmQJZDXVPrdP6Tw5ljAtK7yJ863dksc3cvs+YoLJPxCQzEKYC3LjUz1cDxUR10+wLlViyfY3o8llUx+aRdiu0OPl3DuEGU4K4FT+GV6ulabElftrT10utuguxb/rRHf67rrbEI0gAyfucJx2bK15s7cJ9yzY9m/XWBJj2m5tmeOA0Z+EJL+9hwGxyXwyJx7Y2OJezLB3Ah5cHXXKnP1MPN3anyklOG4jhd56DT1Gv+ko0/xNzYCvWsVYmT13tEkOg1xI2Ktlr8PS44htTsuq3G8WGYLq5p+7eVI5M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWtub0pMaUVXSVdBNGczMFVMVjdlYmpZdWtVNENDWTlicWdONXBpdjNrNzFj?=
 =?utf-8?B?YkIvbXZRR3NhcmtRMmV3dUJMNHc2Y2ZuMDM3VDV4amRBZFc2SXExWkNnR0NX?=
 =?utf-8?B?YXpFVzR6WUU1WEJzR2pwWHpORXAwY3pJeERnT1Z4TmxIS2dnTkJrL0gvVFU5?=
 =?utf-8?B?VzladC9RcUhjZGoyTEhVdGNsb2psMVZSUnZHUGxUSGp6cXpZZXFsSmxmR2N6?=
 =?utf-8?B?Rm8rOVBGazZvbzMzRzlobmRBL2grMDlBaTdsM2UrcXBOekdiYVhDMG5naHdL?=
 =?utf-8?B?Um1sWU0vdnlLUDFsTG1BRWhCWVVNWWtlRDRucmJmTzB2VllxZXBJUlhyVzBt?=
 =?utf-8?B?ZkZidklIZjhuUmZoMXZGRDFGUXl0SzU5SmdjbnNKNUpFNzdYSmNTaDg3WUNk?=
 =?utf-8?B?b2lzV0NGYXVOczV4M3crT0Y5SVZ3YlJyTTNPaUg4UllNbkRRVVhFbWQzTEtm?=
 =?utf-8?B?bVErWWNyWS8yTjhsY1EwZjZ5REhlQi9uZFlXUlcxbWhhSWZsZ2NLYUFiYWpP?=
 =?utf-8?B?OHF3bGIveGcxUTdKOThwb3JpVURCZXlHMWE1NkpOc1VFVUY5dFp0OE1iZE5J?=
 =?utf-8?B?MkhKelR3MG40ejVHejVBVThzMDduMk03ZS9GWGFLOUwwMlBpTkVxN3l4a1NE?=
 =?utf-8?B?d2Rvd1hjUmNNN0t4K2UxTXRWMEg5clBmWFhLMDNxQVdGb1dyMkNCNDQ0YVlI?=
 =?utf-8?B?K0lvYUkzelltVzdhVGVBRW1yUFJMOFVqRHlYOE1YVFdIa2NaNmhqcG1QRUtI?=
 =?utf-8?B?bm5IMEdOMmpHTkZWYWg4NFBIVEJzVVBXTWlUalR4b1R5T3ZyejJYYjJkYmJv?=
 =?utf-8?B?a0kwT0gvd2RqUHVDVDRQZSsyaXN3TVE1aTFjUkpPNk1OM1ZxWDNyTjRPejlv?=
 =?utf-8?B?c2haMlRXN3pBSDdrVUR0ZFNSUG9sc2pHcEJ6aHlWNmc1L1pVUjNkRU0zSEov?=
 =?utf-8?B?dEJCZnBpUDVqK05YMDNWSjJzYVdFQk9RYUlFNS9kOHRxRE5iZVhzZGpycVp2?=
 =?utf-8?B?Zm1yWVlRNEJPQXludGtaaFFZNi9TQlRFRWpIMmR4NW8zWldBYXVJYmtkTDNV?=
 =?utf-8?B?QnRuOExUa3UvT3djdnV1RnpPSjlORHhBQTRRTjNtZTBvdHE4QnVLNU91YnVk?=
 =?utf-8?B?L3VZbTNFVXQvTzBhcXQ3QTVGWU16azN4OThqdTcxRG5LdDhEbHhQUE16eDFp?=
 =?utf-8?B?cFMzUW91b0RkN3kyakhIRzFJQThBS2FrdSt1K0NjSFpxbWN3ZWZLVTE2NEdR?=
 =?utf-8?B?cENMS2M4MklrUTR5eHVYSTNtTitrSUt6WmNLY3lNR2ovYU9qczg1clZ2UUZU?=
 =?utf-8?B?c3JWN2RnM0xCNlc4eWdsTVVuOFU5dU04eldkdCtzNTlCM3NtMGxWMC9nRE1P?=
 =?utf-8?B?QlFzQnkzRE9lSXlZYWpoVzQrNkZKRzd4VU5VWWhhby9RdXVuRVdiK3gxOHBY?=
 =?utf-8?B?VGkzZnRIb3RsN2pWS0VBaUR2Nmh4ZTBoMm9rZmxPcTUvNWxvOU5UMFVLZVpG?=
 =?utf-8?B?MllxTENSR3JZTThQVjI0M242UUtvZk14YkJ2VTdESlpwRmtzVjJvc2Vjbk9R?=
 =?utf-8?B?Q1hWNXVkdnFTSXAyOCtZdEZ4UWpTa3ZDQm1SbHlqRTBpdFd4aW5LYnVrb09i?=
 =?utf-8?B?YlE0SlJjRjBpd0ZPaDlMTENnSlFoaGI1TVpMcUY5ZGhORm5Ca0VMRTU2ZGtJ?=
 =?utf-8?B?TDJ2K3M2aDh5OHh1ZG5sZk9uNmFNRFpxNHNvS2ZsU1dnY3pxZzRLaGJsSFo0?=
 =?utf-8?B?ek5zM0VuZ2JjemZzMnczbC9lWWxMWmhIT1dTLytSWTNIVXN6WFl4bmVVNUNv?=
 =?utf-8?B?K0hsb0s3L2FQaWZPQ2xQRGY2QmZyVk1yaERoZ0hhejhzNTZMd2FWcjNmOHBo?=
 =?utf-8?B?SlJ2YWJDTnE0M1E2d3Q2TUtrWEpVNVRNYnhLV0MwZm9MakdDVjcxU1piaVZi?=
 =?utf-8?B?YUtseGtKVEZleDVOREs1ZDVDR2doQkdRZlQvdHVqWDl4dkl2WldLNlhNekVw?=
 =?utf-8?B?VUJIOXArNWpIa0FNZzFhTCtORU1BUFVnRU5iRkp6OThpLy9teGZUQVVucG5H?=
 =?utf-8?B?WUQvMTBnS0JWck9vdkFCWjlsbUJ6b0l6cWVrQU5kdnRScUc1cUxoOFpKMG1G?=
 =?utf-8?B?WUN3QVoyVFlFaDMwZ1Vsd1FacDZITVR3aUxWeEZQMklDNG1IMUdCUWs2b3JQ?=
 =?utf-8?B?V1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 504ac4ea-b02d-4a51-6849-08dc38759f7a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 15:55:01.9617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ZxQqS2+lAnotwz04lJjlsIRbP5RCjJgujNQ84aJFtBhvjC60FfGpwnDpLNBfssHb1tt1GK2PHkJ7nKkeCUZP4DedcRXQhQwHtqG4DZAahk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6446
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

On Wed, Feb 28, 2024 at 12:13:22PM +0100, Janusz Krzysztofik wrote:
>Hi Lucas,
>
>On Wednesday, 28 February 2024 07:32:11 CET Lucas De Marchi wrote:
>> echo -n "" > /sys/module/<modulename>/parameters/<param>
>>
>> doesn't really work as it will just create a open() + close() expecting
>> the file to be truncated. The same issue happens with igt as it will
>> stop writing when there are 0 chars to write. Special case the empty
>> string so it always write a '\0' and make sure igt_sysfs_set() accounts
>> for the extra null char.
>>
>> Shell example:
>> 	# echo -n "/foo" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# echo -n "" > /sys/module/firmware_class/parameters/path
>> 	/foo
>> 	# # make sure to actually write a \0:
>> 	echo -ne "\0" > /sys/module/firmware_class/parameters/path
>> 	# cat /sys/module/firmware_class/parameters/path
>>
>> Same thing happens when testing igt_sysfs_set():
>>        int dirfd = open("/sys/module/firmware_class/parameters", O_RDONLY);
>>        igt_sysfs_set(dirfd, "path", "");
>>
>> Previously it was not really setting the param.
>>
>> v2:
>>   - Fix return code from igt_sysfs_vprintf() to differentiate between
>>     writing 1 or 0 chars (Janusz)
>>   - Document the behavior of igt_sysfs_set() as being a higher-level
>>     than igt_sysfs_write().
>> v3:
>>   - Partial "back to v1": include the \0 in the write only when writing
>>     an empty string: there are some files in sysfs like pm_test that
>>     don't like
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  lib/igt_sysfs.c | 33 +++++++++++++++++++++++++++++----
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
>> index 2997925e5..2d574cc17 100644
>> --- a/lib/igt_sysfs.c
>> +++ b/lib/igt_sysfs.c
>> @@ -349,6 +349,9 @@ int igt_sysfs_get_num_gt(int device)
>>   * @len: the length to write
>>   *
>>   * This writes @len bytes from @data to the sysfs file.
>> + * Contrary to igt_sysfs_set(), this does not automatically add a null char to
>
>Should now read something like "this does not automatically write a null char
>if len is 0", I believe.
>
>> + * terminate the data. It's caller responsibility to pass the right len
>> + * according to the data being written.
>>   *
>>   * Returns:
>>   * The number of bytes written, or -errno on error.
>> @@ -407,6 +410,14 @@ int igt_sysfs_read(int dir, const char *attr, void *data, int len)
>>  bool igt_sysfs_set(int dir, const char *attr, const char *value)
>>  {
>>  	int len = strlen(value);
>> +
>> +	/*
>> +	 * Always write at least 1 char, the null byte, otherwise it
>> +	 * won't write anything on sysfs.
>> +	 */
>> +	if (!len)
>> +		len = 1;
>> +
>>  	return igt_sysfs_write(dir, attr, value, len) == len;
>>  }
>>
>> @@ -506,7 +517,7 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  {
>>  	char stack[128], *buf = stack;
>>  	va_list tmp;
>> -	int ret, fd;
>> +	int ret, fd, len;
>>
>>  	fd = openat(dir, attr, O_WRONLY);
>>  	if (igt_debug_on(fd < 0))
>> @@ -520,8 +531,18 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  		goto end;
>>  	}
>>
>> -	if (ret > sizeof(stack)) {
>> -		unsigned int len = ret + 1;
>> +	if (!ret) {
>> +		/*
>> +		 * Make sure to always issue a write() syscall, even if writing
>> +		 * an empty string, otherwise values in sysfs like module
>> +		 * parameters don't really get overwritten.  vsnprintf()
>> +		 * guarantees to return a \0 terminated string, so just add
>> +		 * that char. The return code is still the same as before, to
>> +		 * abstract that from caller.
>> +		 */
>> +		len = 1;
>> +	} else if (ret > sizeof(stack)) {
>> +		len = ret + 1;
>>
>>  		buf = malloc(len);
>>  		if (igt_debug_on(!buf)) {
>> @@ -536,7 +557,11 @@ int igt_sysfs_vprintf(int dir, const char *attr, const char *fmt, va_list ap)
>>  		}
>>  	}
>>
>> -	ret = igt_writen(fd, buf, ret);
>> +	ret = igt_writen(fd, buf, len);
>> +
>> +	/* Caller shouldn't know about special sysfs handling, just return 0 */
>> +	if (ret == 1 && buf[0] == '\0')
>> +		ret = 0;
>
>Hmm, now we no longer support writing data with null character embedded at
>position 0.

why not?

igt_sysfs_vprintf(fd, "foo", "") will cause vsnprintf() to return 0.
igt_sysfs_vprintf(fd, "foo", "\0") will cause vsnprintf() to return 0.
[1]

which is also true for both if tried like

	foo_val = "\0";
	igt_sysfs_vprintf(fd, "foo", "%s", foo_val);

Is this what you are trying to differentiate or did I misunderstand?

there's no difference from printf/snprintf point of view, so expecting a
return > 0 when appending \0 would be wrong.
( Could also be considered bad code to use *printf() family of function
to any constant string )

The patch seems to already handle that correctly and return 0 like snprintf()
would as far as I can see.


Lucas De Marchi

[ 1 ]
	#include <stdio.h>

	char buf[10];

	int main(int argc, const char *argv[])
	{
		int ret;
		char *foo_val = "";
		char *foo_val2 = "\0";
		char *foo_val3 = "\0test";

		ret = snprintf(buf, sizeof(buf), "");
		printf("ret=%d\n", ret);

		ret = snprintf(buf, sizeof(buf), "\0");
		printf("ret=%d\n", ret);

		ret = snprintf(buf, sizeof(buf), "\0\0\0");
		printf("ret=%d\n", ret);

		ret = snprintf(buf, sizeof(buf), "%s", foo_val);
		printf("ret=%d\n", ret);

		ret = snprintf(buf, sizeof(buf), "%s", foo_val2);
		printf("ret=%d\n", ret);

		ret = snprintf(buf, sizeof(buf), "%s", foo_val3);
		printf("ret=%d\n", ret);

		return 0;
	}

	$ /tmp/a
	ret=0
	ret=0
	ret=0
	ret=0
	ret=0
	ret=0

btw, clang also warns by default about using printf like that:

	$ clang -o /tmp/a /tmp/a.c && /tmp/a
	/tmp/a.c:15:36: warning: format string contains '\0' within the string body [-Wformat]
		ret = snprintf(buf, sizeof(buf), "\0");
						 ~^~~
	/tmp/a.c:18:36: warning: format string contains '\0' within the string body [-Wformat]
		ret = snprintf(buf, sizeof(buf), "\0\0\0");
						 ~^~~~~~~
	2 warnings generated.


and gcc with -Wall goes a little bit further and also warns on the
empty string.
	/tmp/a.c: In function ‘main’:
	/tmp/a.c:12:42: warning: zero-length gnu_printf format string [-Wformat-zero-length]
	   12 |         ret = snprintf(buf, sizeof(buf), "");
	      |                                          ^~
	/tmp/a.c:15:43: warning: embedded ‘\0’ in format [-Wformat-contains-nul]
	   15 |         ret = snprintf(buf, sizeof(buf), "\0");
	      |                                           ^~
	/tmp/a.c:18:43: warning: embedded ‘\0’ in format [-Wformat-contains-nul]
	   18 |         ret = snprintf(buf, sizeof(buf), "\0\0\0");
	      |  

Lucas De Marchi

>
>How about keeping the original length of the resulting string in len?
>Seems easy to get with your code slightly modified:
>
>
> -	if (ret > sizeof(stack)) {
> -		unsigned int len = ret + 1;
>++	len = ret;
> + 	if (!ret)
> +		/*
> +		 * Make sure to always issue a write() syscall, even if writing
> +		 * an empty string, otherwise values in sysfs like module
> +		 * parameters don't really get overwritten.  vsnprintf()
> +		 * guarantees to return a \0 terminated string, so just add
> +		 * that char. The return code is still the same as before, to
> +		 * abstract that from caller.
> +		 */
> +		ret = 1;
> +	} else if (ret > sizeof(stack)) {
>-+		len = ret + 1;
>-
>- 		buf = malloc(len);
>+-
>+- 		buf = malloc(len);
>++ 		buf = malloc(len + 1);
>  		if (igt_debug_on(!buf)) {
>+ 			ret = -ENOMEM;
>+ 			goto end;
>+ 		}
>+
>+ 		ret = vsnprintf(buf, ret, fmt, ap);
>+-		if (igt_debug_on(ret > len)) {
>++		if (igt_debug_on(ret > len + 1)) {
>+ 			ret = -EINVAL;
>+ 			goto free_buf;
>+ 		}
>
>and then:
>
>  	}
>
>--	ret = igt_writen(fd, buf, ret);
>-+	ret = igt_writen(fd, buf, len);
>+ 	ret = igt_writen(fd, buf, ret);
> +
> +	/* Caller shouldn't know about special sysfs handling, just return 0 */
>-+	if (ret == 1 && buf[0] == '\0')
>++	if (!len && ret == 1)
> +		ret = 0;
>
>Thanks,
>Janusz
>
>
>>
>>  free_buf:
>>  	if (buf != stack)
>>
>
>
>
>
