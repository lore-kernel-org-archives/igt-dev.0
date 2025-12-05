Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A6DD33998
	for <igt-dev@archiver.kernel.org>; Fri,  5 Dec 2025 18:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED55010E267;
	Fri,  5 Dec 2025 18:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LCOFUbiy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4A10E267;
 Fri,  5 Dec 2025 18:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764957741; x=1796493741;
 h=date:from:to:cc:subject:message-id:in-reply-to: mime-version;
 bh=FFggoBRsn5KrkJZMcgMp6kSEMefS9OR7hBdM16y6IMA=;
 b=LCOFUbiy2OVRmYHH/pBxRW1Z3SE8NHGDfr5o5xlpEymqSfS4IHdAa1Ec
 eBej/nA/Kn5swYnz8uXGMFRZrS5CloSo3SSEWQRBq8VvUFPtnyJqD5E3N
 0plYKw+UlwE2pnJB3z5o3v3CKILi7y3KXlGHUVU+fSbIJPIBSdcf1wulx
 xmiNzwnGtGsfLL8KCMlq3nXzYPBGXcUX3B9wm34OOy+iCjwlaqUL2SxCa
 sybylGFVGcJ4UXfog4i68hoaswjuYhjY30jdPZq7P9dDsp8z591tO2Iqn
 11Fb482yZbXVJnnMHw3lnEUpqU93Z37V7V3TCKCPKZnmWBXnVr6v4xVYB g==;
X-CSE-ConnectionGUID: O/wMOdMyTmWZUqnKlpaqAg==
X-CSE-MsgGUID: 1zxhqt+6SlSg2OB8gU/+6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66891015"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="66891015"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:01:36 -0800
X-CSE-ConnectionGUID: GCzM/jTaStG0RJiOF/NvCQ==
X-CSE-MsgGUID: 7ZRCtGtGR6+/COQqpDNkpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="194655394"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 10:01:35 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:01:34 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 10:01:34 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.34) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 10:01:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvMS+v6qP/o7AAKRFglKsAhEHfE7EMGYH44n0c1gXx8E68V3Z/ur3ogYgfoB2u/ZDClhoGwHGAFaf7Ip1eTBI6qDafBLtjlXzIoJw7RoxyKZDpC854oxLdKUyMJ1R88Dfw4/KfXqcyxL9ou2zQ5+rnU0zsC5GemI4ygFxaqQZM8fAymCAkXTCIFxu4UFUQTjpcVq3s8FmTZQhiU5oyquLApFrTvSPlwUF3e3i+40u/SXurYMBHWmo8iTuoMPIiAcuTh5GjM2hADnua+nzwtZOetZq6D4sHJSrmONnYeS4ddtsRr7UkWZRdgIqxK9/p/p3BAmwubzlMFFfHQziHC5Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AuExM4bze3GRK9orDrVPd0AwjykOBzzH9jUwBzI6oe8=;
 b=wsYjX/AhlXWPtCKVguxEV/czM0KFdHSyTEdYZWurc5+/9FtTOqOluunl8aJ4/t3IwkPa2Ja2h3UYtfO6/bK5VZx14zhX/UaZggoS+7QByAT6UOUdUm2cBJgDbK34gcFaxX/rCRZE9ZCmt1SAULDQo+iBNY9fhly//bpwzVg9oenixfKkFvtPSu0tbKqRq8TSMrfJwV+wVlJSMtQ2k1rNn33g+mXmpKTC4IEtqBQI/JaF0nEea9SnF1PZeQWC9kLj0g0l/AXyxz12zvGJB0/2WHqDoFpGaTVNzhj7GYfHHINZoAeQbwENkQ+fUFdKRDwDUihyGGhb9vKemTGnur8cdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by PH7PR11MB5915.namprd11.prod.outlook.com (2603:10b6:510:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 18:01:30 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::c0b4:f63a:9c33:ec4a%7]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 18:01:29 +0000
Date: Fri, 5 Dec 2025 23:31:22 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: "Taylor, Clinton A" <clinton.a.taylor@intel.com>, "Wang, X"
 <x.wang@intel.com>, Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <I915-ci-infra@lists.freedesktop.org>
