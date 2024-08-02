Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F86C52D6D
	for <igt-dev@archiver.kernel.org>; Fri,  2 Aug 2024 07:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4BD210E9AA;
	Fri,  2 Aug 2024 07:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RYdMRVYW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66C310E9AA;
 Fri,  2 Aug 2024 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722584740; x=1754120740;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=K4Sj7RBv6/W6b3mg3fbdi0y/qnJHC3cqsVwiJ7dVqjo=;
 b=RYdMRVYW+SutI+mr4wp24GtI3zfwQY5VrgYZPXyFfXXQfjo8o+DRLbyJ
 ceg4wq3n9jiHcKsld8/F0pk1weAa2pQry1E1Yqbke7XL459mCOzqXLS6d
 Ssq4CYbzGyD8kLYz5KIoQyej9oXyaoHAEQCLhEe0NIKfHpj43FruI/bIg
 4hhGhM1NKN1FEtPdWpB0E0jSzNi8O+5yvakF+uh16qqo+ZcN4NcwPwE4c
 klWaXT7gSPD2DhaeYEOahVq33kfkI108zDBMGOQ9gcUCJPk/12iL0uDV9
 pQht1lC17no0jE/rvPSJeoWCQd5k52p+CP69Th1wwK3tz35hd27QDHghg A==;
X-CSE-ConnectionGUID: 1s6Kp6WYSpqQNA4nwDwl+g==
X-CSE-MsgGUID: 7pZHv8fxS02YmSOHJtIVcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20743354"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="20743354"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 00:45:37 -0700
X-CSE-ConnectionGUID: JIcqtZGLQgOaRwVylZIYog==
X-CSE-MsgGUID: Vo28mEn/QfShd8/hKTIRIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800"; d="scan'208";a="55256188"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Aug 2024 00:45:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 00:45:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 2 Aug 2024 00:45:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 2 Aug 2024 00:45:35 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 2 Aug 2024 00:45:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gP64t7YbneyWyX43YQto4j1+u6uVfomV1wwMeUVxLALsYSWEZE0HpfRzrSjPyBB2V+9YLb5/H0dF8ROC/Wea5LqDV5sgM/1U/fdFvXRWWBnD7W2cBIQ5LYaeWmEoZNlbHfdMiEUBXS4rfXTLVviRQWapbTMN9jnJLP0YrYTCGAAFTCkx8D8y9HQwU4Z6MGJFz0E4S4Ooy6OiPU1lx0JfWxKcJD65svG86sdDEtn0qTd/ytEaJlk/e4kimZXpLEp3cKBsA4/KMU2PylCQXLxYsaIbqE/+fI6vJZDs/i4M2QPiaS9mApNTbqvliXKQPmMIAmEzZNzKpiXpMjSVu885JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K4Sj7RBv6/W6b3mg3fbdi0y/qnJHC3cqsVwiJ7dVqjo=;
 b=LFAcnTfBLAJ3L8Z0YOJ6ivRzBWtkoE8754svYc0DpqMRrFj2/5UbWTL+wxESaKZgf5LtZUi48z5d34Ocyc1Fyb+qAcI3Ym5OONR9aGs0MgOnKraZygtwpwJUGMdFSQ8kcRtF2uwcPywJRVTCQ7fLmw0/qZ2UkJ9bOQyY1S5zdMBlbGofk9dz+592eZrVfCfbzOTaH3Oz5xZXJexjpQry5Ua0zu8gMUV3vTdCTaHEWRkCcICsum18Oc9Tz7/BwgVryKJ1faD5cA6nn1R5TYUTEaNYM9ZOhtbkpccojfDEP4x9gZljj1BbxIP2ycaA5ewy3cR/Gkaca0eAFb1ZIHSQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 PH8PR11MB7072.namprd11.prod.outlook.com (2603:10b6:510:214::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.22; Fri, 2 Aug 2024 07:45:27 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%3]) with mapi id 15.20.7828.023; Fri, 2 Aug 2024
 07:45:27 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>, "I915-ci-infra@lists.freedesktop.org"
 <I915-ci-infra@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBGaS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsOiBE?=
 =?utf-8?Q?rop_unused_local_variables?=
Thread-Topic: =?utf-8?B?4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWw6IERyb3Ag?=
 =?utf-8?Q?unused_local_variables?=
