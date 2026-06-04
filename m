Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57E4CD6E4A
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jun 2026 08:30:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58D13113D9A;
	Thu,  4 Jun 2026 08:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nr8Ed7TV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EC3113D99
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jun 2026 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780561791; x=1812097791;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=QL9+XudbptO5fZ1yS2ypAtn/AXaZrpC71V8bKEWcDJw=;
 b=nr8Ed7TVWZq/ttp7KkySgeCufRMH2u5uEBQA8MxhTA2m6xtXW/npdQVp
 qOVSOBoZrI/38qeuYQ5Iac2Og561FRXA12OKzkGA0wuMKDp/vELhlkMT/
 EOfKGKjBOPo84wVyrlivu85wEyukwnm4KDCA0YuU3o75aEPwP6yYwIWYq
 KkiQpZcMb5BSqTQZpkNCeszLsBwkm4QqZDwyeTWjp6BDVjbc8ZaNGVs/m
 MhaAK7Rs6qEs76XQvZGCuxgKT/kjmoy+d87Y84kVCeSAL7mbboAKfktBY
 i+n/nqSbVW2EA7QSn291hbjhNyxiIOZcmENBozBBzgSE84urog3UVJeZK A==;
X-CSE-ConnectionGUID: bE3CGOkFTfSupGnmFvOlbA==
X-CSE-MsgGUID: z37zJJFEQEWr8vT8/JzfyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85006712"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="85006712"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:29:48 -0700
X-CSE-ConnectionGUID: F1u2BFfCTXKJOtbFpfSaXw==
X-CSE-MsgGUID: QhEE4wR+Qsu/FXTmV/tqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="268148653"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 01:29:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:29:47 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 01:29:47 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 01:29:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvMyEAdgpQxbvu3VHePwHd0jdV1Kw5FkpZB5tFAEYA++XTOvUAt1Ik8WYWQOh8BzpCP24ePOr3Vxwm/YAU4VJ6vvuMxh1IXRNdQMJrC6+ad8+ZMAHFKqCsC/HFt4zN6GYdzir2AjStvro7RxNEUaCTji1SLTFErwA+vLFgshvL9qlgbWZWWw9MuF1TsRNupyUYltPcjpOXB34uIAzMK/S8BUN4V88RA7tGuFhTiu8X02iN7mPsxMYBJRYegMaPphyfcPcwKRHLm/bCOeFDG6l3ZrzpgYNAYM6MK5+4baq2HxVijEPxjFihVnas+gSu0pkSUhet6q3koG+1NwElM/Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QL9+XudbptO5fZ1yS2ypAtn/AXaZrpC71V8bKEWcDJw=;
 b=uPHhvFC1odvUWWkTlrCx/hhPhdCYS8/2doYRrVKfscipbQUfBeI+ROsaF3+wA3KEfDELfy7MzfnsbjQfVs/aBb90QErDS4uowMyfcjBYSFf3fYBlULXdekgMDSPDProh7hedBm6+rC7v+eeWLQdTqzk/oQcdAm8PFfaP4FShGLGdGBmnVP82jEMiZm/IQaof1fwmE8UNesUo/4sjK3w9yv14O128VwtDd64+5BXei/ph+PjrnIg/PejJihkc4sdYRth3idKLir4azlkvpyyse0Ilxuh0Vp+kB+RpeF0rYFiemZj70ETjmSizjuXaNktrfCIc2KBWmmdKxeV3VoaZzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 DS7PR11MB7833.namprd11.prod.outlook.com (2603:10b6:8:ea::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.12; Thu, 4 Jun 2026 08:29:40 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::9d51:565a:7572:5318%5]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 08:29:40 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Topic: [PATCH v2 2/2] tests/intel/kms_pm_dc: Add DC5 PSR suspend/resume
 validation test
