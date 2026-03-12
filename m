Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B161FED2E4
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 08:18:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B773A10E9FB;
	Thu, 12 Mar 2026 08:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U5l90mk0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F075610E9F4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773303508; x=1804839508;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=m24OA+Pu3oIz23l1d2kU1q74uZaRol7JiU8tBcGDfcc=;
 b=U5l90mk0PKjnceJOcuXPzt4HTJCBgcw7ERiXgTXOi3hx8HnG+URBwE/e
 Oq4M4Ox3bVpkc6WL4CZcPpW7RWGBz3xWmSggQ3GSKteTXCDywIGVH/775
 A/63TvehOxnFRuMO8Vp+NywZL/8iQvV/8lvb89C4Tdl+lmT8qClSwn5Fc
 +XEf92Iea63rqYAdl9eDNSRcN8ZNlMIjwO++uBxqde0/gI4SBh3pAz6wY
 Y8/b5KX5aXhmTFPaPY5l25XnVbeR9YFPzBaP1YKW0xGr+v3hTW3kEJpfn
 Wu0W1JgYFIeCGWu/KcfPs3AGOxMAMVMrQgrQKPU23CyKJHbnNIOwo/fdZ w==;
X-CSE-ConnectionGUID: 5KzWuemzT/aDpoDX3i5g3w==
X-CSE-MsgGUID: vBxHbC2OR6GRZbqzob1bZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="78237311"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="78237311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:18:27 -0700
X-CSE-ConnectionGUID: RgOt+/OsS82BSnIEXakZ5Q==
X-CSE-MsgGUID: RFgETf6oTFCFu+Eg6t9+sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="220690474"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 01:18:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:18:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 12 Mar 2026 01:18:27 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 12 Mar 2026 01:18:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mrvQAT/bSf+HJcWoFNvFVpij2lcQn7rpVU9ciEATI1CbGujGHIA2chZiuC8KxQo/EjQN+cNsskYPtSh1S1bp5/PkQPYhJXpm1CQsF+IDF6CxHZ4vIAMbO0dh1fdlVFR/lVp2SsSTfwKELiiVv3FHACe6oWoEOc2zRcHNPt4i/gXgwiCHHXWVWtphJ9TQdShpTaBzfTe5aUKjeuX8v3CewAisMGxptNCmGY3ZuVaBMpR74YCNKpRdkJAy+FXtnWPxs0CDkbaX5PjoqFg0GkNxis3/rozcSJQVMnHyswZKGijAjAoja6xGFq3so16DSED68TO4c8HUMm+Fes6Ey0G9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m24OA+Pu3oIz23l1d2kU1q74uZaRol7JiU8tBcGDfcc=;
 b=HqxLLrVKQnugBbPzPim9uf5tFapDVar4aNXDxANMX/BZTqpkfTcRFJk6xnD10ICQa0pMfCwUuu1QKjCT8cq5jZf8ade8CRUqxCtxyrWa0PBskRvvxdXPTK0juERGgI4utWDC+aAg+7E8d67Lh1fe4Jot8hEzQm8or5GcrY+B+JvJAxnhQ7kHPuBTV4LwLC6wgVsUUz0jnrW7sSw8/oSdPSLgSzoO7LEShPT9NYWkx9IRsl9tctlN+uuXMnp6dPh8IO4u0A22kMVMZ1byfpsWrdNnt8gizJUyrjFoOmPLz+ZssiJAyTqmT03dDhigle+l57ozVYylPanvpNC4y85vzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 PH0PR11MB5926.namprd11.prod.outlook.com (2603:10b6:510:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.6; Thu, 12 Mar
 2026 08:18:23 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9723.004; Thu, 12 Mar 2026
 08:18:23 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Konieczny, Kamil"
 <kamil.konieczny@intel.com>
Subject: Re: [PATCH i-g-t v2 1/2] lib/xe: Introduce aligned buffer mapping
Thread-Topic: [PATCH i-g-t v2 1/2] lib/xe: Introduce aligned buffer mapping
Thread-Index: AQHcsdLyVDfkR1vEJkKrEB03zstHhLWqje2A
Date: Thu, 12 Mar 2026 08:18:23 +0000
Message-ID: <60112abb083fee550ae6c42c6d4987056364230f.camel@intel.com>
References: <20260312034711.637781-1-nishit.sharma@intel.com>
 <20260312034711.637781-2-nishit.sharma@intel.com>
In-Reply-To: <20260312034711.637781-2-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|PH0PR11MB5926:EE_
x-ms-office365-filtering-correlation-id: d3cd7d4c-56eb-41af-703f-08de800fede1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info: i1n1KGQX4A4LzJofbbwdZRbUCBMV3BgHS1zwfJncFlFCHu+I8iA5w1/oSLQiFA5Etvi08rW5khynDTKxAX1oV868MtJvgMXzBfgFBE66zR9pSjlLbu95THlOL5Pie+HIMoeA8jHKECclCxm5Cz4Gg0skgRNjDcKn6E0mNGHxJcLI38OjFAeMP/B9Io1n1o8rU7qwRAkyGpZ62cOok8+J5FaVzI3bEph0B5Qkltxs/nA8cbN/eqq/NTfNoCwG4pYGhCQl1eQgRJkag9gstYPHEliSXHIgTj36k2kj+pelvZBdObieSKZRV75yDxqa6WPFi3zcWnHzYhkIUuNKQfvLZqMeEsO0xS6m20Fjzc2MGBQ9mSLBm/zoMPyPqH42gSPiJPbNDG75GaWO2ivojVxNqLB6SHq8iCTRkcDaSudrUq4RxnGWOnjv/cX0s3oyxmiJ9zd5VlN3xzg4nRQttMkHVVPIKJOqX54/HZlSwA8KwZSZIu8hr7J6JtfCZ6HmSAc+dqEQyNASQKV8wjtx1bW7Vz/EKUK5IdrWSg2aHQ9Z7CWTMoMdDHpn7vVgiULGfcEzDWi1x9i5XnI9ryVJXmDkGof5ALUB3ewqIyp4E319v2xQegEJo6qw4Fpdpt+u6jPg9RC64EATLXCdoy2PE2VssE0Iw5W/UQu0HiSGFX2Mvb9nuMJumvhn4LmabX3JWvVXYzCLGwJnwZtLzRjBbwntG8PqK8cvgkYofeEd6/4agWCfAfe6PsM5oXQEBduaUl+OxK1ZUS2QQte6XiPWLQF4FrIzCjcitbpaR/MZU/fN5pc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0pSdWM3QzZoZ1JUQnkxTmpCU0pFdDNJVStTRmJPV0hKRVc0SUc3Z1dyUHF0?=
 =?utf-8?B?TVNTTFpsZmtCa2IxbGVjcHlxS1Y5S2Z4aWFQNEZkZWhaeklwZkdNcVZVdFF0?=
 =?utf-8?B?OG9oS1k0S0JudHBjTEFZb3UyMTdHUm9BaVR4bnBiNE5aZTY5N29KTC9iYUt0?=
 =?utf-8?B?aXZFeVNrMDhMWHpuK3NFcWozUVVhaTlhK0xtQWNoZ0cwZFByOG8wUUNLaitq?=
 =?utf-8?B?dG5RczhyYkZraUs5Uy9JM3BFK3pVdFl2V1ZiY2VLU2orWFhZNzJnN2hUVmhL?=
 =?utf-8?B?aXJ2djU4SWhQR05SQU1PbFYyVWdNU2xxS29ISVhPbm5YU0lNdGVHMkkwMWdh?=
 =?utf-8?B?b1BycUt5Y2M0RUsxdlBkQlRTUURJbk9vdGZvUEVwMTdRdFlZdjR6NlVWMFMy?=
 =?utf-8?B?ODRJcERjbEdHVmR5QWRzK1lEWEJ1SlpSeThVWGFsOUVnTXFSVUxkQlNlWG5h?=
 =?utf-8?B?ZGZHaks1bGRJSUpRN3JtOERLWm9pSzRKLzc1U0VhbDc1SVlpTFZGWERscUdh?=
 =?utf-8?B?R2FhUUdhdzQ5Uk9QMXdValhvd0NDcWpkMXcwR1NkYVpqZ3MwRVZhY2h4Qnl6?=
 =?utf-8?B?eXVlWHdTU2lscUZpWmtmSTlMVmNyY3B6aENyUGlCellwWDI5Y0lTOXRHOUZS?=
 =?utf-8?B?elJNOGRvL01zbjJKVDR6c2wxdW5SU0dpRVJueVgvcDhvR3pHUTdXSG4vM3VF?=
 =?utf-8?B?ekhoSmJ5NWd5eld4M1lROThrd3ZsS3paQVduUTVRT1R3cWRhSEJCWW9ObmNS?=
 =?utf-8?B?cUVVcHJtNC94dTV5R3RlZjN4WVVJQis3T1k1TWxRV2doVjRtM2RtelpheU9m?=
 =?utf-8?B?UXkrK3ZxYVJCbElMeTlWUW13ZlBLWEFEdllNNUl6TTVqbW91eVlsTnRibVdJ?=
 =?utf-8?B?c1N5MVVyVFZxQkdLN3RHWFhJYTROMHdINjN2dW1QR2c0M1BLTkdPdmdKdTQw?=
 =?utf-8?B?ZXBoaXJkdnovM2VsZitVSHN0N0RJS2p5VC9EVzE4a2p2d2Z1TWlyQWdSNHFF?=
 =?utf-8?B?WUJ2K2JQTEI3SHBQb1hTTE1ra3JXUkJvUGl5TXV3WUpNNDJEejNYc2RYQU9K?=
 =?utf-8?B?OFZ6cnFDYlBpdktBdGd1OXZmbStRL2FOUXkvVFNlNUEwcWRQaytwY2lQaHEy?=
 =?utf-8?B?VU45QTBPSkZKeDZicGhaZHpGRDNuQnRSQU82STdwa3MwbWVVcStRa1lBWi94?=
 =?utf-8?B?UThFaDFzUkdPdmtCZ21zTTZiaVFRaFlEN2NaRzJ3OFFjaFEyOVN5MXdNcmpY?=
 =?utf-8?B?ZlkvZFRpWFI5Qm1IT1poSS9CRThiaFdycE1jc0tQUEdhRVkyc0VYOWlkdGxr?=
 =?utf-8?B?MGJBK053cHF0WGdST01scnhhMC9ZdkRhU0xXRDJtL1VmNjB0Sk03WS8zRExy?=
 =?utf-8?B?SWppSGxja1lyVWdpY2FzUlB1NzhsK0kzK1RRSFhCL25VdExpVTFsMXByZ29j?=
 =?utf-8?B?Vlp0TmFYWFRvSzZPV29WVW8rc0NhejVKb0IxZFFoc081Wk92aHJYMjJIVUZD?=
 =?utf-8?B?elFIV0lQUnhDK1JEdlQ3MXpjcFA5aVhmRjF2MTZKUDJRL3ZYOHVxSytnQnRi?=
 =?utf-8?B?ZE9qZWpoODJFNGtMcFB1WVlad08yTm1Mc1hCUlptalV3YkxpSHB5NVZ5cnRy?=
 =?utf-8?B?dW93MVlZUi9ZL3pBcHp2aTd5YjB2NXVPelJ5ZVVqMXBUVzRrNnA0c082VzU5?=
 =?utf-8?B?a3A0V0xNTHZoU1FXNHRFWXVDcEFLS3V6dC9CalBIeFJSK1gvRVdrRCtaQVRu?=
 =?utf-8?B?b2IyL2JuOERQcmJHeXlpMkNJMkZJMEd2RmFKcU1KSThCU1lnejV6K1lxSEZs?=
 =?utf-8?B?Q2Q1am9MVE85TG10Ymk5RHcvYzd0MmFVeDNOY2htK0VzeW5YMUxPZFU3MnlB?=
 =?utf-8?B?b3ZieXNid0VHd3hYN3I5QmFxcVVWcFBGdlp0bGZDUUlmWDlOSzJzYkJCa0Z1?=
 =?utf-8?B?NzQwdTQ0NWtaUGpXYXVtWisvUmZ5Nk5ubHd2MHl4V3Rxdk1rZnNNTVZPbHps?=
 =?utf-8?B?aUhOMXR1dkc3WklQZkRSNE9NL25zdVpBd1lkYVo3NXZqTTEvd0lRekx2akN2?=
 =?utf-8?B?OUVyWXp1ckJzbnM4Z0R1N1dCNTZHV1NLWjRrVHRvMFlvSTZjUnl3eEpFcmdM?=
 =?utf-8?B?N0ttM05xZHJKTkJVVW5oUXlEaFRiQWdXM0dBelY0eVVYbk1tTHdERlhPblUw?=
 =?utf-8?B?d2RFNlpyMWFScDFZUStHUXVyRitsdWJmMnMrdi8rMWJrRnlORWRlc2VyRGlx?=
 =?utf-8?B?bWUwLzY2NGVBeGFzQnRKanpIY3RUZnlSbTRBUjZXVmxJR1RrcGdBZ1ZXa1Nz?=
 =?utf-8?B?dmI0QVZEQ3B1d082KzBMVmZCOWlYUXJKdVQ3SEpZWDFwYTdZeG1jdWh5VUcr?=
 =?utf-8?Q?HqZ9luSGAnLMPV829087ns4TzAVf+br+qkiaj+A3BwwEl?=
x-ms-exchange-antispam-messagedata-1: EEm70j4D4QM1pw==
Content-Type: text/plain; charset="utf-8"
Content-ID: <7785B4DC60FE9D4C941AD1352733C1C6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: RR9IoivCHs+D6l2ngQC9re5MAJ8OHUxLsJZcqUppkavhwXbZPRzTKjbr7GSiiS7GTIDHkuhzHfPZJ5DV4jKsKZcUAGseCh4yhtK5M0hJ7WVRTU4jQsHQLmi2H7IAHFRXO/D4bMts8Zq+J3QJJo/tTPr1tasgpbgkX0SHzuVUJ9czbdfErZHWHvcDY+l7zIMZzpnZ0D5Bk9Tq3bT9mJvp123snrWQFKhM2lN+DokCyoLJy0knOK6dD9Q4SnX5VcrnutvRZ/VRSKK462Gn/NuVM1LlmUvsYTLK9Dw9FxCLcqVshr46cDOz0siHwj8rlZ7YTSJPlp57lF+4toxTNfYMyA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3cd7d4c-56eb-41af-703f-08de800fede1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 08:18:23.6868 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pxDKkn/6tBJwifTuHCRfcjCd5sv4Q7kFNhAy6ba0VJQc9ayMEmaztCo1JGiy1zCBtPWMTcN6XxCDntud9daFvD5uFbBFG2H0nm06usJShiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5926
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

T24gVGh1LCAyMDI2LTAzLTEyIGF0IDAzOjQ3ICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBBZGRlZCBhbGlnbmVkIGJ1ZmZlciBtYXBwaW5nIHdoaWNoIGlzIHByb3ZpZGluZyBh
biBpbnRlcmZhY2UgZm9yDQo+IG1hcHBpbmcNCj4gYnVmZmVyIG9iamVjdHMgd2l0aCBhIHNwZWNp
ZmllZCBhbGlnbm1lbnQuIFRoaXMgQVBJIGltcHJvdmVzDQo+IGNyb3NzLXBsYXRmb3JtIGNvbXBh
dGliaWxpdHkgYW5kIHNpbXBsaWZpZXMgYmF0Y2ggYnVmZmVyIHNldHVwIGJ5DQo+IGVsaW1pbmF0
aW5nIHRoZSBuZWVkIGZvciBwbGF0Zm9ybS1zcGVjaWZpYyBhZGRyZXNzIGhhbmRsaW5nLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhvbWFzLmhlbGxzdHJvbUBpbnRl
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50
ZWwuY29tPg0KPiAtLS0NCj4gwqBsaWIveGUveGVfaW9jdGwuYyB8IDQyICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPiDCoGxpYi94ZS94ZV9pb2N0bC5oIHzCoCAx
ICsNCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDQzIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9saWIveGUveGVfaW9jdGwuYyBiL2xpYi94ZS94ZV9pb2N0bC5jDQo+IGluZGV4IDE2YWFl
MDVjOS4uMTE2NjI5MzRmIDEwMDY0NA0KPiAtLS0gYS9saWIveGUveGVfaW9jdGwuYw0KPiArKysg
Yi9saWIveGUveGVfaW9jdGwuYw0KPiBAQCAtNTc5LDYgKzU3OSw0OCBAQCB2b2lkICp4ZV9ib19t
YXBfZml4ZWQoaW50IGZkLCB1aW50MzJfdCBibywNCj4gc2l6ZV90IHNpemUsIHVpbnQ2NF90IGFk
ZHIpDQo+IMKgCXJldHVybiBtYXA7DQo+IMKgfQ0KPiDCoA0KPiArLyoqDQo+ICsgKiB4ZV9ib19t
YXBfYWxpZ25lZDogTWFwcyBhIGJ1ZmZlciBvYmplY3QgKGJvKSBpbnRvDQo+ICsgKiBDUFUgYWRk
cmVzcyBzcGFjZSB3aXRoIGEgc3BlY2lmaWVkIGFsaWdubWVudA0KPiArICogQGZkOiBUaGUgZGV2
aWNlIGZpbGUtZGVzY3JpcHRvcg0KPiArICogQGJvOiBUaGUgYnVmZmVyIG9iamVjdA0KPiArICog
QHNpemU6IFRoZSBzaXplIG9mIHRoZSBtYXANCj4gKyAqIEBhbGlnbm1lbnQ6IFRoZSByZXF1ZXN0
ZWQgbWFwIGFsaWdubWVudA0KPiArICogQHJldHVybjogUG9pbnRlciB0byBDUFUgbWFwcGVkIGJ1
ZmZlcg0KDQpUaGlzIGlzIGFuIGluY29ycmVjdCBmb3JtYXQgZm9yIHRoZSByZXR1cm4gdmFsdWUg
ZG9jdW1lbnRhdGlvbi4gUGxlYXNlDQpyZWZlciB0byBpdCBpcyBkb2N1bWVudGVkIGVsc2V3aGVy
ZS4NCg0KVGhhbmtzLA0KVGhvbWFzDQoNCg0KPiArICovDQo+ICt2b2lkICp4ZV9ib19tYXBfYWxp
Z25lZChpbnQgZmQsIHVpbnQzMl90IGJvLCBzaXplX3Qgc2l6ZSwgc2l6ZV90DQo+IGFsaWdubWVu
dCkNCj4gK3sNCj4gKwlzaXplX3QgYW5vbl9zaXplID0gc2l6ZSArIGFsaWdubWVudDsNCj4gKwl1
aW50NjRfdCBhbm9uX2FkZHI7DQo+ICsJdm9pZCAqYW5vbl9tYXAsICptYXA7DQo+ICsJdWludDY0
X3QgbWFwX2FkZHI7DQo+ICsJc2l6ZV90IGhvbGVfc2l6ZTsNCj4gKw0KPiArDQo+ICsJLyogUmVz
ZXJ2ZSBhIHJhbmdlIG9mIHZpcnR1YWwgc3BhY2Ugd2hlcmUgd2UgY2FuIGZpdCBhbg0KPiBhbGln
bmVkIG1hcCAqLw0KPiArCWFub25fbWFwID0gbW1hcChOVUxMLCBhbm9uX3NpemUsIFBST1RfTk9O
RSwgTUFQX1BSSVZBVEUgfA0KPiBNQVBfQU5PTllNT1VTLCAtMSwgMCk7DQo+ICsJaWd0X2Fzc2Vy
dChhbm9uX21hcCAhPSBNQVBfRkFJTEVEKTsNCj4gKwlhbm9uX2FkZHIgPSB0b191c2VyX3BvaW50
ZXIoYW5vbl9tYXApOw0KPiArDQo+ICsJLyogQ29tcHV0ZSB0aGUgZmlyc3QgYWxpZ25lZCBhZGRy
ZXNzIHdpdGhpbiB0aGUgdmlydHVhbA0KPiBzcGFjZS4gKi8NCj4gKwltYXBfYWRkciA9IEFMSUdO
KGFub25fYWRkciwgYWxpZ25tZW50KTsNCj4gKwkvKiBNYXAgdGhlIGJvIHRoZXJlLCByZXBsYWNp
bmcgcGFydCBvZiB0aGUgcmVzZXJ2ZWQgdmlydHVhbA0KPiByYW5nZS4gKi8NCj4gKwltYXAgPSB4
ZV9ib19tYXBfZml4ZWQoZmQsIGJvLCBzaXplLCBtYXBfYWRkcik7DQo+ICsJaWd0X2Fzc2VydCgo
KHVpbnRwdHJfdCltYXAgJSBhbGlnbm1lbnQpID09IDApOw0KPiArDQo+ICsJLyogVW5yZXNlcnZl
IHBhcnQgb2YgdGhlIHZpcnR1YWwgcmFuZ2UgKGlmIGFueSkgKmJlZm9yZSogdGhlDQo+IGJvIG1h
cCAqLw0KPiArCWhvbGVfc2l6ZSA9IG1hcF9hZGRyIC0gYW5vbl9hZGRyOw0KPiArCWlmIChob2xl
X3NpemUpDQo+ICsJCWlndF9hc3NlcnQobXVubWFwKGFub25fbWFwLCBob2xlX3NpemUpID09IDAp
Ow0KPiArDQo+ICsJLyogVW5yZXNlcnZlIHBhcnQgb2YgdGhlIHZpcnR1YWwgcmFuZ2UgKGlmIGFu
eSkgKmFmdGVyKiB0aGUNCj4gYm8gbWFwICovDQo+ICsJaG9sZV9zaXplID0gYW5vbl9zaXplIC0g
aG9sZV9zaXplIC0gc2l6ZTsNCj4gKwlpZiAoaG9sZV9zaXplKQ0KPiArCQlpZ3RfYXNzZXJ0KG11
bm1hcChtYXAgKyBzaXplLCBob2xlX3NpemUpID09IDApOw0KPiArDQo+ICsJcmV0dXJuIG1hcDsN
Cj4gK30NCj4gKw0KPiDCoHZvaWQgKnhlX2JvX21tYXBfZXh0KGludCBmZCwgdWludDMyX3QgYm8s
IHNpemVfdCBzaXplLCBpbnQgcHJvdCkNCj4gwqB7DQo+IMKgCXJldHVybiBfX3hlX2JvX21hcChm
ZCwgYm8sIHNpemUsIHByb3QpOw0KPiBkaWZmIC0tZ2l0IGEvbGliL3hlL3hlX2lvY3RsLmggYi9s
aWIveGUveGVfaW9jdGwuaA0KPiBpbmRleCAzZWE2NTEwNjMuLmI2MmQyNTlmZCAxMDA2NDQNCj4g
LS0tIGEvbGliL3hlL3hlX2lvY3RsLmgNCj4gKysrIGIvbGliL3hlL3hlX2lvY3RsLmgNCj4gQEAg
LTkxLDYgKzkxLDcgQEAgdm9pZCB4ZV9leGVjX3F1ZXVlX2Rlc3Ryb3koaW50IGZkLCB1aW50MzJf
dA0KPiBleGVjX3F1ZXVlKTsNCj4gwqB1aW50NjRfdCB4ZV9ib19tbWFwX29mZnNldChpbnQgZmQs
IHVpbnQzMl90IGJvKTsNCj4gwqB2b2lkICp4ZV9ib19tYXAoaW50IGZkLCB1aW50MzJfdCBibywg
c2l6ZV90IHNpemUpOw0KPiDCoHZvaWQgKnhlX2JvX21hcF9maXhlZChpbnQgZmQsIHVpbnQzMl90
IGJvLCBzaXplX3Qgc2l6ZSwgdWludDY0X3QNCj4gYWRkcik7DQo+ICt2b2lkICp4ZV9ib19tYXBf
YWxpZ25lZChpbnQgZmQsIHVpbnQzMl90IGJvLCBzaXplX3Qgc2l6ZSwgc2l6ZV90DQo+IGFsaWdu
bWVudCk7DQo+IMKgdm9pZCAqeGVfYm9fbW1hcF9leHQoaW50IGZkLCB1aW50MzJfdCBibywgc2l6
ZV90IHNpemUsIGludCBwcm90KTsNCj4gwqBpbnQgX194ZV9leGVjKGludCBmZCwgc3RydWN0IGRy
bV94ZV9leGVjICpleGVjKTsNCj4gwqB2b2lkIHhlX2V4ZWMoaW50IGZkLCBzdHJ1Y3QgZHJtX3hl
X2V4ZWMgKmV4ZWMpOw0K
