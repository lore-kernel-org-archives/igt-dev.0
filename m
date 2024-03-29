Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D68C6FD1F
	for <igt-dev@archiver.kernel.org>; Fri, 29 Mar 2024 05:16:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B84210E52F;
	Fri, 29 Mar 2024 05:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Nj3G4UhK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C683710E52F
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2024 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711689361; x=1743225361;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PuwlqPKRfZNZsRnPQTXLcXjkIkNg2re967kqSG4pyZQ=;
 b=Nj3G4UhKm+Lzb9tMZCkQS7TUA0Wf3zg0cT2xRX3zVEF0/nXSu6ACl3kB
 aFfh454knJkei31+O5NNVBIYF+7OArGh7EnaA8naaM7StjnWgFHd8HpBB
 okYN5RZWPy+g8cG2KSP2mOFsM3g1pFqfE4GUlOpy+z2vjpV7IrbzIlDgu
 c/IX5xrCmkHjFfYBcQ+XDrcTHt3vXSb9a71oMEqY9Yv89pMzTmgWcPhHq
 ck0daqeq3qjTF48vzUbVxOz2ZdYA+b8YDkbTdC4Tt5dy8JYq+YYUVJKS8
 jz0auD0Qu55cIx8NVuis72sYoyggCmVYaqLZKqGkAfqBPMFeWGN+Zbnpw g==;
X-CSE-ConnectionGUID: lRJk5PQXQhaJhPiEvbLihQ==
X-CSE-MsgGUID: 6XkvCkiZT6Cp4eXJB89VdQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="18022053"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="18022053"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 22:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; d="scan'208";a="21523251"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 22:15:44 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:15:42 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 22:15:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 22:15:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 22:15:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=janLQt8D3EBcwWZ1gkK+XocojTqUtQlr5BtToILH8ksxBEs3jM2s82f0/CdHAe71KpWHFdhdhM8jPBJMQrmUGu9M6KfJiBCJIrWC2JIzAYkV0qBLCaPuM/BQ75rB7sOZeJ9iMWwLwbTjojlEt3tztenyeDTReKAqk6E97n/YbSjsae1vOwVQJSzMmspnstiHZtpxt1PsjziYZIz49VzQFjhW17fclAIAka+yhbDuVQeY/midO9HqKI6Y1V1qcJhANSbqS1Gvi52cIbcjP0VWDf9d0w2uw+bizmPopProFjcktRIndk/iAwC67I0o+cWFzyDQSGD9Rx31pLlRs6jJiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yq11OdnXiChySH+iDQNy7yvtAiUJPMmtWR5g3cX6o+s=;
 b=ketmzee345kxH8J1vmEp/1AzpbzfTFYoA3kIglAzboSHYJGKYjQCbWCT8U1cX9yfvIyc2jrqX03YuampfwUmfp05JUP+R4NFuMl1aieeBeajrMg8yJixWwhfR2K6vqc/vaKgj4vMxhEoPXP6eVGgrZ8AKmGUAcTdLv6Dhe44dn3Qj1j4hQrKFH92eBhLdsF04dpmIZJjTydsWS1BOfdl88s0Fq6KGf1JLhLUA0fU5ji5yvk97hndFz5sATP4uawAElAAD18215UXgZ2jGqJ3pkWWmjsA1ncflbDYiE5+f0zCBgMzBBam1BGi9pUJ5av+gcP44amazsrXvEwkXybQfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CO1PR11MB4977.namprd11.prod.outlook.com (2603:10b6:303:6d::14)
 by PH7PR11MB7985.namprd11.prod.outlook.com (2603:10b6:510:240::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Fri, 29 Mar
 2024 05:15:39 +0000
Received: from CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d]) by CO1PR11MB4977.namprd11.prod.outlook.com
 ([fe80::a2d7:1d52:5a1c:88d%4]) with mapi id 15.20.7409.031; Fri, 29 Mar 2024
 05:15:39 +0000
