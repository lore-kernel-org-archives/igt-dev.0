Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D551FF60D8
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 07:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2140610E88C;
	Tue, 31 Mar 2026 07:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dd128BLR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE8C10E88C
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 07:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774941782; x=1806477782;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2eZoD8tiCjceFAv/21giAVyBTf8nCuep8kiuzIF5cGY=;
 b=dd128BLRpAA9sbLHNQt/fgfXlH8iOHBWX7RUWFGp4mqBiOL4tR7Ya/L7
 6TuBCft/wwobZO/Sh5RWSRoiiNOnC/HHLlX9qhLF/m0J523m3Fr0WBjWy
 P8n4/9MPtob1lx6ESmOngMsW0Ahjp12bbVk1Jp/4nTPW3Js0XykPKfoV7
 1pUwTQMCYxPHysjKuB6Ka2zq8xJr0YHSMH25C6hHMjC9L+hnqust33p6Q
 dtVnpvt6WRK2zr69eFbbAOSFR4sgoVAKqTn+ewmVuFih/wOlhVqj/IfUx
 UC8GTHgT5/PfB9aa+3fwd2S+Uby1il1yk8C8cjJ2rWUomXWdUO577DVY6 Q==;
X-CSE-ConnectionGUID: Ou7lANeETGCkyouG8ikwXg==
X-CSE-MsgGUID: 0W3IgFimTTOrM2mQf5KCdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="93328770"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="93328770"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:23:01 -0700
X-CSE-ConnectionGUID: g8jAFay9Ry2Z/LsyvCFRGg==
X-CSE-MsgGUID: 4JxfntIDQjCyk2Ar3Wuk1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; d="scan'208";a="230742942"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2026 00:23:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:23:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 31 Mar 2026 00:23:00 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.63) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 31 Mar 2026 00:22:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCnZz/CICimH6i5Mb0QEZIkJ7K6vS0gVkAeS8821dqbIYjA+EkKRItU7p7mHLpmixPiuRkSwiq2FctI6xrCoJwGNjc77LEdHVACaC9WJeropEgtVs6AiT1XxzCLr5WvbKC6pQc3bLEKUbLdzZNDE2JphXvrSJzpusqneMt0u9+meOb0XLG4ft7ebSxKoAYS0i893P3pkYBDYjJlTH6OpUetwEEYSsYliXY1zHDw/LsrfB4KIFiRhiKLN3gty1YoEkn/ouzPjNle1uTZtx16k+fdu6ciE+kwbaDcDGnnyeksLs5uYzczDzQK6tWEf/nCiCqwKBY6wvc0+u6ytByTLIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWLwV8KLQRSAO4fHWJdaajseoUuwhsrNYNuopr0d4cs=;
 b=Y7M1I9SzFBtVRc05fgTDfr8clOSvhL8rWDsSdgnb25wZAf/GAITXNtg68VPy3QXIAWq/NGSM6p5GWwLwH9ZxpY1UepvyIlMB5xfyi70W81/j5gosOxUfOguedG6DPw29V/E7CKg1LOwLUmG7EpDp41y42i3P0tZFx3FsY8ohtmB0GkcwUQvfspcHq/QY/B9ye2M1eCpsnpkVh8VARgYCnLAIcSnEabXycfH6vsGWhXi8rXG5f41FEwpSzVPgpPTZm9qseoNSYqoDKcZ891vU7ykwwf3XBX7fXktyUobBEkSoJjaTnyqwIM5xkZf0TIuOcIsaKs3/GjcgSEOolD72rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 PH7PR11MB6329.namprd11.prod.outlook.com (2603:10b6:510:1ff::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.15; Tue, 31 Mar 2026 07:22:54 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::89e3:7ceb:6511:dd36%4]) with mapi id 15.20.9769.014; Tue, 31 Mar 2026
 07:22:54 +0000
