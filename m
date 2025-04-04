Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E491C36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 14:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC98E10EBD3;
	Fri,  4 Apr 2025 14:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WuGanbsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9C810EBD3
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 14:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743776578; x=1775312578;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SKRUj4nIeLwjLqUf+yf4Drm2vb5dEL/Sqngp/iTyugc=;
 b=WuGanbsLXPs6fxsODPARnoEJDaH6rlhmq0L1VwXJvgRm2/FPiQuUu2Jt
 d5aA+nn4A+oU1LetvR+o6y/muckFoAD/y5ZRp+DKHdFpPwesQ6sCiGRGv
 YoKzmOa/9vhW9BkWUEwV1HRaVKWvFLSoRzYDjTFSRAEuIwX3gh0x80LIc
 cxBiIGyKInbQ9kp+XaCyXe/v3MlduzxVJG79KZNR6yReCluuFPziitNyZ
 B1gqUdLn2RrN8pHeZZHLllCTjBcolapCmmyXl3iL70BiUDc/DsD95T/zp
 F310eyyeHLwjq2Kbw9g60x3ooJAgI2lmwOCHS924C8qIc6+8Th3foWTF6 w==;
X-CSE-ConnectionGUID: 73SVF68XTJO8ZekQGDpkRg==
X-CSE-MsgGUID: BhMi0wrySTaIFjl1UiVauw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="47930278"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="47930278"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 07:22:57 -0700
X-CSE-ConnectionGUID: JoNYGqzpRNiaoAMcj6ubRw==
X-CSE-MsgGUID: pzMqudD+S/63bzJhO5xtDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; d="scan'208";a="127140069"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2025 07:22:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Fri, 4 Apr 2025 07:22:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 4 Apr 2025 07:22:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 4 Apr 2025 07:22:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C6XDXesjKJW+CisuhCDmzI4VaUw1OXd1Mo8eHdwjXHSd6fxV75nEJJQvWpwoQjIr0GeChMycoZaTQgnF4cAzXjq2LeRI+rN/NFiXtWy88GKwTS3btrh3nOU4FkVYCJn70UChv/Zz6SSmovWuT2LjoxSKp5EmtjG732zNn2NP6e/IYBeuQI3A1a+uCRcWi4DsrT7mV01PKhvwhlCVvbe2pe4ptMcxjZEtBChBfhGAJB+JdqFPTbhFGrK51bKMa4WLKc339s7+i1HeuKIsAeH3xyazZkavnVTqKkPDHJ50qcnGGCLp3UEiRJ+7X22FpIXCbCUTY3PEoDVdhh1vtguDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=velmFVsrpbAmW7LTAE5KcDgwoO6UC265O2xUt2h/C9w=;
 b=QgfnOYObVxkv0huKDIA4ppOSFOS/AovNc/f6j6yRRNe+G646Ll02VPNBjq6dn4KAHhP/ynVbCM56Rdovd9HAB1kbmiO5KNnxvGWnTfHczDWjF66tCIrK9CFTFbm178+IhlDTuOo0Ohn39MkOoYjT9QkAwBzzc+HcBQNU+RyL71XmzL1A9/X1GEBGwXyA+I5NuCVTSibYGN8I41EGANpXwGwONb5Z0IUd2t67YDjvTy21/wRt4Qcf9TdkLY1gloVs9lMalmCRDsiaYIYpndyxKKGe6JXWEJY3bRoRSLLjOMyO9b0Sk6k1MHVIb26LaKuOL0UOQ1jjW30Iv76ICbFKmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SA3PR11MB8073.namprd11.prod.outlook.com (2603:10b6:806:301::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Fri, 4 Apr
 2025 14:22:54 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%5]) with mapi id 15.20.8534.043; Fri, 4 Apr 2025
 14:22:54 +0000
Message-ID: <7f3a0c84-1a21-42b5-83a3-4e28e289c072@intel.com>
Date: Fri, 4 Apr 2025 19:52:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/kms_pm_dc: Remove PkgC dependecy to
 validate deep-pkgc test
To: <imre.deak@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250309100301.41405-1-mohammed.thasleem@intel.com>
 <20250309102833.56309-1-mohammed.thasleem@intel.com>
 <Z-LZn04ZRpFIPKdp@ideak-desk.fi.intel.com>
