Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4AD10399
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 10:15:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05DF310E565;
	Wed, 26 Nov 2025 10:15:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RhedhImk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3060B10E565
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764152120; x=1795688120;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=LsesFBFjulf5lHAhy/a6QbWSpXhlfS52GJ/hq78iF2M=;
 b=RhedhImkPeAE00vIESiJOZ8M+3UY2niAf+6Lmq9fOyYDV2wOdWIyhSZO
 I7tbvhzPj993iXt1CWHvpdD+uY0+cbsjBc4zjYfT2113rrgZCOpQi5LJS
 IRYVS4GQp7m6sP8VOUvjAcCL2ar2rbMN0+G06Bhk6v60Yoy+uLhHw91Xp
 aU0svelu2ZQ42W43lcWKo8FP9slp1T6fjabkyJzWsT3hEsv8e/LgvMDCz
 dojd0GVtCfFIJSDX33otArR/CecEFMjychdVAZcEONX4cfszGRIlffrxL
 R7R87UorXHq3NOeAwqpZcxulojH979TuFNB7f6kNS6dZJwd9NeWQH9+t2 w==;
X-CSE-ConnectionGUID: WWolVI6CRR+jkrfxgMXxJA==
X-CSE-MsgGUID: So0el3PLQ56w+DabAPiXhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66225981"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208,217";a="66225981"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:15:20 -0800
X-CSE-ConnectionGUID: z6HmQ/TXTUOLA07WZaOFUw==
X-CSE-MsgGUID: etXO+1TyTVCUkFZzjJz8pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
 d="scan'208,217";a="223865146"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 02:15:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:15:19 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 02:15:19 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 02:15:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xA4uOvw+cVvBJOOwiVrk790lHff6ObPqcmaZSUiOjMbO5Lkodfe6MUO1VeKAXh5kk6ISq0fnPKbZ11dtdOTF9hJuxaYVFCBF9SelwQH10C1ns+4AeDNPnO0IqnKSKaouVWX6CF89iNZCPb/QaNsvk22N/3Etr5wzt+G34SC2mm6TOTwctpdCMZsc06i1ur2Qz+DiSe56y7UAsHElfPwSa0e825yNXB0UbSQqonOPxfirWac7tg913wp2p/MzKH6HKsfIEm95ypmp5+EvEmmnQkTgAJeegIpVKfz5Mon31oh6iDUW+50T8USSuMwB2rqV8YjwRzkACaDFganjtq0ktQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6cA6jPKdIYn4Z2ITyMGU9nkaap7Qs1z/iHmOZcDtGcE=;
 b=exN3gcAKScCKd89a6bsMUW1CrEx2XJ+xYRK+TBzPN+VhPtUqNcwO/rhfJeqDM8HGzg5IaNT4FGcdzFrJsQR0buBUxpseqkAxfoYXI9aEdUc0U8B7LBF7qMEhzcgTXxYUZu8rsQAcWC7Yy0aFOpdaGyuMO6HKgPXfS7NII2bwTm+6T2NUCQ1/6jd9K6XA69KBysQPWpgNcr8QDak7tPVk29mnyRJJ+NTiPSO8fAfQqu52sPQOlhgYo0iDGV2mIomzalxwt+zA8azqFv202MBZQ60I16wssRpN0UN5CuTQZJ9KZjaAWm1Vgo3EKDLwypjoPB99d/GWs7J72uudz6wNMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DS4PPF691668CDD.namprd11.prod.outlook.com (2603:10b6:f:fc02::2a)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 10:15:11 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9366.012; Wed, 26 Nov 2025
 10:15:11 +0000
Content-Type: multipart/alternative;
 boundary="------------rfV0iNqDffH0BDRtMfB4YHQI"
