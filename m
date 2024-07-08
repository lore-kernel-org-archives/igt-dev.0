Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDBC3271E
	for <igt-dev@archiver.kernel.org>; Mon,  8 Jul 2024 11:02:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4500D10E0D1;
	Mon,  8 Jul 2024 11:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bxCq9F7k";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD92610E0D1
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Jul 2024 11:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720436539; x=1751972539;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ai0zj+XT0obQvy+Pb6X04+0E3/seRNz7K8gSTmUoZV0=;
 b=bxCq9F7kgpu6hsfS6dkgH156tFWGjWS/3Djs6Bs9i8YH7FqjsaNJVs6u
 NAl06JrO4n+qHvLY4ViYL4+1jhsoSU+rlaLx0UM/nM88KG5zge8rUtGAu
 8lRgzVGd4R0twTIk3lgB9iJ0ySBgUrkE57e8g+DKS5X/zQ5lDB63A17fu
 5BNWfg9/R9ssmPFeqUSZ4z74RbYgCpunip5C90rUQqeuAU6bInNtDS9sU
 MVegt+hMGBE0aho/IAbsTdT/cZ+zH5ydh5ufSlR76DZmZVEGkNoC8ncpJ
 77iYrVMBIlcJojLkRCPfM5ckShgXG9eY+H6jf4zez2xOxIjdwsgEj6s1P g==;
X-CSE-ConnectionGUID: Eh9HOwJTSM6VCTNvyujrAw==
X-CSE-MsgGUID: jjJoXGEVQae8qstRVQBcww==
X-IronPort-AV: E=McAfee;i="6700,10204,11126"; a="17586343"
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="17586343"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2024 04:02:19 -0700
X-CSE-ConnectionGUID: JUfCE3yzQlKQXcbdyfteqw==
X-CSE-MsgGUID: OolRMKZ7RaSNQ5xFUhhbgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,191,1716274800"; d="scan'208";a="47392321"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Jul 2024 04:02:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 8 Jul 2024 04:02:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 8 Jul 2024 04:02:17 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 8 Jul 2024 04:02:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2WhKoEXhC5UrkootO2v024belLSI3Yjaf6gjoeZK0/pQC/FhNLKfxlwwrnHZ9tvxDtfnIk3C+XNysNhzvMlQmFeKlqLqAQMauGyL2XlEub0lFykmNqOzGNLoK15pe5cS9nVT50SbbUbLtF/R+duzS0JI1TSN+enYB52gua0x8BlCIRKAk2aba8+BYQEHG1JAuzDeJw1naW5mtAjQQ86FjqDSoqJSZJFOv3sdU+OMe48VPX6PdH24vO3yBjeES6nFitdgmkxxaAxqfdEYZr3u2c7vCgXqPsz4RtaXRO2HsGwiC8f+nJSUX5JRLZD/JZgJ3eSzciXsuwwTvjCBAsEJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWrRuEgVTLLy3A+a5+cH2onv5yzauNxxZu8e1HfnLv8=;
 b=MTLtPruoF8kEz1LVlTFRoH4I5/k42slsjMraAJyglbD1k84YPzUhOv6v091fCxQA28wQSVIemfTHMzyYqHCI379+xfXfkLPLq9j9rqF2AUaYQ8x+LwUYhOUx/rXk+rMTgrc1YTwtBo/Lyx/0YOHZ3z/VegU5tireMNHrUZR59HAE4/SJOofiGM1UQ2Nlr3yIlq2xG8UBZ/cUBq+IIWUFaAr0KiRUBNGtMqgPSd2Rm12BHC9B7UaZnGL4WJ0rTR5iWANgCa+smds7OrQEnykEoRfKkKR+x+b5fwtITHnb7xdFJzdu/fBYvlTItJIJYhiFN5ojnoNiqnU9Y3rMi8JxHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Mon, 8 Jul 2024 11:02:14 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 11:02:14 +0000
Message-ID: <ae3be4c4-c4db-4bcc-a4b4-60408d7b9805@intel.com>
Date: Mon, 8 Jul 2024 16:31:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_atomic_transition: Reducing debug
 loglevel dynamically
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <kunal1.joshi@intel.com>,
 <sameer.lattannavar@intel.com>
References: <20240707150457.715471-1-pranay.samala@intel.com>
 <20240707150457.715471-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240707150457.715471-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|SJ0PR11MB5199:EE_
