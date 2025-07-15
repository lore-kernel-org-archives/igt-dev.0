Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400DFC83F22
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 12:06:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA47710E5A2;
	Tue, 15 Jul 2025 12:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XS40eSww";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0108210E5A2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 12:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752581171; x=1784117171;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WSWpzFVnMnlpXL1jZW94fRVikVFVSbd7Pcv0n8SkqHg=;
 b=XS40eSwwnyhw7+T+trIvMK29kRP+kwA3VHEWrXZWazryETXQ4H08BpDT
 wrGoLqUBJzaiHknqgDDa2UTKmaM0na1PeHNGcFF7CHrh0CLSXAjIMHqZA
 tYZMyf3lJXnJ4jnrXfi4m+pOt9jxe4TBVU8F3vOVYs8QL6ZClqYybDcmQ
 //ptaJ5A2RbBcAw/FIS/ynUoyIpEmTtAVW4pOXY+7vPCJH+W9IhfQZOsn
 8BMhBdOJjuVS09atv6JJlhzJR81jbMzSUelRsgTJn6A+yUjTNENsys9JV
 IywcTGPejXktIRkS3FwQ9gFoBGG/Lks0Ap+d2mlBmWSlecTUoz9nIpa83 g==;
X-CSE-ConnectionGUID: smtvDx8BRR2Ty414ChzzfQ==
X-CSE-MsgGUID: tF+/69leRf6PUXha0F8x8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65865055"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="65865055"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:06:10 -0700
X-CSE-ConnectionGUID: OYf2naYhT3u0UO/L6zDisQ==
X-CSE-MsgGUID: VYpeJwHoQmGgxvCAENDBfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156616083"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 05:06:07 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 05:06:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 05:06:05 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 05:06:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9iqiuEBJBu1QIm/8HWeO7arEvu/PfaHFSZDMLYJJTswV7vUHhistF3WXWLjFFiICA3T4QpP26n5rtDcyXqQ9UIPKTqp+y0i+/nAdBlhWByydh4EAj7z5pVI3LjCVLLAMtiSXQY3s0cu00Q0p7MfESbe88Qe0F90iIN1X/DiH5LUrDNrr0jwRi6GXumuZdstJrPhYEPPOvJFRzxtXWrKpUYs+EOtfUf9kq/QQaWkSCA1LWvtnB1/csbA/Bug0tWZJhXJUDaKEbgIPfSgrfdeRYJpoFipNIbB3h/cZ8IWkwaNcgWAm5lilzMlgFjtoKOgxgUnMXkWdjy/dzOauxVSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5G3d/8owWO9xgNfz1ZTqKRd3ia4TVj11iyfqJHyEBY=;
 b=bztmdHKXBb5pUB1jwfie+jAXU3HL+HZ7ug6Feeo2sXIS72VgRIsvY8yIeUG6edv+KoI/4FhhJBH6S7dUepmxCdYdN5heb8hRZY0gbXIomfn9Kd+aveuum39RZlPLUBacXXQcdeb9RGw6IOl4iDcygkpg6/4kHvEAq+Ytzm4PpwzJ7g/yj+gYaF5/Uf48xSdcJDWgAapx6ihXXJxtRgDghJrzf+pDskR6M1ymiPQ9KmxFoek3NXchaYVCjErsyd+A3kFxwk1vp+hQvnUKKZCJOVZhBB2fxk90vTFqJu3KH3UuaS7ASmliy7QMS94JkVRorSt+9LdRXfcvhkChIVMRVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MN2PR11MB4519.namprd11.prod.outlook.com (2603:10b6:208:26c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.33; Tue, 15 Jul
 2025 12:06:01 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%4]) with mapi id 15.20.8880.027; Tue, 15 Jul 2025
 12:06:01 +0000
Message-ID: <53d0b625-df65-4e08-b37d-6eaca3354bea@intel.com>
Date: Tue, 15 Jul 2025 17:35:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] tests/intel/xe_exec_system_allocator: Wait on mapping
 BO's to mirror
To: Matthew Brost <matthew.brost@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
References: <20250714170309.2949211-1-matthew.brost@intel.com>
 <20250714170309.2949211-4-matthew.brost@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20250714170309.2949211-4-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::19) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MN2PR11MB4519:EE_
