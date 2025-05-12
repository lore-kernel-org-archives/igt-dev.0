Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC280C3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 07:55:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A88C10E2F2;
	Mon, 12 May 2025 07:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FzgWe5lE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36B8910E2F2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747036543; x=1778572543;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=c2732amXYZsDa4uLbLrFnaEK/yT41J3JJsEZ94m/IHI=;
 b=FzgWe5lEBXuS0lxY9iU/Ahf9qHPA235Wc8cIhUKwGyGUlCt/pWCyiJvp
 ynGsnKfkmRseSoVbdL5wfE+w21WeEeg4Wl6tkKfaKN55V/LgmDI30C+Y2
 Cstqcxa0CTUtg/CME9vK/kPZz4rZvIQ5mumhSGEbavK/jch6IE/LiNC4s
 vCSsJ333APmjblOjbBVLZUNJVriiR7L2e4Fx+EDR6S//IkCRjYzN6ftF9
 YD/h8UcMKH2nMPPIPe4b3ue0CIeVKWYGlKnbVTbqX8Wfg+I/ajNSu4coK
 F/dLQMzzyom2dmd+pRvepl7UH9gDVS7lLQtzG7/Bv30iHtgK42tdoaB4G w==;
X-CSE-ConnectionGUID: TIscd0dUSIOpkZ4Y255BVg==
X-CSE-MsgGUID: Jr5f1aMMSZqWsYjUG6s/zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66226071"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="66226071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:55:42 -0700
X-CSE-ConnectionGUID: 0Nny15mpQa+sTdbJwv/EyA==
X-CSE-MsgGUID: KBqVk/I3TT+S54DObYDToQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="142045760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 00:55:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 00:55:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 00:55:42 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 00:55:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Few5J1Sx1jJGCVlGNkmp3J+IuZ7vzPBJvAnBeiRo9fBL05+5SP1NDkUHFFm5b22LfmgWJddJGiR8pLfNgh119Avths5XuF4pWzStnjeKngJz2KHe5VFOpsDZvtT69NAVWSXU+kd8e1CoKDQCtm/KPjMhH/d/xi0/mrY7gokrgioS4SiOUoLXRhRxo44MD1/C5DZFKmiJ7az6rffcR96E+bBmSuR9cBrDMarn5K4GZ7P7FGn2jRlTZHXRFYgJZCbfyi6E2+2Ovqcwo0XzYItFEFHgTVHwQUt8mU65c+ItUm5fJthCrR9ACJMX7Xm/woANNLcgRLwNW+dHByMXmcAW6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgOuN3CEwnTfWf7m32b4pmt/phdFahbBqFACXn4Z3NY=;
 b=jF57jVfJ1JT6yBMRuFzw+ubhUt9VB2Qw5eXTgbw+fUYds4bvJeleIo3MUxW3b/n4Co4CenxiWUmCxzItYXjl5F0vPpUXMtHovkw/+bTvD2s/quAsl9T+ng3Ua9D/re4U7xIADT8uOjqJgeBd73CXCVx0Of1R4a9mU7nMMJpw/ckFmw+emoWnFwjqUlTVNM6IpihiXFPpwsgvsibfV/H2ggGBMmuwivJOUpolsQPWXF+UTIFu9aisFuMBX+zcPgTHGVDO2MY7kNMQyNey2zNzL3lPfEr7GM+ATT74i9tghoA5uQmvPwi4Rz7nLWedGGitrOp6P8THNLfiNlegxSzemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by IA0PR11MB8380.namprd11.prod.outlook.com (2603:10b6:208:485::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 07:55:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 07:55:12 +0000
Date: Mon, 12 May 2025 09:55:08 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 2/2] tests/xe_render_copy: change width and pitch
 to be in valid range
Message-ID: <aCGpXL0AA8GMZHBp@fdugast-desk>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
 <20250509074645.56169-3-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250509074645.56169-3-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::7) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|IA0PR11MB8380:EE_
