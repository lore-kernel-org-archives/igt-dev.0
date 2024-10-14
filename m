Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D69DD18151
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 21:47:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4406D10E4D8;
	Mon, 14 Oct 2024 21:47:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="homkY2ex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100BA10E4D8
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728942439; x=1760478439;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dg/QdVTLbxusY6iDeUducTVkfdi/b4yjTzyCMOGi5g8=;
 b=homkY2exWK95yuhLxywqbb0Xz1IrarYhffnwb+BiaKkIOfUYquYPWTmy
 v/AnHQ3jvcINvf9WGmV11qV0Jdf+WJ+v92iA18YhTI1UJ7/qJStlPXq8P
 5aygoBovIcOEN7hKh/BDjw8aUOs0qXswZwp6yIgPgQz5eFLQftABt8xs7
 pXb3xowpQIhq82+VzJRKsBGC19bHQB7rhIdZfTT7Mf1NgFGSMd7pph51B
 PmjTkVtq20AYgi6Ou1gXknl9kVspC6CWksKUsq9Nt0I39YUpjAO0Pq5XI
 0G6t0ioRaXsmPEkr3bB3wlPLWPN+eUf3csGr9sK4D0MWk89Nhta5FI8y1 w==;
X-CSE-ConnectionGUID: GJfzbM6aSh6abJxtGf1Tjw==
X-CSE-MsgGUID: PngG1Cz1TDaoCO3xH5SRUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28268705"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28268705"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:47:19 -0700
X-CSE-ConnectionGUID: 7/YHClKeRRCRqx5UQsBqLg==
X-CSE-MsgGUID: OvJX+syBRWGN9XyatE+lDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82727160"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 14:47:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:47:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 14:47:17 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 14:47:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 14:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enTuBHQG1Ek9ndvRV+irDwu4CnuE/I1ic5voYkAyA5w4xfs8dIOwmMycBHGzFrPC9kBuf6V9r5tODXgXp+q9rrK2W7MkUkl/N4zv0n2K3n8QeGfLlcFv65VIj7JN47+HpjjQ9puKqxJpqLt2ldUHDUhaTIdtJF82/7kWhaB7/s+G58QVuEbbibXhcdNrbX0AbcVue++ddLGSRHWIu7XN10ob4wbxTYFQyRqZ3HjZwLayhuuKAXZSa+uwcucPfVK8MqgvQ2Eh7S+JCE+zTPrNBSHHRjRMi4r1tI3nIyUF7+bupyJucdX4KObYLxWrI04wOrdZ948YGt5ET1AIYuXkEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwqNPtG5CNN6c9LAWIOKed84mJQ01BIko8TLje9IM6c=;
 b=vJebuB67bkZecjFxDY/xt07qrijMyHCLjgNC/x1KaG39Qu1AgA6laa0eaIykeqBhm/tYvIapJnRitwGvQR5wKBmCSvl5hPwq1dJNVOOohBhCIdyY+ZBmQ/0U6KV2FNVYSFZcslXsNepV9NlLw1rB80ve+YlEXQx8jo0ffsZq5pO6L6lT1OSr75Ctd5HXzirlkvAAvZN6wfJ//YKCdWB37uVgt5gWnR8EYE+76KYso8rksGEeoSiU1glfO4Z69EpE7/H8A62HpxaDG8wF+VsnBogTMZtO0OzHeogHTx+ZRyLBUBeb/6IQdCl3d6YXv6PW4+frcJMqYsEcXu6HmoDAIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH3PR11MB8660.namprd11.prod.outlook.com (2603:10b6:610:1ce::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Mon, 14 Oct
 2024 21:47:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 21:47:15 +0000
Date: Mon, 14 Oct 2024 14:47:09 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: <igt-dev@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIEZpLkNJLklHVDogZmFpbHVy?= =?utf-8?Q?e?= for
 i915/drm_fdinfo: Quiesce GPU prior to running some tests
Message-ID: <Zw2RXdyJH2av8ONC@orsosgc001>
References: <20241002212049.769042-1-umesh.nerlige.ramappa@intel.com>
 <172801766374.1172277.11953781463943816824@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <172801766374.1172277.11953781463943816824@2413ebb6fbb6>
