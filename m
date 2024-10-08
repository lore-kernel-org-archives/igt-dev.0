Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A64CED263
	for <igt-dev@archiver.kernel.org>; Tue,  8 Oct 2024 04:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 784A710E458;
	Tue,  8 Oct 2024 04:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SWWNxJC2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 558EA10E458
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Oct 2024 04:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728360823; x=1759896823;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=4jJ+kKexKdEyH2v4g2e7mUcG2ITIxWncfA3HTtQUDw0=;
 b=SWWNxJC2mMlPyKus4FFHTflPBSoXvRDcsArd0xoluKp+4cvGybeofWHC
 G4K09YXvAoAdqiQ4Kx9akhTNc5pRDFiesaGa0PODlXNr6PZ13R98Ss5Dk
 79pd7hZEHC0HKCLL7s76M4RVwMT8KvzrtiAxgBxBI50hGwD9F7rTcRDL7
 qg7tAN4Uq+2jvkvvQv8ALBbBCRr6MrXnS79ylXid4DAIlgkbbiJAh+m6K
 NktJJOshZyJikBESgDc5wOhGvSy32EDsvE2UpPRrL7Jb6MFGIEM2YoCdJ
 2WdhHcjECQKlH1LhSxfUu4zq8lxehOYABkIG0ixvK7m2xrIWAQG+E4KbS Q==;
