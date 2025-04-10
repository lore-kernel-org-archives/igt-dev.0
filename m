Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9034C369A2
	for <igt-dev@archiver.kernel.org>; Thu, 10 Apr 2025 07:26:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6816C10E7A1;
	Thu, 10 Apr 2025 07:26:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzUz/rXj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C3F10E797
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Apr 2025 07:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744269959; x=1775805959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1av6EYpfcUoCI5hl7McnbJaoeT4oeiTMl2q0v7EN3Bk=;
 b=XzUz/rXjqS10wedpft+N76KZMjvGiY+c3fgNtT4McJYzn+PEDBZGUU7V
 EigQxQWTviGjaPxRmHBEIr442a15AyoKVw5n35Kob8epKWF66fG9HN2a+
 1RzqlgKqP6JkMPnN4RqNNsA7wOrKmzqDLGAcTAdR8QUKErFryL0oLtqI6
 kJE6w4R8V3fsDa+7Q+LFDlUVKfNubK4Dg9KTrJZxg9Ihp3Lv63ZxNt0wR
 VBaYhLGkDCLPWZxFWzS6nWCwewXpft8IO0ytTnzi6VPcTfnlRCrJAOOXQ
 +9EJxVAkCxykKeugWSfqRkErCKq2eEvYSeF7HaWwbwBTO/3VJcNgxYRcX g==;
X-CSE-ConnectionGUID: vNKzwlB9Qay7AaXKC9KJww==
X-CSE-MsgGUID: qy03bTcET7+YZf0SKu+cLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11399"; a="33380651"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="33380651"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:25:57 -0700
X-CSE-ConnectionGUID: P/CUYAPpTm6+qZx7dtF4gQ==
X-CSE-MsgGUID: qtYoyqYGSVeAxexNiPDVIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134009466"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 00:25:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 00:25:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 00:25:56 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 00:25:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WhZ9MRAgMqbtmnqvViBL3lijwsU1LvjXKRxhEy5n4sMktSUJ4vMKRFNM4f3DIk2F1cSymTL3v9c/ylNwL64pxUMApgo8gkMgVFaM5B3CJ8rfIhGWzXqP9s/CGe3INOyY5ecNIJ401WR6lh+vaPPGvBEOZO0BlbpnpqnfFvfRRmVZHqQ09YBIa3VpngdBnFFrc6myf3JgNDPqZ8IR2TftRxCtICk3eJHRK7zasPWD1vvHHOiGrMVErfZZw8n/U9ceX982ut0WSODatMlf+tBjzk0D9Rjv6zoP07cVNdNRromvGd/0vN7veEw7eGLg3DIKQ2/j5tUv5wBKDgq32D2VHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1av6EYpfcUoCI5hl7McnbJaoeT4oeiTMl2q0v7EN3Bk=;
 b=HiJ2AlN4pkDBXetRRMXC6IoVxanbBYny73sicewbU81vwMTCfIduQtguAtp22Zo8hJJiklJ6FfUp2y2VQhT5Er+K/vIsB0+H86Lkr8jun2vPPdd+W0CeLHzW1/Kh7L5mRAzIBh+O/iuVGTSMyOk8uuszmZwGoP/VQCl/2d7oNT6uPqef2GeebwF4+U1WKtha/Tifkfw1HdE2c47RF2+sTNgzLbklvsq1ryQmGRhJ3Ut2vZb+i0iKWxq9gZ7/3fKm+AYgiXHYvftnQUGchLuI1O5TmIo0cwW5Qdua2V9awd6ctZu8NGxUSOOn9etcQlcYHf9/PQRk02eBqw0NSkH/xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DM3PPFD83941681.namprd11.prod.outlook.com (2603:10b6:f:fc00::f55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 07:25:54 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::faad:f9ae:2b45:e9ba%6]) with mapi id 15.20.8632.017; Thu, 10 Apr 2025
 07:25:54 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Swati2" <swati2.sharma@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Topic: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Thread-Index: AQHbpIR9y5Zh0Hnbv0+N+3HVO8TT7LOTOlqAgAlPqqA=
Date: Thu, 10 Apr 2025 07:25:54 +0000
Message-ID: <DM4PR11MB6312A6689F29141AAC1C3D5190B72@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20250403105335.2034060-1-jeevan.b@intel.com>
 <070d3642-31e8-4f72-86e7-8c33fdb13a4f@intel.com>
