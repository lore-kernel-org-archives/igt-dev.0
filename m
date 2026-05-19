Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4F9CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 05:19:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245910EA4C;
	Tue, 19 May 2026 05:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="apaRx+kd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6800710EA4C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 05:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779167963; x=1810703963;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L6dQEVuRMGFESbd/pLFQcscnQBPzx+e8kXTcMAj5bU4=;
 b=apaRx+kdjAbcdk7Sw15IutGY8XQ8v7RmeWTuw2xtJFiS5iCHvp6L2lIo
 QtohLL7A25gd4IR7Bd789fmrIkfWTUIHpTtEBbrvHgBZ0b1qKdYpw0vhH
 nf1zjyJRiPMZT+W32ZIQxgnVzLyabNzofMuGJlYmy3sHNC1kusp0wkHem
 TWfyyw950f2qEdekp9dy/Orh2dqfEchSsYEKX68a8TXDWqMeeBHIhqqqU
 /xbqCAIiVLfBFIgc91yJvZpG97WFr+t49CK+4lxhM5dIRic1eor8tYSBG
 Tv+Ug3VFglNg8G5+FH/ws4lhOKsMonOz90gkRw1IFQ7bGPycGyw+tjlZ2 Q==;
X-CSE-ConnectionGUID: 5Ahjy5rFQkm7HfeMBY3SxA==
X-CSE-MsgGUID: nIGT2SgGR++eto8BtGu3aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="80001046"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="80001046"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:19:22 -0700
X-CSE-ConnectionGUID: GMb1l+fuTpW37S4XNNJdBg==
X-CSE-MsgGUID: mcqpu0vXTqakI84+kidITA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="235420969"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2026 22:19:22 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:19:21 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 18 May 2026 22:19:21 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.28) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 18 May 2026 22:19:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDXuJNko/Ci8R/iL3oyCt5bPTBPkuFG+/uFspGLOJRqLvRO40iuINWtQI7XSD8XhpiK79pkPe7DtnXa2370Gexpg2iHcwW5Q5iQQB+QySeAc7mMXftEIL2PyqCqWbS8Zi1T0mvciMLr74+e0fFPT53TuDvVc70U65kceDjViSGxHU9/0uzm4CdyOWJI0DKxY3TgrNbCqpNVBsc9Ny2VDfT2Kr0h+TvurZcEGBE4TPtsabl34+Fxgb2WIU3yHvPHQkyCL4zYugyvZqsEU0L7TINkcM2jcVeVHPh3GChKPkFZzSNaKvSy7VirWssxAEGTzReRD00d6+Q8vuj4lNXeYQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tuwWsNnnLTi6lDhT9NK5WCN4ON+F/d4P3Lzfr1eCySM=;
 b=GA7QKD94dy7kby2cToIXYTvWtDXm6PZ3Daz+dpKmqb2bwUBFwlGtYeb9oXKUPQ8zoFWzCT9cPUwH5OD0r6N3GtyXrnYCDkzlGEZjej2OJxEKvb4xxeuLu1YbskSc4+bdmFiLXAs/FZUCH9Mxk3okXkT4su0q/KOxQWpd3kFLBBi2RG7+DQSWVZhjUx427ANWjnG4Wy9EFzqGlY06kmrUVeP/JTS8FgefzwRHwzgpT2nn/gviYmcwy1u2X4J+mZvHRGh0NKCD63e+uuGEK8EyuoffgsC+MyPzDt7yN6fexyrgzpujju3kMDxM1rJh7YVnKBSOTcQzY1v2tlo///sZ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by CH3PR11MB8315.namprd11.prod.outlook.com (2603:10b6:610:17e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.22; Tue, 19 May
 2026 05:19:17 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::68b9:ea3c:8166:3cc4%4]) with mapi id 15.21.0025.020; Tue, 19 May 2026
 05:19:17 +0000
Message-ID: <9606c4c6-a90c-43b3-b01c-09c55e8f0215@intel.com>
Date: Tue, 19 May 2026 10:49:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3] tests/kms_setmode: Add HDMI 2.0 clock limit for
 mode selection
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260519041750.1199802-1-jeevan.b@intel.com>
 <f29a093d-4ded-4310-8c13-6d59afb4da4f@intel.com>
 <76548c1b-9205-47c0-bcdd-9e197bf37371@intel.com>
