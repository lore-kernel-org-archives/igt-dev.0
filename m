Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EC1C677C4
	for <igt-dev@archiver.kernel.org>; Wed, 11 Jun 2025 07:58:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3438210E25A;
	Wed, 11 Jun 2025 07:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xq7Fffrf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28DB910E5E8
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Jun 2025 07:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749628730; x=1781164730;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=77w3b+8nPBZqLGZZTlJsBOPsTZyxHFCIZuGBGhPyr6A=;
 b=Xq7FffrfWjjPa3iPOEyB+7zNgs0xvjMhIuax9SSiaPdwaaG+yi9rZQNe
 uZVuGPRKDX50h1B4aXrbu15Xf4ldXrGlw4rn872AT6T6RGph+7Zljezkb
 1CPxgzCvo7D6EW51ISfuN+M0si3TxiduMrXT44Z0H5tuRGkwLgHgVSRAZ
 RYEglPKVnkKffbwpA6Gk8DtZAIiYuSXSN5wQGFnyMtP9dvUEUSDYHVyKN
 aVELuGqZVhVGWJ4EjMxJlKCfEkaPSnjriCwOTC3PAPRITBj4IqrA0t64H
 do0jT5UDeZ4T1jYAQfJY3akTchEhkL3q5kjCSeLMJ3Q0xuJ6JsgsP33f0 Q==;
X-CSE-ConnectionGUID: I18Jow6NT1+gQVbGlqPnJw==
X-CSE-MsgGUID: 9Ste+SmxTTaWqg2TZhZ7wQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="51622865"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="51622865"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:58:47 -0700
X-CSE-ConnectionGUID: sDahilvkTu6bJwXnbriUTA==
X-CSE-MsgGUID: mykiUB+3Tk2r5S52b6jUgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; d="scan'208";a="146987055"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 00:58:42 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:58:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 00:58:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 00:58:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2c9rWZCFiUycm4YWOIwmZ9Dpajd8fWzLSBcd5ommO2IgqgByq2kIwP+x4gB909BO9ioCnlYaFzlbhbhMvGTRw/hVNziQU15NYMcpvNW/3TwIdOZ+SBjO11+x9HTNbSaHVCf1hL6WZ0x69T3bizjTKby1ViiU8YXrbIxjSuEVuOu8Nw9s5AAK4Y/4fZ2/0jKzS+gWudo8CKkoecET6YhvoHIJzrTbvBTnlej3QQGGIU3aYBS7BzIg1lGy/r7WCFMwwt16hbkaU2Ay4gqb5rXImYdzbroIwKTq0rHgX7GTtS7K+L5CP7ociGzG/TUq08bgMY1g0AGdmcUwSpep0PqkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiZ7RyRWj5AlQTyBiPQcRz08YdlJQCILIQMJy/sImaw=;
 b=A3FRpb2WA9fc8jEHFInTYBRUF6v7CGHXeOv4hwLGCXRnMe3VCRmAzsWPkyhtsPfiSoBIJ4h9uCj298ujyp+vAefzRGcOhCar7uAJkB0KT5CzZIKUUvR5h/Fg6gOtFNuQs4gl8rC61uJenPcVpbr7NrNbDh2VXQo2Z1Dxp7KLWvB98KYXjB6oc9TB9oNcdeX3f6jSaLMXQvcYPCVsz1bY3LBEMUEAUk7vA7RKWoPp3jKxk8wPRh0o4euIgwW4P0FVSQiKciuKyTHJxodAP78EmVQzTIXVfzPFyLMjPkCLsAjGiWaRx874rjoHBW2nV9FUgtUvFpqebItVDaVqB1PurQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB6942.namprd11.prod.outlook.com (2603:10b6:806:2bf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Wed, 11 Jun
 2025 07:58:32 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::36d3:6033:a101:f961%4]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 07:58:32 +0000
Message-ID: <05d410b4-1d2e-4076-b00a-99d9a2b95b84@intel.com>
Date: Wed, 11 Jun 2025 13:28:24 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v11 4/5] tools/gputop/xe_gputop: Add gputop support
 for xe specific devices
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>,
 <vinay.belgaumkar@intel.com>, <kamil.konieczny@intel.com>,
 <krzysztof.karas@intel.com>, <zbigniew.kempczynski@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>, <ashutosh.dixit@intel.com>
