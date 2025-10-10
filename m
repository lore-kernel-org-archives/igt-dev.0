Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B84CAC5BB
	for <igt-dev@archiver.kernel.org>; Fri, 10 Oct 2025 08:50:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2C410EB88;
	Fri, 10 Oct 2025 08:50:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MQklVvaq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528BD10EB97
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Oct 2025 08:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760086218; x=1791622218;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ttIg3I02tOuIpDbYS8/jjosiqC+TXSmNqTWqzWJx2kA=;
 b=MQklVvaqkCjAKLKhbQD3OD7kTKobhYuHdzPFNhGG6AwxHORIszbJvYd5
 uv3gTlBhrrzR3CDICUVmny6G+vfxFvXoOUnl5diC4tNVt7e9wmhMkPHKW
 2O2pRdCP0if8sc38GMmrhqF32ajvaKl467YFB39SK9ogsSl+d9haVel/g
 rtwBOOKlVC2SfAu0kojQGaqbueOzwJ2UiRMNkhDs4sMiPPMQcd3hkHbb9
 JORhpraA3yvsuV0dOrS38gb4vItM16x2Qfmoya0ChPNlVMFCi8cWnz7Fn
 fVU+ZHs2xGf17Mst9BRkF08Kk0sOyqBe21tX2A0ugAp8LuK+gB226qmJa g==;
X-CSE-ConnectionGUID: hfER7oc9Ree73SMRIfKOsQ==
X-CSE-MsgGUID: 7tsaM2RCRg2aI48RoNltCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62346970"
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="62346970"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:50:17 -0700
X-CSE-ConnectionGUID: eKOrt6yxTFGud/afxNxdAg==
X-CSE-MsgGUID: YyhCnx09Tk2RxrH8uzFzZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,218,1754982000"; d="scan'208";a="180517245"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2025 01:50:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:50:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 10 Oct 2025 01:50:16 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 10 Oct 2025 01:50:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuU/FWFZ+tkDH+dsjVEzXWXv5O24j2UmfZNJv1O9ECoou+YMXhifE9BttUGYScnTb10c1dBxdIYMSteGeDfLDDoW2bhRKrF4GKHoCGy+WDmEqhK1Lq1JAc5DWTn/sauOlks328aAPPlB0aM+X53ec8bQ8/2yLZk1rQg/idxgJQhop3D+sy0y06/r9dIH+pmmWm+dhOmpIXRv/BwDNB21oUCBUxGZHZRBo+LeojZMl4/6a2Ln56mnTZrezDSYvRRuuJz1iUd8DAYlUHndU+D/Wbssc8eM7Mbp+adbZ2GuXAvX7uNbXm9Kb/a4YBoDAo3487DIEd+uFD7zrDTwdTx7Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUO5DFVqBFGmqzpX+r/EcFJx2IR0KCake6GeoXJYwPk=;
 b=Gibx0Gjg6aJzyd4JxoL+N68X4TZJZdcHV4/D2mx57xxg8K2Coii1lqMEnpuemu6j1nsOIXKX47/LUAzuNkS6JLwa7cp4ZQ9BWXkWIElDfXSXXJfGmrniP6Pmjt+yw2wNZPjDeUHIBfRbD68GvFs76TJnHjOlWaaHzY/fNWC1qmp+gy19t6e1Lfi2+wmRZrrjSVCLWPeGXtiDTesQGzOz0WomZyF9kul5rx+DSkdqJEAKdo4az/MsP932I3zSYYfc4qloLzvgv8oHWHPcNMTCsuLq8JcLz40+Wclg1X6RFD4ogjTLxrNV76n7gu9hGYuiYVO9ea0Ab5dGePWg2DuOMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by IA1PR11MB6268.namprd11.prod.outlook.com
 (2603:10b6:208:3e4::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 08:50:07 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::e40a:ca86:8d29:b2ab%4]) with mapi id 15.20.9137.018; Fri, 10 Oct 2025
 08:50:07 +0000