X-MS-Office365-Filtering-Correlation-Id: 76ff3a2a-c2a5-4523-3680-08dd912a52a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzJFd2xablc5Zmh2SkVuUzU2T2ZTcmZmT0kvZS82OWNMTE9pQmpnbkVVYmF5?=
 =?utf-8?B?Z0VTVVlyd2MxMExjRStBNGFmNUt5aHJZUzFaZ0E3OUtRYzc1dmU5UzRMSkw3?=
 =?utf-8?B?ZW5xSHI5ZGZMSHpXZm9IZVd2cUt3NFl1bG1DYzlYM1N3bWc0ODBJTzFRWmoy?=
 =?utf-8?B?RGNoV1haOHEwdlFaV0hVU0lZaytwemFGWlJWaXFEeFZEUlNrcUdvMnRrbk16?=
 =?utf-8?B?TThvZUFTQTkycUNnOVlad2NTYjI1YUx5dWlDVko0Y2xMUjFHczBHdVEvNmlP?=
 =?utf-8?B?Ujc2c3FLc3kxUnArcHA5U0lBWjdWSVFVS0x1MmFtTldFbXdueGEwOVg3TFFt?=
 =?utf-8?B?SmZLdzVYTjR1akJ2dVNPcTVBNmI1T2pXcGptZkQ1aDUxWXQxZ0ZnSHptQ2tQ?=
 =?utf-8?B?RS9uZDVJSDg2KzdMUW1VZWdWWnZwamJseGx3Q1pFdEo1VTF1Tm9yYks4ODY2?=
 =?utf-8?B?cVJZT3kvdEF1QlBJLzRUTEdvaXJMVHErKzlac0lzbjNYaWNCNHEzRGMyN3pq?=
 =?utf-8?B?MWpsWExMZnBaODdpUWlQL2I5UlRjYnBIYlN3Mmd0SE1xSjUxYjJ4OVBpeTZj?=
 =?utf-8?B?UjNOT3JTYTBLVkZvN3AxSit3bjZuaTMvbGdXZzdoNUVsZUVzTnVxNTJyMmVo?=
 =?utf-8?B?Qjl2cmNiQ3NvN1c4NTd3bmwvNGZ2SEhpNTNLeHpDZGxwNHFaMFVYcGxkL1Ra?=
 =?utf-8?B?VFFZK3BTRWFZa29hYXd0KzlncjdkT2cvSGVjQVYyVWV0cDV0aGxmb3NlTlpo?=
 =?utf-8?B?bW1la0p2eTlYSHZHa3hsYzVHOXVONjdyV01Vclp4d3NEYmluZVBqNHpPMUFN?=
 =?utf-8?B?dzY3dXpHbFRxakx1QWdlNVZmeGQwZ0MxVm1Hc1JVRnpUUGxrekxvelExMkk3?=
 =?utf-8?B?Qm03V3JjOHZIbjRab2g5MURVQmZDbmE2YU9LeHRyZ1FhaUdaUERoaG9xWU9P?=
 =?utf-8?B?Y29uRGNLckV0M2YyN2pocFBIZHNVL20rT1JPblVacXRsWWs0QkhkYkpVcnpF?=
 =?utf-8?B?Z0hDZU1tUjlQNW9RWTY5VENLRnNia2lwQkZpV3NKbk1LS3k2SVJZaUNQbTYz?=
 =?utf-8?B?SEdvcnJqT1pTYlcxLzFNRm9Ea29UVUZwTS9hY2VaRHFNN2VPNDZ3Z0lkUHVa?=
 =?utf-8?B?dGVPTE1KSEwzYlNOSG42dWkvRDdRMXZkdUVRWUpYK0s3dUZFanVmWGF6ZTRN?=
 =?utf-8?B?OG5jL3lqZkFaRk5oOEUybDUvcFRXZzNUd1QxS3hZS3kyZm1XcU94RXN0bGRK?=
 =?utf-8?B?RFhlckNrYmVuZno3em1CMnY0MVFBWGdST3Uyc2dISTdrdEdJOWVzd2xGcmpn?=
 =?utf-8?B?WUZORXorTnlEVEs5aCtUWk1kaGxjRElEcTFTblY2T2huVStSSWZkVzFmbkRT?=
 =?utf-8?B?dnVudDZ5RDNDVzJ2U3RtU3BoT1NDMFN5dE1nQm8ydE5hTDhKUmxWRzMwUWV5?=
 =?utf-8?B?U2hNR2NUdHF4ejBPWmo3bVBlQ1d0NVIrZjFlT3E4V0lxYlpQS0hqbG5ZYzBu?=
 =?utf-8?B?cHdiRkpJL0JObE9idk1oTTFUUFdDbU5YeG0zU2paRTg1TWN6OW5rNU91LzJT?=
 =?utf-8?B?MUU2ZzhuM2crazB0NERYd2pLb0JyOUJBMzlxSDI1ZVI3YjFMMTJRa0xZL0Y4?=
 =?utf-8?B?ZVhzTFpqcnVaQklWYWxuYWJOT0Z2WFM0TWxLUTlSY3pKcDllMjY2bWNpOU0z?=
 =?utf-8?B?MmM0T1BWd1BIS3VVcGdIUlN0N3pjR1FDMGhNNStNUk9tc2ZPUkFDVDJSTkw2?=
 =?utf-8?B?RnVIQlVzREdWTXY0cmtEdWxkTlBDU3FSMGhYTWkyd1U2aWs0V2lBcHMwZ2lI?=
 =?utf-8?B?TWFGc0ZCc0lRYko0cUNrREMwNmcvS0xOMEpwRUt5TzdYeS9NMzRXNWxXUFVM?=
 =?utf-8?B?VTZldk1uSEZTbUVOS0xxQkc5S2RkYVdMOGxxUEJwQm5keEV5MTZTV0IwdVJX?=
 =?utf-8?Q?ERjJ/SC6+oo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFJ4czZMUGhHeEExTWNXWE1GTThtSm82YjNtY1lLWTBKMWhyZjZJeTdqUVhr?=
 =?utf-8?B?eVI4UFhPWU92UXhsaVdrKzJpbFFUMGoxWTJ6elQrYWdCbUdHb0tLSm1BNWdK?=
 =?utf-8?B?OVhXT0ZqZmVwSktibjFjNGZGVzFwQmR0cnJjSGxKRzNmZHRhdWttMk9BR00z?=
 =?utf-8?B?dytMY2NEbXNYRFJacHpxM3lyUTFZVXNVSVJMczViSHFHZGJrOGdOWVE5TzQz?=
 =?utf-8?B?TFJ4WGRPSUtRUVE0cTU4NjVISGlGZXZVL2Q4YWJZeVAyWUVkQ1RxbU4vVFYz?=
 =?utf-8?B?Zlk3enhpb0JaM3VibTZ6OW9teDZUQXhzVjdDNzhET2ZQektlNVA4WGpNcUo1?=
 =?utf-8?B?T1VLZExDa1ZiZnlxQUdnUTV0UmNUdDU3eHhtQmF1LzBMMmlma2VCOEFsaU9p?=
 =?utf-8?B?YWZ2TFU0RVEzM2d3ZmVXSGxHYkwrOFIrWWpiSXlNbnFNOGthWlJoRGw0bDQ3?=
 =?utf-8?B?UnhjVmtMY01DOUxkajU1TFh1Zk1kc05Tdmd1ZEJ1QnhxSnlzbFV3SjVBeFd1?=
 =?utf-8?B?ZUJnN0JMMUZwQUFGRjU5K2hhRWpIK3ZGZ0lPTForY0haRVVtQnArMHlaWHhn?=
 =?utf-8?B?dTAvZ20xY1EyOHNTUVlpV1NvMTZhSXk5TkhYWGIyQjcxT2ZvWDhhM2NQeksx?=
 =?utf-8?B?MklyMEkzK2xrMENZclpOZThvd1AwNzQyK2ZTK3dvdVkraEtsZVdXSVFWeDha?=
 =?utf-8?B?TEoxbVRldEQrTGlwQ2xyZ0hwaFJ6bEI4L0h4ME8zSWVPTmxlRXlGMVhtaGR1?=
 =?utf-8?B?NlFBamNkWnFzR2REMUpkeFZDbXh0U1YrYk5iY2dTUjlMZjZ6K0hHZjBDcFVS?=
 =?utf-8?B?K3BhQzlNckR3ZDdvYWExMDU5bkFka00yK3BjeEQ1UEw0c0ROdUdZY3o0cjkr?=
 =?utf-8?B?eUZQWXhUS01DOFp1WHZEazF4L3ozcUFqVFJGelZqWUpTdkxjZUxpM2RkRHpz?=
 =?utf-8?B?dE01VGVhd3ZrUFpqanJVTjg0S1EvSGVyU0NhQjZPQncrdjRwVGlKMFVpZ1lL?=
 =?utf-8?B?Sk9IRmtKQmV3Yk14UU5FeG9vRU9qV0l4S2NBK3hRbXFCTzk3Ujk3TURwSzZX?=
 =?utf-8?B?SFYrQ1ArUXdhZTU5ek9EZ1JYc29XcHM3VWFYOTRZeGhSTmFTajMxYThKT1A4?=
 =?utf-8?B?QytHQ1kxbnpDOVBEN05SQzdtSlZBTkZwdUxhVS9WN3VnbkFuR0xJSGFWc1Fy?=
 =?utf-8?B?SjkrdEdwY3lWclZDRVVtR3Zad1BKdFVwMWZyZXVVTmZNQWtrem84WkY5Q2hn?=
 =?utf-8?B?ZUZIcUJ3OE5jNGRWNk1uUkZPWTB1ZldIbUcvQVJGaDVKRndETXIxOFc1c1lu?=
 =?utf-8?B?NnNkdWRFNE5oeWlUeVg3NG1JMytJdjZiNWNud3FrbU10dkRucXg3STU2bEps?=
 =?utf-8?B?N3NvSmd2enZuNVhZcTgrYlpFMFJJUzBFRDRWbHU1Vis2bEZQYkozRW9qWWlh?=
 =?utf-8?B?NE1qN1h5bXZVMEsyQ0UrRlhvVll1a2lYQXIxLzQrd3JYZDNOUUJvR0ZvNEFB?=
 =?utf-8?B?S0Fobmc1d0dTMUUvcTdqZVl4TTRHZTJKUVBEbkVtQjZXUE1pNHNwdmQ3MXRG?=
 =?utf-8?B?MkZxUUQ2TkZmenlMWDJsb2lmSnFsMW5yQmExeHFERXdjRGw4MDQ5T3BtUnBK?=
 =?utf-8?B?NUdCdUhzMTRkcStEdXFCMThhblIyaDlHZzE5dTNYRkxxaXVmSmZRejBCeWxS?=
 =?utf-8?B?MGljcmlxTWNGaWw1QURpajhDczU3OGN4VGdmVkRKLzJRYnUzYUxhSitVMkl3?=
 =?utf-8?B?bDZjVStwS3RZdnFSQnhKU2taNXRoZnpDRFc1RmFjSm5QSURYbi9oNzA2ajNG?=
 =?utf-8?B?dGZLdkh4N0plY1BIdFB0VEdZZC9HMXFYOE1PNmFaQVZ6YmJjL2kvY214MzR0?=
 =?utf-8?B?TG0rRkVqRUpmZzFKVkxNaExXejJJMHVVbHArWnhoRW1Qb3ZySXVxVDJPaExk?=
 =?utf-8?B?aTFBVmQ2TEJlZzI4T0JQVTBJUitHTG0yZUVEdlQwUkpNa2x6TW5QYTVFZk9i?=
 =?utf-8?B?NHV0SUpZbFNPZEhIaThWR1E3Q29MK05sNUd6Q1F5M2ZSbDkvTm5hcHNKdlFU?=
 =?utf-8?B?dEkrcjUrbmY5V0ZyQzVzZ0ZyY1pHNWlibnYxUWRXU0VBMkJFZXNvbUwrVW1Z?=
 =?utf-8?B?bWlLKy95a2NGL1VGNk9NazllWm5pOUlIME5RcjVXWnlLdTBrY3ZqeHFKNzFF?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76ff3a2a-c2a5-4523-3680-08dd912a52a4
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 07:55:12.1461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJT3HszUdoD+tu/QnXji/We/P0k8StYfNEP8+le4e3ifnTyTD6FAW5BwNRXHCgeo5sBT9euS6ARrM1bnkJ2Vb8a4te+QsktQjgYp6Ph9CGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8380
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