Message-ID: <c186c0e0-7324-4ca8-9be3-ea259385e07a@intel.com>
Date: Tue, 31 Mar 2026 12:52:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_fbc_dirty_rect: check the plane
 size before fbc dirty rect tests
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
References: <20260326072555.160329-1-vinod.govindapillai@intel.com>
 <20260326072555.160329-5-vinod.govindapillai@intel.com>
 <dffdb94b-fa11-4381-8249-983edfa4d99a@intel.com>
 <d391a0cc1f238aa4f665e09e0c3782039e53030b.camel@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <d391a0cc1f238aa4f665e09e0c3782039e53030b.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|PH7PR11MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 80cfd286-2480-483a-8f4b-08de8ef65315
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: oAozakPGeJ0FJmMnGgGvXvwOp68FYKEikJXpWIebEmf+P3F4jVghfY/w3sePGuUAn8cB3SuTZwvL8et9ayVwtkRUovcATeFffg8KczXNkzM7EKz4yZim4mr1QMfLk6Rs5tYZ3BVOowcsgKgq00S8y5R3Lem7TTd26JHKX1qwEVvFzEyeSQ6+S34mLeVRWUBDmSnXx9TSiE91r/SszKzPbdgIs6Z2j1bDAHHyESI7/5+1nJFAh3UgCyzRBG6lZ8kIMSufxgVb3piad1yKoeyNunU+sawPGV66dP35QO+9MMcdyE3FEPZSSyuVHPEwriO5siYNpIEwu20e6DQ7EwOAY+up26HJCed19aoYi9yuUHGCKQqqfp5Ag0O25QauV4a14lxNoDTH8jTFR0k372JLhyn5R2KoQOVsvQhFExe3Zyc1qGmWqkPlxzUgAROXnzsk0JIrfCey/4Q5HlUED4U5CrHARw5B/iVVeHHE/dAqmw0BRTs9HmA5xPFpxJF2AFwDxTyBQ/r4wct0tsoOlZjDKV9de6okHRxPtmI7PwqP+muIA5PUTDT7kBKcVDAgf6c8IgHT0q+cMa3i6w/USfLzlj4+nr9cmcLeU9D9B8JJXbNd+loh0ENJxjzzPGMBLNLpOwKJ7uP1Vi9ae6qG4Ht0vU2XzGrj9A1i9LJSjg3T17xWVupWLe+EwH970lCPiqSvKXbbxrYvgcXa/emCjyK4RLLCOKY/8lBiUF/tLCz4nG8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blRzb2piajJIMEFHNDNmb0J5aWdaQWx0OHo4YTdZVmNqWDVYaWhnT3h1Yk1D?=
 =?utf-8?B?WmptOHdJRDd6K1A1ZktVbHlTSjNGOFdDSHpLVGdSbk9LNVJ4UHV5dEoyaTJh?=
 =?utf-8?B?d2ljRytob1NnYlltN2xlanhueUQ4aXB3cHUzd2hGRE5Ed0xiNStMOEt0a3dK?=
 =?utf-8?B?TGNENitkUVNCVDAxb3gxMHV6czkyQktGZlR2OEx5SmQzMzZ3d0pVcUEwU2Fy?=
 =?utf-8?B?anJwUmdQRzNVcktlK2RGQm4za1NVMm9GakRhK1pjZGw2Q0E2cTZJaGdvNkow?=
 =?utf-8?B?Y2dCN3gzK21ZTFJ6TWlqZnU5M3JpLytuRUFIa1VYUkhFODhGYlhBUzkwMit3?=
 =?utf-8?B?ellHNEdVYmRxemwxbDhsdWdZWVZ0czcwZVJaMGtvYm0weEFLM3kxNHpUK1Az?=
 =?utf-8?B?d09jVTl4azBzMmlDMXlKcE1NcEVQcGhoUEVoOVdBNkVURTFrWmdLU3Q0VTJ2?=
 =?utf-8?B?ZlJMNFo4VW53QlU3bFg2d2o0cFpnb3pPOTArclJBa0JsYVRxWUNqYmhka0Ru?=
 =?utf-8?B?M3R3Vnl4N3VJMlNwR1pRdXJ1YUJSbnAyR3k5ZkJOc0RLcFRVVXJkMVEzMmc0?=
 =?utf-8?B?bzJrN0dIdXl5cGE4M3dLLzhGOENIRFg4cXBMWVZ3MkdvNi9jaStTR1JXYnIw?=
 =?utf-8?B?MHpSeFVjeENoMWN6b3F1eG1STGJwbndaSXFQaFByK1NxSUh3eXlQajBvNTNL?=
 =?utf-8?B?RUpkT2pqSURmUlgrTHdhWUFVU0hUU1g1dDFWM1ViYWRHa0FROVhOdG1Da3dT?=
 =?utf-8?B?eFlRSkhHTTZPTCtTWU1CZWtYS040VnFmN2lNUXorZ2lpTUFkek54aHBvdm5t?=
 =?utf-8?B?WkxXSkFTd09rREpneFZnTkI4ZCtDRW05UjBocmhxRGloYjl6L28yVlNPNFlV?=
 =?utf-8?B?WitrZFVQL2ZLNmNIZmluSW9kSjhCdTZtTVJBMk1PRzgzMGsydFZqb3V4UmNF?=
 =?utf-8?B?NjhFWFZtMk5xNlhGbTBIWjFrTGFVVHlkS2VtQm1IZU1DV3Fqd2JCdk5nSmFo?=
 =?utf-8?B?YTd3MWdEbi94aXZPaTlqQmhWeWx0RGlSZFdGcU0rWGhEUUtXQmxqV1BPSVhU?=
 =?utf-8?B?bFlLK3BjR24rZndtZjNjWGU3TEQ5WXg1cnZVeENrNU1ld2VXNjFEVC9uVUZX?=
 =?utf-8?B?N1p6U2JjeUJDNzZxY290QmJwREVNdG53cmNOSDdDYUlrNFBNSlNpVmdhd1hY?=
 =?utf-8?B?RmZndStUNXRac0J5eVkyc0EyN3ZKMTJvN1NoVU5ETW1wWTRmWGJtV0ROQnRN?=
 =?utf-8?B?bmwyOWZwSW5BQVNlMjFGWUNBMnpTYnUrbFNDbnFaMTdEUWpIOFY3QWd3UGhF?=
 =?utf-8?B?a0pPNjJ4dHFUVjVOaCsrQjk2Yi9MdU5zOVc1UzZBWVBoVytkb29BQkllZlVy?=
 =?utf-8?B?R25uN3BETzRyWjBLdzZDTytHVzdPNGQwd3h4L29HOVlJQ3NMLzVMNkJiN2oz?=
 =?utf-8?B?K1N6YWlkYk8zRWkrbHVKN252MHFrWVJQTHF0TDhKRXFCZG0zVjdHbkZCbU13?=
 =?utf-8?B?eTF2c29GT0JTUjczd0cyelM0UTZNRVRLZXRjMmUvVDJhd2ZsYm5SL25zWnVr?=
 =?utf-8?B?eWJjc2Z5OWYrcEt3RUV4RHNMNnFkVW9hd0dnKzEvbzE3OERhQWZVdjNOMmNE?=
 =?utf-8?B?ZnlqZFYvZXlEb01ydEtlbnFaVmlKNWJLSnhmaUF1aXA2YnU3N2RUNExWWGZY?=
 =?utf-8?B?akNKNlplSS8weFJHcWl6S3B5ZTdaUzRVNXdtdDExSXVPdGZ1ajFZMWNNa1A4?=
 =?utf-8?B?Y3VTUlBrZEVnL0N2V016OHAwSVMrVk9GNGdSQ1UvaWJGeGRPOW9JOEVYRTRr?=
 =?utf-8?B?L3BoMW9KTFpRcm1wbFRkbEhoMmh0NHFqdU1rL25Tb1dEUXlzRTBCMzFiT2RG?=
 =?utf-8?B?dzh4cUNtNk9mdnlhTERMNTlhR09xQkdmdU4wYVpoWVdKU1NjTXMvSDRsNDVY?=
 =?utf-8?B?dFE2c2NZL0VsS1AxbHF0WWN0Q3IvRmViRy9xU0poenJ3TE5PcGZPbGVrNith?=
 =?utf-8?B?MXZDejE4anF2M0VKSGFlMGdzN1NlclcrOTRuZVUvbDZ3RWswTlQrMjhkTjVo?=
 =?utf-8?B?ajRyWm9wa2M0T2hmaE95Wkg0dzJnbjN4RUxURlI1Vm82SXMwSjl0Z2IvQzBl?=
 =?utf-8?B?bGllWnU4dXlYbGsvTGhRKy9MVmVObjZ0VTd5UTBnT0NBbnFSdksvc2x3dU5j?=
 =?utf-8?B?VHIwVFNwQThNVC9QaDdaOE9IUWNiTTJrRUQxQThWVGJvVksxRWllandBMThM?=
 =?utf-8?B?dFY2NEJsV04zUmxJS3RITHI5enJ4WFg1WTRqUzFwM0JjTnRNbEdiMGwvY25C?=
 =?utf-8?B?cGo2eFhGMGtYeHNHTkYzTWozTXlaaXJMMUEyTXNlUURieUdRNlNjR0tiUUJj?=
 =?utf-8?Q?tcbz6FqrEDOih0XQ=3D?=