Content-Language: en-US
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <Z-LZn04ZRpFIPKdp@ideak-desk.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::25) To PH0PR11MB4806.namprd11.prod.outlook.com
 (2603:10b6:510:31::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4806:EE_|SA3PR11MB8073:EE_
X-MS-Office365-Filtering-Correlation-Id: ff045dd8-e0c4-420e-e9f8-08dd73842e5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk5yTlpOY1ZHeVBNNWczK3RYVlpEaGdKOEZOSHpHa3NYRmlIaVdNY3dvVWlp?=
 =?utf-8?B?NUt1K0N0cmFWUUlBbkxPK1Evd0VyMjROSldYNHN4QlNaNnRHM0JSRmpFWGg2?=
 =?utf-8?B?TFY0RUFDa3NzblRFQ0FQUW5tYVYya29KZGhKNlNGNTBCNi8wUEFEMHlVeUdm?=
 =?utf-8?B?NlBYMzc5UmY5RDRMNXBxbFVKaVh5L1huN2ZKK0JFWk5xc0h1b2JNWjZQdjIv?=
 =?utf-8?B?NDZJdldGa2lza2praXF1RjNkMnFmZmZzMFMwcjRNbVlSaGUvdHo4N1ZyUlRJ?=
 =?utf-8?B?TGZ2THg2YUZiZjN3VU1QUWZJa0EwZ1lmMDRCNStyRUlaT2RyY0Rsand1ODNq?=
 =?utf-8?B?MHV1L3JYT2prU2N1VGhYdmJPQWZpQmZPcmY4bmgyYkliWHR6RFBTV2NpQTVC?=
 =?utf-8?B?VVNCYUhzZ3FOYjZaSjFZYXVMR0hTTFFFYWE1eUFvV3E3YXdpQWVSV2xZUGYx?=
 =?utf-8?B?eUF1a1d4NjAyTzNETFM4VnRPVDJzbzZKTUNlVzRvYzVybU16VmdZUmhMSjdV?=
 =?utf-8?B?MUtWQ3EwbDFkQmlTY3VZRGZRSWREamh6TEVEckJSblhqTk9GaTErbTZ6TGI5?=
 =?utf-8?B?YVNEVWFSRUdrNkgzOU45bU5zUitZTGJyMFNvcjQzYkVGSzNoNk5Kd3dhL3h6?=
 =?utf-8?B?a3JBTUdDbkhHdGV1RjU1U1l6VVJ3MjN3TFpCNnk1Z2loOTBUSERzcVFJbnZz?=
 =?utf-8?B?VmE4N09EVFl2aEowaUVabE5XbnVRRVRQai9QZU5rREl6TWI1UDJQVGo2dzdv?=
 =?utf-8?B?SmFxbTNBTGRoY3E4dzZPRkJFakJwVEp1V2E1b3M4UDBVaG1TOWd1MGdBSU1D?=
 =?utf-8?B?YzA1R0tRZ3cyaDdBMEhqa2dqME1XSkNESWJRNG9hYW1XWW1rdk9xSm0wS3Zp?=
 =?utf-8?B?UlE0dmd3b2JBaVk3S1NUb1FSOXZmRmEwbVcwV2dqYVdGa1N0VWhvMW14TGta?=
 =?utf-8?B?VXBTZ1dvQzdpWTRiQS84eFdWelhIeXJqVUtydzJvK1dCTjIwK1RxNy9UVVBN?=
 =?utf-8?B?U0JQWlBPV3IwaGFjRnEvWHBBZ3FiNzNiN0d6YlRsL21NZ1AzczNxZmxzeUF3?=
 =?utf-8?B?Q2JnR0FGWk8yb3l4aUFaazVyWWpXV3ZzeFlQOVQrZlVnY3FuQU13SEEvRUlv?=
 =?utf-8?B?N3JIeFFtK2tJb0ovQUp2V0o2RDB3NW56dlM3TGZmd1haSzJFTlJNcDFQUVpr?=
 =?utf-8?B?VnVpelR4U1kwOU5zL000aHZGcld3RkhWT3RQZ0tBWDFyN0E0dVRCQmRPK3E1?=
 =?utf-8?B?cG9yOGlkWE0vL0ttR1dTdEVOMTdZNjdNR2w3VDU4UzdHSUx6ZDNBZXNZYWdX?=
 =?utf-8?B?Y2tHa2t3dERlQkY5MVVPRGJUVW5MYzJCVDFaN2FjTGp3NmVBMStkMzZvN1JS?=
 =?utf-8?B?WWt2K3hJY202L0kyb3dpS3RQWmRwUm9TNGNONnd6WXJnZzltL2hzd3RHa1R0?=
 =?utf-8?B?QURvcWhPektIcG9MRklBUmZwemZHQjl5emw0amxyZm1nRHpJeTVxcFlqMTE2?=
 =?utf-8?B?S1RDU1VCM0pYK21HZUN3NUdCLzVtQWI2M29SSlZmbDYrdE5DbUJHcmlqNGxn?=
 =?utf-8?B?STJZOWgwOFdJSFFkSFNWaVFscFB4N29iWE1xUHp1UnNrL1FML1Fjc0QvMm9z?=
 =?utf-8?B?R3Z0U05KcE5yNUgzdXVQR01jdmhHdktja1ZiOG42Y0k5elg3Y2k0QmFxU1pC?=
 =?utf-8?B?WFZXNE1OODhKU29NRmJ1MUx3Z3Y2TjAxZTRXa2FBZ0hsM3g4VW5TYzRjZzRJ?=
 =?utf-8?B?RXRZQkh3ZktWV0xPa1pjdmRwMGRQZHYxTTlKYWtYMk82b2dpZ0JtTm1JRVBm?=
 =?utf-8?B?Q3dqcnFvdWdDcUUxRmNpam5lY3BVWkpDa3RRMnlOc2RJZGxla0xIOHpYNkY3?=
 =?utf-8?Q?LbRhbCUAXPZ0y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZngrZC8wbWdZNzhvMGdZLzZGMnRVZVNYMGNNTEV2R0xHcTllYkEzUnljM0RY?=
 =?utf-8?B?S2xKNFV0NDJtWVNLQVNSQ042dTNJdU9xcXRVcFJYMXNnVjdMazR2ZVZrRmJJ?=
 =?utf-8?B?ek9FcnA4SXhMcy9uVkJKZUxEOFRFUGVTVzFrZmJ3S2JTVnlYbnZ4emR1YnlD?=
 =?utf-8?B?ckhuY3FUUVM2RnpTSWo1OVdBc0JRWWVJL3d2ZllvQUtVNm0wMkNsSHBCU3Qv?=
 =?utf-8?B?TUl1enBnQS9qajFKZEZZK01YZEM5NktUU25SNmh6bVBwVjNsNHZjU2FtaGcr?=
 =?utf-8?B?KzZZN3gxQUZnalppMDIzWk56cXplTmUwV3NjajJsLzdHSzdXY0xPLzRKM3dW?=
 =?utf-8?B?V29rc0FqSU9CSkxWSzJnQ056bldjRno5OHFlcDFhT29hZkh2eDI1M2lZcEVo?=
 =?utf-8?B?ZWVKS2N0VzJ5Sm5HWmh3Z2w5NWh2bmYrMXZCUkZPSy84cTFTMHBUNlBvbVVo?=
 =?utf-8?B?SnR3SC9EZ21Dd0s2TUJDVmtuaGpkQ3Q5RGQ4RnQ1dXQ5U2Q4MHlQS2NWS1ha?=
 =?utf-8?B?eFdUZU0wTE1pVUJ6eWl1OVZ2bitLUW5EY20rd3Q2S0pvNndaUHQyNlRWaGtn?=
 =?utf-8?B?Vk5uTGxzZFhEMmt6TXZWaHFBZGF6K29uRWc3VEtuTE01MTdhTmFCOU9uRDI5?=
 =?utf-8?B?dGsvNEMzQ1hTSGRadHA4OHU2MENKR1krMkZ2Q1dubEp3UFBVVGtoTk4rbndC?=
 =?utf-8?B?WmZzaWhsVmE1TUJUWndJNFdzK0lZMHQyamcxM1F0S0NZUmlwR0dGS2VRYWc4?=
 =?utf-8?B?b0xSMlVwSHd3bjhRcHlyL0p1UGVoWW1aSUk3TnVPMzhzQS9ZQm5oUmNtcHRo?=
 =?utf-8?B?OFd1RnRrVlR6MHo0bWtxVVlZRjdxVi9jeC9ZQXpWbFZoai9CUEx3S0JobU9s?=
 =?utf-8?B?Vyt4aFVwSm9jbUxOZEpvVFhXcjdhZldaaEk0ajRDQXFtRGRHSlZJbWpZM1Ji?=
 =?utf-8?B?KzBSaXBOYmxWejVtNmMzeWdtenJydG9zempiZTk4ckhjMkcrMjFoUSswVHNE?=
 =?utf-8?B?bFlZREFrTlQ3M0dXdUY5anZVcGVaNmJMOS8yeGZ0aGRTU000TWFXWHhoRyt0?=
 =?utf-8?B?UitRK2JjRGZnd2N2RG1yZnRsMFZhUHRiTXRQcXUxa2FocjloWDc3NVJsVXRu?=
 =?utf-8?B?TjRvM1F5L0txYnpVY2tyTUkxWlhqQWlwSXFvWUp1TURYZ3NzRUtsMUw5U2kr?=
 =?utf-8?B?RGlhLzhpekVWM2IrVEV2Q0pCOVFiUCt0U21ydUhXZS9wdlVqY2ZHcE5RVDFY?=
 =?utf-8?B?SENqNVVhZnoxK1VhWHhiRXVYekpkMGJpbzcxbndGbWlqUitmdXhCbTlsdDln?=
 =?utf-8?B?Qlo4UitCc3lrcFNTc0kzTVdpaHZYVCtZUXMxNzhBR1pEemNMYW05U1ZvN1Ax?=
 =?utf-8?B?ZTRJR0dNSjhTLzhDNHBQRXBJTWJDbENkZFArcHRoWGhtMkJKNmNKQmhra2ZD?=
 =?utf-8?B?Z3p0RGFnZC9DS0k4T3RjRjFldHowbEFtUXNES3VveHpwZUcxbzMzdms5Y2xT?=
 =?utf-8?B?dkJjanRiUU1hOHBQL1poU2lkYlNPMEcyUS9FQjcwS090RlFEUTVPZGZwWjlw?=
 =?utf-8?B?REV4c3R1eXh6TDUvbjdzcDV0a0VqRW9IdEVPeUtXK3p1ZmN6bTJFWGFjVmxO?=
 =?utf-8?B?eDN3VmhwNXpDYVRHdG10OE15Q1F6UmVxdUJpSTlwK1cvOWN2S3R1T2NPUmhF?=
 =?utf-8?B?aGxvMENIWktZcVloQjIzM1I0dWh3cTlDb0hZQWFNWnlZRVZEbVcrMUY4MFRu?=
 =?utf-8?B?OGd4VStSYVRoNXhnL0NLbzlJTUJScVpZbXQ3SnVLRVRrenVLVnliMjIxM0c4?=
 =?utf-8?B?VGJYWEljOXkrWUkzSkJhTW40SEE4VnZpdHBKZ0NtVjhaS2Z5dGtYeERvdVhL?=
 =?utf-8?B?WEk2cVRmM1g0VTZRbkdHSmNod0JRcGtrQm8xMHNFNnR2SW01RWh1UFNXdEtk?=
 =?utf-8?B?WXV2Vk5jVUE1QmdBaDJNTlhXMmtMYnZzVkY1bDdZdWpudXRQN2FIdDdEQjh4?=
 =?utf-8?B?Q3NPREZVUmtZZDhpUHcyS3lldFpwWFhxMGo3OWFUQWxjUVFZV29UcEJpbEF6?=
 =?utf-8?B?UXhURURkNE5EemRpMWNyY0xTOVRjclBrU0pYVnVlUVJkU3JFRmw4ckhQVW0r?=
 =?utf-8?B?MTB1eUdSMklwd3RnaHRFd0VhNDBUYzZFL29qWGcxVHp1ckF5MGxUdEc5VWxY?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff045dd8-e0c4-420e-e9f8-08dd73842e5c
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:22:54.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vqz+7Ooa+Wozcdd0toST/TmJAGMxZ1PVxTlTP74P5uuHDMWnUHwxZVZ3SSf5KRD6iNgoJigwtKfWIErGj6sTx2LCb/rptS1hVdTr0vnj0ug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8073
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



On 3/25/2025 9:58 PM, Imre Deak wrote:
> On Sun, Mar 09, 2025 at 03:58:33PM +0530, Mohammed Thasleem wrote:
>> PkgC counter was removed from MTL onwards, so an alternative counter was
>> used to validate deep pkgC tests. With the new KMD changes, a dedicated DC6
>> debugfs entry counter has been created to validate these tests,
>> allowing for the removal of the existing alternative counter code.
>>
>> v2: Updated igt_describe and discription.
>>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/intel/kms_pm_dc.c | 34 ++++++++++------------------------
>>   1 file changed, 10 insertions(+), 24 deletions(-)
>>
>> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
>> index b4f30a37d..ed24a24b8 100644
>> --- a/tests/intel/kms_pm_dc.c
>> +++ b/tests/intel/kms_pm_dc.c
>> @@ -78,7 +78,8 @@
>>    * Description: This test validates display engine entry to DC9 state
>>    *
>>    * SUBTEST: deep-pkgc
>> - * Description: This test validates display engine entry to PKGC10 state for extended vblank
>> + * Description: This test validates display engine entry to deep pkgc by
>> + *              checking dc6 entry for extended vblank
>>    * Functionality: pm_dc
>>    *
>>    * SUBTEST: dc5-retention-flops
>> @@ -617,22 +618,7 @@ static int has_panels_without_dc_support(igt_display_t *display)
>>   	return external_panel;
>>   }
>>   
>> -static unsigned int read_pkgc_counter(int debugfs_root_fd)
>> -{
>> -	char buf[4096];
>> -	char *str;
>> -	int len;
>> -
>> -	len = igt_sysfs_read(debugfs_root_fd, PACKAGE_CSTATE_PATH, buf, sizeof(buf) - 1);
>> -	igt_skip_on_f(len < 0, "PKGC state file not found\n");
>> -	buf[len] = '\0';
>> -	str = strstr(buf, "Package C10");
>> -	igt_skip_on_f(!str, "PKGC10 is not supported.\n");
>> -
>> -	return get_dc_counter(str);
>> -}
>> -
>> -static void test_deep_pkgc_state(data_t *data)
>> +static void test_deep_pkgc_state(data_t *data, int dc_target)
>>   {
>>   	unsigned int pre_val = 0, cur_val = 0;
>>   	time_t start = time(NULL);
>> @@ -694,7 +680,7 @@ static void test_deep_pkgc_state(data_t *data)
>>   	igt_display_commit(&data->display);
>>   	/* Wait for the vblank to sync the frame time */
>>   	igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[pipe].crtc_offset, 1);
>> -	pre_val = read_pkgc_counter(data->debugfs_root_fd);
>> +	pre_val = read_dc_counter(data->debugfs_fd, dc_target);
>>   	/* Add a half-frame delay to ensure the flip occurs when the frame is active. */
>>   	usleep(delay * 0.5);
>>   
>> @@ -703,8 +689,8 @@ static void test_deep_pkgc_state(data_t *data)
>>   		igt_plane_set_fb(primary, flip ? &data->fb_rgb : &data->fb_rgr);
>>   		igt_display_commit(&data->display);
>>   
>> -		igt_wait((cur_val = read_pkgc_counter(data->debugfs_root_fd)) > pre_val,
>> -						      (delay * 2), (5 * MSEC));
>> +		igt_wait((cur_val = read_dc_counter(data->debugfs_fd, dc_target)) > pre_val,
>> +						    (delay * 2), (5 * MSEC));
>>   		if (cur_val > pre_val) {
>>   			pkgc_flag = true;
>>   			break;
>> @@ -712,7 +698,7 @@ static void test_deep_pkgc_state(data_t *data)
>>   	}
>>   
>>   	cleanup_dc3co_fbs(data);
>> -	igt_assert_f(pkgc_flag, "PKGC10 is not achieved.\n");
>> +	igt_assert_f(pkgc_flag, "Deep pkgc state is not achieved.\n");
>>   }
>>   
>>   static void kms_poll_state_restore(int sig)
>> @@ -781,13 +767,13 @@ igt_main
>>   		test_dc_state_psr(&data, CHECK_DC6);
>>   	}
>>   
>> -	igt_describe("This test validates display engine entry to PKGC10 state "
>> -		     "during extended vblank");
>> +	igt_describe("This test validates display engine entry to deep pkgc by "
>> +		     "checking dc6 state entry during extended vblank");
>>   	igt_subtest("deep-pkgc") {
>>   		igt_require_f(igt_pm_pc8_plus_residencies_enabled(data.msr_fd),
>>   			      "PC8+ residencies not supported\n");
>>   		igt_require(intel_display_ver(data.devid) >= 20);
>> -		test_deep_pkgc_state(&data);
>> +		test_deep_pkgc_state(&data, CHECK_DC6);
> 
> What would be now the difference between this and the DC6 tests?
	-->this test also depends on deep-pkgc(pkgc8), which validates 	display 
engine entry to PkgC8 state for extended vblank scenario. 	Here we took 
ref of pkgc10 as pkgc8 has been removed.
> 
>>   	}
>>   
>>   	igt_describe("This test validates display engine entry to DC5 state "
>> -- 
>> 2.43.0
>>