X-MS-Office365-Filtering-Correlation-Id: 08f67a46-c8ce-4636-8b38-08ddc397f702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aEJKUDdqRC9zOE5mUnV5MzRWQWd0eUhublgrZitoVEMwMTdhcWRQeFNwc0Za?=
 =?utf-8?B?YlE5UTRxdG9ub2JXK3FlTFl1SkVPbkgxSjJaRWpvZTlkTkRjUytLTm1HclhO?=
 =?utf-8?B?eFdRR3lzbC9rNWcxNmlSbkljeWZiNGV4SG1KRUl5am5HMW9aTlBUd1k2K09I?=
 =?utf-8?B?aHpHSHRtQjNBOWRkS2I0aEVhZ0s1b2JhNElLY3JEVFBzVTBYM0oxc20zNXhM?=
 =?utf-8?B?SjhKd2xKb29QZ25MSzlva0NvOTkyNFdBMzAzQURvaUR1a2I1ZW00QzFUTGVL?=
 =?utf-8?B?aEw5R3p1UWdNcTdxM0ZtSCtESFliSUlzdVJYUzN0NkpPOVE0L3duRENWWHJ2?=
 =?utf-8?B?NFJGQm92RVdGdER2cVJoNUUyMnlGaVpQNnU0aFdGRGxWVzZteUphRVBvcVNw?=
 =?utf-8?B?a3FGaS9QVGcraVkrWlhlVjdPYzU3cXFJaHlLSDRtU1BaV0hRWkl2VExNZTBm?=
 =?utf-8?B?dUJjZnY2Tkp6eHh0TEc2dFBTS2VpazFqcFcrWGxwQ2JJcGIremN4Sm5WZHNY?=
 =?utf-8?B?OW1XS0thZyt1WVVhRk1Zb1JZWEt3UHlUZmdnbVg0WkZzOWxWQk1vN0tlZHR3?=
 =?utf-8?B?QkRwV1RpVDgxOUg2OFJOODFhSmFQaEtGZzNuYmZkQ1JrYVRVd3ljRzByNVZO?=
 =?utf-8?B?N0E5Yk1EQ1UrT3hzYWVKRU5Gc2tSZHJaazlmd0wzS2Y3aTJENkI5dWc1b1hR?=
 =?utf-8?B?NXJmUHpLSTFtekNzR3lMWTNzSDlDTU5sK00xbjRGNUdaTEhWMlM1WWJBSWRC?=
 =?utf-8?B?OVArN2cyYjdETGdROUNPdG95RHp3WjFNV25TdEkzVW9QSHBCNTZNNjdpdkdo?=
 =?utf-8?B?ZytJSVdrQTVzbGVDeDQzT05oNDVUR0tQVGZMa3NwTnptSHI2UkxZeTNSMnZm?=
 =?utf-8?B?ZVFSZzVzNGp3RGc3WVdNaE5PenlGc0pTT3AyTmg1WGIwUHRkUGQyd2JJT1RX?=
 =?utf-8?B?TWh6cDNzMGtkT1RQMnF6NUV6MHN3cGd1TzBqY0VrRDBQREVWekN3UVhPdjdl?=
 =?utf-8?B?TVM2eEpNMThIcnRtMnM0MFhCdXNhTnc1ZVZpU1djYUQ4bzlxY3pnZUpCSmdr?=
 =?utf-8?B?Q1FOVTE5NGRvVjZTbS9ya2FnYXRLMjdiRWtvWmJhMkJ0Zm00SU1vQXNLZ3E0?=
 =?utf-8?B?MnRGOEhsMkxSbktiMkFlbXQzTTQzS0N0SmE3ZkYvRnJPWkdVQmxONTZZbXRj?=
 =?utf-8?B?YWczc3ROc3N3aFZCaVRYODFmYTZpdHRrSWN0eUEwYmlMNnlEdHA2NlhkSjRZ?=
 =?utf-8?B?akN4anZjSWtPRDZ3Vm1yZ1g1T3JNbUZSWENCZkxVQlMxY0ZCVjI3UDh1dnRk?=
 =?utf-8?B?anQ2cEc5UjNMUWtGK1NDT2lMYTZlRHZiVGg2VXEzOHVBT1YxZEorQjU0d2U1?=
 =?utf-8?B?YjR6U3k1aVFTRS9IYjVZalBOSE9LNkxLUVFhd3FsTzVqQXcvTitkczd5Sy9B?=
 =?utf-8?B?bk9rMTgxbVd4QzRaNXA5RHBraERGeXdSVVJzVXQxL2NBdTh2eUtpOUFuV3Fi?=
 =?utf-8?B?bmlEV1JWMUdHVnBkVVU3QzJRdG5LUU5QRjlKUlpLVEh5ZWxYVHhrOXRJS1hx?=
 =?utf-8?B?bTFJN1pmSEpEMHpsejFuTnJNL0pZSnJDZUVJYTIzb0ExOWtnZGFZRDFVUVk5?=
 =?utf-8?B?SzNaUTMxT0FaQ0c2NC9iMXllQmlGTWZNRmRsR0M3Sk03UTA5d2hCc3FCSHdJ?=
 =?utf-8?B?ZUtWeXBlY2V1SkJjVjlKQm9acTdxeTJXNngxTjdlZGpTQnhnY09xRm9hZ0hK?=
 =?utf-8?B?NEJKbnQzSnFKYW5pbFhwazlxdlFwZUhoajVMU3VQOHpobnQwV01zN1MraEtH?=
 =?utf-8?B?QUFrMFNvQmdFQTNuWnhUTlAvaEF5MjJ0bWxpTmQ4MlJSK1R6Nmh2bWhxTTlh?=
 =?utf-8?B?QVFjMzU1eERsZmJsK1M2eVh5bVdoTW1tMnNvcExZT21TRnpqaUVWbXliZ1BP?=
 =?utf-8?Q?p5cZWdKHrJQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RTNmNVYwZ3B1cnBjMmV3U3BIVDE4K1ZVSW11RnRUMHhGSDl1T1hOWGxPOGsy?=
 =?utf-8?B?UG9meGlJUVVhS2FyazBYOEN5bUhUY2h1U3RnOWh4aWhRNDJ6R05EeStobDdR?=
 =?utf-8?B?SVBSOVdTNzBQWkgzU2E3M1B4WFN6K3pSK2xGcTJsZDhqaEhPMExIVnhTN2xZ?=
 =?utf-8?B?QmZaKzUzanlMOFM2Y3VISTVOYzlNcGp0Z0hNV05qOUYyTnY1endrQUdITy8v?=
 =?utf-8?B?VG51VjZad0lkVldVOWtWbmwyelpxRnhTd1p0WmdMTldlL0MwTFp2K2M4ZlVG?=
 =?utf-8?B?eVQ4ekg3eFFjd2NUb2pCUm55RVpOSFI5eTdobUpyU053KzlMYVZIaHR2VTV2?=
 =?utf-8?B?TVRnMTBtQXUyVW03amcrWEZHcVBQckdidGU2YmhkNTdsM1F5QlBjNmtFKzNO?=
 =?utf-8?B?MWtQaWNicEovcGlLbkRxZU8rcGNOdDZvQjJrU1FyY0F5aHk5S1d1SWQxZkx0?=
 =?utf-8?B?RUxtMElBd1E1bnU0bE1EVnhYMWQwVy9LYjZCT05lODh1d2RSNXBkdDJob1JG?=
 =?utf-8?B?cXo1SEh5TEtkQUZQbFg2WWgvZDRqK0JFTk1iTWhuN25YT2JvVFpia3VwaW9m?=
 =?utf-8?B?OVZJVStHMEtRVktBSmZXRG5NSExBMld3SStOQ2w4MjdoY09aenl0aU10V3VE?=
 =?utf-8?B?dGh6YUJjL2l3MTR3VU1Jc3hDZmdaWnVhUGFTdkhWVU9aK2UxaGQyZUVSYlZn?=
 =?utf-8?B?REt0MDhEbXBFMHhMWG1BZG9OdnB3YVVsL2VvbTdQL2VvTmU5S1VPNlpML211?=
 =?utf-8?B?Qy80QzFSL1lrTmtUU29mYjdWdUduUndrMW5ETS92cmRNcEZ1bjY2U0xxVzhq?=
 =?utf-8?B?RjR6YjBySXNwZERXNUtmNDhJZEZ5VzJQWk4wUjEyT3duSUExV0dPTWh2N1FI?=
 =?utf-8?B?WVVCakp1dXd1cEErbG83ZWQwSTRNeExPSmsvdEVndFR3Z0hrMkRObUZ4aTMr?=
 =?utf-8?B?dHVvNURtMDNzVnhEZnE4VXB0TnpweXVMakIwUW5tNVZoWTVRd2wvNFlXcWlx?=
 =?utf-8?B?RUp1TkRJWjBSQzN5Z3BYdXFOaWFseXdzbERDY3pUUTd4bVVuVS85MDBSNzlB?=
 =?utf-8?B?Lys1dGx5ZkpGTnVFamZjQTczc2hCYW1iT0VUNjFpcWhZUkpTcTlvUVNteGZK?=
 =?utf-8?B?UGJ1aGRjOFNhZkFsZUJ5akF5bzIyUmN4MHJ0OFA2NTFXcFVSb1U0amtyT2NJ?=
 =?utf-8?B?RituM3oyMkZ0UE1hRU8zOWdRZm9iQldGdGxLTnlBaEJ1bngrbEV6VmQzMTZs?=
 =?utf-8?B?dXdSZGlxL1hxeVAzNERtcEpCaXVQTk1pakVXYXJpQ2tYa1c0dnRqb0RtNm9h?=
 =?utf-8?B?QkFJdCtXNURkRW9OZjNCWUJTM2dtYktjc3UycFFXS0RESWx5MG5LdUl0dWwr?=
 =?utf-8?B?ZHZrUWJqeE5aZENlUnZ1eWRsTUJZQjd3Vkx2TEJXVDRMenluRCs1eFg2SGxR?=
 =?utf-8?B?Y2N6US95NGhONEZHVmFjaTBZZVlMdXpmWlU5QVM0RE44WmZMNVE5c1ZsUjI4?=
 =?utf-8?B?U0dqUjU5Y29iUDdvUlZwR3lxd0FBQzUvOElJRHFQdTNQWU1tZDR5cjJHQ3dq?=
 =?utf-8?B?eDhTZE1mRXBZcE1odmFtcjJSVGFzZmEyV2g0ZWxZUmtoZ2I5NHlraVE0Q0pl?=
 =?utf-8?B?eTFodXp1NHc3bUZsa2dQSHI0ZkZkQnl6ZjVlV3RvOGxObWNzWjQvQTh3NEJh?=
 =?utf-8?B?QlVrTnZIdDZ6S3JBcmFTR1liWE1nZVhEZytWL1RqWEptUDc2T3Y4OFdkNHJ1?=
 =?utf-8?B?UkNhSW55OUkzQUZyS3BMUkJ1TWEzU09zYzRDZ3NmRVQzT0FpUXc0K3pIaXNJ?=
 =?utf-8?B?bUgwL0FYbTU1WUlaNVh1elRnR3pVS1VvMEtRZTNaSnRUY1FWdldVZnBkVWJy?=
 =?utf-8?B?bTBiWHZPemZzMHBqSU5uQWF1eHVqaE9IMGJmT0ZmOTQ4dnV0QkdFaEVRUFJt?=
 =?utf-8?B?bm4rTGVpQ01FREFUM1lEVE93cVY0Q3l5SlNqTmVyZWthZHZXczFOeGN4dWxs?=
 =?utf-8?B?T1FUVnhKcUV3bHJjVm85TzBONHFNMEpiNm9BdURzUFVXSjlZRGgraDh0V0xJ?=
 =?utf-8?B?MzdxYXEvTm14K0RqMWJYZVZiOEVBaU1ZNGo3QnRzRlFqRVlQQi9pOFZtR0xZ?=
 =?utf-8?B?cXRYZUh1aGh2WHNEL0tvVzNWRHlCckRGWThmK0s1OTVnSkgxcU1TYUdNRytn?=
 =?utf-8?B?bEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f67a46-c8ce-4636-8b38-08ddc397f702
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 12:06:01.1157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aBQrdx3jYgfPaB/3dfSDZL1a4GeVcaT7J06UEnVmyTS60vv/pTK+q452B2RnEqhlx750Ah/s5xpkIdnL/VO2YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4519
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


