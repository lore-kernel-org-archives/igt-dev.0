Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A98EC369A1
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 05:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C2110E0B1;
	Tue,  8 Apr 2025 05:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eN74PoSc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2462210E0B1
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 05:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744090992; x=1775626992;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Wu1njDCZe0aGlAgt8uEHk5CObV3CahpN8ifcZWOltcA=;
 b=eN74PoScyW08dDVzN4H6+Cybqi5k75YZKCns8FQ6XAoCHh873irJppBe
 R23TyfN/9jAD+srkUXhRNTe41Kq/gXR8eZtB5ZjT6hw7J1AEAsKL0pywR
 Y3yTh3O9OVov1iKHA0MHqRXQ2s+JYpOD4IpgI3yKUuIo1j2O1uvF6f8JT
 BfTTL1Ci/bjLtOg4057g4fFkJJj23B1g5+y2IduGJOzBYmP1K0phZSjyg
 kRWRTLQvlgO9bbDfusbxf+IOx7QvYH69+evM3FmYzyWSHEf69VcB7o5SN
 QXKAw2MR8UKpN3OTvG3F5dePJ0T/09zvlXJktj9GADUeFWmOIlOb6JAxm A==;
X-CSE-ConnectionGUID: WQpNvmJxQEy37LzfLMSF1Q==
X-CSE-MsgGUID: Q0u2uq5ZQ1S3Y0VreiAMjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45638669"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="45638669"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:43:11 -0700
X-CSE-ConnectionGUID: LQ6Le7RFQUiklmZq/WlzLg==
X-CSE-MsgGUID: WyuetehgRYes8eR6RyKdqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="128034087"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 22:43:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 22:43:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 22:43:11 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 22:43:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DyNON9dk4/Jyf5xUrIXFGE2N5+DrdQBCzrpSbxVeB+nsl+VOi6h2cGcWc+fRT2mcbqxH3AcslJ8uvqWSHqMDrix11fbCDVqLUxkziUpDmsZe4AvzIDvcC1dZ88i0NnOvEte4W0U+//6ZkvzpV2OEWYsgWYx4CmcA4VFUp33IIpni+3nQJV5nU/SSw41+JbBjVeGprhZAoRkQhRAA2pTAnZPnD8lipOg+8RIFwzVNEal6AXKU3JDZTS+T3j8S8k770MkklbBfCKTPdqUcEK1DsL5v1U2ZEAeOS1dqOOXVULrRAGb15HMCBBJdeDmQwKc/XOAe19rYGHEsbwBhW8lVog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjEiebbe9lYfETVsiP2zgnxzBYiPs6ye0WUIggtpba0=;
 b=Y0OXCDvUCwIeHsxVawmRlqEWQNPftgRhegnSCk7l80RJMDQvQPotwI3RvnJdHXhW17So06RMfwhDsLYh8WqHElPPXmw5yIkT3iuqBVaW3FO5v5VUantHOmwVfVLASRlngCEkQNSX/tWrvIIG2L6+O+eUpzqrLbAQ1FOE75/Jsvu8C7gWeifAj7iIPcLlSFDjvo8GQDgczFMXGzJegkBJMLu3YmrlcuYcI/IVrFhHFu90ov/9ZIXuyVvV4dG1VoAM0HXtNNzYA9BVF/bDYO++0hvOehlNGOlM6A6VCx3ittgR8RIZ1wiFkDZyj4J1EK4OLmiPgSFE1OtHEaTooTo6zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by IA3PR11MB9399.namprd11.prod.outlook.com (2603:10b6:208:577::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Tue, 8 Apr
 2025 05:42:41 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 05:42:41 +0000
Message-ID: <80b003e8-afa6-4a8e-9fd4-7f97fcc071f3@intel.com>
Date: Tue, 8 Apr 2025 11:12:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_cursor_edge_walk: check for display
 and pipe CRC before cursor size
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
 <20250407144504.2907700-3-jakub1.kolakowski@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250407144504.2907700-3-jakub1.kolakowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::12) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|IA3PR11MB9399:EE_
