Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BDA1C44532
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:59:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C9210ED6D;
	Wed, 22 Jul 2026 10:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzFJ8UCW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6132810E0A5
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784717962; x=1816253962;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=EG7o4DsYOpb0DpmC3GGbiGWB37kDON3fFQ924cAdJKE=;
 b=FzFJ8UCWgaif8USCXF9FfOfMWWf+nXmbZz7RIg0371WPE7WW26tU7jmD
 0Ttp9jra/GTFuGBXqqEyIQGpAEV4W2XZQoYrE+fuE4WY69f5Uvzb1QLOV
 B7rdRhI3bZ4voA+Ad3jBAYyS6bNcEo5tGnNVZzjdyMlWectXiF3uBbaLQ
 TZjVFNC7R5Bnc0VJObMMN07y3Jdxtz8Xv3zP/ZNrU5ESA3fnbLpG5V94A
 c3X61Flgc708ftjjfFPsxL4mU3NWGH9rR0dpasHywIFrVsSyOc+d+lNj7
 +T6hMRYdHcfJM5eG67QqhzPk/Wvm3jESt81aiS+HOVrFVTdx8RMjIAD18 A==;
X-CSE-ConnectionGUID: qTugvPUoTb2UjE0E5VyJsA==
X-CSE-MsgGUID: 5wL+9k3UQVKwsifLhRd+cQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85393698"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="85393698"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:59:22 -0700
X-CSE-ConnectionGUID: tHo0KL5XR8yC1eIQNVF8jQ==
X-CSE-MsgGUID: 2ZYRwxP4QEq4acOt7g8N2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="261842541"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:59:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:59:21 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:59:21 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:59:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zBpodfp4PDVLpNdg4Ha97A1oOUDifegqsnhi5vUT+AhqD8MBt4O9vTKBpH2uZtAoyfwgyt1CgozzNiCu84UbnOQy3mQUlPR5/SAwxwxEDRr4zgrvadNhQ678iWx4xN8jxj0jIfpXC1V021tWXNHNVFLNHfSEu2VZ8fHqOjjt/PDvufhdlvMyVf6czqY+jsmDri7rHyeU0gVAOHwkyg3F3xK+nwnuW8W4cYDh5flpYFhvkKeGngohC7TjKInXT4zgby+O0oaFfA4iTp5Zgng0OW00HLEB2QyYp6VE1k1sLjd0f7k5FbcYkTu6fSkb++2OICLNwlzqODvK4RhqK1WGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnLueluiNpchQp9pUPh62uNE3snZCUkALXr8UFQgFq8=;
 b=eaHn+a4ue2Bd4DGccg7y787YbqM8TYhiYTe+uzXB7bGnrt40iUOLSqh0ANHJ6GULL35f9SEOBMRm4SAtLEBtz4w87NwyFUnQ91mNjZwxaGW6CzMKaRdJ7GXuZpyn+E6iPgSM0+QmRfuRYtIoZKj7R/5dWQEFEXYTA0x1fXEtWzkMmN7tOFlrqW0jMPqdfILhJhlwS8XEO7Pu3ULTg2m83NXD2T2V4s3I0oXLXCuKVrdu1swUFVRt0vN/QIjj7zGQIfFuAa8GOkxEOw8jZRoexIy73JniTST/nKm1LtYkmbEc22Ceo+TAyk73A38PWt+6IgWJw2KFxEC4qWaI+l+NIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by DM3PPFA69606334.namprd11.prod.outlook.com (2603:10b6:f:fc00::f42)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:59:13 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:59:13 +0000
Message-ID: <8dbf3004-62c1-4822-a3bc-c7e628a22483@intel.com>
Date: Wed, 22 Jul 2026 16:29:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] Revert "lib/kms: Set
 display->has_plane_color_pipeline automatically"