X-Exchange-RoutingPolicyChecked: lZVmIfRQ/OXShu6BjX6BbeKzbL45xvEJtyCGJSj4JQH15xa/FMzppCqY3brckrnUiJwSvmtjURHOGVXBOHuZeX0bJDygiGrCWL9p5golR8e3po+qx47JJAVbdviYmLRY843qeSfjpM1yBzfP2go5RUfbPMWPeCrepKzRq7xqvWEVELdh+WjqVEV6o+I6kn+LGuD7rxlStLFvzUMqd9ZNMY1cHBaaNW2ZBrn40OdJnBjVb+J8Xq5yCUcNEqGzaAs45Z7YMVJsx39CRhGa5nHfgTnaTbpiNpIfNjrgYRHaIJLe0/cgkp2oyk18nyLmHxfyuoJw1XOg+3vv4rSjoZkAnA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 80cfd286-2480-483a-8f4b-08de8ef65315
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:22:54.1663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NXj1M45doMcT4yGf1qSgvzjIcIQgk4nFt7BzkmS79+k6+18SARj6D4MMEqWunBoXTaBjMnFndzrrkwGfN9NeXJZ2+T1nTnvlxYHCdNpdMEZpqzdpQfr5+Q2e5cGcD3Rj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6329
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



On 27-03-2026 13:41, Govindapillai, Vinod wrote:
> On Fri, 2026-03-27 at 10:35 +0530, Reddy Guddati, Santhosh wrote:
>> Hi Vinod,
>>
>> On 26-03-2026 12:55, Vinod Govindapillai wrote:
>>> If the FBC cannot support the plan size, skip the tests
>>>
>> %s/plan/plane
>>> Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
>>> ---
>>>    tests/intel/kms_fbc_dirty_rect.c | 19 +++++++++++++++++--
>>>    1 file changed, 17 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/intel/kms_fbc_dirty_rect.c
>>> b/tests/intel/kms_fbc_dirty_rect.c
>>> index efbd46985..ee13e95dd 100644
>>> --- a/tests/intel/kms_fbc_dirty_rect.c
>>> +++ b/tests/intel/kms_fbc_dirty_rect.c
>>> @@ -401,6 +401,22 @@ static void cleanup(data_t *data)
>>>    	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>>>    }
>>>    
>>> +static bool check_fbc_supported(data_t *data)
>>> +{
>>> +	if (!intel_fbc_supported(data->crtc)) {
>>> +		igt_info("FBC not supported by the chipset on
>>> pipe\n");
>>> +		return false;
>>> +	}
>>> +
>>> +	if (!intel_fbc_plane_size_supported(&data->display, data-
>>>> mode->hdisplay,
>>> +					    data->mode->vdisplay))
>>> {
>>> +		igt_info("Plane size not supported as per FBC size
>>> restrictions\n");
>>> +		return false;
>>> +	}
>>> +
>>> +	return true;
>>> +}
>>> +
>>>    static bool prepare_test(data_t *data)
>>>    {
>>>    	igt_display_reset(&data->display);
>>> @@ -411,8 +427,7 @@ static bool prepare_test(data_t *data)
>>>    	data->pipe_crc = igt_crtc_crc_new(data->crtc,
>>>    					
>>> IGT_PIPE_CRC_SOURCE_AUTO);
>>>    
>>> -	igt_require_f(intel_fbc_supported(data->crtc),
>>> -		      "FBC not supported by the chipset on
>>> pipe\n");
>>> +	igt_require_f(check_fbc_supported(data), "FBC is not
>>> supported with this configuration\n");
>>>    
>> Since the change in fbc dirty rectangle is independent of other
>> changes
>> in the series and imho this can be a split as separate patch from
>> blocking it.
> 
> Yes. No dependency to other patches in this series. If this can be RB-
> ed with that typo fixed in the commit message, only this patch could be
> cherry-picked and merge and fix the typo at the merge time? I guess no
> need to resend only this patch again with typo fixed and waste CI. I
> don't have commit rights. Could you pls do that.
> 
> thanks
> Vinod

This change LGTM. I will merge these changes with typo fix.
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>


Regards,
Santhosh
> 
>>
>> Regards,
>> Santhosh
>>>    	if (psr_sink_support(data->drm_fd, data->debugfs_fd,
>>> PSR_MODE_1, NULL) ||
>>>    	    psr_sink_support(data->drm_fd, data->debugfs_fd,
>>> PSR_MODE_2, NULL) ||
>>
> 

