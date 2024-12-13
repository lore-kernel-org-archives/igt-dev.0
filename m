Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B41E7717D
	for <igt-dev@archiver.kernel.org>; Fri, 13 Dec 2024 10:00:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E85710EF8E;
	Fri, 13 Dec 2024 10:00:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H670QmPq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0B4010EF8E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2024 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734083999; x=1765619999;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1Ca9epnfiC5qyZIfQinPYLMfKqoBAn1eflHGUQ+IgOQ=;
 b=H670QmPq11m8M/VKLVcQeNwIwLdy1ZEPs0CK6LGxnaHO+PMeJ1oRzXq5
 KHfO5fEnsfLUr2TgMz7k1h8s1U8aHem3eNW/W7SUiwZb7F5lTSJb5y+jd
 ZN8uRw0tzz8+KKkTwAXLKcbnXmVJfD2B7UKu9SYB0ewJ5J3Yyq6ecNr6y
 lcH3KyjH9s0xI1Gzqt6bvfIauFQAQwNTaKr6HXlXC6diniF+bm4DMkLOZ
 r+DWn1OOn+VmdpR9Rbtio6gG6wkA5Z8AOZdcQLs/QZDJ9EXs94kMXwtHT
 IyR5iaR8S3ym7hWYTEfcI/0jJmV8IM2WBc4pbD8MPsMUtId+a48H4DLql Q==;