Content-Language: en-US
In-Reply-To: <76548c1b-9205-47c0-bcdd-9e197bf37371@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|CH3PR11MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 888cd766-25ef-4635-47cd-08deb5662c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|11063799003|4143699003|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hy8ygF+sIng4TOQ0FoWl036eP4tQ4bVRgqLf1tlSYV7hMUivEA824LHD23sdxgtUkn4mzw0uypLXCFU+2fii9F7JFdO4AwpmSh8SsHfGDlzlRtHDSYXA5/IonpfwaTgTY9+dw6yquDLwtlY8hp1mg5LtcDVxi3nOAs4nf68Z6JSMr5pbr0GRHg24pVbX24ZHXZUHp1kVpmYKbC9396mYw4tcmDgFnkbfxD8SrSetVxeudpgD+e0iOEWYaTSWy0tbCzLuY0KeA/rFgtoN5P2H5mPxW8xxnw7oe8jDmozPCSgCKmMU7Z4pxRJxlaqT7HzhMJiPxyZkfXudutVA1obxtR69QzDdqZs+V1DZooDYgdP6GB0H6zuk+BQ/qoOiNSM3kG4rLMAd2BzwbyUP9FEBCWyyMBScNbf37gc6wGje5JEDZ/+xAaJTQ8VLNRTwJs7olPCHEm7IR3DokR2xA7/y5EAYExqULC4T/KzlkbWefQXE5RGVbvGupSnsL9x5YOBGghDof9Ji7Pr5aE9iUyAwnGWyedbThV9R7wEz850yA42tSYmiDJiX2bx0ZOTGW2Z/HQtC5oeV7UJ11nzW2clEMGZ8DV9XMmdKTjSp/Xwfj61W9nO+gunwZXdUwQ2TWB9n5ckgDbW+77hcuiMm9rH3tf6duZjQPiZY9DbvME4HqNFIBepu7NA+iuMBsEpEDvU3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(4143699003)(3023799003)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THp3MDIrV1hTY0VKMmZTZEZiak82Z2JmUTd5VElPbXc4NlNPdXlmUGZnbGlM?=
 =?utf-8?B?Qm1UL3B6US9RYmh6SWxjSkFxNHBNbHRma0l5b2padEhxb2IwZW5qVHN4SnZT?=
 =?utf-8?B?bVRRNXc0bGJORkxEdjlUblBzN2cvUGQveGk3a2pUeExaY25zSFdGNEprNEh5?=
 =?utf-8?B?OWxjcmM1YnNVMUY1ek03bGJicGUrczI1bHB1WG9XUXlMYU5yUE82a1NSQzZp?=
 =?utf-8?B?VCtoQ0paM3orL2xaaUJPZ0l5MWdKMW56SCtyWDVkUkpKV29ldzEwSktZTkV4?=
 =?utf-8?B?dTVXeXoyLzltdlQ0MEc4T1VkYm0zTU82N0c0NituQWhEQUl6eDNMN1IwR1pQ?=
 =?utf-8?B?UFUvckR0Z2lQUkRaVjVYWGdLMUhBU3VsRERNa3BFSEZ3S2N5blJGUFB0N25i?=
 =?utf-8?B?YlVjenBkNzRaNGpubG9tUkdpM1kzRlRIWmVTRld5WXBhME1IcXY4TlU1dTBV?=
 =?utf-8?B?ZXluSkc4UkdxMWVkOWFpdVhzVjI3U0tNWnlpVUNLRjdXT08rK1VmZDR4cmpw?=
 =?utf-8?B?clJqcVZNVEJTOEhZZmkxcm9pVmt1NGVCRlFJNWxoWlNmd3oxSmRQNU1RU0hp?=
 =?utf-8?B?WUhhRzhFK2k3WldSeDFvc2tFY3FWbnI0STg2MkdQcDJTUEVuN0FCekN1Nk8r?=
 =?utf-8?B?a1pXN3FIMG9SRDhEdHU5YzREc205Ni94b3QrQ0V1NDV4cjJqV1ovM2lLS3d5?=
 =?utf-8?B?aEdDL2U0Z2RiV0ZDR0JtcTZPVlJnckxZUTk4cDM4UzQySVFrZVVhQVZJR21k?=
 =?utf-8?B?ejFRcmVWWmdqYmFvMTUvWDhPbHhhTWZyeVBJN0xIM3g4a0IzaFB6ckxpTmNW?=
 =?utf-8?B?Yjl2TUpPeFE5RCszRHArNnYwdDUzUzZ2d1ZaWU9IQlo3bTFPUHhMV1AwODFp?=
 =?utf-8?B?enFzdll5dC9jQnQyaFdiMWVLNmMxTno1ODBEVTY3VFY2dVRsWkZiYUJXZ1B2?=
 =?utf-8?B?ZUpJRGdZOG1oaE1BWnlpV0JhWU04RHYzRUthQkZRWThXdmpPaEY2MTY5d0du?=
 =?utf-8?B?NXc0YVltenVZTmFxT0JkRmhEbHYzVFFnZVVJZHlZRWZxcjBSUTBKM1dveG5W?=
 =?utf-8?B?bjMrdyt0R1RwUHpZK1VUODZaaXp2K01NU3dENVEvMDI5UlBmQVZFVFpuQjJY?=
 =?utf-8?B?eWRzQ0N1U3RWOEgvMTc0ZEt0M3BnZURETjhsUitiV2p5RjNScndMQWU2TUYx?=
 =?utf-8?B?SVZSL3BxalBPbTJUSTg1d0RYaDc0c21ldm40TnF1NkZPT1dJQWUyRmJmNFli?=
 =?utf-8?B?cnp0MlUyTzZETXRSMmQrQlNVVS9MVFRZb3l0QkVIcFNoTUtMeWNDMjdGaWxC?=
 =?utf-8?B?Q0FiUFZqQmVRSFozSnZGMEl6WTdWUjlGNURQN2FBOHVHNUdaenVDSERBQ2FS?=
 =?utf-8?B?eUxtVGNnZ0tBUmZFa3c4cmx5dDh2SkhDT01oRGNvNTQzbUNRUmowTHY5ZGds?=
 =?utf-8?B?cTFBNTNDMEZGMDRmKzYzTm9YZHBBSDQ5WVdlck1BR2tQdjdHUkdLRFlXbHcy?=
 =?utf-8?B?K0tUbTYzc21BVEE1V0JCSVcvMXZPU1l1UXZKOFBoOVB4dWxrZWN5NTY2dCtS?=
 =?utf-8?B?eDFjaTIrbDIwVzJ5aFM4YndMWXRidkVXUUttamVRRThLWUdhME0vclFpVmpT?=
 =?utf-8?B?VjkrWWNmU3A3SmJ2dGNyRDA2aE5DbXFBUmJaVFNkQWZoYVl1Z1c1ZXlJMWRq?=
 =?utf-8?B?ODY2RkpSdGtycmUyWlNrZEhFSFU1M2VUUWk4aTJEZm1JYWg5T0hGRXZycWJY?=
 =?utf-8?B?SlRRa2o5NnNXNTMrcFFBRldqcHJzZEMrQm5sWDNFUGhMSlVXVXFIYzFMWjBq?=
 =?utf-8?B?cVBua1VERW10dUtWL2xUMC8wQW40OWY5YmNKWkZIeXNkR3BkVGxiS1hSSGNn?=
 =?utf-8?B?M3FhdklLOWdoSUFFdlVBMGoyWnZuMDQvVHU5bzVvUEhGUkxHSUpiQVROK1lh?=
 =?utf-8?B?U0ZiWHNIby9tMHEycklsR3hKZmpidWloa2QzKzNuV1VJL0JEZFpyRTl0UXkv?=
 =?utf-8?B?eVRHcExDMnBVNFE0QXAvdmdJVjRHL2lWamJiUi9pUWVkOEY1Q0dNN3piL0d4?=
 =?utf-8?B?T3FvZEkwOUd5b2NjQjFDb2Y5ZGpuYnFpeWZKNXk5MlB5YUdtcllqajBDUE9Y?=
 =?utf-8?B?SlIwMWxFbnBVMGQ5V05lWlFsSEg2dmpRUHNWcGxwOVh0NXZubzN5TGFpRmVG?=
 =?utf-8?B?TGozUW9leVVkNWNOemZsZGFJVytWMFdPdERJTUtwVlU0UTVQQ2ZkajVEUWh1?=
 =?utf-8?B?MmM1b29DT01xK2dLcnlMYThLU2h0c2I3YndZZ1p1cGV3djFnUHdaMGcwdENy?=
 =?utf-8?B?Y2VhWnY3WUpDdFVoQUZlb3IwNFQxOEY5UnhCMTBXQ3JYbFBZWlR4Wk8vQWZh?=
 =?utf-8?Q?B+exSECkUv0uyHPo=3D?=