To: "Sharma, Swati2" <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: John Harrison <John.Harrison@Igalia.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20260714144532.351294-1-chaitanya.kumar.borah@intel.com>
 <88217722-843f-46b7-a2e5-a05262243b4c@intel.com>
 <63abb020-7f9a-4974-85d9-d9a7f3a0dc81@intel.com>
 <7a0afc4a-0d28-4dba-8ab3-e06886053f88@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <7a0afc4a-0d28-4dba-8ab3-e06886053f88@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0252.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::8) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|DM3PPFA69606334:EE_
X-MS-Office365-Filtering-Correlation-Id: 513eb9b6-b6cd-42c8-a91d-08dee7e043a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: YYIO+yFDSJE0zcuOPpMIhuBrdZb5zR5pF7ybN2c8ao0HXIqqINUlPgpX4oTtfBd1IoUVqT0FHOillesM9jrRH9vlMxcgvj6wqC7o0HXPTQlr3OdOrVW/MVMIF0fVx1bm6r/092jBcen05/OMdDRcptTJG9237K1fly/G+H6pcJ/rlWhPq1JA4KXyycxxRVkcw5fL1zxiowLeErz/F6qAWgKZjfqeSoE53eCfVp2FOYo840MhMGtPW51znjmmx0b8+4nlQKzLK3SYpHvOyeNC4t7OMtu/XNeu74upqzha9M4H1oun4wwbIhh82uXXQalFq1sYkzcagLBYNyvXIMg+ngH3EQ1bZF1a8t+V9E8NtLDnaXUJU/YuC+g7yMWcipkF/Z9j7PtdFHD/h1tXq7a1H28I3hfHV43EVPjLEhk46lEvkY5Nzs8IpTijp7gRJAimDgdZHvJFA89Bdc/e+J/j+eU+SgR1KoALM9e/+3s3HXOAdlFQPYbyVRHGKx7KTnD362qIpXzxkDb+8oolMvhWDjaGW6r6k0LfixBMXYP+Z6ueSXEz8E39PNX3cnKkLI/Q310a0SllrxeFm8fXIOUblmFXjM05U5mtimw68sTHQuvgsRUeUT8yNOrHNF9QTcXABKAt0eO2CdUDT4tNoRB/eC8aHFjERVK1oL70sA2Nmxs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlIxSDU3azdhNlEwUmJXZWJXMUNFdFFucFJwTXlleWhXV3k4N3hGMjBtc28v?=
 =?utf-8?B?Wk5NRXRSaHBXMXV6K3g0UnVLczdTTFhPOUVwazZBbXZHbTdtbTgrZGRYaFFN?=
 =?utf-8?B?Q3FCSzZRYUhycDc2TXg0b0pmOUYzR0xnQyt2c3p0RStwRGN6V3dkL3hvd3pI?=
 =?utf-8?B?alA1dFFsS29uNEYzd1cyMWZ2S0NxakROUFFvQ2JoT29TQUI4Q1lGd3B0dWlw?=
 =?utf-8?B?N2F4eEdQd3FhcXJ3aklHMkpsdk9hNU1TT1ZpdXVvVGt2V3lIRjlDeVZVSVcv?=
 =?utf-8?B?M2ZZclpSOUdwYVF6dE1weFJOTWIxUUQrd0Rwa0Z4Ujl1R0RGeEFuYUd6cUZW?=
 =?utf-8?B?Z0g0d2hJWW05ckVHaXNIZkZhSnpMMjlrNklYM0tZOUl2VDM0YVZTOTMvYzBR?=
 =?utf-8?B?V0dwRWFoWEpnYnpicStoRGVLZExFYVlxRlVWVUdXSGpvVE82bG9iODRoaTZY?=
 =?utf-8?B?VzMrWmhCdnF5SVZzYmhDSzkrcjZtbytuT1RFYjFqSll6ZElwbHc5V1YzSWFR?=
 =?utf-8?B?NTVVaitSMHU2NGZucjBiaFhpaXpFbXZoVmtMb3NRcHBRUVlwUDV5VzJQN2F4?=
 =?utf-8?B?NWVaZURSbG1BcElWMVNtK2RzYXIzMjFLcE5jMFRvdE1yTU9ZT1d3bGU3MWRN?=
 =?utf-8?B?ZG12czcrL2REQTRPOTBSNTFFUlhpZS9UNFhleFVIYmp4Rm5aZVJ4SytGS0JW?=
 =?utf-8?B?UFd5MXhXRVNmSm9iWDVTaHhzNTFjMVBVSUs5OFRZTFo1U3lza0twTGFlRW1U?=
 =?utf-8?B?bGZ0SlpPSzdhQjN2RDA2WHIrcmNCVy8waHY5UktPbDZCRlIxYm15S3Ywc2RX?=
 =?utf-8?B?L1FCWm8xZkRtR3drTGNVZU1RNG01SllIMWdRdXRCbEpiNDBxZEdacGdWb0JD?=
 =?utf-8?B?SU9nQ0tUQ3ZyamwvZ2tUZFhSdkpWQ2szNWFJbU13T2FNdDdJRzIxLzlmNmo3?=
 =?utf-8?B?Zk9YenBBRlBVVVRFcUFSc1Z3TkxhM0NsaGNtckx0UlJCaEpFTW9JbE9ONGxp?=
 =?utf-8?B?ZmdmdGZxVU5Xa0kyNGNlbFlvRVRGWVdPMkNVL0pTU2ZTTnZMSXl6aThBZXdG?=
 =?utf-8?B?TldKY3ZaNVJEV212bTBGcklCcUg4QUQyK1N1WWZrNzdyMW1lT3ZlOHROdW81?=
 =?utf-8?B?NGZjOXdVRExGVFhmSDhsUC94S2FzVTdIakltZFUvTjcrRDNiVlIwY2ZsRlh4?=
 =?utf-8?B?aWdva2FYL1NMZkhOSDJnc2g4T2l5ZjY3U1RMZEVJRzVQcFZtM2xQQ01yZWRr?=
 =?utf-8?B?anh2T0czSmRMNU9ZVll6VjF4YkV0aFFweHo5NGx4SHlEVXNoY0tHeUozNkoz?=
 =?utf-8?B?cVd4bmtCQ0FhVFZkeGRUVGZEbmxtRnM3ZkZuYnZlUGhmVlVKU2J3UllNbVdr?=
 =?utf-8?B?YVFvRnVYU3NTS1JrTUlHTlg3TTZJQVZJdzQzNnpiMG5sUTJDTkZXSHRCdE0x?=
 =?utf-8?B?ZXV4ZzBkSnNGMEZjS1BoUklEUHd0Q1FudTdiTmFla0Z4RG9zdFBBWGpTWWVv?=
 =?utf-8?B?dHJGeTJSb0ZMS3IzN01MNWRmM0I2K1VwaVRjZmZBeS9HVGN1eEhnRmdYWmxz?=
 =?utf-8?B?Q3NxSHg1aHJGR09CU0w1aTYzTmVncHBaNFlFUSt0ek8xYjJPdHhackhvajdh?=
 =?utf-8?B?bkM0Ymx6L3FlNmF0WGtQYnVpT3d6bWYrbVhnVHZJejMvSnJJR2QrMUQ4RUVL?=
 =?utf-8?B?b2t6RWJIQTJNaXdwcGNKSy9iSXFHTEhnZ3J4Z1RQa2NGbm9FeFJXdzlBWVI4?=
 =?utf-8?B?Q3crNmR4OVdxSW04cktYQXVqcVAyTW9tVkhQVDV0U0l5ZjFQZThXa0FOSFB1?=
 =?utf-8?B?anlET0l0ZGVZMWhGZTd2eW1yTmRIVm5ySHZ2UWVKN3p1R3NGc0l3bk5SdDBv?=
 =?utf-8?B?WmV5N2NzZlNkQndIc2NURWhuRUhYenE4YmlsclBsRC9NSVFjdEJSanBoTkFJ?=
 =?utf-8?B?ZUVEWXBxVUd1NzR6MDVSZTFZVzhOclJLY3U3L2VnNWhFQXQ0bTRpWXhJQ1lv?=
 =?utf-8?B?ZWtFT3VUMnNCbFNpZ05TNlVwOWxoZklTZW0zOUx3aVRnMkwyQjRTRk9ZYmk5?=
 =?utf-8?B?K1NZNnVVdzZUbnJDMDZmSFNoRE1HUTFEeVhPRXNqK0s4VDZOZG8xZUN6OFpl?=
 =?utf-8?B?T3dwRGdidkdOMlpVY3lxWGcxOVBBaXJveXVzcFBlcE9YcC9NVVBDZTBNdTc1?=
 =?utf-8?B?aTcrTGVrUWlzN1Z4Tjh4MHhzbWM5NW1sK0hHdzl0WHgxT2ZNMzM2V3V5d2FV?=
 =?utf-8?B?Z3B3M2pUR25vQTFCTjAyVzdiQU5wL0hqMU9kNDZ0QTNvNUl0MmYwZHA1Uzk4?=
 =?utf-8?B?aDlpZXZIQXJuVDRuN1JoSkZuVlRhblkzREJJSEtSVUVhNUpxVlFZYWFvR0s4?=
 =?utf-8?Q?3x+HGzsMXv/i//HM=3D?=