On Fri, May 09, 2025 at 09:46:45AM +0200, Zbigniew Kempczyński wrote:
> For mem-copy (byte mode) width and pitch must be lesser or equal 256K.
> Limit them avoiding setting inappropriate bits in mem-copy operation.

Maybe a comma would help: "Limit them, avoiding...".

> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
>  tests/intel/xe_render_copy.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/intel/xe_render_copy.c b/tests/intel/xe_render_copy.c
> index fadfd162ce..9f16537c1e 100644
> --- a/tests/intel/xe_render_copy.c
> +++ b/tests/intel/xe_render_copy.c
> @@ -445,7 +445,7 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  			  uint64_t ahnd, uint32_t region, struct xe_spin **spin,
>  			  pthread_mutex_t *lock_init_spin)
>  {
> -	uint32_t copy_size = SZ_4M;
> +	uint32_t copy_size = SZ_256K;

This matches the commit message.

>  	/* Keep below 5 s timeout */
>  	uint64_t duration_ns = NSEC_PER_SEC * 4.5;
>  	intel_ctx_t *ctx;
> @@ -468,10 +468,10 @@ static void mem_copy_busy(int fd, struct drm_xe_engine_class_instance *hwe, uint
>  	/* Create source and destination objects used for the copy */
>  	src_handle = xe_bo_create(fd, 0, copy_size, region, 0);
>  	dst_handle = xe_bo_create(fd, 0, copy_size, region, 0);
> -	blt_set_mem_object(mem_copy.src, src_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.src, src_handle, copy_size, width, width, height, region,

Why changing the pitch value here and below?

Francois

>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
> -	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, 0, width, height, region,
> +	blt_set_mem_object(mem_copy.dst, dst_handle, copy_size, width, width, height, region,
>  			   intel_get_uc_mocs_index(fd), DEFAULT_PAT_INDEX,
>  			   M_LINEAR, COMPRESSION_DISABLED);
>  	mem_copy.src->ptr = xe_bo_map(fd, src_handle, copy_size);
> -- 
> 2.43.0
> 
