Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD035CCFA04
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 10:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4B510E5BE;
	Tue,  4 Nov 2025 10:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Yv3PjjSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C00210E5BE
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 10:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762253274; x=1793789274;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GfgJFaEfQsn+WjYRDHMgmmK/SjZ1eqTA3wQe2HSbcsQ=;
 b=Yv3PjjSK8Lb/ZSOwEM7KVaY9vM/X2wG3/UgcxX7DSotVVfMZL6MHgLtB
 3vqtkPpTqQQgArZcL9C+lR82PA3grppOQKJKIi+KIYUZ6uepN7ljacyJn
 p2jtz5LkCGssqRpkrr7KPLi8Gf/6ADq95Qy2lsEtGY4MBy3JQMjDpim+2
 zy1nzSezYO5WwyLSwkbH2sOVqsD5KXGsfxvMj5mj1AeUk1BM+wJHSATlX
 cK1EFuqrIZzjJ6MXmqCmX4tIkdlG64WBbtV1P6YZAqhuXz2wCa9gcA7/S
 euUYZFOFQbSP517kWe1Mm5Q++yW9AMWfly+5RQaDo5f6RhkplAsF/o98Q A==;
X-CSE-ConnectionGUID: 8/69NaYySCSDsgzjWviTQA==
X-CSE-MsgGUID: q816xdKdQOGAC74s3Oq0Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="67998023"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="67998023"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:47:53 -0800
X-CSE-ConnectionGUID: EsybqqFWSlOU9TccixSlZQ==
X-CSE-MsgGUID: Q2Cmn4fgSiilJ+bRECD0aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; d="scan'208";a="187573451"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2025 02:47:53 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 02:47:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 4 Nov 2025 02:47:52 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.49) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 4 Nov 2025 02:47:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YKdKzPHXIA8Ak5qEt5ufGRA7CW2udWp0N7f38qa7MOUN5H9OCR96JzzQnzubOaQBtqBomTUkiVQHZwEvZb9SMHn45V1fZfyGgDSHE0lPgOLUjgBdTdvcU1whnMYKvzCNgKzMcMf2iq2UMwqfVE+EmF67aZUXm3QkHwgrUs8Rga0krOnGmEKyTyxWKkM+6EtXR/W7RXD6O95+4laRzPCpsHSbyRT/q3IrPv6oVPO4IlDQC7NN1vIHcSrYFx4/Mkt5MAWPICVvLSrGHZoxscOvePDCgYIbruoEb4tJw+3yY7FLm2ErPinyi3yCYKUeYbO7xyXehcPhKEgKnZzTS+txdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XU0yeSYmTtlHazAHcYHpLkH2/yU3R9COPrhzDaZWtMA=;
 b=QacxBf4Q09jJ+Ep2KERbidkeAYiqtXqgsH0ey6xMtCJo6eXDOZ9pkMU8eZYSGdgwK77ls+6ug2VWTitk59aQ0KMnUy93Er5I5FohPhiKX7kcmXhGBtbLAihTLXUIHGdXDPubcGp+7Rzj2+Nrb/p6b9Sksdn5935AKgpNCrKTKt6O6wiy1wBKlWAi6lRm872ndDwh+yqD7hN1QfxzGk2wFmjP8IhFkyTKYEc2Mg5Dd+cLuMkA04b+kcra1CBd2Rp700RiTMskZyTi2zKMqLBW3J5wrkvno4yB0GSeNkefTOZZu+YtmKhMLEWI9Frj3l006SWloL6uCH0pINdvoWltJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 CH3PR11MB8519.namprd11.prod.outlook.com (2603:10b6:610:1ba::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 10:47:51 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%4]) with mapi id 15.20.9275.013; Tue, 4 Nov 2025
 10:47:50 +0000
Message-ID: <8fb1cbb4-81ce-4a3b-9a9f-12021800b1ba@intel.com>
Date: Tue, 4 Nov 2025 16:17:44 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tests/kms_vrr: Fix logical condition for DRRS
 support