X-Exchange-RoutingPolicyChecked: O/36+72Gtdlizbr03N1xXD3oc27A8mktxXFBz01cRFN3Uvo7qTSVlv/tm88TvdFuEuHN75ILZuI6LZV2Pc+YPOcI8Cd/A51UgKBnfz/Umy2O+aXkHj2a9v6ZoKJY8qM6hdF/sUrE87Q+pFN48bqJcnVG9DlehoCDVRst982jNDrR+HwbmpCg324E2gBt8KhjcMKmIjjn1nw0/puJ4itdgZ00QiXA27nO4UbgWO4Vp8IWRHPO6pGi3aMMxX5ZYFvadgGqQzen2N5ObD4XZylm98OS3qTMZe8ND4hxWEc7mwCHKjVxqxILDT9I/bB2aXDc8Hn+PVUPLbsu7aZWrE42Rw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 888cd766-25ef-4635-47cd-08deb5662c8f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 05:19:17.5256 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NKsOBueq2kJgUTzdFZ60lNdhb3BOSt36DZCDUARTDNwFh1KIWZ6WfExx6BUjmRThA6Vy8XYJQZ8raOt6Kl4QuZ4VilOkt797SbOxBfMvTeY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8315
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


On 5/19/2026 10:44 AM, Nautiyal, Ankit K wrote:
>
> On 5/19/2026 10:39 AM, Nautiyal, Ankit K wrote:
>>
>> On 5/19/2026 9:47 AM, Jeevan B wrote:
>>> eDP modes with high clock rates were being forced on HDMI 2.0 displays,
>>> causing kernel to reject with EINVAL. Add clock validation to skip
>>> incompatible eDP modes and fall back to supported modes.
>>>
>>> v2: Add HDMI 2.0 clock limit helper, drop crtc_supports_mode(),
>>>      and ensure per-connector compatibility to avoid invalid modes.
>>> v3: Refactor connector compatibility checks into helper for clarity.
>>>
>>> Signed-off-by: Jeevan B <jeevan.b@intel.com>
>>> ---
>>>   tests/kms_setmode.c | 39 +++++++++++++++++++++++++++++++++++++--
>>>   1 file changed, 37 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
>>> index 1f2849bc2..4d4f980f6 100644
>>> --- a/tests/kms_setmode.c
>>> +++ b/tests/kms_setmode.c
>>> @@ -79,6 +79,9 @@
>>>   /* restricted pipe count */
>>>   #define CRTC_RESTRICT_CNT 2
>>>   +/* Clock limit for HDMI 2.0 */
>>> +#define HDMI_2_0_MAX_CLOCK_KHZ 600000
>>> +
>>>   static int drm_fd;
>>>   static drmModeRes *drm_resources;
>>>   static int filter_test_id;
>>> @@ -165,6 +168,35 @@ static bool 
>>> connector_supports_mode(drmModeConnector *connector,
>>>       return false;
>>>   }
>>>   +static bool 
>>> hdmi_connector_mode_exceeds_hdmi20_limit(drmModeConnector *connector,
>>> +                             drmModeModeInfo *mode)
>>> +{
>>> +    if (connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
>>> +        connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
>>> +        return false;
>>> +
>>> +    return mode->clock > HDMI_2_0_MAX_CLOCK_KHZ;
>>> +}
>>> +
>>> +static bool mode_compatible_with_connectors(struct crtc_config *crtc,
>>> +                        drmModeModeInfo *mode)
>>> +{
>>> +    int k;
>>
>> `i` can be used as iterator here.
>>
>>
>>> +
>>> +    for (k = 0; k < crtc->connector_count; k++) {
>>> +        drmModeConnector *conn = crtc->cconfs[k].connector;
>>> +
>>> +        /* Check HDMI 2.0 clock + per-connector compatibility */
>>> +        if (hdmi_connector_mode_exceeds_hdmi20_limit(conn, mode))
>>> +            return false;
>>> +
>>> +        if (!connector_supports_mode(conn, mode))
>>> +            return false;
>>> +    }
>
>
> I think I had mentioned this in earlier comment, but got missed.
>
> We need to drop crtc_supports_mode(crtc, mode) here, otherwise it will 
> try to match this mode.
>
> This will prevent the test to use eDP modes that might not be 
> enumerated in external panels but can still be supported.


correction: I meant connector_supports_mode(conn, mode). (facepalm)


>
>
>
> Regards,
>
> Ankit
>
>
>>> +
>>> +    return true;
>>> +}
>>> +
>>>   static bool crtc_supports_mode(struct crtc_config *crtc, 
>>> drmModeModeInfo *mode)
>>>   {
>>>       int i;
>>> @@ -270,8 +302,11 @@ static void get_mode_for_crtc(struct 
>>> crtc_config *crtc,
>>>                   if (conn->modes[j].clock < mode->clock)
>>>                       mode = &conn->modes[j];
>>>               }
>>> -            *mode_ret = *mode;
>>> -            return;
>>> +
>>> +            if (mode_compatible_with_connectors(crtc, mode)) {
>>> +                *mode_ret = *mode;
>>> +                return;
>>
>>
>> As mentioned by Ville and Jani, this test need to be modified to 
>> handle the external vs internal mode better in long term.
>>
>> However to avoid noise due to test trying higher mode on HDMI, I 
>> guess this should be okay for now.
>>
>> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>>
>>
>>> +            }
>>>           }
>>>       }