Thread-Index: AQHci8zFhLcK0fgjl0yCVs+SaZySBLWpZ+JAgAlMYACAfCv2AA==
Date: Thu, 4 Jun 2026 08:29:40 +0000
Message-ID: <DM4PR11MB6312589E4E82929CCD1A207290102@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20260122182219.9635-1-mohammed.thasleem@intel.com>
 <20260122182219.9635-3-mohammed.thasleem@intel.com>
 <DM4PR11MB631276FB17A19D483C20ACCD9047A@DM4PR11MB6312.namprd11.prod.outlook.com>
 <d953d203-efa5-4435-9a29-c72a932bf306@intel.com>
In-Reply-To: <d953d203-efa5-4435-9a29-c72a932bf306@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|DS7PR11MB7833:EE_
x-ms-office365-filtering-correlation-id: 219f2b23-762b-4914-1db5-08dec2136c23
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|38070700021|6133799003|18002099003|22082099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info: JEUaI37hFM7DMDb/KmQraUIj45qiaT68bXhmEll/nkqKGXqTFmCGQqN3LrqOSnHPw6lRH+Uh4jwwbYt8kc6ZeGgWM6DqpOYYPEGAo9MONQ3MupsLVzX+cxJgctga0d+/PtJbu3era70Q+1quV7gkdza13jFLJ60ojYA/8YimGzhoREejSkst8ez/ovgH6HEjjq+xsga1deQJrWBlYuNymQyeXwIuQk24tPNmxkJlQkg3qXjwwAlSiYlFdhJLOWVipeiXPA3R71BO6SZTPzx3nV5PSz/+Qdxhf6PwO6hD1sm6DFTHUAiY1rbkaxhzif6LUYtaD63ZxmxD1S2ZuJX/e3wdtw1F2nWrYzevq0+GfEmGwLqcnQkzCtMjmkKY1aqxA/gy8t363csLICuje/NYdE3Lfw+1InoTzcWsXmVTfqCx0iZDnE1ayTKjsiOb3RvLNP6+UFFdlLUmvvIy7pXpX91Y+6TBXpQvFPUZ1qPr/oJhwoqpWppYmw5tiyrgISrFvFDAJH0BO+TJBlFCXDEmKgjdryyLNUwjx6/YrKD9D1o1GgAHYV+uuhmVvW91JmoAYJtdBEjbnKMDAwcLlfIrIPmuplDmSQvfNBIqAG2URVmwbqWKl4hAaJr0Kmawo1uWWIm8p/SodIanpL4mVk/vpOabaEBTkQ18+wG/4LMkUKaqy9JKEfl9X2CQwU15auz4MQ/E94pux93un4HHLuPudqleNmydzddkZUAVJlwW7nmPtuEvI3bbyHXM7+lTiM0p
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1RCWVZCN0dtUUZ5L3NVVk41aGI3Sjd6a2g4SUgzWUJGNVNtZWpoVFNjZFFi?=
 =?utf-8?B?b3BNM0MxR2Z1MkhkZTR4VGhXdUozcURBSGl6Z3FudWF0eURiRmk5cHBhVlpj?=
 =?utf-8?B?RDJRdk00UUpiSVVNZlMwSlMxT2lDeHJLK282OWpOMFp2cThuSGNzZjR6L1ph?=
 =?utf-8?B?bHdPekh2YVlPUUkrSWczVjNRb0VFNXVUSFI5eWJBcFpmb0FzeXAySG5NKzZF?=
 =?utf-8?B?K1RtNzZLbVRtSG5vbTRVUzBOUUlDWXF5bFJXS0dCYW1YNmNLRW1MOEluQkEr?=
 =?utf-8?B?SkV2Q2kydkdZcGpScDVpdHlwMlB0WitudnVjMUpVSVhOdTJJUm1Gd3Y5cnJa?=
 =?utf-8?B?MVU2RTRSajBOQnAyZnF3bXZQVDdFVTNBVFBpTW5TcnBnTGFveFFEb2R0ODAr?=
 =?utf-8?B?bVl3NVBQMTVqTEg2dW1WaThpa3BIcGFJdGZsbFdDc0hpMzNBckVFdFE0S2ph?=
 =?utf-8?B?Y3ozdHNtWnBHSWhrdVBMSEd6L0tFWmN5ZjhWby8zOHpGZnNnTFNyWDlhUDNC?=
 =?utf-8?B?QTZ3SS9GSndWWlY2dHZ4eVVTaWNHQWZUVXgzM040OVEyaXNhRWVXT25kWjJ3?=
 =?utf-8?B?bE9rZmFwZ0wyMGFTT0tnOC9qcENMWXJHTmQ5VHd5VzFVM0J0WUQ1Y1B5YjI0?=
 =?utf-8?B?SFA5eGNyeVdsSkVTUlhqcGhEZTNQZHNBSjgrMmVqMTR0bXBFMlE5Q3hZY09i?=
 =?utf-8?B?WFEwSWRsY0NqVVdlZjVBeGlGZjQvczJQcDZpWGJ4Qk1FWXBiVUgxWmpTbkY2?=
 =?utf-8?B?eWhFZ3JBa0JmUXZVbWl5c0MvUmYzT3VENXFmb0lIdHVnSm5tUm5kWm45ZlEy?=
 =?utf-8?B?SEdBY0JkTm0wb24ydDZYazhjbTVVclZjWmE2NTVtSGR4U240R3NicXZqSFI0?=
 =?utf-8?B?VlovcTJ4aUdOMEdOa05WOFEzUm5GVnBsdkFDSkdnR0ljaUxZejBRTnNSQ1FQ?=
 =?utf-8?B?c3ZFL3NicmtFOEVKczRBZHV4ZEcyenROT2RwdDl5R01TZGMzRlZES0J4T0gy?=
 =?utf-8?B?NjZPUm5ZWkVnSVEwcTJYWlM3SVBWd3F2QlMxblA5QVNWbGFGVWJJZVYyc1Jp?=
 =?utf-8?B?UDMyMHJJNSthUUJVVE9XUVhxcWdPQmszTWxGR09IZTlQWG92QTF1bm1OeUN5?=
 =?utf-8?B?M0lPYVNXeXB3SGoxYllsSWs1ZDJIZm4zY28rUlk0dkFud005WmorUmxmYkZh?=
 =?utf-8?B?UHhFbU53ZUVBdnhObTFYMEtObXpHQU1HM0lGRmJubEtjM0JzWFBHTk1nNjdU?=
 =?utf-8?B?cWdienNseWVwRTNXR091cEFnSERab0ZHc2JyM3ZFS3N4bW10Y0JSWi9ERVNS?=
 =?utf-8?B?dGxRR0xsNTNxclpwcDVUL25yNDdIZkg2L0ltWi9MbFh3Q0t3T0lVZGZ2Skxr?=
 =?utf-8?B?VmxwMVFLUG96aVZsVzZzaDB0aWRmcXk1Y1VMQzBWeDAvUWVibzVKdStNNVJN?=
 =?utf-8?B?enhCOTQ2bjl0dU50YlhUVG1yb1lrUWJ2c2Vhd2c4cXJuTlpFQ0syb0dwdGdi?=
 =?utf-8?B?aWc0Q2J0UE5EWnVJS0ZGWDZvS3R5Y0RtdjBjUFp6MVJIUkV5bXltbmFpa3ZX?=
 =?utf-8?B?VjBTcGRLbXdxV1VYWDJlaUVJVkhVWGlZcVg0TEY4T2F0S3NSbHJUOXdmUDBU?=
 =?utf-8?B?VElQVkJCaUFOdy9nbkZMaDlyU3ZyTjR4NU90cU82K0FWOFJMSnBvVjRPSXZ0?=
 =?utf-8?B?dWdxZ2Q0bWtvbGhYM3JHT1A2dlpVNmEwbmVHWEhLMnhvcU9pSXlKT1NvbFhV?=
 =?utf-8?B?cm9jbGs2VjduL2lmU1RpS0FlVzErMHQxQ0pyTWNQWDdmcEdDYk80TGE0MGdR?=
 =?utf-8?B?UGtjWFY0a2pNT3o2Q1hjWjV6N3hEQ0hCSFVPV0RyUnV1MWJQejVPcGpRRnFI?=
 =?utf-8?B?cGJXSkF0TktuUTVmbm1IWVVhWUllc25BNTcwYWU3YnBzcitXS0xoWklQdXlX?=
 =?utf-8?B?anYvbGtTN3hraUZWSy9jejMwUkllakRiQlhCRkkyVXNYdnZ2SlJyRzZHa1NT?=
 =?utf-8?B?TW92Z2tld2I2OVljL2VDSFdkdVd1REpvdHRUVWhkSyttWGtUaXQ4RmxaNFVp?=
 =?utf-8?B?SHB3cE5keVZzT3pnNFdMZ0IwV0x2bmoyV0xsSlhQK3V6Ynh2WDlHWVdjRllQ?=
 =?utf-8?B?bzdacVFwZEp0UGdRRVJyWVRPd3dqWDdUMldubXRtNUVhbDFvS2MzSFZVSjFR?=
 =?utf-8?B?dmxtVWFhY0RRYXFkUWEzY3VlVitlQWd3cWJGK3RXTDZ3UjhlWmdFbllGWlVW?=
 =?utf-8?B?S2NrM1JsSldwNlVVV0JYUk0yODNHU0V6T1h0M0xEdDB1Wm5qcExjTnZNcHBo?=
 =?utf-8?Q?b4FtpBE3uCPOsTriOT?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: ecEn30CXh94CVFin0IH6wkW+cuGHHENkJ9Ub8sYtYeiUr9egYlQSZ4D20gllyrXqUZBF121ZcJzNplMgrCQTr+ZATuZd6X0gcn22rwx8iNEhy6pCtlBEYASztedq3mf4Lr8OHD0r1+hqVTUw8ahNR27+hXlSWHt39FalXp1bXxyibaGcnffSyywUyoVxpzsTlIh29vW6uG5IzuknqbR45LNrdSzcl0ziB3a+KP8uK+FKyzzWw8UjlChIp6gviwO4HsyJGVX5lR5K8RNcVVg+2ot21YWJUDRSAy3meW9rYToMCVFFdWb5iMSndH6StRzsG83zfAw8l5LczERG6tJ1mg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 219f2b23-762b-4914-1db5-08dec2136c23
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 08:29:40.6327 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EVXnzVUZpBPy0joNWyCDXsLNGUhU7rgG+UT5lEMwjDeSsOYUjo0Nlk2wH+ABufRhYDFM9/qbjrnIKwkhJaJOzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7833
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaGFzbGVlbSwgTW9oYW1tZWQg
PG1vaGFtbWVkLnRoYXNsZWVtQGludGVsLmNvbT4NCj4gU2VudDogVHVlc2RheSwgTWFyY2ggMTcs
IDIwMjYgMTo0MyBQTQ0KPiBUbzogQiwgSmVldmFuIDxqZWV2YW4uYkBpbnRlbC5jb20+OyBpZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvMl0g
dGVzdHMvaW50ZWwva21zX3BtX2RjOiBBZGQgREM1IFBTUg0KPiBzdXNwZW5kL3Jlc3VtZSB2YWxp
ZGF0aW9uIHRlc3QNCj4gDQo+IEhpIEplZXZhbiwNCj4gDQo+IE9uIDExLTAzLTIwMjYgMDM6NDcg
cG0sIEIsIEplZXZhbiB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4g
Pj4gRnJvbTogaWd0LWRldiA8aWd0LWRldi1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4g
T24gQmVoYWxmIE9mDQo+ID4+IE1vaGFtbWVkIFRoYXNsZWVtDQo+ID4+IFNlbnQ6IFRodXJzZGF5
LCBKYW51YXJ5IDIyLCAyMDI2IDExOjUyIFBNDQo+ID4+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZw0KPiA+PiBDYzogVGhhc2xlZW0sIE1vaGFtbWVkIDxtb2hhbW1lZC50aGFzbGVl
bUBpbnRlbC5jb20+DQo+ID4+IFN1YmplY3Q6IFtQQVRDSCB2MiAyLzJdIHRlc3RzL2ludGVsL2tt
c19wbV9kYzogQWRkIERDNSBQU1INCj4gPj4gc3VzcGVuZC9yZXN1bWUgdmFsaWRhdGlvbiB0ZXN0
DQo+ID4+DQo+ID4+IFRoaXMgdGVzdCB2YWxpZGF0ZXMgZGlzcGxheSBlbmdpbmUgZW50cnkgdG8g
REM1IHN0YXRlIHdoaWxlIFBTUiBpcw0KPiA+PiBhY3RpdmUsIHBlcmZvcm1zIHN1c3BlbmQvcmVz
dW1lIGN5Y2xlLCBhbmQgdmVyaWZpZXMgREM1IGVudHJ5IGlzIHJlc3RvcmVkDQo+IGFmdGVyIHJl
c3VtZS4NCj4gPj4NCj4gPj4gU2lnbmVkLW9mZi1ieTogTW9oYW1tZWQgVGhhc2xlZW0gPG1vaGFt
bWVkLnRoYXNsZWVtQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+ICAgdGVzdHMvaW50ZWwva21z
X3BtX2RjLmMgfCAyMSArKysrKysrKysrKysrKysrKysrKysNCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMjEgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwv
a21zX3BtX2RjLmMgYi90ZXN0cy9pbnRlbC9rbXNfcG1fZGMuYyBpbmRleA0KPiA+PiBmZGUxNmVi
ZjcuLjhjZGJmYWQ5ZiAxMDA2NDQNCj4gPj4gLS0tIGEvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMN
Cj4gPj4gKysrIGIvdGVzdHMvaW50ZWwva21zX3BtX2RjLmMNCj4gPj4gQEAgLTgwLDYgKzgwLDEw
IEBADQo+ID4+ICAgICoNCj4gPj4gICAgKiBTVUJURVNUOiBkYzUtZHBtcy1zdXNwZW5kLXJlc3Vt
ZQ0KPiA+PiAgICAqIERlc2NyaXB0aW9uOiBUaGlzIHRlc3QgdmFsaWRhdGUgREM1IHN0YXRlIGVu
dHJ5IGJlZm9yZSBhbmQgYWZ0ZXINCj4gPj4gc3VzcGVuZC9yZXN1bWUgY3ljbGUgdXNpbmcgRFBN
Uw0KPiA+PiArICoNCj4gPj4gKyAqIFNVQlRFU1Q6IGRjNS1wc3Itc3VzcGVuZC1yZXN1bWUNCj4g
Pj4gKyAqIERlc2NyaXB0aW9uOiBUaGlzIHRlc3QgdmFsaWRhdGVzIGRpc3BsYXkgZW5naW5lIGVu
dHJ5IHRvIERDNQ0KPiA+PiArIHN0YXRlIHdoaWxlIFBTUiBpcw0KPiA+PiBhY3RpdmUNCj4gPj4g
KyAqICAgICAgICAgICAgICAgYmVmb3JlIGFuZCBhZnRlciByZXNwZW5kL3Jlc3VtZSBjeWNsZQ0K
U3BlbGwgY2hlY2sgc3VzcGVuZC9yZXN1bWUuDQo+ID4+ICAgICovDQo+ID4+DQo+ID4+ICAgLyog
REMgU3RhdGUgRmxhZ3MgKi8NCj4gPj4gQEAgLTczMiw2ICs3MzYsMTMgQEAgc3RhdGljIHZvaWQN
Cj4gdGVzdF9kYzVfZHBtc19zdXNwZW5kX3Jlc3VtZShkYXRhX3QNCj4gPj4gKmRhdGEsIGludCBk
Y19mbGFnKQ0KPiA+Pg0KPiA+PiAgIH0NCj4gPj4NCj4gPj4gK3N0YXRpYyB2b2lkIHRlc3RfZGM1
X3Bzcl9zdXNwZW5kX3Jlc3VtZShkYXRhX3QgKmRhdGEsIGludCBkY19mbGFnKSB7DQo+ID4+ICsJ
dGVzdF9kY19zdGF0ZV9wc3IoZGF0YSwgZGNfZmxhZyk7DQo+ID4+ICsJaWd0X3N5c3RlbV9zdXNw
ZW5kX2F1dG9yZXN1bWUoU1VTUEVORF9TVEFURV9NRU0sDQo+ID4+IFNVU1BFTkRfVEVTVF9OT05F
KTsNCj4gPj4gKwl0ZXN0X2RjX3N0YXRlX3BzcihkYXRhLCBkY19mbGFnKTsNCj4gPj4gK30NCj4g
Pj4gKw0KPiA+PiAgIHN0YXRpYyB2b2lkIGttc19wb2xsX3N0YXRlX3Jlc3RvcmUoaW50IHNpZykg
IHsNCj4gPj4gICAJaW50IHN5c2ZzX2ZkOw0KPiA+PiBAQCAtODU3LDYgKzg2OCwxNiBAQCBpbnQg
aWd0X21haW4oKQ0KPiA+PiAgIAlpZ3Rfc3VidGVzdCgiZGM1LWRwbXMtc3VzcGVuZC1yZXN1bWUi
KQ0KPiA+PiAgIAkJdGVzdF9kYzVfZHBtc19zdXNwZW5kX3Jlc3VtZSgmZGF0YSwgQ0hFQ0tfREM1
KTsNCj4gPj4NCj4gPj4gKwlpZ3RfZGVzY3JpYmUoIlRoaXMgdGVzdCB2YWxpZGF0ZXMgZGlzcGxh
eSBlbmdpbmUgZW50cnkgdG8gREM1IHN0YXRlICINCj4gPj4gKwkJICAgICAid2hpbGUgUFNSIGlz
IGFjdGl2ZSBiZWZvcmUgYW5kIGFmdGVyIHN1c3BlbmQvcmVzdW1lDQo+IGN5Y2xlIik7DQo+ID4+
ICsJaWd0X3N1YnRlc3QoImRjNS1wc3Itc3VzcGVuZC1yZXN1bWUiKSB7DQo+ID4+ICsJCWlndF9y
ZXF1aXJlKHBzcl9zaW5rX3N1cHBvcnQoZGF0YS5kcm1fZmQsIGRhdGEuZGVidWdmc19mZCwNCj4g
Pj4gKwkJCQkJICAgICBQU1JfTU9ERV8xLCBOVUxMKSk7DQo+ID4+ICsJCWRhdGEub3BfcHNyX21v
ZGUgPSBQU1JfTU9ERV8xOw0KPiA+PiArCQlwc3JfZW5hYmxlKGRhdGEuZHJtX2ZkLCBkYXRhLmRl
YnVnZnNfZmQsDQo+IGRhdGEub3BfcHNyX21vZGUsDQo+ID4+IE5VTEwpOw0KPiA+PiArCQl0ZXN0
X2RjNV9wc3Jfc3VzcGVuZF9yZXN1bWUoJmRhdGEsIENIRUNLX0RDNSk7DQoNCkkgdGhpbmsgYXMg
cGFydCBvZiBjbGVhbi11cCB3ZSBjYW4gZGlzYWJsZSBwc3IgYWZ0ZXIgdGhlIHRlc3QgaXMgY29t
cGxldGVkLiANCj4gPj4gKwl9DQo+ID4+ICsNCj4gPiBUaGlzIHRlc3QgY3VycmVudGx5IHZhbGlk
YXRlcyB0aGUgREMgY291bnRlciBieSBjb21wYXJpbmcgdGhlIHZhbHVlIGJlZm9yZQ0KPiBQU1Ig
ZW50cnkgYW5kIGFmdGVyIHdhaXRpbmcgZm9yIFBTUiB0byBlbnRlci4NCj4gPiBJZiB3ZSB3YW50
IHRvIGluY2x1ZGUgc3VzcGVuZC9yZXN1bWUgdmFsaWRhdGlvbiBhcyBwYXJ0IG9mIHRoaXMgdGVz
dCwNCj4gc2hvdWxkbid0IHRoZSBmbG93IGJlOg0KPiA+DQo+ID4gMS4gUmVhZCB0aGUgREMgY291
bnRlci4NCj4gPiAyLiBQZXJmb3JtIHN1c3BlbmQvcmVzdW1lLg0KPiA+IDMuIFdhaXQgZm9yIFBT
UiBlbnRyeSBhZ2Fpbi4NCj4gPiA0LiBSZWFkIHRoZSBEQyBjb3VudGVyIGFmdGVyIHJlc3VtZS4N
Cj4gPiA1LiBWYWxpZGF0ZSB0aGUgY291bnRlciB1c2luZyBgY2hlY2tfZGNfY291bnRlcigpYC4N
Cj4gPg0KPiA+IFRoaXMgd291bGQgZW5zdXJlIHRoYXQgdGhlIERDIHN0YXRlIGVudHJ5IGlzIGFs
c28gdmFsaWRhdGVkIGFmdGVyIHRoZQ0KPiBzdXNwZW5kL3Jlc3VtZSBjeWNsZS4NCj4gPiBTYW1l
IGdvZXMgZm9yIHBhdGNoIDEgYWxzby4NCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBBZnRlciBh
bmFseXppbmcgdGhlIGltcGxlbWVudGF0aW9uLCB0aGUgc3VnZ2VzdGVkDQo+IGFwcHJvYWNoIGhh
cyB0ZWNobmljYWwgaXNzdWVzOg0KPiAxLiBEQzUgY291bnRlciBpcyBhIGhhcmR3YXJlIHJlZ2lz
dGVyLCBDb3VudGVyIGlzIHJlYWQgdmlhDQo+IGludGVsX2RlX3JlYWQoZGlzcGxheSwgZGM1X3Jl
ZyksDQo+ICDCoCDCoCB3aGljaCBpcyBhIGRpcmVjdCBoYXJkd2FyZSByZWdpc3RlciByZWFkLCBu
b3QgYSBzb2Z0d2FyZSBjb3VudGVyIGluIGRyaXZlcg0KPiBtZW1vcnkuDQo+IDIuIEhhcmR3YXJl
IHJlZ2lzdGVyIHJlc2V0cyB0byAwIGFmdGVyIFMzIG9uIG9sZGVyIHBsYXRmb3JtcywgT24gb2xk
ZXINCj4gcGxhdGZvcm1zIChkaXNwbGF5IHZlciA8IDE0KSwNCj4gIMKgIMKgIGRjNV9yZWcgbGl2
ZXMgaW4gdGhlIGRpc3BsYXkgcG93ZXIgZG9tYWluIHdoaWNoIGlzIGNvbXBsZXRlbHkgY3V0IGR1
cmluZw0KPiBTMywgY2F1c2luZyB0aGUNCj4gIMKgIMKgIHJlZ2lzdGVyIHRvIHJlc2V0IHRvIDAg
b24gcmVzdW1lLg0KPiAzLiBTdWdnZXN0ZWQgYXBwcm9hY2ggY2F1c2VzIEZBTFNFIEZBSUxVUkUg
b24gb2xkZXIgcGxhdGZvcm1zLA0KPiBiYXNlbGluZT0xMSBjYXB0dXJlZCBiZWZvcmUNCj4gIMKg
IMKgIHN1c3BlbmQgYmVjb21lcyBpbnZhbGlkIGFmdGVyIHJlZ2lzdGVyIHJlc2V0cyB0byAwLiBB
ZnRlciByZXN1bWUNCj4gREM1IGZpcmVzIG9uY2UNCj4gIMKgIMKgIGdpdmluZyBjb3VudGVyPTEs
IGFzc2VydCgxID4gMTEpIEZBSUxTIGV2ZW4gdGhvdWdoIERDNSB3b3Jrcy4NCj4gNC4gTmV3ZXIg
cGxhdGZvcm1zICg+PSB2ZXIgMTQpIGJlaGF2ZSBkaWZmZXJlbnRseSzCoCBEQzYgImFsbG93ZWQi
IGNvdW50IGlzIGENCj4gc29mdHdhcmUgY291bnRlcg0KPiAgwqAgwqAgaW4gZHJpdmVyIFJBTSAo
ZG1jLT5kYzZfYWxsb3dlZC5jb3VudCksIHByZXNlcnZlZCBhY3Jvc3MgUzMuDQo+IENvdW50ZXIg
YmVoYXZpb3IgZGlmZmVycyBiZXR3ZWVuDQo+ICDCoCDCoCBwbGF0Zm9ybXMgbWFraW5nIGEgc2lu
Z2xlIGJhc2VsaW5lIGFjcm9zcyBzdXNwZW5kIGJvdW5kYXJ5IHVucmVsaWFibGUuDQo+IDUuIEN1
cnJlbnQgcGF0Y2ggY29ycmVjdGx5IGhhbmRsZXMgYm90aCBwbGF0Zm9ybXMsIHRlc3RfZGNfc3Rh
dGVfcHNyKCkgcmVhZHMNCj4gaXRzIG93biBmcmVzaA0KPiAgwqAgwqAgYmFzZWxpbmUgYXQgY2Fs
bCB0aW1lLiBDYWxsaW5nIGl0IHR3aWNlIGJlZm9yZSBhbmQgYWZ0ZXIgc3VzcGVuZCBjb3JyZWN0
bHkNCj4gaGFuZGxlcyByZWdpc3Rlcg0KPiAgwqAgwqAgcmVzZXQgKG9sZGVyKSBhbmQgcHJlc2Vy
dmVkIGNvdW50ZXIgKG5ld2VyKSwgd2hpbGUgYWxzbyBpc29sYXRpbmcgcHJlLQ0KPiBleGlzdGlu
ZyBmYWlsdXJlcyBmcm9tIFMzIHJlZ3Jlc3Npb25zLg0KPiA2LiBSdW50aW1lIFBNIHN0YXRlIGFs
c28gYnJlYWtzIHdpdGggc3VnZ2VzdGVkIGFwcHJvYWNoOiBPbiBCWFQvR0xLL0lDTCsNCj4gc3Bs
aXR0aW5nDQo+ICDCoCDCoCBzZXR1cF9kY19kcG1zKCkgYW5kIGNsZWFudXBfZGNfZHBtcygpIGFj
cm9zcyBzdXNwZW5kIGJvdW5kYXJ5IGxlYXZlcw0KPiBydW50aW1lIFBNIGluIHVua25vd24gc3Rh
dGUuDQo+ICDCoCDCoCBDdXJyZW50IHBhdGNoIGtlZXBzIHNldHVwL2NsZWFudXAgYWx3YXlzIGJh
bGFuY2VkLg0KPiA+IFRoYW5rcw0KPiA+IEplZXZhbiBCDQo+ID4+ICAgCWlndF9maXh0dXJlKCkg
ew0KPiA+PiAgIAkJZnJlZShkYXRhLmRlYnVnZnNfZHVtcCk7DQo+ID4+ICAgCQljbG9zZShkYXRh
LmRlYnVnZnNfZmQpOw0KPiA+PiAtLQ0KPiA+PiAyLjI1LjENCg==