X-ClientProxiedBy: MW4PR04CA0343.namprd04.prod.outlook.com
 (2603:10b6:303:8a::18) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH3PR11MB8660:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d8fc97-3550-446c-9bd7-08dcec99c4a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTNPQnFSRTljVk5XemJwbW5GSS9TS0owMmoyMWJEektqai9hbFAxT0ZmakQr?=
 =?utf-8?B?a1htR3UyWm9pWVltNTFiOFE4Vk56M3lnNStmRUYybFN6Y01qTFgyUTZBWVdQ?=
 =?utf-8?B?ZHNEVHI5aExEMER1Umg3aVdpdjRnMng4akxnWFZYU25YamNrTzZacVlFZVE4?=
 =?utf-8?B?TkorejVpZ0tUMW5heFEwei8wUjdNeHR4aHhoYnAzaGVCdjRleCtGNmpqZ0FQ?=
 =?utf-8?B?ZzFTb3FadDVTZWtGOWhKTmt5bDJyY2FKbTBRUTFFWkRNWnUwdHM0dUNHSTR5?=
 =?utf-8?B?M1AvMkIyc3VIN2VHa1R2WVY3NEF4N0VFcTlVNFozM1pwbTZIUi9kOE84bHlN?=
 =?utf-8?B?SXFqdVg4dUc4elNYMDE2NE5nZ05xa1h3eUlNUmRTSm03cWVyL2hrWEJOay9k?=
 =?utf-8?B?cHVwZXMrbUJJZjRQUllpOEh3Y1RqSW1xZGRabi9SUDA1NGF5UVQwV1N1VW5Y?=
 =?utf-8?B?V2xOWHc4VGFKK2pqblg3eWpSOFZudWhtK21zN09qbmJHK3I1M2wyTXVHZUV6?=
 =?utf-8?B?ZWxqNXNnZG82YnkySnpZRDdvUmNuQnJtWU14VjJIdmp1MWRSVnRDeWdaVi8r?=
 =?utf-8?B?Qjl1TWRRQWtHa3V6ZFUxQjdoaDFvM2hUQXZWYzlEWisxWUVhd1M0SkpFeHAw?=
 =?utf-8?B?dU1zbEQ1cDBpcUlpS05jeTQ2a0NnczhQSFN6eSs1cERTUmZBNnBQdWxWbHpi?=
 =?utf-8?B?QU1pOC85NDVOUElUMDduOWJPbVBxelc1cUFQWVBkTGdkYjNZZERuMUxhaVpJ?=
 =?utf-8?B?NDR3aUdwNjZKNGFPYUtZVkZiZXZSTytQRDRyTzc0ZXdSNVJyWDRuNzhiMkxC?=
 =?utf-8?B?ZmtYMk5LM1NxVERUdjZMeTY5R01qMGhtZDNGdnY4OFc0UXlqRitoeTd4YzBX?=
 =?utf-8?B?WXZRZFNSVXkrZjFqZkNaYVRiNE1sZ0xiRW9IMElVTEZzbmZpS2RiRmdxY2dD?=
 =?utf-8?B?M2hBU1B5VTdjRG9ibWN6bzcxc2R6ZXJNRk9xMy9EdEdyQkJUZUo2YmttWitP?=
 =?utf-8?B?eWFpU1NXWEFzcDJtWlV0ajFSRElwWUFzVVo3NlVudithZ1JiYlZvRDcyWnFC?=
 =?utf-8?B?YVVhRmVmQXkvSEFqMzhRZzBiZHpGV1lTMjBOa0UzeHQ5QzRLKytycTRVSzBk?=
 =?utf-8?B?V0hPaHR6ekRHSDdiK3pSRlVsbmVwZVB0eVB4Y1I3UDVBZXUrTGRFMnJUcGYr?=
 =?utf-8?B?c2NxL2o2R1ZTWi8rcXhEc3JKbFRaRUFjVXdDOG9IMzhUelM0dXNsV3ltWEsz?=
 =?utf-8?B?MWlWWjZkQzM5QVIreGhQb2RrMlZLcmRuTEtqS3ZtZnZXQ1RNU0dPSFBoR0lG?=
 =?utf-8?B?V0o4V0NPbytvSDdRWG13SlB0anhFKzNEV09HWWM4eGFrRVZyeDNzS3RLRkNO?=
 =?utf-8?B?L3hzYVdvMUpETGJYZ2o0K2psakNHaElLQ3dUVGZVc2p2SXdNVTc0YjVjYWxC?=
 =?utf-8?B?YnA3TDVlS3NrcmhUdm5lc0RPUTdGUGI0dzNJM09BQmFHN0E3elpkamo4Wnlx?=
 =?utf-8?B?V0JCRjgyRmxxdFN2VitVaEpGYmhwZzZ1aUlEaVdOckdOZ2p1aGd1VFlVUlFD?=
 =?utf-8?B?dWVYNUM3LzBmbEpqbkpnV2E4emFSVGFrN2NSeXRsSDJZZU5NdFdZQkZhMkxm?=
 =?utf-8?Q?TvFJSTaSXiAcCu1K7I+smfd6ZB6jiCles6Qj+KZWwF9g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elAybUR2SnFVZ2FqNUk5Q3NsMWhOVVR6ZG5GTjRacnVJVXhBTEh1MnZ2WnNn?=
 =?utf-8?B?SUFZUHJKZ2xvQS9XZkxONzQvYlVTKzlPQ1h0TEVVcHUwYTVtVWNHVlplMHVZ?=
 =?utf-8?B?RUJtVnNEQWZZRFdvZXR1ek1sL254c0xYT2xHUDhBZDBWT09FeERYTUNtcmh0?=
 =?utf-8?B?K0pCUHhDK20wamw4MEtSWEQwb3JiQWVSenZhUzg3d1VSZ1B4K0NPdkRqRXFR?=
 =?utf-8?B?d0FmeUV1SzZHY05XaXBFcnBsUHl2WWtYVm1DSjNSUzBtNEJET0VzcVhOVUln?=
 =?utf-8?B?d01NSkpIRFZJb3JtYkc4bUV0bGVmMTVqaEQxRFVtb1pHZDRGbWR1dWtSSG5Y?=
 =?utf-8?B?a1BxWmtnaTlNc3p3aG4zVHdzZGljUkZ1eTFhc2g4WWU4Um1FOVBvdXVaaHN2?=
 =?utf-8?B?Z3JVQ2pZOUdLUnFzUUxJNmZYL3dRVHlVWW9mNHFqK1NJUFIrMW4yYTRtVE1F?=
 =?utf-8?B?YXpNMjkwUVNiVGVLQjBjNkFuRUFTeTZDZHdiTmtUcE5WUGJNaDV5UG9tVUJI?=
 =?utf-8?B?VnNUWHlFTE5JMC83VS9OVTA4ZnBIeGJkcEJMUkkrQ0dhdEI5SW12MHpwMEVM?=
 =?utf-8?B?bXBxOGhMeXpiYzJSWjM4R29XOEhJdVBOd0hBNTlDZDdwYk81Z3BVOC8vM28z?=
 =?utf-8?B?bFBkdFlVUGxiL0I1cEVjZ1JRbDJjeFhZK0JUcERVdDg1QmVHZjd2WWxxVVFI?=
 =?utf-8?B?MUFHSjNkTmVWK0YyMms0NXhETXdtcWx3ZkVpb2wraFo5eFU0ZGQ0R3dEMXU3?=
 =?utf-8?B?d0dPT1gyVmFXZUdyVFFhOGwxRW05RXdXaGRUNXF2Y2I3VEQ2eFJ6ZmZ5aWpZ?=
 =?utf-8?B?cmQ2QURpTTE2bEtwV1ZFM2F4c25sd2t0ZEhOb3UvMjVxWnNQMHN5b1V6dUNK?=
 =?utf-8?B?dWdiQjI3VVdFeTFIM2VuUVFRRWxvVUV5d215SXkyNW9XMU83bXBRZzdlUDJm?=
 =?utf-8?B?MCtXbkNkQmV3cVpZdXZmTElFUTFpVFNuSmt1UUJkNktmNkU4WmFZcit5eEJO?=
 =?utf-8?B?TTdTbjI5RWhidHNQaml6MTJ3bzVnMERySjVYc3YvZmtjUW1yM2ZFdEI0cW55?=
 =?utf-8?B?eEk4My9EajdyQUtHS2w5S3EwYy93K1podmFDQTRJdHl1QW5iS3ZFUnNlV2t6?=
 =?utf-8?B?L3FhL1hXd2N6QVRZTXNrZXJXREV0d3NoUWFEVjBtYkxIUGJBVmxOdmhEY0xt?=
 =?utf-8?B?Q1R0ZXF0MFIwMmxybWdDTzlTOEFyZ05jNlE5VnlIYzRHZU8vOGNEQnNJZHgx?=
 =?utf-8?B?UkIzbVBNUlpFMmFBUTJMelNBQmRvTFVRL1F0UHJUZ0NDSXkvcGNBOWE3NDNw?=
 =?utf-8?B?bW50Z05uT1RMNTBGQ3RkSC9KY1NYR2h5T1RFSlU1ZXg1UjBVRG9PYWpRaE5N?=
 =?utf-8?B?cStkd3RSLzU3MjRHSUpwdVF3MlZneUg0RzVvUVNhK240cGtETnJEaTB3N3A3?=
 =?utf-8?B?dElxclQ0RUhNUlRWU042Qml1LzBYZVo0V0UrWUlBVFViZ2ZtUG5QSE5tSlJQ?=
 =?utf-8?B?eERvcnZVRG05UFVRVW1rNWNSNnd5YkY1Uk50eENmVzFmSmJKSkZTWUYyS1RC?=
 =?utf-8?B?MndQSXE4aVVhRlhFV3l0WUxUR2lza2k0UGQ0dE5KZXhFUm5mQ29MRHRqTk02?=
 =?utf-8?B?aWlrMFBueTdqMjRWY0s0T2lWbGdxR2kxNzhzQUVkaGZ2ZGZJNVI4c0dYQ0tC?=
 =?utf-8?B?eFlxUXRrbzhkMTBQbHdWNXFJOEd1MXdmYVFNMjNpdFlkOVNGOXhralNVVGFO?=
 =?utf-8?B?c1JoRXloSmNiOU4vaWU4NnNsOG5qSzVsRy9LQmg5d0NPYzFZT0tSclBaTm9Y?=
 =?utf-8?B?V1dJaHVnbXRjNGpkZjZHNlkySXQ2Z1hwY2ZOYllVb1RNMDNvUTZpcU9ZZktu?=
 =?utf-8?B?TW9oZWJvc0dxemFZQzRSYzBiMjdMZXI2cllqQmhCWVFWdVE2ZXlUTEp5ZDYz?=
 =?utf-8?B?aisrWk9iVnpFdEhMWUQ4bXpmUFJnR1lSb2dZVFBRYzdqTVcwQXNKSVdtM2Vr?=
 =?utf-8?B?ZlhLWlVkOXo3NndyVDZNbFBWVjNkdjNqRlgrMC9xQmg3RHdES1VPMWxwMkNH?=
 =?utf-8?B?VG4zNGFSTC9wS05RVFBnKzFPaUViTWJDSmliMUZHbXdFRWRIZ3A4TzhoUXow?=
 =?utf-8?B?SUhVaUdxcXZhRml3Y0Zpc2NESUYwMnhML3hNUnc2ZjZuS08wK1htcmp3NFh2?=
 =?utf-8?Q?u7uasOJ4SNvYpBDv+3nSED4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d8fc97-3550-446c-9bd7-08dcec99c4a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 21:47:15.4106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bCaVJ9fr9UDcSHftYJ79FNOr2Ly6usv+39Wcagq99ZH7gkFGDxoNxZgj16Ie0pL/PSWi26YNgTVVG9qcMpkOlbafdOCWF7xYo27ngfemk4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8660
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

