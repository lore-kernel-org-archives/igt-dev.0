Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3940DC44508
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 19:05:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E040110E872;
	Wed, 21 Jan 2026 19:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LsniEaf/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F21D10E86E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 19:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769022301; x=1800558301;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=+vcMfqUWJIhLZ4btQzghq3Wl1mUiP0ogjP9GF6frp+I=;
 b=LsniEaf/jYLAABo612xMemvLk2Z7gcZ8g09DOmn9iplg4QmQ48BzgzSn
 aVIQKPKVrJn0qlWOY5c7QP54SG+dGP/SZPXAnS8f4/zmiN/B8xTz89YEq
 5AY10i2AKbouuNflOV8bIaQdvff7Xfyz1ubjLaLo0b269XrTc36sZGCoP
 42g7YbYjvzGJxAJlR1S0QFha+R8aKOYwrRriybF0hrAwGdk9YO5QyVKn9
 y84sXJ4JgJLpkQgRvQTNT1xM3F/RIls7YIahofX40p8zoXC28K2XkfIlj
 0/opwnik5aC4qljFUMj/kaWnjwzSXHag0BDgPIm+LGRVuEy4JjTRFOrd1 g==;
X-CSE-ConnectionGUID: SLmg9jWmRNGlV7DLWWsL0A==
X-CSE-MsgGUID: Tf+2/abXT5KioNhrUu8N/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="69274118"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="69274118"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 11:05:01 -0800
X-CSE-ConnectionGUID: 05zIEKxWRdqP6Ey5quNkYA==
X-CSE-MsgGUID: Fl29q6weShWRPrOPyAhvBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="244104528"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 11:05:00 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 11:04:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 11:04:59 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.17) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 11:04:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jRBmtMDt/MCXRrlSD0GC12VwTWDARJmXcXeHdz2yji5wxRIsJi3GlVUiBRLLHX9PinSbr0HiVk4KQxME16pkHRnJXGqP6/AwPhz16RYAwqyUJl8Lgvnh4VL0lKChx2WYNc5/5/W6hRVZp74ejeOjVDhDQe9XhlMNODjFzRlGqJhpWupNQdCgyefSZMcXUwoSReGD2RLHddH4ls6FhgEbNTG88beKFJN7NNRbX58TlU3dHc17gRn9sM1UfYDm/y5YvSKSg31cRntl5yKsPrVwD5t/vR1ApzTm8qaPamP/TEKQuQGCECFZYHT8C6KjN4y74XkAC6gECkULZxxE3zTBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+vcMfqUWJIhLZ4btQzghq3Wl1mUiP0ogjP9GF6frp+I=;
 b=lrDQ3ygjlIDvgXJ9114ihv15BI8ojbHyF39rCm2pFSKC3BgXrJ8Kzgs87HB7JrLoFljbOoGAmqipLG8UgWo8RPyJLi3u9+IhscfaO1eSS2z6JiwDrf27sGXzmpjkwcD8O6WwERc1twCpRsNHg6YwyFcGnWiapMfphj4GFaOyNbz+TZA9D2hBmxeWHivNzux7iFdy8CyvzURnMJR1wGmONtKm2sjHWflTQ+eLIaBK/2sJTCpfLvmSgP5oeS26mXj/W9nxCjcduGv+2n2qY1Tcg3aETvXB4FpZ/+8YMzrSWuwSxkpmJzyTPMQg09QsUJndDBUStH4CWUGCQo7fWBYd6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CH0PR11MB8216.namprd11.prod.outlook.com (2603:10b6:610:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 19:04:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 19:04:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Topic: [PATCH i-g-t] tests/intel/xe_module_load: Add driver unload
 before force-probe
Thread-Index: AQHcipFysFKs88w2ekannqgHoAe4urVc/IQA
Date: Wed, 21 Jan 2026 19:04:55 +0000
Message-ID: <74599fd049cb837f788d038123225f5a581eb9f8.camel@intel.com>
References: <20260121045003.116426-1-nishit.sharma@intel.com>
In-Reply-To: <20260121045003.116426-1-nishit.sharma@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CH0PR11MB8216:EE_
x-ms-office365-filtering-correlation-id: 38eb226f-9bcd-4b1e-3c9a-08de591ff6e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ODFMS3FhejJkVzlBVWFTS3dhVlY3eGkxZ1Q0Y3BzTFlZUkg5YitCSkZxSkVk?=
 =?utf-8?B?WGd0d0M2ckhQWWkxbnorQjhzYUpwclBZekhFNzNjNmtsYk92RWxPUFgxZGtv?=
 =?utf-8?B?M2ZIMDVtczRJZ0V3Y0VsWnlpN0xLeTZDS0hTMm4wcjhsWXZOYVhId3dQd1l1?=
 =?utf-8?B?SG9HQ2R1Sk84dW12UHl3dkxadG5rWVgwZWJYb0xhQjZRUFc3RXJIaE9zNWZ3?=
 =?utf-8?B?anJ4TEVSaDVjdCtodUFvS2VEVlRHVzh3bXkxZldoSmphdlhQQXdpUlRFNUMv?=
 =?utf-8?B?VDl5enFBWjZEL2IzU3JyekRWNUNaZ05YQkVxTXNXNi90M2pCZFpvd0h5SzJY?=
 =?utf-8?B?Wjl2MTU1Skw3WkE2RDk0UUdFNDBQb3YyWEtnUGpFdE1NMzZKTkZWenQ4V0Y1?=
 =?utf-8?B?dVpjNWMvQ01hT0VlKzg4MEpJTDVQTWNpUG5NZ0M1ampNUFI2b2RScTdTYjNQ?=
 =?utf-8?B?Ti9aNzBpaHBHWWtuNm9DUDMzaWlBdG4xVmRMVEh4eUl1TFlmWlZhbk9uVG9Q?=
 =?utf-8?B?bldCbTZpenRCU1dxSFl1ZnpScU9SVVRaczRtblh0d0w3NzBUYUlpNDA1Tjd5?=
 =?utf-8?B?U295SGN4d2JVNStqYlN1YmpTRXlGZXY5R0YxMnk2MFBaellZVitMTjJCdC93?=
 =?utf-8?B?OGpEYkdoczZ4Mkw2ZG9iTFk0d25ka0RGS2dLR2NFemYybWl3UVZERmlUVlpW?=
 =?utf-8?B?ZnFZNE1qSnM0eW1LVVNuUllPMTM3WC9EUjNhbHZvYU5uWHo0bEU0czk2cHpV?=
 =?utf-8?B?d3RyZDZxZVhwWmkzVms0TFhsaitrWmNTODJmRjlSaE1sNk03ZGxuZ0RWMEJz?=
 =?utf-8?B?T3RVaUV5MDIrbitNNFVrUm9CQzdja1RIN0N0NGhkSUEyczVOQ1Z4M0JOc1JP?=
 =?utf-8?B?R3M1aEt6emc1STFhK3FZdElnUVRmZmNjVGpaWkg3NEtyTlIzWThmbkFFWEI4?=
 =?utf-8?B?cGJBZ21JeWpiYnpIQmxwc2Zialh4K1QwRWoxaUd6c0g5dHpuUk9EczNiVnZJ?=
 =?utf-8?B?WXkvTUhpLy82T215SThvbmxtQVovTWlOSUc2M2xFZmo5QUZNTStHQzB1dGJS?=
 =?utf-8?B?YjBENEpINHFGdmJhdkRsMkRGcnpUdWp5aVNodXZBV0NKWWk2ZzlBelZiTWlJ?=
 =?utf-8?B?SngvaVhLQnZMMU1vTjZGbHphZHZzeDg1K3lUbFlpNXVmU25xMkdtejhKNWdu?=
 =?utf-8?B?UGZHcWVMdFNqWE1lSklyOXZIanlDMjRiSy81bWtiMVRwL1MyeDdSd0hENlU5?=
 =?utf-8?B?YWZsSlB5bjk1RDM2dzRGUk9QMCs1TitKcDVycm9YV0xyNmhNWTd0NHZQbnVP?=
 =?utf-8?B?d1BDVk5LS0hNVXJDWGdOOU5XWWp2amhhSGhMUSsxenI5ekFEZzVUNVFoK0p0?=
 =?utf-8?B?MVZaOGUxL0dDL2xZYVJ4RCtvcGwzeHJ6TSt5YzlqZ244cmZlUURoQVB0ejJ5?=
 =?utf-8?B?eWpKMEk0NUhtTXg5N0RSQ1pUdEd3MHJLWFdPMURiQUliM0pINXZ3RUw3ck01?=
 =?utf-8?B?ZEdZcm9FRmdRaFRHYW1KTm04RVJVSFhVaE5ZMm44eU1nQ2R2aEoxTElIcmln?=
 =?utf-8?B?OUM3amlQU3lPTkdIcG1aRFNXbkNCME4vRDRxMys0Unh4TFhpZ3hlODcxeDRL?=
 =?utf-8?B?eHhLMVg4YmplMVk1aitFMnNkZFlrbExpYTFIWHdHVm9yN1kvTVcrem1uLzhO?=
 =?utf-8?B?YVJYTmI2UGhqU1BVNVd1VzZWcUVyNWR6UU1jME1hTHM1NTloYW9IZ1BXU0d4?=
 =?utf-8?B?clRCOTlxcVRsVUZRTU9QN3QwSkhXYzQ5YUQyYzU1L0hjSWIvWEdWQnhZWnZW?=
 =?utf-8?B?SHVhaTBYRXhSak9nSUlaREV5eDBzRzJ3TU1pcTdVeXB1UzNoMHp3cEcyZjd3?=
 =?utf-8?B?bG9uYkV3d2k4LytmejJFRmhNaktPMTZNTVFOT1hQWWdpVTV6R28ydkJHYVN0?=
 =?utf-8?B?aDE3aHF2OGJYdE9mNXduS2haRTVRVDRFUFg1UVJ0ME82WWltMno4THRFd2Ny?=
 =?utf-8?B?eVBXTmRSQ1NSOWkrWTJIU0dSMHVrdG8zcmd3YXRrZE9XcFVBckEybXA1Ums0?=
 =?utf-8?B?RjM2RmNiNXJsdmNaZm4zLzRrU24xc1FLNkFuSlEwOGhqTGYvTnhGakxqRVEr?=
 =?utf-8?B?b3Z5VmN1VUcxUzhydXEwMEQwek81SGgxSy8yWXhhb25CR2VMZ2VseGZadkVB?=
 =?utf-8?Q?c1s9X0ur//VgZp8DUtHF+N4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L2hUY1pLNjVORG1Pall3UmVpcDRlY2VjczlXRWIwMVg3ZVlLWGUzZ2VNMERj?=
 =?utf-8?B?UmNJVEp0OFkrU0lUblNoM2dlSU0zcjl3MFZPSjkySmM0ZE53RG5FUkFvVnFS?=
 =?utf-8?B?TDdFcVN6VE1QNGZLZktneVZWdkZWQ3lSZTJuVGNOdmxmM2hRSElwYVFweTcx?=
 =?utf-8?B?K0g4TENrM21od21SejA0dzRINGliaXNNTTl4bXQxcmtBS3pncEJpRWdub0c0?=
 =?utf-8?B?UXJ1RnB2YTV6Y2dvUUZXM2NETHpDa1p1ZVN5eEhXMEtTeUNxcUlaRkxScklP?=
 =?utf-8?B?LzJLbTFkRVZMc0RVeEQveFM5TEJlTUtyUFcwdzlqU3lIUUJRZFNxQThxeE9J?=
 =?utf-8?B?M05BUWg2RG5OaytnRUQ3OW14NGxEWFFOUEFKT21ZKzJrOFdFVzVMSHE1MDVt?=
 =?utf-8?B?cjNyeEVPK2pDamV0QjlVSm5Hb3AwVnl2TzZPTTdOak5mRVhrbEo1T2p4Rk1p?=
 =?utf-8?B?SGRId1VHM2d4ekpiTUQzSkd6bStURnhORW5kTDdFUythcElhS1AySzRKKytl?=
 =?utf-8?B?MHhrTXRNbEZobVZGdE1VbXdRVXlZTUxRRDVoR01uSSs0cm5zbHA5QmY0akNB?=
 =?utf-8?B?dGc2Sm5nb0ZVeklORStKdmx1d29uaUVFblRjUDRVY2xoTi9DeWxWbFBhUHh1?=
 =?utf-8?B?bjhORktmMUhQYnVWRWswbmlWYnRrVFRLVHFoM2QwU3l5TDVybnovNEhYazVV?=
 =?utf-8?B?TlphNWJDTkJSV2V5T0g2NEJhUC8vcWhycmpadHVBZlFNdEt6ZDM2c0QxSDND?=
 =?utf-8?B?KzA2U053dEcwVEM0K0JnbXFOaE8xQndFTVlVNERtTXVlSzVSSXl2d3Y5WS8x?=
 =?utf-8?B?ZnMvZGlhckdxVDdjcUlqS05CWjQwSHROS1AxWS9JYVJPQW84c2hBMzR5b3dK?=
 =?utf-8?B?WFVhL25jTm5yWUI0aUdCd3E1c2YvSWVpRE5mM1BDM2VOZXl5am00UkRLQmpB?=
 =?utf-8?B?MlBMb2YzM29zWFNaaENrZ1ZYeDJrUHJHcmJoVmF1S0VqV2llaVpzdmdsc0po?=
 =?utf-8?B?c0lGZ29aRkJGSUVVaUlEejB3OHZaSU9lcVUzcFl1M3hPTWY0OXdsNGFBaUNp?=
 =?utf-8?B?YXEyR09VSnd2bGluRlBvekNnNU96STZLRmxtTVNHMlVCaHdKUitCa09EQTZZ?=
 =?utf-8?B?aTlTd1NZb1BkbnhmY0ZIZGt6djVCZ3JyRGhxNk5QRjh1aTBPMjhGcHh4YnY3?=
 =?utf-8?B?bHVYUW4zeXBFTmpaZm5WMFc2ekxaUWdaRm4rVStGL0V6bytqR1hLcXc5Rkg2?=
 =?utf-8?B?WTNVSjZYckJDY2x1enBnNjFNbHFFTTY4TkhiR2xCNzNXa2d6MFhRazY4NGlo?=
 =?utf-8?B?MlRhbHpDdXVCVXhQVzIzNnI3WmtUZlFkYW1uWG80ZzlaM05JZ1Rna2MyNnhv?=
 =?utf-8?B?YWFmZWpvRzNrUXlrVnRmalpuYjF4YXVhekdRWS9uMXJzZE9STVNNS05Ga3Nx?=
 =?utf-8?B?RnFYV0NUZ2NjVVVjWnFQdzEyMFVtd3lZUXl3dEZRd0M0MW9vQ1Bwa2l0RGJp?=
 =?utf-8?B?eW9Rakl1bGJ1TGFQRDZ6eGtQalo1V3MyS0psa2Nkd28zayt1czY1T1ZRQi9a?=
 =?utf-8?B?N1FoanhmZ292czAvSCthUVdKNEFSTnVxbHNjamtNZWJrTHlBL1pEKzdFUWdo?=
 =?utf-8?B?TW9wNXk4MjUvVVFRMVlLcEQ2YnQ1MEZJdk55M05EK0ZYZ2JlVk5HUnNsdys4?=
 =?utf-8?B?VHVnR2tHcmQ5LzN2RURCTUhkODR5b2VBd3c0ZWg0L2FENmQrUVlSWXA3d2lq?=
 =?utf-8?B?MWptZ3NxeVFBbFFNdWxWQ21TSmphTHQwaE5PNW9yRjVLejVHUVI3RDlUYlFi?=
 =?utf-8?B?cDFBalpTa0sxU0EvR0JmQmJqQlpEMGV5ejhMYkNGTElFV0ZDV2VoTXdYcGZT?=
 =?utf-8?B?NlM0SnZtOXZnclRyNHZoQ0laYzJEQUJ4UFlKZUJhcDBqMVdsc2lCRzZGR2xG?=
 =?utf-8?B?aHY0RmltMXBxUUxRaE9hRTdmRkZEMkViVnQrMTZTN1MreUNoc21jNXJhOGlX?=
 =?utf-8?B?TUVGYzVLckRFclZPUlc2U21hRTlSQTVtNTJyaXNhNHZMMm1WQjcwejFiUVFM?=
 =?utf-8?B?ZnpydldtVTRqN0t3OE9WVXlYZDB5SDFHRDdvekI5NHkzYXZ6QXRhUDZ6NlNM?=
 =?utf-8?B?NW1ET20xakhxQnQ3STFZRkxnWnJvRXZtdUZ6WCttN3RIeWhQMU9MZFpBQ09S?=
 =?utf-8?B?Vys2VkwvbjY4dktsN0FwajQ1TGJKUEJzVmxEVk9IVGJ3UVgyQ3EyKzl0SGVv?=
 =?utf-8?B?eW55MWY0cEF3d3RCenhWNXJUUEhBOThDK3FMdGRLaVFtcDVWcnQyNTRiTnpm?=
 =?utf-8?B?cjlCR3k1TnVGRitWTzBzRThYSDBwZzJVOXczSXU5ay9NUVVNT09lUmthZkIx?=
 =?utf-8?Q?+R9k6+DPmajQv2Rg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <684464209283304D97656B76F1228CC8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38eb226f-9bcd-4b1e-3c9a-08de591ff6e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2026 19:04:55.3802 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0uO6fOlg2SEm5G0olMFuE5fQ8vY7W5CZTzawtLqd/gj68JuLcHos2pwj5sBGfRF4IYYcOcKLCRpZFMhnBi4U9BXQswR3ji2K9fMsgCnnDDM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8216
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

T24gV2VkLCAyMDI2LTAxLTIxIGF0IDA0OjUwICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBQcmV2aW91c2x5LCBhIHNraXAgY29uZGl0aW9uIHByZXZlbnRlZCB0aGUgSUdUIHRl
c3QgZnJvbSBleGVjdXRpbmcgaWYNCj4gY2VydGFpbiBkcml2ZXJzIHdlcmUgcHJlc2VudC4gVGhp
cyBjaGFuZ2UgcmVtb3ZlcyB0aGUgc2tpcCBsb2dpYyBhbmQNCg0KSSdkIHJld29yZCB0aGlzIHNs
aWdodGx5IHRvIHNheSB0aGF0IGluIHRoZSBjdXJyZW50IGltcGxlbWVudGF0aW9uLA0KdGhpcyB0
ZXN0IHdpbGwgc2tpcCBiYXNlZCBvbiB0aGUgb3JkZXIgb2YgZXhlY3V0aW9uIG9mIG90aGVyIHRl
c3RzIC0gaWYNCmFub3RoZXIgdGVzdCBsb2FkcyB0aGUgZHJpdmVyIGZpcnN0LCB0aGlzIHRlc3Qg
d2lsbCBza2lwLCB3aGljaA0KcHJldmVudHMgdGVzdGluZyBvZiBmb3JjZV9wcm9iZT0qLg0KDQpP
dGhlcndpc2UgSSBhZ3JlZToNClJldmlld2VkLWJ5OiBTdHVhcnQgU3VtbWVycyA8c3R1YXJ0LnN1
bW1lcnNAaW50ZWwuY29tPg0KDQo+IGluc3RlYWQgZXhwbGljaXRseSB1bmxvYWRzIGFueSB1bndh
bnRlZCBkcml2ZXJzIHVzaW5nDQo+IGlndF9pbnRlbF9kcml2ZXJfdW5sb2FkKHVud2FudGVkX2Ry
aXZlcnNbaV0pIGJlZm9yZSBpbnZva2luZw0KPiBsb2FkX2FuZF9jaGVja194ZSgiZm9yY2VfcHJv
YmU9KiIpLiBUaGlzIGVuc3VyZXMgdGhlIHRlc3QgcnVucw0KPiByZWxpYWJseQ0KPiBieSBjbGVh
bmluZyB1cCB0aGUgZW52aXJvbm1lbnQsIGFsbG93aW5nIHRoZSBYZSBkcml2ZXIgdG8gYmUgbG9h
ZGVkDQo+IGFuZA0KPiB0ZXN0ZWQgYXMgaW50ZW5kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBO
aXNoaXQgU2hhcm1hIDxuaXNoaXQuc2hhcm1hQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgdGVzdHMv
aW50ZWwveGVfbW9kdWxlX2xvYWQuYyB8IDMgKy0tDQo+IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVs
L3hlX21vZHVsZV9sb2FkLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tb2R1bGVfbG9hZC5jDQo+IGlu
ZGV4IDZmY2Y0ZjgwNi4uMGM3NWM0ZWJjIDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9t
b2R1bGVfbG9hZC5jDQo+ICsrKyBiL3Rlc3RzL2ludGVsL3hlX21vZHVsZV9sb2FkLmMNCj4gQEAg
LTEzNCw4ICsxMzQsNyBAQCBpbnQgaWd0X21haW4oKQ0KPiDCoA0KPiDCoMKgwqDCoMKgwqDCoMKg
aWd0X3N1YnRlc3QoImZvcmNlLWxvYWQiKSB7DQo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgZm9yIChpbnQgaSA9IDA7IHVud2FudGVkX2RyaXZlcnNbaV0gIT0gTlVMTDsgaSsrKSB7
DQo+IC0NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGln
dF9za2lwX29uX2YoaWd0X2ttb2RfaXNfbG9hZGVkKHVud2FudGVkX2RyaXZlDQo+IHJzW2ldKSwN
Cj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAiJXMgaXMgYWxyZWFkeSBsb2FkZWRcbiIsDQo+IHVud2FudGVk
X2RyaXZlcnNbaV0pOw0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoGlndF9pbnRlbF9kcml2ZXJfdW5sb2FkKHVud2FudGVkX2RyaXZlcnNbaV0pOw0KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0NCj4gwqANCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBsb2FkX2FuZF9jaGVja194ZSgiZm9yY2VfcHJvYmU9KiIpOw0KDQo=
