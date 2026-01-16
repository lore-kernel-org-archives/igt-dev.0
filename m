Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4A7D4A619
	for <igt-dev@archiver.kernel.org>; Fri, 16 Jan 2026 09:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233D810E844;
	Fri, 16 Jan 2026 09:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W0IZ7S2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 625EA10E844
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jan 2026 09:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768557183; x=1800093183;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/PuL8G0809emXXV8u0wiF/28f8GPE+Tn5ZSmsROmTq0=;
 b=W0IZ7S2hFnXuVSt13ktiVrVTRjZQ6/m+d6TT4GA8hVcASG6i5+merXno
 PlfvoeBDBMsn/EQvFfu4FicJLQ+UjMWG+ursUgNx9IQaDsvXubGMhQdrn
 Z2nTY2kilJHmqOPGcvdOPaP1lpBCDp+3f3xwLfV1bZdayIJiCdKgDJd8O
 dJNNFaLBnTT1d8i5u3JBu6jpNMo/NmBlvw/cbhRGa0PG0+mNsBYnQvXh0
 Ruowi/f9bzYfX8iiX3VsmfGbDRn37PWsy6iD9Q32NztMFk90BmDj9weUY
 bYty++XFxeDshlWS+zjdN78fo1hMw61iqAKlU0bmdBc9xdF6E0DkY3M85 w==;
X-CSE-ConnectionGUID: x4JKmmWhQGuXjzoX83YORw==
X-CSE-MsgGUID: RxkF63ZlQFSRZssFzy9TaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="68879986"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="68879986"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:53:03 -0800
X-CSE-ConnectionGUID: Ew2vA4t4Sza4doL66+lv3g==
X-CSE-MsgGUID: MNyXKokASt2DjPaThXYYvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; d="scan'208";a="205098563"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 01:53:03 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 01:53:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 01:53:01 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.12) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 01:53:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txy2+7t/KcUjbkUZQDrgZ59syUDljejEnAJ/qJ6feckszSCC8fFCYIGcWWCuXHBgmnM24Epd166hACP4/62XTbqUUg8HC+hRc/oHCIx7serXiWRgHHwSzpEaq6d0gXpZHfyuckLOwObnXOzhfgc9yUPgf+Aq/PQqrMyu4ZV7vgEJ10pjbThxezOOPZ5+bO75uMmN8gwKNoPxXuJ4xVeCZT0pPg4jyWDv0E/vVSy0EouylFIOnylW3QdJ8q0dj8Bq2lNtMGUi58Q86WG7pPv1lYSFsXRYn7IQbXiTc0K8z3ogadyUDUqwjn3qxVw/MpOE6tGcH0RLkUSa75JhusevDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3I9WKWjEQjOuNzDNOfcgCgkPD61Dm5BedVf1WbpUFUk=;
 b=yxnILkqIIOycnlPna5pQ3T9nx57WJyEIneXZz9eNs3e3XoxOl0JRORQjovwqHBRAbDXONevTjNWpJI5Dl1fpYeReYfTc1XnIuGpeV3EYSWsi7tXwGuOWgHTabJrZyote927toCBGceCMLpMIzCmgRn67PmxIZczo8sfgWiF8uzhNsW7ixhBmaMxaKneBEzzcGP5tLYk3hrt/ERQh5/NeVrqMGA5WMsETZnujk2b7FsAdn64RheYZ8HYYtsE178CKMsH4Tw/Qf0+4X+y6GPPQVDNFfjNckxU7B02TROepNMhABO7CeU/sCLWHKRXcjm4sy10F7HnLKnPSQgN+l9XlzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by SJ5PPF64191BB3C.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::82f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Fri, 16 Jan
 2026 09:52:58 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::1171:db4d:d6ad:3277%3]) with mapi id 15.20.9520.006; Fri, 16 Jan 2026
 09:52:58 +0000
Date: Fri, 16 Jan 2026 10:52:54 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t v3 1/5] lib/intel_compute: Add compute-square for
 xe3p
