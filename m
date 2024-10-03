Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3C0CF34A9
	for <igt-dev@archiver.kernel.org>; Thu,  3 Oct 2024 13:58:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4638210E856;
	Thu,  3 Oct 2024 13:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dkMAl8Mc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01B510E856
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Oct 2024 13:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727963926; x=1759499926;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6EvBemFKk8Qd+GXJVad0Ixrpch0/HEWgJnjBdE9CCC4=;
 b=dkMAl8MchKxP7Cq01QxNtxuDadz6WsiDWm6W3S4obAboyaDFClvRo2qn
 6wqBnKYk/TARpaK6Okn3AJce5heU9AP2jzvEA51qhLKG8Gpi2rEASy9ZV
 Kceg9wl1mXxW/1NOmozurSgN1MIVaGwWCqowLR0vKozChohZgvVdsjBBt
 jKZ4hP8JQ+iLog6tdzY1h3FUcCL2ftpcUI+i8OU7NQosDzJKJQNTqRmie
 Hq1VA4O0ZqjAKM8eIpfY4MDdztdGKIjnM15GfdhLQdPFBMS4FZeVGeEG9
 FH7OQ/Q2KCIxq607d6CdpdfmthsLFhNepEey/Lns1Jkk4YgiWCdNSQ4+l Q==;