Subject: Re: [PATCH 0/2] Fix mocs index fields in MEM_COPY instruction
Message-ID: <aTMd8oQZNrTERm0L@bvivekan-mobl1>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251118142522.3957318-4-balasubramani.vivekanandan@intel.com>
X-ClientProxiedBy: MA0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::9) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|PH7PR11MB5915:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc3c179-d0c6-4419-0a85-08de342850b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFBFUUQ0U1ZmclBWSFNKQlZMVmsyT25WRjYwNGVjdytDQURMQWpqM0tMK0Ux?=
 =?utf-8?B?MGUzN0hnM3RhaXdPcUNrb21UVVFrNWdLdlpWVlJ3STNpdHMzM2E0YVVhY0Rl?=
 =?utf-8?B?RXdhR1lGMU1hTWpBWGYzK0d1b281NU5pTkt1M0R4eEJKaFBqa1VWMllrUSts?=
 =?utf-8?B?MFZNTlBLVk9GYnNPVUJYRFQ0cCtrSFQva1NyLzg0MnpxTWVJc01HVzhwZCsr?=
 =?utf-8?B?WGF5MWlqY1F6WEoyamhRTjJXdTVhY1IzK3FBY2NBSUFVbmszSUZRK0ovaDhR?=
 =?utf-8?B?U1UxL0hPVEt4dWJTcWV2OFg5QlhCWUZRY2Y0dzRaU29NcjNKcjNqeUNFQVY1?=
 =?utf-8?B?b3ZOS3BSWXZtNjhjTEh6YXBLWGNiU2h5eEJKRGdzU3ViOUt1TUZUT1FibG9J?=
 =?utf-8?B?ZHczcHhoRnpNc3pDWU9tYVdGR3JxeTBVUFAybXgxUkdTYWp1NDE0M2lpMjBF?=
 =?utf-8?B?eUNSekllTmtsWVQwazIweTJpc05pdFA1eVFqQWgzRStjMzlMU3Vqekg3VXhq?=
 =?utf-8?B?NERkRlBGYXF6UzZ5M09WN3cvK05zTytPbG5YNkE3Z1lVK21MVG5CSnVwVkdO?=
 =?utf-8?B?Si9XeTVmMGFXc1RKaXV4S3pwb3MvT2Q2Z2VmSmJlWGxQdUJQd09UNUs4Y0lZ?=
 =?utf-8?B?TVUrU0trTFNmMHF4M21JbEpwMDJVSjBYcTlsaFZlNGEvaEhFeThTVHlTdjYw?=
 =?utf-8?B?clhxQTB3eTZWMUJTbk9FcXJwSTNoM2xxNUlrcU5VQUVHd0dSTmo5TmZjcm9D?=
 =?utf-8?B?dUw0a1E3bWV3Sk1WaGY1TE5aT01VMVkwSTFKMDJuQ0ltbm1QUG9PRVQ0MkR3?=
 =?utf-8?B?YTdNT092OGJsQU0wdzBrRGZzb2FiM1pCS0ZZSklNRkdNTjVUZDNMelp6L0lh?=
 =?utf-8?B?emlQNHlrZk05YlVNeTJ5NG5YMndCS3IvS3EzT3BhVHVHOHdyMFAzYlREaC9x?=
 =?utf-8?B?MFlsanljbEVQUzUwSmNVZ3E3aTZRK2JoWU85NWpobGJuQlRaQmhTK2FpdkxU?=
 =?utf-8?B?dnRsTDZleXdLV2JyakR2dnFhMGk4NGhZbHlFNVg4U2FsVUZYNjFjUkN6SHBr?=
 =?utf-8?B?RmFFQ3cvdWMrMDRBMVpFY3d4RGFoME1HcFA0b3hBZWZpR2ZZajN3bFd4S0Zk?=
 =?utf-8?B?dmNtNGNmUDZRT3NHZFUvMkFyU01pSkROaHJhdkZZRXpVNERqTlQ4clNDSEFu?=
 =?utf-8?B?TXlIUUc3K3kxZW5iQnIrdW80T3k3MDdHV0Zqd0xDdWk0WVgrbTBPVTFBaytU?=
 =?utf-8?B?aEhrNlMxN3E1WUxzMDF6YVYvZnhJTS92OGtMeUtkK1VDbW1FTVR1SjNBd25E?=
 =?utf-8?B?QldhWmZuUUhJOFVvdkNUZ2pDRjA2TXhpUVZ3ZWN2N1VpZm5uR1lVTWtFUkVJ?=
 =?utf-8?B?SHN5cURGQ2sweE1KVmRRVzdYMEc5SGd2aUdJTGsyR1hId0xkUHdlcEkzWnZ0?=
 =?utf-8?B?NzdBRDdVZXlzSGxKNGhTdkRLWVFnMkRjalRNVXhSL01Xa3p6cHFIeUdOT2VN?=
 =?utf-8?B?QTlJTVRaK2FNNGZxUGl2UndBMlJlTkthL0hPL05CTHZnemFpNzQvNWVRVHZJ?=
 =?utf-8?B?aklpekZmQkhWT0k4YTVDMHdTUDlxWm9aOU9STHVxMUNadVNPbC9yRTFDUExW?=
 =?utf-8?B?bmtDbi85VmJ0VTlqZTByR1J2N3VhSVZMdXZOeHU2eE5FdVVoZjZhTC9Nc2Y2?=
 =?utf-8?B?SlArdnR5REg3a01SRUdZdmtCQmg3MldRdW5WVEFvcldwTXlOUEtEVnJ0MUdy?=
 =?utf-8?B?bC9SWVRva0M5WGdVbHJZZTA1b2xQRElYcU5IMG1vU1c3OHM3VjFZRXZZSmtX?=
 =?utf-8?B?eHVQOW1BUzYzTnZubVA3amJQZTBUeTV4SHVTSUZaZmNTQkpuL01RVWU2ckJX?=
 =?utf-8?B?a0hQNk1hdkN2R3IzQTc5REFmdEpsc3JZeFNYb2JFTEpFMGpiUWF3NmRiL05H?=
 =?utf-8?B?T2xZK3NhL2ErYVl2REl1a1E3c2ZjNS91MnR1TkgrbzFkRlZCS2h2QWcvWklu?=
 =?utf-8?B?WnVYdHdOMXBnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVMwKzM0OUJPZ3hWTVRZL2lUeWUxL3h5REt3NWUrV28xOVpjK1kxL2RHQ1RK?=
 =?utf-8?B?eXY3RTlRa2x1WTQ5bWlnVHhXdyt4aEtURW9za0ZMZ1FYd1VxbXR0dXNKS29j?=
 =?utf-8?B?RW1lVzFkK3U3THNTVU01NzV0b0I2OG9wak5DdVNtOVoyOUl5ZEFKb1FpczVu?=
 =?utf-8?B?TlZLZXo2UzNqQXEvNmc4WkZBeHdBVUlpNXRXMUNhTGtHUzJLU1ZvOS9zYzFq?=
 =?utf-8?B?RjBlQllJZUc3cHJkV0hoUE1YZStlVHZ3UDRZWlRBNjNmNEFuTk5VRU16OFRB?=
 =?utf-8?B?V1p4TXJlZU5hb3BjOEgvRUk2eUZuVEpiM29xeERKajVOZ2JUd0Q1UUpPRnJa?=
 =?utf-8?B?Z3BFNWdjcTJERmloZEhNRk5DV3RGd3ZNdWRpa2hBeC9TTWJwMHN3Qk05NUxr?=
 =?utf-8?B?ci85cjk5d0ZaQVNIWStndW1HcWYvY1Y0azA0VjYrdnJwNEFMQjRjKzV0Mysx?=
 =?utf-8?B?Y2x4Sy9DcXg5NXhjc2tiQ2ZKRGpQcHBnMUtjQW5tRVU0V0Y2QXQxR1huRFhz?=
 =?utf-8?B?RnFRcDdGc29VVTc2UVVEaUFLdmQ4R0phVk5xT1psTjVUT0NYK3czNDVsT2Ix?=
 =?utf-8?B?SVhpTE9VcC9wbXBFeE4yVGFzMXZpeUVnMWduMy9MVWZySmVpUU83U0lQdktM?=
 =?utf-8?B?ZlJvc2cxZldhMHhTNUJEUWxHa05qWFpuYmszQXM5dTArdVRJbHBVeWc5bExF?=
 =?utf-8?B?cFJtWjJHeWJtZGZMQVRUVVJCNmJOQ2Y0RlF1Yzd5UWxlSWt4ank0b29VSVk5?=
 =?utf-8?B?dzBuU0ZZdEJINU5MUXRRM3FTSldjVm80cXBFanR1MElmK1lWbDQ1WTk1M0I1?=
 =?utf-8?B?VW5nUjV6aDFGSTJLYjVqdkQzaUM4d2JMRkR2dENPRjNPZ09xdGJzUTg1ME8z?=
 =?utf-8?B?MFRDSERpeHNZMGtkbTNsVU84TkxFbEJZeTBzSFBFd0hRcjAyY2pPMDdQY0cr?=
 =?utf-8?B?K25OWWoycHNOdnF4Yjd5WHhhRFRNam1YZGpZeGRNYThqQTlYQUxpNXZ5eHFH?=
 =?utf-8?B?YmVrQ0dqa3pSeWZzQll1NExUaUhGMGowNDViRTdSTTRPN2hyZzBITTViYitS?=
 =?utf-8?B?V1FEbU9CSk9HLzY1S21ycTVMUnVNRTdyTmJJbk01RWh5b0k2UDVEb2Z5b09D?=
 =?utf-8?B?Smp2NXpqb2d3d3d3Z0hEeVlwNHBsa1RjaWJKLzdmeVhYamhkTVo0Tm9oZVIw?=
 =?utf-8?B?QVZBSWwwaVA2Nzg3UTl3dFRxTE1KNmttZVNWeDJGZUpFejFCeHB3d0VsQzZu?=
 =?utf-8?B?VnB6Z1NOQWtVZDBqWDdxUFFQTEhTTmFJTnhOYlRQTlFSQk9DQm1yRWlSUVBy?=
 =?utf-8?B?MmtJbDR3NlNEMVZKRHpLRndSS1dscm53OWdac0ZQMnF5TFB5dktiNXZLRzNT?=
 =?utf-8?B?M2NnelJjSW5Jd0F0N0ZEWG8xRXI3MDBYTDRjRDFUMTRxdi9QMW9PRnNmYVJL?=
 =?utf-8?B?WUFvYmRNeFcyd09IQjJhS0pSRDZWOThhRjQ5a3BQMUNzTDUvNGxiS2Z6OVo0?=
 =?utf-8?B?R0kxS0hrQUZWdVJLeUUwOFQycXdRZXFMTG9SUXJpSGh4VG0wUXp3MzZveEJC?=
 =?utf-8?B?Sno4MXpTMTBpSWRsUENJdWlGT3gzMFdSQ1VuSEFnN0ZhUmpZTGtCckNSQ2l0?=
 =?utf-8?B?M3ZjRmd1cEVzWmtIc2hRWW5LUzhKYkhGR1RRYXl6TU12VFlCY21QeVREVTMy?=
 =?utf-8?B?NkEzckgwY2daWkg0aUllRktmZ0cvdkpuZmZPcHBONldobFQwRVBqMHorVHp1?=
 =?utf-8?B?bm1McDM5U0Y0K0FzZGlKbGx2WklvMnVHdTJhOWxxNWdXTitoZGQwVmQwandm?=
 =?utf-8?B?alFjWjYzT2dHUVdWemlwWDBQTzJNTFFsL3hlUkg3TndyMVZSZmM0OXJoc3Ar?=
 =?utf-8?B?S2FzTmgvVUNVSE1wdFdTZGNMRm9weFN4cTMxbHo2UFJ4akEwS1RHRml0Y1NK?=
 =?utf-8?B?YWRvTzRZYzk2TTkyYmtCdEJmRTVWcEh5enAxd0Z1NjY0aGtBNjM5eEFtaTI2?=
 =?utf-8?B?dlpNVWtrdmw4TG5wTUxqUzgrS2JTdGMwOTFRTTdieVVPOFVlYW1CL3Yza0Rl?=
 =?utf-8?B?Z0F4NXZ3VXAwVkRzZ2pmY1h4bFlFSEdOY1FoTml4ZVBNZ3cvcElNY2d2Tzgv?=
 =?utf-8?B?U3NERUp5NFdSWFhTOTB2clNKQW5taDQ3dlhFYUtVT01JYXpGY0lBT2lReXNS?=
 =?utf-8?Q?Mi0vPW4Z+Y2xynKUhc9DQiU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc3c179-d0c6-4419-0a85-08de342850b7
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:01:29.4824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i4sdK7i+gWn2s1+FiaItdCJqO59opOh5mrsR76uZPH8P6Z7FoiatVkxOG/PDrGT1qxaWMn7XpM9x1EKwHDc3oRPzP7DiUB/cPaVs/3Wu+1V6QdNSC4BIilRKRMKHWugW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5915
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

The following CI issues are reported for the series.

Xe.CI.FULL - https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14153/index.html

igt@kms_color@ctm-green-to-red:

i915.CI.BAT - https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_14153/index.html

igt@i915_selftest@live@late_gt_pm:

Both those issues are not related to the patch. The patch only modifies
the mem_copy tests inside xe_spin libary.

Regards,
Bala

On 18.11.2025 19:55, Balasubramani Vivekanandan wrote:
> Contains fix for the change in the mocs index field of MEM_COPY
> instruction in platforms after Xe2.
> 
> Balasubramani Vivekanandan (2):
>   lib/xe_spin: Pass drm file handle for mem_copy
>   lib/xe_spin: Fix mocs index field in mem_copy for Xe2 platforms
> 
>  lib/intel_blt.h              |  4 +++-
>  lib/xe/xe_spin.c             | 11 +++++++++--
>  lib/xe/xe_spin.h             |  1 +
>  tests/intel/xe_render_copy.c |  1 +
>  tests/intel/xe_spin_batch.c  |  1 +
>  5 files changed, 15 insertions(+), 3 deletions(-)
> 
> -- 
> 2.43.0
> 