Message-ID: <aWoKdp8zOYjAEqk-@fdugast-desk>
References: <20260114151930.211512-7-zbigniew.kempczynski@intel.com>
 <20260114151930.211512-8-zbigniew.kempczynski@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114151930.211512-8-zbigniew.kempczynski@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DU2PR04CA0343.eurprd04.prod.outlook.com
 (2603:10a6:10:2b4::29) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|SJ5PPF64191BB3C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aead51b-5043-4e5f-8954-08de54e50768
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUIrWGl6ejIzYlA5dEg5ZlZjOEFCMG5vUnozclNaYTRwY0svK3Y4Z3lTNXl4?=
 =?utf-8?B?ejB4NnpWQ09LYXd4QXJtdjE4djRjaER3MVZPeDYvRHBicmJremtTUDlrUzc0?=
 =?utf-8?B?UDFrZ2Q2V0xaemYxRFJNUUI5Tm9NMVJsNnJBQS9PK0VJR3VNUklQOVpRU2cz?=
 =?utf-8?B?ZUZBQ3FxTHNNelluclVNTVpNdWV4aFUza0o4QzFpMlRXbGZpYzV5eklNSHF0?=
 =?utf-8?B?a0RGUnpmVUtDTEhESVZqZmFUOGNxSTVSSU5NTFVYVFRhcXdZTjRlbS9VemxN?=
 =?utf-8?B?UWZCeHBQSDNQeFNRNmFNQThsenBrUjZvc0dxR0FoRThjckM4TUF3VW01VDFt?=
 =?utf-8?B?c0FDNklmVnJNS1Bocm52NDk3OWF5N2p5Zi9jSkZLWEFueWpKb0w5QlpWLzZw?=
 =?utf-8?B?TGhCVWtZVitFTkFhRVhSODZ2KzdFcjhiNTF0blJPVE5lY2lDQUZzU0tVSUFv?=
 =?utf-8?B?cmFLTGk1MDFGcm5ORWpMczJ5eHRmN0pFaU9aUEQzZ3RjWk44UGhUV3FVT2dY?=
 =?utf-8?B?N1ZrVmdGNkRjemgrRzFFa1owTTBrakRBRDU2V3NtUFVtcVlCRTZzWDR2U2lK?=
 =?utf-8?B?c0M2dlJ3VWdwZHNsK2lKbHBlVGY4UjBKN05Ddi91eWJJTnhTaGFqaHovczBK?=
 =?utf-8?B?dncxYXlJT3ZCUndTMTc3U295RG1jQjc2ekMvWWdUTHdta1d0V0pOMTc0Wk1Y?=
 =?utf-8?B?d09lVzdPQlBzRENzL0NrSWJzUDZ6aVJRYXFjdStrWWV3dXY4QlFhc09pZi9s?=
 =?utf-8?B?SUZUalZidmRaTFJTMWJQMGVCdE83K050a1NCQUZXVzZQaVZDb2F5ZFZCT042?=
 =?utf-8?B?RTFobHVPVzQ4c1BpbytvKzNwRVgvZDNQVWdnS1RxU2pJOTFKLzZ0UGJVS3NN?=
 =?utf-8?B?STh1blppczV4NzFvMWdnZDkwSkRQNHhDMnkxd2FJaWFlOU1mbDVDYWJ0UjJz?=
 =?utf-8?B?eWpwbFhLWFVEMkkrb254VWJZa2hYaXRjdnEraWNXd0krNGozMHdKUlRSNWVz?=
 =?utf-8?B?ZGxVQ2hGTk5RMjRqNWJ2OXVOWSs5YnF5OE90RFhjTlZicTVBTkRRL3M5QnZG?=
 =?utf-8?B?WEFSclpTbHNNKzd0SndveWRMSFUyNG9zZXNDYXpMNFVIUDlZOWFUOFBsRkdG?=
 =?utf-8?B?K2JJbzkrWmhlanhSNk8vdVNzTkgreHIrTzdsdnBYcUNvTlNqOEdUY2hzb3l5?=
 =?utf-8?B?U2Vvb25yYXBSR1d4dWxOTVNKZENJS0R6SlpFN3ovQnpERzFJWEYybWF6c1dl?=
 =?utf-8?B?WngxTG44KzRZbHZTMVQwOHVJb0p4dUVUVnFONG9Ka01xUEtYR0JHM0txRGNC?=
 =?utf-8?B?aEVlRXlsZFVLajZRd1lyd0NrdmdRYU1ESVM4eGNTdmNZanJFRnJZMzlRb1BM?=
 =?utf-8?B?b3hHbjNqRVFvR3Z0MTVvaGVQRURpakZKNzVDbWpycVB1QkV4cG1YQWI0bDFM?=
 =?utf-8?B?TEwxU05ibkNFUHVIWmhYOERmcDQwQjloNXd2REN2R3o1djR3ZjJaajJ3QmNX?=
 =?utf-8?B?SmdGak1QaTBvQ3FkdFVKdVROSEFxaEo0Z0lSeEdFbEVNRWhvMjV3TElSbWVz?=
 =?utf-8?B?dVJVaVAyYkpQeWtBS0svQldwOU1qaDZFeTU2aUZZUk5yZW9takFEcUdERkhU?=
 =?utf-8?B?YjhLb0cvNUpzMER6NTB6a0Jmczk1aGs1WE9JODB6bXdBU3Jhdm04M1VqeVEv?=
 =?utf-8?B?blFkeEk1S0xmbjVDd3FOOXZ5WiswR3lMd1VZNFhZL1VUUWxlVThtdndDUnhN?=
 =?utf-8?B?UzN6am56bFZ6TkVIZFNzYS9YUFFESzVEUUpIVWNyNUV1ZW00NTc1VWx5V0Rj?=
 =?utf-8?B?TUVLWHFuUmJWdkxHLzlIUWlUR3dKV0J0enhnb0tYRWdFMFBUWGpteUl1OFhJ?=
 =?utf-8?B?L1VWTUZESTJDVWNhVkw3ZzY4UDVrM00vSi9LQVcza0c3RXFUTURhRjh2VFQ2?=
 =?utf-8?B?OHVrUXN0eG5Kb2dGYjVlVHNRc0tNdk5NRFdZUVdTTSswTGNMWmNDZW9tdHox?=
 =?utf-8?B?Q2dEOUpzeStSMFRWdHNCUlNCQTFDQko3d3JOQVZWbzF0ODc0NHZTVHdxWnZY?=
 =?utf-8?B?L3JDUEJkMlVtbjNuOHdSbW5yNnFKVmJxNlZhUTYwSXNNbzRFSUpYRUtkN1VQ?=
 =?utf-8?Q?+Ejc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHlPd2I1SmJHN3hORDFDdGNDbzJaNE5lNDZZYWpaUEszbzJJMkFhNEJDWk15?=
 =?utf-8?B?TElwQ0s3NU03NytVVFhobDRvL0ROWHM0NElpMnJ5Ull6cWlIRXc0azY3YlZa?=
 =?utf-8?B?Tzl1K3M4WHptRlN1eTdKWnhNNmxVVUdjSVJNZzJGaXg0UVR4QXFkOERyTEJZ?=
 =?utf-8?B?ZG0zMkNySVV3N2RqMzYwbG5pMThmb056cFZ4VFFMTC90ZXd0Mzk5b1V5Tlhs?=
 =?utf-8?B?by96SzdVRWZEZ0RiTDJDTjRXTGZpSXZKaERMVmdBYnhsRHhLVHBTbkp4TnE4?=
 =?utf-8?B?MnMrTzBPSDljQm5IWFZ3TWlyb0pTNDFPUDBWdXJ1Ry9RTTgwQVh2ZXRsNjJa?=
 =?utf-8?B?U1F0dnVrSThXSERGaUxNVWVkRDlqVDg0c3k4K2xFVVFtSnEzTTJGSEVLV05z?=
 =?utf-8?B?Q3gxbjNwTld2RThYUEZJUTBtdlNIVmExekRJMEl4UjEwR1VaV0VGY0xpbm10?=
 =?utf-8?B?R056Z3Q3TS9jZFQrSGIzeThvRmFlNkt1RTFxeURQS2tObDJCQW9tYjlNajV0?=
 =?utf-8?B?emQyMmI0NXgwNWlKVlhFV0plL1Q3Y2dUM2hSQi9tc1FTQVRYd1c3TXVxdDV2?=
 =?utf-8?B?OVBDWURndmZlVmIzNGY3SW1CRUNvZW1uMHNtVG5sK25ZTkVPbHVKTlh0L21O?=
 =?utf-8?B?aXMyODIrREJMdWVuaW5hU1hLTjNOd0RnWVBiUDMrQ3c1WjhwYi9RZkRIbTBi?=
 =?utf-8?B?K2h4cFVCeHZTV0REUXQwdVpaM2VzZTdFSU0rWGZ1a2JjSVJYRkxGMUZUcFdq?=
 =?utf-8?B?ZERBUGtxaWpBSEJZbUtYeTMzd2tCWjFlay9CRGtOU3ZBSWJLdXJENzZhejQz?=
 =?utf-8?B?cnRxL1loVUl5SGo5MzBBeHl1Tm53cXJ0SXY2anlocmdQZHJsbmlHNjVBZFYr?=
 =?utf-8?B?T3JiVUE4VEZIWG5BbjdVbjB1WEtMSDA1bHhqOG9UNUVzdUhZajJJTUNUTldP?=
 =?utf-8?B?MzBJRERFc1pkNXdNTnArdEJZbmlpYlJEQmJGZHpQbDQrNlpFK05jRUw2Zit5?=
 =?utf-8?B?OThnbUFmVkVvTFc0R2dlOTNhOU5nbmhJaWNYNkJxeG9najJ5NHd0R2dHK3Vr?=
 =?utf-8?B?Ump1SGxYZFBVRWdnV3BIbUxhbmF0V3ZNZ0VtZWFGKzJLZ1JvdHcwNlhwK1BI?=
 =?utf-8?B?QW9MSlp1bDlsNUxPWm1wc2xmekpZL282eFYybXlIV3NUNXNvbGQ2L3BUb00y?=
 =?utf-8?B?RGg1NGp6S3YwTW5rbjR6c0JuNk5ZVTE3bmgrejBqcmNZbEZKYmxEeTRaR3Vp?=
 =?utf-8?B?TXVvNWtnbGJyeFV0aFRsSy9mTCtwSlNGalR0KzlCZGoyTjlNWGVSQzJLSWJh?=
 =?utf-8?B?NGRIWTN3UEEzQThDYS82aS85cXlPYTFHcWx4bURqUUVRbFFVSWRrOVhwRzFF?=
 =?utf-8?B?U3k2MldzYkZDejluU1I4QVpIeTFkci9uUFpPSXA3Y0I4TWE5M2xIR0Q4ZlBO?=
 =?utf-8?B?THBVYkhlaW03Z3IrQmdmd2lyemc2bjNkcSs0UU1XQno1dmIyK09STG9ZRjJr?=
 =?utf-8?B?SWtXU1BOdGh0MmpWOVRsZ3U4cStpTTExV3RPUWFNWWdSbW1hL2ZLTk1ncDN4?=
 =?utf-8?B?Zk1XU003eFc0N25CMXNUMFdxT1V1RTd5TWZUd1Y4ZWRZRG9KMjJ0aE9RVjAv?=
 =?utf-8?B?TVppSVJGbDRCSk0wNU9jWG02RDQ1bmJPUGFxWXU3QlhXNVRleDgyZ0Exd2p4?=
 =?utf-8?B?NkZ5YjgwRkRUZUZLaTBzUW1qaUpYYXlzcERkY2I5RUZPeFoxSnpMUU1RVVpP?=
 =?utf-8?B?dGhrVFpwSEpwWEtrdk5TUndmaWd0Qk5kWjBuQTdBRmk0TDNiRVRoNE8wT05L?=
 =?utf-8?B?WTd1SHhDN285OFIrSVFwV25BNHdTelRYZFlvTjZMUkdxeWtzb3RMZkpPTlZG?=
 =?utf-8?B?cXBIZnVTcnd5U0FGWnphWUFFa1BiQ3JNYzNwTTh3Q3FZTkduWGQ4QzQzd3V0?=
 =?utf-8?B?SzYxNEpqcDU0bklmendtS0VBZ0o3UjVPd3RnaUhKTytBcmd3Mlp6c0ZBb3ZW?=
 =?utf-8?B?d3BxSEtDSHBjUlZ3alVHcHZyTHJvc21jZ3JHcHNZdE5UQlBGZ011V3BTaFhK?=
 =?utf-8?B?cms2WGZVZG5xTm54ZW04VmtNNExMc2E3WWw2ajF2bGgvN2lTbng0V1ArVEth?=
 =?utf-8?B?cWQ0d2pJSzMybzJPYVc4K3RrUkdWV1ZxZVA4K0Z6NGRIa1E1YWVXMklTWmNw?=
 =?utf-8?B?VkE1ejNsWGdqL3VkSlZnUVpLZHprTEpTc2VJdzZrcG1VZGhUR3dBUWFFcnc0?=
 =?utf-8?B?cEtaWmw3emNOU3pyWmRHTXc4dEo2TFRhRS9kMVlKcnZYd3lncURpQ0lVQXdm?=
 =?utf-8?B?Q01GUFFrNzVQODdtSm0veEVFTDAvbHovNDJ3aHBTd1dFdnNvYXM1YUJkVlht?=
 =?utf-8?Q?FZIc+FMkfCUR/1J0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aead51b-5043-4e5f-8954-08de54e50768
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 09:52:58.4180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 77F4tHFwaz55MQqum0MfUtTKUU/crFWKYnYdEIZ9W78kkfMLZKirslSippFY1bcvL2x/GlU39cw1s0VrEu1bZG3O636Con26mN+XubFqzaA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF64191BB3C
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

