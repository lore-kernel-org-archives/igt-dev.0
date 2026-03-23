Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42BE1EC01B4
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 09:41:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED56F10E0B6;
	Mon, 23 Mar 2026 09:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8C5X0CH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C516810E0B6
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774258881; x=1805794881;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XkvxzUjb3cVdbWhtzgdeJB6V/zLrm2/H124AxpuJLBc=;
 b=a8C5X0CHWl7MwXBhC7nlOs5N9TWdm7yFvIc1Ld974OWfCedyec85e6LJ
 Qwef+4rcG/YwlDNHexFt628I9bXLMlHWbaCThc9xee8mq1kbSNHKDj4Db
 oz7TstGP8GRzBwg28T4L5JC6H7/u5ZmpxonmPMs1cR3y62hM/ziqrvAm/
 ZCFGJVFX5pGEJEFkvIM/EZTFJ5ZT3Dtn9lhHALNKK7juGCrdmg7fcKxcK
 NyoJAtDTKTH1v5lXNLy3QHUAC173rLVUucz7kWtxYqdtWyJkgiQctG1kF
 a5R/fDRMv9sxiX7iYjVUxiujDrAFyTtN8ISdEybzuRCZjhqkxpbfBXtcn g==;
X-CSE-ConnectionGUID: QV5IcCH0St2H1G0n6ZlE/A==
X-CSE-MsgGUID: V9Q6pC+aTGuw3bpmbXZoNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="92631732"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="92631732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:41:21 -0700
X-CSE-ConnectionGUID: Mx7nD04bSPyGSpqnjrc4SA==
X-CSE-MsgGUID: VJD/PUXKTWm7/FxHOmdz6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="228444021"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 02:41:20 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:41:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 02:41:19 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.32)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 02:41:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dV9PZj8jD2+WDQNu5zqW0wdAvcdymC7FBKFetV7KlzecaEZ6P00jQqqkGEyHBNcR2MUMHLRXMVuSHLd7W+pZNIf0d/WVCYaOh9jxvxpTQXBCcUMdV+PlFX5aKk8HizkFdiRITHA3eIVdTb83LG9DwPJ0bYoD4pdMNQ5/3HSvMuLybWQPLKvC+kcFgqqthgqdpTjQm+j+TmWQ59e18bfQTgO953K92LQbPCkyutlLX+VqyFQXZWL16uTWbhVgAhThetkVzCANmjWIEuT72thE1RkuwwOqG0ZSAh/Ki2ETh4j2uMgqyX7PudU5NkCzcXCBDs11mcXdZeG2TmTqgxyU5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QJobZtKsADF9GEl++hZ0v1JmTLkA4OsY3OukU2qPs0=;
 b=g9PotQ/rmsTncQXIz+qepLpxYNOI756GVo2/gTT6jWH2FBOB1OUHHejZpnSFRRJ3dmgyCHP7tteBN7SY2kpAsTVW+kq78u4YODEvr50z06p/QVlexj2UZNV32FtZjd12xcnhHuEZKILnFEUDiTwtqDmoHmlkNQCGqEDGv7pap4wc1TP/+5hVCn6AeE5E3S1VS3DEYPrydipKqAxUf5Nd71FzH17OMEStQAUFLAzVMod1dzB7nV73zosls+41xXbJXzSbapnUccucttLqqHGL3OAMexSiSlVGgdjBDtQYr5M8pyk6fMx5c7/XW0YRK7+nqenTo1m/lBzr+3mcsrq/FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by DS0PR11MB8161.namprd11.prod.outlook.com (2603:10b6:8:164::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 09:41:16 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 09:41:15 +0000
Message-ID: <e9e96a80-5a0f-4aad-8b29-e5ff9fd09ddb@intel.com>
Date: Mon, 23 Mar 2026 15:11:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_pm_residency: Fix suspend duration
 calculation
To: Jani Nikula <jani.nikula@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <raag.jadav@intel.com>,
 <soham.purkait@intel.com>, <mallesh.koujalagi@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20260323070228.1383377-2-sk.anirban@intel.com>
 <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <a59e6c3b70eccfa43a5902bb089f9e799b1df68a@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d0::16) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|DS0PR11MB8161:EE_