X-MS-Office365-Filtering-Correlation-Id: df0dfc0a-ea80-46df-d74a-08dc9f3d6c71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmZEc2pFOUNPdGNDaEQxNWpFQllTT1ROVjljTm9yNmNiaUkydDZKSDRkV256?=
 =?utf-8?B?QllZZlBUNFNDOGZpaC9rdkpPRkd2NTZXRG12ck9OQlFUajJHdTlXWDVRN2k5?=
 =?utf-8?B?b1FYSHNqWVVKcmJFNWpXWFk1L2k3UzlxUWdFSU5BL3doRHBXN3hFYVo1dzBC?=
 =?utf-8?B?YytvMjFKSHRDSUhsVUVXTnMvRGpGcGZCWXdNd0h2djhRQzUzeSt0TG1mVmNH?=
 =?utf-8?B?enhiMFAwMVMyaEZwYnZ0OE9mdExkdXhCOWhuenduZzJTb29DdXlENTIxNjZS?=
 =?utf-8?B?SjZ1WDI0SCttVWFHVVI3eHpqem5YbWdyQk1HMk9UQXo1ckxUTVJNc29CRlhM?=
 =?utf-8?B?c0xkeVg5Wm8vZHVpd29qWkVRU3o2MnV3OTE3d1hyYjV0RGJpYkRBK1d1NWZL?=
 =?utf-8?B?Z3g5MFRUVExpU0xDcU5YYXdKUGFWSldQcStBKy96WWhqdVZFbk9Fa0sxM0Ew?=
 =?utf-8?B?aHg3OWZaeDE3alN4Qy9tSGlCOUtSdFlnenlYekVmZnFkYjRVZFcxYVF3S0t4?=
 =?utf-8?B?ZGtweEowM2tjNkFFaEU1R2ZQMzd1WlJ1RWZIaklYcVB2S2xxZFRLeGZpVi80?=
 =?utf-8?B?R2h6OWMreWUzODNacDRxdDlBcDh2b05vZ3NWU2dxSkd1Ynp5d2dIMTdZc0N3?=
 =?utf-8?B?SVdlWjBucklUMmtzUXgremtQSC9ZN0EraTkyR1BKNjJaQkxmQUtEOEVGRjNw?=
 =?utf-8?B?NU03dWdzM0djb0gyOGU2b2Vtc1NHcmoxOEVVT29RZlJVSVNlM0liZ01SeUgv?=
 =?utf-8?B?K1J4MEFXcmsvLzcvSk5SKzNCOExVUElralhvRkkyT2p6dW5OYVUwU09jODh6?=
 =?utf-8?B?RURObTJQRyt4eVBkZVZ1T0M0cWVaNlNjNXJJV3hzS0FRSGxDYUJtZmxFVHYv?=
 =?utf-8?B?cEkrREFPYllkMXdIK1hQMVd0KzNXYk0yNm0rNFlDZDdjOFp5OEdkZ2plbFZX?=
 =?utf-8?B?YVRTVHBUdlNUdmNTQ05SaUFjVU1kZDlBd3NYUWxXWFo4MnJia0hTK2RGalBL?=
 =?utf-8?B?WTJ3Rng4OGVrVHVZS3NLMUgvSno5WkdTUTVNTlBJaTlza1E2RDJLRE5Dbkky?=
 =?utf-8?B?bnRYcnd4eUY4UGlKbVdxWUJIeFRGUDJ1WHpSR2Uwalp3bzJCZWxZM0Q1ZXEz?=
 =?utf-8?B?alROS1JvdHVmaDJUZEl1dlNVY240ek5tUC95S2N6YXFPRVRTQlB5a2ZHcnR0?=
 =?utf-8?B?ZTJlRHJFd245SXFwQ2MrWVVmMElKcmFtVVNiVVdtQXRGRTFFYi9kYjJJYTRx?=
 =?utf-8?B?R2V1Z1NjVlN1bzBaeHRnY3ByQjJHY3ZqYU5mYmNHMlJFLzczZkdwTE1Yaytx?=
 =?utf-8?B?TkFiTzI2ZXkrMUVaNkk5aUF0N3NHQzNBOFhGZ1dsQUdtUEMxUVhGeGZhMVJP?=
 =?utf-8?B?K3o2dHExd3FFSWxSMGdORFI1V0s3K0JlVE1JcEpiNjhzYWlzS05IMFNPelU0?=
 =?utf-8?B?alA2UzVqditPdFJUZWkvSlRUS1pzY0czRS9YVWpTWk9vN3lWdmVqc013RU9V?=
 =?utf-8?B?N1lKZm1wRHNQNFBoMm5rVkhWVndyZzVWVGQ0bWlDOGdyZ2dRL09PSkNxZjBv?=
 =?utf-8?B?Z3BJYmJxQisxKzJzWG1oU1JQOUw2YUJaSHVudWZhQU43TXZ0MDFlVWpCMkdC?=
 =?utf-8?B?TjRDSUtVMzhQVWZBbTVVYWo5bncyc3hiOEpIODE0cUlTS1cwZFhRRy8xR0Z0?=
 =?utf-8?B?ZEdoY1BTTndlaWNjZ2V1eURpbEQrUXp0LzAzN1c1YllOemUrajZFQVV0elhx?=
 =?utf-8?Q?z8TnECXEzFCp/M6Xmc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amdpTU5Jd0ZldCs5T25jNTloUHg2Z0ZpSGlnWWFnWmFSNXQ2VlpLSXoyd01J?=
 =?utf-8?B?MzhvNnp0R1Z6Rmg5dysrNTU5U3I1R01Pb2kzUW1JR0hHTEFNWVIrRnp3dnIv?=
 =?utf-8?B?eE1Mc1QwRlBKUEREQUxtSVN5MGg5MmNnQ3l2dVFraE1EeU9ROVRwa1FnWnd3?=
 =?utf-8?B?OFl4RndhaytQMkorL3hNZFRaQ3MrWnprZE5RUTJwdG5pVFBCc0wyRWVid3NQ?=
 =?utf-8?B?cWJPa3NMZVlxYVluM0Q0ZU4rRXpUeXVDZ2lYZzhsdkZXaTY4dWs0WHUrSGNm?=
 =?utf-8?B?bU5LVEdiTWZ6MHR6S2ovUVZRMzhNN0ZNNjAvaFNrOGNNSFFhSitzZ2h1cW5n?=
 =?utf-8?B?Y3Y3WitJUGhGbi9Xek1KZWhtc0dXbDRlczFveGdVQkU2MHQ3UXNJWDRYa3Bi?=
 =?utf-8?B?dGpUYzNXdzd1NjhXL1VKTjVFZndMVlYxMUhsV3hNTS8xekhqTk1hTm8wNnRh?=
 =?utf-8?B?NVo1MWNXb1I0dURETTRndUowS1NlRnBiUXZFN015TlkzaEFxbkRYYUpwQzND?=
 =?utf-8?B?Y01GWXBVVkZrOHhKekVKOFBHMUUrL2FWUS80aFd6RXpTMFRGZHRkemRZSTJG?=
 =?utf-8?B?RUhMTVJudFJGRWU0Qlk0YWRZZ3M3aWZ4K3NsN1FaQzlEd3dxVFRXZVZ6M3Ay?=
 =?utf-8?B?OEV2ZFBNSmhuSkVEYzQ4dGdwQm0zN2xwdlNPSFl3dEdFWTNaUnhWaEsxU051?=
 =?utf-8?B?aytub1RadU9tMHBZV25ncS9kRitqNmVPbVI0czZONzZKUWJaeTNPVERRY0hP?=
 =?utf-8?B?WHBGMFhvaWxhb1hpNGo2MXAzbWRjb0piMjVVVHhlMXEreDJ0YWRVaFNqUUFO?=
 =?utf-8?B?QzBQK3IxdFhPVnpXa0gzamhyckFsU0JrbFA5RUlMM0taVE01d1FkSnhCN2pm?=
 =?utf-8?B?UGlXcHMwVm5iQlBpNmlsNmZHMHAxQ0lnZ21CdTZDMjVFUHcxbHVTaHZIMFIw?=
 =?utf-8?B?OEpqSEkxMjRuRFAyYitPVzEwdjNJZ3cySWVyZ1FKT0UyVUdQMGU5NVB1YTR3?=
 =?utf-8?B?Y1hEWmtBR3BSTXJnNTU5cnJ5bnFWbS9ac0s2NVpHMjFXR0cwMmJzY0V0NHUy?=
 =?utf-8?B?cU81VGkwNEdWS3lNd0xuNllLankxQ1BsVk1VaHJBdUV5cFo3czZxOHNKVXlt?=
 =?utf-8?B?UnBJdWR4TEJUNFZ4c3RlaFEvSDNQR1p5dVEyNFhYK3NSamlnVk10NkwvYXNw?=
 =?utf-8?B?Um9WMXdhTzdRdVpoZm5GeWFHdjlvZlBRcVAwbXV6eHdLZDRmM3ByQTd5ZTN4?=
 =?utf-8?B?dWFJRXd6NUg3Q2xZa1RpWEJkWDllTnZ6amVIa1Ivc1FXY1BvdDRmQlZDNEpz?=
 =?utf-8?B?Q0FjN3hKNEd5eUxobGJaNmxvYUtoa1hCUHZDaDgxWlU3RjdDMjF1TlAyNFRk?=
 =?utf-8?B?TGVBTnN1OVowVUtsZ252T2U4R0krMmM1Y2JUNVBRbmpSTDFiNjA4MHJDTDYy?=
 =?utf-8?B?VkcxOXVHQlk3dW5qUjR1YzVKeG5Vb2NMSERTT2I3SW11NXh6OVNjWjBjdGNZ?=
 =?utf-8?B?eXJQV0tzSjZkUVZGVmk1c1lTcnVVTmsray9ZMy81b0ZVRDh0N2h1UXB5VFpL?=
 =?utf-8?B?dVhvSDdqQytEVnRTbWdGVjV3TG1UYmMvbC9FV21vbGhIV1BiS0o3Q3NQYlBW?=
 =?utf-8?B?U0hzOHRmMVZnWXB2b21zME9tS0p6R0xHL0tjaEtFdTRiNlM5dmZnaUtiWW4v?=
 =?utf-8?B?RXJHeDVUclVDcDk2NDlwS2lYVWhQaTVCN0x4MVhvbnhGZzQ1VVE2bEg2NGNX?=
 =?utf-8?B?bHdUYWkrWFh2amQ0QXpab0RUM1hTaG81MkQwSFJoaWtTLzJ1bmh6NXhxeHRr?=
 =?utf-8?B?VU9FZ3VnR21uQUJGeTNRRW9pQWczajQ5RzJGMDN2Y2w1MXk5MEJ3MzZ5Z1hy?=
 =?utf-8?B?UFF3bnJqQWQ0V0cvZHpTYmdMWDVMT25rc1RlN0NtKys4ZDBOOGN1SlRoTity?=
 =?utf-8?B?eHhUWmwwOFhva2RjU1lFVW9Ld0YvYUJQbkdXQnAraFFXc2RaUnpMaU8zZml0?=
 =?utf-8?B?OFZ5QzUrcVBpYk1kZ3dHL2pHOVljWFhmeDF3SWh6RW9tZ0tVd2RrUWFvL2w5?=
 =?utf-8?B?VWVqOWQrTXRTSHpQa1ZCVmp3SFBrc3Z6SkpMTjQ3dmNKNUUzM05nS3pwTkp4?=
 =?utf-8?B?a1RzZ0xtUU5XZmRPRWNSTU1zYnZybnErQUNMUm45QU53dlhnS1h1eUF1YTV5?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df0dfc0a-ea80-46df-d74a-08dc9f3d6c71
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 11:02:14.1845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFxmrXMdkaBKaw9CefukpWzhk/Dv0GSFzWpP/VWNl7QrEsZ++2bjzRlqsjNcblRV4HJXUSOxfdpFp6jjrDwrBZIEzSkQdJZR+vDKJryPCNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
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