On Wed, Jan 14, 2026 at 04:19:32PM +0100, Zbigniew Kempczyński wrote:
> Extend support of compute-square calculation in IGT to xe3p platforms
> like CrescentIsland.
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> ---
> v2 - remove unnecessary kernel_addr variable and reuse
>      XE2_ADDR_STATE_CONTEXT_DATA_BASE definition (Francois)
> ---
>  lib/intel_compute.c                | 231 ++++++++++++++++++++++++++++-
>  lib/intel_compute_krn_square.h     |  41 +++++
>  lib/intel_compute_square_kernels.c |   5 +
>  lib/xehp_media.h                   |   1 +
>  4 files changed, 277 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/intel_compute.c b/lib/intel_compute.c
> index a555f908b1..397cef0ae9 100644
> --- a/lib/intel_compute.c
> +++ b/lib/intel_compute.c
> @@ -50,6 +50,8 @@
>  #define OFFSET_BINDING_TABLE		0x10000
>  
>  #define XE2_ADDR_STATE_CONTEXT_DATA_BASE	0x9000000ULL
> +#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
> +
>  #define OFFSET_STATE_SIP			0xFFFF0000
>  
>  #define USER_FENCE_VALUE			0xdeadbeefdeadbeefull
> @@ -66,6 +68,7 @@
>  #define DP_PIPELINE_FLUSH		(1 << 2)
>  #define WRITE_IMM_DATA			(1 << 0)
>  #define WRITE_TIMESTAMP		(3 << 0)
> +#define XE3P_WRITE_IMM_DATA		(1 << 16)
>  
>  /*
>   * TGP  - ThreadGroup Preemption
> @@ -109,6 +112,17 @@ struct bo_execenv {
>  	struct user_execenv *user;
>  };
>  
> +struct inline_data {
> +	union {
> +		uint32_t dw[16];
> +
> +		struct {
> +			uint32_t indirect_addr_lo;
> +			uint32_t indirect_addr_hi;
> +		} xe3p;
> +	};
> +};
> +
>  static void bo_randomize(float *ptr, int size)
>  {
>  	srand(time(NULL));
> @@ -1578,7 +1592,6 @@ static void xe2lpg_compute_exec_compute(int fd,
>  	addr_bo_buffer_batch[b++] = 0xE0004000;
>  	addr_bo_buffer_batch[b++] = 0x00000000;
>  
> -#define XE2_STATE_CONTEXT_DATA_BASE_ADDRESS ((3 << 29) | (0 << 27) | (1 << 24) | (11 << 16) | (1 << 0))
>  	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
>  	// Split into low and high 32 bits
>  	addr_bo_buffer_batch[b++] = addr_state_contect_data_base & 0xFFFFFFFF; // Mask the low 32 bits ;
> @@ -1902,6 +1915,217 @@ static void xe2lpg_compute_exec(int fd, const unsigned char *kernel,
>  	bo_execenv_destroy(&execenv);
>  }
>  
> +static void xe3p_compute_exec_compute(int fd,
> +				      const struct inline_data *idata,
> +				      uint32_t *addr_bo_buffer_batch,
> +				      uint64_t kernel_start_pointer,
> +				      uint64_t context_data_base_addr,
> +				      bool threadgroup_preemption)
> +
> +{
> +	int b = 0;
> +	uint8_t uc_mocs = intel_get_uc_mocs_index(fd);
> +
> +	igt_assert(idata);
> +	igt_debug("kernel addr         : %"PRIx64"\n", kernel_start_pointer);
> +
> +	addr_bo_buffer_batch[b++] = STATE_BASE_ADDRESS  | 0x14; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x40048000; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw6 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw7 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFE; /* dw18 */
> +	addr_bo_buffer_batch[b++] = 0x00000040; /* dw19 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw20 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw21 */
> +
> +	addr_bo_buffer_batch[b++] = XEHP_STATE_COMPUTE_MODE | 1;
> +	addr_bo_buffer_batch[b++] = 0x14001400;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +
> +	addr_bo_buffer_batch[b++] = XE2_STATE_CONTEXT_DATA_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr;
> +	addr_bo_buffer_batch[b++] = context_data_base_addr >> 32;
> +
> +	addr_bo_buffer_batch[b++] = XE3P_COMPUTE_WALKER2 | 0x3e; /* dw0 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw1 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw2 */
> +	addr_bo_buffer_batch[b++] = 0x008004A0; /* dw3 */
> +	addr_bo_buffer_batch[b++] = 0xBE040000; /* dw4 */
> +	addr_bo_buffer_batch[b++] = 0xFFFFFFFF; /* dw5 */
> +	addr_bo_buffer_batch[b++] = 0x000001FF; /* dw6 */
> +
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = XE2_THREADGROUP_PREEMPT_XDIM; // Thread Group ID X Dimension
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00000004;