Message-ID: <d3b888aa-1ecc-420a-9321-0821494f0815@intel.com>
Date: Fri, 10 Oct 2025 14:20:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe/xe_exec_system_allocator: Add partial unmap
 atomic access sections
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20251009121436.3503049-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20251009121436.3503049-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0202.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::8) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|IA1PR11MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: 1131eb32-dcd9-4d55-7c23-08de07da0358
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eE8wRncwNnF5R3AvTmJZa01kQTFqU3kram1sd0hLRWV3T2RKSzhQVWVvTHdv?=
 =?utf-8?B?RTlrdUZCOWltSVRaZitubEFDNjJDcnU0TEx4b0tJQzhhOHIraE9jOWxLOFli?=
 =?utf-8?B?S2tGY2NPU0tXZVpOeVZOU2pwbmwvUlg3ZFlpZlJzQVc5ZXVERlp0UzhkMXgz?=
 =?utf-8?B?cnh0cHZDdjRrdm0rZCsxYm9hTzZYU1YxaEROMldQbytIWUJFY0tLdGdJc0lJ?=
 =?utf-8?B?bWJURnBJN2JmSCtSOFJyQkZEaElxQTNyVnl0V1lVN2tLRWR3WVB5SjZ0NWtj?=
 =?utf-8?B?bVprYm5nSXJPcUZBVGF3c1FTc0E2MWN4dVpjb041c003cXZtTEc1QjZoSWJK?=
 =?utf-8?B?cFR5SnI4am9tQS9BbmpLUXNWSFVZV3BvZGdlV3dsVU1SNVdhdzNhbGNNdmQ0?=
 =?utf-8?B?VjZJZlZKcTFZblMrU2lSbDJDcFREOUtiVWlwSGNXUFJiS2d6ckcrUkxuR0Zw?=
 =?utf-8?B?dkMyclE0UjFQLzFiNDN5THFMN3JZeDVvUHZ0cHl3WW9ZNjZLMXR3dGF1Skpo?=
 =?utf-8?B?UFlDZkxLUDQzbWV0TmR5SzNWMVRKbmorYWNOKzdhYUZaV2psUXNXbTN5Rmdj?=
 =?utf-8?B?TVZhRkFRc2FCVk4rN0hPTUtZWTRZQjlkM01DYlB4eW10WFNYakdzZVZpSmFo?=
 =?utf-8?B?UXNCSkpTYUtkVHpjSGF5OU1TSFdBMGlPQTJMVzdOOXRVVUJZUzdKMTZKTFRj?=
 =?utf-8?B?NWE5N3RLU3JkbEx4N1E1MkV2elFXbkVuMUxTTTFBU01aWHVBMktva1Y0WS9C?=
 =?utf-8?B?ZGZFTjJxUnk4emtPTzdCU2N4STV5dEhJNWZ4am42YnBaZHRBNkx5MGc3VTEx?=
 =?utf-8?B?OUZBSUYzbTE3WnY4d2Q5anpTOFZvYWsvdjJtWjErTjZEWVpVcEl5c3F4cTdm?=
 =?utf-8?B?NXR5UE5YVHJRcW5nVTFYcTZPT0NkdkFNQ1NYZUZrNnlZRHR1UU1JUzN2MUo3?=
 =?utf-8?B?TXQvT1BkWHBCR1A0Q2E0ZnJ1citRU3RWT3ByMkxySHR0YXlmSTlHcVpCRTd5?=
 =?utf-8?B?V2VoTzByaUYyMWdxK0RaK1hHWUdDMlc5bFpFbEJHK3RpaGtCZUNHanlYZlNR?=
 =?utf-8?B?ZlhQckE0YkxOZ0luTFFVTmQxbVBiS1dMdTFOeWxCWUtnb2dpRzA0QzJ0eC91?=
 =?utf-8?B?aHJmUXZFNnhSZDhKMUhHeFJuZUVyQ2phOTRid09zWVdSTnB3dHczQktGaWNR?=
 =?utf-8?B?Y3NISEQwdllmYmQ2QjlEK3VSRUMxUGgzYXhZMmtmSmQrL21nVi8wWlRFcDJD?=
 =?utf-8?B?VFZWaXZxOWFuRUV5Yi9DeDQ3aG10M0xBaWVPK3ZuV3F6MkZ1YjJDUTlKcGxy?=
 =?utf-8?B?RUZUTWdaZ21hSzR1dnFUVUpLdlNVbWUwaDlxL3o5WUhqdXBjdmdjRU4waHM0?=
 =?utf-8?B?dTlxdGRrRjF2dk1RdG9PQk5ZUERMNm0xOWpJY3p6Nkd1NlhGOEdBeVd2YWxI?=
 =?utf-8?B?VWxtYmFkRmJtOHVnRVNNSE04cDBxVlBVRWsrVzFtcmIyVHplN1QvTDFYWERG?=
 =?utf-8?B?N2g1TkV4MitHdEFCdTdtRU00TkptQVU3dHF0RE1nZ1hLTlQ3cnk1Q1k1UzFz?=
 =?utf-8?B?V0E1QzVMUUtmM1Y4TW1IdmJhY0dDbEhtU3IwY0Y2ekpGUW5BSXl3V04yUDFL?=
 =?utf-8?B?eFRjcGxvVzVRckxzZHdDbzcwUEpNMFQ2QklKNXdtN2R4VVFDbW5RcnZuenRu?=
 =?utf-8?B?Mm05N0w2Yi9IK3JvYnpBZk9jWk1WK0ZFdHFHQW1STnRLUURnVjVvS3cwamV6?=
 =?utf-8?B?MEx6Tm5qbnFGTGp6MzI1eUN5WkRUd0xoSjFKdXVvZlZ6SVN1dGlGc2c1SWUr?=
 =?utf-8?B?ZkVJVzdjVGMrT21LSGdxaFJ6UHErYXp3emdLQm9jQm56UEd3VWZySHhacGRV?=
 =?utf-8?B?MklFbW5leGQvSlAzcVJGdVVRcGpXbjFBRzlOWDh6RnNJaWhwQmMrbTZnMFpK?=
 =?utf-8?Q?ZN2Y5T9XkwDvQhltH92YF+ugx7iIpUaa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nng4Vm13S3RPYlJmNENaWW1yUWl1RjRySTA0WFNaaTZiVGR5Q0U0S0NMWkRs?=
 =?utf-8?B?TjZqemdiRUhOYXNUSDBoamMrTU8rZ2J4MFVNY21hMWJ4MmJXWUpGdWg4blYx?=
 =?utf-8?B?N1pYTjJ0elQ0VjI1Q3FkWVdLaWdUeHUrSm14dmhhS1pTY0U0SWw4bWttN0RL?=
 =?utf-8?B?UG44aUFhTituRi80VHBlTWJSMERlRTNHTFpILzZ2czNYcFVwZHRnbnBLNnVl?=
 =?utf-8?B?SDhoN2s3Qm5mRTFFL3djWWpBZ29Rb0xkeGdnNE0zRVFiMk9KQnNzSVE3N0hh?=
 =?utf-8?B?U2JNMldXWFprRFFYaUtXaGlhclBDMmVjZ0hwcTlyMUJmK0IzaXkvdTdmdWtF?=
 =?utf-8?B?TmJodkFoN0RiaTdFdUc1bENYQWQvci9yNm1uUlRZcEpuZ3ozOURhZGVra2RS?=
 =?utf-8?B?d3lTWEZkNzFoZGVnTDdRbEI1SkFIVHVWajdwT0RZMkE0bjZBdXRNekJUay9H?=
 =?utf-8?B?ZlNhemZybkp4aGNtWDgzQ20wOGxVNmk1N2FzcWIvclVRRmFFUDBnc1dNRDJz?=
 =?utf-8?B?Y2tTU2xZU01KQURlVzNCbnhTQ0lWUWtEdjFrNW9OMnU0WTRCdDdLVXVIR2c4?=
 =?utf-8?B?NGU2aTdWK3ZscWdqNlZZVjVnTWJZLzBwVzMwWFNnVnJFdlBldVQ3REUwU2N1?=
 =?utf-8?B?SnhuUHQ4djRJaGV6SGZiOGVwU25HZERNbHNLQVJKaU94THlpbEViMmJYMDNY?=
 =?utf-8?B?U3NJRVp6TVdnUytMbExpZEFQS2I1TXo2VDhvVGpDZnRYa0JSZWdBT0pTVjNw?=
 =?utf-8?B?T2NXVjRjUkNWRnhOWHFROWNETmVSM3dQR253Y242YzBlSDFxVERCY0lSSzlL?=
 =?utf-8?B?VmhMdktIZTdlUXZieGE2U1BvM0wrZDdnU2s5MmNqVG1tTE9waEtMRnlBaUIr?=
 =?utf-8?B?Rk5CRys5RjR2a3BEYjcrQUVFWnRob2ViZ2FkYVdIV1Axc2lEUDNyK3NZbWJq?=
 =?utf-8?B?ZXVCNlhXWWU1V0JuQzBveE1YR1RaWUVFTXd6MENLUkE3OUt2OE1td3BWWThh?=
 =?utf-8?B?MjFacUNvTkRNdzY4eW82R0Vucm4yUlV6NVowbStrM2t6VjB5aWMweWl0RE43?=
 =?utf-8?B?WHhzZFpGMXdvc1RkTkVKa3BMRDlBQUtTTVdUK0ZFbC8rZkJUTFR3MHNHNit6?=
 =?utf-8?B?NUlpd2p0TnZFQi9Vb0ZlRitwb2o1a3dZbXp4enQwbDJlSFpZWExMMWZZVUk2?=
 =?utf-8?B?RmZyZDUvdlAxdklBOGtsWE44eVhJQW90Y0MveUc5SkhBOStqZ2ZBbEl0WEwr?=
 =?utf-8?B?VXdNVGhtY0I0OFBDbUlyZ3psVEM3bWt6cjZ0dUtRRzdJbGFqV3FzZzhDUFdE?=
 =?utf-8?B?Q0NSRlh0UWRBQnhtODFkS0VhOVk0UGptQzZWRFhQcG5HV1JFNkJDUkw0MDJU?=
 =?utf-8?B?dStlV085UFRRRndMWFJpbFNEN3NBQ1BzdHdManMrRFVQalRIM0d2Vm5oOXpT?=
 =?utf-8?B?aEErUjF0S3pMNUxkYWJsbTArNzdWNlh3TDJscU1OQTE5aldka09GS0FXVU5i?=
 =?utf-8?B?NmxtQ2NHRm53c0gvOWhnMDBqV3UzYy9BeDJGaURqZmEwQXg5MWdSaVdKZGRO?=
 =?utf-8?B?b2ZoT003TGo0aVcwSmxMcGc3c09KWElRMmY1S3lqQ1ZwSUNIUkw5SEs4WjFC?=
 =?utf-8?B?N2FKZFZwNXRSV3RXM1pLczRLUUhkYkpyNlNUajNJbVczWGZpSFBGYWlaUk9i?=
 =?utf-8?B?aTlhL2xvTDh0ejl1eHpaMEM0dHg3aityTUN4Zlh2QXlUU1dJVWp2SVJFc1VN?=
 =?utf-8?B?RjBqSlRJcy9VK0c0YW9ZbnFBL21adVJhTG9LdFZ5YWROcC9Wd2p3amw5OFpi?=
 =?utf-8?B?YzdVWmxyQWt0dk4vN2F6QU0xbkZlWGRmMzNSV2g1VXEzN3UvTDNoL2krc3FR?=
 =?utf-8?B?VElMdXQyeURxUFNyNmlzaERzMFFQakkvQ3RiTCthR053TzRPTWc4Y2RBOStt?=
 =?utf-8?B?dTI1djYyNnN6cHFRM0VrV0lpZXVlVTk1MEtwN09adHN4dGxYSXhJUmZ4aysv?=
 =?utf-8?B?QjkvN3MwUDVqRzdBRFhNOGxBNFpya3puY0MweW5QcGlCblcvcXM2NWd3R0dD?=
 =?utf-8?B?dEI0clF1SElwaXdmV25MVlZvM2lmUmM4Q2gzT0x2WE04N01RR1M1N1RFNkov?=
 =?utf-8?B?ZmEzR0g2Y1FWVnVnVHpLTUdYRVMxWmFjVnZIemc0TVpHMGxMV3NsZEFaTTc3?=
 =?utf-8?B?Vmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1131eb32-dcd9-4d55-7c23-08de07da0358
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 08:50:07.7757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBCcK64Xn4j0e6E0QqTBqn+fZhXNs6i25zHTsUoeaW6eDRSznb9bmsQbipCHuV+9Qb/4rWJbrgNk8qu0ezsuUqqgcx0UPEXpq24g2pq6imk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6268
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



