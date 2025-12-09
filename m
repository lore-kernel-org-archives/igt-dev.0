Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E28D3B996
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 21:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D86210E21E;
	Tue,  9 Dec 2025 21:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ah4paMQV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C760E10E21E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 21:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765315417; x=1796851417;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+rDnrxBXo9ua07gBwRjKj97dNHEPuC10QsN3fxdNKg4=;
 b=ah4paMQVJOkgcBCeZ1h2NXT4lbAGA+9nO0D/EVQdrffWAY+ALnAgMWHr
 T3XIOLmohhl2DwOmH3nWT20G8afCx8FbwCCO77+lH129sn5u7oBhb9EM0
 TfmqcQaQVgvzQeo7JbqUMyZQXg4qeZVp0BSGllaASw/mzkLtgQk4A6q5R
 Nl3jVgoo4XFRRF/XUWI7l7GSUaLcFdmR/Z9NIMlcj/ZOPESSECh5Gu6yn
 +9l0CEk88y4TZMvPX5u856c0JNnmpDEIXItWXX7t0YmYVbaDYnUZPod2G
 3A9WmbINqMBmX1IRFrnj5rCRdP8H8tP/+ImITxR2x3p5ujcB42+D/U7eT w==;
X-CSE-ConnectionGUID: E2g6R3klRPiVt0qQ3yGfXw==
X-CSE-MsgGUID: BZgJa3gBS5W6zCfL0pB53g==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54826322"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="54826322"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:23:37 -0800
X-CSE-ConnectionGUID: bnOu3sy9TUqExiTLxPf0JA==
X-CSE-MsgGUID: BisBD+aATOCddmOAK2hSAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200498762"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 13:23:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:23:36 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 13:23:36 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 13:23:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHjvI9wPgcR8DlMFHAPzzF2Iwzu0l9t3SxjG0S78SncJImqpcBYNUJl0x0VwczrvrbyA8GNDEkbydf4MTuuo4F+Kt3fFSS8vssfLdfN9k0Trib++Pe0dcvf3Jobw0r/Q28EmcSJKW1BlXwapA9LS9csWAj4BkeTFAJ2megNaoK9JcdRq3Uoufz6EtT+aI1E7EHo1lgxhlmJE04R6lApqRMSPg2UPh2Idr5AptfeGdfb2TFIftl6h9L8j6F9hSZQuFacuvPwudu12PKT95JcIBelZph2WTuoDGxkwNU2UNbKNF4SnujCvFltekrknKiHQxpO95qhyb5k78m0UMAlhmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rDnrxBXo9ua07gBwRjKj97dNHEPuC10QsN3fxdNKg4=;
 b=FXTmMMJ8odK6Ta/6Kpf66dyS3Cr2iLILQ9eGL370gN/y4Dy8h+9vrHo5CMrMYppYM191Xgiu1yF2A9oXCXhPcSreZrPrYwyh43HaJsNDXq5VIQd8LaF3zUDvIRa2VSy2iKzmeMtGdinYmkW59kdHhMSNkaS5zg9PRVdkUWhi8mm/5eoZhv3KmuRnZO70dmFo0ZrIt4KdG6HxcscsyrA3LywnJHdkCNn5np/MuFuhRgeRt3SYrXUVFJJEuySIe+WgCAOnacSJhbv16k6v7dvOhEByUpxtk2bddjMRf0lHVE0tDSqL2On9jtFchEWY5g3R7n6YH9X9pjWNsE2LTCU51w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH0PR11MB7658.namprd11.prod.outlook.com (2603:10b6:510:28d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 21:23:33 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 21:23:33 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v3 12/18] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Topic: [PATCH v3 12/18] tests/intel/xe_exec_multi_queue: Add fault mode
 test
Thread-Index: AQHcaLsQDY6l1Y1HRkWz9D4zRYUyLLUZ0qMA
Date: Tue, 9 Dec 2025 21:23:33 +0000
Message-ID: <edc012872d474d68007c536b503e82e219894e72.camel@intel.com>
References: <20251209032208.1540217-20-niranjana.vishwanathapura@intel.com>
 <20251209032208.1540217-32-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251209032208.1540217-32-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH0PR11MB7658:EE_
