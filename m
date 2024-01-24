Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A828C46CD2
	for <igt-dev@archiver.kernel.org>; Wed, 24 Jan 2024 08:16:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFC710F652;
	Wed, 24 Jan 2024 08:16:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8029C10F652
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Jan 2024 08:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706084203; x=1737620203;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=okuQ8SfMvsm0PDHVHQUCTsq2zs//YhgdKuZYQntQdI8=;
 b=dIPvj2uTqxhkaHFebXYXFu+AXnkgIHwBVroAAKnl8WruC0j14MmOkj5L
 AwoETleTXjRxt27m2tPnJgEVpify7btlrwmokZwIRDq1P9a3tBhb0V7Ts
 VosQFY7JmfZOp64kLThkHdiqDx/0SCs/HO8upRFIyZJTUw4j6lAG/j/Xg
 K/JNMNCwiN7NBLvBTC1i0zxY8le3ABrcS9qUEY1iYKF9OOEIFpULlqzSX
 Kd1aLvNFTzQHEf0z1pUqFvwpw4hkqO5wCZCx+K+RmEJqVH4ELfmqHpASC
 b6mnmmyYgS1bo5OszvUbkCEbii290DXZ7wQMix7+X+ShGSf0s2BYwzA9/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="1652561"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1652561"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 00:16:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1896368"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 00:16:42 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 00:16:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 00:16:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 00:16:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHCwFQMJk7ZIhI61fWUYON53WpxKe71s7QLGcVAFlp06tsTM2eDsiZtVhqMxkQCki523W3ODkfJqT2cWVG0/VRTcvtwQT/QyESYWDcdTHH5YVAXDtUqUQxK4sb1UF7JamFqxOAv3S9qqWOBru9nYyncTi34qD+AEgLXCjRjHzxmvF8qULTwDWhfXV4d5riMg3hqEFypqUb6JtnBE+ATXBUhuDR8b8gqymUi2S4QEnPnv3qj78rz19PFHuImrl+7W8J3LYQ/e9UEG+o4JpqIQ0tvHleISIbox0eof1oV1FEoFa5gGc15K+WOR7q8bQp2gjCCBNSIkLBKPWHLd5ZjE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9EzVO79y9Y6oJZFHB50bwqscEr1eNnzeVb0Mj+9YFQQ=;
 b=D7v+YmOmIRWBEEvOQS7tHOYMtR2bh13Iz7LaKCZf9a2NuG8YdDGKPO8UfZ4XBXyRV1mYbnuGYlLYi090b/IxXp/Weg/nyXtYFZBuEcuZhfnnPBU6UdYKWSxpL/M4xb9d6nhIDDJ7L36zPwQI9Vh7kUM45/DwsI1XNMpeS5oVTL6dX/pE7bhx9GbKC61JfXASEHH7uo6sLlYHraPH+LH3Q0KyJSOKLO1UvSc5aPy2fo/7uVkuKYL2NQ6msPGOr8tjyAJaIH1K1zzR2SAwUxK8MXklNs9DNF54FH0qLMOXtn3cRudzOxnfjRx6D0F3HTuudLy7tE9OmRjxwHt7ZFYctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 MW5PR11MB5787.namprd11.prod.outlook.com (2603:10b6:303:192::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.36; Wed, 24 Jan 2024 08:16:37 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::ef1e:146:d198:adbb%3]) with mapi id 15.20.7202.035; Wed, 24 Jan 2024
 08:16:37 +0000