X-Exchange-RoutingPolicyChecked: MF/YpczMEl46MwmP3A7KFXKsF66ovme9qDqvGdopWy5BlfSX04F+5neprJRmjR9DBJymZTMdRIJxOmTamKYSuqRxb18i4rTU9e7r+jGUFNz9+Qh3ccLYy/s03vjiKOpVitGMYe0y4BJXCLBCnznPd2obbYMk4c2AhgvHqyjm5xuHol7AvGNFfK/iWNWplIgDn1h2qpjmvbkXEPehydXbjZ8dG7lez6qc0IHLOEPSk7iZUu4vmvnkMUl679y3LsDHyYjnDRlhi2vrifEm2jYKXWzYowxaIU4MDWnXJol9UFUQwesIaLQBjCIcA24uebstfFQxVM5sEZ0om6jVwX1xOw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 513eb9b6-b6cd-42c8-a91d-08dee7e043a1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 10:59:13.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtT0czHaWxWE8vSRlFnokdy182/s4Z1hAzOvgUgj5rxw7liwsD8XYkX5S9r0CJmhKSn6Qy2Am1U97bOt4tmWypsGgd4tvLqp8LBkUW9gr/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFA69606334
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



On 7/22/2026 11:53 AM, Sharma, Swati2 wrote:
> Hi Chaitanya
> 
> On 21-07-2026 04:30 pm, Borah, Chaitanya Kumar wrote:
>>
>>
>> On 7/21/2026 4:25 PM, Sharma, Swati2 wrote:
>>> Hi Chaitanya,
>>>
>>> On 14-07-2026 08:15 pm, Chaitanya Kumar Borah wrote:
>>>> This reverts commit be4e98c3b79e8bb843f7bb762616742691fee72e.
>>>>
>>>> Enabling DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE from the common
>>>> igt_display_require() path makes all IGT display clients opt into the
>>>> new plane color pipeline UAPI.
>>>>
>>>> With the color pipeline client cap enabled, legacy plane COLOR_ENCODING
>>>> and COLOR_RANGE properties are ignored during commit preparation.
>>>> The driver cannot distinguish this case, because enum 
>>>> drm_color_encoding
>>>> and enum drm_color_range do not provide an explicit uninitialized 
>>>> value.
>>>>
>>>> Revert the global opt-in and keep the cap enablement local to the
>>>> color-pipeline-aware tests. kms_properties colorop coverage shall be
>>>> preserved separately.
>>>>
>>>> Cc: John Harrison <John.Harrison@Igalia.com>
>>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>>> ---
>>>>   lib/igt_kms.c              | 2 --
>>>>   tests/kms_color_pipeline.c | 5 +++++
>>>>   tests/kms_colorop.c        | 4 ++++
>>>>   3 files changed, 9 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>> index 2eefb773b..c56127c42 100644
>>>> --- a/lib/igt_kms.c
>>>> +++ b/lib/igt_kms.c
>>>> @@ -3201,8 +3201,6 @@ void igt_display_require(igt_display_t 
>>>> *display, int drm_fd)
>>>>       if (drmSetClientCap(drm_fd, 
>>>> LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
>>>>           display->has_virt_cursor_plane = 1;
>>>> -    if (drmSetClientCap(drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> -        display->has_plane_color_pipeline = 1;
>>>>       plane_resources = drmModeGetPlaneResources(display->drm_fd);
>>>>       igt_assert(plane_resources);
>>>> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
>>>> index 6119a830f..78860a845 100644
>>>> --- a/tests/kms_color_pipeline.c
>>>> +++ b/tests/kms_color_pipeline.c
>>>> @@ -349,6 +349,7 @@ run_tests_for_plane(data_t *data)
>>>>   int igt_main()
>>>>   {
>>>> +    int has_plane_color_pipeline = 0;
>>>>       data_t data = {};
>>>>       igt_fixture() {
>>>> @@ -363,9 +364,13 @@ int igt_main()
>>>>           if (drmSetClientCap(data.drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) 
>>>> == 0)
>>>>               data.display.is_atomic = 1;
>>>> +        if (drmSetClientCap(data.drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> +            has_plane_color_pipeline = 1;
>>>> +
>>>>           kmstest_set_vt_graphics_mode();
>>>>           igt_display_require(&data.display, data.drm_fd);
>>>> +        data.display.has_plane_color_pipeline = 
>>>> has_plane_color_pipeline;
>>>>           igt_require(data.display.is_atomic);
>>>>       }
>>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>>> index 4db83470d..16db0b8ad 100644
>>>> --- a/tests/kms_colorop.c
>>>> +++ b/tests/kms_colorop.c
>>>> @@ -418,10 +418,14 @@ int igt_main_args("d", long_options, help_str, 
>>>> opt_handler, NULL)
>>>>           igt_require_f(!ret, "error setting 
>>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>>>           igt_display_require(&display, display.drm_fd);
>>>> +        if (drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> +            display.has_plane_color_pipeline = 1;
>>>>           kmstest_set_vt_graphics_mode();
>>>>           igt_display_require(&display, display.drm_fd);
>>>> +        if (drmSetClientCap(display.drm_fd, 
>>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>>> +            display.has_plane_color_pipeline = 1;
>>>
>>> Can't we follow same local variable pattern as kms_color_pipeline? 
>>> That will avoid calling drmSetClientCap() twice.
>>>
>>
>> We can but since this is a pure revert we can take it up in a separate 
>> patch.
>>
>> I can float one if this gets approved.
> 
> Sure, lets get this fixed as well as part of a new patch.
> 

Thank you for the review, Swati. I have a patch ready. I will float it 
as soon as these are merged.

index 16db0b8ad..d573d2ceb 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, 
opt_handler, NULL)

         igt_display_t display;
         int i, j, ret;
+       int has_plane_color_pipeline = 0;

         igt_fixture() {
                 display.drm_fd = drm_open_driver_master(DRIVER_ANY);
@@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, 
opt_handler, NULL)

                 igt_require_f(!ret, "error setting 
DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");

-               igt_display_require(&display, display.drm_fd);
                 if (drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-                       display.has_plane_color_pipeline = 1;
+                       has_plane_color_pipeline = 1;
+
+               igt_display_require(&display, display.drm_fd);

                 kmstest_set_vt_graphics_mode();

                 igt_display_require(&display, display.drm_fd);
-               if (drmSetClientCap(display.drm_fd, 
DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
-                       display.has_plane_color_pipeline = 1;
+               display.has_plane_color_pipeline = has_plane_color_pipeline;

                 igt_require(display.is_atomic);
         }


> Above changes LGTM
> 
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> 
>>
>> ==
>> Chaitanya
>>
>>>
>>>> igt_require(display.is_atomic);
>>>>       }
>>