Message-ID: <aa20bdb3-bc4a-46c2-b5ac-e576d049b31a@intel.com>
Date: Wed, 26 Nov 2025 11:15:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,5/5] tests/intel/debugfs: Move VRAM MM checks from root to
 tile-dir validation
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Stuart Summers <stuart.summers@intel.com>
References: <20251125165028.36533-6-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20251125165028.36533-6-piotr.piorkowski@intel.com>
X-ClientProxiedBy: WA0P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::19) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DS4PPF691668CDD:EE_
X-MS-Office365-Filtering-Correlation-Id: 9358df83-c6ed-4390-34aa-08de2cd4af00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3cyTzlVMW5ZbjN1YWdGdUd5VitJNXQxcVRWdkFURUhUcmRQWWx0K0JmL1Nu?=
 =?utf-8?B?eHBjYzNUM0s3ZlhaUHNOREpDSjRxNDZZK0Y0a05sZTh3WlFmU01kWkRFRkho?=
 =?utf-8?B?em4wRFEvcTErWVlZY0g0YTJ2bjhFcGhHWkJJYXl6RS9VemllWXBmYzQvc2kw?=
 =?utf-8?B?UHJ4ZzNjcjE3dlM3Rlk5VGRWUURMSTJ2YW5ZMlJadGJ1WnJabmZMQkhhVjhH?=
 =?utf-8?B?V3FkLytMcVZqVCt1M25mYk5JTVdsT3Q0anRxbGJ0VE93MnVOam9JbWlkTytk?=
 =?utf-8?B?TE1MdWpFYmF6bytVWXVGT1FDTXYySmpORVc2L2JxWEZXYjJVQ2VGcWJhTUdp?=
 =?utf-8?B?K2FXOVRpVGp6NGhiM0JLeWVpbkUzUDFIT0FrNzJJc3c5SmFoYkhaTzlrTlBI?=
 =?utf-8?B?UW4ycTNTb3BCTWNXUllnNmZrcW4vSk1jQmN2WFk4MzVrOXJEM2hKUFVXeUNB?=
 =?utf-8?B?cmkxcUxLTVJUdGJ1Mk5TMGllTHNlUHgwdzUrNldianAxc3huNmdiZjFiMVZw?=
 =?utf-8?B?anVUQ1VnekxkdnBTV2xqNHQ0bHQxOHZPTms1OW05WlE2NTdFT1hrZjBQdTZN?=
 =?utf-8?B?YzZSamovaXBKUkJnSE9tN2FiT3NxSGNzNHZyZnF6UTFXNmRZY0kyamZUdW0y?=
 =?utf-8?B?YXZoREc3cnM2ZWQ2cnhkOUVXWTdTMEdVMVZnQmN2by9zZUFtWmpqZU5jWEtR?=
 =?utf-8?B?YmRmc3YzLzR0dSs5Z0FKYnIvZjBzRC91eE1rRlhJR1RBRkF4RXd1TlJWaGJG?=
 =?utf-8?B?c2JJdGFFaVlzWW9PdytxYWJ0SzU2YmxvMG1mTmVjWm9wZXBhdjFZTVN2bkFl?=
 =?utf-8?B?Q0hZMmhpZ1MwZUNkY2VLQ1ZZQ1FJdEZvTFdrSTJOMjVmK2hnQXE1TnUvcUx3?=
 =?utf-8?B?L3JiZW1QUlJYMzRBM3ErbWtjWVFDVnozS0l6NVJKQm9EUFRqclVZNWg3YjNi?=
 =?utf-8?B?NE1zUFViY0ZoUHZGQkRqQ09yZ1JSdDFtV2RaaDgyWU5QY2tydXgxV0QzaVYx?=
 =?utf-8?B?dzJqek03YzM2eEIvZnNRaVdFM0tjQUZzZk4zVCthU2cvT0VJdXNETVlYd0pQ?=
 =?utf-8?B?VXU3TzgyUEI4ZGovSjU4RFBiek01WGxsdW51akZHNVhYdzFhOG9EU3IwS25C?=
 =?utf-8?B?YjhNdmRvYnVXUmRmQVlrcmhYNTdiYU0wZVJWaG1BbW0vRDZIWlk5QjJzakc5?=
 =?utf-8?B?Ujd3MnBVRy9EZzVMeUUwWFFqOGJEdlVHYmJpeE1IOFo3WEZ4WHM1RmJESUZ1?=
 =?utf-8?B?TGFVeTUyTWI5UDl6MEhHR2h2K1I4WWdZelZLUVgwdEk0WEpqdjZDTUJzbnk2?=
 =?utf-8?B?V2tHMVpaczBUTXVvdDhqeGJXbWVqZjkyWkFiQWYrbkhoVmZkT0ZKVGtOUHI5?=
 =?utf-8?B?TUkwVGNOSGdoK29YWUVNSytneG1CWWw2MGVNSmJqSU9WaXBjMEQwekJTdlFC?=
 =?utf-8?B?SmdwTC9NTGszbnVmQ3BYSjI5QzhmK2phTnlQc29qVmhSbWhYM0RiWnowbm9W?=
 =?utf-8?B?bWx0UzR1OUpzYjR0N1lFc1g3ZTFGTW83ZG5Wb01GZVJwd2VYRXNkZ1NMV0s2?=
 =?utf-8?B?ZHdzaHd0NGdsR1Z4TWt4Um0xV0pOZmMweTFLNmdXL0tFWGNNT2liaUI4SzJ2?=
 =?utf-8?B?L1BDa0JLQlNkU1VJNk4xeWZjNURoOVdkVlQzMmJrTS9Ed3RodXBiMWEvL05W?=
 =?utf-8?B?THN4dFI0cWhMOFR3OG9YSFlNN0F2WS9DTWZ0cVhPdTN0SzkyWmgwZFVHMWZ0?=
 =?utf-8?B?VFF1N1JjMGV6Q29haGJ6NExicTFVcU1HeWZKcFFwSkhLc1pvWEJCR1RjVW8z?=
 =?utf-8?B?ekJ5Y2svdmUwVUwzV2pHekw5RXk1ZXZtU3JhTG9icWRWbmNLN2FVYU1LSExC?=
 =?utf-8?B?dlNGYmFXeGRoNjRtbFFzaUtJT1U2SWs5bGNtT3Vvb2pzbHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDNsbER4S1RJdGIyZHI1ajdocG9yOEl4OVFGMVJQMWMxb01FbVBqTXZnZjRh?=
 =?utf-8?B?THRvUk9JSnd5TXZLV0pIN2FYNy85SzlreHdSenIwTXdVQWVqTkhzMUlOR0dx?=
 =?utf-8?B?WHZtYkg0OUl3QzFjSkVPVnZtNWpKai8rWW1CNThETU1XY2lhakU2N2RYQzBr?=
 =?utf-8?B?aFRPcFBJMkluN2NsR2UydjVZR29uSnVEQnhDUnFhWmw0cjlTZ2Fmdjl2RFA0?=
 =?utf-8?B?RHQxT3g0c1Y5U0pRNXZ2VVFHNFRlS2FOb0FoNEdWa0J5L2NMdHFEOTN1TWpz?=
 =?utf-8?B?bFoxOFljZUo5SHRYNFJOYSs0TWI5UFZRLzBBSmo0bVNDenJPbmc2SHpaeGMv?=
 =?utf-8?B?WkNGb08xd3REVzJUYVFrdmkvSzNoQTJNRXFxTWFIZ21KamcwSEVkRzYweStu?=
 =?utf-8?B?WXJCWHVCZFE0cWVJSUp3TXFsdmdEVSt2elRJTzN4RGFPZ3psT1BUWCsxdDk2?=
 =?utf-8?B?WlJRY2dQamNmTU8ybVMwVjZ6dDc2UExQbHNqMmx0RU5QQlZveC9qdTFqOGFP?=
 =?utf-8?B?Q0FPL0RSR3B1UlF5aWNlL3ZNQTBRUmdBc2lkVWhNd3pxdnU1ZUVwQVFsdm83?=
 =?utf-8?B?WUVhdHVuTlkvaFFzMUJPME9TYUtDMWVRMnFXdy94dEpVSTczc2NYOFFGb1d4?=
 =?utf-8?B?Y2xwODRXTCszK2JVeERlUjlYVzhwSWVjdDZqZnRlS0tIL1cvajk5ckRBb2hq?=
 =?utf-8?B?QWwvUTEyVzJ1QTVqWklhcFdER1ZHT2p6TUU5ekV2ZkpzSGF6R2pHanU2UXZU?=
 =?utf-8?B?MzkyUDNVWVhKMjFIYWx6aTBFbW40eVJZUW82c042Tmk4WnMrZ01XbkNVd3dP?=
 =?utf-8?B?TmhLa05ZOGJPbWg0L0haNFJJUVE5OGs3RnlmdStqT2RRTUJYRThaSXF6Qy9k?=
 =?utf-8?B?Um1Jeld0cFR4T3o0a01CaVQwWWg2SFBYbFN5YUt6dXd0dWZaWTVpSkRCNktU?=
 =?utf-8?B?NGRReklDdjVOSGtaZWlVbTE1dTBCZVNJY0EvMm90THkwNm1mamVzVnp5OWtj?=
 =?utf-8?B?YnRXZGRNdE5tUkNRN09GQmlrMTdtWWxudUhUWXl1L2pZQ2p3YmxWMW9md1M3?=
 =?utf-8?B?ZDA2eDRody9zaDYzVGVZeG5aTEd4cEk3SzBoZjNQRDRtZ2t2SXFhdE9WS3VT?=
 =?utf-8?B?RmY1U1JzTWVlUHN1dWFncnQyZ0E0SEo0amhlNFpwZ1NPS0lGSzhVNUE0ZzVa?=
 =?utf-8?B?VEFWKzRPNVRxcDFUWXRKcDJIY3owbWFJQ1E0SWhJbCt0RSszTHd2bzRtdEVR?=
 =?utf-8?B?Zm9UMlJ4RVNCZkdyWUNueGFuMlhMTW1vRTdnTXJaTHEvSXRZNUJDOXlab0VE?=
 =?utf-8?B?OGRCUWJQQzdIWDQzSDNBUUQzTDVTNENDQ01WQ3c3SU1USmY4dVBTMWZYK0xv?=
 =?utf-8?B?V1A4R29FM1luOUVrYkhyK2ZLU2RKMWIyaGtGOE1jRUhxMHdXQU41b2tOWkJj?=
 =?utf-8?B?bElFRXZVK1AwNnMvVGRKeEJJRWlNV0luS05KL3dXN3R1cnNNSHJvSjFaMHg0?=
 =?utf-8?B?NjZ5THNYYm1tV1RrNmxrWGNPR1R6ejFsdGNaZGpMM3JnT0FxS2pjTnAvNEk0?=
 =?utf-8?B?bEZjaUw5SFF3WkdtWkY0RWhjRmxPSnhENURlN1NQaFR2SVJGbENMWG1aVU8v?=
 =?utf-8?B?VVZiby9RUFk5b012Qi9GdnJGUlR3NHZnM1g1dmF5c3NVS2Z2TkJVQ0t5dUxP?=
 =?utf-8?B?K1lrcHE2WjNKdUtFYWFhSTQ3UitNSDVQZVpoNngxSEdoSEliNEF3b0ZUdDBx?=
 =?utf-8?B?bmtrS3FITk5PL3lvbGF5Q3Y5eWxoU1VDOVBIZElrd3pSYlJzZWMwNDlKVElp?=
 =?utf-8?B?cENtTGZLbHZ0NVJkVWdnOFJyY09aQmw2OXFiSHdmNTBjcTN1SVdidFVHWTAw?=
 =?utf-8?B?L3dmTlRLUFAvWE9TbFdxRXkzU0luUzR1cTM4UXl2ZHNBMXRNYmRxbDJNbTJp?=
 =?utf-8?B?dEU0MzN3ZWs2bVFQcm1yK1l3WlZhKy9kanpmbFVnQ2ZYcFRodmNjUS90bi9K?=
 =?utf-8?B?a0YxYjNHS255TEdNQXJpdjRnYVlYNjdpUlBBN3FxRTEyOVNwYUxLaERkOFhY?=
 =?utf-8?B?MTkxSVhvVXNWYlVJSzlwS0lxNUl5NHBNeFlmSXArckNqWkQ2eVh1WndaaEVZ?=
 =?utf-8?Q?5LUywqurkcnctLAifozhQ4sua?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9358df83-c6ed-4390-34aa-08de2cd4af00
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 10:15:11.7467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Da3yjIc7fjgdX7rYTYApC6/7dcOPDaxhyyCkvTxJSGbDF5SDP/BPdVW9W6gJpO+ZA8Yl+x8Sd2n5jrz7qCG8Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF691668CDD
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