On 7/14/2025 10:33 PM, Matthew Brost wrote:
> Mapping a BO to the mirror is a non-zero time operation, especially
> since TLB invalidations can take a while to complete. Without a wait in
> the test, this can race, leading to possible data mismatches, job
> timeouts, and other issues.
>
> Make mapping to the mirror a synchronized operation.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 57 ++++++++++++++------------
>   1 file changed, 31 insertions(+), 26 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index f8d144328e..006a3dc920 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -1012,9 +1012,9 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	uint32_t exec_queues[MAX_N_EXEC_QUEUES];
>   	struct test_exec_data *data, *next_data = NULL;
>   	uint32_t bo_flags;
> -	uint32_t bo = 0, prefetch_sync = 0;
> +	uint32_t bo = 0, bind_sync = 0;
>   	void **pending_free;
> -	u64 *exec_ufence = NULL, *prefetch_ufence = NULL;
> +	u64 *exec_ufence = NULL, *bind_ufence = NULL;
>   	int i, j, b, file_fd = -1, prev_idx, pf_count;
>   	bool free_vm = false;
>   	size_t aligned_size = bo_size ?: xe_get_default_alignment(fd);
> @@ -1154,20 +1154,19 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		memset(exec_ufence, 0, SZ_4K);
>   	}
>   
> +	aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> +	bind_ufence = aligned_alloc_type.ptr;
bind_ufence is u64 * and ptr is void * in struct aligned_alloc_type. 
Should be typecasted (u64 *)aligned_alloc_type.ptr
> +	igt_assert(bind_ufence);
> +	__aligned_partial_free(&aligned_alloc_type);
> +	bind_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> +				 bo_flags);
> +	bind_ufence = xe_bo_map_fixed(fd, bind_sync, SZ_4K,
> +				      to_user_pointer(bind_ufence));
bind_ufence = (u64 *)xe_bo_map_fixed()
> +
>   	if (!(flags & FAULT) && flags & PREFETCH) {
>   		bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM;
>   
> -		aligned_alloc_type = __aligned_alloc(SZ_4K, SZ_4K);
> -		prefetch_ufence = aligned_alloc_type.ptr;
> -		igt_assert(prefetch_ufence);
> -		__aligned_partial_free(&aligned_alloc_type);
> -
> -		prefetch_sync = xe_bo_create(fd, vm, SZ_4K, system_memory(fd),
> -					     bo_flags);
> -		prefetch_ufence = xe_bo_map_fixed(fd, prefetch_sync, SZ_4K,
> -						  to_user_pointer(prefetch_ufence));
> -
> -		sync[0].addr = to_user_pointer(prefetch_ufence);
> +		sync[0].addr = to_user_pointer(bind_ufence);
>   
>   		pf_count = xe_gt_stats_get_count(fd, eci->gt_id, pf_count_stat);

This conditional statement should have initialization of bind_ufence as 
bind_ufence is used only for PREFETCH conditions. Putting initialization 
outside make available for every test.

Test should continue if pf_count_stat is not found in 
/sys/kernel/debug/dri/%d/gt%d/ path. In current implementation assertion 
is called when pf_count_stat not found.

>   
> @@ -1176,18 +1175,18 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			region = 0;
>   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>   					     1, region);
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   		}
>   
>   		if (exec_ufence) {
>   			xe_vm_prefetch_async(fd, vm, 0, 0,
>   					     to_user_pointer(exec_ufence),
>   					     SZ_4K, sync, 1, 0);
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   		}
>   	}
>   
> @@ -1246,16 +1245,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			struct timespec tv = {};
>   			u64 start, end;
>   
> -			sync[0].addr = to_user_pointer(prefetch_ufence);
> +			sync[0].addr = to_user_pointer(bind_ufence);
>   
>   			start = igt_nsec_elapsed(&tv);
>   			xe_vm_prefetch_async(fd, vm, 0, 0, addr, bo_size, sync,
>   					     1, region);
>   			end = igt_nsec_elapsed(&tv);
>   
> -			xe_wait_ufence(fd, prefetch_ufence, USER_FENCE_VALUE, 0,
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
>   				       FIVE_SEC);
> -			prefetch_ufence[0] = 0;
> +			bind_ufence[0] = 0;
>   
>   			prefetch_ns += (end - start);
>   		}
> @@ -1374,11 +1373,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			exec_ufence[0] = 0;
>   
>   		if (bo) {
> +			sync[0].addr = to_user_pointer(bind_ufence);
>   			__xe_vm_bind_assert(fd, vm, 0,
>   					    0, 0, addr, bo_size,
>   					    DRM_XE_VM_BIND_OP_MAP,
>   					    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> -					    NULL, 0, 0, 0);
> +					    sync, 1, 0, 0);
> +			xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> +				       FIVE_SEC);
> +			bind_ufence[0] = 0;
>   			munmap(data, bo_size);
>   			gem_close(fd, bo);
>   		}
> @@ -1456,20 +1459,22 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	}
>   
>   	if (bo) {
> +		sync[0].addr = to_user_pointer(bind_ufence);
>   		__xe_vm_bind_assert(fd, vm, 0,
>   				    0, 0, addr, bo_size,
>   				    DRM_XE_VM_BIND_OP_MAP,
>   				    DRM_XE_VM_BIND_FLAG_CPU_ADDR_MIRROR,
> -				    NULL, 0, 0, 0);
> +				    sync, 1, 0, 0);
> +		xe_wait_ufence(fd, bind_ufence, USER_FENCE_VALUE, 0,
> +			       FIVE_SEC);
> +		bind_ufence[0] = 0;
>   		munmap(data, bo_size);
>   		data = NULL;
>   		gem_close(fd, bo);
>   	}
>   
> -	if (prefetch_sync) {
> -		munmap(prefetch_ufence, SZ_4K);
> -		gem_close(fd, prefetch_sync);
> -	}
> +	munmap(bind_ufence, SZ_4K);
> +	gem_close(fd, bind_sync);

if(bind_ufence) {

munmap(bind_ufence, SZ_4K);

}

>   
>   	if (flags & BUSY)
>   		igt_assert_eq(unbind_system_allocator(), -EBUSY);