References: <20250522154447.496407-1-soham.purkait@intel.com>
 <20250522154447.496407-5-soham.purkait@intel.com>
 <f0c53d07-457d-4ace-ace1-e4b517b25fba@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <f0c53d07-457d-4ace-ace1-e4b517b25fba@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB6942:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fa161a-bf41-430c-2871-08dda8bdc249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUZUazhtVzF0MmUyNk5yV1BxWkhHSXQ4OUVSbHdkdTJQSmxlT2E3N3VxY0dZ?=
 =?utf-8?B?OG5MWlNsNDR3WHFNVHBGazBFVFA1b0JJQUNWWDZEWUREQzZ4cTJkck9IeUpB?=
 =?utf-8?B?eHA1WlJlQXA4dTFZc3JRSG44dlhvWHkyZkxUSzlkTklSM2swUDZ1OHFEODhD?=
 =?utf-8?B?VGZ5MDlRUEc4VG01YnpnUEFYaVBqUHJFTnJ0N0MvN0ErWjdzYVZWdXNoVUpD?=
 =?utf-8?B?ZkVWUnB4cmFENnZ3N293SWFjeUQ5R0pWdjhzZnBKS1Z6alI0U1lneW14ZEFT?=
 =?utf-8?B?aUhVQi9XN2pBZi9hZFM5THBXK216Z1pkeXlRU2ZKbHlsdThLY2c1Sk1GQzh5?=
 =?utf-8?B?TFE0SUZld0VvUnhxMmpzTThnQnlqTmpLSlJtT2VMTmVFQnJxSGUydXNIRmR5?=
 =?utf-8?B?WjR5YzJxRHRBRUEzRlVDTnh4eS9jbjMwRGlXSHV3TEVOQ0F3cDIrczNaZUZl?=
 =?utf-8?B?YUwrNlNWbjhqdGNBdDFBbHRzMVZXQldjUFdMdGZSbHo0aUc2K1piak9jMWpY?=
 =?utf-8?B?REJkZ2cvalVETC90Z0JhOHZiYTl4QmlobWQxS0lRRXRWdWozVXdMalAvVmph?=
 =?utf-8?B?cmFYNTBBYUdBR1RBTkptcytvYU5CakFENmhYSFFRN1ZVRjVRRkJoOFVUaWl4?=
 =?utf-8?B?dHpYMFo5MXJaN1lVN09YUE1ZdHBDUis5bkw2K1VYWlVsVjlBK1h4KzB0VGNM?=
 =?utf-8?B?RS9GekxaNE9PeVdqalMrN2Y0akdVYWRFdW5YMlZxSmIxS0VEd3U2dnNDM3Bl?=
 =?utf-8?B?b1k5bkFXNFk1cFN6OUFzWGFVemRSM3ZOcGRZa0lRWU5Dc2kzNXczQW1TeVF5?=
 =?utf-8?B?Qi9haFBXTjJ3MTNiTk9uUkV0NzhEbTI4Q0s4MHovbVRDVkFaaFNBcENSM2pQ?=
 =?utf-8?B?ZjdPNERDOVlYSjdUUTNxN283cVA3MkYzSDE0Y3R0emp2Q3ZkWHoyRmMvWFhy?=
 =?utf-8?B?eVRBRUg2YmliU0Evd0I0M0NsSjN2Q0dWaEpVVW1SYlhqM1Y2Vk56YnhWUnEy?=
 =?utf-8?B?TGd0bHlwak9KZVNvbVFEZGdEQjVrZkRJblVsMTRUTk1hRjdvK2xIenMzUDBB?=
 =?utf-8?B?azFQZVJJL2NJcTJtSldFVmowVWpsZS9xcnE1TnZFKy9SdnJVVjdlVmZSV0VU?=
 =?utf-8?B?aDVFL3pteFEwK1FmaFcwRjJ3eGdlYkg2V0ZZa0hYZ01DUS9QTnFUMnY2eWFy?=
 =?utf-8?B?Wkh6MDR6Z2U1Yllvb2h1cjJ6YzBrUWFPbzJ2M2QzRjVWSFk3Y1gvNEIySTc0?=
 =?utf-8?B?SndTRXhCdUxFMmFMWnR6dk43Uzltekl0M0cxNEpreitQMFM5OUpWZW9zWTJv?=
 =?utf-8?B?ZS9qZ0xFcDZlMWQ1bVJFa2N5N0t0UlRiZkJrRzcvKzBSN2NUT01sT3hiYTFu?=
 =?utf-8?B?anF4Y1lnc1pkUytqbDg5VGZtZWJDMC93andTUyszSUo5Wk9DK0JYLzVEM0xJ?=
 =?utf-8?B?TEZmc1FZYmgwQ05WalJBUmdCa0gyWkphRmI0K0VYdmN1SmNoYnd0MG9JcUMv?=
 =?utf-8?B?aytZZW15S1U5S2xnOWIzQTljcWxubUMxMzYrY1VqRGNwbHBHYkZheEtTa3A1?=
 =?utf-8?B?K1UxdEUwa29vRlluY0tQOWdIUTlQcUV2c2ZzaDRsUE5DQjN5VVA3VUMyZThX?=
 =?utf-8?B?UUkzeVM2UnlSalRvMXFLMVdUdXoxOFIwUDN6d3FXQ0dYKy8vZUxaOFhJOHR4?=
 =?utf-8?B?Ry80bE9mWVR5NXZlNldHMGhPdm5Ga3M1a1JkWHlkVkFDbVNFdzNzak1YYWxV?=
 =?utf-8?B?cE1NbWtBbVk5a1BDNFdzMmRoR0ZEZXZYWmVHNEo0dEVlTmhnRUx0enpMSmIz?=
 =?utf-8?B?ODhITmhwakp0d0hKVXJsbm9sTW1tNVE2SVlaeUdGTjV0b0h0MU5tVzVuTHk5?=
 =?utf-8?B?a0tJbmNORk5GemxVd3hOYTdQUzNUSi9NYkV2NC9jN05CdldPUTFIdGdMSk9j?=
 =?utf-8?Q?S0Y6fdxnCwc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnNLQzA4akxVZGtpb1BLcnlqMGFDSHFjR1NIVTd6cEhFNmNWaS8rdERrSFFL?=
 =?utf-8?B?dTlaa1hEU3FRcVl5NUloTmFwRGFOVm5wbjVyaGhIektEY0pxVjFGMFFBU1pX?=
 =?utf-8?B?WEoreGgyelVkbzlsa0tUL1ZQK3h5TEZTVVBaMWlwMTBzK1RwQmo1SEpqakEr?=
 =?utf-8?B?RERUU0VzTEduVDh5ZHhQcEIwWUR2RzVDTFAvN3VaNURSQ1g4bjlHNFFyR3p0?=
 =?utf-8?B?bFpGeWU1a1ZMSHhVdEtWSjE1dVYycFFEWE9WV09Bd1lEOVlBUkp4TFdmOU1C?=
 =?utf-8?B?STFBeVFob2NrNE9TME1MekNvQ09CemVOMmdDWno3S3ZtMkJGWmU1Ni9iTFVT?=
 =?utf-8?B?ekNSZU5qd002RGtkdW5tZlNRUEU3QjByY2pMTE1vUHFzeHpzK0kxdTRSYkJ2?=
 =?utf-8?B?RzVXRDNXV3ZUMkVCL0FLQXB2VTRkcUtJL1BCRTV0T09KQXB5cElUVGw1b005?=
 =?utf-8?B?ai95MEVaZExNLzZTOHpOVHg4NDhyV3pKV2FUWHRtYThCVjJpa1V1UXNuSGM1?=
 =?utf-8?B?MVNjckFzY3krNW1pRVJTZ2NmR1gweXBkWXRHcE9LZDdRWWpONzZYcjg1ZmR0?=
 =?utf-8?B?SDRGNHBQUEVtdHdaUTVkdXRrMU9MY2Z2eTdJbnNqQy9EWWFxaC9rVmE0ckpD?=
 =?utf-8?B?cFRGNEo0Q2s2Y1FmTzg3MGxRN0w0YjdEZ1pQa1AvUy9MTWFUZVlLc2Urd3dK?=
 =?utf-8?B?azEwWmxpMVpabWYrVE1xQldXZ25Sbzk1SldpajBuZTh2Smg2UHFIWUQ1Wi9q?=
 =?utf-8?B?STkrOEMybmN6bTk3QWVMY2R2YmwzWTdvbUFnRXpSZUFTbFJYQlZ2QVpaS3Uy?=
 =?utf-8?B?Szh2Sk9Nb3lXOWVvdm1Dc0VDMjJuYUNqaDBQZmljZnZEYUM1LzU2RUJ6WlFz?=
 =?utf-8?B?d1dLdTEyQzA0WVZJNU5yc1I5UWx3ZEw1ZWlFdkp2TnF3ZXlhRDFKSlluZThH?=
 =?utf-8?B?MUVObkhMTVZHRC9HWkMvaHl4N1owdXN2cEtrdVNUVjNqSDJhenB2eGtrdGxW?=
 =?utf-8?B?SXc2YmMxUjVET3RpRzlWaXhOdjRqanZmOE43QTE3REYvTVNwN21oR1Bkd1lY?=
 =?utf-8?B?T0dMVnk4bDBwaUt4eVduMmtQUnVHRm9xdVlyTzl6dzZnc2x5QXYxMDM3OGEy?=
 =?utf-8?B?S0hqZ1IyT3NYamVRcUV4aFJDbTFMLzB0TktKNjRTN1B6RDB3M2ZPOHNEMU5j?=
 =?utf-8?B?UDFscEZkbnpHdUJqNUh1VzljYnQ4dkJqcXJaN2N4a1lEL2VBZUlhZUJrZm10?=
 =?utf-8?B?VGEwa0RuNUdpU3N1WFpVZmI5bXh6R0R5bDc4bmJiQWtzdkxRYnk3bWhQY1E0?=
 =?utf-8?B?c1NpcUwrZWZ5OU5kaDZYRmJKVithK1dPV29aMDV3RXdVTmdydG5IUnJiRUFu?=
 =?utf-8?B?K0p3ZUQ4ODNjSTRJaTR3TUZieHBPWnhIZzg0OHN0dGEwaVlXY2V6UWV0ZTlo?=
 =?utf-8?B?UmNXWmtTVHV6NlZ5ZHNHbmVpTXdQemVSOTljYnc2SGtlMDVHdW96N0k5SmRJ?=
 =?utf-8?B?Q2E1TVFiaHRkL2Y4MlpxNTV6d2FxSW9XQlYyTTRwMWRlNnJ3alVGRFRaZHQw?=
 =?utf-8?B?cWk3VkxTc0oxLytXSmczcE5FSTZOMEg3eThyNVZ3SGpyL2QzQmlUTDdTS2VR?=
 =?utf-8?B?eGFsN1hWaENRUGpWTVR1T2ZHOGVrTnZ5S0RzcC9TenV6SnZ2VGhkaml5bGhu?=
 =?utf-8?B?UnpBdW1ONUF0cWlKTVdmamcxWTZRdkZlcFlvUjVDN0VMUHpRV3I5ekswMW1P?=
 =?utf-8?B?VzVhNGFmNVhNUlNtU3BQYlFIbFRMb0ZvV2FLSUYzbWRQTXhDL1RGSU5iN2dR?=
 =?utf-8?B?MUFlSXRQVXVWSTNQS0tCdUwrR0ZRVHBycXdsTHZoRFFOdk1iZHo5V1lSOTdQ?=
 =?utf-8?B?cXFsdHF4emFsN3NJb25GMzg2Ykl3K29FZGZVRG90WTcvd3lCT0ZKa0x0bnBi?=
 =?utf-8?B?MlZjTkhwdmErYjhsUHR0SDJNMms0U2VmMHFxcldvd29TKzliU0FwYnFXazNN?=
 =?utf-8?B?VXJpSFBiYkwzL2JaWjhUYWxiQ3dDeWdNc2U3S2FmL3R0a01UV05EUUlIQXFQ?=
 =?utf-8?B?K2o5SGRqRmIwQUpaaUVDOVpadXVkeWovR1hCTnkvSUlsbzZVUTRDNXROL3Fo?=
 =?utf-8?B?QTR0V3JiS0FPR2hzRkFQOGZ4VzFNaVNwYklHUVpMdllwZVd3dmdlMkVLdWNR?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fa161a-bf41-430c-2871-08dda8bdc249
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 07:58:32.1012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJAbsynpCOGFQB0BoJ9+ZlK2WoEQd6D2xek4+Q69TTKC+kGZSpVcPqDc5vmd1POIrQASj8JjdeHmS1iFdR7Qlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6942
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


