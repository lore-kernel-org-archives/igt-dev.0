Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C250CFA466
	for <igt-dev@archiver.kernel.org>; Mon, 24 Nov 2025 08:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E5B10E1E1;
	Mon, 24 Nov 2025 08:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BmgH0/wT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CE510E1E1
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Nov 2025 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763973199; x=1795509199;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4LQIxnseDRuUkY1yQaWh1uykcHUTwXmaY/CLwQOp7Uw=;
 b=BmgH0/wTy6hRDHKq9TS3E/sytTwmzUvWl5ND0nMLEJ1kMetvEm72/pMu
 YC5IxwciZhiZgPu9/lWKMJrdh4QrscZ5SeP7MdfOgFQA/tZZSMvbIWpvA
 TAA53jH8iW1TermlZ+KQButz8Gk41Qz3qziQzDAK5IlJHZYNv65079uIz
 SFheT2OdaAEqpejQpW1wKkeRzDTYGQ/tWXNl6hG2OX8+Pk3jdcKwZTpM6
 yMLOI0PAPkdrcsTOjPhCWJxIG36sk8wHRhw5TCt8OXfa8Mq/jMDtS7ybI
 iWXkJ8MtcVtEjl9jc1UkspoEu3Qp1BrnvOfQsH+9LgD0cJzuJaYkpnssg A==;
