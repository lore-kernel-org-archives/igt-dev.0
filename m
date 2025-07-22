Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57AC3C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 22 Jul 2025 08:38:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9CE10E62C;
	Tue, 22 Jul 2025 08:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANLYp8z+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF2710E62C
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Jul 2025 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753173508; x=1784709508;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gcQhNGLTlc6csRNLyV9hRGIipIa2Kttfsn3qMKCi3SM=;
 b=ANLYp8z+7S2H2+sWcpl678hb3r9jwJJokMuF4e/IfUD0yiszryfd8V26
 Pgt7XQPiMIT9qSIdZFXsOXtHaebtjBu3+/vL0h2VRnhCWCjQW5hpIMdLH
 VDAJC6ipsLQ7brz6JO0o3uCJBVjnhiv8U0YRt3BIVjSD6ch1cYHZNmOrv
 IDHaVv+sOKvH1sbBPiiJV0Y+96scTZ2/p7iNEtVsmj6/Cc/vJyKb8P6iv
 CLKv065KJ0JQ51OJEzykg9bVTrgkqnDTV7qCWZHGIGcFNenD4O+VnD/Ey
 4bLMG8KM3N0yzldPgTz8vQuFNqOOzrK0KjtltdSwSphl7X2NC9TaysGAJ w==;
X-CSE-ConnectionGUID: zj0ZQFzHTk+90fr1J/urNw==
X-CSE-MsgGUID: 1bbtP4vSS1+4DuMcHnNZNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55371472"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="55371472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 01:38:28 -0700
X-CSE-ConnectionGUID: M85dYu1TQku+Uu+B+kJ9jA==
X-CSE-MsgGUID: CwLNlwWQQAaqO9MLFe1TSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; d="scan'208";a="196154895"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 01:38:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 01:38:26 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 01:38:26 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 01:38:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zQD4gpNgqJT8E02RnnSjdKZjC+Gpv7HF9ftIu2qMX8RUxxNF42K04o+4S0mTOU5JZQFdFNuep7j2NTSniVvrsbkmb36rehIWlTzdjq8qgpXtJGP7gKESD4ONOAYlQfhc6Zgx5waQc/HcgD5Iu2i+GVYYAAaiwwyLHRasBNpcJD8vC9sch30QzOr0UV1pYkyCysLSrdTVA0CzvctiUXrFnzRfX04ttJIsBaRlmETxEcq3G3DhnHy//spNxVs+79ILwrhQ8rpyLqpNbdVzgfk/3pX8y+EB7oB7D0goggvDUIDbw6RngdmINUrRj9qiM2kLaBdtZ9Q8cFV7guXGr757Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4owneJqVy4YOcG/WaC5EgPvX8/16WE6sqSdXCsIaSmE=;
 b=QEuuSn62rdTl0e1e7T1k4jJi3M52R5H4YwmkUI9ZqjgS3HdzLxE0TW9hYzT3cL5i03FJviyPbjsDVyhF077EzRN7+PEGX2Lkjj4efNY3uT7MS7yZeQYYNJlT9ZHFZKfUeT9S+0WGjb14yoQ3Yb6DhkMAReWFJZojBBKtCuPJZI8QhHMN2+Kn995OTes0tDOot0tHnbmRgvDiD88ulYyqy4U6x7DSM7PUkqwk0kOoUmaLL/ALurszos1JuW2i94p4hhvfiMPaJQNEGWwYusS7V2uQukaAKzElX7V1PZCFYxCEdRsxH5c8vLKBkDFYgQU+a/CTuSHvxX+U2Y5oJyo7Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by SA1PR11MB7015.namprd11.prod.outlook.com (2603:10b6:806:2b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 08:38:18 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%3]) with mapi id 15.20.8964.019; Tue, 22 Jul 2025
 08:38:18 +0000
Message-ID: <d24e405e-12d7-42fc-8d81-424d0933e711@intel.com>
Date: Tue, 22 Jul 2025 14:08:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Skip tests involving engine
 activity on vm
To: Riana Tauro <riana.tauro@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <ashutosh.dixit@intel.com>
References: <20250715070017.2900547-1-soham.purkait@intel.com>
 <b2ab0add-8db2-4fba-8a6d-2c602e7f90dd@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <b2ab0add-8db2-4fba-8a6d-2c602e7f90dd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0082.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::12) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|SA1PR11MB7015:EE_