Sorry, realized after sending previous email: could we parameterize
work_size here as it is done in xe2lpg_compute_preempt_exec()?

> +
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw8 */
> +	addr_bo_buffer_batch[b++] = 0x00000001; /* dw9 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw10 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw11 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw12 */
> +	addr_bo_buffer_batch[b++] = 0x00010000; /* dw13 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw14 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw15 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw16 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw17 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw18 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer; /* dw19 */
> +	addr_bo_buffer_batch[b++] = kernel_start_pointer >> 32; /* dw20 */
> +	if (threadgroup_preemption)
> +		addr_bo_buffer_batch[b++] = 0x00000002;
> +	else
> +		addr_bo_buffer_batch[b++] = 0x00100002; // Enable Mid Thread Preemption BitField:20
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw22 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw23 */
> +	addr_bo_buffer_batch[b++] = 0x0C000010; /* dw24 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw25 */
> +	addr_bo_buffer_batch[b++] = 0x00000400; /* dw26 */
> +
> +	addr_bo_buffer_batch[b++] = DP_SS_CACHE_FLUSH | uc_mocs << 4 |
> +				    DP_PIPELINE_FLUSH | XE3P_WRITE_IMM_DATA; /* dw27 */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH;		/* dw28 (postsync addr) */
> +	addr_bo_buffer_batch[b++] = ADDR_BATCH >> 32;	/* dw29 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) POST_SYNC_VALUE;		/* dw30 */
> +	addr_bo_buffer_batch[b++] = (uint32_t) (POST_SYNC_VALUE >> 32);	/* dw31 */
> +
> +	/* inline data 32 - 47 */
> +	memcpy(&addr_bo_buffer_batch[b], idata, sizeof(*idata));
> +	b += 16;
> +
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw48 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw49 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw50 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw51 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw52 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw53 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw54 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw55 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw56 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw57 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw58 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw59 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw60 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw61 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw62 */
> +	addr_bo_buffer_batch[b++] = 0x00000000; /* dw63 */
> +
> +	addr_bo_buffer_batch[b++] = MI_BATCH_BUFFER_END;
> +}
> +
> +static void xe3p_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				      uint64_t addr_input,
> +				      uint64_t addr_output,
> +				      uint32_t loop_count)
> +{
> +	int b = 0;
> +
> +	addr_bo_buffer_batch[b++] = addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_input >> 32;
> +	addr_bo_buffer_batch[b++] = addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] = addr_output >> 32;
> +	addr_bo_buffer_batch[b++] = loop_count;
> +	addr_bo_buffer_batch[b++] = 0x00000200;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000001;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +	addr_bo_buffer_batch[b++] = 0x00000000;
> +}
> +
> +/**
> + * xe3p_compute_exec - run a pipeline compatible with XE3P
> + *
> + * @fd: file descriptor of the opened DRM device
> + * @kernel: GPU Kernel binary to be executed
> + * @size: size of @kernel
> + * @eci: engine instance class
> + * @user: user defined exec environment
> + * @alloc_prefs: memory allocation preference
> + */
> +static void xe3p_compute_exec(int fd, const unsigned char *kernel,
> +			      unsigned int size,
> +			      struct drm_xe_engine_class_instance *eci,
> +			      struct user_execenv *user,
> +			      enum execenv_alloc_prefs alloc_prefs)
> +{
> +	struct bo_dict_entry bo_dict[] = {
> +		{ .addr = ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +		  .name = "instr state base"},
> +		{ .addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START,
> +		  .size =  0x1000,
> +		  .name = "indirect object base"},
> +		{ .addr = ADDR_INPUT,
> +		  .name = "addr input"},
> +		{ .addr = ADDR_OUTPUT,
> +		  .name = "addr output" },
> +		{ .addr = ADDR_BATCH,
> +		  .size = SIZE_BATCH,
> +		  .name = "batch" },
> +		{ .addr = XE2_ADDR_STATE_CONTEXT_DATA_BASE,
> +		  .size = 0x10000,
> +		  .name = "state context data base"},
> +	};
> +	struct inline_data idata = {};
> +	struct bo_execenv execenv;
> +	float *input_data, *output_data;
> +	uint64_t indirect_addr = ADDR_GENERAL_STATE_BASE + OFFSET_INDIRECT_DATA_START;
> +	int entries = ARRAY_SIZE(bo_dict);
> +
> +	bo_execenv_create(fd, &execenv, eci, user);
> +
> +	/* Sets Kernel size */
> +	bo_dict[0].size = ALIGN(size, 0x1000);
> +	bo_dict[2].size = size_input(execenv.array_size);
> +	bo_dict[3].size = size_output(execenv.array_size);
> +
> +	bo_execenv_bind(&execenv, alloc_prefs, bo_dict, entries);
> +
> +	memcpy(bo_dict[0].data, kernel, size);
> +	memset(bo_dict[1].data, 0, 4096);
> +
> +	xe3p_create_indirect_data(bo_dict[1].data, ADDR_INPUT, ADDR_OUTPUT,
> +				  0x400);
> +	idata.xe3p.indirect_addr_lo = indirect_addr;
> +	idata.xe3p.indirect_addr_hi = indirect_addr >> 32;
> +
> +	input_data = get_input_data(&execenv, user, bo_dict[2].data);
> +	output_data = get_output_data(&execenv, user, bo_dict[3].data);
> +
> +	xe3p_compute_exec_compute(fd, &idata,
> +				  bo_dict[4].data,
> +				  ADDR_INSTRUCTION_STATE_BASE + OFFSET_KERNEL,
> +				  XE2_ADDR_STATE_CONTEXT_DATA_BASE, false);
> +
> +	bo_execenv_exec(&execenv, ADDR_BATCH);
> +
> +	if (!user || (user && !user->skip_results_check))
> +		bo_check_square(input_data, output_data, execenv.array_size);
> +
> +	bo_execenv_unbind(&execenv, bo_dict, entries);
> +	bo_execenv_destroy(&execenv);
> +}
> +
>  /*
>   * Compatibility flags.
>   *
> @@ -1968,6 +2192,11 @@ static const struct {
>  		.compute_exec = xe2lpg_compute_exec,
>  		.compat = COMPAT_DRIVER_XE,
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.compute_exec = xe3p_compute_exec,
> +		.compat = COMPAT_DRIVER_XE,
> +	},
>  };
>  
>  static const struct intel_compute_kernels
> diff --git a/lib/intel_compute_krn_square.h b/lib/intel_compute_krn_square.h
> index 2b616f136b..0490a692ef 100644
> --- a/lib/intel_compute_krn_square.h
> +++ b/lib/intel_compute_krn_square.h
> @@ -288,4 +288,45 @@ static const unsigned char xe3lpg_kernel_square_bin[] = {
>  	0x04, 0x00, 0x00, 0x00, 0x0c, 0x14, 0x20, 0x30, 0x00, 0x00, 0x00, 0x00
>  };
>  
> +static const unsigned char xe3p_kernel_square_bin[] = {
> +	0x61, 0x00, 0x00, 0x80, 0x30, 0x43, 0x61, 0x60, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x22, 0x01, 0x80, 0x06, 0x18, 0x00, 0x05,
> +	0x0c, 0x04, 0x28, 0xf0, 0x00, 0x00, 0x00, 0x96, 0x61, 0x80, 0x10, 0x80,
> +	0x20, 0x02, 0x05, 0x02, 0x04, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x66, 0x09, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80, 0x00, 0x80, 0x00, 0x02,
> +	0xc0, 0x04, 0x00, 0x40, 0x01, 0x09, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x82, 0x00, 0x00,
> +	0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x41, 0x21, 0x03, 0x80, 0x60, 0x06, 0x05, 0x03, 0x54, 0x05, 0x00, 0x06,
> +	0x14, 0x02, 0x10, 0x00, 0x61, 0x00, 0x14, 0x00, 0x10, 0x01, 0x06, 0x0d,
> +	0x04, 0x01, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x52, 0x19, 0x14, 0x00,
> +	0x60, 0x06, 0x04, 0x06, 0x04, 0x03, 0x06, 0x01, 0x04, 0x0d, 0x84, 0x04,
> +	0x70, 0x19, 0x14, 0x00, 0x20, 0x02, 0x01, 0x00, 0x04, 0x06, 0x10, 0x52,
> +	0x44, 0x05, 0x10, 0x00, 0x2e, 0x00, 0x14, 0x14, 0x00, 0xc0, 0x00, 0x00,
> +	0x60, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x61, 0x00, 0x00, 0x80,
> +	0x70, 0x07, 0x41, 0x60, 0x04, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x61, 0x00, 0x00, 0x80, 0x70, 0x07, 0x61, 0x60, 0x24, 0x05, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x33, 0x43, 0x17, 0x00, 0x06, 0x11, 0x00, 0x08,
> +	0x14, 0x06, 0x00, 0xf0, 0x00, 0x00, 0x00, 0x50, 0x41, 0x83, 0x14, 0x00,
> +	0xa0, 0x02, 0x05, 0x0a, 0x04, 0x08, 0x10, 0x0a, 0x04, 0x08, 0x00, 0x00,
> +	0x33, 0x24, 0x15, 0x00, 0x04, 0x19, 0x00, 0x00, 0x14, 0x06, 0x00, 0xf0,
> +	0x14, 0x0a, 0x04, 0x50, 0x2f, 0x00, 0x14, 0x00, 0x00, 0x40, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x80,
> +	0x01, 0x00, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x30, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00
> +};
> +
>  #endif /* __INTEL_COMPUTE_KRN_SQUARE_H__ */
> diff --git a/lib/intel_compute_square_kernels.c b/lib/intel_compute_square_kernels.c
> index 3c888ebd85..4d69f270e9 100644
> --- a/lib/intel_compute_square_kernels.c
> +++ b/lib/intel_compute_square_kernels.c
> @@ -86,5 +86,10 @@ const struct intel_compute_kernels intel_compute_square_kernels[] = {
>  		.loop_kernel = xe3lpg_kernel_loop_bin,
>  		.loop_kernel_size = sizeof(xe3lpg_kernel_loop_bin),
>  	},
> +	{
> +		.ip_ver = IP_VER(35, 11),
> +		.size = sizeof(xe3p_kernel_square_bin),
> +		.kernel = xe3p_kernel_square_bin,
> +	},
>  	{}
>  };
> diff --git a/lib/xehp_media.h b/lib/xehp_media.h
> index fb65b8f207..20227bd3a6 100644
> --- a/lib/xehp_media.h
> +++ b/lib/xehp_media.h
> @@ -18,6 +18,7 @@
>  #define XEHP_STATE_COMPUTE_MODE		GFXPIPE(0, 1, 5)
>  #define XEHP_CFE_STATE			GFXPIPE_XEHP(2, 2, 0)
>  #define XEHP_COMPUTE_WALKER		GFXPIPE_XEHP(2, 2, 2)
> +#define XE3P_COMPUTE_WALKER2		GFXPIPE_XEHP(2, 2, 8)
>  
>  #define BITRANGE(start, end) (end - start + 1)
>  
> -- 
> 2.43.0
> 