x-ms-office365-filtering-correlation-id: e485652a-7681-455b-866d-08de37693527
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?aGkyZzZDOWlIa3plUG5qbGYvOXF6aFZsM21kZUdvOHBIV2NIMllheXdTUFBH?=
 =?utf-8?B?dWZKNHk5bTVTcThhMEhTRWtKNnZwd2VZVURBdmxpWGJGb0todTRYUHRzK1BZ?=
 =?utf-8?B?alFWR2NyZWhIeFlKTjlTNHc2OUZlUlRHdE1oVVUwMmRORWRMS0x2ZEZqcyto?=
 =?utf-8?B?RVlwL3RZaGIzZzRtL2FUUkNETEVSWnVqdnRDRHZrOEFZKyt4UVp0cC9hYUE1?=
 =?utf-8?B?Qy9HSStGWkVtaXEwK041OS82ejNtanNaY0dxdDY2azVKMitrVDYrdjc5WFp2?=
 =?utf-8?B?UnFSMlF0d2RiWTM2K3ZCOUhBbVZrSnY2Qmp5dUhySW9YbnFZRXZBUjcvTm4v?=
 =?utf-8?B?MWRXSVF3TGpPQlM2M0tIdjJNZC9ZL0tUV09sa0tzNmJCS0FOa3JTS3U5WHFE?=
 =?utf-8?B?MTMzbnhDdExDVjRKOGhTSUF0dFZkazd5TDNodGRCcGpFSHgySk16ZmR1WFZx?=
 =?utf-8?B?cGt4UlBINmJNT3pOdVRISXpiYmpxY05BTHJCYmplTU5Nc0dFNEVXS0M2OWht?=
 =?utf-8?B?LzU1aFNQTkZsM090bUowL2t1UmV5ZWxoK29lUjNaVU9OS0ZTY3ZKcVAyS0lB?=
 =?utf-8?B?cFZCUWhqOVVNeDFNWFFsK254QVRzQjRKekc5REJpSW9Sa1RERUV3czY3YlZH?=
 =?utf-8?B?ZW92cU1Ednh4V2IxSWtqT1kvTFVlZDhzWjJBUVhqK0F5NVRaQkpFME9LYWJL?=
 =?utf-8?B?NVl1aFVNVGpVREVDalpJcHZtNjJxTXoxWjFQMU5PUTB3MEhZTnZpVmd6bVNq?=
 =?utf-8?B?WlN5TUg3bGdUU1F4M2NKN3RBWklVKzZpa0k2R2dtelhnYVZ1NnhhY25FSnJK?=
 =?utf-8?B?dU0vWDVPV3FtU1lkdWZpRGRsTU1iWUpQUXBMV1RvMGxVUWgvMG8xRGtFOXBJ?=
 =?utf-8?B?ZzRkSVVPMjIvQXZvRVVJK1pTSWtNS3BSUmo5djd6RWgvcFRyNnhvWWQ0NEY1?=
 =?utf-8?B?dW5sY2tRb3RmU0o0ZDNKb2lEemNmcUo0TVk0SFA4ZXlqalVsNGNaaFVZSGZ4?=
 =?utf-8?B?UkZrNEVnL1ZFMksrdWo2a0FCR3RtRWU1Yk0zb0dYOHl5UW5TeGpnK3RSU3Yr?=
 =?utf-8?B?ZW1KWExBVjJud3Q3NDBsZDA3MWdGTzBDTEYrM3g1RHd1NzV1TGpwYWh6QXp5?=
 =?utf-8?B?NFhNUXBqVlplUmZCbk5pdjRpNUlKZ3ZBRjI3THlCOFNhemRRS2hmdXJ1Wkd4?=
 =?utf-8?B?S2NzT0tyL2twbWdNcDVsaWxQVXZ0N0ZmcUZTa3Qyem1UcUw5YTN6MllaKzZy?=
 =?utf-8?B?cWp5bUg0ZkY5Tld2akVkRmFxVWRWOEMwVVh3RHdOZndzYlBaK1gxSEM1eGlC?=
 =?utf-8?B?SkxLRWVJNWdsTXJqUFpTL1YxSkQzOXY3b0tNMStTT2xaYmhJSi9hNTRDaXBW?=
 =?utf-8?B?OVFsc1I2ZUx1TmxSZXM2Uk45MUZsZDN0ako4OE5Hdk1lZEhSV01OcG9icFJh?=
 =?utf-8?B?SUh0VG9sdXRCUUF0WFBUK2kvOUhnU21LWS8xMEUyT3lidjJKWmFpZEEvb0NK?=
 =?utf-8?B?Um9veXNGakZpc3ZtZm1XR2doT1pDRnRXeUltQjRDcXI4VjJhN2RqbU81aEp0?=
 =?utf-8?B?ZlRMV1lqNlNncUFaWnBwdGlwU1c0YWM0VVNxYVVZSCtlb1pwUXFSUXlhSkVT?=
 =?utf-8?B?R25nTE9GMXhMNHo5anNPUjhxVmEvT0h2ODVXN1Arc2Fodk44MHV0djZkUmgx?=
 =?utf-8?B?Ym9BQ0dNSmRNU0wveThUckdDVmNud3JVRGMzRi9KOG1oTDNsWWhvZG4ydUxJ?=
 =?utf-8?B?SFZDZGE1dnBvRkJiS0hnUVNDVmhQbFRsVlRnSlRxVHZHc1Zidk8yWnpQNmw0?=
 =?utf-8?B?amtUVDc4VUF5MnFOTnE2VUNQRVhkeGl1cDRHd1NKM3g0ZGlkcGlyNTZ6a01a?=
 =?utf-8?B?NjI2Z0VITmRHa1RPbWFnNWJIaEIwR2dkQ0xsV01ML3kwc3NuRzNiK1h1MVVh?=
 =?utf-8?B?TmhPajRSUmxyYTRGTklvOElCM2thd2E2V3NrUTEyUk5VUWJ2TC9jUEl3U1ZV?=
 =?utf-8?B?eGhWNFcyN2ZQc2R0bCtoblNlZEJ5Vktrdlp0bGx4RWl4RVJ1U2RVVitJNk9F?=
 =?utf-8?Q?bCZpC8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEdKajZUTGV3VlZLV3drUU5PS0NrRUNyME5hVDZRUHQxZnJmR2UrUDF2aTNo?=
 =?utf-8?B?S1VvMUNKaUNWVHgwTi96TmpUTlRzOGZIVkNpKzZIN1IxV0I2Y2htZEJUNi8y?=
 =?utf-8?B?a1lPdGJtL05iWjBITW13dXd6Y3loS1RxTGpvZTlJcUJiekFxWXREaDgveU9H?=
 =?utf-8?B?Y0twM1BMQkNjNmY0d3orMGZOTkNPOFE4eWZuR1RnMWNuem82cFdQWHNjQXJ4?=
 =?utf-8?B?eU1jNjNJSlhOOWJSbU8rbnkvVFJGZHFCem5lam5BSkU5ZnIvYTdkY0JveDVK?=
 =?utf-8?B?YUxFYU1YOFA4UmorSEN6Y2owcjB4K2ROVml5cVZwNVgvUmQ3b1BZZFNaMkJq?=
 =?utf-8?B?SXQwY29EZE5jeklOaFFsYmF1RzRiVVkwWHBRQmlNdlNPWG4zUDBZNERmV0dk?=
 =?utf-8?B?ZkpzTy9PVXJMQlhqaCtKS0ViOHBWUWljQU04cWFQUThQMWdyR0Vua09QTVVL?=
 =?utf-8?B?U3hpU2hoT01DQytlSTgvSmwrUFhHbUNjREgxQmhweVl4V0x1UnNzMHJpQWEx?=
 =?utf-8?B?T1FadW1FOVdHQlZjOFRDRWVPOFNEZy9nN0JTTFo1MThsSVpuS0sreWVYL29R?=
 =?utf-8?B?cCttdWNKQVRNRFZ1ZGxjZGwzbjZ6bFFiZC9KOTdVa3QyYkxhb1IvWEljVkxp?=
 =?utf-8?B?WDhqSHh0a05OZEN3aStnbElCS3E0aURvVEIxaDd6OHA2RHBNVDEzN0pBOGMw?=
 =?utf-8?B?cmtxb2FmZVhaMjFMbXZObXQzaUJCT0pITnRrellnaVRNQ0Y3WHgvRDFuVHBP?=
 =?utf-8?B?OTc3MUQ3eXpGU2NqK1d6Q0c0Z0p5Q2tRaU1ITnI2NHRhdTk3WmQ3K0dHVGN2?=
 =?utf-8?B?eGQrdWc4RDVveFgvMG5IRTVnUTI5eDJKa3JhMDVPV3JVUVREVC9JVVBZU3ND?=
 =?utf-8?B?aTNqTjU4MTlaTDNtZGdkaElzcFk3U0l6UXpaa0RGK1lEV1dVTkdUR0orZ0k0?=
 =?utf-8?B?OTdBejZmL0VjQUNlQTZmd0d5dFpjVXJYZ3hRQS8xYWZaN2FWOE1rZnc5OUw1?=
 =?utf-8?B?TUtSRFpTMEo0SXlnU0RISXVMRjZ4c05BOFpOWWcrWTBwdXpTZTVxZ2dNeWhO?=
 =?utf-8?B?aGtGZ1BuSHFzc1U0c1MxcldZLzk2cExtV1NmckpzNVlpQTlrWEpQa2RleGUx?=
 =?utf-8?B?bitMMFlRV2pXYWhmaEY3UlMxZDMvS252eFgzcVA5RVE4aDFUd1dlS29HTVkr?=
 =?utf-8?B?MVBaa2t0S3ZyZktPUUMyRDlnTkNaeWR2S3VpbDNPSGhkZENBeWVQa25MSmtS?=
 =?utf-8?B?amVaS2I3aTNLZU9nVE11alVxWmpJK1duR1VKSnNXVFp1VXhPeExDdG4yZjB1?=
 =?utf-8?B?OXZOZ3hZT085dFBpN2lpajJpb2I4UnhXN280djVIMnRLNVIwU2xieXkrcjdw?=
 =?utf-8?B?dkZmcWtDV2lzYldnbU81YzcvWFVzTDRhbSs0VDNybzUxVUp1ek9FYWQ2NUk0?=
 =?utf-8?B?MndBenVRMGU0TXdlVVpwRlQ3Y3ltVXZCUWdRYmx1MzdZalVvNVVYUmx4eE5l?=
 =?utf-8?B?TEJJb2hldFhsVkU3V1Q5c3pCTXVLdE9SWlVKSEtWK2ZCQ3JsaTRIQWduZmFR?=
 =?utf-8?B?SU1CSitUVXczQWw5UWh1bldTcStpOHp5N2N0Q1dYRkFSOTFObHRPRUdHaURU?=
 =?utf-8?B?TVFleWRKWm4xdGRJU3RQOHV2alk2ZTlaeEFab2hINkluRVF6WGZXTkkzVHdK?=
 =?utf-8?B?bzBjeHRiQW5HMXpBSERvNWhybFlmN3lLMFhMSmgyQkFpNGYwNUF3ZXQrSldI?=
 =?utf-8?B?Z256aEFpc3FRaW9pMWRhcUxWblVvZ2ZnUFBLMndlL1Zick5VUlhJMStodEEw?=
 =?utf-8?B?ckMvRnVCMFZFbHZFNmx5VnlhY2NkZGJBSThGWlNSOCt3eERwVytxUi9JbUor?=
 =?utf-8?B?b2cwT2x1eklpdk9iRXd3TlBqSmRGTmtPVHRlaXp6YXBCUmNTV3lJSTBoekQr?=
 =?utf-8?B?b29hMTg3c3kvWGJxTjNLTzdaS21iRG03a2NsLzhaUDMxNEtVQitLODAvU3Zi?=
 =?utf-8?B?NytCc3VsYzQvcWdRWHUwSk1RMmJ3QmZZMHdQUmYvb0x3dUdHMDArTnQ4dFR6?=
 =?utf-8?B?MEF1ajFWQ0FEY1FiZ3RLQ25qSzR6alV1T3FVSUJCODViZXB1bk9iUEVSb1Fz?=
 =?utf-8?B?eTRVZ3k2QzJlWTVpWmYzQ1U0TldTSEJ4ZnllN0JIVjhIRkVPUktSNHdQeFF0?=
 =?utf-8?B?Qmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8FFD7D5B6BB4342809EAC6F373C296A@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e485652a-7681-455b-866d-08de37693527
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2025 21:23:33.5652 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p7mhRSdQlDE7lG1wI/XN7SudmCCAQa+ySuAqfSQGThkfksNx+KkL2ROapIv5IG5aCmEBo0u78WzkUXUX7YKCHjhQsNiS4P/cStJGphYS/+Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7658
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

