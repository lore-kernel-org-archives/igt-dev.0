Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BA2C2BBCA
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 23:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D396910E870;
	Thu, 20 Jun 2024 23:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ESsy0M0f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC1810E2FE
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 23:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718925361; x=1750461361;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Dq1/cGIxCHQU7bPQ+YO2IAUaBjkJf8jPGK223NpoEw=;
 b=ESsy0M0f1f8CXW6Ct+OZl2d+Tdtv1OYnsCGY+W3qrtvY1A7CtUXSdDdc
 VxJWQ6p/FbmxWGq4qhGMGM6ZdpmbgpkfQIJLQusfJtd/i7ksbaCpZNKmm
 cUwcbBz6F0MtmdYLLGvfIOMlEL8JmeY1jtbjTd9qy6InrhESOEZCCZWca
 9NVfhkviD9IILtwknL25VeJgdh9mhmvc4tFQhTh+i2yivJ1EJK47obiqU
 +koqRmxqcMNnmS+tVImACracOTVR0Dcd62vcvxK7RNbg+qMKFDaJbe/xb
 eq3e+veKYxxbzqkrH9xdzsv3J5q2ZT2DpZOK8Ps5pXvfyXas8XYl2GWR5 g==;
X-CSE-ConnectionGUID: uqmtUZx/TLadG0hTmGlJQg==
X-CSE-MsgGUID: UCmeyDKTSOyeH+Msc/z3fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16174382"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="16174382"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 16:16:01 -0700
X-CSE-ConnectionGUID: nQkr6AUxTCOM2xOn+APEsQ==
X-CSE-MsgGUID: YcA3EnXtQ9qut9V18TnjCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; d="scan'208";a="42482588"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 16:16:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 16:16:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 16:16:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 16:16:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+1Z5Bt7m9b6lCFp82j8Av89NNFCZ3prDkFtl+gGyrJVeJualFspJcRZpU/4uoiEzPcOe27TtbhCyrFyJKjKM7Aj1YvsP7tPboZQ5meYEgchiSA5KVlHVD1hGRxVmSQG678ldQ+5wkImx2K92G0Zs/RyHEoZLd46H8e9z1NGKFAHbbMUnuMbEJgL1RiYiyD1rHQItqcVcAeEvzk0S/RrKW2TdKgWUA+dEfjYSJkmwpoKbFfJPRwmoetn5GCpNI6HYA1gUUqIk06XWS81UDGnKyaOu4ob/hezWGcJlwLTmGsY7DgX+453Ii5Kn8OXmovriHUXpHxOBvyfSbpkzCMMzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1DwAFprHmsPLTvYRFKP8FPMPHGuCoKnvNl8dMfAVLNc=;
 b=ZGxFgA7mz/H9pJqgw2YZN3B9DyGmC1+iUuYvmGQT7N/74w+XyBMN45widF20Xj3ajWPJdptkGRrXL92gD+jD9ly+E7tNXf9kgzgReHGYrzK7D0Hpkk4+Rccm9o+MlkzOsdm3x9SRPhAzsrX2FxrffQr/B1XYrZvy9EuDbRonrSHjc1VNrAsd+cvvFspNryKNqH147dNO0BotRwZ7y2RNxMldaWHh8lRlfcpDAMWtLvN2eHDwu1k1gWnAKE3nSsCXpXbwAX+r8oAVSzCY3EpBQVoG+9QXdVO2xk0UkG4Kmk+hozvdtz+2T7vBd7qDFio0FHRl0nc/T3wZCNEbjUF1Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6168.namprd11.prod.outlook.com (2603:10b6:8:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.29; Thu, 20 Jun
 2024 23:15:57 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 23:15:57 +0000
Date: Thu, 20 Jun 2024 16:15:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 12/28] tests/intel/xe_oa: Add "oa-formats" subtest
Message-ID: <ZnS4LPN5MX2Lg95C@orsosgc001>
References: <20240620200054.3550653-1-ashutosh.dixit@intel.com>
 <20240620200054.3550653-13-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240620200054.3550653-13-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR03CA0117.namprd03.prod.outlook.com
 (2603:10b6:303:b7::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6168:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cf45d2b-0b08-491d-f7b9-08dc917ef115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUhaQngwRXRrdXczR1FBZlk3L2t4M0l6UEZUNXpFeENtUFFwelR1Uml3L1Zv?=
 =?utf-8?B?L2dNOElsRVo4aExMT3N0aHhEc0dQVlJhdjV3NmNBb21TUStZV0VsRkZTcWpn?=
 =?utf-8?B?NjlMVXJTSDR2OTZKZml1UnE1WnhDcjBLZm5rS3IwKy8vOFp3WVgzT05PU2Zx?=
 =?utf-8?B?VHV6R2JKd2tMNkpZUVRIR1JGY1Fyd0ZhdjNsRXdRSTVPM09PekhFRW5CRTdV?=
 =?utf-8?B?NXVtL2RuKy9MS2lJU1hQZlJ3UGw0L2FLSE00RlEyVXpuUnUySm9DNE9kbDNt?=
 =?utf-8?B?NjBtNHVzcUQ3V3ZuWkprcUd5cnJ0UkNWMFRNbitqZFVPSUhJdjBrY2tHdDFI?=
 =?utf-8?B?THZ4RzVOdXM2eEU4c0pBMDJ5SnZ6eDdqUnd3MHRmck5pRzFLeUlZRy9HL3ZX?=
 =?utf-8?B?b0dTUGJiWHJhVXNnSmRKVlMrbWhJWEJDamxSMjcxMFdTU1FHMWZ6RzA5NkZ1?=
 =?utf-8?B?ZjNndjJZN29vT215MlFaZmRnOWd6Nll0MnZvamJzQTRVVFVlOENxUkEyTFFr?=
 =?utf-8?B?d0ZscWxEcjRGYVk2ei96M0p3blZLdUhjVEZKei84VDdlc0I5WXZsaVFSYU9O?=
 =?utf-8?B?WWM5clI2bGRlclZEcnhiZWhXMWJvRHNjck5vNWY2VnF5WEErdHVWZ3JydXJk?=
 =?utf-8?B?a3NhYTkxTHNhcWtQZzdNc2dyVWRLMHR0N3F3Q2x2UnY1SzhmbldUYW5uYWZK?=
 =?utf-8?B?NFJVRW1YdHpLemV4L05wU3lWM1RDaW4waHZqY0h2NjR0V084blFPZUdpL2hL?=
 =?utf-8?B?ZW5rOVZkZk9YSVJkMFlJdkNlZGdVaHI3Q2RzdlZSYURLN0ZMK0kveUQybDIv?=
 =?utf-8?B?M3FKdU93OVVEd2RlTVBudDJxL1hDSlQzeTBHNTVlL05qSDNkYmhwYjY4RnZL?=
 =?utf-8?B?MnE1ZlQwU1VaRC9qOVk4eEJ0aGp0RG1MM09TR0RWQkxPWmF6QVMwTXZGQUNK?=
 =?utf-8?B?VGpvbzc4V1V4dHF0S0tsaUZpY05KLzA2bGRsd0Rqd29JaTBkdDB0ZjVHenZj?=
 =?utf-8?B?cVlDRDFxa0V5dXVaZmJvTlBhODNGdStKNGNkcjlrUUZjL3VxSTZNSnF3ZFNm?=
 =?utf-8?B?VTB6V1UvRzMzRERieXJUb0s5Q2J0OVo4eUkyNldWamJJenRxSFRQemgyTDlT?=
 =?utf-8?B?U3BIeWhWTEpBb3NCVWxZdmw1dXZTdlNFcmlJVnE5dlNwZkRLaDZFazgyVzJx?=
 =?utf-8?B?T0p0UUR2SDErd3Evd2kybmc0UlVoUC9rOU1kc0gyK0FUY2JvVStQZFdqcXYr?=
 =?utf-8?B?NzkzNmd0aWRTZFpyWUNUVXUxYmhvQmtiZ3FxTGxsM0VJeXk5WGRlZlczUHVz?=
 =?utf-8?B?T1IzeGo4ZTVURm5LaTlhSGJud08remd4RTNCd1pUWS9JSVE4RjhWcTZ3c1pv?=
 =?utf-8?B?WWtVTUZmVTQyK1pNdzZWNDNEV2NCSFJNTTg4UVpnblJBTDdNdnc2S3hDRkcx?=
 =?utf-8?B?NXVmL1JoR0tEUWE1TFo5WlRnZUJneDQrOHJyUmd3MzcxVlhlN0dkY1dYWjYw?=
 =?utf-8?B?bEpFSW0zZjZMS2g2ekFtdkFMUWd3TldqNlIvYXlUZHRkeTloK2syQ2l1OERX?=
 =?utf-8?B?Mi9yMlpBN3VOZktBUW84M1NCcjExaFRFcHFna3BsMWFKd1lXYzlUblI4bGZH?=
 =?utf-8?B?dElUZ05TK1VRQmRScTg3VlU4UGZMNG9HME9zaDJjOGRGaWNLS0tiK1BtY2RU?=
 =?utf-8?B?VlkvaXpldGtQVUd0cFFwWGo2cGh4NTVCZUg0MmlRMktkQ3JNbm9hQnlMSjA5?=
 =?utf-8?Q?/xEwfT7raJycFEcKSPlw7wNrFjoBIYuP3J+u8Rp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ekZienZYTURya2Qxa1l1dmlyNE9mNmd1RmFCV3g0VXFpTmtCdUZVTitIZzRL?=
 =?utf-8?B?WGljcVFuY0pGY2IxWi9hMjFTV0ZFUElLeEpRc3VLa2RlWGxyZ0pjZjBNakM2?=
 =?utf-8?B?bkdxenJrMzlySnZSU25yZUJ0dHQ3WmNYS0RmemR1VUtINGl2S1g1YStrdjVJ?=
 =?utf-8?B?blZJcUk4UUFvT1d0NXFDSUxFOG9ITG1iN0x6eTFGUEd1T2JJZUNkV0FOdFBl?=
 =?utf-8?B?TDA4Vi8zcEJGMG9YdW1JYUZ2c2hQTzhSdjdJZFJWU1JoUk9WTCsrSjFjdlF5?=
 =?utf-8?B?QWlEempJb3A5UHA3RzRNQnJRV0lqVFRHUmREU3BRbFhwM0cwaTd6azV6Mkpm?=
 =?utf-8?B?cElDK3pVdGVEUWZDWHExejduOGljano4UkFKdjZ2aHRlTUFJODdpR1kvSHB2?=
 =?utf-8?B?bmhUZjhndW9XanNqblprQ1cycHlkU3JSTmhtQThHZ3hSaEJoM1IvbHFTaE5M?=
 =?utf-8?B?UjJuZXIzR2hTcVRwWlRvTms1bitWcEhGSHRPSWN1MGg4QWRmSTNXNlFOYlYy?=
 =?utf-8?B?MUErSzRqY0g3YlpaVGcyUUI1bjZJcXZMMkFSZ0tPM3R5a0FlV05pZHpzNG02?=
 =?utf-8?B?Q05nZzJEdHRzcGVzY2ZPbHdtVmdEd0x4TzB1MHJuQWQwNldYdW9GcmtmZ1F0?=
 =?utf-8?B?YnFYSThxT3Z5emI3RDBpWVNiTDA3b1V3TXRMR0JZRUQ4S0VBa1IxR2JQNFM3?=
 =?utf-8?B?T3pFeUtLU05MZUp3RDlxemQ3dEFyTkhkbFE1UFVvVm80N1FJaTVsZzAxMXk5?=
 =?utf-8?B?TnpjWDJlcGRGVlFBZ3VMT1AvaUtqbEppSzhNNkVJeVNxRjk3emxrbDcrQllH?=
 =?utf-8?B?UFkxbGVHTHM2aE13aE0zMTZ0K0N0NmJDSEE0Y21ieDRiUzlhVVhWZWdnMzhi?=
 =?utf-8?B?RU8raVpoVlhjbUtpdWl1Ykc5VHNMNENjQjIvUmRGWGhWbHIreTE1cUlKSGFV?=
 =?utf-8?B?emExVDNJNnBCQS9CSnJMd1B4ZUMrb1Q1dVN4TVQ0eDZhRU5wcmp2YllyUDZz?=
 =?utf-8?B?c0lZMU5iMHlkQnNDbzVsVmJUL3FGc3p3QkFiMGhqVkozcmc5UnFNemtuVWRs?=
 =?utf-8?B?UlVheDc0VzRuSVRRSCt5cTVRTWxnTkNpS1V6NHFodXY1SldtVDhvOEdiRTly?=
 =?utf-8?B?dlpVWFZpYmhqSndIK1ViQmoxUlUzRGVmcVJoMCtpckFzcDZvRkhCU0NGN015?=
 =?utf-8?B?OTM5a2RUWVZreGMzZUtMUW1EcG1haTIvWFc1R1BpTXVIN1A2WEdqVTRrUjZO?=
 =?utf-8?B?R3pWK3pxOEpCTkU1M2F5K3RYYTRrTHgweDhDQTJ6ZzBUdXBMOXZTMUZxcFhN?=
 =?utf-8?B?RXk3ZncvRzFkTnJMaElMMm8vZXM3WDdvb1JnSnlBZ01UYUljbmc5VlFaYjJ3?=
 =?utf-8?B?Q3ArT0gxa0tEQndtSzA5OHFtNm4vZDA3VFZwVytCNXppbWIvZ0dlU3hUYUta?=
 =?utf-8?B?Z0RseTZyVHJzWWdwcTVPZExrU2FwNmgzeUJpV0hqWGw5MlRuN01TV2RqWm03?=
 =?utf-8?B?TysyYURKLzY3ZWYxWUZ2OHBwdCtmRVQ4d1FYTnlUeFVGOFhUMmhzVFUxeW1Z?=
 =?utf-8?B?aGpLeDlNT2dqeWdCZ0h1WnFleWUvK09xVGpFUkpWSXVuU2pnQ0tPdnJHaHpW?=
 =?utf-8?B?dVJqL3MrSFpwZm9zaEs0NDFoRmE1ckpKczZOVzdQdk9zR2NnemlPK0pVRVI3?=
 =?utf-8?B?OElWVUtJVm1TdTJhWGpVQXVwT0ZMQkd6R05IbXV4RTNyUWgzNFFVZzQ1bjJY?=
 =?utf-8?B?bXJZRzhKSlJDNnNDRXcxZXZkZFI2eXBwOEdRRzloK3RlNzIrSnEzclk4bkxw?=
 =?utf-8?B?amd6ajZsd0FKWFdQVDRVa2dsVlk3VXlhQ3hrN1NsWFFlL3ZxRUtxdGRRczMv?=
 =?utf-8?B?ZUNGUlVQMTdjdUc5dHNjeFYzbVY4RDdLdFgxQi9VbjBFM0UyLzZBUGdlOVM0?=
 =?utf-8?B?WVR0NHR0aER1WjA1b2ZqeW4zbkhDODVlaHdJVnY5ZDlSUldJK1RVandZREc5?=
 =?utf-8?B?TFBvb1krQ0ozU3grNS9PVnlCd0R3QlJlTTgzQWFxeTA1N09zZVY5bjBkUzRO?=
 =?utf-8?B?UUF5b08yS0dJS01YNWdaVXp5UFhzZmNWTTZndUxmblVVMXovSWU4OEc5RGFo?=
 =?utf-8?B?MkFhWCt3SW1lYldoaUc3OXJZTFFaOHNsbWhhTmxuQmJXNnptTnJUeFRURTZm?=
 =?utf-8?Q?/YkGZvb/5+a46jKdGPy1CgU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf45d2b-0b08-491d-f7b9-08dc917ef115
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 23:15:57.7732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bR95EVWAM07xnH62xsyA5m1WILMGfc5uydU679sb+jh5++Wn5ga7ZA9g7JZJwZzi2wwfWXYsptC3wa5tmEmbmhlsj5XKbQF2L45V+m8V/9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6168
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

On Thu, Jun 20, 2024 at 01:00:37PM -0700, Ashutosh Dixit wrote:
>Add "oa-formats" subtest.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Some nits to clean up, but otherwise looks good.

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> tests/intel/xe_oa.c | 550 ++++++++++++++++++++++++++++++++++++++++++++
> 1 file changed, 550 insertions(+)
>
>diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>index 97bbd13674..b7de6f7bd2 100644
>--- a/tests/intel/xe_oa.c
>+++ b/tests/intel/xe_oa.c
>@@ -290,6 +290,9 @@ static struct oa_format lnl_oa_formats[XE_OA_FORMAT_MAX] = {
> 		.bc_report = 0 },
> };
>
>+/* No A counters currently reserved/undefined for gen8+ so far */
>+static bool undefined_a_counters[45];