X-CSE-ConnectionGUID: bXDijFbMSlqMDJGIZdbE2Q==
X-CSE-MsgGUID: NbCQoMsZTUe/jV0p0KD0Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="38209270"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="38209270"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 01:59:58 -0800
X-CSE-ConnectionGUID: SEJHyDq0RpOmvkgcdeTdjA==
X-CSE-MsgGUID: KgBmiIuUS5GiDXhgtPjRtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96396060"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 01:59:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 01:59:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 01:59:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 01:59:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=amoinLYLnzSbnQfGJVCKLnwNoewhsi5dYYMLJshmTPPkGdww7u+EgowXrfK8m4FcMEm6KSmQRHG7zqPWutswl8FXTnZtD3FCmwvbss5/jh4fkclX25gA/vNvyIKAM/aBb0terD/rJVU5d+MnPcsaaGc2sWidA4ouuLJUBCiteFwNqu8X0kqXSDC3sOThZk4qSMgPYQh4UTqsPiW/glrB0XjGLQdaWZZ3+232BuTv+/VL1xkQC1TXdMC6VaTU6pHEshcLzLNESESTdCyjkcZwDO+ll+JJvTcIRURgmljvURMH6cHvgNU327U0aimf7sZ0WA2VmDx4QOcQeenj6DB9Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Ca9epnfiC5qyZIfQinPYLMfKqoBAn1eflHGUQ+IgOQ=;
 b=Phcg4BfSqiMvWKVXBa6CkUwkA4LzKW06JVYXWB/pMsF0OUEojIy9QerdQ4Fu+TVadiktwnFYbepLQ1asYa5s2GBgd4lApGh0pL65Cx6koywOkn+11SP8M09N5C6rIljpSilv2v89q/oLHeKorDkQu+m3XHVjKYC1qotMZL9QbC1Z2pz3WF9z5OutmdQBV1Jkjb9Xg3LoO7RN8bTd+peJiaocIpiv+RgnPwOboH5LU7n2pJgMzbe8LiZ/oAr7wmDAnuy77m56sKjvIMBW3Ptt1Jt2a+XyYydZrc7guuO42voBcZEUG3cYQvF9bl1+vJgztQ+lrTjjrKD7xQg85sCRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) by
 PH7PR11MB6748.namprd11.prod.outlook.com (2603:10b6:510:1b6::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8251.16; Fri, 13 Dec 2024 09:59:55 +0000
Received: from DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7]) by DS0PR11MB7264.namprd11.prod.outlook.com
 ([fe80::d250:d70b:55aa:5ff7%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 09:59:54 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?B?eGVfZXVkZWJ1Z19vbmxpbmU6IEltcHJvdmUgd3JpdGVzLWNhY2hpbmctKiB0?=
 =?utf-8?Q?ests?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94ZV9l?=
 =?utf-8?Q?udebug=5Fonline:_Improve_writes-caching-*_tests?=
Thread-Index: AQHbR5MjTt1PrTMnJ02Ge+7sx7ymYrLj+dUg
Date: Fri, 13 Dec 2024 09:59:54 +0000
Message-ID: <DS0PR11MB7264CC89C08A96BAF0057418D9382@DS0PR11MB7264.namprd11.prod.outlook.com>
References: <20241205140352.16822-1-dominik.karol.piatkowski@intel.com>
 <173345749590.3169666.14116412026518060663@b555e5b46a47>
In-Reply-To: <173345749590.3169666.14116412026518060663@b555e5b46a47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7264:EE_|PH7PR11MB6748:EE_
x-ms-office365-filtering-correlation-id: f330bdcd-4d4c-4577-a857-08dd1b5ce4dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?b0g0WXM2TVZCcUpVRG43UFU1eERJKzZKL3VYd2FKbjJNa0pFTDNWWEE4OUJt?=
 =?utf-8?B?N3V6VEhzamFlbDd1cmZrSFBkbzRtKzNJemNxaUlqTk8vb1ZUUmIwUWozQ3dh?=
 =?utf-8?B?WHBINi9Sc2xtazBqczAxd01MOEF4NXVDRmFzVGRSL2dYcVZwS0NpL0JxTVdp?=
 =?utf-8?B?NFZXZ3ZQaUpIWGVzcTE4VWp2dVJEYjY2Nk9IR2p1cUpEVnZLSS85V2kxaElF?=
 =?utf-8?B?WUg5a0cvSjAzeDM0YWg4QWdlQitQZ0pMbDlzb3B6ZjNGNjMwZlppOCt0YXU2?=
 =?utf-8?B?dUw4aS9tU25uVjBjdW5jUnZPWDJkQWYwVkJuMzJGQzZKaUpVNVRBVi9vNnJH?=
 =?utf-8?B?OEg2ckJQNFh4M2RwcTc4bXFSU0dLVU1FY0ppNytQbUhuNU03dXFyRi9vSHNl?=
 =?utf-8?B?bVZqcDRRNzRxa21QZjBaSnFiazNzL3k1NmU4eUdZQjhTMFZ6UHJ0amR2WWhB?=
 =?utf-8?B?NHo4ME9tRjh0UTlOQlpXeW0xeVAwL1ZjMlQ3VVFyaXRDQnhiaHVscWc4eUZ2?=
 =?utf-8?B?azM0azZ2K3lGNkFsYWw3cWE0dTFDY1JneHQrRHEwMWRndXQvUDdDRUdxVXNm?=
 =?utf-8?B?UW5kRHlyQmRxNmtaUVNvbm5nTjQ3OE4zR0svOU1OQnF1VkhBbkdoRURESjBh?=
 =?utf-8?B?UEF5d0IvWnl0b0NicktCRkl6cEJpckZ0cXZmc1BRejVmK1VlclMreHF6cUxy?=
 =?utf-8?B?SEdNUHZ4Ty9DY1ZVdlc5VmV4RGVCSHVWN0tIUHBmcjRxaTZ3K0daYXJjTnVE?=
 =?utf-8?B?cTZtV0JZVjZTdC9XQVpJdUowaFd5TEEvbDF6bWsrZEJlR2lSbU9Fb1FDUTRZ?=
 =?utf-8?B?YXBBV3dadlFjOC9lZ1hQOHJUTXFvWGFBSmxpOXZaTVhSa2xIODlTbWZkUzJi?=
 =?utf-8?B?QXJTRklaNTFBTmMzVzJKQXlEZFY5RHJBNmVrTWxsQ0tFaTI2WFRXMUlUNzFL?=
 =?utf-8?B?U2Q3VGhiNm5MaWx0UmpoczFNNlVpN1NVaTc5UWdFYkF0Yng5RXVnNmYrZVdr?=
 =?utf-8?B?Z3Jac1lPdm02cVczTFBOdlpkTmtIanRyYmxLMUxqTUhLLytGWFpvNnVnZHJW?=
 =?utf-8?B?Qmdrdk95MUlBK1hhTWRpc0IvTnJzdHlKR1lRK1cxSkpFSUJueXl4UmRTb1E3?=
 =?utf-8?B?NTBlOG44eWdzQ25yUlFvTmhBVEk1bE5FL3J5a1AyRXJyelZlN0RZZGkxZW8w?=
 =?utf-8?B?bGJBbSszNWs0MzdHa2MxRTh0YjBRZnJnWHM0cFRnTFZzT2ZLaGRMeXJHQitJ?=
 =?utf-8?B?VGc1eGs3TWkvVFlqazBTUGM5M0FNNDlJUy8reEdzVXpROVUzaDRNWjdETUtn?=
 =?utf-8?B?YXNDY3VuMThaa3pTOXNRNFB0YS9uR1JyWUhra2dyR2Iyc2dEQTVjeXlMcVZZ?=
 =?utf-8?B?OUFJSVVBV2dKYXAybmFvMWY5emdPWFZjZXlhM2JOb2oydWdFcnpndkVRVTcv?=
 =?utf-8?B?aXVJRmJoTjN4OWlldkhBRkVDUE9PQjBTYjNsQkN4TFVXVWp6UUhGS0R3R0RJ?=
 =?utf-8?B?OTdLaFpqenYxc2JRUWh1T2FnMkh0K3FzT1MzdkpnZm9ZRWcvb3BCSkRvY2dy?=
 =?utf-8?B?ZmpWakxhYUcyZEc1KzdpRk0xU0ZvSW91SkJmUktEOWlPWmxtN29Wc0hueWVa?=
 =?utf-8?B?UFoxaVE2MXZPYUZQUUdzZjNDODdaWjFpVnQ5UUI0aGpLa2xpazcvblM4V29Z?=
 =?utf-8?B?OXBjQ2JXbHBSQnlmRWZMdlh2YUVuU29NaVBUZTNIekxod2lmVzJSWjRtcE1Y?=
 =?utf-8?B?dzhoSkk4N3pNMHBLbVpqbFNVaHExakdzYkxRL2hZTDFldnoxTTFSTEFyVE9R?=
 =?utf-8?Q?9BCUBvkYxtuII5lzCVabGJgG4RHF0Ad+L+43I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7264.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R25NRWp0dFQ3NVVOWHoxRm40TVo4MXhGNXV0QTFWcksxaW83SEdycjJhckFC?=
 =?utf-8?B?bjdrcWhTSVJPcmZIejI2cGlSQnZxd3ZMT3B3WDRoWEIzT0F1eitSNnBsVjVE?=
 =?utf-8?B?MnpQOGhJdWtlY0ROZVBZeEh5dDBka1BNVk96WEZ3ZXdPQmJ3OUhsUUxkN0Fz?=
 =?utf-8?B?bDJmb25iU0R5SC93OWIwWUhFMjBDMW5Rcm5xN2llTHpUYWw4ckJDbEFjL0M3?=
 =?utf-8?B?VFE2aG5wUkpJbkt1T01lK1BWNTNxNmR4U241bGV1VnI1SExJRzRaOWJwNXp5?=
 =?utf-8?B?MTVrNmgxSHVRWW9obXNpQjExeEEzNklSdVliaXY1TllqdUpnQ1JBYStuK3JC?=
 =?utf-8?B?eElJNUhFSkZkdFZEUFRaUDVNNTBiNGdFUHF0NnMzVWhzV29zb3VuTjJ6WEVU?=
 =?utf-8?B?eGxzMHlkeXlDYytmSFQ5bTVjWldsWG5MQ1pWS2lsMkJxTWYxRkxkd2txOW5W?=
 =?utf-8?B?allhUjVMMjhvNWJBVFRid1hWZDVvOWJSQTJtNkNVMitzR3NZRnBTYUVIQWQx?=
 =?utf-8?B?L1pSenhqSnozVmxCVWpZK3lIZHVtYXRSYlpNVWtOazRTVytYZ05NOFN6eVRw?=
 =?utf-8?B?UUZiL2M1RHVOQk5rMmZPLzRPL0hFU3FjS2NuWmk4MnhLVGZMV01IK3dnMVlm?=
 =?utf-8?B?RmlBSVB5eUhybmFieG1pbmxhMnd2dFZvUnlwdzR3a0xCaTFYMnRZRmd6dVh2?=
 =?utf-8?B?ZXljSHNScUExYjBObzlSTHZUUVpjeDBhaW81d1E0K2FwQlNMU29pVnNMWVh3?=
 =?utf-8?B?cUZhTzJSTGRMTjhveDdyUkZmbmlDYXk3cHI1MXFSSWVRNCtXQ2wyOVk5eDRU?=
 =?utf-8?B?TmYvZzczMVFTZnovMXA3Zy9xNDQ2YVVyVDV1bGxKbktVK3E5bkRxSVNscVpo?=
 =?utf-8?B?ZFduTUh4SGU1L3dSOStlNUgrSlZUeVRPNnV2TGpkYW5iUHA4alF1RzlsWjRP?=
 =?utf-8?B?NUZKYkNRTDFPMFl6ak4vc2ZnOE40aDYzYmx0T2FGOEFUQ2VhL1BVMks2YUt3?=
 =?utf-8?B?RHd2emRMQURHOHM0dkFUOXE4eHJUTUZVT2hDK3c2TFgwVU1Sa08vU3BLSENm?=
 =?utf-8?B?N3ZpTDVFZE9Jbk1YVnl4SnFxUWRneFFmMlZzcGI1VTR3d1dmSEl4cGVBSlk1?=
 =?utf-8?B?TDVGd3p1aXlRU3Q4c0M4TzBjcnNiZjNwYWRqL21nSUpEMXJabWFENnB2OHVh?=
 =?utf-8?B?eGJrNmZaRGFvc2RmRU4yNEw1U3BCQVVxcy90OVpuVUloTC92S0tHRDIxMCsv?=
 =?utf-8?B?Ri9QQVdCRUZhaE9Hb09tWldEWUlXSkgyMHJuc0RUZ213azRJbWFveGdaU0pX?=
 =?utf-8?B?Zk4vZHVnVW1jYW11OTlYNXVSdENBaTlrNGwvZ05CYVNKZjZ3K0l3QjNsWVIv?=
 =?utf-8?B?Wkwvck9YdGV6T3MrdloxUFI3eHB2NHFwRnh4a2daOTJiaE9iMGcxaGFrREd3?=
 =?utf-8?B?NXVBSUZGM1FNdHhYSXpibFlCWEQ3aWJIenllS2VFRkVtN0IyazY3K0xzd2d6?=
 =?utf-8?B?SllxeVkvSklibHhYSkNpTS9OZ2pVOUdYcUJlakV2Lzg3eDhTWVptd0R6ZW1H?=
 =?utf-8?B?dXd0eVVJMTJLR29ua1V2ZHk3MVZ1bTY0a2dnb3NrM0VFSmdCaFFibE5IZVlr?=
 =?utf-8?B?c29kRDJteHBCVis0V0xsTzhERlh5WCtZVndub2xmQmk4V2VIUUtVTGFCcDVW?=
 =?utf-8?B?UjI1TEgwbEdnNks0VnA0dENMeHZySGNIQ0tBMlRsLzQ3RDFzUWtXVC8yQ1Zt?=
 =?utf-8?B?b2ZmVnczeWZobndiampIUlY2UThEOXdMTGVyeEZ5cHFqNm9aR0doQThsc01P?=
 =?utf-8?B?cWV6KzVqTXgvVG1xWW9SUnJDK21IM2RZaTZaMXg2WXlBVFU0RUNGZEptdnlK?=
 =?utf-8?B?TlN1WURLZGt5Y2ZPUUgzVHdBOEx0THgzN2FsTk9SN0V0djlFWWpmbTVpVFB5?=
 =?utf-8?B?elk1NUJiQzByL3ZJRU1SMDlXMVppWjFZaGFSTUZJb05WZ1ZObkZHZ0ZHaklK?=
 =?utf-8?B?VDg0d05weUZUTWNXcVBNOTlxTnVxck1uVmxURW5mT0ZXU0ZaSkFmTG0rS0lt?=
 =?utf-8?B?QU1DeGMzSVltQ2plQWZnNXloSjBKZEpMa3lMY3IxcU0zL0FvVVlRVGp4N2o1?=
 =?utf-8?B?TzRuT1dnS2NVc0Z1d1h0RnkyMnlJVnRLckNHSHFMaHl4TWk1ekh5VCtoU3N1?=
 =?utf-8?B?M3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7264.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f330bdcd-4d4c-4577-a857-08dd1b5ce4dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 09:59:54.6526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MF0xa/XjL5jXjo6eYWWw7PNN8yrziOnmWT5VEF3xJPTr76+WWCttEkCGs6c4LOWTIyzfhW1P4SILYTo737t+pAvzvVeo+eTzPkFbCH+EX57rUNLW5Z+SHdMu1eEDo5YT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6748
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

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGF0Y2h3b3JrIDxw
YXRjaHdvcmtAZW1lcmlsLmZyZWVkZXNrdG9wLm9yZz4NCj4gU2VudDogRnJpZGF5LCBEZWNlbWJl
ciA2LCAyMDI0IDQ6NTggQU0NCj4gVG86IFBpYXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRvbWlu
aWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5jb20+DQo+IENjOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiDinJcgaTkxNS5DSS5CQVQ6IGZhaWx1cmUgZm9yIHRlc3Rz
L2ludGVsL3hlX2V1ZGVidWdfb25saW5lOiBJbXByb3ZlDQo+IHdyaXRlcy1jYWNoaW5nLSogdGVz
dHMNCj4gDQo+ID09IFNlcmllcyBEZXRhaWxzID09DQo+IA0KPiBTZXJpZXM6IHRlc3RzL2ludGVs
L3hlX2V1ZGVidWdfb25saW5lOiBJbXByb3ZlIHdyaXRlcy1jYWNoaW5nLSogdGVzdHMNCj4gVVJM
ICAgOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE0MjE3OS8NCj4g
U3RhdGUgOiBmYWlsdXJlDQo+IA0KPiA9PSBTdW1tYXJ5ID09DQo+IA0KPiBDSSBCdWcgTG9nIC0g
Y2hhbmdlcyBmcm9tIElHVF84MTM5IC0+IElHVFBXXzEyMjU5DQo+ID09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0NCj4gDQo+IFN1bW1hcnkNCj4gLS0t
LS0tLQ0KPiANCj4gICAqKkZBSUxVUkUqKg0KPiANCj4gICBTZXJpb3VzIHVua25vd24gY2hhbmdl
cyBjb21pbmcgd2l0aCBJR1RQV18xMjI1OSBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj4gICB2ZXJp
ZmllZCBtYW51YWxseS4NCj4gDQo+ICAgSWYgeW91IHRoaW5rIHRoZSByZXBvcnRlZCBjaGFuZ2Vz
IGhhdmUgbm90aGluZyB0byBkbyB3aXRoIHRoZSBjaGFuZ2VzDQo+ICAgaW50cm9kdWNlZCBpbiBJ
R1RQV18xMjI1OSwgcGxlYXNlIG5vdGlmeSB5b3VyIGJ1ZyB0ZWFtIChJOTE1LWNpLQ0KPiBpbmZy
YUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBkb2N1bWVudCB0
aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBp
biBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcv
dHJlZS9kcm0tDQo+IHRpcC9JR1RQV18xMjI1OS9pbmRleC5odG1sDQo+IA0KPiBQYXJ0aWNpcGF0
aW5nIGhvc3RzICg0NCAtPiA0MykNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+
IA0KPiAgIE1pc3NpbmcgICAgKDEpOiBmaS1zbmItMjUyMG0NCj4gDQo+IFBvc3NpYmxlIG5ldyBp
c3N1ZXMNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiANCj4gICBIZXJlIGFyZSB0aGUgdW5rbm93
biBjaGFuZ2VzIHRoYXQgbWF5IGhhdmUgYmVlbiBpbnRyb2R1Y2VkIGluDQo+IElHVFBXXzEyMjU5
Og0KPiANCj4gIyMjIElHVCBjaGFuZ2VzICMjIw0KPiANCj4gIyMjIyBQb3NzaWJsZSByZWdyZXNz
aW9ucyAjIyMjDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZToNCj4gICAgIC0gYmF0
LWFybHMtNTogICAgICAgICBOT1RSVU4gLT4gW0FCT1JUXVsxXQ0KPiAgICBbMV06IGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTIyNTkvYmF0LWFybHMtDQo+
IDUvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZS5odG1sDQo+IA0KPiAgICogaWd0QGk5MTVfc2VsZnRl
c3RAbGl2ZUBnZW1fbWlncmF0ZToNCj4gICAgIC0gYmF0LWFybGgtMzogICAgICAgICBOT1RSVU4g
LT4gW0lOQ09NUExFVEVdWzJdDQo+ICAgIFsyXTogaHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMjI1OS9iYXQtYXJsaC0NCj4gMy9pZ3RAaTkxNV9zZWxmdGVz
dEBsaXZlQGdlbV9taWdyYXRlLmh0bWwNCj4gDQo+IA0KPiBLbm93biBpc3N1ZXMNCj4gLS0tLS0t
LS0tLS0tDQo8Y3V0Pg0KDQpUaGVzZSBmYWlsdXJlcyBhcmUgbm90IHJlbGF0ZWQgdG8gdGhlIHNl
cmllcy4NCg0KRG9taW5payBLYXJvbA0K