On 09-10-2025 17:44, Matthew Brost wrote:
> Atomic GPU access changes the migration policy in the GPU page fault
> handler. Ensure that partial unmaps work correctly with atomic access.
> Also, remove the VAL_ATOMIC_EXPECTED complication; instead, set the data
> to the expected value minus one before programming the atomic
> instruction.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>> ---
>   tests/intel/xe_exec_system_allocator.c | 85 ++++++++++++++++----------
>   1 file changed, 54 insertions(+), 31 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index b17ece9d71..b88967e580 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -48,7 +48,6 @@ struct batch_data {
>   	uint32_t expected_data;
>   };
>   
> -#define VAL_ATOMIC_EXPECTED  56
>   #define WRITE_VALUE(data__, i__)	({			\
>   	if (!(data__)->expected_data)				\
>   		(data__)->expected_data = rand() << 12 | (i__);	\
> @@ -71,7 +70,7 @@ static void write_dword(struct test_exec_data *data, uint64_t sdi_addr, uint32_t
>   	uint32_t *batch = data->batch;
>   
>   	if (atomic) {
> -		data->data = VAL_ATOMIC_EXPECTED - 1;
> +		data->data = wdata - 1;
>   		batch[(*idx)++] = MI_ATOMIC | MI_ATOMIC_INC;
>   		batch[(*idx)++] = sdi_addr;
>   		batch[(*idx)++] = sdi_addr >> 32;
> @@ -715,6 +714,7 @@ processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
>   #define CPU_FAULT	(0x1 << 0)
>   #define REMAP		(0x1 << 1)
>   #define MIDDLE		(0x1 << 2)
> +#define ATOMIC_ACCESS	(0x1 << 3)
>   
>   /**
>    * SUBTEST: partial-munmap-cpu-fault
> @@ -748,6 +748,38 @@ processes_evict(int fd, uint64_t alloc_size, uint64_t stride,
>    * SUBTEST: partial-middle-remap-no-cpu-fault
>    * Description: remap middle with no cpu access in between
>    * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-munmap-cpu-fault
> + * Description: munmap partially with cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-munmap-no-cpu-fault
> + * Description: munmap partially with no cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-remap-cpu-fault
> + * Description: remap partially with cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-remap-no-cpu-fault
> + * Description: remap partially with no cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-middle-munmap-cpu-fault
> + * Description: munmap middle with cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-middle-munmap-no-cpu-fault
> + * Description: munmap middle with no cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-middle-remap-cpu-fault
> + * Description: remap middle with cpu access in between, GPU uses atomics
> + * Test category: functionality test
> + *
> + * SUBTEST: partial-atomic-middle-remap-no-cpu-fault
> + * Description: remap middle with no cpu access in between, GPU uses atomics
> + * Test category: functionality test
>    */
>   
>   static void
> @@ -762,20 +794,14 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   		.num_syncs = 1,
>   		.syncs = to_user_pointer(sync),
>   	};
> -	struct {
> -		uint32_t batch[16];
> -		uint64_t pad;
> -		uint64_t vm_sync;
> -		uint64_t exec_sync;
> -		uint32_t data;
> -		uint32_t expected_data;
> -	} *data;
> +	struct test_exec_data *data;
>   	size_t bo_size = SZ_2M, unmap_offset = 0;
>   	uint32_t vm, exec_queue;
>   	u64 *exec_ufence = NULL;
>   	int i;
>   	void *old, *new = NULL;
>   	struct aligned_alloc_type alloc;
> +	bool atomic = flags & ATOMIC_ACCESS;
>   
>   	if (flags & MIDDLE)
>   		unmap_offset = bo_size / 4;
> @@ -811,8 +837,8 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   		uint64_t sdi_addr = addr + sdi_offset;
>   		int b = 0;
>   
> -		write_dword((struct test_exec_data *)&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
> -			    &b, false);
> +		write_dword(&data[i], sdi_addr, WRITE_VALUE(&data[i], i),
> +			    &b, atomic);
>   		igt_assert(b <= ARRAY_SIZE(data[i].batch));
>   
>   		if (!i)
> @@ -834,8 +860,9 @@ partial(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
>   
>   		xe_wait_ufence(fd, new ?: exec_ufence, USER_FENCE_VALUE,
>   			       exec_queue, FIVE_SEC);
> -		if (i || (flags & CPU_FAULT))
> +		if (i || (flags & CPU_FAULT)) {
>   			igt_assert_eq(data[i].data, READ_VALUE(&data[i]));
> +		}
>   		exec_ufence[0] = 0;
>   
>   		if (!i) {
> @@ -1742,25 +1769,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   				if (flags & FORK_READ) {
>   					igt_fork(child, 1)
>   						igt_assert_eq(data[idx].data,
> -							      flags & ATOMIC_BATCH
> -							      ? VAL_ATOMIC_EXPECTED
> -							      : READ_VALUE(&data[idx]));
> +							      READ_VALUE(&data[idx]));
>   					if (!(flags & FORK_READ_AFTER))
>   						igt_assert_eq(data[idx].data,
> -							      flags & ATOMIC_BATCH
> -							      ? VAL_ATOMIC_EXPECTED
> -							      : READ_VALUE(&data[idx]));
> +							      READ_VALUE(&data[idx]));
>   					igt_waitchildren();
>   					if (flags & FORK_READ_AFTER)
>   						igt_assert_eq(data[idx].data,
> -							      flags & ATOMIC_BATCH
> -							      ? VAL_ATOMIC_EXPECTED
> -							      : READ_VALUE(&data[idx]));
> +							      READ_VALUE(&data[idx]));
>   				} else {
>   					igt_assert_eq(data[idx].data,
> -						      flags & ATOMIC_BATCH
> -						      ? VAL_ATOMIC_EXPECTED
> -						      : READ_VALUE(&data[idx]));
> +						      READ_VALUE(&data[idx]));
>   					if (flags & PREFETCH_SYS_BENCHMARK) {
>   						struct timespec tv = {};
>   						u64 start, end;
> @@ -1787,17 +1806,13 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   								((void *)data) + j * orig_size;
>   
>   							igt_assert_eq(__data[idx].data,
> -								      flags & ATOMIC_BATCH
> -								      ? VAL_ATOMIC_EXPECTED
> -								      : READ_VALUE(&data[idx]));
> +								      READ_VALUE(&data[idx]));
>   						}
>   					}
>   				}
>   				if (flags & EVERY_OTHER_CHECK)
>   					igt_assert_eq(data[prev_idx].data,
> -						      flags & ATOMIC_BATCH
> -						      ? VAL_ATOMIC_EXPECTED
> -						      : READ_VALUE(&data[prev_idx]));
> +						      READ_VALUE(&data[prev_idx]));
>   			}
>   		}
>   
> @@ -2298,6 +2313,14 @@ igt_main
>   		{ "middle-munmap-no-cpu-fault", MIDDLE },
>   		{ "middle-remap-cpu-fault", MIDDLE | CPU_FAULT | REMAP },
>   		{ "middle-remap-no-cpu-fault", MIDDLE | REMAP },
> +		{ "atomic-munmap-cpu-fault", ATOMIC_ACCESS | CPU_FAULT },
> +		{ "atomic-munmap-no-cpu-fault", ATOMIC_ACCESS },
> +		{ "atomic-remap-cpu-fault", ATOMIC_ACCESS | CPU_FAULT | REMAP },
> +		{ "atomic-remap-no-cpu-fault", ATOMIC_ACCESS | REMAP },
> +		{ "atomic-middle-munmap-cpu-fault", ATOMIC_ACCESS | MIDDLE | CPU_FAULT },
> +		{ "atomic-middle-munmap-no-cpu-fault", ATOMIC_ACCESS | MIDDLE },
> +		{ "atomic-middle-remap-cpu-fault", ATOMIC_ACCESS | MIDDLE | CPU_FAULT | REMAP },
> +		{ "atomic-middle-remap-no-cpu-fault", ATOMIC_ACCESS | MIDDLE | REMAP },
>   		{ NULL },
>   	};
>   	const struct section esections[] = {