X-CSE-ConnectionGUID: XBDN01nuT/WRL1kID2IahA==
X-CSE-MsgGUID: 71niVXp2R2K0rLWmIKmxNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65915963"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="65915963"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:33:19 -0800
X-CSE-ConnectionGUID: F0gp9DAITcOuRbjMFOp/Xw==
X-CSE-MsgGUID: hNcbw1duQhuHTGTYsfN9aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; d="scan'208";a="229556130"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 00:33:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 00:33:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 00:33:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 00:33:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ktdb+6SnaCWEefAJ7mSbbn+sju/LS/1uveJnZzzMpA3t/jauv/Zh96p/LUbI9y115WrYO4iFR8Qnr7znXWg2kiIvjHvbozx7Mzo0hyo7U1GCgJIzGVE69y1aKsL5xHmmH+PLUkI66wPxOX3Oiz+1gxIbjhLCblP2pz7ivNs+MziE6Sa4sPUxihp+OhPq5yqKqaqqkOSm7sQR4kQTK/sYImqruiJ7S2jpLzelW7utT58vvEFf4CvwZdK+O62aB0GMfhNcfixun3nVRiM8ATeIDIlyzdFMYkHZ0Y20h/AjQTWGI4EICgMOVxL5EiqpKMyL+L3UsGj6bT+f5pIz9Ozb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+DV8Q4Ze1L980E/F8Q7DZk86KwFP7DMFn7hYo0dhPs=;
 b=tW0AZCqKlsUaCEYrLjvy8gO3ZN3URKMAkJDOuPT8VgoUk30vniZ1aKrqSvGU3qbAqvO/DUqEx9yz31kohnRLDSwO4UjRh+6ZQHtQjvefAjgvtDwNlV1BnGzsbg78YU/e79R2HqIQ++dudYo3ChxiGOWiQXySVgo2KkRGtljuYsFz8xrF43P63Tyj3i9WHMoAnJOcV21AhEbfZ4bmbOn7P8zPIn8pi3ofyXKtdi9tE5eV43kFcEbYgBKXDF2UOOztAaez6EIa6i7SsYwCeBmvRMRPAeeDNJLUBzKh+BhyK51YJ20e/h1dI8kT9j01kseMguewK9Gxt2PM7tBFee9u6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA1PR11MB8542.namprd11.prod.outlook.com (2603:10b6:806:3a7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Mon, 24 Nov
 2025 08:33:16 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 08:33:15 +0000
Message-ID: <45bdf8bf-4180-48fb-9fdc-0bbda2ee1e52@intel.com>
Date: Mon, 24 Nov 2025 14:03:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/6] intel-ci: Add sharpness filter chamelium test
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>
References: <20251121123134.1099006-1-swati2.sharma@intel.com>
 <20251121123134.1099006-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20251121123134.1099006-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA1PR11MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: f87cc2e6-f938-4d57-762a-08de2b341cc6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWxPM3huSFk1UWdMM3JXRXl4QjRwbThmbXVrdEJ0bzVKZVBocXkvYnRKWmhP?=
 =?utf-8?B?RGJqOWhrSEhtZFVRaUJOMDViZFRxdXhVRHdvYjV2YmJrUnorNXNPNm81Z01J?=
 =?utf-8?B?OGYzWHBBNjU4bVpZYWtRL0V6aU9FdC85WWdJMmdwMkJDcllhZHVUb0pVeTB2?=
 =?utf-8?B?MHVsbUtSTFg3TGFTWGIza0lPVUlPcVp1SlA0STQ0T2EzTlk0ZzNJb2xRZFNM?=
 =?utf-8?B?WG9ac21FdTdlOUcwSlg5M2JRSmY2ZHY4MENoZk04OEY4dlhSdk4wdnJIMG5S?=
 =?utf-8?B?YUgvdmttOVQzdXpSS2V1WWZRRmZNamhmcjBneW5VczJlQVRkOXVYSlVPYjBs?=
 =?utf-8?B?VnVHaVpRMDh0NFZSU3BrV1VmMVZQdjU0VGptWjJKUUo4cmlybHFoRnFLZFV6?=
 =?utf-8?B?bEJjd2YxRWNJRWV5WXB6czg5WGRjTTRma2pMa2swSmVYRkxMNUh3Z3YwZnRI?=
 =?utf-8?B?Tysxb2hicE9OemZNK2xGYTNZNnR5eTVFY3FhZGtHcXJYbytCNEs2ZjRnRkwy?=
 =?utf-8?B?SmJWQldGZUxSREt2bmNpK2tab0l3L0ZNL2xpc0gvNjJlcmRLcUgzUmE1UVpj?=
 =?utf-8?B?YkRVTHR1TW5abzE5NDczQ2FGdHVBNDUyNDhXdW5uNHhzT2xxcWQzQjVnbU9I?=
 =?utf-8?B?TWFmUVRmNHR4QVkzb3NwallmQnhJc0NRM1FrdFdhTittQ1Q5ejg3U1d5RXA3?=
 =?utf-8?B?MUIvNzRvRU50Q3Q2S0UzNmo0QWY3Q2QremcrL2lRY280MnZvWTBUVzFKUnUz?=
 =?utf-8?B?K2MrL1ZlM1FZQitzWm9peTNuWjBuNzkybzZXSFVyVndkU0ZqQmVtUldQTitl?=
 =?utf-8?B?WlA5WGRScmVHL05NSk1xL0FSaWtMWWlUdFRKNzJmdk1ERUM3YW9MS25sWGdY?=
 =?utf-8?B?ejJFaStqbHZuUit1dENnSExLYkwvcm8yRHluZHFLVFBUQjRUd2dkQlhpMno5?=
 =?utf-8?B?SENSZjBvdmN0dmdMNk93ZHZRc0NBT1NYRFNnU043TVNrYVdqeS9Hb0htTlQw?=
 =?utf-8?B?bE9zRnB0SWt4SS9tYjluNlBIUXFpTXJsbVVTUldEZi9QYWkrVVJKU3FZekVV?=
 =?utf-8?B?RjYyUzdMb2hVTndnZlpWTFE0YmNMcTZsaVdQM3BkblhqTkNNdXlNMjdlL1A3?=
 =?utf-8?B?MkN2ZFF3dS9jdEloa3VxSE5udndqNndtd2ZiVWtFbHlaZ3k5bGtoV004UWww?=
 =?utf-8?B?UFpHajFDRGpYYVlDUGRIck1pdm9vMFpGclBocWJ1dUpNZ1J2V25pZHpWNVB3?=
 =?utf-8?B?ZUdkNis0MlB4MmZKSVk3clhnbU9VTW1hdHZscC9UZVdORVZQdU5WRVBrOUhF?=
 =?utf-8?B?NXRMSWpRNk1lYWNyejJRNnRPdDdxT1pid2NJKytlUHJKR2pIOXNKeUUrS2Zm?=
 =?utf-8?B?VlFDV1VIOW94aG14Z1pQcDBpRCtld0RHNU5BUmZUR0VyK2pwRGFESk4yLzJ0?=
 =?utf-8?B?bUd6amMwWXJQZ3hrMXg4R1VJc1RFVWo5YjZJTnRnMVlJOG02Y0ovT3U0eGRF?=
 =?utf-8?B?OVVVSnRidXBVQ0dVTzcvR1V4bjg2SHJnQ3hkK0syS0t1VnVkcVdPSHRiNkhB?=
 =?utf-8?B?R0xQODdwcXhObm51VHRCY1o4OFlieEtYZWRhRWFKZWJUTXhZTUkwQURGaVRN?=
 =?utf-8?B?Q2VWc1J6M2RXVTZrYkhOclBpb2tpaHg3YWFQMlJlb2NRcUtMMzYrYVM0MnpL?=
 =?utf-8?B?cnp5RzdNbzV1WkM4SDhnWjhqc0M5empRbG51bFVPYkdWYkYrN3E4Q29PVWtE?=
 =?utf-8?B?U3VWUVZ4YnBRWEpWcHJnYXh4T2MzS2RQSXJWN1R2RVNYZzVDNGhEVjl6cGhJ?=
 =?utf-8?B?dzNuOE1NSXlKcExPOHpsUUNJQnB2K3NrYjhqTXkvYmFMTXQ1bEk0dzVwYXhU?=
 =?utf-8?B?UEtFNm5WOHlscWFWNmI3QXdxWGZVQmhMTXgzZDdLcXRDWmswUEllc0ZkWWpN?=
 =?utf-8?Q?iQ/Xvj5V7RQjxLctnsJoEeGo/Yj+X4HV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFkzaE0veFBkSjVrdVo5Q3NpSEw2ZHRYNksvVnpTN2FTQTJhK2dEU1NlM1F3?=
 =?utf-8?B?K3J2MEVSd2ZkeXozQ3oxb3hoR095ZGdyWTE5WDkyQTRJOGNmeHFZT3A4Z2pP?=
 =?utf-8?B?Z2hxa1krYmZDV2RrMkJLajJsK1FyRmpldFh1eFFZams3TVRtMkNadkhrUDFj?=
 =?utf-8?B?MGh6QUl6RXJZZDNtTjNGYVdlV0lOTnNmVHNuVDJ3YlNtK3ZBSlFSeHVheUwy?=
 =?utf-8?B?d3ArYjlRZERBdEVsaitVNUVmWnFFbVJjK1pyc1J5SkljUzRYL0xqdzFXVlpT?=
 =?utf-8?B?MnZjbG5lNlp2Nkl0ZUpESWFqNnU3UXU5dWZVemVFaVhPNUd5bWc5YlZmSzg2?=
 =?utf-8?B?cVFtTTBqOTNLeitKQ0xRVXZPQnZPUU1LNXYyQk5HdFArdGxWckYrY2NkNm9M?=
 =?utf-8?B?N2ZLNUpPeXNpNTBVaG9QSWhoN1QxQmgzWWdFODMvZkFVRC9xcUNhQzQvek5T?=
 =?utf-8?B?Z2dWU1pqVkhYVXhRRk1JcFVpbzc4RXdMSXIwdS9keWZLS0NzN2p6MGQ4eWsr?=
 =?utf-8?B?V0JLOXFLeWRJMHJRa1g1d3B1NE8xV3dqTlpSeDVvWWRwM0psNjM3ajJ0emsw?=
 =?utf-8?B?Z1k3VUtRM2REaGs3THVlQmErQWhnUW9hT3lWS1JLSndFVHJ1ZUFQV1ZTZVRX?=
 =?utf-8?B?R0dOVEd1ZVdnd1gxNEs3RGhwREo0K0xwdW1kRUVSZDdUY0tVNTV3eEtxVzM3?=
 =?utf-8?B?b01FOE5QUXVKK0t2V3Bic3pienAzRlZURlVZd1hTVENDTzVWQjBrNXJpejRP?=
 =?utf-8?B?UUZqN1VKYnEzeE01RGphM3VTbUVsZUFsUGJHeTJVNjJqL2poWnMySEpjelc5?=
 =?utf-8?B?ODRhZzRwdEJyUndMbHU1ODBBR0dUWll5MS9lMSs1QmQzYlg3YnU4VG5oRmFp?=
 =?utf-8?B?R0t0eTJOUFNhMFhwdHhobjFLUm01TGlaWWpFcHJGcFFVVzAxRVNpSjVWc2RB?=
 =?utf-8?B?VFhYUWJiM01JeXBFR3JTVHNRb3pTVUd4emdFZVFXbzBxYlZVNEw2UWhZYjdG?=
 =?utf-8?B?TzZWQjJoQ0hQaEVTaDErWERncTRvRjhPSDJKNnB1SkdmMGZWeHExM1c4eGgz?=
 =?utf-8?B?VEhpdy83WG1DVW0vTjhXS3ZPeGhBbHY5cTlNWmtYckxkemZSZmNDNjh2cTZX?=
 =?utf-8?B?bktlZU9NSytZRk1MRXl5V3V3aEdrUXBQUDNqRlA5dXRGSFlQQTluUWdKYlBJ?=
 =?utf-8?B?Mk1oSTEzUFFIWi9xZ3Y5S0Nhdi9hd3NYa2llOU84MTN3RHpVdnFmMld5MmNr?=
 =?utf-8?B?VS80S3cxd1NVTiswem9sUERLcEJxbFVwd2lkTGYvdU1BQTZSTXNidTVpQlNo?=
 =?utf-8?B?WTV1VE1rZXVSRWdsUlJ3aVVySTVRdU83WUdodVhJa0RlZFFubml3U1JXN3JL?=
 =?utf-8?B?M3AxTkNVak0yNG8wWE9XSlhvKy9vbGsvMmg3RVhlY0pOcXhzL0NLbDYxaFBP?=
 =?utf-8?B?UXUxaklNK0ZwcXFlYXBUTmxoK2YxTGpGcDB1Y25xdEkwZVlQMFllbFFYaGNT?=
 =?utf-8?B?OHEyNGJiR25hZStMS1gwbUIyM3dwR1hobFl0ZmpwY0ViODBDblNQYSs0WUl4?=
 =?utf-8?B?RjNvQXZFWTRDSUJjUWw3b2VqWVRDdkVNbnIyR25SMW1NN0gxczV0bWwrY0V2?=
 =?utf-8?B?YjFIaVUrK1ZJdUVXTEdTRVplQ0VzYWlsR0pVSWR0WURjUzk2S0lGWUtLeno5?=
 =?utf-8?B?Z3RZd252R05tN1ppMVRGbzRnQTU5Z0JLNFhMeWNuVmtyL1lOL25nRXJpWGs5?=
 =?utf-8?B?NTJ6dklqTFY0MlduM2UvL1F0YmozVVQ4SGc2OGcyeUNqSC9Vd2lCUlFwMTBq?=
 =?utf-8?B?aWRDRk5ySE4ydnFsMFhQUTFrdEZHQVNtbjVDV1M0UVFUQ1JUcUJiZDlmT1Fs?=
 =?utf-8?B?QzNqZXFBS3BvUFZwZzV0VFlibUJOVWt3TGVvL3cvY3JLOWtINFJ4NytSQXNK?=
 =?utf-8?B?QllyVTErYVk5bHZ6Ui90SUNxSEZtbXV5ZDFTR2kzUG9rN0U5REpmbmpVNUVC?=
 =?utf-8?B?RjBsSnNUMW55S3lrdWVhWFYzY28rK1pBZDlpMXh0MUNqNDhxWW5WcDNNQ2Zi?=
 =?utf-8?B?bkh4ajVnV1VhUDk0SjMwYkdBVUhhYWlxUWJtL2xXZVlkamdSeUt4bEYwREcr?=
 =?utf-8?Q?A/ms30dbdOvcmDUjumFHbT+os?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f87cc2e6-f938-4d57-762a-08de2b341cc6
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 08:33:15.7826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oE8WCZpd/1EQ7aUzwBU9Tp1a+nszenZPE/sUlM3J4adu0jctalbz4JcbdmlbINVF8mErBxf8KmCSPYf9sEkDVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8542
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

Hi Swati,

On 11/21/2025 6:01 PM, Swati Sharma wrote:
> Add the Chamelium-based test for validating the display engine
> sharpness filter.

Nit: Please update commit message to call out this patch is just adding 
the sharpness filter test to the testlist as the test itself was added 
in a separate patch.

Can be updated while merging no need to resend. With this,

Reviewed-by: Karthik B S <karthik.b.s@intel.com>

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel-ci/i915.chamelium-only.testlist | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
> index 22e12108d..99d2f2409 100644
> --- a/tests/intel-ci/i915.chamelium-only.testlist
> +++ b/tests/intel-ci/i915.chamelium-only.testlist
> @@ -65,4 +65,5 @@ igt@kms_chamelium_hpd@vga-hpd-fast
>   igt@kms_chamelium_hpd@vga-hpd-for-each-pipe
>   igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
>   igt@kms_chamelium_hpd@vga-hpd-without-ddc
> +igt@kms_chamelium_sharpness_filter@filter-basic
>   igt@kms_tiled_display@basic-test-pattern-with-chamelium