Message-ID: <2cbcd814-3bad-4665-9dcc-dd23d64533a4@intel.com>
Date: Thu, 28 Mar 2024 22:15:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/2] lib/intel_blt: Add helper function to ensure
 platform supports compression
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <cover.1711729399.git.akshata.jahagirdar@intel.com>
 <6e857ec4a881f64a2cce7b3ec84cd4e1d74a55f3.1711729400.git.akshata.jahagirdar@intel.com>
 <20240329050132.myk23se7d22cude6@zkempczy-mobl2>
From: "Jahagirdar, Akshata" <akshata.jahagirdar@intel.com>
In-Reply-To: <20240329050132.myk23se7d22cude6@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P222CA0028.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::33) To CO1PR11MB4977.namprd11.prod.outlook.com
 (2603:10b6:303:6d::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4977:EE_|PH7PR11MB7985:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PF+VlCLxsk/XKKlF4ejWXxZUq9UvOnx5XewgzvsDPUAhEnGwwcheoC1VMozk9fJd38yL0/PI3MBMmBB8knKHfX1k8Zfp8SH7ktBCTZ8Z9BO4C/WPnMbORMJD7Nb+vQWBajVoJAmh76KqEYcb0pzpt5pqLfRVyo0izoTWf8D8HbsRm5/ROpdSLwT0j8pWVzIEiTlODcBKJ9jZ8hiusyWm2s2+pYU9vrXbVwbnSw+0C5iXG3NmvA+bNJuGXSbT6hA418MGFfXZD2Ig4M0kyhz0cX3JpdDOfiFpbDnLGL0uATbRM+SE4imwrkivNtyTk49HyrjBWiaNW5c56eaNxmvXXVWtocynQLXKkv5gVrgeRbHjeidkIXb92VleND2ol9Uka/LUIosWFHGq++dVG+XhW1IhP3iErK+OXw3dbs2DIVzDzyQ/CS1Q4y3/P+R1cCeTqML4gqoDXHgaDnAtEE47Lc8tDlCrB78kz/eVu7VIBvPIFpskFn1CKx2VwBxobwXVX9oyq8q0ldbVlAuVNYG9k9L+3qTy98ZJDty8fOH4HRnZbtSs7MjtV9BoD4YU5BOzTHKEP5cN4IZJh1v03cv83OghncxqkpH9Uk53i2Dnka6SRxbMVu+707Fq9TsZPPaSRUZMzBE8w1bMJg7o+LV7Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4977.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djgwUGZDUG1VUmNybW5OaUJEVnYzY055RmViaEV4eTdWaU5uMEg2eGcvb01D?=
 =?utf-8?B?RVdjblgwUmIxbStheDUrN0VzclVORWN3SGlGd0xBSVRiTkY0WHduMWoxVkpL?=
 =?utf-8?B?bjJDTS9YQjNzR2YvZHJJM2x4bjRlZ002d2hEeWhQZHlLVXJwSEVUZ2hlQy9K?=
 =?utf-8?B?OE1hMU00M0x1WVhNTXVPNE5nbmdsMElocmdrZEgrZGFsUkZnV0Q0MzY0ZUtL?=
 =?utf-8?B?cW1VM09OU3ZuY0FpZDBnWHRGK3BSc1JyWmdsaFJaaGFqanF2WUdhc2IrWDJl?=
 =?utf-8?B?OXlSM1A5UmxleVJ4WFJjaTBBK05uS2Fhc2NYOFVIR084SWhqcmRjUEJNVFQz?=
 =?utf-8?B?ZWNtVktTeElGQmVKOWZaT21lNTJtNEtKOHR5eUE0UUVnR2twbThJN284SG9m?=
 =?utf-8?B?ZDlwbG90N25aZ29oMlhNRTZMSWpiYnZ3TGtBNmpmWDlsZlNjUUpEcjd4WDd5?=
 =?utf-8?B?ZFhxVmVZNXNLOXRpZUQ2UzZwallFVEJOMmpRMkpVTVFuRVlHUVFzZEhkZGo5?=
 =?utf-8?B?cWlkSG5neHVqUDdGZXNkd2h4QlUrM3d0L3dRbjRtOVNCZkx6azk0dlhmb2x2?=
 =?utf-8?B?STQra1Jlb0JaRHQ5bStRV2hqWUtDVys2QVg2dWlFV2NObnlYMHIyMUNrNmgr?=
 =?utf-8?B?ZTc2MnhmRDFwZzRFTU9ETkRHNHhUZDBTTUUyVFBOU0JwdDFYdEw5cUJ5b0U2?=
 =?utf-8?B?aFRxR21pd2RvNHcwMnlMbjJ3cFU5MytuTFV6Zm9EZ2JkQ2R3R3ZDOUVvMzVS?=
 =?utf-8?B?R0tFbURsbXFvcU1UMlM0MHhXbUprb09pUldlb1czY2M0OFhxUjZSQTkrYm5N?=
 =?utf-8?B?SERZZnpFdk9ySGM3SUNOQXB1d25XWXR6bEN5L2QzWmhSRkRrUndnWkpIdzRO?=
 =?utf-8?B?R2JLNnlYaXQ3Mk5zamR1U3FLT3VLYkhJeHprSE1GV2RUbDNuSHBpOWh5b2dL?=
 =?utf-8?B?RDlLTmFrRERHWW9HOVpLTllPd0FIblFZS3FGOTFkbEJIdGYxdGhIbjloL0I1?=
 =?utf-8?B?bitXejVsRmE4WU1jY2l4UjRSNHNZUG5wUHJFSGN4ZHV6V3NRbmdreDh4Y2dG?=
 =?utf-8?B?T0lpeHhpTE4vMlBqdEVmMHFLby9xVWZkTGJyVUtGajVyY1U3Tk1UNGRtMCtu?=
 =?utf-8?B?K0gyRVF0ZDBkOHZSbGFDQ2tXdmZYWGpwWFZsMVRrVFBvSmI0WGIwbVM4Q0Za?=
 =?utf-8?B?YmFCcFNHUWRoYjRRVU5SbTJpeTlJUExtczVNTk92Sm5IYzczNnJBLzRGb3dv?=
 =?utf-8?B?bEtKbVc1VmU5aXkyQ3BnT3dKL3RJa3graDdZbjNYMHZSNnVUUlVPMU1IbGpj?=
 =?utf-8?B?UHI4NTI5Wm1DOWlsOUdEQ0o0VnNEbjhsQm16eUlCK3UxRnpwVGJZWUwrdCtJ?=
 =?utf-8?B?L2NIVS8waUc0N1NIVkRpMURrZ0t4eXFNN2Znc2NaclBCMjMvWGdCUjJlamFy?=
 =?utf-8?B?cVl4ODVySE5kc1J2Q3h4MnRwMmxvQjcyb3ZlM0gwL3RnLzNKa0FITFNXclNp?=
 =?utf-8?B?bmNmWTRNbml3cXZlbmZuRDlKL0NaWnRaVHVQSmtzN1Z6OFNSZlRsc0haZTVL?=
 =?utf-8?B?Njg3djBDQnlaRXFDRHZIR0x3WEx3UDZqNStuZG05UXlxZnd4RTg1NGlUbW1G?=
 =?utf-8?B?RllVNXd2ZUl5bE93SW9vVHNQaHhlWWIwdzJjMVFQVlEwSGtqM1Z2cituQ0N0?=
 =?utf-8?B?a0dvY2J5MGY0RW4ybUtGZWgwOFJBSThYUm1oM0xnKzVzbm9JSDNWYkF6RDl5?=
 =?utf-8?B?ZVUrUGU4aExvUGt0MmFPUmZFS0JVNmNYTml4bUtMQ2ZzZFdpTzNpaXFCOHlP?=
 =?utf-8?B?cGIwQzV5enBkdzFQVXJKK01ISUNPTFZ5L0ZVRGpsUjgxdk16RldudjB1TXEv?=
 =?utf-8?B?dGF4Sm9GM1JqdVVZSU45ZDk2QUZBTTR6ZDVHY2VFbThyN3p3aE5yZ1JRSzhF?=
 =?utf-8?B?dm11TVVYUEt3djdMT0I1WDRlNjBVb3VJaC9qSndaZU5mYU9SVzBlZVJ6Y3cy?=
 =?utf-8?B?ZWVpcUhLWGg4QlpiRDJNTzc0ZXEveVpVQnNMZDZSS0l2WkJ4VHdXS2w2TklK?=
 =?utf-8?B?eGNEWXF1TFZ5enp6WEN2dDRKV0pjQVJ2YzJla0phMjJJYlk4b2wxUi80Y055?=
 =?utf-8?B?aFFYWkxoSjNkQmJGRXc5SEVTZTM4UzJ0QVJNNG1WajJibHBkZWI4MFcxZHF2?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fb71ae-c902-4466-76b7-08dc4faf4637
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4977.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2024 05:15:39.6607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0KC6B8WQRowjl7bPOFOfF1QlXcsgnw7IC9JLMA8KTO5AkuBCiWciinR0i6TiE3kOHu+5bb95SE7qDDcpF0lukPrm6cRP/RiAbj7A91gWgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7985
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


On 3/28/2024 10:01 PM, Zbigniew Kempczyński wrote:
> On Fri, Mar 29, 2024 at 09:30:12AM -0700, Akshata Jahagirdar wrote:
>> Add helper function to check if platform has flat-ccs enabled  by
>> reading from debugfs entry.
>>
>> Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
>> ---
>>   lib/intel_blt.c | 14 ++++++++++++++
>>   lib/intel_blt.h |  1 +
>>   2 files changed, 15 insertions(+)
>>
>> diff --git a/lib/intel_blt.c b/lib/intel_blt.c
>> index fe0a45cb8..0e569c5a2 100644
>> --- a/lib/intel_blt.c
>> +++ b/lib/intel_blt.c
>> @@ -464,6 +464,20 @@ bool blt_block_copy_supports_compression(int fd)
>>   				    BLT_CMD_SUPPORTS_COMPRESSION);
>>   }
>>   
>> +/**
>> + * blt_platform_supports_compression
>> + * @fd: drm fd
>> + *
>> + * Check if platform provided by @fd device supports compression.
>> + *
>> + * Returns:
>> + * true if it does, false otherwise.
>> + */
>> +bool blt_platform_supports_compression(int fd)
>> +{
>> +	return igt_debugfs_search(fd, "info", "has_flat_ccs yes");
>> +}
> I would use 'blt_platform_has_flat_ccs_enabled' as the function name, as
> this describes BIOS may have disabled it. Same I would update comment
> because platform may support compression but it is not enabled.
>
> --
> Zbigniew

Got it, will update it! Thank you for your review.

Best,

Akshata

>> +
>>   /**
>>    * blt_uses_extended_block_copy
>>    * @fd: drm fd
>> diff --git a/lib/intel_blt.h b/lib/intel_blt.h
>> index 1f6c71359..a2c4a4adb 100644
>> --- a/lib/intel_blt.h
>> +++ b/lib/intel_blt.h
>> @@ -209,6 +209,7 @@ bool blt_fast_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>>   bool blt_block_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>>   bool blt_xy_src_copy_supports_tiling(int fd, enum blt_tiling_type tiling);
>>   bool blt_block_copy_supports_compression(int fd);
>> +bool blt_platform_supports_compression(int fd);
>>   bool blt_uses_extended_block_copy(int fd);
>>   
>>   const char *blt_tiling_name(enum blt_tiling_type tiling);
>> -- 
>> 2.34.1
>>