On 05-06-2025 22:46, Riana Tauro wrote:
> Hi Soham
>
> Some minor comments
>
> On 5/22/2025 9:14 PM, Soham Purkait wrote:
>> Add gputop support for xe-specific devices. Separate
>> driver-specific code into respective source files.
>>
>> v2 : Fix for refactoring GPUTOP into a
>>       vendor-agnostic tool. (Lucas)
>>
>> v3 : Separate commit. (Kamil)
>>
>> v4 : Headers in alphabetical order
>>       Engines memory allocation at
>>       the beginning all at once.
>>       Removed PMU normalization. (Riana)
>>
>> v5 : Refactor to eliminate redundant
>>       and unused code segments.
>>       Fix for proper resource cleanup. (Riana)
>>
>> v8 : Allocated card structure memory inplace and
>>       accordingly modified the clean up code.
>>
>> v11 : Loop optimization in xe_populate_engines.
>>        Removed short_name.
>>        PMU fds are closed on cleanup.
>>        Removed unnecessary comments. (Riana)
>
> lot of versions maybe squash all the comments into one and start new 
> series. But upto you
>
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tools/gputop/xe_gputop.c | 378 +++++++++++++++++++++++++++++++++++++++
>>   tools/gputop/xe_gputop.h |  62 +++++++
>>   2 files changed, 440 insertions(+)
>>   create mode 100644 tools/gputop/xe_gputop.c
>>   create mode 100644 tools/gputop/xe_gputop.h
>>
>> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
>> new file mode 100644
>> index 000000000..ac3ed76e6
>> --- /dev/null
>> +++ b/tools/gputop/xe_gputop.c
>> @@ -0,0 +1,378 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "xe_gputop.h"
>> +
>> +#define engine_ptr(engines, n) (&(engines)->engine + (n))
>> +
>> +static void __update_sample(struct xe_pmu_counter *counter, uint64_t 
>> val)
>> +{
>> +    counter->val.prev = counter->val.cur;
>> +    counter->val.cur = val;
>> +}
>> +
>> +static void update_sample(struct xe_pmu_counter *counter, uint64_t 
>> *val)
>> +{
>> +    if (counter->present)
>> +        __update_sample(counter, val[counter->idx]);
>> +}
>> +
>> +static const char *class_display_name(unsigned int class)
>> +{
>> +    switch (class) {
>> +    case DRM_XE_ENGINE_CLASS_RENDER:
>> +        return "Render/3D";
>> +    case DRM_XE_ENGINE_CLASS_COPY:
>> +        return "Blitter";
>> +    case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
>> +        return "Video";
>> +    case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
>> +        return "VideoEnhance";
>> +    case DRM_XE_ENGINE_CLASS_COMPUTE:
>> +        return "Compute";
>> +    default:
>> +        return "[unknown]";
>> +    }
>> +}
>> +
>> +void xe_clean_up(void *obj, int len)
>> +{
>> +    struct xe_engine *eng;
>> +    struct xe_pmu_counter pmu;
>> +    struct xe_gputop *dev = (struct xe_gputop *)obj;
>
> Use inverted xmas tree
>
>> +
>> +    for (int i = 0; i < len; i++) {
>> +        if ((dev + i)->card)
>> +            free((dev + i)->card);
>> +        if ((dev + i)->eng_obj) {
>> +
>> +            for(int j = 0; j < ((struct xe_pmu_device*)(dev + 
>> i)->eng_obj)->num_engines ; j++) {
>> +                eng = engine_ptr((struct xe_pmu_device*)(dev + 
>> i)->eng_obj, j);
>> +                if (eng->display_name)
>> +                    free(eng->display_name);
>> +
>> +                pmu = eng->engine_active_ticks;
>> +                if (pmu.present)
>> +                    close(pmu.fd);
>> +
>> +                pmu = eng->engine_total_ticks;
>> +                if (pmu.present)
>> +                    close(pmu.fd);
>> +            }
>> +            free(dev->eng_obj);
>> +        }
>> +        if ((dev + i)->pmu_device)
>> +            free(dev->pmu_device);
>> +    }
>> +}
>> +
>> +static char *pmu_name(struct igt_device_card *card)
>> +{
>> +    int card_fd;
>> +    char device[30];
>> +    char *path;
>> +
>> +    if (strlen(card->card))
>> +        card_fd = igt_open_card(card);
>> +    else if (strlen(card->render))
>> +        card_fd = igt_open_render(card);
>> +
>> +    if (card_fd == -1)
>> +        return NULL;
>> +
>> +    xe_perf_device(card_fd, device, sizeof(device));
>> +    path = strdup(device);
>> +    close(card_fd);
>> +    return path;
>> +}
>> +
>> +static int _open_pmu(uint64_t type, unsigned int *cnt, struct 
>> xe_pmu_counter *pmu, int *fd)
>> +{
>> +    int fd__ = igt_perf_open_group(type, pmu->config, *fd);
>> +
>> +    if (fd__ >= 0) {
>> +        if (*fd == -1)
>> +            *fd = fd__;
>> +        pmu->present = true;
>> +        pmu->idx = (*cnt)++;
>> +        pmu->fd = fd__;
>> +    }
>> +
>> +    return fd__;
>> +}
>> +
>> +void xe_gputop_init(void *ptr,
>> +            struct igt_device_card *card)
>> +{
>> +    struct xe_gputop *obj = (struct xe_gputop *)ptr;
>> +
>> +    obj->pmu_device = pmu_name(card);
>> +    if (!obj->pmu_device) {
>> +        fprintf(stderr, "%s : pmu_device path returned NULL", 
>> card->pci_slot_name);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +    obj->card = card;
>> +}
>> +
>> +static int pmu_format_shift(int xe, const char *name)
>> +{
>> +    uint32_t start;
>> +    int format;
>> +    char device[80];
>> +
>> +    format = perf_event_format(xe_perf_device(xe, device, 
>> sizeof(device)),
>> +                   name, &start);
>> +    if (format)
>> +        return 0;
>> +
>> +    return start;
>> +}
>> +
>> +static int engine_cmp(const void *__a, const void *__b)
>> +{
>> +    const struct xe_engine *a = (struct xe_engine *)__a;
>> +    const struct xe_engine *b = (struct xe_engine *)__b;
>> +
>> +    if (a->drm_xe_engine.engine_class != b->drm_xe_engine.engine_class)
>> +        return a->drm_xe_engine.engine_class - 
>> b->drm_xe_engine.engine_class;
>> +    else
>> +        return a->drm_xe_engine.engine_instance - 
>> b->drm_xe_engine.engine_instance;
>> +}
>> +
>> +void *xe_populate_engines(const void *obj)
>> +{
>> +    struct igt_device_card *card = ((struct xe_gputop *)obj)->card;
>> +    struct xe_pmu_device *engines;
>> +    int ret = 0;
>> +    char device[30];
>> +    struct drm_xe_engine_class_instance *hwe;
>> +    int card_fd;
>> +    uint64_t engine_class, engine_instance, gt_shift;
>> +    uint64_t engine_active_config, engine_total_config;
>
> Use inverted xmas tree
>
>> +
>> +    if (!card || !strlen(card->card) || !strlen(card->render))
>> +        return NULL;
>> +
>> +    if (strlen(card->card)) {
>> +        card_fd = igt_open_card(card);
>> +    } else if (strlen(card->render)) {
>> +        card_fd = igt_open_render(card);
>> +    } else {
>> +        fprintf(stderr, "Failed to detect device!\n");
>> +        return NULL;
>> +    }
>> +    xe_device_get(card_fd);
>> +    engines = malloc(sizeof(struct xe_pmu_device) +
>> +             xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> +    if (!engines)
>> +        return NULL;
>> +
>> +    memset(engines, 0, sizeof(struct xe_pmu_device) +
>> +           xe_number_engines(card_fd) * sizeof(struct xe_engine));
>> +
>> +    engines->num_engines = 0;
>> +    engines->device = ((struct xe_gputop *)obj)->pmu_device;
>> +    gt_shift = pmu_format_shift(card_fd, "gt");
>> +    engine_class = pmu_format_shift(card_fd, "engine_class");
>> +    engine_instance = pmu_format_shift(card_fd, "engine_instance");
>> +    xe_perf_device(card_fd, device, sizeof(device));
>> +    ret = perf_event_config(device,
>> +                "engine-active-ticks",
>> +                &engine_active_config);
>
> wrap around at 100
>
>> +    if (ret < 0)
>> +        return NULL;
>> +    ret = perf_event_config(device,
>> +                "engine-total-ticks",
>> +                &engine_total_config);
>> +    if (ret < 0)
>> +        return NULL;
>
> add blank line
>
>> +    xe_for_each_engine(card_fd, hwe) {
>> +        uint64_t  param_config;
>> +        struct xe_engine *engine;
>> +
>> +        engine = engine_ptr(engines, engines->num_engines);
>> +        param_config = (uint64_t)hwe->gt_id << gt_shift | 
>> hwe->engine_class << engine_class
>> +            | hwe->engine_instance << engine_instance;
>> +        engine->drm_xe_engine = *hwe;
>> +        engine->engine_active_ticks.config = engine_active_config | 
>> param_config;
>> +        engine->engine_total_ticks.config = engine_total_config | 
>> param_config;
>> +
>> +        if (engine->engine_active_ticks.config == -1 ||
>> +            engine->engine_total_ticks.config == -1) {
>> +            ret = ENOENT;
>> +            break;
>> +        }
>> +
>> +        ret = asprintf(&engine->display_name, "%s/%u",
>> + class_display_name(engine->drm_xe_engine.engine_class),
>> +                   engine->drm_xe_engine.engine_instance);
>> +
>> +        if (ret <= 0) {
>> +            ret = errno;
>> +            break;
>> +        }
>> +
>> +        engines->num_engines++;
>> +    }
>> +
>> +    if (!ret) {
>> +        errno = ret;
>> +        return NULL;
>> +    }
>> +
>> +    qsort(engine_ptr(engines, 0), engines->num_engines,
>> +          sizeof(struct xe_engine), engine_cmp);
>> +
>> +    ((struct xe_gputop *)obj)->eng_obj = engines;
>> +
>> +    return engines;
>> +}
>> +
>> +static uint64_t pmu_read_multi(int fd, unsigned int num, uint64_t *val)
>> +{
>> +    uint64_t buf[2 + num];
>> +    unsigned int i;
>> +    ssize_t len;
>> +
>> +    memset(buf, 0, sizeof(buf));
>> +
>> +    len = read(fd, buf, sizeof(buf));
>> +    assert(len == sizeof(buf));
>> +
>> +    for (i = 0; i < num; i++)
>> +        val[i] = buf[2 + i];
>> +
>> +    return buf[1];
>> +}
>> +
>> +void xe_pmu_sample(const void *obj)
>> +{
>> +    struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
>> +    const int num_val = engines->num_counters;
>> +    uint64_t val[2 + num_val];
>> +    unsigned int i;
>> +
>> +    pmu_read_multi(engines->fd, num_val, val);
>> +
>> +    for (i = 0; i < engines->num_engines; i++) {
>> +        struct xe_engine *engine = engine_ptr(engines, i);
>> +
>> +        update_sample(&engine->engine_active_ticks, val);
>> +        update_sample(&engine->engine_total_ticks, val);
>> +    }
>> +}
>> +
>> +int xe_pmu_init(const void *obj)
>> +{
>> +    struct xe_pmu_device *engines = ((struct xe_gputop *)obj)->eng_obj;
>> +    unsigned int i;
>> +    int fd;
>> +    struct xe_engine *engine;
>> +    uint64_t type = igt_perf_type_id(engines->device);
>> +
>> +    engines->fd = -1;
>> +    engines->num_counters = 0;
>> +
>> +    for (i = 0; i < engines->num_engines; i++) {
>> +        engine = engine_ptr(engines, i);
>> +        fd = _open_pmu(type, &engines->num_counters, 
>> &engine->engine_active_ticks,
>> +                   &engines->fd);
>> +        if (fd < 0)
>> +            return -1;
>> +        fd = _open_pmu(type, &engines->num_counters, 
>> &engine->engine_total_ticks,
>> +                   &engines->fd);
>> +        if (fd < 0)
>> +            return -1;
>> +    }
>> +    return 0;
>> +}
>> +
>> +static double pmu_active_percentage(struct xe_engine *engine)
>> +{
>> +    double pmu_active_ticks = engine->engine_active_ticks.val.cur -
>> +                  engine->engine_active_ticks.val.prev;
>> +    double pmu_total_ticks = engine->engine_total_ticks.val.cur -
>> +                 engine->engine_total_ticks.val.prev;
>> +    double percentage;
>> +
>> +    percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
>> +    return percentage;
>> +}
>> +
>> +static int
>> +print_device_description(const void *obj, int lines, int w, int h)
>> +{
>> +    char *desc;
>> +    int len;
>> +
>> +    len = asprintf(&desc, "DRIVER: %s || BDF: %s",
>> +               ((struct xe_gputop *)obj)->card->driver,
>> +               ((struct xe_gputop *)obj)->card->pci_slot_name);
>> +
>> +    printf("\033[7m%s%*s\033[0m\n",
>> +           desc,
>> +           (int)(w - len), " ");
>> +    lines++;
>> +    free(desc);
>> +    return lines;
>> +}
>> +
>> +static int
>> +print_engines_header(struct xe_pmu_device *engines,
>> +             int lines, int con_w, int con_h)
>> +{
>> +    const char *a;
>> +
>> +    for (unsigned int i = 0;
>> +         i < engines->num_engines && lines < con_h;
>> +         i++) {
>> +        struct xe_engine *engine = engine_ptr(engines, i);
>> +
>> +        if (!engine->num_counters)
>> +            continue;
>> +
>> +        a = "            ENGINES   ACTIVITY  ";
>> +
>> +        printf("\033[7m%s%*s\033[0m\n",
>> +               a,
>> +               (int)(con_w - strlen(a)), " ");
>> +        lines++;
>> +
>> +        break;
>> +    }
>> +
>> +    return lines;
>> +}
>> +
>> +static int
>> +print_engine(struct xe_pmu_device *engines, unsigned int i,
>> +         int lines, int con_w, int con_h)
>> +{
>> +    struct xe_engine *engine = engine_ptr(engines, i);
>> +    double percentage = pmu_active_percentage(engine);
>> +
>> +    printf("%*s", (int)(strlen("            ENGINES")), 
>> engine->display_name);
>> +    print_percentage_bar(percentage, con_w - strlen("            
>> ENGINES"));
>> +    printf("\n");
>> +
>> +    return ++lines;
>> +}
>> +
>> +int xe_print_engines(const void *obj, int lines, int w, int h)
>> +{
>> +    struct xe_pmu_device *show = ((struct xe_gputop *)obj)->eng_obj;
>> +
>> +    lines = print_device_description(obj, lines, w, h);
>> +
>> +    lines = print_engines_header(show, lines, w,  h);
>> +
>> +    for (unsigned int i = 0; i < show->num_engines && lines < h; i++)
>> +        lines = print_engine(show, i, lines, w, h);
>> +
>> +    lines = print_engines_footer(lines, w, h);
>> +
>> +    return lines;
>> +}
>> +
>> diff --git a/tools/gputop/xe_gputop.h b/tools/gputop/xe_gputop.h
>> new file mode 100644
>> index 000000000..825ac7e34
>> --- /dev/null
>> +++ b/tools/gputop/xe_gputop.h
>> @@ -0,0 +1,62 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef __XE_GPUTOP_H__
>> +#define __XE_GPUTOP_H__
>> +
>> +#include <dirent.h>
>> +
>> +#include "igt_device_scan.h"
>> +#include "igt_perf.h"
>> +#include "utils.h"
>> +#include "xe/xe_query.h"
>> +
>> +struct xe_pmu_pair {
>> +    uint64_t cur;
>> +    uint64_t prev;
>> +};
>
> Is an extra struct needed here. you can add it in below struct

Not technically but imo it helps in better readability.

Thanks,
Soham

>
>> +
>> +struct xe_pmu_counter {
>> +    uint64_t type;
>> +    uint64_t config;
>> +    unsigned int idx;
>> +    struct xe_pmu_pair val;
>> +    int fd;
>> +    bool present;
>> +};
>> +
>> +struct xe_engine {
>> +    const char *name;
>> +    char *display_name;
>> +    struct drm_xe_engine_class_instance drm_xe_engine;
>
> %s/drm_xe_engine/engine
>
>> +    unsigned int num_counters;
>> +    struct xe_pmu_counter engine_active_ticks;
>> +    struct xe_pmu_counter engine_total_ticks;
>> +};
>> +
>> +struct xe_pmu_device {
>> +    unsigned int num_engines;
>> +    unsigned int num_counters;
>> +    int fd;
>> +    char *device;
>> +    struct xe_engine engine;
>> +};
>> +
>> +struct xe_gputop {
>> +    char *pmu_device;
>> +    struct igt_device_card *card;
>> +    struct xe_pmu_device *eng_obj;
>> +};
>> +
>> +void xe_gputop_init(void *ptr,
>> +            struct igt_device_card *card);
>
> Wrap around at 100
>
> Thanks
> Riana
>
>> +void xe_populate_device_instances(struct gputop_device *dv);
>> +void *xe_populate_engines(const void *obj);
>> +void xe_pmu_sample(const void *obj);
>> +int xe_pmu_init(const void *obj);
>> +int xe_print_engines(const void *obj, int lines, int w, int h);
>> +void xe_clean_up(void *obj, int len);
>> +
>> +#endif /* __XE_GPUTOP_H__ */
>
