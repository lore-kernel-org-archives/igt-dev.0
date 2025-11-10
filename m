Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1BECCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 05:15:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DAB10E16D;
	Mon, 10 Nov 2025 05:15:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbiASDSQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D6610E279
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 05:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762751714; x=1794287714;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=zkAiTRgBrS6K9l2VH94uvmsOObWNb9nGcJoXhgUcEyo=;
 b=QbiASDSQG85xRrRx623hH/ROTNlXTz3x6o1ifRy7w9ai5wkxzoSRnIIZ
 T+p/jphJ0zvHYonlNwk3Y99dQEIyT7dU6xxoZyS2SbSDCoN49GSWYP659
 KrcE1h4X8OVCFWtodpzigIStxEcfsQQe7eFMJgfxMb1W05ypr1YpSsyOi
 jhiRbodzXl6vkzy5Wze4t5+k3D51G3zbRbEhMHPaSN68cfZAgVnRjFlZb
 Io5XdKhQfnKnVp5DLBu9WQeo9kBNqCzH1rAQeER/0bSk3xul6AS2MAvqX
 k8TbITVVJUu6IPAJhVVDl+wKyrbjU7879SCh8pImkPUcn42/I+Lo2hNXC Q==;
X-CSE-ConnectionGUID: B88GjJzURb+oBZYnevm7hg==
X-CSE-MsgGUID: O8nyQQadSXmWrfcdhc9W4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="64888107"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="64888107"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 21:15:14 -0800
X-CSE-ConnectionGUID: 8TLdf4v2RYy/gIS6RyIUPA==
X-CSE-MsgGUID: 83UZmIjIT4KmNqC98Vb4/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; d="scan'208";a="188417367"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2025 21:14:53 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 21:14:52 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 9 Nov 2025 21:14:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 9 Nov 2025 21:14:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDt6df8V6V9Z+Ukx0HoqUa5sqid4SIb8vskc3rPMCV1y+lT7O4tmibj7aZa4ronJD6eua+kpMCn41E23uwx3XykNLuqmW8OJAEHhCccn/Kd22hVsCub/RL429PCaGfITrc+eqS/cvDYz65U9k4CRtZiAiCgORNkO3NvaQoIKGcEKCyTqeLWTG8CGMVir4iyKK8xapBKn42sgBS0ek5PLumE6f4uYveg0Q7c7ZwNHFkqLB4hezo15i9beZRX2MDLsl/mRUFLiiZEhgk0QoZ44V5YlkWt9RZHw/Z98lJFxIxaHQlF1J/cS8u4FaDSfuVmoh5BjxXdmmb7kQa0P6oE6xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxRZwXRTvoQ86BGpiKNHT19zci2sm64vfjXkbbYH8aE=;
 b=PB9zqqzosWugbmm0gzGjldFiCDdLavPe8oYsXSROldWNsfqZZJ9H75c5R93adpbP9HZGFCOC5G5lRGN712r30ASrTopVwNlnHJygO9w1GNr+Y7AeoXyKNATygw1VATTI3NBcVam6M6aWXh74QiLVDWn714zPNwi/SzjGH9/v/hjFzN5cTh4ygHdpQIninO3WGmOQ/PrDASxEoW8WEpmsZ6CFJfCrV9hoshmBY+Ds3jChFoyHamlBkKvq2bYRWTGcMAi3bz9ePkJ08dpAeD202z5HsBruLIGv2AgQCC+X5ss1vrqkooj4br1CvSuPpFd6AGKYOnlcW1pf9eoYpuxshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by DS0PR11MB6470.namprd11.prod.outlook.com (2603:10b6:8:c2::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 05:14:50 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 05:14:50 +0000
Message-ID: <7ff2e650-032b-41af-8206-008f48061dbb@intel.com>
Date: Mon, 10 Nov 2025 10:44:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_atomic_transition: Add info messages
 for skipped subtest
To: <igt-dev@lists.freedesktop.org>
References: <20251027061057.2996401-1-sowmiya.s@intel.com>
 <20251106095208.3051901-1-sowmiya.s@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20251106095208.3051901-1-sowmiya.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::34) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|DS0PR11MB6470:EE_