X-MS-Office365-Filtering-Correlation-Id: 865c452b-b60d-48bf-9d20-08dd76602dd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUJBRnRXdzRHKzlFK0FMVXpMQ3NBT2tPTlRuSjFSb29ZcnYxL3poNWtxNC9P?=
 =?utf-8?B?Wmo2YzVVRjhJbzdZMU5jeG9sbFo2ekRnYUtRTFBOcWtXWnU0RE5kMGYvWmJp?=
 =?utf-8?B?ZGhXTGgzZFc2cFYvZ3IvUzdOcVFES3ZYS3drZGxkRW1KZG44VDhUSStUVXR3?=
 =?utf-8?B?cE5zUFphZk5qelpab0VSdndwQkloSXRwQjJPSDBIRjFGeFZ2Z2xTYVhDYUJz?=
 =?utf-8?B?c1RRMnFMMmsxa0JhNUtkaGo1Q05DQ09lN3VxcTFyZG9MWU5mbmEzL0x5a3VZ?=
 =?utf-8?B?ODVkTHVSbTdoaVltSjN5WFVYWGdaRjF4UG5YL2NHV0w0NkRaemZzNkhSUWRo?=
 =?utf-8?B?MkdKNmdHaHdSSXJZL3BCUWR6cUFjV0ZvMFA4Q3JUVm9QeUR4REV4VmU2U3RW?=
 =?utf-8?B?SVV1aEx5NWxXd1FzZ28wWjBTQno2bjFydklDc3MzTkc0QXJ5RWlsRUFvdGpj?=
 =?utf-8?B?OWVvV2xlVmV2SkcvQ2N3VWdEbGtJcHBMWWZHSFJ3ZmoyeldCL2tOSkRZdkRB?=
 =?utf-8?B?eStBZXBSYzArdFg3eXVJNmg2cnRCTVBRS0Q1NjlMZG5iZ3NUT3FCWHk4bjFF?=
 =?utf-8?B?WCtFYjIxZUtJZXBjdkNJTzM0OWRoT1pGRkdEc0RsdTFJcTBjVGdmUW44SkZi?=
 =?utf-8?B?ek1UMHJtbXg2NUZvODdnRWNaVEZhTzVWeEdXeFVTNndJeDdVekhqdGhVV1oy?=
 =?utf-8?B?emJGaDJDcHNsbnV2dHJhRm85MmlaNTJ1SDFRam9IaFlHS1IwMm1VeURGNVI1?=
 =?utf-8?B?QzQ0ekpXR0htazBxOXM1dm1CT0EwekFBQWdzRzhmdDgvRnFiTlJ0YUd3MGQ5?=
 =?utf-8?B?WkdFbEYvdEx4Y1EvSnFHNHFoSDZCejdzOGhRcE0xRWNPM2hLOGxHUFlUUFc5?=
 =?utf-8?B?bGZVYXRQOHRMTlNSckh0WTFEdElNKzBvTW40VDNES29zVExjK0lEdFZEcXNL?=
 =?utf-8?B?RGRqYndwa2kzN2ZSSU8xdzgrSVhBWmZ5Vk5obHBGcEkrUFZ6a0NZRW5nWUdJ?=
 =?utf-8?B?UkhySnd6NUI5L0lPQzNzWlZGQ1VhNkdkaFdiY3lVR1N0K1JtdzVDQ2dsUWlC?=
 =?utf-8?B?YTdKSll0Nm1Ma244eFZSTDBoenVOYXFOVmhnYzEvelIwZ0pNNm9uRDRPd0JR?=
 =?utf-8?B?YkF0YVhYeWNMRG1lNGl2SXo2YUhpT1EwRjlNdmJLZ3p3UTgwNEQ2djRtcVlS?=
 =?utf-8?B?S013bnlUcFg2Z25tN1psUWU0cytMRUhPd0ZDRThFQ1hzSFJ6bUFiVng0RlhB?=
 =?utf-8?B?eU1GaVM4KzFsOGIwck1Xc1RaWVl4RkxmWHpOTVRBck1QZU1lRkttN0E4OTNh?=
 =?utf-8?B?dWZidVRFdmxkbi9XQlhKdUZQcVVTNHQ5VFUxMFQ5Ymk0NnhlN2lGQ3gyTEIv?=
 =?utf-8?B?TldrUi9WSDFHN1B1Rmdjd3d3NTUxczY5VXlSb0x5QkpNUWRkT3U0OFVXZGYy?=
 =?utf-8?B?MU8wWVQxakhtOVcyTmVLLyt4S1pPVTRpS2dWNU9HWFFoMkRyeG9Jc0d2MmRu?=
 =?utf-8?B?bmdMbkZ2OXRlN2ZrWi8ya09XbDBDVVRWQ1JSK3VEZ0w4d204NTEvcWtiOHJp?=
 =?utf-8?B?WDBGZUtRMU1wbmJUTElBMnFOVlRkdmNFYkFvMWlRRXZmNTVBMHlDWEtjYTZh?=
 =?utf-8?B?am1JM2E1Z0ZKVWwxVWV1N0U1dThHTnlmbTUxU2w0RVM5aVRjS3RZNFIyYXRE?=
 =?utf-8?B?dUJRQTdIbDBPU3Nsb0hQK1EzU2VjYjBLdFVmS1I2QzNJbVAvaUdTWEZIcWNK?=
 =?utf-8?B?ZjFlL0JWOW1lTVF3dzNhOFB5czV3b3BiSzFWSnlZRjRzYk1zU2NKQ0hjZ2p0?=
 =?utf-8?B?TjhzcU44bkpjd2loVDdUeThRSU1JNGdCbStjajBTKzNlSHRhblpOcG9VZmNM?=
 =?utf-8?Q?dnpdiVXBdA/LE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VitnVHcrWEpHdGI1QldCYlpxTW9jR3VsdEx1a0s0Sm5nY0RVcVJjYkoxbm9D?=
 =?utf-8?B?Tks5V0drNTV6azhRMWt4QmZpMFQ4TVA2Rzl5OHVQckFFalh1aWhHNHBmb3Jz?=
 =?utf-8?B?bWUzcVczR2pkNnQ2emt2SkVsQjBMWUE0b0Q2L1BmV01yaEx1WEl5VzVTZjgw?=
 =?utf-8?B?RXFwK0JCWkZIdDlXU3dldmhlclBaUktTcjJDZUZTTjhkcWJXWXdsVThjWHRr?=
 =?utf-8?B?VjdBajhMcVhydHZCY1J4TGxmdXJyZWdXWXFiV1JtUTVJa2FHbUk3c1dnRC9R?=
 =?utf-8?B?dTZ5UFk2TnBsa1Y0Sjk4cUlPZGRFcmJWTTdzMC9OVjBmemtlMC9NZm9ZcVZi?=
 =?utf-8?B?NldzOUE4clcybzUwWkVSQzNNMHM2Z0xQUWZsRFdFNTJWdmVQeUFzVGlWdmh2?=
 =?utf-8?B?RkgvOVl2SXV3b2VmQ1BlVVQ0L1JLSjlZaHpYbHFHSmpMZlRiZ1VVYnpZNytS?=
 =?utf-8?B?aXZYUXI2YytVRC9SbTlDZ3AzVGJrZnRYTzBaZGd2RlBWNHFURVpzdDM5Mm03?=
 =?utf-8?B?UXdxTDVNWk1MMWwya1Z3K2R6K2xVRzM0WGx6eWdicHQrU2l0eEphcmJzRDFr?=
 =?utf-8?B?cFVZcnVoTkZZRkhScjR2ZTNEN2FKSG5CbTZpK1FYblZtNkYwcC90dG13NlBG?=
 =?utf-8?B?TzN5TzJCQTZ3SHJNaDhFRUpPTllDcFNObzlZZHVMd2VRRzF3NkNEcFpKUW5s?=
 =?utf-8?B?VG1YSzlsRmZ4eGtMUWhreUlHSzdSVU5IQngxQTlUNzk1bEN5MEltcVFidXNz?=
 =?utf-8?B?WHMvTDZvNm1vOFlsK2UzM1R0bm1HaUdYUEt6UzlsaUlFNnN5WnFneUt5aWpR?=
 =?utf-8?B?Ykhta25yYmVlVG9FQUYxeDlrSnVQNEk3S0luRUJWcUY4RExXWjl6ajI5cWtO?=
 =?utf-8?B?TTRkdUZiOC9BRk1SanZ2OVVVRHovY25ka213SCtyWDZrTjQ5V0lvZzdTUUYw?=
 =?utf-8?B?cGRlWFRlZDBxNVlmL01yS0h6OEhlM0ZaWHhKTlZiM3FIRm1vbmRHUERweTYw?=
 =?utf-8?B?c0RPcXVzN0pzeUxJRm1EVDd6RDk5Rm9JZ016ekhxQVpHQ0ZqYjNSSjVrL0l6?=
 =?utf-8?B?NHcyTmtIb2toeHgwNXZFSDI2Sk5ZSWJPT0dlKzNnQkdGekJIUjZRdUl0Mmtx?=
 =?utf-8?B?R3A1NUZaZ3hVUnNVeE1QTjBiRjZZSFNBWSt4dHhNUXF4UTdLYng1d0IxNFNV?=
 =?utf-8?B?QVV4NlFjL3dTVHZqaUljeTcybWJSb3R0K0lPOHY4b0oraEprdGtCVTV5Lzk4?=
 =?utf-8?B?Z0ZwZGtnTTgwbG00bU9NMjhoZFZmRGc4UnVMOGoyczY3SDdObEZla0NKTnRm?=
 =?utf-8?B?ZjhZYmU3d28xMGdKZjVlUW1QVFlwVXRaZTdRSDBIRG5ZR0hETVZvSUt6cG9m?=
 =?utf-8?B?NFZmZVNCN3JEQWpJUUs1QUsyWS93UGhORnBmSTBLeS85MXhFZUJQZ2dmcHFF?=
 =?utf-8?B?YnRwNTZBVHhaTXZjZmFKZm5pNmRGQjhDRHRiUlpEYXduRlBiYThsdmJsVE1j?=
 =?utf-8?B?bFVqR3p1RkRYdFlOWGdIdVRTYW8ybFV6QklwQ1FTQVVnWnNYVXFjZDhYNVFh?=
 =?utf-8?B?TjVWcFZvQmYvY0ZqOWROWmYvRmtsd09LTTJ5YXZjMnM1MUJUUm9BR0M1QkZL?=
 =?utf-8?B?ZEFJT0JuQmcyaHNuREZvM2xsSDVZZDluV2ppL1FkR0g4bUZIUENOQ0NwWDhy?=
 =?utf-8?B?Y1Y3a0tMcXFSWW5oa1pXSmdOWHdUTGtrS0tEWTAwNnNzcHZ6VHI3QWNFWHBz?=
 =?utf-8?B?SndrczRvaWlGWXpscDVxd3JDZkRGNVUxN2VnUTB5MXVCdDZVMVExOVRpSmRB?=
 =?utf-8?B?eHdUbDJ4d0pJa0VHZHZtck1qdU9yd2doOTRVYlo1TWFZUmc5QmcyOHo2d1BY?=
 =?utf-8?B?S0xNQXIxeWtoQ2JuOXFHeVlUeHFYaXlvVml2bXZ3SXZmdGF5L2dXaHRKam5R?=
 =?utf-8?B?cFBmcE1tdzVFUU1rSGlrUVlIWndDa0xBbGpLYVFuZGFLemxsTjJYNXZSOFpR?=
 =?utf-8?B?V3VtVWppQ1JFbFhIMlZUYnlXc1BEQlRGcVJjSDM3eFpBNlVDZXRrYlFaREk3?=
 =?utf-8?B?eW5zMzBKbzlCdkdJWGFFNkUxSmEwZnBQTnpUajl6eGdNSkNmdGZRNDBZbzZS?=
 =?utf-8?B?T2pRNHFzNytZdXAyZFNqRkJZQnRuSUhmZUg2b01YajIxVHNqZXlsRUxjckY5?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 865c452b-b60d-48bf-9d20-08dd76602dd2
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 05:42:41.7278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aazZtojECZMr/VsFy7+lTviSNmhdCrE1oWCu7fkzfUrKoXCfdwV7VdwWAO6YdyHVq/PZ2mU75znz51jJN41wuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9399
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