X-MS-Office365-Filtering-Correlation-Id: d73ad7b5-791b-4c04-2689-08ddc8fb1b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0FIV0wyejd4akhpa0RibldQSUU4c25SZGlaYkxkcG5pcDYxd05wb21kb2hs?=
 =?utf-8?B?Vld4UnAwNkNacStBSlJPRXRSaUNSb2RHVWdNMFdSbG5CNmM0SG51eTlJVWxG?=
 =?utf-8?B?UzgvNTlhblBxRW1yNXNua2xlNU5FUTFRUGpidkpRREpsZlE5b3VxVzZJK0c2?=
 =?utf-8?B?WXBNK01qS0xKR3V1THhrNzVGNVJJS0RQbTExUEFMQ1ZVMjJNdDJDQllmWHhY?=
 =?utf-8?B?NHAzSEFUZDJwdEhRVVhRTmEvT2VYblNXK0ROMDFkUkhaTzdjNlZmUlVVT3hG?=
 =?utf-8?B?NkdZNldzczVkaGV5WUNjRk0vaUxYYU9uZ3J3N045ZnoybDdlVHR0bStnUFFU?=
 =?utf-8?B?ZnMvMUhhSEt6MFFJV1pVRUYyRW9yS1grc0FrLzh2WkY5Z21DdTdVMkVmN04w?=
 =?utf-8?B?MlBUVXA4YWxmSGtLOGdDbXhGYkNLVC9nVWtBa25DN2dmcTArcmpDWnFtY0do?=
 =?utf-8?B?dnVNakNtNWFxRHVFTE9OdGhEWnpsdzloaWhSUU1iVlFlU3dsTDQ0Sm5LU0ho?=
 =?utf-8?B?aU01eVpXbHpjcVFRN25GTHZVY3YvM3ByemROdkN3cE41V21naFJZUlA4K0R1?=
 =?utf-8?B?U08rMC9JUHB5NTA3SEt5TTJIendkRUdQZFh4bnlYYmdKV1JzeHRzS0YvY2NS?=
 =?utf-8?B?Vy9wemNmNjNiTm5NclBTQW1lZU9BZit1Mzd1QUV6RjRqS0c0Z3pGQUtER3Zu?=
 =?utf-8?B?eVpuR3dTYmNmZW4vTStnU3RKc0lwSXd4cDFHQWtkZWxIaXIyWWVBOElMbVIv?=
 =?utf-8?B?TXplMzhmUzZ6bkJZb0VXQ1ZQOEpMaFpLMVJhRDZBc3FkWWNRbDMrTjBiRjd5?=
 =?utf-8?B?Z0VqcmpGZ1pvM2d5N2Fld3ZRQ1ZUVGo2OFN0OWVBaTArZGRvQ0VYcnZIbEI5?=
 =?utf-8?B?TmxzUWpzc1Qzcnp3Qk91U0dLa2tEVERnV0I0NmtTcmRWLzI4cWtFMXVKVzZ6?=
 =?utf-8?B?ZUVwVkdWNUsrVitXOXFleGZRcnFaMUNaMWQzNTZ1c0RqV3hwVmZNVzVObGVl?=
 =?utf-8?B?WEhmaDlETnFHSlZieUY5MU9OUytETm5tbk93dVNITWRvS3pjN2N6WVVTRWVo?=
 =?utf-8?B?dzlZYjc5eW9mWnhsMGd6MG9FM2piM1lmUy9oWk9nSVVpajVsSjdpQlF4SGVQ?=
 =?utf-8?B?eXoxaEZKUXVGbEdiUW1aZ0toMFpZTm9UZVkxNzMyNFMrUnRWeE02Z0JKaE84?=
 =?utf-8?B?Q0Nib0JDMytyS0w2ckZsUlNYRHhFSEtNMTBTdVBTNytFeXlrYmpZWFdnQmpI?=
 =?utf-8?B?UjJ2dDJZaXBFZFZxVnFWNTlQakNVWmkvUlVNMWIrcUYzWENZSS9Ra3AyaVR5?=
 =?utf-8?B?c3haUThydzY4YnFBa2tKNDIvc0Zrc0dIYS9yd2ZYRnBBbVNtSjlML1FxeHJU?=
 =?utf-8?B?MHJpRTd4Sy9TSHkwZ2dJUm1uTjM3ZEtnSVovY01heDFRRjdpNjFzeDRvZ2Ju?=
 =?utf-8?B?bWpQbTdqTDU2Q3dqTzhhRGRMbmJlY1pRS0tBQUFmOUVqVTNUSngydW1US2NH?=
 =?utf-8?B?QUQ4U0g5Q2JRbjYyV3V5aVdCT25RSjhZenhubXlJZWtXbndOaHlpVTk4TzVL?=
 =?utf-8?B?MFhlNzduZTRpV3hkN0g4RkdCTjEzdGFOckJySDVtUkdkZ1MvOWxPZHlPcHZp?=
 =?utf-8?B?Zjl3SzYxcW5mZm9OUTNINTJBOFNlbldGaTFMSThmUkRUNG5DdWhteDlodTls?=
 =?utf-8?B?bUZHcFBuWmprMDNnczBOUWRDanFKVGUxVE9haEpRbEdqejBtRkZFa1FSbEtn?=
 =?utf-8?B?MUpqeGUwUnBURjNjTWRYQzVGaXB4MVpHNjQ4ejkzTUljYVlxZklpR0xTRW14?=
 =?utf-8?B?anMrZnJ0SkZhOVNTR3RQUytJY2dUNFd2QWlWalpUb1pqNkdPc1VIWTlUdDRZ?=
 =?utf-8?B?RXpkTEhkRElLYlJySUVlcVJvZGRDSEt5TVFqK2J6bjRYQVV5LzVEVlcvd2R6?=
 =?utf-8?Q?xffDi0bdiiw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUdidlZURXFrMUpkOWhnbW9lSVgyVkxOclRQUnJXZE9BV1VyVm5zdzhmMDE5?=
 =?utf-8?B?cnVubUprVDhDOUcxQW9LcE9JZWhEbXJEZkFkc3FDR2FmeVFhaHI3d0w1alNT?=
 =?utf-8?B?QXRkbmp6NW5vMkNSZktBeVBNRUwzNDhiQmF1VFAydUdhS0dkdUp5bHhGK0Qz?=
 =?utf-8?B?Y0xjZWo4OVR0Q2h1UWtUYStCY0lXUjBLY0lsYmFKYVBqZlBsc3NhZUc5VEVl?=
 =?utf-8?B?MmV4cWpGeE9hRGZORjN1bCtEdjVqYXV6NFp6WEhrc0F6ek1GRjMrSGltb0NM?=
 =?utf-8?B?RTlMV1h6VGZjV3NBOGRRNzlFekNadVVZQTRyOFZhOTR1QkhjcThRUHdSbU41?=
 =?utf-8?B?Y2JNNHdZVExRaEVRQXQ3cmVRTlZtb2JTNGpzRjEyYlFoQ0ZFdWpWeFBKNkhm?=
 =?utf-8?B?OExiZ1llYlRxK1MyL2VxaFIvY3hweThnbmw0cHF2YXNKb082d0RKaldmRDZv?=
 =?utf-8?B?QWhmWDRPd0kxa2tXS0JwZTBuTSt2MTcrd0Y1YjNIbm1Na0tYdzlFTEloQU0r?=
 =?utf-8?B?Z1NZTFRkeHRyWTdHNDMzK1pOc3hpR29laStxb25yb1pjWFRaRko1bWFSaG9D?=
 =?utf-8?B?VEttVHc5VWZQc0wrQlZ1c2Fsb1ZPL25relViNHJOUkNnZE1xditWdTZEWktM?=
 =?utf-8?B?eTZGNDJhakduWFQwdTZYWXR5eGJHQm5uQ2t0RzZLMmJVSjRGc1AzRUl0NWdk?=
 =?utf-8?B?OGRwUTc4a2dZOFJmYVRwWFNkbWdEeDkvVDN3TEx5TlNtRUhDbmZHOXNKSEZp?=
 =?utf-8?B?bzV5MjFSWE9ybE5EWi8xZlN0WEx0RExURGh3czA0TFNMQ0ZLS2U1NGd6K3d1?=
 =?utf-8?B?cm1mTWpQU2dHcUMxN0Y0SVRlQTA3eGkyUktSdjVPRFNNTVA4RUh5TTNTcW9D?=
 =?utf-8?B?akxEa1FRSjZNeEVPV3EwNVBJSXdMVkpKWHFPczlROEhrT1N2dWVtQnNWVFFN?=
 =?utf-8?B?MXo0ZWpqRHF0dXNiRVdJUnN3VE1wSEFqTzQ2VStGWjZ2YTB5N1MwWmcrM0M1?=
 =?utf-8?B?cFNreWRiT3lvdXFsakNUU3hKRjdWSENhbW5DM3ZON0dNVzE5R0MrRFF2cE1L?=
 =?utf-8?B?N3B3c05XblYzdEJDbWs5c0tlY3pxb21ZWTQzUVlnMXphTmh0eHo0bXRMNi9T?=
 =?utf-8?B?NGdyd2g1NUtIZ1IrUlNvWmdtSDUzbFFCWlpFaVNyMGZrRVNiSWh5MDl1VUJO?=
 =?utf-8?B?SjhWbGRqcU5zRmNzd0JnVUdicmN2dUd5TGFlVFZUOFRjenF1am1GdERZRXZ5?=
 =?utf-8?B?RnlieHJOY3ljTkNjTkIzQkZDbmZvNDJ0WGF4cTdCdWZPTElVTlZDMS9rQ3ZU?=
 =?utf-8?B?RzdmeHJPU1BQVUR6cVdVU3NMV1lFdXVzUFJjeEN6VE14U05zeTFQdU9vV3RN?=
 =?utf-8?B?amhDUDdCTjVsa2FJaXVxTlJnYVdzOUIya05nL2pOeDVMSnpBTlh5QWJ1R0hW?=
 =?utf-8?B?M0orZDNzTVZHcXVUZlE1WDAxVzAvOHV3Tk8xd21uMzBjU2xQT0FFbU8yQlcw?=
 =?utf-8?B?YlArSitlbzJxT2FUVnRIS2tPMFZTcjFHaGxPZktPRzU0bkdNaXBzUlpQdkwy?=
 =?utf-8?B?R0pTYS9uSjlLSjhKbFkrMWtCNmNLZnNZWng5YVMzWXJkWndkK2Y2S0dUVytR?=
 =?utf-8?B?R1piL0VFejBPSzB1M0dadlFyTlBnZUx3cGlaZ01haS9mcE1Mck96TXRnY3FF?=
 =?utf-8?B?UzNoTU9OL0VQdDU2eENaYVdPMXU1b0hRby82V005eVJ4Zm05czM0b0RENVBO?=
 =?utf-8?B?Rm9BeTFBcmZFWVBJbEN6Wk9VaDZqZWo3RWlKL2FlWTV0TXN5eXY1THhWZVZX?=
 =?utf-8?B?M08vU2ptdjdoSEtSOTJYZDJuU3ZZWlJ3ck1JdW9BdFpBb0sxUk4zclVJcmdu?=
 =?utf-8?B?R2VXaHFrYnpib1NiTGJwOGh2bnI0ZTFzNlN4RFAzazk5MjhZMFNWMENPTkFm?=
 =?utf-8?B?MW1jWmtvS2lUOC9jemYyRXNycW1WWi94dmFoN3ROdnZKdzBHTHV0UHhyU1lv?=
 =?utf-8?B?QnBIbGRvV0h1UnlWOHNZMUg3a3lkNVpJUUlhMURlcERPYjYrT0tBSCsxb05N?=
 =?utf-8?B?U21vSFplaENjTHlXd0IvZmdjNmRuR2RsenZaZnhXVGZCY1dpMWdYY0Ntb1lq?=
 =?utf-8?B?MWJtK01LbE9xSFJ0Ry9QVnEveWl2andmUWgwcE9YUzlVcFFEWEhCRjBXdFQ0?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d73ad7b5-791b-4c04-2689-08ddc8fb1b48
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 08:38:18.2246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fnBXkROMmdVPWs6mh3lMO78VBAAPPmLlpu/JFNRoz7TweYLusMeh7Pb2qjYzg/xUiPShFWDUZAGeXEu9tIV0OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7015
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