X-MS-Office365-Filtering-Correlation-Id: a7112eac-7749-42de-9624-08de201812cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0JvWUgvai84RWp1Y3BDL1RDdFh4QWROSlRjUEdwTlhuUHdWVFlQeUM2UVlu?=
 =?utf-8?B?ZWd0YU5USmdnVGUwMFRpbWYxb0pWZFhXWnVGTkI3OTZaaFBpdEhzUVVUbEo0?=
 =?utf-8?B?SU1zNHFaSzR2UUZRa1pnRFhFUGxMUWlTNFRXK0IyanlLOE1Kb2pGbldjZDN1?=
 =?utf-8?B?ZklHUVhDRE1SU3oxMmVMbEVRNUtMR2xQRjJ4WEVXQWxIZU1Dem94VFZiM3g3?=
 =?utf-8?B?YjkvejJyeGtTWUZyVGJTeXZHV21QUVJyaGhLbDV0VSt2c1puVnNJdm9OYjRN?=
 =?utf-8?B?anBzTy9ZdEIwWGNMV2t5VlVkWlczc1RTTlZHQ0ZHc2laa1VzSFlQVGN2bmJj?=
 =?utf-8?B?dnlNMnZ1UVhrUndxSXRDcit5UGRyM05TaTdrWHBDY2hlYXA4Y1ArL1Q1eEY0?=
 =?utf-8?B?YThrbXhTTUV1eVZNdmxCazZDWlFPcmFveG84SmdTTkhTTjBBL3ZwbWJDMjhD?=
 =?utf-8?B?RytjNFB1OXFsQnZFQ0JOL0dwMUYrQUdEM3gxalNKL09nVmQxbVY0RnhzL3NV?=
 =?utf-8?B?dUE1dk9lQWNyWVhXZmJ6UHg3cEJ6SERzbGNabEVOT3BwNTV6TGRrZjAxdHZ3?=
 =?utf-8?B?cWttdUMwQUVQdkMxVzRuUGMwUTJhdllpMktwQ2tKQnhWbFcyeStOOFNoUzda?=
 =?utf-8?B?MDFrcW9NOFRiTGNPYTRnWlFsK0V3bGYrQXUyS0FaUWU5dU1ldmhpeWl5bDc5?=
 =?utf-8?B?elhHMGNWTGNqTTBkeXV4a1IrWWVVWWxhQ2x6TDljKzU0aExSSVhZc0tubGRm?=
 =?utf-8?B?b1FLaXBqRkphelRQMlZCaldHbjllT3N0YVU5ZWJDTVROaFF2cURka1RLdzFp?=
 =?utf-8?B?OTNiWmhGZFFublhPZ0s1TTJCWk53b1NIN3kxcUJUcThneHhWcVdEMjVXT0NZ?=
 =?utf-8?B?VmFzQ2FyMk4relFJWGpTOFZjeUVtMjRpMjlzWjVldFBoTW9sbUtKVDZOUWVl?=
 =?utf-8?B?bjRta095bXEzSmRjdnlvclZNSlRIQ0lkdGpTb0hYSGZRYkZTeXVRNi8yY0gz?=
 =?utf-8?B?b0sxYlFzRTRSWUJ6Sk8xbVNPQjRnWElwOUtzeWZZM1htUStEbHRUelNNa0c2?=
 =?utf-8?B?eWFGTm8rK0t5UkdvNlBvNytzYlJaK0ZpVS9PSFQrQ1JjSUlzUjkybjlnSzhw?=
 =?utf-8?B?ZHVIUDltMDJpNXhJSGp0VWk2WXBOaEdTN3pmaytRcTc2MldpKy9MMlY2YUpq?=
 =?utf-8?B?UVJWZW9XL2pucXFoanlOWjA2WGlkYmVYQVpXdGdDWGFtZXV2VVY4bEZISHlP?=
 =?utf-8?B?QmtMQ2xYSmhnYjdlZDlLK1NGUldLTjZ1aFVtck52b3lsM3BTOFh5aDFuWEVF?=
 =?utf-8?B?UzI5aUQyZ3J0bFBDTkFyNkZaQS9BbWZWM3NxVGhnQy91U3JGZXpIb3Y3WWEy?=
 =?utf-8?B?bVlIbzFzcER4LzJNcmVHaG54amFUdXBqU3JFcHBuN1g2R0F1YkJvVEo4d3hy?=
 =?utf-8?B?S2VIQkFMTHVldTBhTjQxbUpOalg3QmpURXFRcGRPQVV3K1NzR3hKVStwMW9P?=
 =?utf-8?B?LzFGYXU5QnVxYXI2WSsrYlB4TUFyb0VHSC92K3BtWWhZSkg2dkFsekhPN3Bv?=
 =?utf-8?B?c0c5MEY1Wk51WmxiWjgvMVpsNis2U3BDK2J3Ui9RZFhQeUp6TDNRdEVDRndP?=
 =?utf-8?B?ZlJzL05VTU5tY1ZKK3IrR3Y2Q1Nad0Q0SlA3b1RCUXZuWFIxdDUxQzlKUW85?=
 =?utf-8?B?eEpLeHFmb0l0ZDNrakJEa2h1NmVvUFR1ZURzUVhxMUFFSk9vRlhHa2xOY2or?=
 =?utf-8?B?T0lSWEZxdzdoV0RWUzJIL1RWaHUrRGx3LytGb2pqOXlTYVluSFA3azFUUVUw?=
 =?utf-8?B?YWUyT3JSOTlrTndWcjRIWEdHSkVhVzN1Uk9aLzMxTkNtSXlnVGF2RkordmFL?=
 =?utf-8?B?aUZXdEdLWFJ2OFdKTDdtRTVpWDNHUk5sSk5PMjdtWmt4VDh6bi8rYmN5a1hL?=
 =?utf-8?Q?/zdPfDOSVA+zQD5+IuqvmFwbjPYdAjev?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wk9HT2lyRytYYUx3OWpQMzRWNnhqbTVjN0xGZnlaOXl4b3FhQTV2MjQ4LzJB?=
 =?utf-8?B?MEJBdzhENGtJeTNnNlE5bmthZ2ZzSHJoRytTYXE1d3NlcXlOODc3V0I4OHFK?=
 =?utf-8?B?REZsQ2dySjd2UXJNOXBESEU2ZDh2dm85cXpiZGJHelJsSmR2bjl2REtsd0hH?=
 =?utf-8?B?SlFlbHBxZzlDNWNET0NrRVpxcU5lR1RZczhYZE8za2s4VHNpV2MvRlp1NTIz?=
 =?utf-8?B?OWNvZVgvWWs3dlBQWWdEeFFKalQrLzM4VkJpSE5vT1MycEg3dERicTBrSGtV?=
 =?utf-8?B?V0VUOE9pRjBaOWZhWEN0eXJLcEIrUWxwS1NJK3hWRStFZExRakd6U1grUVFy?=
 =?utf-8?B?ZDlsNU96NjhCWnVVNnppOHYxYWg1VHN0UGlWZjJHUkNsMXp5OGdNRmRkRG5u?=
 =?utf-8?B?YTBycGtJeFJoSkUvbzhwckkvM1VoRUhGZWQzd0tLREU3N2Y1eXhPQS84c2NR?=
 =?utf-8?B?NHFRcFZGdTdlNDk3S0lWL2pWZ1dCNG5namU4OUdjLzl0YXhITWFVdWRNQ1BM?=
 =?utf-8?B?eU45R1ZJdWtQOC95WUN0SllPNVpvR09YQWlzbnJyc1RUMmoydFErbVdwaXpG?=
 =?utf-8?B?Y3dBaFVPdm1HMEgvcVhuMGlha2pCbGFoNmdDaEdRSGlRczZKMVZtaXJJWEw0?=
 =?utf-8?B?VGJPY25RcXJJR3d0R25hSzhBUXQxQkJqYmlWK2tIaUhUa0l3RFF2V256Z280?=
 =?utf-8?B?bE5mWlEyUlRXVjJzcUUwVEx0clNtM1g3YlVKVFRIVDRGbEVBT3RzSGhaeGJU?=
 =?utf-8?B?NWxLNHl5ZmNxUmVINGZ6a3RkUGp0aVh6bGxBYUloRldwRmVuM0ZwOWlkSE15?=
 =?utf-8?B?NkRrUVhDYkRzWDRLMkFacGZtVWtiWlB0SU1iaDBqcXlHVFFYWTl3cExONkQ4?=
 =?utf-8?B?eDRzWTVBRG1xSm04MmtYWHFoUGExK0RHQ3JtWTJCcjM0dC8zNjJzNnp1aDhi?=
 =?utf-8?B?SlNpKzJlRzU5KzZOK09GeFZXdE9KVk1XYjdicVVjNDZsZ3dHK2JpdkJjdE8r?=
 =?utf-8?B?Q09XNlRUbks2U0FXcktpSFlRQWhLYjkrSUJyLy94TmNwS05WU21xdVo0Z09O?=
 =?utf-8?B?d1lzUHZVWTh3OU9qc0hlYVdValJOcWhvS0VFd095Sm1uQnFKNkZaWVFvZXVt?=
 =?utf-8?B?clhhdXgyakZwZVJaMmVWZXZ2THA4cW9QdFp6VmVxL1dEWFhkdDYvUG9uN2Uw?=
 =?utf-8?B?RlMrNTBHTEpGQmNrZ1JoU1ZDdHA3c2E1WDB3MVY2K1d4U0xMeTFBK3ZOZkhz?=
 =?utf-8?B?Z0d1QVkrY2RmRnkrOW83TUptRjU0bVlGQzZMbVNldlJlalM5dEdTckxLNFJI?=
 =?utf-8?B?ME50K1liR05wVHhZTzhIUjJrTmkraEZkMmtNU3ladE9wdTdNVUplSW9pTFJ2?=
 =?utf-8?B?Q0xUbncvaGNBRW1wd3pVQ3QrNEx2WFJTQTVQRWxaOTF1Z21GV1kzQUFwUjhR?=
 =?utf-8?B?b1pEWm4wa0VOR2NReGxYK2NBamIwd2tMc0pLL1FudzhIbFdJOVpudzVQU0hO?=
 =?utf-8?B?c3p5VW85ZzlES2xzUThIOVl5UW8zZVVKc2VyRm01NUQ0QlRxTnV5azM0TTc5?=
 =?utf-8?B?WUdzOXVPaXJmVS9wQ1l4N1VPOTEvYjB5OXdmNmhYR0NyeFRma2tMWFlJZFQw?=
 =?utf-8?B?OWt5SnhYTDV4UlB6dExKWStxNzlUZ2Zpc1JEM0YzaytRY3U5ekhjRG5CdEQy?=
 =?utf-8?B?WmY1NSs0TVBRUFR1bThoa2FyY0p6QTM5THMzeWJXVGkxZk5RZFVUS1VETUM3?=
 =?utf-8?B?SmIrSnkzbU5veUhVakp3R1RsYVNmUVk4eitCSDhITU0wTG5DbExxTEtNb1Vx?=
 =?utf-8?B?d0VKQS9TWHpGYW1OOUNhQVZORHpLVU9jRDJ3NzZjQWk4YVlPYy9RSVhrNW5x?=
 =?utf-8?B?T1Z5R3FwZnlSQnVJNlVoN3JiK2ppSldaK3J2d3JDYWEyMmQ4amVpOU5TaS85?=
 =?utf-8?B?cVdvWHVyWU1PRkl4czhHSjEwTlB6c0g1YmRiUCtYTmlTM1Q4TTBjak1GZkVQ?=
 =?utf-8?B?TjVGWmJEWCtjanlibDh6SGU1WmJ2dm5IZFR6NjZrVVFSeHprUTE0T3NJZkc3?=
 =?utf-8?B?Zkt6L3diQkFzQ0tsN3VYZEJQd3ZhWnBXYnp2aGc4dFNWUGZxeFcrYUlrRmxi?=
 =?utf-8?B?UmZWNWdIWDNmNTlTNXhKelB1YVJOOEtzVHJ1NEtVcTBMcmJuTnVpY3pxYzM3?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7112eac-7749-42de-9624-08de201812cc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 05:14:50.2933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: klIgcQZUsjjuY0rx+2gutX5yg8hDrPAtd7ba8PsigvBoIZihWcwXmJGcq3kq0paV4JvAT/5pGZBUbreCc+osTB+kjnSru9bVKZIkM1XGqIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6470
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