T24gTW9uLCAyMDI1LTEyLTA4IGF0IDE5OjIyIC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IE5ha3NodHJhIEdveWFsIDxuYWtzaHRyYS5nb3lhbEBpbnRlbC5j
b20+Cj4gCj4gVGVzdCBtdWx0aXEgZnVuY3Rpb25hbGl0eSB3aXRoIGZhdWx0IG1vZGUuIEFkZGlu
ZyBhIGZsYWcgY2hlY2sgZm9yCj4geGVfdm1fY3JlYXRlIGZvciBmYXVsdCBtb2RlIHRlc3QgY2Fz
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmFrc2h0cmEgR295YWwgPG5ha3NodHJhLmdveWFsQGlu
dGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBOaXJhbmphbmEgVmlzaHdhbmF0aGFwdXJhCj4gPG5p
cmFuamFuYS52aXNod2FuYXRoYXB1cmFAaW50ZWwuY29tPgo+IFJldmlld2VkLWJ5OiBOYWtzaHRy
YSBHb3lhbCA8bmFrc2h0cmEuZ295YWxAaW50ZWwuY29tPgoKUmV2aWV3ZWQtYnk6IFN0dWFydCBT
dW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+Cgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwv
eGVfZXhlY19tdWx0aV9xdWV1ZS5jIHwgMjEgKysrKysrKysrKysrKysrKysrKystCj4gwqAxIGZp
bGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS90ZXN0cy9pbnRlbC94ZV9leGVjX211bHRpX3F1ZXVlLmMKPiBiL3Rlc3RzL2ludGVsL3hl
X2V4ZWNfbXVsdGlfcXVldWUuYwo+IGluZGV4IGNjYzg2MmZiOS4uZjRjMjNlNTQxIDEwMDY0NAo+
IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+ICsrKyBiL3Rlc3RzL2lu
dGVsL3hlX2V4ZWNfbXVsdGlfcXVldWUuYwo+IEBAIC0zMSw2ICszMSw3IEBACj4gwqAjZGVmaW5l
IFBSRUVNUFRfTU9ERcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDMpCj4gwqAjZGVmaW5l
IERZTl9QUklPUklUWcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDQpCj4gwqAjZGVmaW5l
IElOVkFMSURBVEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCgweDEgPDwgNSkKPiArI2RlZmlu
ZSBGQVVMVF9NT0RFwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAoMHgxIDw8IDYpCj4gwqAKPiDC
oCNkZWZpbmUgTUFYX0lOU1RBTkNFIDkKPiDCoAo+IEBAIC0yNTgsNyArMjU5LDEyIEBAIHRlc3Rf
cHJlZW1wdF9tb2RlKGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5j
ZSAqZWNpLCBpbnQgbnVtX3BsYWMKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGZk
ID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9YRSk7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgaWd0
X2Fzc2VydChuX2V4ZWNfcXVldWVzIDw9IE1BWF9OX0VYRUNfUVVFVUVTKTsKPiAtwqDCoMKgwqDC
oMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xSX01PREUs
IDApOwo+ICvCoMKgwqDCoMKgwqDCoGlmIChmbGFncyAmIEZBVUxUX01PREUpCj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoHZtID0geGVfdm1fY3JlYXRlKGZkLCBEUk1fWEVfVk1fQ1JF
QVRFX0ZMQUdfTFJfTU9ERSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0ZBVUxU
X01PREUsCj4gMCk7Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB2bSA9IHhlX3ZtX2NyZWF0ZShmZCwgRFJNX1hFX1ZNX0NSRUFURV9GTEFHX0xS
X01PREUsCj4gMCk7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgwqBib19zaXplID0geGVfYmJfc2l6ZShm
ZCwgc2l6ZW9mKCpkYXRhKSAqIG5fZXhlY3MpOwo+IMKgCj4gwqDCoMKgwqDCoMKgwqDCoGlmIChm
bGFncyAmIFVTRVJQVFIpIHsKPiBAQCAtNTk3LDYgKzYwMywxMiBAQCB0ZXN0X2xlZ2FjeV9tb2Rl
KGludCBmZCwgc3RydWN0Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLCBpbnQg
bnVtX3BsYWNlCj4gwqAgKiBAcHJlZW1wdC1tb2RlLXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZSBwcmlvcml0eQo+IMKgICogQHBy
ZWVtcHQtbW9kZS1jbG9zZS1mZDrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBwcmVlbXB0LW1vZGUgY2xvc2UgZmQKPiB3aXRob3V0IGRlc3Ryb3lpbmcgZXhlYyBxdWV1
ZXMKPiDCoCAqIEBwcmVlbXB0LW1vZGUtZHluLXByaW9yaXR5OsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBwcmVlbXB0LW1vZGUgZHluYW1pYwo+IHByaW9yaXR5Cj4gKyAqIEBwcmVl
bXB0LW1vZGUtZmF1bHQtYmFzaWM6wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
cHJlZW1wdC1tb2RlLWZhdWx0LQo+IG1vZGUgYmFzaWMKPiArICogQHByZWVtcHQtbW9kZS1mYXVs
dC11c2VycHRyOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHByZWVtcHQtbW9kZS0KPiBmYXVsdC1tb2RlIHVzZXJwdHIKPiArICogQHByZWVtcHQtbW9kZS1m
YXVsdC11c2VycHRyLWludmFsaWRhdGU6wqDCoMKgwqDCoHByZWVtcHQtbW9kZS1mYXVsdC0KPiBt
b2RlIHVzZXJwdHIgaW52YWxpZGF0ZQo+ICsgKiBAcHJlZW1wdC1tb2RlLWZhdWx0LXByaW9yaXR5
OsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHByZWVtcHQtbW9kZS1mYXVsdC0KPiBtb2Rl
IHByaW9yaXR5Cj4gKyAqIEBwcmVlbXB0LW1vZGUtZmF1bHQtY2xvc2UtZmQ6wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcHJlZW1wdC1tb2RlLWZhdWx0LQo+IG1vZGUgY2xvc2UgZmQKPiAr
ICogQHByZWVtcHQtbW9kZS1mYXVsdC1keW4tcHJpb3JpdHk6wqDCoMKgwqDCoMKgwqDCoMKgwqDC
oHByZWVtcHQtbW9kZS1mYXVsdC0KPiBtb2RlIGR5bmFtaWMgcHJpb3JpdHkKPiDCoCAqLwo+IMKg
c3RhdGljIHZvaWQKPiDCoHRlc3RfZXhlYyhpbnQgZmQsIHN0cnVjdCBkcm1feGVfZW5naW5lX2Ns
YXNzX2luc3RhbmNlICplY2ksIGludAo+IG51bV9wbGFjZW1lbnQsCj4gQEAgLTY1MSw2ICs2NjMs
MTMgQEAgaWd0X21haW4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVt
cHQtbW9kZS1wcmlvcml0eSIsIFBSRUVNUFRfTU9ERSB8IFBSSU9SSVRZIH0sCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtY2xvc2UtZmQiLCBQUkVFTVBU
X01PREUgfCBDTE9TRV9GRCB9LAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgeyAi
cHJlZW1wdC1tb2RlLWR5bi1wcmlvcml0eSIsIFBSRUVNUFRfTU9ERSB8Cj4gRFlOX1BSSU9SSVRZ
IH0sCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHsgInByZWVtcHQtbW9kZS1mYXVs
dC1iYXNpYyIsIFBSRUVNUFRfTU9ERSB8Cj4gRkFVTFRfTU9ERSB9LAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQtdXNlcnB0ciIsIFBSRUVNUFRf
TU9ERSB8Cj4gRkFVTFRfTU9ERSB8IFVTRVJQVFIgfSwKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgeyAicHJlZW1wdC1tb2RlLWZhdWx0LXVzZXJwdHItaW52YWxpZGF0ZSIsCj4gUFJF
RU1QVF9NT0RFIHwgRkFVTFRfTU9ERSB8Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBVU0VSUFRSIHwgSU5WQUxJREFURSB9LAo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQtcHJpb3JpdHkiLCBQUkVFTVBU
X01PREUgfAo+IEZBVUxUX01PREUgfCBQUklPUklUWSB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQtY2xvc2UtZmQiLCBQUkVFTVBUX01PREUg
fAo+IEZBVUxUX01PREUgfCBDTE9TRV9GRCB9LAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqB7ICJwcmVlbXB0LW1vZGUtZmF1bHQtZHluLXByaW9yaXR5IiwgUFJFRU1QVF9NT0RFIHwK
PiBGQVVMVF9NT0RFIHwgRFlOX1BSSU9SSVRZIH0sCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqB7IE5VTEwgfSwKPiDCoMKgwqDCoMKgwqDCoMKgfTsKPiDCoMKgwqDCoMKgwqDCoMKg
aW50IGZkLCBndCwgY2xhc3M7Cgo=