On Fri, Oct 04, 2024 at 04:54:23AM +0000, Patchwork wrote:
>   Patch Details
>
>   Series:  i915/drm_fdinfo: Quiesce GPU prior to running some tests
>   URL:     [1]https://patchwork.freedesktop.org/series/139451/
>   State:   failure
>   Details: [2]https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html
>
>          CI Bug Log - changes from IGT_8050_full -> IGTPW_11859_full
>
>Summary
>
>   FAILURE
>
>   Serious unknown changes coming with IGTPW_11859_full absolutely need to be
>   verified manually.
>
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_11859_full, please notify your bug team
>   (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in
>   CI.
>
>   External URL:
>   https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11859/index.html
>
>Participating hosts (8 -> 8)
>
>   No changes in participating hosts
>
>Possible new issues
>
>   Here are the unknown changes that may have been introduced in
>   IGTPW_11859_full:
>
>  IGT changes
>
>    Possible regressions
>
>     * igt@gem_exec_balancer@nop:
>
>          * shard-mtlp: [3]PASS -> [4]DMESG-WARN
>
>     * igt@kms_async_flips@alternate-sync-async-flip:
>
>          * shard-dg1: [5]PASS -> [6]FAIL +1 other test fail
>
>     * igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>          * shard-mtlp: NOTRUN -> [7]SKIP
>          * shard-dg1: NOTRUN -> [8]SKIP
>
>     * igt@kms_cursor_crc@cursor-sliding-512x512:
>
>          * shard-tglu: NOTRUN -> [9]SKIP +1 other test skip
>
>     * igt@kms_joiner@basic-force-big-joiner:
>
>          * shard-dg2: NOTRUN -> [10]SKIP
>
>    Warnings
>
>     * igt@kms_cursor_crc@cursor-offscreen-512x512:
>
>          * shard-dg2: [11]SKIP ([i915#9197]) -> [12]SKIP

The failures here are unrelated since the patch only touches drmfdinfo 
tests.

Umesh
>
>New tests
>
