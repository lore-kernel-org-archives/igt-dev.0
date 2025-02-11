Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3003C0219B
	for <igt-dev@archiver.kernel.org>; Tue, 11 Feb 2025 14:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A0310E6D6;
	Tue, 11 Feb 2025 14:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WVwsP0pD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F99C10E6DC
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Feb 2025 14:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739285746; x=1770821746;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=DtQx1u8JGC4q8laolgTePz0f9pkPIsK1dBkFc/VRUSE=;
 b=WVwsP0pDy9aPIM+vtDJuCQj3vhZylHsgWRK0IqQjcZZdQo3sQoxniVOc
 b4Q5MUOhal5F5uLkEpgIQO1pTKg0Y2Yn+xFNGZYsKMnE6YjRo/cmDrsFX
 MvFPi5w8Pod42Y/8KsXZWeZL54dhIRdIuq40FYsAIRs4zaXNKq/1VZxpt
 p+GMvhFM3TYXDr2WeLn43fmiLaze4o59sU04dHmVwJPajkW2KNE40JfRr
 OtfvO3qVPGRyRnkICOtRnEvi07FPMdYEoAPo2GwOe5pS94XsFcuhSpZ6f
 WJII0lYopBxVyY0G8/uhjz2LTg8nxylM4F3bXFjmU1C6T5zuuk/gxSmsc g==;