X-MS-Office365-Filtering-Correlation-Id: 97e6b61f-4181-49ea-6d98-08de88c053d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: rbvR4udIUfqdbRNcCv77SpfdzZlhLvdadSDOT98C3Zypr+Tn8AU/CVcjnn2uR6y0Jks0Zk1dyEbLMf3VAlFX+3QU6f6XaDd8qR6UNXQpjnGvaZ+aEtvf/+/bwUEbrILIQzhNGyE/N8skzLBfRNwV5BGpepM1LrqTpIQBq/bagpqs+TrCzhMAdG4lLCYAWJLPGvG9hT3uikHTZgOWrdqylD0ymPLMkUHEDzmaIZ5gg0mBxOYfZ2XVgikKkGOUzMgfnhfjYloxzYg3M9p6zvSiWbqVWJI8DCcSfMNc7boxyCvO+hC/gOi0KKQSww53hCd+cFO/r7Qg4Y3f/3uojQqTkYkVbRqi8TWscA6GPbkyo4IX3RfdRaI9NLIh4Y51bujEEm43yWwnnPIjGePsz/1L1PbgHCRQGysKxMlVwy58XMiBFkK42VGi2tvghuFLoJh7Sbbu4Vm4V4pOW0FBR+BttWCc+uxcQpT6YaAUQlVECVmnN1vz17Sao9/WmU/GNSe0ksICut+Sm9sZeRhneCez8pj/S3MfdLm75SCtHUTNJpcg9RJYuExDMU1CnfjqB+fLLzZId09URs2jwfZI44N513cd+zQA3FDlmITaUrRWFQ4G55CzhYK52qLy7gb08E6mUvccZI+MfAlysICBpLcLhCfz6WgtdIdqpL5S37QLpBI0+YpQ+A35yCsUsXM6To6ERYAeuzaRZ/4K+5eQCN1J+Pg24l69eBjWDNE/kaqmtL8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2ZxTk1WTmF5VkxiTm5XTzJqWkJSZFJIS2IrYzd1dHlUZ25uTjdNdDQ2UGpi?=
 =?utf-8?B?OHQ4aG1JM3oycGp3S2FTWDE1b1JKb2lIUDR5VWtmcXV0ZXNwMklRTjFSSHhC?=
 =?utf-8?B?TjlxVnloMEUvckVvd1ltZWc2bjlTN2o1ZTVldWUwcHNNbkFveGxFYjlLU2FB?=
 =?utf-8?B?RjRBaFczZFMyYXdzRndnYm1Ddnp3M05aWWZHM1dVY3dSU243alNySWp3Q3Jo?=
 =?utf-8?B?V2cwRUVya1JIU1RZby95d0pOR2FUaEpBZGNEWU8rL25sUVlzcUpheHlheTJN?=
 =?utf-8?B?cWIyeTRFOW8zVDBBT2cvcjMwM05ycldnMUh4am5LSmswMlM0bFJKUkt2YjdN?=
 =?utf-8?B?YlFITXVrcUFVZGRUOUd5dHp1b3ZVM2lZUVNIWUtEVVp2dlZOaFBxbjJjQ3U3?=
 =?utf-8?B?WVF5cG9JZEI0ckk0VlFWbnd3OUo5Q2NFUmp3eGg3SHlXbElNQXkwUCs3Wm9Z?=
 =?utf-8?B?aGpZTVB6T1VKMG8rL1BEd2dUaG9vZkVpVlRiUFpobXdxV09JUmIwZ1lMYU13?=
 =?utf-8?B?WCtzcHI2MFpkUDh1MEhXenZPbUM3N2VtcWh6dFkxODVzL1d0Q2NQYkd2dmU2?=
 =?utf-8?B?VEo0SzJIZ29DTmt0TktGRmdhOTB1VWJ5Q0x3K3lzZ21EdHpvNEUwTldLemsr?=
 =?utf-8?B?YWRGelNWZHdWdVRrSVFlcE10RURaMTdrcEI3UmRBcm8vazNlazNpbmpNZEto?=
 =?utf-8?B?bWZrenJnbHY4SEZGNlFQTXV3ZXpDMTMvVS81RFQ5YkhyN3VOM25TWWdOSjZT?=
 =?utf-8?B?TzJhcEdEa0l4eXp6OEYwOFJucGxxcXl1UWdqVWh6YkJPNHAvYVhWaUhqUWZu?=
 =?utf-8?B?Nm82MXVnTnhzRmlib2VvS2I3VVFuVDVsbitiN2NhQ3luVkF2dVp6YWU1R3JS?=
 =?utf-8?B?a01hMHA3bTNEbm9NamJjWXNqQjJzUkxwTXZaQWd0Q2c5dU81eC8ra1lBcXVP?=
 =?utf-8?B?TGJMVmREb2RtSlB6dWtrV1FiVjhOUkhYT0gzckp5aE5nNDJkbXVvZkhPQWlT?=
 =?utf-8?B?YVZUZ2JsaWIvOGNwRUowR25HaGxMV1dPNnFUdFFpRU5VOGFvVVl4YlFDdWI1?=
 =?utf-8?B?bGl3NEF4aTJ4WjVCR082TGFFVkxQaW9OTmpqSkcwckxvay96Rm5Md0FNVFA2?=
 =?utf-8?B?aDArcHFIRkt0eE5rUEhLUFAyYy9SUTFoQURSMHNadTd3TE81YS9IZnZMM3Vw?=
 =?utf-8?B?dTJuYVVKK29HVnBsbmlxWlpNRFQyUnlxU1p1R3hqSkxvQmlreU44MlZuUy9w?=
 =?utf-8?B?TlIzNEcrYUNOL0p4a1djVWQ2MWlyakJucjN0QkRPOENMdHFtY0RNZzc1UGVZ?=
 =?utf-8?B?Ym9UTFk3YVNTY0pJSWNjUU5NaTcrMzZjZEZvSmxrcXBmd3J6TlFUeUt4aDdO?=
 =?utf-8?B?dFN5Y3djMkVaU1ZZUUhxd1pQblh3WEthTVdDZDh0SFh2bHFTc0JjL2hCaWhK?=
 =?utf-8?B?MUpsaDVhdmthbXVpcVZEOG9jMCt0bnVNTXp2TUtoUWF6SXVFSmV3anJFRjhO?=
 =?utf-8?B?TnI4azdKRDFId2JxeldiT0RjdXpWdkY5RUhmdTJ4dDhHUHFnMVBldWM0SkRP?=
 =?utf-8?B?TjVHcEZ6SndGUTRmSVA1cUNwd2wrVk42eDNHMlhKcXlrd0F4ZDcrcXE2Uksy?=
 =?utf-8?B?bG9QTGZsWlgyNmtzV01Cbm1zNWxKMXJxdWtURVYwSnRCcEZNaGZicWhVNkpN?=
 =?utf-8?B?SnhGV0tZTXFnRXhLVy9nRXVoV0JDVHhvdTNWUUxHbitTSi9lbVAwOTFGVlpG?=
 =?utf-8?B?bUx4RXNIUkJILy94eVVHZUN4bGIxdjFkNTRMMDQzdDNtOHM2VWJWVjZBNkNS?=
 =?utf-8?B?SkRGczhpeUl5RHhRbDlQMjMxRTVVT3M2NUVmWUoxSmRrcUx4dksreEpLK2Np?=
 =?utf-8?B?NXJlUmhuNXFUTFhPN21EN0pIdERYTWlRVXRwNzZzUngwNHllSDc5UXpyTHF3?=
 =?utf-8?B?V2ZNZ3R6QnFlWWIxVnZhM1AvaGk3RFZXTExwQUZEcHRHd3BndVUzV0xNK250?=
 =?utf-8?B?TElZdVI5VS9SeERGU3FJanJsTzJnZ3JqemVWakg3V0g4aFoxK082MlRhWDhl?=
 =?utf-8?B?Y1pnMUliUGY4TDg2bldIcEdOV1Y1ZE9LdDhsTms3dTBrdVRQcStFVEJSeGtq?=
 =?utf-8?B?RDZoSmtnclJZQmVvQzRqeHcyT0NqeXgxQ2kvN05LYmVKL0tja2psTlQ0Ui9M?=
 =?utf-8?B?YzdvTEhZbXQ0aWRkZCtuVWJMTFRVb3RXYlhCV0xhUnVpL3JkU0x1c0wvbWlv?=
 =?utf-8?B?M2YrTjR2eE9CdTlPRFNxYW5nS3lsQ3pRVFVJYmRQblJURDA0NzJZK1JVNzNU?=
 =?utf-8?B?MFZCSHpiRkRaUnkvNTJVdXdCU29URHlNK0M1K0FIaTVldTJpRU15dz09?=