Hi Jakub,

Patch LGTM.
Please add "Closes" tag for the gitlab issue.

On 07-04-2025 08:15 pm, Jakub Kolakowski wrote:
> Currently igt_require_pipe_crc(), igt_display_require() and
> igt_display_require_output() is called after trying to get cursor
> width and height which leads to fails on configurations that do
> not have display enabled.
> Move igt_require_pipe_crc(), igt_display_require() and
> igt_display_require_output() before getting cursor width and
> height so instead test will skip on configurations without
> display.
>
> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> ---
>   tests/kms_cursor_edge_walk.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
> index 858d1da9b..27bee4482 100644
> --- a/tests/kms_cursor_edge_walk.c
> +++ b/tests/kms_cursor_edge_walk.c
> @@ -361,6 +361,11 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		igt_require_pipe_crc(data.drm_fd);
> +
> +		igt_display_require(&data.display, data.drm_fd);
> +		igt_display_require_output(&data.display);
> +
>   		if (is_intel_device(data.drm_fd))
>   			data.devid = intel_get_drm_devid(data.drm_fd);
>   
> @@ -372,11 +377,6 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		kmstest_set_vt_graphics_mode();
>   
> -		igt_require_pipe_crc(data.drm_fd);
> -
> -		igt_display_require(&data.display, data.drm_fd);
> -		igt_display_require_output(&data.display);
> -
>   		/* Get active pipes. */
>   		last_pipe = 0;
>   		for_each_pipe(&data.display, pipe)

