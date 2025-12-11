Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94E4D3E78B
	for <igt-dev@archiver.kernel.org>; Thu, 11 Dec 2025 04:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624E710E08B;
	Thu, 11 Dec 2025 04:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mfj9gGvx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C2510E08B
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Dec 2025 04:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765425853; x=1796961853;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/gi/wsrZV9Na2KyNtRNijI6adQjMRDxCOEblXhzspwA=;
 b=mfj9gGvxlBzi9IOuWdumG5VzJ/c4UsugVVqF3bKrE3CpkzBI7x2BUq6J
 8ECQhfQ1MellGeWjyx9uYfoqslOrtHICcyEpq8aRmzjsw+0wv0CiJ9hhX
 H2dnVAgnPDd03gvGSfDo/wl0Crm6D9aEE2QxwhWKRgzYqH0HA+BohzbR3
 UrkG6VbNZfZtzXx0O5gEcw5pAw1VdkVhshJBy/0/Xj07Fs2zT05q7GVFf
 IWliCcU8RivI06nlPvc+TxzVnWt5xGlyqWc8IXXbb+7mGIMBhcWgs/CFy
 8aSux59gQd4wak0q93J1p8e7nw4eU2OregEz3UB9YHEpppayl0AqBKtjO w==;
X-CSE-ConnectionGUID: LMhr54nlS+WfNBpdXtnZEQ==
X-CSE-MsgGUID: XTlc34JUT+is0mtAy5GwVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92883096"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="92883096"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 20:04:13 -0800
X-CSE-ConnectionGUID: of2jZ5xtRxOkj1z4RXnFbA==
X-CSE-MsgGUID: 626xoPstS3yKxqeOyEhXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="200858159"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 20:04:13 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 20:04:12 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 20:04:12 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 20:04:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OfxSMDzZ0WR825h0fCNsFCgIzMhDxJHXiZsFzhDtOpU7uIKQLXajUoSpLk2aPlPqag2P6IWHntIfRbrNIpVGwhjAZPrpCJv0MjCEWia/erY+eip207AnnHYa2zatPuaVk1//NpXK5sV/ffd0YX3RJuoKdSAm5aRFN0vFrff2Tk5L1apkWp4UItboW5PfouYoYm+N6akrgjTUyR0ZziZLLEdIbW6Ho84Rz9PIPBmZ3vv3qyahm5HuXj6TxzgfjS8XK7N0kk+RgRffXBm/vyWoMBb5EujSiVGZ5TQwL/uGUgifdDebzb0MiiF7079mtFmCmeG39+FsQ/skpAUhzggNdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7pmfj6qFGr9SrFQAOrsDi+1kpT/3njlpO25JoRPlxqo=;
 b=oHQAXiImutIJRNIAOcoql5wUAqQq9OWfXJCxr0qLanvDhz+A0e4Zw97we95mH+KBWZxxPJGhEa2mDJgBzN4nKK0IuCQXiCYD8IbIWtchcnJHUQ6t8+x0tCkwgWBjFiCZggfl+GhLLiEPcUQZn9wfypzmbdY0sS0l7dgr0W6hPBQoJKy/1gotNRd/D7sWd0i3P6lgghTPU0nFI+OIiCPuFG8AtxKw+/Hxr9WPpTL2N36R6Il7PSCqTUaOTyLlTxYOghUEOMcsF2VJkWtUEOYsevSRKG1V8PESFNPjkvBqpsiPnYCluKv7wNlpe/2IdQBUf7Q2Ef1w+DdIu4WDwiipuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by MW5PR11MB5762.namprd11.prod.outlook.com (2603:10b6:303:196::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Thu, 11 Dec
 2025 04:04:04 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::3e94:e15c:782b:bb92%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 04:04:04 +0000
Message-ID: <b8fdc0a9-14b0-402a-be99-cc980657d597@intel.com>
Date: Thu, 11 Dec 2025 09:33:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_exec_system_allocator: Add new
 SVM compute tests
To: Francois Dugast <francois.dugast@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
References: <20251204113726.567142-1-francois.dugast@intel.com>
 <20251204113726.567142-3-francois.dugast@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20251204113726.567142-3-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0052.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|MW5PR11MB5762:EE_
X-MS-Office365-Filtering-Correlation-Id: a10b5c6b-a60b-4f03-19f7-08de386a52af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGdXaU9mcm5ZZ2ZlRzJVeUpocmtidXA2emIwK3VqMDBxTmh6Mm1YS040eFBo?=
 =?utf-8?B?R0pMNnpxNVJjUUUxV2xzbDVxQUJiTGpodlFUMnFJZEJNK2Y5WXBpNjhuTndG?=
 =?utf-8?B?ZzlkWXhDUEMzWXJvRE9GZVVreGdYWVJMc1Nscmg4Z214bGtmQU1veGVEN29n?=
 =?utf-8?B?VUtjdkxNcXg0VDVNblZhZXI1aytyenBqcGhKOFlqcUV5RlVEbXZEaE4yTitB?=
 =?utf-8?B?TVpmSjllT3FWaEZ6TWJjNTFJN2dFVmliYmRDQ3Vseks5STR2VENHVXhDK0NE?=
 =?utf-8?B?Szkzb21DWlRuejV5cjZpbDF6bE91SFMxYkhoeFhLRk45WEZrNnZZV2duSTF3?=
 =?utf-8?B?WVBVSXAxN0RKV3lOTXVva01TTWMvVXEzTytVb0ZCaTNFUnhJVG40TkdmdG9s?=
 =?utf-8?B?by9tckF0alZvK095V2twT3o4SFhrODFOVHF4OFljUGxoaVFrV3BWaUU5K0Mw?=
 =?utf-8?B?Y2NOK0o0Z2JHVmVZbXRvZmtmdjludFFYRW43RmxTeWpDVmh0MG1lT2pMUzNO?=
 =?utf-8?B?V3o2L08vSC90aWZrdHdtUU54UVZMejFvVUxLNmFoblpCdkYvb0Z0SStKQnk5?=
 =?utf-8?B?bTl1QjJHSzJQZ3I2YWQ3ajVIa0tzR0ZWaW9KZS8xMTJaNUdyL2U0YlR5cUhF?=
 =?utf-8?B?ZloxcCs1VlYzdThtSVoxeUlNbHNsUTA0R2lUVVNSQWN0SzlmUzR4UkxFcmti?=
 =?utf-8?B?a3dEdGlDT2VwYk1pZDI2UU55bWxKVUkyK1RqRjJ5RlZEeDZwcnRSOHhNaEZB?=
 =?utf-8?B?TERKRXFXVHlSeVdVb055NTRzOGpFSVp4YjJEYU1pSzRmK3VmcGVzTUUwbkg4?=
 =?utf-8?B?NFBUSFNkbWwyc1RGZWNWS1FlRWtPUm5qOWFEQjRiRm1kNit0bjV5WU0zVXdS?=
 =?utf-8?B?blRzQSswRXg5L0wrMGs5NVFOemsxUnZ3NHBUSkYvNU5DazR3MjhXNXRpWDZL?=
 =?utf-8?B?bG9kSWU4ZTZYS0d3QlhPSGppYU5kOG50NitJNUVTZGRDbEZyRmZFbkxCa3Ja?=
 =?utf-8?B?bTJKTmgxU0lFSG5VZzB0SFVyMjJ3alRNZ045UmRBWmQvdWtMRG9FTHdldHVv?=
 =?utf-8?B?VjFYcUlvT2Vpc2x2T1ZTa3hmanM0WFBLSHgwNzkzYmtERXptU01vRDRzTjFD?=
 =?utf-8?B?czBEKzcrTnFONjBIV1dwRWJLSWZkaDlnS3Arc1lPRElJTVIrRTZrb3JZNzc3?=
 =?utf-8?B?Q2Z3MUpGelE4c05tQmFKYjdaLzJZNHZMN2ZvUnFDTTlvbTVtRlk1d0ZqeGd6?=
 =?utf-8?B?ZVZncmpobjZZNmZuRjZOR1VaelBoTXozRFRLR1NWaWZPc09xeHY1LzRNNGYr?=
 =?utf-8?B?ZTVoR1RvaDVlS1U3K1owczZPbXI2NHFRMUhEcVozd29xdXYzajdDaXdSMDlh?=
 =?utf-8?B?SU1NdWE1SU05eWptc0NkblJDRThvSXdnbkxLaTlwWCtjYjZ4dzNVeDRWRDdB?=
 =?utf-8?B?U0szYW9RbGNLN1A1RVF4dGhTMHJmMlRjc1RLMnZEcjA5SnBqNG5LakVlYkhM?=
 =?utf-8?B?RVZVNWZzUE5pMWs4VStMS0RKVWpLWGl4cDZFdVY0Ym5GVzUvWXVlaTVqTFVl?=
 =?utf-8?B?MHRvcG44eW1ibjEwd0orQStPbVhiUjhwY05teGZidThEK0t1SEtYL3crcHEr?=
 =?utf-8?B?dGZwT0U4RFJld0JJb05TSExOUHFtVk16dWc5bUJoR3JadGN1SXp4RndpK29V?=
 =?utf-8?B?ZjROMWZxMGs4QS9zL2tyUkp0RTllS1VXTVhUY2dUSWhWRzV2c1lpa0doNCt6?=
 =?utf-8?B?bnM3eXRsRUpnU1ZmNTN1TStuVFowdVFlb3JnRWp6ZWk3TlA1T3RnVXo3WXpO?=
 =?utf-8?B?SlJUU0hsU2k3U1hnWm5Fc0dtaFh4UVhQVVpxQnVVQi9kYlA2YWp1WTVmdHhX?=
 =?utf-8?B?RjBMYVRrWXgvaW1TU2JvdTNDK25Bc0s1cXEvNkE5ZU1ENlR6bzFjbnBVQ3Js?=
 =?utf-8?Q?nPj/4OBbMvB7zsheN2XZ+q4530DdfsIu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWhIS25KbnpDQ2dSU1I3S1NrYU94TDZVZThNVXY4Z2lzMzlzT1E0dkZsbDIv?=
 =?utf-8?B?NzY4L0JsQW5GYkNWK3lJUVVRVllsN2FCUDMvekt5U2R1djdkaDBta2hhVEdl?=
 =?utf-8?B?bGJaM1ZDSzdHaUdHVzhJQWMvWGg1ZWxPZGFETzh0RzhaUFJhUC9XRjQrYVZ5?=
 =?utf-8?B?a1RkZ0UwRGRaUDh0clo0eTZuTmlSUXVTc25nSTNwQmllQ3J1SEt2UENNNXpU?=
 =?utf-8?B?YmtQbkJMejdTcGl5SEkxVmtFM3hxWVBRbXVBK3RBNTFtUEI1QzdIb2U0cEVD?=
 =?utf-8?B?ZW1URkVpTjBZNThjZktENkJiUEw1NXhFQzJ5d0QwbTBkalpzQ2RwQ0pwT20w?=
 =?utf-8?B?T3h0OCtCV2RIeVVFbXZrRGc3REZneFRuV1p6VCs0NHFLRTE4YThxRWlXOTR3?=
 =?utf-8?B?M3RGbnlsaXpzZkVCcUVXb3k3MG5KZ1VCdEhJZXYweUFmK2dMeE9HTWZPVC9N?=
 =?utf-8?B?OFBvME1EdDRpSHVRMEg5cVQrS2lpNUY4N1Q5YUR0dTltd2FyYkI5OUhkYm9t?=
 =?utf-8?B?ajRvV2U3WU1CWHcxUWVUOUxDTTZORi93Vk1XTWFqVVV2ejZCY1FHT053a0t0?=
 =?utf-8?B?MUE5WkFCNVZxaklicDQ2ZU9QazBKbGdMWHZyeElkTHR6TWhpdnp5NTdOOTFY?=
 =?utf-8?B?RjVYMStmaGJaVWFUV3BFZlVJejBJVWRWeWZiWFBYUWpPR29nU0NPS1ZDN001?=
 =?utf-8?B?a0J4WkR4UlBZcGlCYlFBMHdyOCsrZGhNcWdVb2RkblZaN2pNYjJZNFNHekNx?=
 =?utf-8?B?Nmg2ZnpNY2Q4STdmcmRMamhxR1V5T1M5V3FjdGViWGJFd2YvMTlsUE1ZNXhL?=
 =?utf-8?B?Nm0vWWh2L3BDSXE2YWhuZ3MvNjd0TDlHa2d5NzZ6LzhkMnhTeU1hQkZ5aVVR?=
 =?utf-8?B?NlErYU9XTG1hb0s0ZUNFK3JzQXlVOHN1TDJqRDF1M2RsQUpaOXBKSWR3Unlo?=
 =?utf-8?B?SW42SVEzS3lVYlhLWXgwMlM1WC9IMGdtcnZCamNrRTJicUhyMW5TWDVza3Uz?=
 =?utf-8?B?M1hkZU1KL2Y2Y3pJYmpDUHlIQ0NRR2NNY1dTUzluM2lwdWc5NUZva3hMTEpG?=
 =?utf-8?B?by9RUXdQMWViamtCTUxWTlJ6QkliRnR5NjkzTy9hNUJUT0hQTUJhbWtDSEtt?=
 =?utf-8?B?MmQxWklScVVCWkk3SytQQVdzYmw4cUxXTzdJSEZidHlERnBKQkMzUFhibDcw?=
 =?utf-8?B?Y1N3aHB2S0xkUlgvZzhHSHR3TnlSSFFVbjV3akRyV0JnbDEra1AwUzhPQzFo?=
 =?utf-8?B?ckE4L1RVbEFNbWdzaDhOT1JTUUJTNUtIUmlWUlplckY5QWROU3JHM3BTK0N2?=
 =?utf-8?B?cmZ4QkwvUkkya1NTYmVnbXFzLzhZNGs4UklsOGk3WXVOQi9CRmkrM1B5RWpW?=
 =?utf-8?B?emJRRDNhbEc1OU9MU0QrakVudHdXY2Y0dE5sc2lNVUNvUzMrV3pqWWxsYmZF?=
 =?utf-8?B?VUlvTW8xR1M3Qnd3dXJsbmpkOGczUFRlV09rL2dhNTRhdnBORXdNWE1RNGRZ?=
 =?utf-8?B?Wk9aTHNZU2M4aW0wOS9CbCtFcGtDSGZlQ2tCZ21PbmRKR1Z5eWhJNldtN1R4?=
 =?utf-8?B?aXk0djA0OHp3N0hPYmpZQ3Irc1d6cVRXYW1oRGFEWkZrZ3ZoRmM0bms5cjVk?=
 =?utf-8?B?b1dUeEZUU0VjQU5NaGhMQ1FuYm01eVduaWt5ZEcyRGZaKzZoZVd4QUg4TVNu?=
 =?utf-8?B?RkpIdTR3MUE5dGJGZTN5V2tyYzNPVEphMStuWlh3dXdDL3ppUHkvUEVSTWdK?=
 =?utf-8?B?Z2JjcXZ6ZWs5Ny9WcDJOamxYelpWUk40dkV3MEJCM2hnM25NaXZVczRmYWht?=
 =?utf-8?B?Z3UyeExQQjljNnk5ZEc2WUs4OU5mNDlpOHdkb2Q1Rmx4TDcyazBPei9tYitn?=
 =?utf-8?B?MDMxdnFvNGtIWDErMjd2ZUxvU0NQbmQ4d3RZSjZoN2pPRGR2cVJiS1p1eGdQ?=
 =?utf-8?B?T3J3cnNIUjRoWENTMEFMK3VVQk5sbndZc3NtL3o4R2RKZW56T0owWVVIKzd0?=
 =?utf-8?B?UG8wUDBHS3A3aVBIN0ptL2RVaTRzdnNmYlhqZHNtUmRIQjF3WFU4Q0k0QXM2?=
 =?utf-8?B?WHpBQUwzYXY5c2VQTmZXRXF3YWJmWExLQ25XNVhraU8vUTJWOXRKNmFXdG9s?=
 =?utf-8?B?VmExL21hVTVCUU9tcFRWT2tsTGc4M1pxdk1NSnNmWlVoWHNTc0NadVEyNEg3?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a10b5c6b-a60b-4f03-19f7-08de386a52af
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 04:04:04.1215 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PROcWBRei4XLnT6Xsa91YFdvatvBiDmATIkTw6qCAM9C9+a+3I63P9EzxEKtznoPDKn/+cnQUrGvGCpZVdYsFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5762
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


On 12/4/2025 5:05 PM, Francois Dugast wrote:
> These new tests allow triggering GPU page faults from the context of
> execution units. They can be used to create single page faults or page
> fault floods, of various sizes. This is helpful for debugging and for
> performance profiling.
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   tests/intel/xe_exec_system_allocator.c | 60 ++++++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 4 deletions(-)
>
> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
> index 43be307fb..95146a5f3 100644
> --- a/tests/intel/xe_exec_system_allocator.c
> +++ b/tests/intel/xe_exec_system_allocator.c
> @@ -2172,13 +2172,37 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>   	munmap(pdata, sizeof(*pdata));
>   }
>   
> +/* compute flags */
> +#define TOUCH_ONCE		(0x1 << 0)
> +#define ACCESS_DEVICE_HOST	(0x1 << 1)
> +
>   /**
>    * SUBTEST: compute
>    * Description: Run a simple compute kernel with the system allocator
>    * Test category: functionality test
> + *
> + * SUBTEST: eu-fault-4k-%s
> + * Description: Run a simple compute kernel %arg[1] on a 4KB malloc'ed buffer
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-64k-%s
> + * Description: Run a simple compute kernel %arg[1] on a 64KB malloc'ed buffer
> + * Test category: performance test
> + *
> + * SUBTEST: eu-fault-2m-%s
> + * Description: Run a simple compute kernel %arg[1] on a 2MB malloc'ed buffer
> + * Test category: performance test
> + *
> + * arg[1]:
> + *
> + * @once-device:				touch the buffer only once, from the device
> + * @once-device-host:				touch the buffer only once, from the device then from the host
> + * @range-device:				touch the whole buffer, from the device
> + * @range-device-host:				touch the whole buffer, from the device then from the host
>    */
>   static void
> -test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
> +test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size,
> +	     unsigned int flags)
>   {
>   	struct drm_xe_sync sync = {
>   		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
> @@ -2205,11 +2229,14 @@ test_compute(int fd, struct drm_xe_engine_class_instance *eci, size_t size)
>   	compute_input = aligned_alloc(aligned_size, size);
>   	igt_assert(compute_input);
>   
> +	env.array_size = (flags & TOUCH_ONCE) ? 1 : aligned_size / sizeof(float);
> +	env.skip_results_check = (flags & ACCESS_DEVICE_HOST) ? false : true;
> +	env.input_addr = to_user_pointer(compute_input);
> +	env.vm = vm;
> +
>   	for (i = 0; i < env.array_size; i++)
>   		compute_input[i] = rand() / (float)RAND_MAX;
>   
> -	env.input_addr = to_user_pointer(compute_input);
> -	env.vm = vm;
>   	run_intel_compute_kernel(fd, &env, EXECENV_PREF_SYSTEM);
>   
>   	free(compute_input);
> @@ -2361,6 +2388,13 @@ igt_main
>   		  MADVISE_OP | PREFETCH | PREFETCH_SAME_ATTR | ATOMIC_BATCH },
>   		{ NULL },
>   	};
> +	const struct section csections[] = {
> +		{ "once-device", TOUCH_ONCE },
> +		{ "once-device-host", TOUCH_ONCE | ACCESS_DEVICE_HOST },
> +		{ "range-device", 0 },
> +		{ "range-device-host", ACCESS_DEVICE_HOST },
> +		{ NULL },
> +	};
>   
>   	const struct section intel_get_pat_idx_functions[] = {
>   		{ "madvise-pat-idx-wb-single-vma", MADVISE_OP | MADVISE_PAT_INDEX,
> @@ -2604,7 +2638,25 @@ igt_main
>   
>   	igt_subtest("compute")
>   		xe_for_each_engine(fd, hwe)
> -			test_compute(fd, hwe, SZ_2M);
> +			test_compute(fd, hwe, SZ_2M, 0);
> +
> +	for (const struct section *s = csections; s->name; s++) {
> +		igt_subtest_f("eu-fault-4k-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_4K, s->flags);
> +				break;
> +			}
> +		igt_subtest_f("eu-fault-64k-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_64K, s->flags);
> +				break;
> +			}
> +		igt_subtest_f("eu-fault-2m-%s", s->name)
> +			xe_for_each_engine(fd, hwe) {
> +				test_compute(fd, hwe, SZ_2M, s->flags);
> +				break;
> +			}
> +	}
>   
>   	igt_fixture {
>   		xe_device_put(fd);

As mentioned in the description single page faults or page faults flood, 
Can we log the the page faults generated? To get number of page faults 
already available in code using igt_warn (Done by Mattb).

We can reuse that in test_compute. One more thing CI considered igt_warn 
as error for same page fault count so better we use igt_debug() or other 
igt_XXX function to log page faults.

Rest LGTM. Let MattB provide inputs on this.

Acked-by: Nishit Sharma <nishit.sharma@intel.com>