Message-ID: <e736cb2e-7f86-4da1-bc0b-6ab3e01b1cca@intel.com>
Date: Wed, 24 Jan 2024 13:46:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, "Gupta, Anshuman" <anshuman.gupta@intel.com>
References: <20240109131802.2624834-1-bhanuprakash.modem@intel.com>
 <20240117111256.yb7fs23zrr36xvtl@kamilkon-desk.igk.intel.com>
 <d9621791-8a6e-4cb0-8da3-7d03bf328761@intel.com>
 <CY5PR11MB62118F52982F03F5F42AA42295712@CY5PR11MB6211.namprd11.prod.outlook.com>
 <20240119133229.lmnfwqrkdbo4nahq@kamilkon-desk.igk.intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240119133229.lmnfwqrkdbo4nahq@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::9) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|MW5PR11MB5787:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a44b2a4-7a3f-4458-401c-08dc1cb4c91a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDukhNFcvx6Q+vdZr69af46OP0XenRpZK8er37zlJ+tIT5Y7Q1Ku8SCynFMoMHf4aqXHXrXLhGpRr0NuAiEdIWLeKsBT1Msk13wcdJeHitfCf75NuwshAico6WfjzgC0cD7zGHl0hGmiFDR5FeJVwY4v2NR3toaeko7SfgM8R/dZ38z2ldmMxglMsIDrv17XjsjyXvjw2agXOPfw00SBgNgavrOm471BQT3FxMqOZ2Bqwn6QsFwzRBiEPg7Zwu82OX8qUWXeJmfRY/GZ4V/fsNBbpls0ZmvvFrWQoaZWVP0IJFZOM0l7Xt9AW1g3+YfEtb5Td6tkkAD/Tt7QKrB2P+iaA/9MBeBHC3bpUEgkvL+8SBXTdQWAsPTaNITqKvfJ63iEq5KvCKNtjcj8IKWgHbGStVKvFrIC1NTgnteG6KqsSD2f4W/yV2dH0bmMW+EKx9tAuJoCxDChQY7FWMWMdLqPSu5inZkCkzJRfSLhWDOe3fZ0c3PQ1klXgXde4xzGW75YlEHF9b3OQuheOtpOGCPC25VVHEy5/0mpJSX9IwlALM9L9tERdBZqegz9z28ZlT8urhdo2LgTX/pDPv2TB3KnrbXR56QXfkaqmUTz+IViYBVg5Jbn9dSBDakhqlf8s1hHXaN8sPqfTLJP+iXqe6QFvj0pU5puwJ1pR0XoQgD0BW6HSMyMciYzCMOK0qrc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(136003)(376002)(39860400002)(230922051799003)(230173577357003)(230273577357003)(186009)(451199024)(1800799012)(64100799003)(83380400001)(6636002)(8936002)(8676002)(31696002)(478600001)(66556008)(66476007)(66946007)(2616005)(86362001)(110136005)(316002)(6486002)(6666004)(5660300002)(26005)(2906002)(36756003)(6506007)(6512007)(53546011)(31686004)(41300700001)(82960400001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2V0ZW9ISW9qam9nYURodDRLanI5bWFPWnBjMjFGZlhZVGlJeEtwVkJsWThq?=
 =?utf-8?B?WFJuWVZnVGRpdDFSa3dQcDJUVVpDc3VDZk9LQXVBNFZqbmc0SG5kSWNtcWtQ?=
 =?utf-8?B?RG1TL29vck5KVlJsN3Q2aUtGaks4MktMUEErRVBDOUc0eTROSmhRaDRqb1d1?=
 =?utf-8?B?RzZDU1dCVmE0YzZkMTdWdEtEQXBZb0hLNi95SUZudFFxUXNaQUVDSjFmN2Yw?=
 =?utf-8?B?R0NnK2hNN1kvUDhFSHQ5dFU2VDVmM2pUTUc3K0VOd0FZVWIxNGhSanU1UWJS?=
 =?utf-8?B?ZmY1amVydE9saFRUWmE0WjQvQjRLcHhKdmFvbU5ZOGU1YjUrNlpXR2tPY3J2?=
 =?utf-8?B?ekxHakNIM0NiRy9waHd2YXlHaEd5cW41YWx4aEdPOTBhTWNwaFdZb0Q0RzlK?=
 =?utf-8?B?NEx2bkZiWEl2QVgzemVaZDlnNStKb0U2dGJpaklIRWxYSzRVcitWaUJlTitp?=
 =?utf-8?B?dnBYYXREcmNMbHF4T2xEZ3lBd0tJZmJOVkNOczhTelVzSGIvZDJmL05yRG9h?=
 =?utf-8?B?WklvMXMvS3Q0VjhZcWlMT3FQaVNHY3ltNS9COTQ2ZXAvQ3dVb1JUNEFDYVpo?=
 =?utf-8?B?SDhCWC95T0lGS2FGMkk4U0Q0bDNyeFN1Q2NsL1RDZWJJOCtNK3FKSno5RHdx?=
 =?utf-8?B?elg3amxoSzh2cC9uKzBFb1E1VkhrZjRHRWNpdWU5YkdBc3duZUZLeHhUaGJz?=
 =?utf-8?B?S1hOcCtjRTlDY1pTU1ZHRFNSTmtHM0dCNkVEV25oNkRtcjNHeGI0VnFydlZH?=
 =?utf-8?B?VitBSlhaQTUyalNaR3d2cU00MDRqbjFSUWZDanFRd2dwM01sVGlRWU5yVmRV?=
 =?utf-8?B?RlBYTndvVkZxbldxS091K0NQU1lTMWdpY0E2S1dhOFY2OElYbEpGV1h1bnlC?=
 =?utf-8?B?SlJJMmZEZE5PeXp6UG5zeURxU2tjcmFFOVBvWjQvTjFnanJZMHJiKzhBakVX?=
 =?utf-8?B?M3ZlMy9hZlFxUnJpeHkrV0NWdE1lNE5qM1phcHFnL2FqZzFUMkkvdk4xb2ZY?=
 =?utf-8?B?cEtMbUwwdzhjd3I4anBBRDRLZGE3YkdwVlBRNXR3MlJJU3dmNytnTmJXVk5O?=
 =?utf-8?B?ZVhLVW9FZkR4K0RlYjBDMldIWllKYUthUVRXT3BaMFNVYmgwcFBkU0tLZlRz?=
 =?utf-8?B?Mnp0WXJHUkV1ZHBvWDB2YzlnRXp5K0hLY3M0dUZwdmNBSmt1MWQxV2NYWnVi?=
 =?utf-8?B?bHJBL0hlL0pkTXB0a2ZzZEcwUGdYd0Z2V012Uk9tazlhU3JPcFByQytQZGFF?=
 =?utf-8?B?NEQyZ3JjbENFR2REdkJOcjFUbkpZL05ORW5HeUVwbXI0Z3lsdzMrL1p1Znhw?=
 =?utf-8?B?ajBsdmFnczI1RjBMZXlxeDE1bDhRM1lEUXg4ZjFUSlVubXVTQjBiMytUMmNm?=
 =?utf-8?B?WWJRc0tQU3dyQURNVmZIYjV0T0JPbTBkbUwrZ0I4YnJ3T3RIb2Y2SGl6VjRa?=
 =?utf-8?B?VFV3cU1xd0xkbUduelJiLy9QTmdVcGRETEdzVGZEYTd4TUF6UUJrSkIrSE1P?=
 =?utf-8?B?YVRmQ0dmZFBkeE4xakRIWHh2UFRFaE5ZSGxqQlQwQmVKbEF6Lzd2Y2JZeEhP?=
 =?utf-8?B?R2lFSk5jU3dVN3Izc3kwUmQ0Z2NFZGxQeDI3d2lScDNHRHRSSGZBM2owQ0U0?=
 =?utf-8?B?RGJmWlM0TFFOMjZwSkNXYnFUZ1dMZnBUZDkrc3JTMjJlclJHQmZxTFRDYTZu?=
 =?utf-8?B?UGJtcFZLc0N0VlNwZmZtU1BDRzJTZkJ6M004b1pjTFhiU1kzenh5czZzMS9a?=
 =?utf-8?B?d0hLc1F2Wlg5TFM5bHQ5TlNwTjlxWHZwby80U053d2cvR3RwbFFyOHhZWE9x?=
 =?utf-8?B?RUM2aSszN0lHM2RkUmpINndONFU5TEQ5Unc1cUF1MnQ5bTBqYWNQNURHbjZG?=
 =?utf-8?B?VDBJL2dDZHA0RndBU0VFS21ydEhtUXpleVFFY2ExZStLN3JDSHlpRVZCVTgy?=
 =?utf-8?B?UFJ2b0trSTdPS3Zick1qVWJYRGVuVFlDT25NZVdJRVJTT1hHOWtrbHNxL1N6?=
 =?utf-8?B?WWtLOFpVenlhL0Fkb0VsY3RTR0ZIK2V6RlNUR3FSVkNFc2lIUmNCNXIxVmlZ?=
 =?utf-8?B?N0V3UXFsZTlHbExnUU5UUFhiOCtOR0RrR2o0RVhMTFFKNlJ4Z08xaVZXdDVW?=
 =?utf-8?B?RVliMEJWN3RRNExRZ3pLc1R0cWExeEw1RXBNUEc0TS9EckN3YlpHZ0lyQ2lk?=
 =?utf-8?B?V0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a44b2a4-7a3f-4458-401c-08dc1cb4c91a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 08:16:37.6906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaGkCCwnzKsilCPSXVScCcpofW5/gf1zEMKIrXL3AXp+4VF0r3rpg8dHmtPGMBU2qm4QxsQ1TeDbfvRYatkzCSs6ydJZWP//QRXz3ZieBBA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5787
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

Hi Kamil/Anshuman,

On 19-01-2024 07:02 pm, Kamil Konieczny wrote:
> Hi Gupta,,
> On 2024-01-18 at 04:44:59 +0000, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
>>> Sent: Wednesday, January 17, 2024 8:52 PM
>>> To: Kamil Konieczny <kamil.konieczny@linux.intel.com>; igt-
>>> dev@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.com>
>>> Subject: Re: [i-g-t] tests/intel/i915_suspend: Fix WARNs of invalid fd
>>>
>>> Hi Kamil,
>>>
>>> On 17-01-2024 04:42 pm, Kamil Konieczny wrote:
>>>> Hi Bhanuprakash,
>>>> On 2024-01-09 at 18:48:02 +0530, Bhanuprakash Modem wrote:
>>>>> Call drm_close_driver() only if fd >=0, otherwise it'll will throw WARN:
>>>>>
>>>>> (i915_suspend:7563) drmtest-WARNING: Don't attempt to close
>>>>> standard/invalid file descriptor: -1
>>>>>
>>>>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>> ---
>>>>>    tests/intel/i915_suspend.c | 4 +++-
>>>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/tests/intel/i915_suspend.c b/tests/intel/i915_suspend.c
>>>>> index c25805584..82cabfa41 100644
>>>>> --- a/tests/intel/i915_suspend.c
>>>>> +++ b/tests/intel/i915_suspend.c
>>>>> @@ -300,7 +300,9 @@ test_suspend_without_i915(int state)
>>>>>    		igt_pm_get_d3cold_allowed(card.pci_slot_name,
>>> &d3cold_allowed);
>>>>>    		igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
>>>>>    	}
>>>>> -	drm_close_driver(fd);
>>>>
>>>> imho proper fix would be remove this and
>>>> fd=__drm_open_driver(DRIVER_INTEL)
>>>> from this function, as function is named:
>>>> test_suspend_without_i915
>>>
>>> I don't have much expertise in D states. After reading the comments in the
>>> subtest "When module is unloaded and s2idle is triggered, PCI core leaves the
>>> endpoint in D0 and the bridge in D3 state causing PCIE spec violation and
>>> config space is read as 0xFF. Keep the bridge in D0 before module unload to
>>> prevent this issue"
>> This is not a real time use case, either a system boots with i915 driver or not.
>> Removing i915 module and trigger suspend is not a valid use case but we want to test that
>> suspend coverage without i915. So we need to disallow d3cold(which will bring the pcie bridge to D0).
>> igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
>> ***above is applicable tp  discrete card.
> 
> So this code should look like:
> 
> if (state == SUSPEND_STATE_FREEZE) {
>      igt_devices_scan(false);
>      if (igt_device_find_first_i915_discrete_card(&card)) {
>              fd = __drm_open_driver(DRIVER_INTEL); /* write comment why we need this */
>              igt_pm_get_d3cold_allowed(card.pci_slot_name, &d3cold_allowed);
>              igt_pm_set_d3cold_allowed(card.pci_slot_name, 0);
>              drm_close_driver(fd);
>      }
> }
> 
> But this will fix problem on iGPU but still doesn't answer why
> __drm_open_driver fails... as in dmesg from fails I see i915
> was loaded/unloaded successfully.

I think, we can fix this as a separate activity. Meanwhile, shall we 
merge this patch?

- Bhanu

> 
> Regards,
> Kamil
> 
>>   
>> Thanks,
>> Anshuman Gupta
>>>
>>> IMHO, still this patch is a valid fix. Perhaps, we can drop
>>> drm_close_driver() and use close().
>>>
>>> + Anshuman to comment
>>>
>>> - Bhanu
>>>
>>>>
>>>> we are expecting i915 driver to be _unloaded_.
>>>>
>>>> Regards,
>>>> Kamil
>>>>
>>>>> +
>>>>> +	if (fd >= 0)
>>>>> +		drm_close_driver(fd);
>>>>>
>>>>>    	igt_kmsg(KMSG_INFO "Unloading i915\n");
>>>>>    	igt_assert_eq(igt_i915_driver_unload(),0);
>>>>> --
>>>>> 2.40.0
>>>>>