Thread-Index: AQHa5Gz6RorLVzzCYUeNgTUpq6/xLLITlrwg
Date: Fri, 2 Aug 2024 07:45:26 +0000
Message-ID: <DM8PR11MB56557830D3EE7382D6F8288BE0B32@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20240801225224.3744479-1-matthew.d.roper@intel.com>
 <172255595359.489771.8234781667380581922@2413ebb6fbb6>
In-Reply-To: <172255595359.489771.8234781667380581922@2413ebb6fbb6>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|PH8PR11MB7072:EE_
x-ms-office365-filtering-correlation-id: 874604c1-c0f0-4c2c-cbe4-08dcb2c71332
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YjdLaVVhTkdRQjRYRHA1N3BsUTh0ODJ5dXRyMmN6NUExa000ZmtXVExucGoz?=
 =?utf-8?B?RU1RN2taSXA3VlZza1RKTDJta1Rsb3JQT3gwdWN3Szc1N0dHVU9jb3YzNVo0?=
 =?utf-8?B?WnpkYTBVRVBnUm9WT0ZOcUJ6c2EwSW1td3JzUGpVWHc1cGpiNjM5TEZHRFpx?=
 =?utf-8?B?alR6OW5OeUM4a1NKREVRZlk2eDZiUDF2WUZmMFNaTmZrM3UvRVArczV3RlFY?=
 =?utf-8?B?Z0hGYk9kMzNkRmlhWnFPeFh4Rk1hazVnYUw3WXRLalhBZGZjQTRjcENHN21J?=
 =?utf-8?B?SzZjSFJkaTdCQW1QRk5aOWVzY1dnQTh1Y2xqNGtZVG9nZUpRV2wvV3FFVW1i?=
 =?utf-8?B?WTFCNVR5Z2ZIdThrK0ppektNdUJqS0RENmdSSTgxQ2VMblo1YWtEUXJCNEl2?=
 =?utf-8?B?RGZJbFJCZ1RkeXJnYkR6RTRtKzdHWE53UUV4eGVFZytJdWdZN2NGcWlKbDZD?=
 =?utf-8?B?R0xyc3ZyOUF5d3llVVdZb3l3eEFzVnJnK3A2RGJTeTZSbzJXbDRyc29hdFY2?=
 =?utf-8?B?WWt0NU5QTlNCcFRvTVhGQnlFUXFtdnlrUVZXNUFmSjk5NzAydmsrcXlPbmg4?=
 =?utf-8?B?aDhUaGhjdjFiSE1JWXpMTlhBWmx0MDB2SldCdUk1UEcvU0dDTC9YQVZRZXJN?=
 =?utf-8?B?RzhNaUd3NFBwdEFZdkdTSU1oaFJndFgyVW9nREptc2llWERCbXNaVmJVcWl4?=
 =?utf-8?B?ZUZrajVlUjB6c3ZjVmxpQ3ZzVHVVUGtuSzdvRTAzYkZaeHJGK3QzaTM1WjZ1?=
 =?utf-8?B?RmZMUGt1UFFzMDNQcXJoOWwvUkRpTnFBd2h4dGZPTVBkbFA0SSt2ZmMxZTEz?=
 =?utf-8?B?T3lMcW9qMmhNeDZ3cmpwQnBDYk5WcVgxU2YxVkVSWnZxQlpvaGh5UDVvN3Z5?=
 =?utf-8?B?R0EyblRiNnNVK1BpMEJrTURHVVl2NlhhYTZtZEZIeURrM1lhR2hnVTNOMUNr?=
 =?utf-8?B?WGRVY2l3dUwreDhLOWZ2anhmS1paT2duc01sS0dNVDRGUTIzZmVHa085Z2cx?=
 =?utf-8?B?MTFETW94M1Nxa281ZGdYcm5jbk5Sa3M3QXJIeU1WMS9LM1lIa01DZkwvOERD?=
 =?utf-8?B?MUhWUHl0OTBYZEFHdXo4WTkzSFJqdnNDRFFzL3FtY2hCdW9aZVkzcDNUQmJq?=
 =?utf-8?B?enNsQjk1WHFuRzRCeW5teFJtSXM4TnZMVjd4NWtlTHdNUTE1UU1MajAwMzJU?=
 =?utf-8?B?TWF1YTJMSlh6ZzV6Yzd6NWwwT1BPbWU2a3gxOXlvQmRkclkyNjFIY1lTNk9W?=
 =?utf-8?B?d1ZyVjAxdmFTcU5sV0dhUjFUamxwTHNMRjVXQTZQUk9nZCtFQ2w1WU0yK09L?=
 =?utf-8?B?TCt6OVp2V2xmSmJUOHZUWkdwaTA4bUROU0dEckxPVWVDN1pZOVVYeTVmVC9V?=
 =?utf-8?B?Sng0QlBtY0NNSE9JUDcwSVVkaUJhbkVqTzFyL0tYN2l6RXNyUVlodkl4M1ZM?=
 =?utf-8?B?Q1RKQytqdFlici96OWhDYW5SU3hudmRDWnBxb3hENnhaMDdBbEdHQWpNNEZs?=
 =?utf-8?B?ZjkwWldGTWdJeVFqRElFQlBRNXZIbzFHcHRlWFBQN2pTVEVPaVFESkptaDhi?=
 =?utf-8?B?VTNmNHVWVXdWbmJDelZUaUQ3SHVjeU1ySngxQ3U5Y1I1MDhjRnFpS213RFZj?=
 =?utf-8?B?RjgvTTBIbEQ0aVNaMGRIQVlxSGNEd1RmL0NNME13dWFaeUpvUHZVMXd2MmY4?=
 =?utf-8?B?Mlk5VjFpeUV6WGJwOFNKS29oWUY2YytHQjJuMURrU2Nwbzd4NVFlTGN0aXFG?=
 =?utf-8?B?OTNEaXlXeEVDOVpHY040RStZMDJ2VVhEMTNKZU9UOEJFak1SN2p6Q3V4MHJG?=
 =?utf-8?Q?sBPtvFUWsor8DUwVLat3DUY3qEtEaww0VRVE4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Tms4U0ttOVp5ZTh4TFlwSGdXRUdDNHlIZnVtdjBjejhWMkxUTVZBUkhGaTJN?=
 =?utf-8?B?eFVVZWVabkxVSUV0N2hBdHdMV29TS3FHelpzazl6c0ZOWnl5Y09LMEpmZUdu?=
 =?utf-8?B?aGtleklib3dqL3NFTHp5Zzc5S2d6ZzUrdXM5Tzl1d090VkxTYStoTVJVNUlG?=
 =?utf-8?B?eStMMURQclpKMzZCRzYwYTRXSXpJTVB6cVAyTHlvQjh1aVdRSUl5VjlZeU9P?=
 =?utf-8?B?RDdLNHFiVUZtb0RHbWhsMmREUWhveEt2cHM1MFVXZHRFMkphNW5qOUJyOVg1?=
 =?utf-8?B?M1JTNytCanB6b0VyandSMlJWV1pSYW9idUxlTUVRVlpHRUdmb2J5N1ZSVkZm?=
 =?utf-8?B?VXpVREkrNEJwNlZ4bzNMaHZnaEp5UVJSWW9yS2h2TjBEREk3Z0thUjlxNmZ3?=
 =?utf-8?B?RUp6QWtGZ0NhYXAxekVEQXp6M1FhMjZVOU5YeFo2Si81TElQMWxralZ4TFZ2?=
 =?utf-8?B?N0NxUkNoTXRkM1hWdTBoMzhrQjZsRnYvM0dSK1dCTEdxWURjUWw5eGpjeGdX?=
 =?utf-8?B?S0kwcmRjOXFJSVE3ZmZ6OXZuTDgrQUJ4dGk4TlJyQys1UVNxNWRsYXBNMUN4?=
 =?utf-8?B?N1dJYlVyYW1jZm5ZWnhYTUpack43TGt3SkJseWNlUnptREYrOFZsQmFqakV3?=
 =?utf-8?B?YnF3SFhBNXgraEEvNVZZRjdZWU94TytoeVBESTFhUGVHWld4Z1ZQWTBjV0NQ?=
 =?utf-8?B?ME42YUJ3YTdGeStRQWFPUHJvNXBIcTNmeFpINGVuZ2lDUU1zSEdKeVhXaVRw?=
 =?utf-8?B?KzNmNXplZ1N4TEh4L2tRcXNEbmNZWUJCdHZLWVpLZTJSK0YxNWJYVTZSNkM0?=
 =?utf-8?B?a1pOM3hSTzhlcG1kSWdxNkpQMU9icWhQSVpBSm1aMkp4L2FkVm8xVHpiQkxo?=
 =?utf-8?B?MnAxMXFWbkU4dDF3WG1PYkVRRmNRemtES2NsTnM3Y1EyYlFyampoc2RXQW1B?=
 =?utf-8?B?Y1Y1cXdIZFlGVnpsb2lwNzFJVmJxVndwYWVtcVJvQW5HS0I3Q1gxNTNBVDIy?=
 =?utf-8?B?WE5kQi9RcXM1cEdQN2NUWGw5QkNKMW82WTBSK2ZRRFgzWjFlQnZlNXZrT0Jk?=
 =?utf-8?B?VGlwamVZVHZLSG8xdHBzVlBOMVh2YlNDbWRBSU9uSWZoYkdiRzBiQWloRm5B?=
 =?utf-8?B?WHZnMzdnaVJrY1UraUd3ZG5ZaG9ia3hmdnVBRUdCV3RwSEVpZWwvOHlLU1dD?=
 =?utf-8?B?eFVKYml2K2dZNHZYWTBlZThUVDdoMDhwR1l5L1Z1blI1bFRHT1I5N3k3Y1dV?=
 =?utf-8?B?S2xiUmNvM1grdUcvbXhOUlZxZ0RqMUprZ2JXcmJEdUlad25QOUlqRHdOZ0pl?=
 =?utf-8?B?UFlma0ZrSWgxQWNMYjhGaU1pVmZyaG5UM0dPekZzZFhKck9yTDc5L0RCdGQz?=
 =?utf-8?B?dmNOdEtPeWs2czBrbGY4VEwrZHpaM0pEZk9sMjY0djBBQ0dtK0ZHRUtuM2tH?=
 =?utf-8?B?U3kvb2kxN0x6dlVNUi9xekUwWFlFTWVsOVBYK01sTFpKYzBxVEVuS2RZNjQv?=
 =?utf-8?B?T29wa0hZWmppU3FwSHZSc1RnaXYzcEV2dE1LbXhXZEVzbW9pRjYrUWx4VDNr?=
 =?utf-8?B?dWM1ai9BQkZiM1N1Mm9zYWtZdHVkem4zcXpoZi9LV2cycmVVZ2VzM0dBalEy?=
 =?utf-8?B?TFljNjZDdEhhT21YckQzQ0hhWVZOcGxTejlGQkFaVEJoa3pCYmJnZkJDc0Ja?=
 =?utf-8?B?UXBFMmJIT1hMb3JCMFJLNHRsTGJxVFJVeFJ5NU1mbXB1N2ZyK1RYbEZGSXNi?=
 =?utf-8?B?Ni9uOGppUlVjZkM0TVp0ME5GdzFIckJmd2FlNTllNDRmTC8yd1RSWnhKbjlq?=
 =?utf-8?B?WnBHdU5nUU02VFdsbWxLaGl4clJ4TmJ6NTFYUkhnTWpGRmxQVThUMlAzWUt3?=
 =?utf-8?B?QnNmMHIyM1VhRU5iM3FodUR6WU13dlJ5MkpuT05UVm8zS1oxYTVvY3ZqejlZ?=
 =?utf-8?B?ZjRpZnBHUDlYcDdad3ZFcmd0emdTR21iWmNTMTlhTFZzczgxWkhuamQxb0Q0?=
 =?utf-8?B?OUdGSVNpZGt3cDU3dzN6YUE1L1lmbFk5dzBVV3pTajNrMXpSaXo5OWQ5UnVz?=
 =?utf-8?B?dlZSaXlMeFVpckdCcFY4TVlKVEFQQ0xRemRlYXFrejExVDEvZG5FYW1vd0hv?=
 =?utf-8?Q?63Gi2mW/Q3mJ3s0E1qBzSiY5P?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874604c1-c0f0-4c2c-cbe4-08dcb2c71332
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2024 07:45:26.9601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T1DcX4yqORfrPN/N1oLZYb4SUQYQb57eRt4nWVWN6a2N+41BckBFuXAXLbvmfo7/WOGy6G7pWAlAzj3lyiHAYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7072
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