X-CSE-ConnectionGUID: 5BIwkQ4jTfikp+GgINbZFA==
X-CSE-MsgGUID: yl7Sbq/bSu63KZtiD3ub1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="52564600"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="52564600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 06:58:14 -0700
X-CSE-ConnectionGUID: FyMsvFgVQX6GjdMt8dxl6g==
X-CSE-MsgGUID: LcITf+ZsRgOVI1YHvPcSLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="74788556"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2024 06:58:13 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 06:58:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 3 Oct 2024 06:58:12 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 3 Oct 2024 06:58:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 3 Oct 2024 06:58:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWUd302RiMZNiMHDQlWKaLnU3M1319kh50w326Go6UnmhRR6hPfLE6zaAq0ZLkhRTuloWEuWW04d3VlgcTaWTcEgL9fiypdOkxOrIfUrclkDVXV0mLk2wocuGWj/Yzks75Q60Vla9b7Zj6W1QqDAHaGWQ+0P2ihMXqUDUrC5McWH9UjMHNc0uKtA8oHQjBbTtPMOFDe1DE95H5AOWGqT96+ARfNnJBr/pzKy4Hn7eE8r/LiUgddJljBu9j5E7/SLUQZRLtVu87RbOPc/cNhq2DvbHCDgmCs1x2bBOvHSu1HbeYXxKNb5sk+4qWlKG842P1svAODBXBAXJAZ4AqnLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6EvBemFKk8Qd+GXJVad0Ixrpch0/HEWgJnjBdE9CCC4=;
 b=GNQB6babByGyqYH1hXBhWhx2AtC+g1IcEyuqTN2YkQ0RjWtnG8eRbZypbc0CVAQnADFyuE8qYTKvGBxQH2fcCI1ydayOT8Htxu9jJ4rIT1XhIz++DpQnbdXHqW1bCWp70fLxPpQMEeDJMi8yyj57lG48ksYHSFbXqsFjZHTjgtIUilx/FRXA/bvAcOxla3fZ/3HiJtIaDGCS6URntCi2vQ0WVCHQCInkxYGkb6X+VeZaEXbtXWPjNjJ/aTVyb/68MdsVIzxRz7YxOuOL+ec4xMkjzby0rnSvqFcRtCh58BpjEaxJUPO5vZm+XFPV8Jr9Ek9NbFgdEU+I4WcxFfcDKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by PH7PR11MB6054.namprd11.prod.outlook.com (2603:10b6:510:1d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 13:58:10 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 13:58:09 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Sikora, Pawel"
 <pawel.sikora@intel.com>, "Manszewski, Christoph"
 <christoph.manszewski@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Topic: [PATCH v2 i-g-t 1/2] lib/igt_sysfs: Introduce engine_class
 property helpers
Thread-Index: AQHbFL5j3Il3Y6hFoES4jwhNcnriIrJ1DxGA
Date: Thu, 3 Oct 2024 13:58:09 +0000
Message-ID: <047945a8a2587de77c88ddc45146be38486aff96.camel@intel.com>
References: <20241002112914.5556-1-dominik.karol.piatkowski@intel.com>
 <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
In-Reply-To: <20241002112914.5556-2-dominik.karol.piatkowski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|PH7PR11MB6054:EE_
x-ms-office365-filtering-correlation-id: e61d379c-0152-4ee7-744e-08dce3b36a21
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ejh0VW1sTm5hQm8ram1ueE1ZbXh5c1p0U0xqcTRZOTNYbWp4T3l2d3FnTUtz?=
 =?utf-8?B?Q0lmRExzdHFPSTE4Z2NEWkJ1N3pDR285TENrbi9HSkRtY3pIZTViUlZEVVpE?=
 =?utf-8?B?bVFKeHhZeksrYTN2ekVkVjNDbWh3OE1kcjh2bTJXSWRxVlg2V0U3VTRxWTFV?=
 =?utf-8?B?K29PQWt3UWZJUmhPWUFVaEFzTkUzSnp5V3NSeWVLUm41Um5HMTc4UFlhV1VP?=
 =?utf-8?B?OFVmaDVHbFlhVE1lNFg4NW5MbEJRK0pTeDY4OFNYeU4wM2FQdUhlTEhoLytX?=
 =?utf-8?B?VkViOVEzaUl5cW1TYXpmOXdtMCtLL0dDMGpnbWJsS1J3eC9tTnExUmpGZ3ZV?=
 =?utf-8?B?SkJ6Q2lwZnNNT21zUkJsc2dRRzhDT1dxTjZvQnlqaEx0dXo4VDZTSXhFWmF4?=
 =?utf-8?B?YW96VmlvT0pkTmV3RVM0QkErTjRxTXVJcnI0NDdQMk5PVlk3M2JIZk15NUtk?=
 =?utf-8?B?bHFzOGpxTXdHWUM3cEVET05zNm8zVHlUczNyVUZFSWt5QmovcUlUMGZKK0xZ?=
 =?utf-8?B?Y2l4Mm9KclRoKy9GMG9NYW5HanNxR1pZNXJzVmdmNms2Q1NRL01vanpZYjAw?=
 =?utf-8?B?Mm0xclFrNzUwWW93ZlpTOXVtUFJ6dWwzRFhkZFB2THh3cTl3bkNpem8zcVZN?=
 =?utf-8?B?TmJnNEl4QzdRWmxBS0wrSSt5czVjTE1YUU1DYjBqVFJiQXpOM2JNaDFmR2Mz?=
 =?utf-8?B?SXlDTndja3psVEpaS1dNaEtNa2xKa0dQM3V1bUMySUZ2T29YVkxUaGlNdExj?=
 =?utf-8?B?K2NIbVFHaDFXQzIreEU0Wlg1ejJqdjJyZnVYTHBwdGJ2Y25jRnloQUJBTGxq?=
 =?utf-8?B?QmlqZlA2Z3hLRWVUYUgrOXlkZUZXdDYzVDRQYmlsemNiQ052UllTNkt2OERS?=
 =?utf-8?B?d1YyKzlkTVJNNThIWWVpRVptU2w1elBUOERwZEd3VkUyVWJsUFg0SEp3SGNG?=
 =?utf-8?B?R2JjamxrVnpLNGVaYVNDVTFDd2pYWlJETFpWb2VvZDlVbWRiV2R4Q2p2Sitx?=
 =?utf-8?B?ZXluRFNrWm9UcVRMKyt3aURFVDR5MERkbVUzOEYyR0hsN1hORGRvSFNSUGRn?=
 =?utf-8?B?Mkw2ZW5oTDgxT2pEZ2tNS1g5c0dSQ3d5dDRiMHc3cHF3dmJ1dzhWdWpyU3Rl?=
 =?utf-8?B?SDA0MnIxNXczQXBhOFZiejF5U2VqVHdSZmlIaHpiQXdHSDlhcmlMeXFQMlZp?=
 =?utf-8?B?TW5PWnBkeEo0VERMb1ZnL29Dc3IvWFFBYkthV2NQUHh6Z2VBbjRiSVJud1Y0?=
 =?utf-8?B?eHJMOFNpWFZTN2ljM3ZBQUZVSWM2ZkhYejR1OFhzUisxYWhHY0tPemMvbk56?=
 =?utf-8?B?U3UwYlhLQ1RwUnJkZGxEbmdvTzB0cG1ZYnF6VnVJYjJmelRrNEFFYlhxZjVy?=
 =?utf-8?B?Mnh4aDFsZkVobkJianYzdVM1a0JhNU96cHRaem1MYUdqcnR6NmRpekl1eDhv?=
 =?utf-8?B?MGVwbXFsUWU4b2J3Z1IxWnExSjFFOUZ6WE9nQUlIMEVVc2YxNnU1SVBoU1B1?=
 =?utf-8?B?NXVOOVpHN0g5b041aGFGZzhmRVB3ZHZoanhhMnB1dmV5eGd5YW51dnc1b2ZY?=
 =?utf-8?B?QkNmajdYMWQ4c1ZmckIxY05sbEpaKy85U3lNOTN4Q2o3d3lEMzR4N2Y3R2lM?=
 =?utf-8?B?N0dEbzNWYVYxMittZ05weFBIRXZCVkV1LzREL2ZQaHlsN1oyNE04YVZtTG1Q?=
 =?utf-8?B?aVF4a3cvelNHWG1ENExReitxOHBvYThyelowZys0RTdQOTNNTkxWc2VWT3M2?=
 =?utf-8?B?ZmtoRGx6YWRBVlBaMCtHSU9yclpOcXFuYk5yWVkvRnVSL1B4VlByM21TL2Vo?=
 =?utf-8?B?UGtzTmRVdzhJdHNMQ09WQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWwwNExxUHZvUTJqMFZ2WG1SNnFqNmlRYjAvcHlXdVJ5MWQ5NFdnSUNrZWFT?=
 =?utf-8?B?bmQydUV1NmFPU3pVYnRHc0VkWkJiSzFNYXB3WG9iZnFQd2tuczFFRWxGQ1Fi?=
 =?utf-8?B?aGIxdjFkWm5TTi9SVHFsSHdzaHkwOHppUnRzYzE3WkhUWEFpU2VzZG40UXJY?=
 =?utf-8?B?eWRVMDlIbGgrWlEzSjJyekxjeENpTE9uY3NLbGJSWmdoendld3I0TkRXc1E4?=
 =?utf-8?B?M3h5MVpuZC9qMmk1dktoTTNhSzNkdVlxM3p3RXhjVXBsNjl4S2Z5am12V2Vy?=
 =?utf-8?B?ZWdUcjdmU0RwY295YnpoVExUczRQSFkySFRUbnpES3JLVjg3NUZCRGlxTDl4?=
 =?utf-8?B?OHBnNmtCN01qdHBNR3l6VlFsWUMvalVNWUNQYitGYjhRMTVyV1VHdFpsOVk3?=
 =?utf-8?B?c1llZE1YYk5RMVZhdVRiYmNGRkRqc2lSV015cFp2d1JhemVyV3JRWDc1T0RK?=
 =?utf-8?B?Q0VhbGRPcFFRc1JMdnkrS09EcGlwMlo5c3lpLzhUOFRxQzV1MlVFTDZyWlpU?=
 =?utf-8?B?M040TU1KbG1PNkFnR0RYZ1ZuTFBJSFRrV05GYzNDMUNuYmNsYlFxVDU3Rytl?=
 =?utf-8?B?cVBuaC9ENExrZ2tkUWRsYThwV1NRQ2NvVW0yRTd4ZFB1QksyN1pCOU5Eelc4?=
 =?utf-8?B?U1ZBbHh0UXpjSzNPempSZ3pFVVhPMzR4WlJoVkNRc084ZVdsNDNXYmk4MjFq?=
 =?utf-8?B?T2MzT0xMbk9XRzZJOE9aNDJ6N0IzYTlWWEdBREF3L25pc0l4YW4wNWRpQlA4?=
 =?utf-8?B?dVVibVZubVRuU2RMdThMUjVGbTFkMk5MNWc1cDlPVEhIREQ2TlFDR1dMdE1k?=
 =?utf-8?B?ZWlsMXlleDJPb2VaOE1rTGRIVER5S214RG4vbU9IeExGWEc0aE9zaVpBUzZo?=
 =?utf-8?B?RXlEeVBaMnJtTFZnWEp1ck54dStKaGhHL2gvR2syK1kvMUNaQnB1NEs5MFIr?=
 =?utf-8?B?L2N4Z1pXUEp4UkdHR2grSjJvMHh3ODdZVURGdnVWbzZmaGgyTFBwaVhmZTUr?=
 =?utf-8?B?eVRpZnlsT2lKTFJHbUxJNk1pSExQZnVhbFQrSUI3ck5jN2xacUIzMlZTV1Fj?=
 =?utf-8?B?RENpa3dCSVhjdHpkbUhaNFV4aDViVGhuZTJucDlmU3kxZFlEMy9IbVhrMFdp?=
 =?utf-8?B?Z21pQ3BiRlNlRjdaK3hJNWVFUnhRMGVZYlZzanVrV05DZlRJcDNHemhWOGdw?=
 =?utf-8?B?Zys5RklqekwyVyt5anJuQ2t5akpNTXQ0cXgwUndVc0VHTHpaOU0zRzBPMjd6?=
 =?utf-8?B?VGdDWnVvTzRRQ0lBMGNMOFkxaDIvemdPQnZkREhFbWNaZys3UUtxd1VpNHlv?=
 =?utf-8?B?R3VGOEJVWDEzN0xhWThNTkphaUIzcHR6dzlTTUIzZnVWeUVBSkM4aEJndTdO?=
 =?utf-8?B?QmJkVllWUVYyOFFIQW5Za3BBRWVGZlFvdW4yWmxmMWtrZEpMN3dEUGxXa0Qv?=
 =?utf-8?B?K1dzNDdETGozM3k5bmpwejlMYkVGeEZsd0FGbS83NzM3OGQ2SXR2dVo0VGtu?=
 =?utf-8?B?ZVJlSWNWU3UwZFhsK0VMM3JISEdhcFJ3RGR1SXNqSzhqbWR6TzNpSEVyUG1y?=
 =?utf-8?B?dWlLM2tuV2l0RENQekR2SE9Yb0FmZW5MSmxmV0g3NzRON3NWQy9XYW5kUEg3?=
 =?utf-8?B?T0RjV0RRNjQvRVpSSjZlMndlcDZqNFc5ZWxvQlNEYlJjVEhlQlpVRlZWcUdB?=
 =?utf-8?B?OHg4eGVTeTUyaVJCZHl6Rmltd2tYMUZOMWtkQUZQeVJsUkQrU3lSQ2laMGJP?=
 =?utf-8?B?SGtCTWVkSzRlK2c1MmpyMzVxUCsxMkMyYmhpSnhTV2x6cFU5Q2k1RmpCdFZr?=
 =?utf-8?B?blNZY3dZV2s2OXVnS0xvWFhQSGVwRElaN3ZhblpqM2JDWmNjNzRVeEJSeW1q?=
 =?utf-8?B?NG9MZ3d5S2MvR0RIeW53UytVWS9pbkdOZ2VPajBQLzYxZFQvMEJuZ3BqdlpQ?=
 =?utf-8?B?c1ozdm1tNjJOblJQN0c4STBhSTRLQWw3aklseHBGWnYva0dSU2xOWXlzaFZK?=
 =?utf-8?B?ektBb1lwYVRwL1dpVkNrQ3htWnN3ektUK2Q4Y3hTU0FuMURjQjZTMkdKSVRs?=
 =?utf-8?B?N0V5NmoycEZjRTlIMFFaYkdJMG5BZlF4RGFJMEpNTk90UkF6OTJkeXRDSWJB?=
 =?utf-8?B?RFNDSkd0UWFWbGxkK0hJT1NIaVltdjJWRVNRRjBrekZsZWJhYi9OMmJDVnd2?=
 =?utf-8?Q?NH5nFKDvFSv7xFxRgskgJnM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <81A5E6ED555F2443B7207621DFA3EDBB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61d379c-0152-4ee7-744e-08dce3b36a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 13:58:09.8393 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yXwX9fYeDoR4nmQOvkzbv3p2tFUd+68MpZlpm0BwJwryosadzv2dxIVzVNAqZUnrnJ/Yx19g7RkxoewKlPON8+1keKMzgrSfIP4RSPjx+7E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6054
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

SGkgRG9taW5paywNCg0KU2luY2UgeW91IG1hZGUgdGhpcyBnZW5lcmljIGl0IGxvb2tzIGdvb2Qg
dG8gbWUsIGFuZCBJIHdvdWxkIHZvdGUgZm9yIG1lcmdpbmcgaXQgdG8gaWd0X3N5c2ZzLA0KYXMg
dGhpcyBjb3VsZCBiZSB1c2VmdWwgZnVuY3Rpb24gZm9yIGFueW9uZSB3aG8gd291bGQgbGlrZSB0
byBtYW5pcHVsYXRlL3JlYWQgZW5naW5lIHBhcmFtcy4NCkhvd2V2ZXIsIFpiaWduaWV3IGhhZCBz
b21lIG9iamVjdGlvbnMgYWdhaW50IGl0IHVuZGVyIG1pbmUgcHJldmlvdXMgY29tbWVudCBpbiB3
aGljaCBJIGFza2VkIHlvdSB0bw0KcGxhY2UgaXQgaGVyZS4gTGV0J3MgaGVhciBmcm9tIGhpbSBp
ZiB0aGlzIGlzIGFjY2VwdGFibGUgaW4gYSBjdXJyZW50IGZvcm0uIElmIG5vdCwgSSB3b3VsZCBq
dXN0DQptb3ZlIHRob3NlIGZ1bmN0aW9ucyBhcyB0aGV5IGFyZSB0byB0aGUgdGVzdCBmaWxlLg0K
DQpSZWdhcmRzLCANCkRvbWluaWsNCg0KT24gV2VkLCAyMDI0LTEwLTAyIGF0IDEzOjI5ICswMjAw
LCBEb21pbmlrIEthcm9sIFBpxIV0a293c2tpIHdyb3RlOg0KPiBJbnRyb2R1Y2UgdGhlIGZvbGxv
d2luZyBlbmdpbmVfY2xhc3MgaGVscGVyczoNCj4gIC0geGVfc3lzZnNfZW5naW5lX2NsYXNzX2dl
dF9wcm9wZXJ0eQ0KPiAgICBDb252ZW5pZW5jZSB3cmFwcGVyIHRvIGdldCB2YWx1ZSBvZiBnaXZl
biBwcm9wZXJ0eSBmb3IgZ2l2ZW4gZW5naW5lDQo+ICAgIGNsYXNzIG9uIGdpdmVuIGd0Lg0KPiAg
LSB4ZV9zeXNmc19lbmdpbmVfY2xhc3Nfc2V0X3Byb3BlcnR5DQo+ICAgIENvbnZlbmllbmNlIHdy
YXBwZXIgdG8gc2V0IGdpdmVuIHByb3BlcnR5IGZvciBnaXZlbiBlbmdpbmUgY2xhc3Mgb24NCj4g
ICAgZ2l2ZW4gZ3QgdG8gZ2l2ZW4gdmFsdWUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEb21pbmlr
IEthcm9sIFBpxIV0a293c2tpIDxkb21pbmlrLmthcm9sLnBpYXRrb3dza2lAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGxpYi9pZ3Rfc3lzZnMuYyB8IDg1ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysNCj4gIGxpYi9pZ3Rfc3lzZnMuaCB8ICA1ICsrKw0KPiAg
MiBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGli
L2lndF9zeXNmcy5jIGIvbGliL2lndF9zeXNmcy5jDQo+IGluZGV4IGFlYzBiYjUzZC4uOGZlNmQ3
ZWRlIDEwMDY0NA0KPiAtLS0gYS9saWIvaWd0X3N5c2ZzLmMNCj4gKysrIGIvbGliL2lndF9zeXNm
cy5jDQo+IEBAIC0xMzYwLDMgKzEzNjAsODggQEAgaW50IHhlX3N5c2ZzX2dldF9udW1fdGlsZXMo
aW50IHhlX2RldmljZSkNCj4gIA0KPiAgCXJldHVybiBudW1fdGlsZXM7DQo+ICB9DQo+ICsNCj4g
Ky8qKg0KPiArICogeGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9wcm9wZXJ0eQ0KPiArICogQHhl
X2RldmljZTogZmQgb2YgdGhlIGRldmljZQ0KPiArICogQGd0OiBndCBudW1iZXINCj4gKyAqIEBj
bGFzczogZW5naW5lIGNsYXNzDQo+ICsgKiBAcHJvcGVydHk6IHByb3BlcnR5IG9mIGVuZ2luZSBj
bGFzcyB0byByZXRyaWV2ZQ0KPiArICogQHZhbHVlOiBwb2ludGVyIGZvciBzdG9yaW5nIHJlYWQg
dmFsdWUNCj4gKyAqDQo+ICsgKiBDb252ZW5pZW5jZSB3cmFwcGVyIHRvIGdldCB2YWx1ZSBvZiBn
aXZlbiBwcm9wZXJ0eSBmb3IgZ2l2ZW4gZW5naW5lIGNsYXNzIG9uIGdpdmVuIGd0Lg0KPiArICoN
Cj4gKyAqIFJldHVybnM6IHRydWUgb24gc3VjY2VzcywgZmFsc2Ugb24gZmFpbHVyZS4NCj4gKyAq
Lw0KPiArYm9vbCB4ZV9zeXNmc19lbmdpbmVfY2xhc3NfZ2V0X3Byb3BlcnR5KGludCB4ZV9kZXZp
Y2UsIGludCBndCwgdWludDE2X3QgY2xhc3MsIGNvbnN0IGNoYXIgKnByb3BlcnR5LA0KPiArCQkJ
CQl1aW50MzJfdCAqdmFsdWUpDQo+ICt7DQo+ICsJaW50IGVuZ2luZXNfZmQ7DQo+ICsNCj4gKwll
bmdpbmVzX2ZkID0geGVfc3lzZnNfZW5naW5lX29wZW4oeGVfZGV2aWNlLCBndCwgY2xhc3MpOw0K
PiArDQo+ICsJaWYgKGVuZ2luZXNfZmQgPT0gLTEpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQg
dG8gb3BlbiAlcyBvbiBndCVkLlxuIiwgeGVfZW5naW5lX2NsYXNzX3RvX3N0cihjbGFzcyksIGd0
KTsNCj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJaWYgKCFfX2lndF9z
eXNmc19nZXRfdTMyKGVuZ2luZXNfZmQsIHByb3BlcnR5LCB2YWx1ZSkpIHsNCj4gKwkJaWd0X2Rl
YnVnKCJGYWlsZWQgdG8gcmVhZCAlcyBwcm9wZXJ0eSBvZiAlcyBvbiBndCVkLlxuIiwgcHJvcGVy
dHksDQo+ICsJCQkgIHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsJCWNs
b3NlKGVuZ2luZXNfZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4g
KwljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKw0KPiArCXJldHVybiB0cnVlOw0KPiArfQ0KPiArDQo+
ICsvKioNCj4gKyAqIHhlX3N5c2ZzX2VuZ2luZV9jbGFzc19zZXRfcHJvcGVydHkNCj4gKyAqIEB4
ZV9kZXZpY2U6IGZkIG9mIHRoZSBkZXZpY2UNCj4gKyAqIEBndDogZ3QgbnVtYmVyDQo+ICsgKiBA
Y2xhc3M6IGVuZ2luZSBjbGFzcw0KPiArICogQHByb3BlcnR5OiBwcm9wZXJ0eSBvZiBlbmdpbmUg
Y2xhc3MgdG8gYmUgbW9kaWZpZWQNCj4gKyAqIEBuZXdfdmFsdWU6IHZhbHVlIHRvIGJlIHNldA0K
PiArICogQG9sZF92YWx1ZTogcG9pbnRlciBmb3Igc3RvcmluZyBvbGQgdmFsdWUsIGNhbiBiZSBO
VUxMDQo+ICsgKg0KPiArICogQ29udmVuaWVuY2Ugd3JhcHBlciB0byBzZXQgZ2l2ZW4gcHJvcGVy
dHkgZm9yIGdpdmVuIGVuZ2luZSBjbGFzcyBvbiBnaXZlbiBndCB0byBnaXZlbiB2YWx1ZS4NCj4g
KyAqDQo+ICsgKiBSZXR1cm5zOiB0cnVlIG9uIHN1Y2Nlc3MsIGZhbHNlIG9uIGZhaWx1cmUuDQo+
ICsgKi8NCj4gK2Jvb2wgeGVfc3lzZnNfZW5naW5lX2NsYXNzX3NldF9wcm9wZXJ0eShpbnQgeGVf
ZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90IGNsYXNzLCBjb25zdCBjaGFyICpwcm9wZXJ0eSwNCj4g
KwkJCQkJdWludDMyX3QgbmV3X3ZhbHVlLCB1aW50MzJfdCAqb2xkX3ZhbHVlKQ0KPiArew0KPiAr
CWludCBlbmdpbmVzX2ZkOw0KPiArDQo+ICsJZW5naW5lc19mZCA9IHhlX3N5c2ZzX2VuZ2luZV9v
cGVuKHhlX2RldmljZSwgZ3QsIGNsYXNzKTsNCj4gKw0KPiArCWlmIChlbmdpbmVzX2ZkID09IC0x
KSB7DQo+ICsJCWlndF9kZWJ1ZygiRmFpbGVkIHRvIG9wZW4gJXMgb24gZ3QlZC5cbiIsIHhlX2Vu
Z2luZV9jbGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsNCj4gKwkJcmV0dXJuIGZhbHNlOw0K
PiArCX0NCj4gKw0KPiArCWlmIChvbGRfdmFsdWUgJiYgIV9faWd0X3N5c2ZzX2dldF91MzIoZW5n
aW5lc19mZCwgcHJvcGVydHksIG9sZF92YWx1ZSkpIHsNCj4gKwkJaWd0X2RlYnVnKCJGYWlsZWQg
dG8gcmVhZCAlcyBwcm9wZXJ0eSBvZiAlcyBvbiBndCVkLlxuIiwgcHJvcGVydHksDQo+ICsJCQkg
IHhlX2VuZ2luZV9jbGFzc190b19zdHIoY2xhc3MpLCBndCk7DQo+ICsJCWNsb3NlKGVuZ2luZXNf
ZmQpOw0KPiArDQo+ICsJCXJldHVybiBmYWxzZTsNCj4gKwl9DQo+ICsNCj4gKwlpZiAoIV9faWd0
X3N5c2ZzX3NldF91MzIoZW5naW5lc19mZCwgcHJvcGVydHksIG5ld192YWx1ZSkpIHsNCj4gKwkJ
aWd0X2RlYnVnKCJGYWlsZWQgdG8gd3JpdGUgJXMgcHJvcGVydHkgb2YgJXMgb24gZ3QlZC5cbiIs
IHByb3BlcnR5LA0KPiArCQkJICB4ZV9lbmdpbmVfY2xhc3NfdG9fc3RyKGNsYXNzKSwgZ3QpOw0K
PiArCQljbG9zZShlbmdpbmVzX2ZkKTsNCj4gKw0KPiArCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0K
PiArDQo+ICsJY2xvc2UoZW5naW5lc19mZCk7DQo+ICsNCj4gKwlyZXR1cm4gdHJ1ZTsNCj4gK30N
Cj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfc3lzZnMuaCBiL2xpYi9pZ3Rfc3lzZnMuaA0KPiBpbmRl
eCAyYTFlM2IxYmYuLjNjZWRlMDdmOSAxMDA2NDQNCj4gLS0tIGEvbGliL2lndF9zeXNmcy5oDQo+
ICsrKyBiL2xpYi9pZ3Rfc3lzZnMuaA0KPiBAQCAtMTc1LDQgKzE3NSw5IEBAIGludCB4ZV9zeXNm
c19nZXRfbnVtX3RpbGVzKGludCB4ZV9kZXZpY2UpOw0KPiAgY2hhciAqeGVfc3lzZnNfZW5naW5l
X3BhdGgoaW50IHhlX2RldmljZSwgaW50IGd0LCBpbnQgY2xhc3MsIGNoYXIgKnBhdGgsIGludCBw
YXRobGVuKTsNCj4gIGludCB4ZV9zeXNmc19lbmdpbmVfb3BlbihpbnQgeGVfZGV2aWNlLCBpbnQg
Z3QsIGludCBjbGFzcyk7DQo+ICANCj4gK2Jvb2wgeGVfc3lzZnNfZW5naW5lX2NsYXNzX2dldF9w
cm9wZXJ0eShpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90IGNsYXNzLCBjb25zdCBjaGFy
ICpwcm9wZXJ0eSwNCj4gKwkJCQkJdWludDMyX3QgKnZhbHVlKTsNCj4gK2Jvb2wgeGVfc3lzZnNf
ZW5naW5lX2NsYXNzX3NldF9wcm9wZXJ0eShpbnQgeGVfZGV2aWNlLCBpbnQgZ3QsIHVpbnQxNl90
IGNsYXNzLCBjb25zdCBjaGFyICpwcm9wZXJ0eSwNCj4gKwkJCQkJdWludDMyX3QgbmV3X3ZhbHVl
LCB1aW50MzJfdCAqb2xkX3ZhbHVlKTsNCj4gKw0KPiAgI2VuZGlmIC8qIF9fSUdUX1NZU0ZTX0hf
XyAqLw0KDQo=