To: <igt-dev@lists.freedesktop.org>
References: <20251104081009.1474197-1-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20251104081009.1474197-1-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0077.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::11) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|CH3PR11MB8519:EE_
X-MS-Office365-Filtering-Correlation-Id: 181b1c5f-9a6c-41bd-0e01-08de1b8f998c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BGSENXWnU5U0RtcnBjUHlSd09na1NCM29LajN5ei9QdW9sMGlkSVdaQXMx?=
 =?utf-8?B?U1RUNFpBZUJpK0VaalpBSnRDb1Q5L1Z6N3Z2STk3OWVpWDdYcjkxOFpSa2Vq?=
 =?utf-8?B?QTVCN1Z2UXpPRnJCK1F5TlltTFdpUWl4LzQ0VGpIRG05eVBaUDFqMW5zSTdp?=
 =?utf-8?B?amp2Q1lTdFY5VUpQeTZ0YWhFUDBOUlZpalhIbjJlUzVLTkdJVEowRWF4RzJs?=
 =?utf-8?B?T0lRSFRXR3VSTjg5ZFNCOTBNdHBRb2ZNbktBNWxPa1p4MGNQUHB2V01yakdk?=
 =?utf-8?B?dWhiWXdGYjNCOWdGVStsOVJkanJBK1RLV1dqWXZIOXRZYUp4SURUYzQ5UHZH?=
 =?utf-8?B?VzFRWDgxSFRzbXFBeXZtVDh0RHRyM3A0SFhseWZQMW5BZnU0RkN4QTNJSmly?=
 =?utf-8?B?a1FnZTNlenZEZy81b09uTjY2Ulpmb2NDZ0ZsVHlzWVRHMDYycVlWWXVoRDRK?=
 =?utf-8?B?d3R2OTdwcEgrSWhXczhFLzR3cXREQnB0dk9HdFhDN1pEbjJSd0FNYnJPdnhl?=
 =?utf-8?B?WjU1U3Bza1JUeDg0THdJQ3hYMGRDTmZ4K1BBb3oxSnRtaUpmVmMrMHhhQzZS?=
 =?utf-8?B?ZWdYZ0hJQXRkcitnMlFpTWFHRDd0QStOczJXeVRCYlVWM2VZNEEwKzA1R28x?=
 =?utf-8?B?SzdDWDNtZjJhWnNKcEJ0QmxkaTJJK3pmcVhYdzBiR1hUVkJKZHlnTm5UVkFz?=
 =?utf-8?B?ZlZDbUwvMldPMnpEUnRzZE5vSXp3SUhHY2hhYlBCenhJTTFuaHhEZnhSYkFw?=
 =?utf-8?B?REZ1WTlXeVZhajhKcHZLSFBkOFFKcU50TEgrTFZLN3ZITUc3bm5rallsT3oz?=
 =?utf-8?B?TnVma2tQK0xXTjlMcDFIWFliTmVUbGplN1BDMHZnbzVCbmJCc2orUWlwd0xi?=
 =?utf-8?B?Tlpja2RCSyt4WEdIWlo2OFBqdEhhRkRvYXdiSGtqVDdwUTZ6dDhVT1hiK1lC?=
 =?utf-8?B?cDZMYTkyMFFYTGR6ZXZuNm1VUjlVbmZ0eFc2ZEJ4TVBMQkdsS2NKbG4rWVhi?=
 =?utf-8?B?VkZNc3cyRWJuYWY2aG1UUUp3aTRSUkhqUjcyOG1ieWpyeUlTaTU5bHU3R2dR?=
 =?utf-8?B?NVBTU0pzS204YkFnb2ZoNm8vaFFwRmVqNFA4NHlyR095MFNMRE82NEE1QXR5?=
 =?utf-8?B?OWw1clRIMVBtdkdHblphVWtJVHFjNENMQkpOTWgvQy93SDZXR1pDVW1CeEdp?=
 =?utf-8?B?ZVRQdGM4Umo3VlR0Z3JLZmZuZmM5MVRFTEF3ME5ObDkrWlBZRHFFQ3laK3Mw?=
 =?utf-8?B?Z2M4anlnMExaTEo4bWN6K0hYNTZzL2kvVzJsd1FFOTk5RWwyYUNHME1IOSt4?=
 =?utf-8?B?VjdhMDVDZSt4N0huc3o0TVBWY2d4SUVqOHpXcFlBZUhaTWQrU3k3ZEtBSTVS?=
 =?utf-8?B?blNQS2I0VUx0T1VGUkdEam80cGVQYjU0alRIVFdHTW5pNUQvRWZlT3UxS0R5?=
 =?utf-8?B?Tnk1RXFQYnl4Q2c0dGlWZjlQM1JyUDQvdThNbGJvaS9DVWw3cVBZeVovR2pq?=
 =?utf-8?B?czdsTnZuR0t4Z2NrQlA5VUkydkorUnhzQU9ERWZQeTZnb3owQk1SQ1JSK0NO?=
 =?utf-8?B?WlJvMytPbEE4M3dnVnVhZEh5T01laEJrOUphNk9Yck8wcitwNnpidXM3VDlu?=
 =?utf-8?B?WjBzVFB4bDc4bzYzRDV6eEptd1Iyd2dld1ZTRVZGT1JZeFI5R05RR2Y3ZE9V?=
 =?utf-8?B?T1N3YVhvdkFtQklrYXZwNitUSFBBWlp1UnFZN3NJa1pReFJzL003Z2ZvSTE5?=
 =?utf-8?B?WmRmNkVKOFpidXEyZm9ORDRGZUhBQnhESjNVV1hHamd0eVdLdE1qTnZwakRQ?=
 =?utf-8?B?YmF6SnViaUptTityb1ZYcnpUaFRNVFdMeEM4TzVWSHZoU0Fyd1dLUGFScWla?=
 =?utf-8?B?eTg3OHVwRWFsQy9SRjN3d0tRZVdnRjhETHZZVFB2MGNkcUFmVGxjWEtRYnFK?=
 =?utf-8?Q?c8emq2/ozCGGhVhwncGBMPNAs+cOu0kP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFdOaXErbVVBaVBYRFEyN1QyTVBGWnFuSS9zcURCYUNoNXFRM3ppNktPam5Q?=
 =?utf-8?B?aDgvb2ZhVktVUVQxbCtnNnJqT2VYS1g3RHJZYVdhalJPTXRDSlhyV2pNU3BH?=
 =?utf-8?B?ejZrVnRWOS9wdjJNTmgzQ3RueXUySHYwWkR0ZWZ3amxHb0ppNFdNeEhZWFds?=
 =?utf-8?B?cmxKTTNTUEVkdExhU2Vtcll1cVppNkVDcXJLOC9ONDF2NlAzWVFicEd3Z1RU?=
 =?utf-8?B?TW1KVG9lQ1I5VXJydTNQaUJSUEpOSDZZUmpwQ2F3cjVMYkdJcGp3SzlkOHlS?=
 =?utf-8?B?dnRncURDTkRlRkpvYkVOVlZ6YXVDdFRKVjk3L0ZqT3ZVY3k5UlhYQ2tIVHYy?=
 =?utf-8?B?RnZUaWYvYlJpNmFGRVd1Nlp4a2pQcHAxMGlmOTFSOGtLTFVPcGdLTDVBT1Aw?=
 =?utf-8?B?YWpBS1JqeUlUM3FscHA2THBVTUppMVpheEZQa2xIcThMUkpHZEZQOGl6WTNs?=
 =?utf-8?B?cHhnSVJ5R0J5Y3BKWVBwSldueEJ4cUNDODRUbnF4bC9pM0FmOHorZEZDRmF6?=
 =?utf-8?B?aE5WTE51YmNyY2JrYjZoU2tUZkt1QVlkb3kzcjVPaGVabnpRVTVoQ0dKb1pk?=
 =?utf-8?B?ZjNYQURpRnEvZ0g2ZHQwZHF3TGxnTlZJWThIZEJlejRjVVd1Ty9PdlROTjg0?=
 =?utf-8?B?UlF1S1dTNm1EdnZCcFAvT1RJbjNpT1dCeTQwTXU2NE9yREswVGdjY0k5QVJr?=
 =?utf-8?B?TmU0L3QrS3Z5UnpKamJvTG85MmpFN0ZWNXJsWjhqNDZNMUdCakcvV2prWHRw?=
 =?utf-8?B?b3FiRUsxaU9FQ2ZtSEVFcFJoejNSbUdNUjJPTmhYK0pPbmE1T2JxcHlRd3lY?=
 =?utf-8?B?UUhLNEplallvN1RQNlpVL3FjUllsU0pLcEVpU2pJNzNvZUd5Z2pKS2NaWlp3?=
 =?utf-8?B?M1Brd3dNSlNFbllZeHFxc0xld0FJMGNLeHJVRFVrK21kV1NJdW5EQytYUHgx?=
 =?utf-8?B?akhIMGk5KzJTdVB2bHlFdDJYOWg3NEJUZlE0SDNZQklWdmxFMDc1aEpweVRu?=
 =?utf-8?B?TU13VkFTZkxISlhuZ0FUVVM1bFpDaXF5cVJWa0JMSHM3ejRBdEVxUUh4bzZZ?=
 =?utf-8?B?bWkwRHlZdmlxZHlZOWY4dU1OMzcvOWhvMDkzdjVmbmhRSkJsMTlRMndNampp?=
 =?utf-8?B?TjFPVnZzYkxacFkzQ2wxemlWMzN2VmZBd25Lb0ZwL3hwcjVLWVRQdDBJVnMv?=
 =?utf-8?B?U3lNRnRudkFCL0hpWEZLRmlnb2pra1VIQVUwZTVqZTNUeTFqKzJ4UUdHZmd5?=
 =?utf-8?B?RHEyVmRhWDBPMGExdmJoN0NpV3hTNmdRSFZmTzdlMjFVQnc0UXNpdGtEcVZh?=
 =?utf-8?B?UTRRUUFZaDE1bUUySWJiSW1JRzIzNHNZQU1OdW5wOG9YT1hJMjk2cmUyQzVQ?=
 =?utf-8?B?eFBqbUxUaW8xZGVqMkJsUGdlMDFkUk43b2pqdzZtZW1vby9yRkFrcXJBZ2sr?=
 =?utf-8?B?c1NROGpsZXpTRVFCVUgwVVhXY1JlcWluOEhOZ1Rsc1BCcXV1MUIzNXp1NmxN?=
 =?utf-8?B?WW5rRm1ucVhWNGZnM1ZmNzNmSVo3T1ZWNzN2TGk2Vy9YWkVGUlJGbGdCN2Vs?=
 =?utf-8?B?NmY3NVo1M0RvUnV5b1cyMUE4eEJZbHB3VXV5bEFNM2lIcWQ2TXVQM0pacE5h?=
 =?utf-8?B?OEc1dlBzbDdreTk3b3pnYnRGQ2lVRW5PdXZBMDdsYkpKZFBuSEhxV09PNVRp?=
 =?utf-8?B?T3hvM3VBWWFYdVV5L25MeDIvdXFST0puOG44dzVyTjBDdkpZN09jMXViejNB?=
 =?utf-8?B?TFljaHpRY0V4cVJGZDkrcVMzR2t4UFVMcnpiT0VaeEs1U3h2NnE5eGdQYmhQ?=
 =?utf-8?B?QzlHUGU2WVZDVC9lUHJqRXZtZkthYXVyMFljL0xzejBJKzZOK05zWnFiZjhO?=
 =?utf-8?B?cmp6d2tCSGtGcmRlYlZhV3k4NGQ4SWE2ZzQrdHB6ZVArVnN3eVFMeUVCS3Nm?=
 =?utf-8?B?STU0ZjYvZ2syY1RwR0tISFBPZmx4T0p6dzNDb1ZxWS9BclhQY2pCT2N0bHE3?=
 =?utf-8?B?Mis5czVMUnc2VmJMRE9qeFdhZ1FVQXNxQ3VDT29TN2dqcUNZbnU2SmNickpj?=
 =?utf-8?B?M0MzdnU2ekxoakxpdG9NeEJRMzFMcHU5OUVYcFpNaG5Sd3ZINnViSFh1bkVl?=
 =?utf-8?B?cDJUWW1ib3lnMWRsUTVrekxPanpnZWF5cVNTc3dTZ2Q5SHVuREcvaFpGaCto?=
 =?utf-8?Q?+x7wSFyx7KxPQs3C2v1m4mw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 181b1c5f-9a6c-41bd-0e01-08de1b8f998c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 10:47:50.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Nt3FzEiTTGQfH8g155jSO6zKivQ2FD8NtYIdk9/9Vmtv0X+xTgR297hQJs6a/VOyb8SMxJMvANyhsHcM4g9Iz7YdQqq97AWsdYeJtbWkXnDDNnkYsG63ze5OdXFmtl/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8519
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

Hi Ramanaidu,

On 04-11-2025 13:40, Naladala Ramanaidu wrote:
> Adjust the condition to correctly identify platforms newer than
> LNL and disable DRRS accordingly.
> 
> Fixes: 734ee5297842 ("tests/kms_vrr: Skip DRRS-related tests on LNL and newer platforms")
> 
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
> ---
>   tests/kms_vrr.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index bcb756202..638bfb6a6 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -1057,7 +1057,7 @@ static bool config_constraint(data_t *data, igt_output_t *output, uint32_t flags
>   	}
>   
>   	if ((flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)) &&
> -	    (intel_display_ver(data->drm_fd) >= 14)) {
> +	    (intel_display_ver(data->drm_fd) > 14)) {
>   		igt_info("DRRS is not supported on LNL and newer platforms\n");
>   		return false;
>   	}

