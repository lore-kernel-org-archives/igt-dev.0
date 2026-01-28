Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F3ED35691
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 08:38:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B20510E27B;
	Wed, 28 Jan 2026 08:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAqiS8Py";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5088610E27B;
 Wed, 28 Jan 2026 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769589510; x=1801125510;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=LaB8MLsNGancrKcuS2/+ZLJeBSXNUQMC44OJzWRttnY=;
 b=MAqiS8PysGNQzxgAv8SH6NzvvuyGxBEovCLdVFThr/fjIGROyFcdg/hq
 gWzbXTVm1mUYcpw2zBx1L+6n4oD5xQ4jHmbUl36mnUtNIYR8t8Ux11fQg
 8HxSWLO716mYn7MIxhKRGvIV1khQLaTT+ApR1eG+n2v8QmdPaAmVfr33i
 B/svYayytCrmRTZA8+v+9QtnrqiELCDsHjsJpaSVwMdzaFAv904zIfxUZ
 w2KG5mM+8DXLBp9/MViSfbLUt4QkEDTDjGCPtA09/O5lPZTL0jsrMQNLc
 9DbluYFxdPBUeQnjZV4CFScYyyNW4GYZ+Wcr/5SZzwoVFid3YtIxJf6wh g==;
X-CSE-ConnectionGUID: Xxvk/kQhT1yqujVKuOQ7Pg==
X-CSE-MsgGUID: YxRY7lvzTIaCmSefMZxF9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81519545"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="81519545"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:38:30 -0800
X-CSE-ConnectionGUID: +9YROUFfQi+s8GMSziTeOw==
X-CSE-MsgGUID: Y4w/7vC9QziyJKyTU075aA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 00:38:29 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 00:38:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 00:38:28 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.38) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 00:38:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVCrzT0hA2NL3e2qxwCVThAvatNcgTv7yVWEeTwsA090O6BCveNU4Q1iKquYU/63bjpw027vh7v44sCiVebO5Fi0TjsYWsn+rInkNIvUU/LrQeZu0GFKmjfIIyHxoa2k6+E+XJMPUmYXDLc8aJ2vn4yI+nV8E8m1aQXk5Zl1sSYLMR8KmKKu34sbIyx4Esa0HoFXhePxdqVRKSLPnVv4YUrrWncuWZLpJGv56zfbFd/uzKTR1CllkLik0T7I5g8tPhgcvxYFNu8+TYaAHsimbYeK0WXP8XXZN0nOTofUuwg4NXdjDsRzRWmKNS5JJ/uh4kn6mTKG37tRYdMIAZioBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eekxsk+Fvdz1Ijjp3U2GR6JkuWqzuMqhpLNU11zQo/E=;
 b=tg9k8bzeTlcoAyvRAC6XREvPmNe+dJU+Io6GkKq59YSQrnEAlOHwMZ47oyBnoWvTaR99TEON5mGB7We3TyYlYj1lYA5qHGc+uv4sPDXwSujtpz18yeB1rzMZQa5Qo0qeWGr9Goav0wlHGPPsJLCD4goDDytQlpUbA/N9FUWQFysg/xR35Qn667CRxHnh75AumMujy4yNrdTrhPRDMoa4X1xX40+mCsyi2Ytf6lzkVt6iUyrWUc8DY/rCEFRet2d+jHD672HpScVNYutprXfHrfHNfD1iGLTqJwx7bKIUyOnYoZ97tqz7nE8DxpSE93KxQvAscR3evnxwv7n/nHLkHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS0PR11MB6495.namprd11.prod.outlook.com (2603:10b6:8:c1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 08:38:26 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 08:38:26 +0000
Message-ID: <6d1cb69a-be1f-4ff2-b8fc-a6bac4c320b3@intel.com>
Date: Wed, 28 Jan 2026 14:08:19 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?/kms=5Fjoiner=3A_Fix_var_usage?=
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <I915-ci-infra@lists.freedesktop.org>
References: <20260127164018.63157-1-kamil.konieczny@linux.intel.com>
 <176955857176.197950.802660982423343943@a3b018990fe9>
 <20260128082246.pxymodug3rxfkach@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260128082246.pxymodug3rxfkach@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0142.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::17) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS0PR11MB6495:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4f1c52-416c-4df8-ae89-08de5e489ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|42112799006|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHNUbGNHN0hzVUtaaUJ6QkUzcG9CUTNQUDd4STBlVVcrei9OT1pPSVpIK0F5?=
 =?utf-8?B?OXJ1aXdKNElTaDdUWW5JcjRLS3V4OFpicjFKUzZwOC9VS0l6YWxlcUFxMmNi?=
 =?utf-8?B?RkF3WjR6am11WlN1dm92cHhScndzeTJoa0lCWmxSWFFXRUhwYWdtS3laVWhC?=
 =?utf-8?B?ZWNMcVRsVWp3Ym12MFFxMi92MEFpYXk1Ym5ka3dLNUlIR1JiWnV0a0x4enhN?=
 =?utf-8?B?Vi92U25kMVd2SHpZNnpUcHp2RVJiUzUxUlR6M1c0S05PNHJBRnFzZWpJOXZx?=
 =?utf-8?B?RmxyNWVKak9tS05ya1hSL2gwSGE4ZTM0T01YRjZ1NUhaemVrZjNwZEp0aU12?=
 =?utf-8?B?WWxUdmhCZWx0NmlOZzN0M3RDQ0ZTUGRFRUpybTN2Ry9PN3J6SGV5VWxFNjlO?=
 =?utf-8?B?eDJweXE2UndPdDdqODk2aTdjR0lUbWVCajMyL0oyWVFUYm1xV2xqWW9qYUJq?=
 =?utf-8?B?cFUxQ3BGNlhQWGRxNGtQY1ZkL3FGNVRMZlQzUmdUR29WRlZlZXN0K01hRkRY?=
 =?utf-8?B?bkdXZFNGZjNQdmsvbWhvcWZCSFFTSEV6dWZWdW5EZ1FpSUk1T0l2TGxZbjVr?=
 =?utf-8?B?R1VvTFpKTVBBZ1E0S2NWQ3ZTTFZGckhrQzY2SmRIajVDTFpUYjY2SUhMemlE?=
 =?utf-8?B?R0p3c1FNWnNCd3hGQ1g4cnUxUHBqMG8zUjB1S3Z0eVJtZHpuaDNSM3dzckpy?=
 =?utf-8?B?Zkt5NzVQd281dEZnR1o4Y1RXU1ZueVVOQTJTV3ZQME04TFYyS2drWThtVjFF?=
 =?utf-8?B?ckFCWTd1elJNV0sxMHFuMUpBcVVwcHoybzlEL3F2cEl3R2dkL1ZyblQ5cnlR?=
 =?utf-8?B?RldJQnZUbThzMDd2Zk4rOFEyMlg1RUdCbXNNZTBMRCsyYnFzcGFwMlh3cFBF?=
 =?utf-8?B?TjVoT2tDQm9SQkdxMVh0R3JrUThGcjlseEo5a2UrOE1RVWJaSVU3OEdoOWtY?=
 =?utf-8?B?eXVBYU0xd25xZG5CRldES1U2c2Ftb0UxRWMxL0NtYUFDbXovSksxK0VjZm5N?=
 =?utf-8?B?MStmR0tVRTRPenNuMzJVSVNUUXgwSzZlYW9uSXM5Uk1kQ0h2NUVIMXF1Qll6?=
 =?utf-8?B?UzBMOGVDUTZFUy9GRDdkRlNoa2diTXE1bXo2YmlPRGxkbks4YThxQkgzdEJM?=
 =?utf-8?B?bkd1VnZ4UzZrSWV6akZFU0diTjR2akg2OTBnRC83TjRneDdEMlRQWEVtYVJ5?=
 =?utf-8?B?UjFzdkdnaUx5c0F1RUJMRW02OFVxMWRVQmRGQ2ZvbVZEZWhnNEFTZWZqMkJC?=
 =?utf-8?B?bXVLaWlGdml0eERUM21jbldtWk9Fc0NqbnZEdGhVdDJKWCtwMEJiVytyMkxE?=
 =?utf-8?B?eXN1d0hndlJQVHd3eXk5cXlSRzdNWGY2WmpQdC9MQzY3VnNFYWNSMXN6OVNw?=
 =?utf-8?B?WUFDNG9TYjhQSktzYTAxQUIxanBsUEYvKzVUdk1aY0Z4ZCtuUnN1Zno4NUZG?=
 =?utf-8?B?U3IwczFGZ0xNTFk5MWJRbTNCT2ExUVo0NWZuTmlXWjlqR3gyVytoMHRzNmcz?=
 =?utf-8?B?M3grdVBjZ3prRTQvYjNhYlI1MUR2b3d0cXVTNTFwVXBJbU1KMENNTU9RQWps?=
 =?utf-8?B?REtlenp3MFp5cWk5UFVjMlNiOUlodWt0b09PSXIzT0p5aGFYV2xqSzZzQ3V2?=
 =?utf-8?B?Z1ZtUHNseHg5MEo2Y0RWb3R6L3RqL3BoS0lCZ2FhME1tUUJobi9DZnJ3d1dU?=
 =?utf-8?B?bzVFYXBqNFgrWDh4QWYwNk16VXlETjdlTlpBVUFIVWxOWGVWQ0h5bUZTa216?=
 =?utf-8?B?Y1NseVJJRHZyU2w3djB3K3lvWU56dEZMd2NMbytSMTNqbERISUlsQ3BxYmVy?=
 =?utf-8?B?RXprTXlXc01kUDl0V0d1b09nWHRQZnNsRWpHbkxVSmRqVmRZdmR6OXdwMzV5?=
 =?utf-8?B?Q2QrRVFZdWxLbGN3TTZBS0Q2WG8rT1lMOUhUSEZ3RXpIa2psajEzd0ZxSjZS?=
 =?utf-8?B?WENJTWpzOUlKbDFzZkNmOG40ZnRwQlZoOHpLVndVSitKdU9KUlh0d01QLzV2?=
 =?utf-8?B?OG5aenVIK3lTWGo5S0QrRGg4dFF3UHlIdFQzaEFYR0lkaStOYmI3SWpSYjFx?=
 =?utf-8?Q?7ydoge?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(42112799006)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qk1ITGF6bkNyQ3I4WVg2cDl0UGNLT0NQVkZPK1l2NzhKRG5URHAvUWdHMkdh?=
 =?utf-8?B?aU9zNlY2RjVjUWZjejJIbk5DQ29CaXNkZW1rWFpDbzMxR1lGcTF0aFBSRVda?=
 =?utf-8?B?WW8wVTAwWTlMQWt5WGRuSGkzWVl0VlJRcGduSkZLQXU2bXR4S0xuS0VqU3Ux?=
 =?utf-8?B?V0c5dkRLVFZJSDFPa05NM0NzZ1dEaGo2RCtPZEZuRFZaWk9YWDd3MHdENFdX?=
 =?utf-8?B?ci82WUphNzBKYXFjNjc3b0lUYmZaVENrYlpYUyt4NEFDU3lmM1R3QnMzV2k0?=
 =?utf-8?B?cStwTDBXZXpZemdOMGkwcXNFelpWOHlkTG5ROVczSDNUN2dreFlhVnYzSnVl?=
 =?utf-8?B?c0IzQVQxQytzTkIwVml6Y2RzUWlRZCs5LzhaRXhWbWltSzgyYURqNnJKYlY4?=
 =?utf-8?B?aElJYitEUk0waVo2ZXQ5ZTdubndrTU45Y1B6d01PVGk5UUtneXNiYzJNR1R5?=
 =?utf-8?B?NTI5akJwVTZMaFB1cHgyKzZKT25lR0h6WmJEMEhJZmxYNGFtUWtpbnA1cS8x?=
 =?utf-8?B?NGpUdE93aXNVRlRVZ2Z2dk92bWFJYU9Ed2dlQVFuZm1tNHVHcDdsUncrSlB3?=
 =?utf-8?B?cTc2ZERHRUV2cWhucEFKRVJNRVhQVGtkemY3ZlQ4TDJqNDJRc2RGUFNkdjE2?=
 =?utf-8?B?YU16dmNKQTBuVXExcHpkTldxTlQ1NU1YSkkyV3hlMzNaV0F6WXhlNWhUODBQ?=
 =?utf-8?B?cnY3UHF6OVc1cnZaeEpVcldGQ0NYRW9Mc3plSkxBYXlCbXVHc0hvWDNLSzBP?=
 =?utf-8?B?R0Z2aVR3cmhvVGZxZk1SRzhVTjhvRzMrTnB4Y0Q2a1dQcmhnODdYMEorQzlh?=
 =?utf-8?B?azYxNWM0bkxhODhBSFA0ejJSbjhCRDdYU2pDd0xQcHA2bFJ3ZXBlMDJYbnZ0?=
 =?utf-8?B?Wk4vMitLUjlydGtXVElsc2Fmak9xMDR3dG5MYU8xQ3RnSDNBZjBadFJieTV4?=
 =?utf-8?B?bmlUTjBLSGUrZlArN291czhQcTlzOFdhZlFHdmZaZm9FbEE5T2lBUmtMVE1I?=
 =?utf-8?B?aHlXS1BzamgrbnFZVG8xRlVBU3Z4RDhLNThkemRTVE40MTNHMmg5OEdudUc1?=
 =?utf-8?B?R0NIblgzZjJudFlGZjNrUzZKUGtJVVU1WThuVU9oVVdyYmdpTzNRVi9zSDIr?=
 =?utf-8?B?QThzQ2libXFFVXdXUHJtaVZnL2NnT08vOTZFMlBFQmwvbjVsb1hRSjdIZFlC?=
 =?utf-8?B?SEd5K3NheDJTK3dqNitCWU9INVB0ZWVobW9MM0R1QXcvQndTekhJYnYvOXNB?=
 =?utf-8?B?cVFCMzRzZjcrWDVGMGM3bGh1c1Nvd3BVL1cxb3BRc2wwRjVkNTZsVktubmMy?=
 =?utf-8?B?VkZxc0N6blE4WktPcC9ENjlzZkFPbnNIdkdabVhFbG4rdFBnUzM4amhOdnVB?=
 =?utf-8?B?aldSRHZiYmphemw3ZTBCaVhmUU91aVFleHRrY0hzcllEc3I0cTBNRGxCMFdB?=
 =?utf-8?B?NGtnNXdmc1I4M1VqNnU0bXRVMnlseGlQbVBkNWxvQjNsSkNqQ2xlREYyazVO?=
 =?utf-8?B?RFRobWtDL0txWDlsUkdaOENRRnNDci8zQlZiNU8yRlRJWWFYeEhuWHdQemM5?=
 =?utf-8?B?YUlWbXBoWDBOZVpGNU9vOTdPQkRGMWhHdzRSMGF2cTZ1ZTJiZUF1czhSQ2pr?=
 =?utf-8?B?b0dGRm5BcG9QcGZHc3BCdy9HTFQ2NDlGdVUwcnJwdVQ5WjI0UVJCQmhDRTk0?=
 =?utf-8?B?NDB1NGl2ZmMvUnVIQ3EzWnI2M3hEVG9QN2lPRWhvQTJDVnhRZEczenhxVWVa?=
 =?utf-8?B?T1lDbmVlak9xVk1TbHZQeWtqMDRTd0x5SitEUVUwTG5hdi85ZU9sVWhvay9O?=
 =?utf-8?B?cTZDUGl0dm5Nc09oM2pLNjVsR1RCbHZFSnpWTk13enhjeW9FckVhZGZaRnlF?=
 =?utf-8?B?bGM1cDBVakpGbkpBOGxzTk1ueS9oUmd5TUJnc3VDbDRiVDNtZXhZRU15YzJk?=
 =?utf-8?B?dkZ6c2V4S3FMRDhXYUNsc1NESlAzRWRMNUZia2QxdFZDd2RmRktVRmplMmhm?=
 =?utf-8?B?MTgyMjZCK0pVQUlPUXc4K1lPYUlvUTVjYUIwNTFsakJycWg2L3hCUjYxaWpE?=
 =?utf-8?B?dHl4WEVOWjE4eVBadHZuQUx5QXBlY0pnNi81bTRYcGFtbmdtdXFUMTBiZzB4?=
 =?utf-8?B?c2RXYzQvaHQxV0RzSE0xM0VGR2tLcC9QMnhvWlBnYWRRQ20rUjZVRFBYdWQx?=
 =?utf-8?B?UXdTQzVGelJEWitWYXQ0dG0wV2NhdHBRelY1ckhvU2E5UzBSNlZLdVVDME00?=
 =?utf-8?B?WUV1SjNVam5qaHBadlk3c0duSGFWemRpenZ1dlVOQWRzNUEwMjBXMi9zZXlL?=
 =?utf-8?B?ZXRXTzE0RHRGM1BBWUFsc29pd2NXWW01NlIyUVFOK3JsaDRrZWgvUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4f1c52-416c-4df8-ae89-08de5e489ab6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:38:26.3924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w3PpLLkMkZa3/IokjefE3TQNMN9zkZjXlIb4JVmVA+hqM2bRWmIu6vfffEhBRA2/CE1VWHF1AYs/eNKDa1pNRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6495
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