As the comment says, we can drop undefined_a_counters.

>+
> static int drm_fd = -1;
> static int sysfs = -1;
> static int pm_fd = -1;
>@@ -476,6 +479,57 @@ write_u64_file(const char *path, uint64_t val)
> 	fclose(f);
> }
>
>+static uint64_t
>+read_report_ticks(const uint32_t *report, enum intel_xe_oa_format_name format)
>+{
>+
>+	struct oa_format fmt = get_oa_format(format);
>+
>+	return fmt.report_hdr_64bit ? *(uint64_t *)&report[6] : report[3];
>+}
>+
>+/*
>+ * t0 is a value sampled before t1. width is number of bits used to represent
>+ * t0/t1. Normally t1 is greater than t0. In cases where t1 < t0 use this
>+ * helper. Since the size of t1/t0 is already 64 bits, no special handling is
>+ * needed for width = 64.
>+ */
>+static uint64_t
>+elapsed_delta(uint64_t t1, uint64_t t0, uint32_t width)
>+{
>+	uint32_t max_bits = sizeof(t1) * 8;
>+
>+	igt_assert(width <= max_bits);
>+
>+	if (t1 < t0 && width != max_bits)
>+		return ((1ULL << width) - t0) + t1;
>+
>+	return t1 - t0;
>+}
>+
>+static uint64_t
>+oa_tick_delta(const uint32_t *report1,
>+	      const uint32_t *report0,
>+	      enum intel_xe_oa_format_name format)
>+{
>+	return elapsed_delta(read_report_ticks(report1, format),
>+			     read_report_ticks(report0, format), 32);
>+}
>+
>+static void
>+read_report_clock_ratios(const uint32_t *report,
>+			      uint32_t *slice_freq_mhz,
>+			      uint32_t *unslice_freq_mhz)
>+{
>+	uint32_t unslice_freq = report[0] & 0x1ff;
>+	uint32_t slice_freq_low = (report[0] >> 25) & 0x7f;
>+	uint32_t slice_freq_high = (report[0] >> 9) & 0x3;
>+	uint32_t slice_freq = slice_freq_low | (slice_freq_high << 7);
>+
>+	*slice_freq_mhz = (slice_freq * 16666) / 1000;
>+	*unslice_freq_mhz = (unslice_freq * 16666) / 1000;
>+}
>+
> static uint32_t
> report_reason(const uint32_t *report)
> {
>@@ -483,6 +537,27 @@ report_reason(const uint32_t *report)
> 		OAREPORT_REASON_MASK);
> }
>
>+static const char *
>+read_report_reason(const uint32_t *report)
>+{
>+	uint32_t reason = report_reason(report);
>+
>+	if (reason & (1<<0))
>+		return "timer";
>+	else if (reason & (1<<1))
>+	      return "internal trigger 1";
>+	else if (reason & (1<<2))
>+	      return "internal trigger 2";
>+	else if (reason & (1<<3))
>+	      return "context switch";
>+	else if (reason & (1<<4))
>+	      return "GO 1->0 transition (enter RC6)";
>+	else if (reason & (1<<5))
>+		return "[un]slice clock ratio change";
>+	else
>+		return "unknown";
>+}
>+
> static uint64_t
> oa_timestamp(const uint32_t *report, enum intel_xe_oa_format_name format)
> {
>@@ -491,6 +566,17 @@ oa_timestamp(const uint32_t *report, enum intel_xe_oa_format_name format)
> 	return fmt.report_hdr_64bit ? *(uint64_t *)&report[2] : report[1];
> }
>
>+static uint64_t
>+oa_timestamp_delta(const uint32_t *report1,
>+		   const uint32_t *report0,
>+		   enum intel_xe_oa_format_name format)
>+{
>+	uint32_t width = intel_graphics_ver(devid) >= IP_VER(12, 55) ? 56 : 32;
>+
>+	return elapsed_delta(oa_timestamp(report1, format),
>+			     oa_timestamp(report0, format), width);
>+}
>+
> static uint64_t
> timebase_scale(uint64_t delta)
> {
>@@ -527,6 +613,191 @@ oa_report_is_periodic(uint32_t oa_exponent, const uint32_t *report)
> 	return false;
> }
>
>+static uint64_t
>+read_40bit_a_counter(const uint32_t *report,
>+			  enum intel_xe_oa_format_name fmt, int a_id)
>+{
>+	struct oa_format format = get_oa_format(fmt);
>+	uint8_t *a40_high = (((uint8_t *)report) + format.a40_high_off);
>+	uint32_t *a40_low = (uint32_t *)(((uint8_t *)report) +
>+					 format.a40_low_off);
>+	uint64_t high = (uint64_t)(a40_high[a_id]) << 32;
>+
>+	return a40_low[a_id] | high;
>+}
>+
>+static uint64_t
>+xehpsdv_read_64bit_a_counter(const uint32_t *report, enum intel_xe_oa_format_name fmt, int a_id)
>+{
>+	struct oa_format format = get_oa_format(fmt);
>+	uint64_t *a64 = (uint64_t *)(((uint8_t *)report) + format.a64_off);
>+
>+	return a64[a_id];
>+}
>+
>+static uint64_t
>+get_40bit_a_delta(uint64_t value0, uint64_t value1)
>+{
>+	if (value0 > value1)
>+		return (1ULL << 40) + value1 - value0;
>+	else
>+		return value1 - value0;
>+}
>+
>+static void
>+accumulate_uint64(int a_index,
>+		  const uint32_t *report0,
>+		  const uint32_t *report1,
>+		  enum intel_xe_oa_format_name format,
>+		  uint64_t *delta)
>+{
>+	uint64_t value0 = xehpsdv_read_64bit_a_counter(report0, format, a_index),
>+		 value1 = xehpsdv_read_64bit_a_counter(report1, format, a_index);
>+
>+	*delta += (value1 - value0);
>+}
>+
>+/* The TestOa metric set is designed so */
>+static void
>+sanity_check_reports(const uint32_t *oa_report0, const uint32_t *oa_report1,
>+		     enum intel_xe_oa_format_name fmt)
>+{
>+	struct oa_format format = get_oa_format(fmt);
>+	uint64_t time_delta = timebase_scale(oa_timestamp_delta(oa_report1,
>+								oa_report0,
>+								fmt));
>+	uint64_t clock_delta = oa_tick_delta(oa_report1, oa_report0, fmt);
>+	uint64_t max_delta;
>+	uint64_t freq;
>+	uint32_t *rpt0_b = (uint32_t *)(((uint8_t *)oa_report0) +
>+					format.b_off);
>+	uint32_t *rpt1_b = (uint32_t *)(((uint8_t *)oa_report1) +
>+					format.b_off);
>+	uint32_t b;
>+	uint32_t ref;
>+
>+	igt_debug("report type: %s->%s\n",
>+		  read_report_reason(oa_report0),
>+		  read_report_reason(oa_report1));
>+
>+	freq = time_delta ? (clock_delta * 1000) / time_delta : 0;
>+	igt_debug("freq = %"PRIu64"\n", freq);
>+
>+	igt_debug("clock delta = %"PRIu64"\n", clock_delta);
>+
>+	max_delta = clock_delta * intel_xe_perf->devinfo.n_eus;
>+
>+	/* Gen8+ has some 40bit A counters... */
>+	for (int j = format.first_a40; j < format.n_a40 + format.first_a40; j++) {
>+		uint64_t value0 = read_40bit_a_counter(oa_report0, fmt, j);
>+		uint64_t value1 = read_40bit_a_counter(oa_report1, fmt, j);
>+		uint64_t delta = get_40bit_a_delta(value0, value1);
>+
>+		if (undefined_a_counters[j])
>+			continue;
>+
>+		igt_debug("A40_%d: delta = %"PRIu64"\n", j, delta);
>+		igt_assert_f(delta <= max_delta,
>+			     "A40_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
>+			     j, delta, max_delta);
>+	}
>+
>+	for (int j = 0; j < format.n_a64; j++) {
>+		uint64_t delta = 0;
>+
>+		accumulate_uint64(j, oa_report0, oa_report1, fmt, &delta);
>+
>+		if (undefined_a_counters[j])
>+			continue;
>+
>+		igt_debug("A64_%d: delta = %"PRIu64"\n", format.first_a + j, delta);
>+		igt_assert_f(delta <= max_delta,
>+			     "A64_%d: delta = %"PRIu64", max_delta = %"PRIu64"\n",
>+			     format.first_a + j, delta, max_delta);
>+	}
>+
>+	for (int j = 0; j < format.n_a; j++) {
>+		uint32_t *a0 = (uint32_t *)(((uint8_t *)oa_report0) +
>+					    format.a_off);
>+		uint32_t *a1 = (uint32_t *)(((uint8_t *)oa_report1) +
>+					    format.a_off);
>+		int a_id = format.first_a + j;
>+		uint32_t delta = a1[j] - a0[j];
>+
>+		if (undefined_a_counters[a_id])
>+			continue;
>+
>+		igt_debug("A%d: delta = %"PRIu32"\n", a_id, delta);
>+		igt_assert_f(delta <= max_delta,
>+			     "A%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
>+			     a_id, delta, max_delta);
>+	}
>+
>+	/* The TestOa metric set defines all B counters to be a
>+	 * multiple of the gpu clock
>+	 */
>+	if (format.n_b && (format.oa_type == DRM_XE_OA_FMT_TYPE_OAG || format.oa_type == DRM_XE_OA_FMT_TYPE_OAR)) {
>+		if (clock_delta > 0) {
>+			b = rpt1_b[0] - rpt0_b[0];
>+			igt_debug("B0: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, 0);
>+
>+			b = rpt1_b[1] - rpt0_b[1];
>+			igt_debug("B1: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, clock_delta);
>+
>+			b = rpt1_b[2] - rpt0_b[2];
>+			igt_debug("B2: delta = %"PRIu32"\n", b);
>+			igt_assert_eq(b, clock_delta);
>+
>+			b = rpt1_b[3] - rpt0_b[3];
>+			ref = clock_delta / 2;
>+			igt_debug("B3: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[4] - rpt0_b[4];
>+			ref = clock_delta / 3;
>+			igt_debug("B4: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[5] - rpt0_b[5];
>+			ref = clock_delta / 3;
>+			igt_debug("B5: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[6] - rpt0_b[6];
>+			ref = clock_delta / 6;
>+			igt_debug("B6: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+
>+			b = rpt1_b[7] - rpt0_b[7];
>+			ref = clock_delta * 2 / 3;
>+			igt_debug("B7: delta = %"PRIu32"\n", b);
>+			igt_assert(b >= ref - 1 && b <= ref + 1);
>+		} else {
>+			for (int j = 0; j < format.n_b; j++) {
>+				b = rpt1_b[j] - rpt0_b[j];
>+				igt_debug("B%i: delta = %"PRIu32"\n", j, b);
>+				igt_assert_eq(b, 0);
>+			}
>+		}
>+	}
>+
>+	for (int j = 0; j < format.n_c; j++) {
>+		uint32_t *c0 = (uint32_t *)(((uint8_t *)oa_report0) +
>+					    format.c_off);
>+		uint32_t *c1 = (uint32_t *)(((uint8_t *)oa_report1) +
>+					    format.c_off);
>+		uint32_t delta = c1[j] - c0[j];
>+
>+		igt_debug("C%d: delta = %"PRIu32", max_delta=%"PRIu64"\n",
>+			  j, delta, max_delta);
>+		igt_assert_f(delta <= max_delta,
>+			     "C%d: delta = %"PRIu32", max_delta = %"PRIu64"\n",
>+			     j, delta, max_delta);
>+	}
>+}
>+
> static bool
> init_sys_info(void)
> {
>@@ -815,6 +1086,264 @@ read_2_oa_reports(int format_id,
> 	igt_assert(!"reached");
> }
>
>+static void
>+open_and_read_2_oa_reports(int format_id,
>+			   int exponent,
>+			   uint32_t *oa_report0,
>+			   uint32_t *oa_report1,
>+			   bool timer_only,
>+			   const struct drm_xe_engine_class_instance *hwe)
>+{
>+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
>+	uint64_t properties[] = {
>+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
>+
>+		/* Include OA reports in samples */
>+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
>+
>+		/* OA unit configuration */
>+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
>+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(format_id),
>+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
>+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>+
>+	};
>+	struct intel_xe_oa_open_prop param = {
>+		.num_properties = ARRAY_SIZE(properties) / 2,
>+		.properties_ptr = to_user_pointer(properties),
>+	};
>+
>+	stream_fd = __perf_open(drm_fd, &param, false);
>+	set_fd_flags(stream_fd, O_CLOEXEC);
>+
>+	read_2_oa_reports(format_id, exponent,
>+			  oa_report0, oa_report1, timer_only);
>+
>+	__perf_close(stream_fd);
>+}
>+
>+static void
>+print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
>+{
>+	struct oa_format format = get_oa_format(fmt);
>+	uint64_t ts0 = oa_timestamp(oa_report0, fmt);
>+	uint64_t ts1 = oa_timestamp(oa_report1, fmt);
>+
>+	igt_debug("TIMESTAMP: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
>+		  ts0, ts1, ts1 - ts0);
>+
>+	{
>+		uint64_t clock0 = read_report_ticks(oa_report0, fmt);
>+		uint64_t clock1 = read_report_ticks(oa_report1, fmt);
>+
>+		igt_debug("CLOCK: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
>+			  clock0, clock1, clock1 - clock0);
>+	}
>+
>+	{
>+		uint32_t slice_freq0, slice_freq1, unslice_freq0, unslice_freq1;
>+		const char *reason0 = read_report_reason(oa_report0);
>+		const char *reason1 = read_report_reason(oa_report1);
>+
>+		igt_debug("CTX ID: 1st = %"PRIu32", 2nd = %"PRIu32"\n",
>+			  oa_report0[2], oa_report1[2]);
>+
>+		read_report_clock_ratios(oa_report0,
>+					 &slice_freq0, &unslice_freq0);
>+		read_report_clock_ratios(oa_report1,
>+					 &slice_freq1, &unslice_freq1);
>+
>+		igt_debug("SLICE CLK: 1st = %umhz, 2nd = %umhz, delta = %d\n",
>+			  slice_freq0, slice_freq1,
>+			  ((int)slice_freq1 - (int)slice_freq0));
>+		igt_debug("UNSLICE CLK: 1st = %umhz, 2nd = %umhz, delta = %d\n",
>+			  unslice_freq0, unslice_freq1,
>+			  ((int)unslice_freq1 - (int)unslice_freq0));
>+
>+		igt_debug("REASONS: 1st = \"%s\", 2nd = \"%s\"\n", reason0, reason1);
>+	}
>+
>+	/* Gen8+ has some 40bit A counters... */
>+	for (int j = 0; j < format.n_a40; j++) {
>+		uint64_t value0 = read_40bit_a_counter(oa_report0, fmt, j);
>+		uint64_t value1 = read_40bit_a_counter(oa_report1, fmt, j);
>+		uint64_t delta = get_40bit_a_delta(value0, value1);
>+
>+		if (undefined_a_counters[j])
>+			continue;
>+
>+		igt_debug("A%d: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
>+			  j, value0, value1, delta);
>+	}
>+
>+	for (int j = 0; j < format.n_a64; j++) {
>+		uint64_t value0 = xehpsdv_read_64bit_a_counter(oa_report0, fmt, j);
>+		uint64_t value1 = xehpsdv_read_64bit_a_counter(oa_report1, fmt, j);
>+		uint64_t delta = value1 - value0;
>+
>+		if (undefined_a_counters[j])
>+			continue;
>+
>+		igt_debug("A_64%d: 1st = %"PRIu64", 2nd = %"PRIu64", delta = %"PRIu64"\n",
>+			  format.first_a + j, value0, value1, delta);
>+	}
>+
>+	for (int j = 0; j < format.n_a; j++) {
>+		uint32_t *a0 = (uint32_t *)(((uint8_t *)oa_report0) +
>+					    format.a_off);
>+		uint32_t *a1 = (uint32_t *)(((uint8_t *)oa_report1) +
>+					    format.a_off);
>+		int a_id = format.first_a + j;
>+		uint32_t delta = a1[j] - a0[j];
>+
>+		if (undefined_a_counters[a_id])
>+			continue;
>+
>+		igt_debug("A%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
>+			  a_id, a0[j], a1[j], delta);
>+	}
>+
>+	for (int j = 0; j < format.n_b; j++) {
>+		uint32_t *b0 = (uint32_t *)(((uint8_t *)oa_report0) +
>+					    format.b_off);
>+		uint32_t *b1 = (uint32_t *)(((uint8_t *)oa_report1) +
>+					    format.b_off);
>+		uint32_t delta = b1[j] - b0[j];
>+
>+		igt_debug("B%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
>+			  j, b0[j], b1[j], delta);
>+	}
>+
>+	for (int j = 0; j < format.n_c; j++) {
>+		uint32_t *c0 = (uint32_t *)(((uint8_t *)oa_report0) +
>+					    format.c_off);
>+		uint32_t *c1 = (uint32_t *)(((uint8_t *)oa_report1) +
>+					    format.c_off);
>+		uint32_t delta = c1[j] - c0[j];
>+
>+		igt_debug("C%d: 1st = %"PRIu32", 2nd = %"PRIu32", delta = %"PRIu32"\n",
>+			  j, c0[j], c1[j], delta);
>+	}
>+}
>+
>+/* Debug function, only useful when reports don't make sense. */
>+#if 0

Let's get rid of this #if 0 block as well.

>+static void
>+print_report(uint32_t *report, int fmt)
>+{
>+	struct oa_format format = get_oa_format(fmt);
>+
>+	igt_debug("TIMESTAMP: %"PRIu64"\n", oa_timestamp(report, fmt));
>+
>+	{
>+		uint64_t clock = read_report_ticks(report, fmt);
>+
>+		igt_debug("CLOCK: %"PRIu64"\n", clock);
>+	}
>+
>+	{
>+		uint32_t slice_freq, unslice_freq;
>+		const char *reason = read_report_reason(report);
>+
>+		read_report_clock_ratios(report, &slice_freq, &unslice_freq);
>+
>+		igt_debug("SLICE CLK: %umhz\n", slice_freq);
>+		igt_debug("UNSLICE CLK: %umhz\n", unslice_freq);
>+		igt_debug("REASON: \"%s\"\n", reason);
>+		igt_debug("CTX ID: %"PRIu32"/%"PRIx32"\n", report[2], report[2]);
>+	}
>+
>+	/* Gen8+ has some 40bit A counters... */
>+	for (int j = 0; j < format.n_a40; j++) {
>+		uint64_t value = read_40bit_a_counter(report, fmt, j);
>+
>+		if (undefined_a_counters[j])
>+			continue;
>+
>+		igt_debug("A%d: %"PRIu64"\n", j, value);
>+	}
>+
>+	for (int j = 0; j < format.n_a; j++) {
>+		uint32_t *a = (uint32_t *)(((uint8_t *)report) +
>+					   format.a_off);
>+		int a_id = format.first_a + j;
>+
>+		if (undefined_a_counters[a_id])
>+			continue;
>+
>+		igt_debug("A%d: %"PRIu32"\n", a_id, a[j]);
>+	}
>+
>+	for (int j = 0; j < format.n_b; j++) {
>+		uint32_t *b = (uint32_t *)(((uint8_t *)report) +
>+					   format.b_off);
>+
>+		igt_debug("B%d: %"PRIu32"\n", j, b[j]);
>+	}
>+
>+	for (int j = 0; j < format.n_c; j++) {
>+		uint32_t *c = (uint32_t *)(((uint8_t *)report) +
>+					   format.c_off);
>+
>+		igt_debug("C%d: %"PRIu32"\n", j, c[j]);
>+	}
>+}
>+#endif
>+
>+static bool
>+hwe_supports_oa_type(int oa_type, const struct drm_xe_engine_class_instance *hwe)
>+{
>+	switch (oa_type) {
>+	case DRM_XE_OA_FMT_TYPE_OAM:
>+	case DRM_XE_OA_FMT_TYPE_OAM_MPEC:
>+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_DECODE ||
>+		       hwe->engine_class == DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE;
>+	case DRM_XE_OA_FMT_TYPE_OAG:
>+	case DRM_XE_OA_FMT_TYPE_OAR:
>+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER;
>+	case DRM_XE_OA_FMT_TYPE_OAC:
>+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
>+	case DRM_XE_OA_FMT_TYPE_PEC:
>+		return hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER ||
>+		       hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE;
>+	default:
>+		return false;
>+	}
>+
>+}
>+
>+/**
>+ * SUBTEST: oa-formats
>+ * Description: Test that supported OA formats work as expected
>+ */
>+static void test_oa_formats(const struct drm_xe_engine_class_instance *hwe)
>+{
>+	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
>+		struct oa_format format = get_oa_format(i);
>+		uint32_t oa_report0[format.size / 4];
>+		uint32_t oa_report1[format.size / 4];
>+
>+		if (!format.name) /* sparse, indexed by ID */
>+			continue;
>+
>+		if (!hwe_supports_oa_type(format.oa_type, hwe))
>+			continue;
>+
>+		igt_debug("Checking OA format %s\n", format.name);
>+
>+		open_and_read_2_oa_reports(i,
>+					   oa_exp_1_millisec,
>+					   oa_report0,
>+					   oa_report1,
>+					   false, /* timer reports only */
>+					   hwe);
>+
>+		print_reports(oa_report0, oa_report1, i);
>+		sanity_check_reports(oa_report0, oa_report1, i);
>+	}
>+}
>+
>+
> static unsigned read_xe_module_ref(void)
> {
> 	FILE *fp = fopen("/proc/modules", "r");
>@@ -931,8 +1460,25 @@ test_sysctl_defaults(void)
> 	igt_assert_eq(paranoid, 1);
> }
>
>+#define __for_one_render_engine_0(hwe) \
>+	xe_for_each_engine(drm_fd, hwe) \
>+		if (hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
>+			break; \
>+	for_each_if(hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER) \
>+		igt_dynamic_f("rcs-%d", hwe->engine_instance)
>+
>+#define __for_one_render_engine(hwe)	      \
>+	for (int m = 0, done = 0; !done; m++) \
>+		for_each_if(m < xe_number_engines(drm_fd) && \
>+			    (hwe = &xe_engine(drm_fd, m)->instance) && \
>+			    hwe->engine_class == DRM_XE_ENGINE_CLASS_RENDER && \
>+			    (done = 1)) \
>+			igt_dynamic_f("rcs-%d", hwe->engine_instance)
>+
> igt_main
> {
>+	struct drm_xe_engine_class_instance *hwe = NULL;
>+
> 	igt_fixture {
> 		struct stat sb;
>
>@@ -983,6 +1529,10 @@ igt_main
> 	igt_subtest("missing-sample-flags")
> 		test_missing_sample_flags();
>
>+	igt_subtest_with_dynamic("oa-formats")
>+		__for_one_render_engine(hwe)
>+			test_oa_formats(hwe);
>+
> 	igt_fixture {
> 		/* leave sysctl options in their default state... */
> 		write_u64_file("/proc/sys/dev/xe/perf_stream_paranoid", 1);
>-- 
>2.41.0
>