X-CSE-ConnectionGUID: Vk/SEiEnSCeQirvQpbB50w==
X-CSE-MsgGUID: NM+7a1YhTQuw50eyKFhPCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38190357"
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="38190357"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 21:13:43 -0700
X-CSE-ConnectionGUID: 0xoUFiARQmqIpwbg81A/Bg==
X-CSE-MsgGUID: IQAvqCy0QUibVD365cf8jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,185,1725346800"; d="scan'208";a="80667821"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 21:13:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 21:13:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 21:13:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 21:13:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ok1FWX2xNfMFYUdKOhgGZ7pRIAEIJ9wrrnhwehgKb/w3HsykkihxzKIazG+10+qvY+7LKJsPZ3u+jzms20QAwUlBbO7EN/RIU+9ub24nDCEhcYNQw+maXxjO7dNi+3Peky/mwcrbYGS43uSFR4KLdZaLWHjTJxRLf4NucevkJZ6kDKeQozmL3hlSTCXfT3Ltk1nAkXyrvJMDKlTD3O/SoibDlvrt64EVG++tBv2rVC2UeE9KcoXu1rr9BdoP7exzmfASm5tv2U59j2ZLE2OT4zn37gqvHb98NUqQzNsjWjw0sfy+WwKibUFYIzF30hI+bYDOaNn52S5XE05TjlrHyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHxyLpGs8VTZwDegxAi/WOcDoak+bAogZ85B3wZif88=;
 b=lnt0JqNHAFywbt6k1ioICIvXfhrifqz1WvK7XZf2IECvzcX95SHVj6GJn3d+MEa5gOktfE1gXcuN44MdIfFhnIKArxkuGeTY/+0BBh93NfHvFz0hRbFalQ8PfcEWt3WhJLW92OaI+GrO3lj96sx/gxzuo0a6gVH/j43XJCjjpve32qAnHNjJKbJk8fUvd+z6jiQwB2rC7wXy4AWegYSVOK5K97INDB4F8IA39in0BODLflcmmGSsY3xHgkUI/vXXeG6klWC3USlrA7nVCIX0SseZ0AvsSfXsyYFf9KnKT4XiZrNjNKyI8jvERs/8chxeC79L838P0EA2fUP9FclgqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 LV1PR11MB8820.namprd11.prod.outlook.com (2603:10b6:408:2b2::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8026.23; Tue, 8 Oct 2024 04:13:35 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 04:13:35 +0000
Message-ID: <3b39de0d-a51f-4924-81a2-8f6176f28238@intel.com>
Date: Tue, 8 Oct 2024 09:43:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_pm_residency: Limit max usleep
 time to 50sec.
To: <igt-dev@lists.freedesktop.org>
References: <20241007172356.1747943-1-himal.prasad.ghimiray@intel.com>
 <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20241007172356.1747943-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::14) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|LV1PR11MB8820:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dd687d5-c993-47c6-4e15-08dce74f93fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NVRUMGNtN2JQVG5PbjhlRUZmSDM1WTZTZkl2L3N4VEZ4aE4zYnVMUWdBYUJk?=
 =?utf-8?B?aXluQkJyOWtXZFJYYldQN3ZoWjRUV2hJOHRyUU5mdDZyemxTQ3htazdkNmRS?=
 =?utf-8?B?ZnZEdHlJNVZadlg2TUU5ejVpNTNpU2ZJb2JJeGt1dXNKUDBaNU9SUENhNkZr?=
 =?utf-8?B?aTFRK1RNZmZ0UzI1NGlMUDZ5cjVpYnYrMkh5dlJZejlMS3VtUlZqWnhmRzJp?=
 =?utf-8?B?VVFhM1FWeHNzUHp0NDF3WFJlcXg1Q3JoQm5iYm1Xd2g0TDFIMFQ5bmFzd2N2?=
 =?utf-8?B?RVFBTG5LenJGeEZYUGRkdEJ4Ukk1MktFbjlvTFlleUVGZ3BlYjExZGYySktT?=
 =?utf-8?B?UU50dy9WTGR4WFNTQ05scDltQ2Q2dm5RWWVmV2tpeExWNlQxSVJnM2Fyb1N2?=
 =?utf-8?B?cDQ1ZHhoLy9jQWk0VzJ0ZUMrTTFuSS93bUl0WHVBYnk5OEI2b1RlNzQvQk85?=
 =?utf-8?B?NjNvRlJHL0swYWc4ZlRVVWZSUUhaUXp3YTV2VFVBcm8vRFhZSnNNdm5FYVgv?=
 =?utf-8?B?alVjcElxZmFyTEJoV0xzYWZZbHY2WUhyN2lEM3Qwb2FvNFFadGoxcTBWWDA1?=
 =?utf-8?B?RGxBVU1Sbm5Lb25jYjdWMHVuMXNVOVVxRE1WVGhoU3oxNktOd3Rjb2EyemQv?=
 =?utf-8?B?WWwranZ3VjRBZS9qaExkRllVQ1pONlNOUDdLUExwWk04bGk4RmdLeHVsdVZQ?=
 =?utf-8?B?NWEvbWJ4cjlhNWFHWm9TbGZMM3QvMGtGbzJTQmlnbzhQeFBLbkdrL3hGSjBs?=
 =?utf-8?B?UnkrUDRleXFHdld4RmpyMGNsVnc4RFVVZ3hxTUZaSFVhTjFqMmtOUE1NQkc4?=
 =?utf-8?B?Mkk2cHhocUJvQ3lxUWV6ZktERHhyUnZFNG9uT2lzeU5wN1FmbTVWVlFUanB6?=
 =?utf-8?B?bG5EUzRJVGwwZEhtOVFLY2FyaVYzSE5ON2hlaHhna0U3c0NXZTVvb1ZXN240?=
 =?utf-8?B?czJWdnNwak0vUExyQTgzaTNDeWtMMEJSYVVKdUl6bWJybVlBcDY2NU95SHJv?=
 =?utf-8?B?VFFHVWdtN1RTaDQycmRqSHF2SnpvN1E2bS9sYi9MMlNpUTFrZ0h6S05WZW12?=
 =?utf-8?B?Q2ZMNEs4YVNoVzhaakV1eTdKZnVZZ2NyWFJWK1cxNDBSSXIyeE9uYWdEMUt5?=
 =?utf-8?B?TVExaFE5T3EwMGh6bnFMWWZtUVk5enZRTlcyd01PcjE1aDVmQkxvRWl2aDlR?=
 =?utf-8?B?dzgvNVpUdzdrZDZqbXhQalBhL0lNak5uOElrK0JtaXM5RGltKzQzbmlJNllN?=
 =?utf-8?B?TVZmekVZekdiYlYyaTI2MjIvaU81TGRzQm5GNVV1Z0l5dUVUbGJOaGJEUG8z?=
 =?utf-8?B?UnlqYjEwMmJIRjYrbzV4cDU1T3pIRHEyUmhvVEllMzdNTFRleHBsaTlWcDJM?=
 =?utf-8?B?Ymp2cWYvQmFjV3MrMDg5b3BKRHlRS1Q3d2dIaC9aRjBURWNoZ2RNdlUrUkFG?=
 =?utf-8?B?UGluSyswN1Q1dEhwMklFMlZ4V2dDV0RHZGxsOGs4cjZpR01XYlcwMFRieDJX?=
 =?utf-8?B?bG1yRzhMWGxyTVR0S2F0aG0rVEhwQTlNSzJJZ1JuV3FlcGFPUEdCZGxpbnpq?=
 =?utf-8?B?ckhnMVViR3JRQVMrQnVQSUNwTm1oMTJsVzU5a1lxWUdNWnRWU1Y0ZkFPWFB6?=
 =?utf-8?B?MGY2K05rTGZwTkdJYVl3aXhUb1hjWjFDMDVYOGR5emI1Y2tZZXROcGtQajE0?=
 =?utf-8?B?d3dEajkwdzBtOW95aEhjVEFObDJSVHZRTEtab1F5VXlvLzlYZisyc0h3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk9SY1c4UlhBS1VzTDZZQkhmdWIybis2eEFyd010NTBDeHhTV20rQXgxd0xj?=
 =?utf-8?B?NTV2ZXUveWVUTmo0dWI5cHJydWdnUmIvMnorSDN1L3VnbUFzZDhnRkZsb1VN?=
 =?utf-8?B?SEdINmlzem9nR2xvRFptUkdYOWt2Wjc3alhPNVNBTnY5MFl4bDVmMlVRSEtl?=
 =?utf-8?B?WFBGZnVwNjdPTW10WVM4Ynl2enNjdnpscHdMbVVDRDJGN0ZpUFhEWmRrUk9N?=
 =?utf-8?B?M2JySmdNN2QrWGR4NEdMZWRDTW9iWGduZGh3VitlWFYyV2tuUFZURk5tc3FK?=
 =?utf-8?B?YjF4VTZib3VQeENhcHU1dzFpZjczck0rUVNYdnYzL1VQYTh6L0lyK3Y5RVFt?=
 =?utf-8?B?dzdRMDc5TmMrdFhxdFh4T0s0YnJMOGVtSHRLUXNFc0Z1bk4rYThkcm5XT3Qv?=
 =?utf-8?B?cGtUZWhHTnRISmdEcU5Ma0h6QmE1U1RaR2FpQzdNcmxmWU5FS2hGQVJnK1dv?=
 =?utf-8?B?TVZJWHZ5R1BYOFAyZ29ycXBOSGZ0Tmo2S3FVM3ozZncxS2wzL2lCaDllMTB1?=
 =?utf-8?B?OXFPaGRJbUFOa2V0OTQ0REZKQ1NJVFBMT2NNNjZNSlBYV0o2SjVRaU5qOU11?=
 =?utf-8?B?V2FYbnFycUhDai9wcVRlZGJwRTB0bUp0ZWQxakxBcWk0OENUVXlRWDBXSjNG?=
 =?utf-8?B?WkNndU52TXloWXlvV1liZVBEQ3hZdmQwVTNXNDJLTGNRSzRhTVc3OGRaRUJE?=
 =?utf-8?B?Y0ZiUk9hOWxJVkJhVG4vcmxVS2xCNzQvTWlFL2hSZkVTT2ZTMDBIUG1udlBS?=
 =?utf-8?B?cDBLZERMWWZST09XeE1YRzZudzVoM3BmMkpNbXdoWDhXYk5IeXRtSFVub29B?=
 =?utf-8?B?SnF5SFhORzViZEFpUUswS3EwcE9DbGt6dmJoSWJRMC9zZFlyb21xNGZ3Tlp4?=
 =?utf-8?B?QkJBZkhCTmNOK1lpOEszN2N3OVVrQlI3TC8wTkNQa1hBczJFYmV5cDRuUmNM?=
 =?utf-8?B?Ulcya0N5aXEwZVhvL1NIWWNpNEtsRk9YYzQ0YW1USFF4S2N5OVR3OGRrSlZx?=
 =?utf-8?B?b0c5a2l1MjBJd21GdkxzZ1hEeC9MQVE1VER3dXRTWXRWZjYreDgrVmlFMEU1?=
 =?utf-8?B?TzRMWWs3SmlHcWlIenJBZUxwMFl1bzNlNTZtQWZvbmlLK3BueHZyeHZrbi8x?=
 =?utf-8?B?SlhtUGdOZXgxRi9ienVEelBRbWVVdXV3MWozZDA3VHlHa0FqUXNiZHpBVGRi?=
 =?utf-8?B?SzNKdTgwWWpzbUs2YlhzeGxJb2gxbEJ1SHd6N2VrUnN5SVZjU2JxamwvZHpr?=
 =?utf-8?B?YkdlTXNaR1ZHTUcraGNvRXVaeW4zWEk0NFJ6clNDSHVyQ2l0UXdiMFQ1Y3Ir?=
 =?utf-8?B?MGorUGpzTjlTSFM5Z2ZwQVRVV1BQVWpDN1B1bitPcGs4SmFqL0tzRjBxeUky?=
 =?utf-8?B?cTB6VndSWXllSGxLMS9oeTFkQi90TVlDZDQ1bktLSXJJSXpldHE3Z2JhdVY4?=
 =?utf-8?B?M0JaeVgrOFpwdTB2cjgxYml6ZFFJaVFWK241MGJHcy9DdnVzYk9IRGl4ZXZk?=
 =?utf-8?B?TnpiS3R0alhMeWlZQXZWWTJnMG85eFhpd0ViZnRLR2JxN2JXNC82Z0Zlai9j?=
 =?utf-8?B?L1JSMTE5ZVNQY1IyVkJjY1RqWUg2dkVsbEUzRnpRWFdUSFloSW83WUMwL0h4?=
 =?utf-8?B?eEV4aUxXZzM4TWYrejJidm8zWGlzL2ptd1E5QWdaTmp5RC9SdFQ2ME5Ua3lJ?=
 =?utf-8?B?Mm9BVnBJZjJDTkRkK1RlUm1Rd1o4dktwbysrRUpKVHk3R09MZyttWlh2V0Ez?=
 =?utf-8?B?dzNPZnBydEo1ZkpNUmFuWHpKWEJkL28vWG1xajRleUFzamg3eUQrR1JQWDRD?=
 =?utf-8?B?MVJyMzMxc256Y3dKUm8zNkFmb2V2SXJIaEpzMDV2RFdsUGtCRG5rZU8zTlNQ?=
 =?utf-8?B?aCtIWVZkMlJqL1VHYi9kRm04TDBiYVRsUWZubnhLOGMzdWxzZFdqc0hRWmls?=
 =?utf-8?B?TkhHT1dVbzNiZHdidGhjWG8yQk81UCtkTVVLZDF2b3VTaEkvYllGbGZQeDgx?=
 =?utf-8?B?dFZhVHB5dXJPK3lENGViM3Ezb0dTWlVXTlhVcGhHYVkwTVdXUUpGVzRnc2Ru?=
 =?utf-8?B?ZXp1T05YdmtjOVM0RWJFZmJaWXZTdXdvMTk3YkRSYXNyc250U01lZWlEdWxu?=
 =?utf-8?B?UlVZWnVrc3JJK1V5K2IrZlBnVENkMFU2YVdmTFFIK3cwMWVKNzB1cVB4UmVT?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dd687d5-c993-47c6-4e15-08dce74f93fe
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 04:13:35.4436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NmLQ2jtDvPuVTBEGM4NAu7x7nQSet8B4wifateZZrITYTNjqzJFX0P7Fi9WMSz0co9ufZjKWbdgcqXzsS05umw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8820
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


On 07-10-2024 22:53, Himal Prasad Ghimiray wrote:
> There may be an approximately 1-second delay between xe_exec and
> xe_sched_job_run, which could result in the usleep duration exceeding IGT
> timeouts. To address this, limit the maximum usleep time to 50 seconds
>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   tests/intel/xe_pm_residency.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_pm_residency.c b/tests/intel/xe_pm_residency.c
> index f4d05889c..a86107eca 100644
> --- a/tests/intel/xe_pm_residency.c
> +++ b/tests/intel/xe_pm_residency.c
> @@ -150,7 +150,7 @@ static void exec_load(int fd, struct drm_xe_engine_class_instance *hwe, unsigned
>   		 * Execute the above workload for ~1% of the elapsed time and sleep for
>   		 * the rest of the time (~99%)
>   		 */
> -		usleep(elapsed / 10);
> +		usleep(min_t(elapsed, elapsed / 10, 50 * 1000));
This will sleep minimum for 50 milli-seconds, usleep takes time in 
micro-seconds.
>   	} while (!READ_ONCE(*done));
>   
>   	xe_vm_unbind_sync(fd, vm, 0, addr, bo_size);