Hi Riana ,

On 15-07-2025 16:14, Riana Tauro wrote:
> Hi Soham
>
> On 7/15/2025 12:30 PM, Soham Purkait wrote:
>> Skip the tests and subtests involving the engine activity on vm
>> as engine activity events are not present on vm.
>>
>> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 13 +++++++++++++
>>   1 file changed, 13 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 0e5a7360f..9ac9d38cf 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -113,6 +113,17 @@ static int total_exec_quantum;
>>               igt_dynamic_f("engine-%s%d", 
>> xe_engine_class_string(hwe->engine_class), \
>>                         hwe->engine_instance)
>>   +static bool igt_is_running_on_vm(const char *device)
>
> No the absence of the file is not the indication that it is running
> on vm. This can be caused if guc version is lesser or any other reason.
> Function needs to be renamed
>
>> +{
>> +    char buf[512];
>> +
>> +    snprintf(buf, sizeof(buf),
>> +         "/sys/bus/event_source/devices/%s/events/%s",
>> +         device,
>> +         "engine-active-ticks");
>> +    return (!!access(buf, F_OK));
>> +}
>> +
>>   static int open_pmu(int xe, uint64_t config)
>>   {
>>       int fd;
>> @@ -191,6 +202,8 @@ static uint64_t get_event_config(unsigned int gt, 
>> struct drm_xe_engine_class_ins
>>       uint64_t pmu_config = 0;
>>       int ret;
>>   +    igt_skip_on(igt_is_running_on_vm(xe_device));
>> +
>>       ret = perf_event_config(xe_device, event, &pmu_config);
>>       igt_assert(ret >= 0);
>
> Is it not possible to modify existing igt_assert to igt_require?

As you mentioned to change igt_assert to igt_require, but don't you 
think it may skip for other issues as well, say,
file is opened but there is some reading issue which may not represent 
the ideal vm scenario but may skip the tests ?

Thanks
Soham

> If not, create a variable has_engine_active_ticks and check for 
> existence of file and check for each test. But i think we should be able
> to use existing code to skip.
>
> Thanks
> Riana
>
>
>>       pmu_config |= add_format_config("gt", gt);
>