Hi Sowmiya,

On 11/6/2025 3:22 PM, Sowmiya S wrote:
> Add info messages for subtests that are skipped
> without having proper info messages. This provides
> clearer insight into the reason for skipping.
>
> v2: Add switch case instead of if conditions
>      Also changed the flag name.
> v3: Reframed the info message
>      corrected author name
> v4: declare and initialize flag inside
>      subtest (pranay)
>
> Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
> Reviewed-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 21 +++++++++++++++++++--
>   1 file changed, 19 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 419afe4dd..9a74b4297 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -1216,6 +1216,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   		igt_describe(transition_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", transition_tests[i].name) {
> +			bool info_flag = false;
>   			pipe_count = 0;
>   
>   			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> @@ -1225,12 +1226,16 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				 * panels with long power cycle delays.
>   				 */
>   				if ((transition_tests[i].type == TRANSITION_MODESET) &&
> -				    output_is_internal_panel(output))
> +				    output_is_internal_panel(output)) {
> +					info_flag = true;
>   					continue;
> +				}
>   
>   				if ((transition_tests[i].type == TRANSITION_MODESET_FAST) &&
> -				    !output_is_internal_panel(output))
> +				    !output_is_internal_panel(output)) {
> +					info_flag = true;
>   					continue;
> +				}
>   
>   				if (pipe_count == 2 * count && !data.extended)
>   					break;
> @@ -1250,6 +1255,18 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   				test_cleanup(&data, pipe, output,
>   					     transition_tests[i].fencing);
>   			}
> +			if (info_flag && !pipe_count) {
> +				switch (transition_tests[i].type) {
> +				case TRANSITION_MODESET:
> +					igt_info("Skipping test: invalid for internal panel\n");
> +					break;
> +				case TRANSITION_MODESET_FAST:
> +					igt_info("Skipping test: invalid for external panel\n");
> +					break;
> +				default:
> +					break;
> +				}
This logic won't work for multi display config. Check and update the logic.
> +			}
>   		}
>   	}
>   