SGkuIA0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3Qt
ZGV2LWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gUGF0Y2h3
b3JrDQo+IFNlbnQ6IEZyaWRheSwgMiBBdWd1c3QgMjAyNCAyLjQ2DQo+IFRvOiBSb3BlciwgTWF0
dGhldyBEIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog4pyXIEZpLkNJLkJBVDogZmFpbHVyZSBmb3IgdGVz
dHMvaW50ZWw6IERyb3AgdW51c2VkIGxvY2FsIHZhcmlhYmxlcw0KPiANCj4gUGF0Y2ggRGV0YWls
cw0KPiBTZXJpZXM6CXRlc3RzL2ludGVsOiBEcm9wIHVudXNlZCBsb2NhbCB2YXJpYWJsZXMNCj4g
VVJMOglodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzEzNjgxOS8NCj4g
U3RhdGU6CWZhaWx1cmUNCj4gRGV0YWlsczoJaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3Ry
ZWUvZHJtLXRpcC9JR1RQV18xMTUyMC9pbmRleC5odG1sDQo+IA0KPiANCj4gQ0kgQnVnIExvZyAt
IGNoYW5nZXMgZnJvbSBDSV9EUk1fMTUxNzAgLT4gSUdUUFdfMTE1MjANCj4gDQo+IA0KPiBTdW1t
YXJ5DQo+IA0KPiANCj4gRkFJTFVSRQ0KPiANCj4gU2VyaW91cyB1bmtub3duIGNoYW5nZXMgY29t
aW5nIHdpdGggSUdUUFdfMTE1MjAgYWJzb2x1dGVseSBuZWVkIHRvIGJlDQo+IHZlcmlmaWVkIG1h
bnVhbGx5Lg0KPiANCj4gSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2VzIGhhdmUgbm90
aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+IGludHJvZHVjZWQgaW4gSUdUUFdfMTE1MjAs
IHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkxNS1jaS0NCj4gaW5mcmFAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnKSB0byBhbGxvdyB0aGVtIHRvIGRvY3VtZW50IHRoaXMgbmV3IGZhaWx1cmUN
Cj4gbW9kZSwgd2hpY2ggd2lsbCByZWR1Y2UgZmFsc2UgcG9zaXRpdmVzIGluIENJLg0KPiANCj4g
RXh0ZXJuYWwgVVJMOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRp
cC9JR1RQV18xMTUyMC9pbmRleC5odG1sDQo+IA0KPiANCj4gUGFydGljaXBhdGluZyBob3N0cyAo
NDIgLT4gNDApDQo+IA0KPiANCj4gQWRkaXRpb25hbCAoMSk6IGZpLWJzdy1uMzA1MA0KPiBNaXNz
aW5nICgzKTogYmF0LWtibC0yIGZpLXNuYi0yNTIwbSBmaS1rYmwtODgwOWcNCj4gDQo+IA0KPiBQ
b3NzaWJsZSBuZXcgaXNzdWVzDQo+IA0KPiANCj4gSGVyZSBhcmUgdGhlIHVua25vd24gY2hhbmdl
cyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbg0KPiBJR1RQV18xMTUyMDoNCj4gDQo+
IA0KPiBJR1QgY2hhbmdlcw0KPiANCj4gDQo+IFBvc3NpYmxlIHJlZ3Jlc3Npb25zDQo+IA0KPiAN
Cj4gKglpZ3RAcnVubmVyQGFib3J0ZWQ6DQo+IA0KPiAJKglmaS1ic3ctbjMwNTA6IE5PVFJVTiAt
PiBGQUlMIDxodHRwczovL2ludGVsLWdmeC0NCj4gY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQ
V18xMTUyMC9maS1ic3ctDQo+IG4zMDUwL2lndEBydW5uZXJAYWJvcnRlZC5odG1sPg0KVGhpcyB3
YXMgaGl0IGJ5IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvMTE3ODEgdGhhdCBpcyBub3cgZml4ZWQuDQpQbGVhc2UgcmUtcmVwb3J0IA0KDQo+
IA0KPiANCj4gS25vd24gaXNzdWVzDQo+IA0KPiANCj4gSGVyZSBhcmUgdGhlIGNoYW5nZXMgZm91
bmQgaW4gSUdUUFdfMTE1MjAgdGhhdCBjb21lIGZyb20ga25vd24gaXNzdWVzOg0KPiANCj4gDQo+
IElHVCBjaGFuZ2VzDQo+IA0KPiANCj4gSXNzdWVzIGhpdA0KPiANCj4gDQo+ICoJaWd0QGk5MTVf
c2VsZnRlc3RAbGl2ZUBoYW5nY2hlY2s6DQo+IA0KPiAJKgliYXQtYXJscy0xOiBQQVNTIDxodHRw
czovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9DSV9EUk1fMTUxNzAvYmF0
LWFybHMtMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGhhbmdjaGVjay5odG1sPiAgLT4NCj4gRE1F
U0ctV0FSTiA8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MTUyMC9iYXQtDQo+IGFybHMtMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQGhhbmdjaGVjay5odG1s
PiAgKGk5MTUjMTEzNDkNCj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkx
NS9rZXJuZWwvLS9pc3N1ZXMvMTEzNDk+ICAvDQo+IGk5MTUjMTEzNzggPGh0dHBzOi8vZ2l0bGFi
LmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTEzNzg+DQo+ICkNCj4g
DQo+ICoJaWd0QGttc19wc3JAcHNyLWN1cnNvci1wbGFuZS1tb3ZlQGVkcC0xOg0KPiANCj4gCSoJ
YmF0LWpzbC0xOiBQQVNTIDxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+
IHRpcC9DSV9EUk1fMTUxNzAvYmF0LWpzbC0xL2lndEBrbXNfcHNyQHBzci1jdXJzb3ItcGxhbmUt
bW92ZUBlZHAtDQo+IDEuaHRtbD4gIC0+IFNLSVAgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9y
Zy90cmVlL2RybS10aXAvSUdUUFdfMTE1MjAvYmF0LQ0KPiBqc2wtMS9pZ3RAa21zX3BzckBwc3It
Y3Vyc29yLXBsYW5lLW1vdmVAZWRwLTEuaHRtbD4gIChpOTE1Izk2ODgNCj4gPGh0dHBzOi8vZ2l0
bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvOTY4OD4gKSArMyBv
dGhlcg0KPiB0ZXN0cyBza2lwDQo+IA0KPiANCj4gUG9zc2libGUgZml4ZXMNCj4gDQo+IA0KPiAq
CWlndEBnZW1fbG1lbV9zd2FwcGluZ0BiYXNpY0BsbWVtMDoNCj4gDQo+IAkqCWJhdC1kZzItOTog
RkFJTCA8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3JnL3RyZWUvZHJtLQ0KPiB0aXAvQ0lfRFJN
XzE1MTcwL2JhdC1kZzItDQo+IDkvaWd0QGdlbV9sbWVtX3N3YXBwaW5nQGJhc2ljQGxtZW0wLmh0
bWw+ICAoaTkxNSMxMDM3OA0KPiA8aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9p
OTE1L2tlcm5lbC8tL2lzc3Vlcy8xMDM3OD4gKSAtPiBQQVNTDQo+IDxodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzExNTIwL2JhdC1kZzItDQo+IDkvaWd0QGdl
bV9sbWVtX3N3YXBwaW5nQGJhc2ljQGxtZW0wLmh0bWw+DQo+IA0KPiANCj4gQnVpbGQgY2hhbmdl
cw0KPiANCj4gDQo+ICoJQ0k6IENJLTIwMTkwNTI5IC0+IE5vbmUNCj4gKglJR1Q6IElHVF83OTUx
IC0+IElHVFBXXzExNTIwDQo+IA0KPiBDSS0yMDE5MDUyOTogMjAxOTA1MjkNCj4gQ0lfRFJNXzE1
MTcwOiBkMWVjMjBlMTQ5ZmMwYmQ0ZDE1Y2JmMzQ1NzNiODRkNGZhNDdlM2E1IEANCj4gZ2l0Oi8v
YW5vbmdpdC5mcmVlZGVza3RvcC5vcmcvZ2Z4LWNpL2xpbnV4DQo+IElHVFBXXzExNTIwOiAxMTUy
MA0KPiBJR1RfNzk1MTogNzk1MQ0KDQo=
