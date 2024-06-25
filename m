Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08088C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 14:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD57110E65B;
	Tue, 25 Jun 2024 14:09:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MKnFWGDz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9397D10E65B
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 14:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719324549; x=1750860549;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=2j3AUJxM2vE1rCxgemjHJ8zm+jyQaQ3QmOROQJ1y3vk=;
 b=MKnFWGDzUOd9AO2AOOuMuMvGbb3OecaRy8MYnWm3+wa67dJaDooe4WwW
 jQY9wDuEWJ3Ek7Gj+T+03E5R8hrtg5bO7FwE7mXorlPcihqXdnGgExwdW
 TC+gYaXmHtDpp2kYmnlJ4fp0SbQ44yzooLwlqnWdh2ZZJ3igD25e1jaVu
 ivi1huQtmrJq7dmFZ5Hddup++Uw8ilsE8QiDIiVZ4fn7IjBZIHpriOLKy
 8QMtaMCapR3tP9D0QLPonxMD32UmQUejdHjZW7mk+BzKAtTMAtDksFEWM
 xKAUZYOnXdfdNL0YF4vkDVe2cS40+o8a6gUl/RmyefVVreadbAqmbhQlb A==;
X-CSE-ConnectionGUID: oZNsYvglTouo0T+6Q/hz3g==
X-CSE-MsgGUID: Npn/855CROGJhRHeLIUf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="27750950"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="27750950"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 07:09:09 -0700
X-CSE-ConnectionGUID: s6f5mjY6Tom/vxaxDVwpyw==
X-CSE-MsgGUID: ++pzDvCcSiCEmpmRiWHNpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="74424027"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 07:09:10 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 07:09:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 07:09:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 07:09:08 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 07:09:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBWb2EoGUSD69h8sHHG+RnA7vQYsjSB4cyFQC29V8Fjn7pn3MhLMlLJLIMbothofeBIfa0Qb0G3ATOqvpK4FZrHHRZWxNp5ECBI0mN3JikDJaYoTMj1tYZl4+aKnrCuuSobq4fERfZd82/sCkUQVC7yWLfq+0UGsNIsiPEsaC4989+ZR5wZ6+HvK5u/mHVMMAFWWSrgqxM7d5Iu8AU2JRUicXLUQVnvDMSESlyTdEhvKVugDVaQ0q+/X7H0UAmzL46D3w1wZSF2HTIDDsTW+oIwidd5beoWzygM1ihyB3JdQilqH4p7El3rBhOpP9oYdoTGqu1ef/ETzB6yCTuzR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOpVkVRdRO8iLjs7UKnhMaFyNTh4BEgXOsRsYwA+z9M=;
 b=NqRn+9k4xkNpTRWx/D82fixuilqA4mYph/QjJ04908V4fVPRCZ34DJ4K+7W6mli0lBuj9NJ5IMPG+nMqVPA+INYKib/b2reoksW8b+++Dy+yNnMug2NSo4SeXV6kvlFz5dTNkgFNFNqC4Ri5uYDl7Tq2icboDh2E3Klzj6eVu6XKkNXK0ieSlCNgYytwWhB34deL1XCFsvaJTFnlNaXbyWRmLKpDWgXqUcp9pPj6mHMa5cC1WTAZB5jS3q6mC/mPFgBn4s0KLLuUSYr8kfg8DgfCY5U622+hZJAkXN+isL3AgVRQxJyhOk97qIcG0OJiw16vhzQLFBKU/4Z9JsxSlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ2PR11MB8471.namprd11.prod.outlook.com (2603:10b6:a03:578::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.30; Tue, 25 Jun 2024 14:08:08 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 14:08:08 +0000
Message-ID: <5a4d355c-37ba-4ac0-b2b4-e28dc801c7ee@intel.com>
Date: Tue, 25 Jun 2024 19:37:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/chamelium/kms_chamelium_color: plug ports
 before starting the test
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>,
 <markyacoub@chromium.org>
References: <20240625140605.1420518-1-kunal1.joshi@intel.com>
 <20240625140605.1420518-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240625140605.1420518-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ2PR11MB8471:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce8ebb6-f28b-45e8-2783-08dc95203d6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0RwcnFqa2R1bFlIQmFJaU04RE5XYlN0T0ZzRW9IZTV3UlN4N01BRkJmY05h?=
 =?utf-8?B?S2V6b2FxT0NCcTA0VE95S0I0cWhmbGtMbFBDNFROdUorTGgza3dnOUJSWTZI?=
 =?utf-8?B?bmt6MGRER3h5UjhLOW5YY2Y3aVBnb25MYi9JSzF3cTZOMHJQcXdwQlN1VE9a?=
 =?utf-8?B?WXEraW1GMXdpVmJGbWpuYnJSdTBzTXdTKzZ6cGlieEdObHhvRk96Ym9uZzJk?=
 =?utf-8?B?Y3dKQ21HVDR1MmlyTVJqL0trckNQUmZmdVI1MFpTeGxsZ2NpVzZodHAxZzQw?=
 =?utf-8?B?VCtOYS9RZmpIdGZlMTIzY0pvY005Vk45Umo2QmdHaHo5djlpVENtL0x5ZURZ?=
 =?utf-8?B?VzBzRlZWaGdZY1ZRbHlVN3VZWXRFMWJEeGhKZlV3K3lUTVg1VXl1NzhNV2tj?=
 =?utf-8?B?cnQ2NjYwOUJBSUluQnppVk1jRjNtTm81V1RTdmo5WDU2dEltWkV2QzgyV1dI?=
 =?utf-8?B?OFJpcW12NzBVVHR3ZDdKU1p1S29yREJ5SGlVakxTM1ZCbEpiQzhPdWp3cVZO?=
 =?utf-8?B?RDhNdUV2VStza2JTZHc0N1Jqb1pySzJ4dnUzcmV6UmVKODc3K1NQcU1tWmhX?=
 =?utf-8?B?cEh5eGo0QUFna0RwcEZqdithTDJ5RkQrKzUzQ2MzYk9mQTJhUTJkZWJsb0dh?=
 =?utf-8?B?Smw4SkhuQW5WcjZzMDRxZkJqdXNUVmRFcUNZS09ySHlHWVA1YVlPM3hIeDlr?=
 =?utf-8?B?dWxDSmZnNUdYb1h5RDBZODJsQi83SmIwSCtzR2cwYTJBZ3FtT20yWnUvRSsr?=
 =?utf-8?B?MFdsZlQrci9oRWZsRTZDc1BLcXZoSlljVi9aMythYmlYQXI5WVZXSDJoQ3RW?=
 =?utf-8?B?Qmw4bmhkWG9BcVJSUll3eDQwcXNvNE9DYXAvSGpYK08wVjcycVRwOHlKdlV2?=
 =?utf-8?B?Q1B2akNZckZVcy9IUktCZUtRZ1RsbEpBUlorSlJVb2NEQkJQQjFOK3ZrNWVM?=
 =?utf-8?B?ejF2SnozVEpOWVp6SWlwcXhvb1AxSXlEbDQyUG42eVhBVkk0NUtaM1drVFJV?=
 =?utf-8?B?dUZrWXJ3RkxsZzJ4d1MyTDlpanc4aFp2WVdhd2pOTy9sdytBTlh4YW9DT3po?=
 =?utf-8?B?cVhYWWl3UGp5RzRqVTRtK25oMVk4djhzNzRibTI2dndaTFU5dzNCa0kxVDgx?=
 =?utf-8?B?WHNxdW9CSVZ1cm5GYjJPS0JWUUhQaVlkSEFQOUY0aGl3cThDOFFMa3hNT1BJ?=
 =?utf-8?B?TXdpU1hCMERwVDZSNzkxaTd6T1kybHV2SG1BSU0rbXVhSmIwMTlRSWZhUzVK?=
 =?utf-8?B?UWpEVGRsOXdsZUYwcVZKRUpVOUYyemVrdkNmeVNIOERTYVUvSk9LRVdFK1Vj?=
 =?utf-8?B?USsrL0tRa0V6ZmticWR3cVM3Z3RBVmlmVExGSjJ0ME9seVhsZ2xtWkFuTG15?=
 =?utf-8?B?Rk56YkJjN05qZGs4QWp1N0hqdFZndkJDWUc4WjMveG1wRGhNN3AvQkNyL1gv?=
 =?utf-8?B?cWRCY3ZlaG9USnNjNU1idGRKZlZ3My9rWnFVV3BGL3gvaWsrQlNEVGJVQk1k?=
 =?utf-8?B?REFjZUJiUW9rSTZ3N3NaUWlYdnpaaUlXaXlHKzZLK1ZUdndkbDBuZkN4NnFX?=
 =?utf-8?B?UU1za0psTmhxZFdBYXM2VGRBZVhHK1l0a05IUEVnOEh4MFNObzczdlNQOVph?=
 =?utf-8?B?bjBiZUNFczBiWnhvYjFRdWZZWmRlWXQrUDJaeEtkWVB5S2pHUytvM0N1MzVS?=
 =?utf-8?B?RUlFU1VnRDNyS3BtcUo0bGZVR3M5ckx6ODZ5TVZOd2poVDNkbXRGdGxaaE53?=
 =?utf-8?Q?wJ83EmLUTsgJIZpjcUVgorC3toE1nPf1x0LaSC1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZRUlhZNlJjRDdrK3NEQjNPRmJQdnR2RWJlMVhFK0doZEg5WnZUS2VDTkVi?=
 =?utf-8?B?dFV6UWtxSkpEVmtvQ3dkLzdNSmRkd2djVlJMWThYcU1VWFdQc2dWZ2FlblpW?=
 =?utf-8?B?dTJaTC9lRTFaU1lpNnBaYStxakZwNFIzVGQwK0EwRnIwVm0ycnJrbkxjUHVQ?=
 =?utf-8?B?c3lpRm9zNTRJbW95VjZpTC85VXI1dElDWXZmZ1NHM2VXTW1ZM1ovWFFZL0F1?=
 =?utf-8?B?eWh3bWtjbU9meHMrNm9CbG9ESVkvc3VXSkF2aW0vYnloUGNuZ2ZMcVNrVG1m?=
 =?utf-8?B?RmN6bEFEd0NVS1M5MHlYMmovZk4zTzkwZzlwS1BQZmR1TzlRNkNXSUU2VTAz?=
 =?utf-8?B?amZkS3B2eDFFR3lXQzRHazY0QUgyWnp4aTdMR2FDWHZ1T0ZuRjBMbmo0Yy82?=
 =?utf-8?B?NkgrMDZ5ZWNzQWpsOXozUzZJbERrQ0RWWmRpdk5nc1libFFZdDRnOU5ZVDc0?=
 =?utf-8?B?WVpqWTB5MUVGWUdvYXFpOEErRmFaVXJOT3B3M2NuRVBqeHpiVFVwaFFOcWZ4?=
 =?utf-8?B?Y25ocm12enJFZXZUaUYzTkQ4Tnh0MGwyNkovSi8vVHVDczA2N29JcklBU1Vx?=
 =?utf-8?B?elRzV0dma1d2VE1BZFgxb01iNWdEVzQyRS9CTEtNQml4U3FicWxYQ1FkbVhM?=
 =?utf-8?B?UDhTK1RpZlFXQ3NiVkVXTkRnVDhVc1UrdFJuQXdBdHJTRmFsdVh2eVN4V0lr?=
 =?utf-8?B?MWRMa1VzbHJyNXowV2Qzd2hMdS9xQ0xIS0FZK2V1emlaRW5nN3plWnMvKzlO?=
 =?utf-8?B?Q0tPZEppMmZNNWlHOGFBcEhDSmZNTE0wWEJPcVlvNTU0dUlsS1hlYWU1Z05i?=
 =?utf-8?B?WUllUzFsTVAvbEVYaVBKK0J1NGpjTW9zY0kwZlhLelgwbHBzL3lody9oazhD?=
 =?utf-8?B?dlZFZWp5S2VMYldBbThCZ2ZOUWdMcUhzNUd5QTBiMExhMEM5WkZFcktNVVZw?=
 =?utf-8?B?R0g5V3IzTCtwSThHaUhjangvQlhyRzRneTU3andnbEQ5cENORFZKbEl5dXFS?=
 =?utf-8?B?WlBPbWl1eE9nQ2JkdFJLQzMvblNvZ2hpNWZTVHkxTG11WVFrK2ZTR3dXZXJw?=
 =?utf-8?B?blZLYllLa1B5a3RESVNYbG81a29adTV6SnlUZkFuZlp5VWhGV09zL3R2U2Zi?=
 =?utf-8?B?aDU5d3IwR0JBNXBDOXR1OTNNMDBJT1p2bmpVNmcvWENvcUhLemUxVnhaV0gv?=
 =?utf-8?B?a1R2b2EzNm1RaHBTR2xsVERaajYxM25Yd0JKWFA3YWVIM0RuWFNqQnBxZkZS?=
 =?utf-8?B?SEJzcUtycGcyNVdqVThmSGZibXdnQWc4THExR1NZdGJpSE1IbHZqeCtnUHlz?=
 =?utf-8?B?RVl3cWRjNzExbWliRUVtK3l2cjFXbmxmc2M0N0QvVXpWTzExNGlTVVpzTzdK?=
 =?utf-8?B?ait5bVlRbVZ6S3BEVGdkQ3AxcnJuWmdxMDRXUzE5RVkzS3VKSzIrTEFuNFhR?=
 =?utf-8?B?dnlLZXh0YTg2SXQrNlZkeEVuWE9Ic3ZnZUxvRzZxTXROUk1GOW1oRUdiMkNx?=
 =?utf-8?B?SzdpeFJkc3JYcC9VSlBmczJMUzRzVmM5bExUOS9MbllBN0s2R2hRTjZjY3Iy?=
 =?utf-8?B?cm9pS1UzYkQzc0ZhdVMvN1RpdGUwTEdQL2d2bFQ4c1BWbHFxZFZ2R090UTFp?=
 =?utf-8?B?Nml3Z3lvQzhOWW9UazV6c2NKL3FMNTlpWGk4MDIwMlIzQ1h0THczQ0ZXa2xn?=
 =?utf-8?B?Q01BNDZ4WTVVdTZ0eGJ0R2Q4SFllMzNaME1RTWU1cE1JQW1VbC9HWE5ndlhY?=
 =?utf-8?B?YjR6QzRQeEJsZUZpWWhRam9ZNStVRlBBMGNpenNtaDVaUWUrY05NcTJzN1RD?=
 =?utf-8?B?cnZNK0FhUWszL1lEcTBCU2RHQkN3SzFTZER2N0E0Y2NGQXpRbkVWck0yL0Fy?=
 =?utf-8?B?cjlVK0pZeXRnRVduQlp1ZG5rOFc3LzRPQkk1d3EybFVMeC9LRjh5aE11Uzlk?=
 =?utf-8?B?bWRZTitBaUJtTGxKckpBLzFkbWJqNUpUOXlXZWd0a1gxcEFyWFBTbW9Xc08v?=
 =?utf-8?B?YXh2Q0lyZU1PRWFQWFVHNHNaTjdlMGhILysxS05aV2xJdG5vSEhWK3JRTTdZ?=
 =?utf-8?B?UW1HQXBqWXZiejFBMURaMHJKanJ2VytVUWswYXo2ckJ3SkZHVm9HbmE1RjFN?=
 =?utf-8?B?dnZQRWlpUEFvTDA2V2tyd3BRNTZraSswR0NONFhuRnlGQlU3T3haekx5ZEpw?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce8ebb6-f28b-45e8-2783-08dc95203d6a
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 14:08:08.4467 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QCAAbL7fCeTKbnhooFXMaUk11Yn4ZE9HwIexp5JhRU42Bjxyas5T+sObcuEg/YfJF39z3p4iIDxR9yjS1+dUG+EOReYmf4ewYAHlLmNmCR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8471
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


On 25-06-2024 07:36 pm, Kunal Joshi wrote:
> There is no harm in plugging discovered ports,
> just incase they are not plugged we skip in test_setup
> 
> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>

Cc: Mark Yacoub <markyacoub@chromium.org>

LGTM:
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/chamelium/kms_chamelium_color.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index 4156023da..392eaf1f4 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -709,6 +709,7 @@ run_tests_for_pipe(data_t *data)
>   
>   igt_main
>   {
> +	int i;
>   	data_t data = {};
>   
>   	igt_fixture {
> @@ -730,6 +731,13 @@ igt_main
>   
>   		if (!data.port_count)
>   			igt_skip("No ports connected\n");
> +		/*
> +		 * We don't cause any harm by plugging
> +		 * discovered ports, just incase they are not plugged
> +		 * we currently skip in test_setup
> +		 */
> +		for( i = 0; i < data.port_count; i++)
> +			chamelium_plug(data.chamelium, data.ports[i]);
>   
>   		kmstest_set_vt_graphics_mode();
>   	}