Hi Kamil,

On 1/28/2026 1:52 PM, Kamil Konieczny wrote:
> Hi igt-dev,
> On 2026-01-28 at 00:02:51 -0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: tests/intel/kms_joiner: Fix var usage
>> URL   : https://patchwork.freedesktop.org/series/160713/
>> State : failure
>>
>> == Summary ==
>>
>> CI Bug Log - changes from XEIGT_8720_FULL -> XEIGTPW_14429_FULL
>> ====================================================
>>
>> Summary
>> -------
>>
>>    **FAILURE**
>>
>>    Serious unknown changes coming with XEIGTPW_14429_FULL absolutely need to be
>>    verified manually.
>>    
>>    If you think the reported changes have nothing to do with the changes
>>    introduced in XEIGTPW_14429_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>>    to document this new failure mode, which will reduce false positives in CI.
>>
>>    
>>
>> Participating hosts (2 -> 2)
>> ------------------------------
>>
>>    No changes in participating hosts
>>
>> Possible new issues
>> -------------------
>>
>>    Here are the unknown changes that may have been introduced in XEIGTPW_14429_FULL:
>>
>> ### IGT changes ###
>>
>> #### Possible regressions ####
>>
>>    * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
>>      - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
>>     [1]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
>>     [2]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
>>
>>    * igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise:
>>      - shard-bmg:          [PASS][3] -> [ABORT][4]
>>     [3]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html
>>     [4]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-stride-mmap-remap-madvise.html
>>
> These are unrelated.
>
>>    
>> #### Warnings ####
>>
>>    * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
>>      - shard-lnl:          [SKIP][5] ([Intel XE#2925]) -> [SKIP][6]
>>     [5]: https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8720/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>>     [6]: https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14429/shard-lnl-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
>>
> This seems consistent but I cannot comment that,
> Karthik please look into this and comment.

This is showing warning just because the skip signature changed, so we 
should be fine to go ahead with merging.

Regards,
Karthik.B.S
>
> Regards,
> Kamil
>
>>    
>> Known issues
>> ------------
>>
>>    Here are the changes found in XEIGTPW_14429_FULL that come from known issues:
>>
>> ### IGT changes ###
>>
>> #### Issues hit ####
>>
> ...cut...