X-Exchange-RoutingPolicyChecked: udpKCx95VloY7Jto6YOcIrUM2030x4WFMMREjSEK5A32lv3GLkdoNBxUxwDskMRUyC1BBEUQewmusBgHSNlUnyzpGZ24w9DY689mZ6PjKCPkSFgaWPJEMMgIWTob0wu7rY0eozRt9vjqrs8+GkXKt4e9FaEXaZ/gIsxWSPGfkvG3oFD4G7UAAce+YpQeTkNrH1w7NIGX0INFI0KVlWxKuXpX2+CiiPn69Twz3niR82aApTQNWgVSF+kK4q3Z5I9UUVgLypEDro4Iy9fJCZoBXdovf+UAoy8Um/83HuYY6Qh6F03sY8KI3oklPkyKPpxrqkKTK0vbN7/jN34d/6GBGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 97e6b61f-4181-49ea-6d98-08de88c053d0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 09:41:15.8014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8MrIimMhkU6ZkvfYwsR8npr0gEM8jpnajd7RIt8AOx2WchAx9zzrdsnyFSkI+NKK+iyCy8kQMAmTYOGm+SD/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8161
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

Hi,

On 23-03-2026 03:00 pm, Jani Nikula wrote:
> On Mon, 23 Mar 2026, Sk Anirban <sk.anirban@intel.com> wrote:
>> Fix the unit mismatch caused by interpreting seconds as milliseconds
>> during suspend duration calculations. Apply MSEC_PER_SEC multiplier
>> to ensure correct unit handling.
>>
> Fixes: ?
The change is a part of test gap which is filed internally.

Thanks,

Anirban

>
>> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
>> ---
>>   tests/intel/xe_pm_residency.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
>> index 61b63ed4f..46718a444 100644
>> --- a/tests/intel/xe_pm_residency.c
>> +++ b/tests/intel/xe_pm_residency.c
>> @@ -223,7 +223,7 @@ static void test_idle_residency(int fd, int gt, enum test_type flag)
>>   		 * elapsed time during suspend is approximately equal to autoresume delay
>>   		 * when a full suspend cycle(SUSPEND_TEST_NONE) is used.
>>   		 */
>> -		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE);
>> +		elapsed_ms = igt_get_autoresume_delay(SUSPEND_STATE_FREEZE) * MSEC_PER_SEC;
>>   		residency_start = read_idle_residency(fd, gt);
>>   		igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
>>   		residency_end = read_idle_residency(fd, gt);