Hi Pranay,

Please follow [1] to write good commit subject/message.

[1]: https://cbea.ms/git-commit/

On 07-07-2024 08:34 pm, Pranay Samala wrote:
> This test is debug logs are too much and was killed
> due to exceeding disk usage limit on the less disk
> space machines.
> 
> So dynamically reducing the debug log level to
> enable on less disk space machines.
> 
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   tests/kms_atomic_transition.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 29dd8ac4e..b0339f57d 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -41,6 +41,7 @@
>   #include <string.h>
>   #include <time.h>
>   #include <poll.h>
> +#include <igt_sysfs.h>

Please use "" to include defined header files.

#include "igt_sysfs.h"

>   
>   /**
>    * SUBTEST: plane-primary-toggle-with-vblank-wait
> @@ -1176,6 +1177,8 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		igt_set_debug_value(data.drm_fd, 13);

Why this magic number 13?

If drm debug level is already less than 13, then what is the 
expectation? If we still update the value with 13, then the purpose of 
this patch itself is not fulfilled.

> +
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
> @@ -1258,6 +1261,7 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
>   
>   	igt_fixture {
>   		igt_display_fini(&data.display);
> +		igt_debug_reset(data.drm_fd);

Do we need to call this helper explicitly, as igt_exit_handler will call 
this function on exit?

- Bhanu

>   		drm_close_driver(data.drm_fd);
>   	}
>   }