In-Reply-To: <070d3642-31e8-4f72-86e7-8c33fdb13a4f@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DM3PPFD83941681:EE_
x-ms-office365-filtering-correlation-id: 29329a84-124e-4499-325c-08dd7800edf1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?NkpmbjNQV0hKdVFuWDFwWGRzT2pqcU5CMFhwbzJsQjlXcjhCTmFHM2gxZ1cz?=
 =?utf-8?B?U1gzUUxQZ1VMaFNQYW9QdEZyeHJnMTdhYkVwNzRpTXF5ekZqUitFdXc2ZW5w?=
 =?utf-8?B?RWhicmo5clBzTitzVjRiMkY1UmgrVnkrSzJSL2FTZUQxR3U1M2luSEc4WmxG?=
 =?utf-8?B?V01xNG9XVUtrMHIvbXFMdWp5bG5mUjZsMmNaQUVPQjBVNHdpRTB2UkhXemFk?=
 =?utf-8?B?Z1RtRk5TTGI3L21ENnF2bW9Vck83OFNDZ0ZSZFRDYmRiWmVoeFVheklxZXBO?=
 =?utf-8?B?UlBmNUd3eEhqUm9xeHdTdWNBSmp0YUtFVnMwRmVsVTRPSkNydzhOOHhnQ0pz?=
 =?utf-8?B?eVVZc3F6Rjg0Y0VNVlhDV0NGb1FxYjhsWlNEY1ZNOGMwV1dmMVNhY1BIRmE0?=
 =?utf-8?B?aEZGSXlaa3hld1VuVG1ROE1LZEMwSGxremhmdVAvcitZS2NOS2t2Qjk0aEN0?=
 =?utf-8?B?OFFvS3VXTXRnNldTSWZycjN0d3ZGWVpLZXlMMS9mS0paMGR3NWdMemFSOWdH?=
 =?utf-8?B?UHJ1RHUzb2RxdUk1KzFLeUhGeDF4SXYwZUFteFRBQnU3QkN1SCtoNGJ1M2xK?=
 =?utf-8?B?Z3owSlloNFZad002MmhxSFNEblBmeEJBeW8rblBVU3dCcm92RGViZ2xQeDFl?=
 =?utf-8?B?KzBLbkVJanNYRVN1VmM2VGJuWFQvSElnbGl4T3FsSk5xajJyWWFkalhLd3Zv?=
 =?utf-8?B?YnFwTitTdEt2K3h2K2F5WkJvNlQ1WENJL3B6K29uNmdiSFJtMUNFZUdZa2hR?=
 =?utf-8?B?cGxvei9GVkhhRkF0OTRYa1FWY1VmeXZrYkkyQ0k1b1FpbFp2UzI2M2U1T29T?=
 =?utf-8?B?L3YydDQwaTVGRkIrTmJTTXF5TU1QMDJzUGFiSHhSNnJqQmRjaXhQMXYzNEVq?=
 =?utf-8?B?OUl2RnRBSlhiSkt0STNmMUREd2ZWdGZGQytQRjN4SDFSSnlOeGQ0RkJJY242?=
 =?utf-8?B?Mlk0VzQzWVpDN2dWWGwrbkdpM1VyM0tYcTJ1RmZNdDFpM1VUU3ZxUlVFdHlY?=
 =?utf-8?B?ZVdrOWh5RFVGcW9LaWh0WG5XR241RFhjWkNxbFdDSXJibVZoR0lWdWMwUU9O?=
 =?utf-8?B?ZXRkSFFvREd6ZWttdUpMa0h4UzZTZFprMmtDK2JTSnZiQkV1TjNwb09TS1hG?=
 =?utf-8?B?WjlUNUZZZ1haRGc3Z25ldDhWcmFDSmRENFVOMEd3L1pjSG9jdFFwaE5pTUx0?=
 =?utf-8?B?V2ZuN2plRnZKTVVTUk5kODdLRzFMdnhtSzhkMjBMLzByVVdoeG9Ra0djL1lF?=
 =?utf-8?B?eVgzTE5XUi9IeGU2ZVA3M3JhRk1OMjM3SDh3ZmpCcHhEQXM4cnllWTVSZnlr?=
 =?utf-8?B?TUh3cTJjWEJxNkQxdHlQRm9YSXpueXpOS1VObVAwVDZwUGpQajJERkw2alpw?=
 =?utf-8?B?YXp5ZXFVMW8rQUxobmVrV2RBellhbkdSQ1U5b3R1czB4NTU1SVVqYzhEOVB2?=
 =?utf-8?B?d3dhVTFWd0F0Q2hsbTlNV1VVZVZqMGJ6ZjU3VDZ0SitRZzl1VzZTb0tJZ3RS?=
 =?utf-8?B?QU95MXl3aWZOUnJBcmF4YSswY0JXUXRTQ1VYWVVrTDAzTWNZMzRMYnlYUkZC?=
 =?utf-8?B?RUxsM1R4R3VvNDY5Q0ZrQS9MemFoUXdZRHVEd1IxU1JrbXdHTXNFVzUxWWJQ?=
 =?utf-8?B?MFVsSElGQUNtNlA2WXpwK2RTMHF5aTJmWkttREtyeEZEbnkxUC84OTdPWlRR?=
 =?utf-8?B?cVdKYXlMRkJlMWxjaHhxSExLbFI0aDlwdHhNTmZMZ1pFZ2Z6dFpZVEd2VlB4?=
 =?utf-8?B?bzFHQkQzdFNxaEJCK2U0eWs4cGFJckRCeXR2WXdIWGl5L3p4S0hDQzZuaGNy?=
 =?utf-8?B?WUtQNzBQTjQvbEZCbHdUaEpwK1BKWmszMi8rRW1aNmZJOEc5RnY1VTBJRHk3?=
 =?utf-8?B?RDJBNm14aTJMRFY4YVM1djQwV2dPalVzb2hJRWlIcktaeXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SjVHQ20vWktTOG9YZzFUc1I2K1F3UlFDSDVZRFRzbmJDYzlqWjkyaXB3MkpG?=
 =?utf-8?B?NXpTQnRDRG8vNjh6dS9Ja1hXVHVYczE4aFp2UVJvWHU3a2paSEJTYlEwYWJD?=
 =?utf-8?B?SFlrZXFzUUIwbk1GbXdkZHV4anVXOWJsRzFHRGQrekErU2l5VDlQOHpHaUw0?=
 =?utf-8?B?akJqNFNydDZyWThjaTlmbk13cThyWTQrUlJMWGc5VUNDVlRLVUwrSjJ3d0hC?=
 =?utf-8?B?dFNVTUtVWFN0VDJKdDI3VDE4OVdSajM3UFhnaTlKcVdseXVDWnltQ2c3dWpH?=
 =?utf-8?B?akhBS2RrMWNXSzdnQ3I0MTVPeTZlWjJVbGZ1YU5TRUR5UnZXcFMvZ1hOd1lL?=
 =?utf-8?B?VXgrUjZZV0RaSDlPSWp3UCtXRC9MVzVYU0pzNTYxSXIwcGR2Y0RtV1BNczhu?=
 =?utf-8?B?QmZsMFNSc2VIRTk1Um1wRmgwQjhTRnczT3E0M05sbGJaTmVxcDQ3VW1HTUds?=
 =?utf-8?B?bnlBUG9WeERURXI0dnRIcFpXaVg3NEVDWXFqajVXWXovQzA1RzJSOUpQY0Jt?=
 =?utf-8?B?Mm1xeWhiaGtnUDZUdW55cHJzQkV3dlVweXIzcTJrUWxGK0c1MHBGejhVbTVB?=
 =?utf-8?B?SThzdnhEQm4rV3EzSWhwODI3V3p1T0JBb2x1azJJTXJ3N3NNMDNUZ3p6dUUv?=
 =?utf-8?B?bmVIbXVSUG9WWHNrcjdzTFZLL0Z5SWVocjQyQTR3ZEhuMVpZamxpNkc2YUUv?=
 =?utf-8?B?aDNRTklJazhsSnVidVh1ZEVlbWQwWXNGcU9GSDJrSnZWV1BzQ0dWRWQwWkNW?=
 =?utf-8?B?SCtVakY1Y2Q0NC9wOGs0czQxVWc4RzdLNnI0TGR6WEFpbkxOdGpqajU1ZEg2?=
 =?utf-8?B?Nzlza1ZkVVp3Z0labFl6eERMMTdHYmxiYllualNlNjNaN2RVK0ZNYWZZWVla?=
 =?utf-8?B?M0s1T3haZWs2OG5wS0ozdzF6NmVNbktrWkNWZ3YrdmRldlY3akVyZ1RRMDY5?=
 =?utf-8?B?dytydTVlTE9YSTd6Vmg5THF1bnRISGEvMWVmdHVsclRiVzFxclRLN3VDR1k5?=
 =?utf-8?B?TnY2Smd6RWFPeDFXRUtFaHhTRXdzQkxVek11M3N0SDdrNkowdnZCaDEzeXhy?=
 =?utf-8?B?MGh1cFdydTdRUUY3WGhucFNwT0pxc3pNcWRYZnFUY1lFbHlORE1mYjYzVVdo?=
 =?utf-8?B?ejVjUnJVN01uaVYxbHFDbldDY253Rk1lbVdKMnpOV3l5TDkwV0tLR1k4U2pa?=
 =?utf-8?B?UlRLajJ2dDVpZE5qemZQc0F0MGVXZkdJMVQrb0YySzFrSWNZdDBOT0tkdFpU?=
 =?utf-8?B?QXY1N3paaHdoYncyYVMzWXI0bVczQmd2blFUL0d6NzdEa3IwZytzZC9WaTJx?=
 =?utf-8?B?aE9oc2pzaFFaMVBMaE5heTY5MnMrQWNHWUIvbW10ZWZYSGJkSklxcmlmZTZE?=
 =?utf-8?B?NDcyYWlyNUtFWHBwTGF6TkxkSzMxQXgzMWEyeTVLeVplUExDL3dOTjlOMVBw?=
 =?utf-8?B?a1MwME8vMUNuYVhHUVpiRVVhVHNXNDhtQldtTGtNQ3JZYVpZOEdBazE2N0pn?=
 =?utf-8?B?dUd3aDFGWFNOVDNiQ1d6SCtwdjFLT1NhN2FTb21Tc0Z3eTJ0TWhBZmp1M2R4?=
 =?utf-8?B?b0trVGg5ZGxNYzlCb3FoTlVJU1Q0OXBXRlZTUkVFeCtvaUsvNTdSdEF3UDdD?=
 =?utf-8?B?SWtwLzMxcXc1RlF3bVdCM2ZYSkZKelJYazhkdG5oUmNtUStFcWdFTFdGZk53?=
 =?utf-8?B?YXdWRHM1N2hIMVU2cFB6OCtFNjNlNHdqRkg2bUtyS1RMRGNXeCs3YU03VFB0?=
 =?utf-8?B?cmwrNGNIVFZ3cjZKL2hvZUdCMkN4L3hWZVluZ1BBeDdsOVByWG5XWUhJOElR?=
 =?utf-8?B?WUpaWlYrbTkyV1ZnellsdmEzY3pzdHNCeDNJNXZlR2VnQ09vZ3lXSzV5cEFO?=
 =?utf-8?B?ZHV1TXpESFJ4SzhleTR2VGQwWVZOc1FNWkVRTWpuWnJ1eTUwVndmV1lkVytl?=
 =?utf-8?B?ZjVSRDFyOWpPZnhzaEFBSHdBUlhicWp0L3YvYVNmM0sxUzNaTHg0d0dBMGhY?=
 =?utf-8?B?OFU5ZVFQWWZyempGQmhONGFtaEFaQ1BVdEErbTFFZXJvemlNQVVHL2ttR2lw?=
 =?utf-8?B?ZFJXck9Bb3hXbm1lWTdDV1ViV0JTRVZaT2h6Z3pLdW5RUUd6d0RuM2tBMkkz?=
 =?utf-8?Q?iN+U=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29329a84-124e-4499-325c-08dd7800edf1
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2025 07:25:54.3565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbOl+C7KU9IlmuIQ6wiyHIpPB7GeG+Goz65u5Vo5eYWvQv6xYBCn/qPqjqwxYTTcUQRXm6Ms2jJemdDPonPDHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD83941681
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmVkZHkgR3VkZGF0aSwg
U2FudGhvc2ggPHNhbnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiBTZW50OiBGcmlk
YXksIEFwcmlsIDQsIDIwMjUgMjo0MyBQTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRl
bC5jb20+OyBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogU2hhcm1hLCBTd2F0
aTIgPHN3YXRpMi5zaGFybWFAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIGktZy10
XSB0ZXN0cy9rbXNfZGlzcGxheV9tb2RlczogRml0IG1vZGVzIHdpdGhpbiBNU1QNCj4gYmFuZHdp
ZHRoIGNvbnN0cmFpbnRzDQo+IA0KPiBIaSBKZWV2YW4sDQo+IA0KPiANCj4gT24gMDMtMDQtMjAy
NSAxNjoyMywgSmVldmFuIEIgd3JvdGU6DQo+ID4gSW5zdGVhZCBvZiBjaGVja2luZyBvbmx5IHRo
ZSBjdXJyZW50IG1vZGVzLCBmaW5kIGEgY29tYmluYXRpb24gb2YNCj4gPiBtb2RlcyBpbiB0aGUg
TVNUIHRvcG9sb2d5IHRoYXQgY2FuIGJlIGFjY29tbW9kYXRlZCB3aXRoaW4gdGhlDQo+ID4gYXZh
aWxhYmxlIGxpbmsgYmFuZHdpZHRoLg0KPiA+DQo+ID4gdjI6IG1vdmUgZml0X21vZGVzX2luX2J3
IHRvIGxpYi9pZ3Rfa21zDQo+ID4gdjM6IHVwZGF0ZSB0YWcgZnJvbSBmaXhlcyB0byBjbG9zZXMN
Cj4gPg0KPiA+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9r
ZXJuZWwvLS9pc3N1ZXMvMTU0Mg0KPiA+IFNpZ25lZC1vZmYtYnk6IEplZXZhbiBCIDxqZWV2YW4u
YkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gICBsaWIvaWd0X2ttcy5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysNCj4gPiAgIGxpYi9pZ3Rf
a21zLmggICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsNCj4gPiAgIHRlc3RzL2ludGVs
L2ttc19kcF9saW5rX3RyYWluaW5nLmMgICAgICB8IDI0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAgdGVzdHMvaW50ZWwva21zX2RwX2xpbmt0cmFpbl9mYWxsYmFjay5jIHwgMTggKy0t
LS0tLS0tLS0tLS0tLS0tDQo+ID4gICB0ZXN0cy9rbXNfZGlzcGxheV9tb2Rlcy5jICAgICAgICAg
ICAgICAgfCAgNCArKysrDQo+ID4gICA1IGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyks
IDQwIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9s
aWIvaWd0X2ttcy5jIGluZGV4IDk5Yzg3MDdjNy4uZjgyNzRmNDlhDQo+ID4gMTAwNjQ0DQo+ID4g
LS0tIGEvbGliL2lndF9rbXMuYw0KPiA+ICsrKyBiL2xpYi9pZ3Rfa21zLmMNCj4gPiBAQCAtNTA0
Niw2ICs1MDQ2LDMwIEBAIGJvb2wNCj4gaWd0X292ZXJyaWRlX2FsbF9hY3RpdmVfb3V0cHV0X21v
ZGVzX3RvX2ZpdF9idyhpZ3RfZGlzcGxheV90ICpkaXNwbGF5KQ0KPiA+ICAgCXJldHVybiBfX292
ZXJyaWRlX2FsbF9hY3RpdmVfb3V0cHV0X21vZGVzX3RvX2ZpdF9idyhkaXNwbGF5LCBvdXRwdXRz
LA0KPiBuX291dHB1dHMsIDApOw0KPiA+ICAgfQ0KPiA+DQo+ID4gKy8qDQo+ID4gKyAqIGZpdF9t
b2Rlc19pbl9idyA6DQo+ID4gKyAqIEBkaXNwbGF5OiBhIHBvaW50ZXIgdG8gYW4gI2lndF9kaXNw
bGF5X3Qgc3RydWN0dXJlDQo+ID4gKyAqDQo+ID4gKyAqIFRyaWVzIGF0b21pYyBURVNUX09OTFkg
Y29tbWl0OyBpZiBpdCBmYWlscywgb3ZlcnJpZGVzDQo+ID4gKyAqIG91dHB1dCBtb2RlcyB0byBm
aXQgYmFuZHdpZHRoLg0KPiA+ICsgKi8NCj4gPiArYm9vbCBmaXRfbW9kZXNfaW5fYncoaWd0X2Rp
c3BsYXlfdCAqZGlzcGxheSkgew0KPiA+ICsJYm9vbCBmb3VuZDsNCj4gPiArCWludCByZXQ7DQo+
ID4gKw0KPiA+ICsJcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoZGlzcGxheSwN
Cj4gPiArCQkJCQkgICAgRFJNX01PREVfQVRPTUlDX1RFU1RfT05MWSB8DQo+ID4gKw0KPiBEUk1f
TU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCwgTlVMTCk7DQo+ID4gKwlpZiAocmV0ICE9IDApIHsN
Cj4gPiArCQlmb3VuZCA9DQo+IGlndF9vdmVycmlkZV9hbGxfYWN0aXZlX291dHB1dF9tb2Rlc190
b19maXRfYncoZGlzcGxheSk7DQo+ID4gKwkJaWd0X3JlcXVpcmVfZihmb3VuZCwNCj4gPiArCQkJ
ICAgICAgIk5vIHZhbGlkIG1vZGUgY29tYm8gZm91bmQgZm9yIG1vZGVzZXRcbiIpOw0KPiA+ICsJ
fQ0KPiA+ICsNCj4gPiArCXJldHVybiB0cnVlOw0KPiA+ICt9DQo+ID4gKw0KPiA+ICAgLyoqDQo+
ID4gICAgKiBpZ3RfcGlwZV9yZWZyZXNoOg0KPiA+ICAgICogQGRpc3BsYXk6IGEgcG9pbnRlciB0
byBhbiAjaWd0X2Rpc3BsYXlfdCBzdHJ1Y3R1cmUgZGlmZiAtLWdpdA0KPiA+IGEvbGliL2lndF9r
bXMuaCBiL2xpYi9pZ3Rfa21zLmggaW5kZXggMDM4MWM4MmFkLi5mZTAxZWFmM2YgMTAwNjQ0DQo+
ID4gLS0tIGEvbGliL2lndF9rbXMuaA0KPiA+ICsrKyBiL2xpYi9pZ3Rfa21zLmgNCj4gPiBAQCAt
MTIyNiw2ICsxMjI2LDcgQEAgdm9pZCBpZ3RfcmVxdWlyZV9waXBlKGlndF9kaXNwbGF5X3QgKmRp
c3BsYXksDQo+ID4gICB2b2lkIGlndF9kdW1wX2Nvbm5lY3RvcnNfZmQoaW50IGRybWZkKTsNCj4g
PiAgIHZvaWQgaWd0X2R1bXBfY3J0Y3NfZmQoaW50IGRybWZkKTsNCj4gPiAgIGJvb2wgaWd0X292
ZXJyaWRlX2FsbF9hY3RpdmVfb3V0cHV0X21vZGVzX3RvX2ZpdF9idyhpZ3RfZGlzcGxheV90DQo+
ID4gKmRpc3BsYXkpOw0KPiA+ICtib29sIGZpdF9tb2Rlc19pbl9idyhpZ3RfZGlzcGxheV90ICpk
aXNwbGF5KTsNCj4gPiAgIGJvb2wgaWd0X2dldF9pOTE1X2VkcF9sb2JmX3N0YXR1cyhpbnQgZHJt
ZmQsIGNoYXIgKmNvbm5lY3Rvcl9uYW1lKTsNCj4gPiAgIHVuc2lnbmVkIGludCBpZ3RfZ2V0X291
dHB1dF9tYXhfYnBjKGludCBkcm1mZCwgY2hhciAqY29ubmVjdG9yX25hbWUpOw0KPiA+ICAgdW5z
aWduZWQgaW50IGlndF9nZXRfcGlwZV9jdXJyZW50X2JwYyhpbnQgZHJtZmQsIGVudW0gcGlwZSBw
aXBlKTsNCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2RwX2xpbmtfdHJhaW5pbmcu
Yw0KPiA+IGIvdGVzdHMvaW50ZWwva21zX2RwX2xpbmtfdHJhaW5pbmcuYw0KPiA+IGluZGV4IDll
OWIxZTZkYi4uOWI2MjQ4YzZmIDEwMDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19kcF9s
aW5rX3RyYWluaW5nLmMNCj4gPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZHBfbGlua190cmFpbmlu
Zy5jDQo+ID4gQEAgLTE0MCwyOCArMTQwLDYgQEAgc3RhdGljIHZvaWQgc2V0dXBfcGxhbmVzX2Zi
cyhkYXRhX3QgKmRhdGEsDQo+IGlndF9vdXRwdXRfdCAqb3V0c1tdLA0KPiA+ICAgCX0NCj4gPiAg
IH0NCj4gPg0KPiA+IC0vKg0KPiA+IC0gKiBmaXRfbW9kZXNfaW5fYncgLSBUcmllcyBhdG9taWMg
VEVTVF9PTkxZIGNvbW1pdDsgaWYgaXQgZmFpbHMsDQo+ID4gb3ZlcnJpZGVzDQo+ID4gLSAqIG91
dHB1dCBtb2RlcyB0byBmaXQgYmFuZHdpZHRoLg0KPiA+IC0gKi8NCj4gPiAtc3RhdGljIGJvb2wg
Zml0X21vZGVzX2luX2J3KGRhdGFfdCAqZGF0YSkgLXsNCj4gPiAtCWludCByZXQ7DQo+ID4gLQ0K
PiA+IC0JcmV0ID0gaWd0X2Rpc3BsYXlfdHJ5X2NvbW1pdF9hdG9taWMoJmRhdGEtPmRpc3BsYXks
DQo+ID4gLQkJCQkJICAgIERSTV9NT0RFX0FUT01JQ19URVNUX09OTFkgfA0KPiA+IC0NCj4gRFJN
X01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQsDQo+ID4gLQkJCQkJICAgIE5VTEwpOw0KPiA+IC0J
aWYgKHJldCAhPSAwKSB7DQo+ID4gLQkJYm9vbCBmb3VuZDsNCj4gPiAtDQo+ID4gLQkJZm91bmQg
PQ0KPiBpZ3Rfb3ZlcnJpZGVfYWxsX2FjdGl2ZV9vdXRwdXRfbW9kZXNfdG9fZml0X2J3KCZkYXRh
LT5kaXNwbGF5KTsNCj4gPiAtCQlpZ3RfcmVxdWlyZV9mKGZvdW5kLCAiTm8gdmFsaWQgbW9kZSBj
b21ibyBmb3VuZCBmb3INCj4gbW9kZXNldFxuIik7DQo+ID4gLQl9DQo+ID4gLQ0KPiA+IC0JcmV0
dXJuIHRydWU7DQo+ID4gLX0NCj4gPiAtDQo+ID4gICBzdGF0aWMgdm9pZCBkb19tb2Rlc2V0KGRh
dGFfdCAqZGF0YSwgYm9vbCBtc3QpDQo+ID4gICB7DQo+ID4gICAJdWludDMyX3QgbWFzdGVyX3Bp
cGVzX21hc2sgPSAwOw0KPiA+IEBAIC0yMDQsNyArMTgyLDcgQEAgc3RhdGljIHZvaWQgZG9fbW9k
ZXNldChkYXRhX3QgKmRhdGEsIGJvb2wgbXN0KQ0KPiA+ICAgCQkJCQkJICAiVW5hYmxlIHRvIGFz
c2lnbiBwaXBlcyBmb3INCj4gb3V0cHV0c1xuIik7DQo+ID4NCj4gPiAgIAlzZXR1cF9wbGFuZXNf
ZmJzKGRhdGEsIG91dHMsIG91dF9jb3VudCwgbW9kZXMsIGZicywgcGxhbmVzKTsNCj4gPiAtCWZp
dF9tb2Rlc19pbl9idyhkYXRhKTsNCj4gPiArCWZpdF9tb2Rlc19pbl9idygmZGF0YS0+ZGlzcGxh
eSk7DQo+ID4gICAJaWd0X2Rpc3BsYXlfY29tbWl0MigmZGF0YS0+ZGlzcGxheSwgQ09NTUlUX0FU
T01JQyk7DQo+ID4gICB9DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Rw
X2xpbmt0cmFpbl9mYWxsYmFjay5jDQo+ID4gYi90ZXN0cy9pbnRlbC9rbXNfZHBfbGlua3RyYWlu
X2ZhbGxiYWNrLmMNCj4gPiBpbmRleCA2YTg3MmVmZDIuLjY0ZjIxZWM2ZiAxMDA2NDQNCj4gPiAt
LS0gYS90ZXN0cy9pbnRlbC9rbXNfZHBfbGlua3RyYWluX2ZhbGxiYWNrLmMNCj4gPiArKysgYi90
ZXN0cy9pbnRlbC9rbXNfZHBfbGlua3RyYWluX2ZhbGxiYWNrLmMNCj4gPiBAQCAtMTUxLDIyICsx
NTEsNiBAQCBzdGF0aWMgdm9pZCBzZXRfY29ubmVjdG9yX2xpbmtfc3RhdHVzX2dvb2QoZGF0YV90
DQo+ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dHNbXQ0KPiA+DQo+IERSTV9NT0RFX0xJTktf
U1RBVFVTX0dPT0QpOw0KPiA+ICAgfQ0KPiA+DQo+ID4gLXN0YXRpYyBib29sIGZpdF9tb2Rlc19p
bl9idyhkYXRhX3QgKmRhdGEpIC17DQo+ID4gLQlib29sIGZvdW5kOw0KPiA+IC0JaW50IHJldDsN
Cj4gPiAtDQo+ID4gLQlyZXQgPSBpZ3RfZGlzcGxheV90cnlfY29tbWl0X2F0b21pYygmZGF0YS0+
ZGlzcGxheSwNCj4gPiAtCQkJCQkgICAgRFJNX01PREVfQVRPTUlDX1RFU1RfT05MWSB8DQo+ID4g
LQ0KPiBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCwgTlVMTCk7DQo+ID4gLQlpZiAocmV0
ICE9IDApIHsNCj4gPiAtCQlmb3VuZCA9DQo+IGlndF9vdmVycmlkZV9hbGxfYWN0aXZlX291dHB1
dF9tb2Rlc190b19maXRfYncoJmRhdGEtPmRpc3BsYXkpOw0KPiA+IC0JCWlndF9yZXF1aXJlX2Yo
Zm91bmQsDQo+ID4gLQkJCSAgICAgICJObyB2YWxpZCBtb2RlIGNvbWJvIGZvdW5kIGZvciBtb2Rl
c2V0XG4iKTsNCj4gPiAtCX0NCj4gPiAtCXJldHVybiB0cnVlOw0KPiA+IC19DQo+ID4gLQ0KPiA+
ICAgc3RhdGljIGJvb2wgdmFsaWRhdGVfbW9kZXNldF9mb3Jfb3V0cHV0cyhkYXRhX3QgKmRhdGEs
DQo+ID4gICAJCQkJCWlndF9vdXRwdXRfdCAqb3V0cHV0c1tdLA0KPiA+ICAgCQkJCQlpbnQgKm91
dHB1dF9jb3VudCwNCj4gPiBAQCAtMTc2LDcgKzE2MCw3IEBAIHN0YXRpYyBib29sIHZhbGlkYXRl
X21vZGVzZXRfZm9yX291dHB1dHMoZGF0YV90DQo+ICpkYXRhLA0KPiA+ICAgew0KPiA+ICAgCWln
dF9yZXF1aXJlX2YoKm91dHB1dF9jb3VudCA+IDAsICJSZXF1aXJlIGF0IGxlYXN0IDEgb3V0cHV0
XG4iKTsNCj4gPiAgIAlzZXR1cF9waXBlX29uX291dHB1dHMoZGF0YSwgb3V0cHV0cywgb3V0cHV0
X2NvdW50KTsNCj4gPiAtCWlndF9hc3NlcnRfZihmaXRfbW9kZXNfaW5fYncoZGF0YSksICJVbmFi
bGUgdG8gZml0IG1vZGVzIGluIGJ3XG4iKTsNCj4gPiArCWlndF9hc3NlcnRfZihmaXRfbW9kZXNf
aW5fYncoJmRhdGEtPmRpc3BsYXkpLCAiVW5hYmxlIHRvIGZpdCBtb2Rlcw0KPiA+ICtpbiBid1xu
Iik7DQo+IFRoZSBmdW5jdGlvbiBmaXRfbW9kZXNfaW5fYncgY2F1c2VzIHRoZSB0ZXN0IHRvIHNr
aXAgaWYgdmFsaWQgbW9kZXMgaXMgbm90IGZvdW5kLA0KPiBidXQgaGVyZSB3ZSBhcmUgaW50ZW5k
aW5nIHRvIGFzc2VydCB0aGUgdGVzdC4gQXJlIGJvdGggY29udHJhZGljdGluZz8NCkl0cyBzaG91
bGQgZmFpbCBpZiB0aGVyZSBhcmUgbm8gbW9kZXMgdGhhdCBjYW4gYmUgc3VwcG9ydGVkIGluIHRo
ZSBidywgSWYgeW91IHNraXAgaXQgY2FuIG92ZXJsb29rIHNvbWUgaXNzdWVzLiANCg0KVGhhbmtz
IA0KSmVldmFuIEINCj4gDQo+ID4gICAJc2V0dXBfbW9kZXNldF9vbl9vdXRwdXRzKGRhdGEsIG91
dHB1dHMsDQo+ID4gICAJCQkJIG91dHB1dF9jb3VudCwNCj4gPiAgIAkJCQkgbW9kZSwgZmIsIHBy
aW1hcnkpOw0KPiA+IGRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZGlzcGxheV9tb2Rlcy5jIGIvdGVz
dHMva21zX2Rpc3BsYXlfbW9kZXMuYw0KPiA+IGluZGV4IDU4ODgyMDE3MC4uZjJiYmZhZmUyIDEw
MDY0NA0KPiA+IC0tLSBhL3Rlc3RzL2ttc19kaXNwbGF5X21vZGVzLmMNCj4gPiArKysgYi90ZXN0
cy9rbXNfZGlzcGxheV9tb2Rlcy5jDQo+ID4gQEAgLTkzLDYgKzkzLDggQEAgc3RhdGljIHZvaWQg
cnVuX2V4dGVuZGVkbW9kZV9iYXNpYyhkYXRhX3QgKmRhdGEsDQo+ID4gICAJbW9kZVswXSA9IGln
dF9vdXRwdXRfZ2V0X21vZGUob3V0cHV0MSk7DQo+ID4gICAJbW9kZVsxXSA9IGlndF9vdXRwdXRf
Z2V0X21vZGUob3V0cHV0Mik7DQo+ID4NCj4gPiArCWlndF9hc3NlcnQoZml0X21vZGVzX2luX2J3
KGRpc3BsYXkpKTsNCj4gPiArDQo+ID4gICAJcGlwZV9jcmNbMF0gPSBpZ3RfcGlwZV9jcmNfbmV3
KGRhdGEtPmRybV9mZCwgcGlwZTEsDQo+IElHVF9QSVBFX0NSQ19TT1VSQ0VfQVVUTyk7DQo+ID4g
ICAJcGlwZV9jcmNbMV0gPSBpZ3RfcGlwZV9jcmNfbmV3KGRhdGEtPmRybV9mZCwgcGlwZTIsDQo+
ID4gSUdUX1BJUEVfQ1JDX1NPVVJDRV9BVVRPKTsNCj4gPg0KPiA+IEBAIC0xMzgsNiArMTQwLDcg
QEAgc3RhdGljIHZvaWQgcnVuX2V4dGVuZGVkbW9kZV9iYXNpYyhkYXRhX3QgKmRhdGEsDQo+ID4g
ICAJaWd0X2ZiX3NldF9zaXplKCZmYiwgcGxhbmVbMV0sIG1vZGVbMV0tPmhkaXNwbGF5LCBtb2Rl
WzFdLT52ZGlzcGxheSk7DQo+ID4gICAJaWd0X3BsYW5lX3NldF9zaXplKHBsYW5lWzFdLCBtb2Rl
WzFdLT5oZGlzcGxheSwgbW9kZVsxXS0+dmRpc3BsYXkpOw0KPiA+DQo+ID4gKwlpZ3RfYXNzZXJ0
KGZpdF9tb2Rlc19pbl9idyhkaXNwbGF5KSk7DQo+ID4gICAJaWd0X2Rpc3BsYXlfY29tbWl0Mihk
aXNwbGF5LCBDT01NSVRfQVRPTUlDKTsNCj4gPg0KPiA+ICAgCWlndF9waXBlX2NyY19jb2xsZWN0
X2NyYyhwaXBlX2NyY1swXSwgJmNyY1swXSk7IEBAIC0xNTgsNiArMTYxLDcgQEANCj4gPiBzdGF0
aWMgdm9pZCBydW5fZXh0ZW5kZWRtb2RlX2Jhc2ljKGRhdGFfdCAqZGF0YSwNCj4gPiAgIAkJCSAg
RFJNX1BMQU5FX1RZUEVfUFJJTUFSWSksIE5VTEwpOw0KPiA+ICAgCWlndF9wbGFuZV9zZXRfZmIo
aWd0X3BpcGVfZ2V0X3BsYW5lX3R5cGUoJmRpc3BsYXktPnBpcGVzW3BpcGUyXSwNCj4gPiAgIAkJ
CSAgRFJNX1BMQU5FX1RZUEVfUFJJTUFSWSksIE5VTEwpOw0KPiA+ICsJaWd0X2Fzc2VydChmaXRf
bW9kZXNfaW5fYncoZGlzcGxheSkpOw0KPiA+ICAgCWlndF9kaXNwbGF5X2NvbW1pdDIoZGlzcGxh
eSwgQ09NTUlUX0FUT01JQyk7DQo+ID4NCj4gPiAgIAkvKkNvbXBhcmUgQ1JDKi8NCg0K