X-CSE-ConnectionGUID: ocQCa1xITSyUuSCxVL/fpw==
X-CSE-MsgGUID: JkPgzsbhQEq3zszD7koAfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="42746055"
X-IronPort-AV: E=Sophos;i="6.13,277,1732608000"; d="scan'208";a="42746055"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2025 06:55:45 -0800
X-CSE-ConnectionGUID: zYJ2lwJkTqW1CdbLqwGC9A==
X-CSE-MsgGUID: xra6E4NJTXqsHFhTfRHkmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117150182"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Feb 2025 06:55:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 11 Feb 2025 06:55:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 11 Feb 2025 06:55:43 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Feb 2025 06:55:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5zGZ+SCKUlbD4U5nJnXKgb18C0pM3Ujdv30zDpGM5c7clfmdAbuuwY0ZwakW7mu1vZMwSXU0FoGHSBdnCWYq1jhK1uvnWLZ085TZlzat4wysG2U301DucTWCMjd4fp4bEqNxaZLmicuOvHK7EyWVs4R27flED0aTYseRpNFplFkLscl5Zf05Kpf+uke1ja78H17tK5k6lbNJoHJottTMqTuNqt+dxtXD+w0+6Lp9rLeek0LABEWwi32YKbcVND+3/sovPsCIOXy5Aqx3r1ansYz2FP7LsqeXcZ87NWUmNnPtAG+1Cd8elSaXObHV3zkmjow76kK6/SzSXF6JfVAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgPxOtiaEIPBKLSSnf1Bmegu6P1bczlXvy3JYDausdE=;
 b=FA0eFZWLv7QMeAY07XQR85vcmDYiVyfMSt8iOkkagjkLv9APR52YPw2GgCuHZ5KlXxP777Rl4/QsJvnwykWYOhjQPM6Ky0V3Zj6J5YDJUoCC4/qsWWt5JrK6u7DwnrXRB49rd16EmoGsOkT46GJ1jOvDBHBz6Mr6APPtzM23Xw5Uw0FJiCaqRrpUizmdJQGXam27FXN2RFTSJISFS9n0V2nzFyAjgeXRhd09u8o9CFK2z6X0Dddl1ehMUK7QcNW/Mw0WKRt3/Bw7B6EYKSEPEZsuYfA/P31Kt/6EGsmjthzuuAolHrA626lsckAVG6Yggns2VcTM571LWI1PdiY6mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by SA2PR11MB5067.namprd11.prod.outlook.com (2603:10b6:806:111::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 14:55:12 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 14:55:12 +0000
Message-ID: <8b11c74a-1285-4f4b-b3d2-eebd732e6a71@intel.com>
Date: Tue, 11 Feb 2025 09:55:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20250205184143.233197-1-pravalika.gurram@intel.com>
 <c8facc8d-f2e5-4789-81a8-7ae9a3fbeca7@intel.com>
 <87412be1-83d2-4df6-b44c-ed4471984bb6@intel.com>
 <BL1PR11MB5525508AA5BCCA9AFB4ED9D184FD2@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <BL1PR11MB5525508AA5BCCA9AFB4ED9D184FD2@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0318.namprd04.prod.outlook.com
 (2603:10b6:303:82::23) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|SA2PR11MB5067:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4fddc9-d4b6-4b96-1cea-08dd4aac15eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3oxSUpFd0IyTWgveU9LZmx4SGIxQWFlc3hMalF1czRTamFtcVNCaFl6SXZ1?=
 =?utf-8?B?WS9LU3JmSEhsbWxlRXpXajNudVBaYXVoL0ptdGxXcERFR2J1OTBnNXZDNk10?=
 =?utf-8?B?RExvYW9ZaTN1VW5TQWJYaHJuR3RTNFFkanVxd3BVakNkVVhSMXRjRm1PTUNI?=
 =?utf-8?B?S05ja1NSdmVvWFJMVHpZcEhFeXRqQlhpL1VDVzM3Z1pwWlFxZEg5TFFDWGJ3?=
 =?utf-8?B?SVNCREx1SnlIUEk1QkFqVUVKSGQ5TnpmTzNkdks4aFZ5NTdmcVNDNnJ5TXNn?=
 =?utf-8?B?WW9XaVRmbGpwK2NoMm1HejdVWFVvOHVwRDJialN4Y2I4SjZNZkJldjFucXZa?=
 =?utf-8?B?SmJKWnQ5SlhmYS9zWFUyZERzSG9RenA3bnJ3SmdlTWJxRGg0anRObEFUVkU3?=
 =?utf-8?B?bVdGSWdoS21oZThibzhaREVsS1V4MzRoNGk4RlNrYWRFRFZidENOS2ZuVXZP?=
 =?utf-8?B?TGpVMzBnUUdmeHBVa0lyQXVoY3RVQm9UcjBaZ3E2SjlFci82VjVOaEIxWXZj?=
 =?utf-8?B?VGZ1akVQOVM1WEovOEFNM2kzaG9Hd0lKYzcyYjA4T1Y3T0V5WGU2Rmtldnpo?=
 =?utf-8?B?UVFoMktDR2lJT1k5cW1VSDFDblp6bVF2UkdhUW1YNTAySmk4SzdsOEVLenlS?=
 =?utf-8?B?S0w1d0VVNDNDVTNSaWN0NUp2bnpEbnVpU3pTWGhyVTZRZytLZzBDSDFFMDQz?=
 =?utf-8?B?UTNPVWpHNlpIMmdGOHFuUlJFNjJkVmlSamptNGZTL0JIOWlKdklsK1o5dnZy?=
 =?utf-8?B?UDBtMkxzcVZ5UkQyNkpMdjV6QUFPVFdlY0lFT3RudUIyc0s3c2FXQVFUUGo2?=
 =?utf-8?B?cXF2Mjh5VFRCb0E3ZWtnRmhyVTJ2NEpwd0owOWFoSXhoSUpra0lhbENaMDlO?=
 =?utf-8?B?SFN2ZzZTS29Ba3BRWE9DWldGTXdjS3VGdElWUU1MemRpMGNkb3JPVW9ENFg4?=
 =?utf-8?B?V2MrRUhHVlVuejRVekpsdnArVmN4QnRHU2QwNVFpbVRjMEc1dzBRU3B3WTFC?=
 =?utf-8?B?a1VBT210S2JOWk9WbjI5TEovTkNmN043OEtiRlh6VXFCU05VSWRva3gzTzhz?=
 =?utf-8?B?UmNJRG5sRnpGcmFBWmUvU0ZORDl4RytBSFF1TVZyeFNPeHJzRWxtb1RHQ0Er?=
 =?utf-8?B?Tit4RGsyaEQxTTNheXZKK0x1a0Zjdi80ZkxoNG52MllJa2FGcnlJVDhIc01N?=
 =?utf-8?B?UUM1NWVQc3JtWEhtcEhqWTZIbzQwSnNpTHRVRnN4cUpHTzE0VXhEYjBPU1FU?=
 =?utf-8?B?dWV1YjdFVWNhYzNheXNvZFJDMkJXL3Z0OWhOUW1PN2szTno3eFE5cm43QmhK?=
 =?utf-8?B?NExDelUwUDl1WjB3cXZjZjgvWFZZQXlLMXJrRndoVXVUWTRIMVVQMENxUXR4?=
 =?utf-8?B?a01lcktHWnlqcHVlTThBdk5hQnJVRTFZS000TXg4Y3pTTytXbWJNQjJTenlR?=
 =?utf-8?B?cndRTEtGaWsrRkRGMFFKK2ZLREJCbjFMWU9QelpCeTR2Mjg0RlI4alUrdVBk?=
 =?utf-8?B?WjNsbWlLQXVoSlMzbUdzWm9mOXo5cG5namhXTC9hbmxoL1VsNzBnUmZrSXZF?=
 =?utf-8?B?MlJ5TGdwZlhDNVJ4MXV0cU55aDBWRVZETDlzeHQxcDliUVEyNkxZSERGUFdC?=
 =?utf-8?B?aC92M2VzS3dFaFJBSFBaVlR6NUJ5b0YxWERCVzNrK0J5bkRROTUvNHQyaTBo?=
 =?utf-8?B?VCtTazhXS0pzZTdJc3lKaTA3VkJoK1pabmxEekdPbXBjeW9OZWkreVNiaGNE?=
 =?utf-8?B?R2d3cWNiRkwyQm5jSkhFNStpY0J3ZWhTb0NzZVdQNWRTMm0yaDlwQ01Ed0pZ?=
 =?utf-8?B?L0R6WFlEK2xITHlUZXFzOTRoK3RsZHFYSVJUT2toUEwyR1pPZjZGMG5kbXAv?=
 =?utf-8?Q?dbEHA0FVXv5PK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUxlZWdwdDNCWVpsaFhKd2diUGdYMm1KSkNOOWN5dXV0N0pLYldQY3Q5cFY1?=
 =?utf-8?B?Y1lMeThkNXlXbnl2TjNLd2hUUGYxYjgxbGYwbzkxVmZ6ZkdodHI1SXAxejJO?=
 =?utf-8?B?VWw3WlJjbjZ3cytWQkM2RHJhbGlodGZZMlplZE9zZHVhck5oSDVGbTk5Sm0z?=
 =?utf-8?B?YWhjRzg3NzBWUm9DU3ZSRytBMnNsb1ljWVdPUXFtNkgwb0ZFU09oUHZmck5w?=
 =?utf-8?B?ZzBZcUY1V3pXMG1vWUhLQUdudXZaY0dNZTlPbXdvT21qOHNRQ1RmWExDSUFY?=
 =?utf-8?B?ODJVc21vOEZXQmpacmVTbzNOdFN4VGY2dHdrZ1YrWklVMTRJYkgwMTZhRnB3?=
 =?utf-8?B?a29XZ2R3Rjg1c3d6dmlJSFVhNTExamZvQ2ZHUGpjTmtKc29pcUg1VnhoRGtJ?=
 =?utf-8?B?RWFGNkpaOEtHR2RnUHExN1FFaFpUSDlyUUxnbjFtZ0RiTGkxU3BKTFJPeDl1?=
 =?utf-8?B?VlgrL1RkNHVyNlNrUjN3RzJ6NU9OV0JiMVRFUGx2ODAxRk5MSU5aSDVHY3dJ?=
 =?utf-8?B?S2ptcjhCRnVYbDladmlLTUUveVVDSjliNHBQblR0VUVrancxdFVWZWk4NHpS?=
 =?utf-8?B?U0hqdCtRNXg3UWpYVDk5dWQyS2JHY1BZOTd1dS9td2dxU0c4eUg4azB2WnYy?=
 =?utf-8?B?SGdrTGZFdUU5bVRhNEdOVDJBN0psajlTbmhnaUI1cnppQVFacU5ZaWdxRGFs?=
 =?utf-8?B?eGhMMktyQUtHMGNxR0I1VUlscUxwSVBKLzBGUm4yNlR1UStVSWVjSTlnT1R3?=
 =?utf-8?B?RmY2NUMyRUtZL3ZNbE1RcHA0b3graGc2UUZ4UDRzNlFtUFJvQ2VNTjVoNGVG?=
 =?utf-8?B?TURRQ211VGJpeXdtMCt4USt4T1ZSSnM2Y3pTZi90ZWw0M3FPMVhobHBnZE9T?=
 =?utf-8?B?WW83M1FndStHSTJ4UVBtTi8zVk8wZmMvK3hrVWZldWxqaU9Id2lsY3VTemFu?=
 =?utf-8?B?cjJvUDhiNXoySDJLNjk1dnBnNldURUtzb0N2U0Y5MU1SQjgzQ2MxbVFJSC90?=
 =?utf-8?B?WElZSTE1aXdETlNiNmVybVcxR1ZoQ3lpZ3RuYmJuOTc1N09oS0ZnUmczWVYr?=
 =?utf-8?B?MGkrU0Y5K2twNXd1TEIxTmE5b1JNNU10bDh5MVJHZ2k1c3NWVWp2SHFIWWdo?=
 =?utf-8?B?bDBCTENSeG11MXZVYXNsQzJFZVFkb2tnMVgrMCtlSGtrMlRJRTdFV1EraEJz?=
 =?utf-8?B?REdDRTVEbnN4cXVKYmJhMUFuTUpyUzZkbFR1cENkZlcrU2VoSWxzUUttZ0pN?=
 =?utf-8?B?b3B2Sjk5a05ISDdSdkY1MTBMSEFpT2Irb0Z3RjFDV0F5dXlEdEhXU3lhTWNW?=
 =?utf-8?B?eHBmU1VmMDlvajFUREdiTzhJMm16ZngwQmUyRGkzL0taSHRVZ3A4L3Fsd0px?=
 =?utf-8?B?N3ZkTitJZkNWeDBzaEZoUnRmSkwxcWFoREZKOEd5RWp2WThOTXY0UlpaZUc3?=
 =?utf-8?B?SkJuSDQ5VEtKdjlWdVBSOGR5eTl6UU4xZGFqSkFmVDA0VnFIelhjQTVKTmZ5?=
 =?utf-8?B?elpxWThNQUpIR2VqMDI3SFYzcVJ3ZjViVUhlVm1peXBxRlV3SWNONjlYSE1u?=
 =?utf-8?B?T3FLUE5HMVNMam5SSEJTUU5rNjhYZ1BrVktDdkJyVlJwS1JWUUp4WEhtY29V?=
 =?utf-8?B?Z3QxQXZ2UWNsQytBK0hvKytjdUU2WktSdGdFSHovL2xRWGZFWTJnTjUwd1Nm?=
 =?utf-8?B?aTJ2Vit4QlR4UG50empTcncwenE5aVZQRm42OUV4bEZEMEdzVGh4V3ZDenVn?=
 =?utf-8?B?RDV0SkpVUS9qeVRSWFJiVEhOYUlLeFlVN3pDUmFmNDJsS1dWQm55QmpFY3kv?=
 =?utf-8?B?Nk5HNnljVG9ZM2Ezd2Z2UEMyT3RIRGUxazNNQW5rbUdCck1IVjh2dHgvcy9K?=
 =?utf-8?B?dHJtK3BSWUp4MVBIOTZiZ3gvdUxDVlkwSGVzcGk3Z0NNZWxYUk9mOGlKUG85?=
 =?utf-8?B?MW5Td3VxeC9XcUdFeHR3WXNaQmpWWG1QNjV5aEQ2VzV1Uk9kdUhEU3h0bm5k?=
 =?utf-8?B?Si85NHkyb1JNdGdqZUFBSnFiWHJBZmJ4MkZ2R05VSDcrdTJrS0xYTHgyYzJQ?=
 =?utf-8?B?WDEyZ2IvVWwzSnUyUUNtTjNDS25uQUY5VTlkTXN6K3V2RE1VYnpUY1ZMM21r?=
 =?utf-8?B?OVcwelFVWGt1cmRrUlc5SWpKdUZTWXNBdWZCVTdXb1d4REpTVzJmS201QytR?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4fddc9-d4b6-4b96-1cea-08dd4aac15eb
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 14:55:12.1061 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08Z2wpH1cYRdzehN9EzBhe7RZUdZSNqc6QS/II2qPfCoydc9MM30jc10JLmZlNY7Hms3+8MJkx5Ss6AjvA42gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5067
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



On 2025-02-10 11:34 p.m., Gurram, Pravalika wrote:
> 
> 
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Dong,
>> Zhanjun
>> Sent: Friday, February 7, 2025 8:46 PM
>> To: igt-dev@lists.freedesktop.org
>> Subject: Re: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
>> DUMPABLE flag
>>
>>
>>
>> On 2025-02-07 10:05 a.m., Dong, Zhanjun wrote:
>>>
>>>
>>> On 2025-02-05 1:41 p.m., pravalika gurram wrote:
>>>> check if the VM is there when DRM_XE_VM_BIND_FLAG_DUMPABLE is set in
>>>> the generated devcoredump.
>>>> check VM address within the range
>>>>
>>>> Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
>>>> ---
>>>>    tests/intel/xe_exec_capture.c | 64
>>>> +++++++++++++++++++++++++----------
>>>>    1 file changed, 46 insertions(+), 18 deletions(-)
>>>>
>>>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/
>>>> xe_exec_capture.c index 55ec3d4bd..4eaa3f4d1 100644
>>>> --- a/tests/intel/xe_exec_capture.c
>>>> +++ b/tests/intel/xe_exec_capture.c
>>>> @@ -53,16 +53,15 @@
>>>>    #define DUMP_PATH            "/sys/class/drm/card%d/device/
>>>> devcoredump/data"
>>>>    #define START_TAG            "**** Job ****"
>>>> -#define END_TAG                "**** VM state ****"
>>>>    /* Optional Space */
>>>> -#define SPC_O                "[ \t]*"
>>>> +#define SPC_O                "[ \t\\.]*"
>>>>    /* Required Space */
>>>> -#define SPC                "[ \t]+"
>>>> +#define SPC                "[ \t\\.]+"
>>>>    /* Optional Non-Space */
>>>> -#define NSPC_O                "([^ \t]*)"
>>>> +#define NSPC_O                "([^ \t\\.]*)"
>>>>    /* Required Non-Space */
>>>> -#define NSPC                "([^ \t]+)"
>>>> +#define NSPC                "([^ \t\\.]+)"
>>> Add "." as delimiter, that's fine.
>>>
>>>>    #define BEG                "^" SPC_O
>>>>    #define REQ_FIELD            NSPC SPC
>>>>    #define REQ_FIELD_LAST            NSPC SPC_O @@ -77,6 +76,8 @@
>>>>    #define INDEX_ENGINE_PHYSICAL        2
>>>>    #define INDEX_ENGINE_NAME        1
>>>>    #define INDEX_ENGINE_INSTANCE        4
>>>> +#define INDEX_VM_LENGTH            2 #define INDEX_VM_SIZE
>>>> +3
>>>>    static u64
>>>>    xe_sysfs_get_job_timeout_ms(int fd, struct
>>>> drm_xe_engine_class_instance *eci) @@ -177,7 +178,8 @@
>>>> test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>>> int n_exec_qu
>>>>        };
>>>>        sync[0].handle = syncobj_create(fd, 0);
>>>> -    xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>>>> +    __xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
>>>> +                DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>>>>        for (i = 0; i < n_execs; i++) {
>>>>            u64 base_addr = addr;
>>>> @@ -287,10 +289,6 @@ static int load_all(FILE *fd, char **lines, char
>>>> *buf)
>>>>            /* Only save up to MAX_LINE_LEN to buffer */
>>>>            safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
>>>> -
>>>> -        /* Stop on END_TAG */
>>>> -        if (!strncmp(END_TAG, buf, strlen(END_TAG)))
>>>> -            break;
>>> The target line located after END_TAG and is at the end of dump,
>>> that's why this search is removed. But could put comment in comment
>>> message about this? Remove search for something need some description,
>>> we don't want it to be removed silently.
>> And add example line, like:
>> 204 [1580001a0000].length: 0x10000
>> in comments somewhere, like check_item_u64 or where it was called, make it
>> easy to read.
>>
>> Regards,
>> Zhanjun Dong
>>>>        }
>>>>        return start_line;
>>>>    }
>>>> @@ -351,7 +349,6 @@ static char
>>>>                    value = &line[match[target_index].rm_so];
>>>>                    line[match[target_index].rm_eo] = '\0';
>>>>                }
>>>> -
>>>>                if (key && value && strcmp(tag, key) == 0)
>>>>                    return value;
>>>>                /* if key != tag,  keep searching and loop to next line
>>>> */ @@ -361,16 +358,44 @@ static char
>>>>        return NULL;
>>>>    }
>>>> +static uint64_t
>>>> +compare_hex_value(const char *output) {
>>>> +    char result[64];
>>>> +    uint64_t ret_val;
>>>> +    char *src = (char *)output, *dst = result;
>>>> +
>>>> +    if (src[0] == '0' && (src[1] == 'x' || src[1] == 'X'))
>>>> +        src += 2;
>>>       this is works with "0x123" case, to skip the leading "0x"
>>>       how about "[0x123]" case?
>          if (*src == '[' || *src == ']') {   ===> works for [0x123]
>          ret_val = strtoull(result, NULL, 16); this is skipping 0x output will be 123
> 
> Regards,
> Pravlika

2 things:
1. The leading "0x" removal not works for "[0x123]" case, you get 
correct value converted is because strtol can handle it. print result 
before convert, you will see the "0X" exist.
2. strtol(strtoull) can handle this leading "0x", so the above removal 
logic is not necessary.

Overall, the removal logic is either have bug or not necessary.
To be clear, this is an NACK.

Regards,
Zhanjun Dong
>>>> +
>>>> +    while (*src) {
>>>> +        if (*src == '[' || *src == ']') {
>>>> +            src++;
>>>> +            continue;
>>>> +        }
>>>> +
>>>> +        *dst = toupper((unsigned char)*src);
>>>> +        dst++;
>>>> +        src++;
>>>> +    }
>>>> +    *dst = '\0';
>>>> +    ret_val = strtoull(result, NULL, 16);
>>>> +    return ret_val;
>>>> +}
>>>> +
>>>>    static void
>>>> -check_item_u64(regex_t *regex, char **lines, const char *tag, u64
>>>> addr_lo, u64 addr_hi)
>>>> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64
>>>> addr_lo,
>>>> +          u64 addr_hi, int tag_index, int target_index)
>>>>    {
>>>>        u64 result;
>>>>        char *output;
>>>> -    igt_assert_f((output = get_coredump_item(regex, lines, tag,
>>>> INDEX_KEY, INDEX_VALUE)),
>>>> +    igt_assert_f((output = get_coredump_item(regex, lines, tag,
>>>> tag_index, target_index)),
>>>>                 "Target not found:%s\n", tag);
>>>> -    result = strtoul(output, NULL, 16);
>>>> -    igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output,
>>>> addr_lo, addr_hi);
>>>> +
>>>> +    result = compare_hex_value(output);
>>>> +    igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag,
>>>> output,
>>>> +        addr_lo, addr_hi, result);
>>>>        igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>>>>                 "value %lX out of range[0x%lX-0x%lX]\n", result,
>>>> addr_lo, addr_hi);
>>>>    }
>>>> @@ -435,7 +460,7 @@ static void test_card(int fd)
>>>>            igt_debug("Running on engine class: %x instance: %x\n",
>>>> hwe-
>>>>> engine_class,
>>>>                  hwe->engine_instance);
>>>> -        test_legacy_mode(fd, hwe, 1, 1, 0, addr);
>>>> +        test_legacy_mode(fd, hwe, 1, 1,
>>>> +DRM_XE_VM_BIND_FLAG_DUMPABLE,
>>>> addr);
>>>>            /* Wait 1 sec for devcoredump complete */
>>>>            sleep(1);
>>>> @@ -451,10 +476,13 @@ static void test_card(int fd)
>>>>            check_item_str(&regex, lines, "Capture_source:", INDEX_KEY,
>>>> INDEX_VALUE,
>>>>                       "GuC", false);
>>>> +
>>>>            check_item_u64(&regex, lines, "ACTHD:", addr,
>>>> -                   addr + BATCH_DW_COUNT * sizeof(u32));
>>>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY,
>>>> INDEX_VALUE);
>>>>            check_item_u64(&regex, lines, "RING_BBADDR:", addr,
>>>> -                   addr + BATCH_DW_COUNT * sizeof(u32));
>>>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY,
>>>> INDEX_VALUE);
>>>> +        check_item_u64(&regex, lines, "length:", addr,
>>>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE,
>>>> INDEX_KEY);
>>>>            /* clear devcoredump */
>>>>            rm_devcoredump(path);
>>>
> 