--------------rfV0iNqDffH0BDRtMfB4YHQI
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 11/25/2025 17:50, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> Let's adjust VRAM MM debugfs validation to match the changes from [1],
> which move the this debugfs from the root level into the per-tile

"the this", maybe 'move the debugfs entry ...'

> directory.
>
> [1]:https://patchwork.freedesktop.org/series/157089/
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Stuart Summers<stuart.summers@intel.com>
> ---
>   tests/intel/xe_debugfs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
> index 705b80ab80..b85acb1dc1 100644
> --- a/tests/intel/xe_debugfs.c
> +++ b/tests/intel/xe_debugfs.c
> @@ -245,7 +245,6 @@ static void test_root_dir(struct xe_device *xe_dev)
>   		{ "info", O_RDONLY },
>   		{ "name", O_RDONLY },
>   		{ "tile%u", O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
> -		{ "vram%u_mm", O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
>   	};
>   	int debugfs_fd = igt_debugfs_dir(xe_dev->fd);
>   	int missing_count;
> @@ -275,6 +274,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
>   	const struct check_entry expected_files[] = {
>   		{ "ggtt", O_RDONLY },
>   		{ "sa_info", O_RDONLY },
> +		{ "vram_mm", O_RDONLY, has_vram },
>   	};
>   	int debugfs_fd = igt_debugfs_tile_dir(xe_dev->fd, tile);
>   	int missing_count;

With description fixed:
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

--------------rfV0iNqDffH0BDRtMfB4YHQI
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 11/25/2025 17:50, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

Let's adjust VRAM MM debugfs validation to match the changes from [1],
which move the this debugfs from the root level into the per-tile</pre>
    </blockquote>
    <br>
    &quot;the this&quot;, maybe 'move the debugfs entry ...'<br>
    <br>
    <blockquote type="cite">
      <pre wrap="" class="moz-quote-pre">
directory.

[1]: <a class="moz-txt-link-freetext" href="https://patchwork.freedesktop.org/series/157089/">https://patchwork.freedesktop.org/series/157089/</a>

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Stuart Summers <a class="moz-txt-link-rfc2396E" href="mailto:stuart.summers@intel.com">&lt;stuart.summers@intel.com&gt;</a>
---
 tests/intel/xe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
index 705b80ab80..b85acb1dc1 100644
--- a/tests/intel/xe_debugfs.c
+++ b/tests/intel/xe_debugfs.c
@@ -245,7 +245,6 @@ static void test_root_dir(struct xe_device *xe_dev)
 		{ &quot;info&quot;, O_RDONLY },
 		{ &quot;name&quot;, O_RDONLY },
 		{ &quot;tile%u&quot;, O_RDONLY, NULL, tile_iter_mask }, /* tile0, tile1, ... */
-		{ &quot;vram%u_mm&quot;, O_RDONLY, has_vram, tile_iter_mask }, /* vram0_mm, vram1_mm, ... */
 	};
 	int debugfs_fd = igt_debugfs_dir(xe_dev-&gt;fd);
 	int missing_count;
@@ -275,6 +274,7 @@ static void test_tile_dir(struct xe_device *xe_dev, uint8_t tile)
 	const struct check_entry expected_files[] = {
 		{ &quot;ggtt&quot;, O_RDONLY },
 		{ &quot;sa_info&quot;, O_RDONLY },
+		{ &quot;vram_mm&quot;, O_RDONLY, has_vram },
 	};
 	int debugfs_fd = igt_debugfs_tile_dir(xe_dev-&gt;fd, tile);
 	int missing_count;</pre>
    </blockquote>
    <br>
    With description fixed:<br>
    Reviewed-by: Lukasz Laguna <a class="moz-txt-link-rfc2396E" href="mailto:lukasz.laguna@intel.com">&lt;lukasz.laguna@intel.com&gt;</a><br>
    <br>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------rfV0iNqDffH0BDRtMfB4YHQI--
