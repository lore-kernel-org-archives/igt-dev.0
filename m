Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C729C44539
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 10:18:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1363A10ED4A;
	Wed, 22 Jul 2026 10:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KaB66+/a";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B46310ED35
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 10:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784715454; x=1816251454;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=PSFWpVhKOXh0lLm0rGY4PiSS4VRwolXxMgfKP2DhADk=;
 b=KaB66+/a3sLnnOcc8jIiDJN12F5CX+LKYY7zvC3JkK6+zVqzpP6UV2FZ
 ABYAy66z08+hlqyzY29pS4ESxUbB8JW8jxX16nLhMPhSey60BiJhSZurO
 EtBG9/euKzjnn6s3VPVzQVtWDNyHcJveX0i5f4xPaDqQJiniNzkAGYPrG
 AWDYvhh4I4oic/byUrYmyVUZuPth49M+UrNqTOzBoMG1Fpx8zGpdYbC1m
 lKbN2v0HaIQnaopnb0vLMuz/7t/7qJfCo5XdhZDVC+XD3lrK+Res8Syy4
 JFzlK25ISvEC6OlQgPyMcIhGDEMXWIaj1KHrgWrX2RzSceb0SHLVueTOQ g==;
X-CSE-ConnectionGUID: 5zloeLt6RsiIWIta/8lonA==
X-CSE-MsgGUID: EXj+Im8eR2Oo3Zy/0Cqhsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="108137265"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="108137265"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:17:34 -0700
X-CSE-ConnectionGUID: EW059/0cTxOf9blzTn/bpA==
X-CSE-MsgGUID: 3oxaE+vMSACuiAq4HgjL/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; d="scan'208";a="262338947"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 03:17:34 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:17:33 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 03:17:33 -0700
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.61) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 03:17:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZCm/GgnljllkFxjUl6ZKSQu6ojHdxbEXBEa8hSLscmcYg8Tr67++n6pPQfSqny0i+W2kNnIpSmxDcn3xmGJQuBqt3m1XlvxAsiib5h2shdIw1QVrLBOdiEqojrr2/fE1xSmZOXJ7i2kau+1quuHulNU0pMKB8iMxO6/xmwvz2iHmQdNUDF0HEj00aqZp0Ea7Y4q4x44FNCcHLdluLkP1AOEoLGmHn+9q44bHRbc0v90TLZp79L8rKJ537RLSMtjYEEhFZjVhSeHaEghmsXbaB4N0A4bZNosLUmc2v/IdgrOqaMv3PNOWXA0jpb0ZGQDdYbl852BDCVkWWUo/ZjI2VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSFWpVhKOXh0lLm0rGY4PiSS4VRwolXxMgfKP2DhADk=;
 b=gsFqe10dlUClNzmCZ5+NyZPla6zPnnObJggIiR2pvnkJ61/yNIq+Bi9h808M3Hndqqe+r+GtQa9esbCG2tUZRSaMyf7zg9fMdeLGaIFdQUPQPPpc8ZDQvDrSeu9W8ptsmTrahpPV6uIkngayeYX0rsySx3ayUvBahJOShbbX91rgZulObZTUlWE9E3SQhgojV0v6M6nQmP8fY5WGwkBD2v+cP5Q8u7KwSHLqWJps7nYHTqvofiseGtHPydZShhfmh/PQqo1msXcp8ySbNem0kNaDC4lZ31FUJJ8lF28TkNBuUPXs1qgdXWSA9RIz/8/rvxnOMM/YvX1Ed8+GkSTlow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com (2603:10b6:a03:3bc::9)
 by PH0PR11MB5949.namprd11.prod.outlook.com (2603:10b6:510:144::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 10:17:25 +0000
Received: from SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd]) by SJ0PR11MB5663.namprd11.prod.outlook.com
 ([fe80::e4cb:d003:6475:26bd%5]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 10:17:24 +0000
From: "Knop, Ryszard" <ryszard.knop@intel.com>
To: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH i-g-t 1/1] meson: Remove Xe EUdebug
Thread-Topic: [PATCH i-g-t 1/1] meson: Remove Xe EUdebug
Thread-Index: AQHdGcDW8Ls7dYkA9kKTRdbvCiEH0bZ5UxCA
Date: Wed, 22 Jul 2026 10:17:24 +0000
Message-ID: <af7448082df5a7eb3697ef436155c320718db62a.camel@intel.com>
References: <20260722072959.12790-1-dominik.karol.piatkowski@intel.com>
 <20260722072959.12790-2-dominik.karol.piatkowski@intel.com>
 <20260722095920.xoll3dfkdr6z3cet@kamilkon-DESK.igk.intel.com>
In-Reply-To: <20260722095920.xoll3dfkdr6z3cet@kamilkon-DESK.igk.intel.com>
Accept-Language: en-US, pl-PL
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5663:EE_|PH0PR11MB5949:EE_
x-ms-office365-filtering-correlation-id: 0b2e4377-0321-4bcb-05ed-08dee7da6ce5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|38070700021|22082099003|18002099003|4143699003|10067099003|56012099006|11063799006;
x-microsoft-antispam-message-info: vvfbHIVxJPgCZqGs33GPWeif0X2EL1XFK1//hZ/Thfk1yLel8rCojTe+hBCqswuyC85wLklCAqdBnyf17XBcUfDGjarB7adpyhTT/gcWf4xuwBCpu8mu0Bp7Z/byRoy9uDZDsLDVee0p9oObt+5UmXpJEF39RHJa/dre4KeyAISZoIKfRMU7zdB+Iep8jwdmGR0PaCF8SLQvzcNAiA2Ne/79dSLNvm9eAnzHi9iFI1qKoFNMXampLZoVMCpp7NXWKF6HU0CYxIC/CuEj0vn6d9CF53KI2o9W9idXvjpza6IBwEeXGmByUMIIPufrkCCCPbYM3/rsKXGNnsg+SgI02UfwcN1y5XFb6jbH25lhd+fAk1la1FH1Y5ieZRoXdKV2cjmMMcUieko5TXNrpv7lTdQIRBBdp1vYgyl2bmhyNoU3Z2yc9+z1k/nKo5zKOV6nxLkRoVgX0WSURZGXqGc/LStwJ8RHVZnnnHOSFoJtmX7nx5UfY675nv1vAJ2+EwPhneb6U40N4xN9KDX2YwumugpCqEqKzvy/OgdJ+Ij6oB+0gz5r9kyUGtQMfxduc/6LO5Q2SYnxNVZOUaOaiWqIZMHTL7E/GSRINy0KoZmYqnCdnCmaphgOB9g/LH2N5q91UcAkcVCvIA5A3/OqtU0tEhO68d6aSr8QMe3pVhlzf+ckgemAt26AiBVOvSsWim7/omXY4I9N3ZrJht2v4Cy7M68M6IRIcIPExDIJ4Up4h9c=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5663.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rm1YaGFvV3EyNzRRWXM5VlhzMTY5QmVzb2FPZzlsb3lPRGNzc3JiUWFMY0lI?=
 =?utf-8?B?WGc3Yk1WYzVSdlQ4bElOeG93czZHQnlBKzZqMlZRZFhIaU1CcXkrVkgyZlZD?=
 =?utf-8?B?Q2hrRGhQU2NFU29HT0tkKzdqZ3IwOFp3ZURXQXMwSnJCNWdKS09NUGdzMkNT?=
 =?utf-8?B?UzdVYnh6bFU2S3BKNDZRRmdhL2dxSkpLZGJkbFliV3pmQjNnYm5pVjV0WFh4?=
 =?utf-8?B?akxJNG5GcnAzWVJ3L1NERG9KcVFBV0RGVUpsU001aG1tMXEzMXBtMzR0N2pW?=
 =?utf-8?B?M3duV0VyM21mSjRlVWY0UU9wWGZZMFZ0QkluZVQ4Z054aklDdzNJM0M1TjRE?=
 =?utf-8?B?S28zRDd1UDlpY291TXAxQktUemdaQ2VkU1J2ZWIvcjIzLzVGL0xRNTJBR0F3?=
 =?utf-8?B?VVVEMGR4aFdrRm5iZjhuU3N4YU1hTGRNR3kxN1pPNDBDRWpmVDl0U3QvNlVa?=
 =?utf-8?B?NzBZRkNaMTB0aXBGN01GVlZGUHNkcUpGZG5FaUROOWhFL2U2eHhZNGZkRGI4?=
 =?utf-8?B?Sk95SE5VaDNXUVlNRzJ6V3dySlNpcWJHSnJ2dDNpM1FLVkNDRy9Bc0xISEhP?=
 =?utf-8?B?Wjl3TE0xRmtId0Y5MEtmS1dqMjZkaVlPZzlOeG1hQkJDY1Fkd2ZBYVMzUzJK?=
 =?utf-8?B?WHhaY29nSXVnVUc4N1hGR0VnQmZ4SllIVWU2dG12ZmZ5OUdvU3NCZEhRcjNF?=
 =?utf-8?B?R0ZtOG4wbHRlbEZHRTN6cTdjdDJUeEJrRTlZeUw5My9mY0xQbjNtc1VUUmxO?=
 =?utf-8?B?aTBQNFdQdXhMbm82OWlNRVBPZFJteCtmTmJnckFDSzZHckVpYmg2VW9lOW5Z?=
 =?utf-8?B?N0NOS2ZsUW5wK2F6Rk1sZFMxVUZmcDhaSHNoY3g3SlpHdVFSVEdFb1RZaDFS?=
 =?utf-8?B?RDRCMi9xb0dNWVVIa0pBZm90YkRFenpCN3N5ZGh3RDZYTXlXYzA1RFUwbFQ3?=
 =?utf-8?B?WVVGUXE0K0UvaXVzOENJai9qWkZ0bmFnZ2JrM3JFUXNnUExOZkx6OU9kaHFX?=
 =?utf-8?B?M3F3WDQva3NBYWdUTzV5YjY2RU9vbFlEWWV6SFQ3UmJ2YnpHUjI5YWY4Unlt?=
 =?utf-8?B?bExHaVZZZlNhREdHRjBqUU5NTCtzRmk5c3I1Z2RocjQ3R2FYVUFNa0ZyaXM5?=
 =?utf-8?B?REpUTlV6RW8yQUhtRm9nazg1a3VaWkxiSzBpU3ZrMDF5TWoxdVFGWFlORTlR?=
 =?utf-8?B?eE1RMXg4SkVIaGpvUDFGd2ZkdU14SG9lbzF4SENqdE5ITFBvUUczUHpySi9R?=
 =?utf-8?B?bmtZcElzTHpqODlpOE1mTFpGREd0SnZZRVBGR3BvSlVmVFpxd0NPZUFyL0Na?=
 =?utf-8?B?TEVjYXRvd0hLUVlyUUxlbmh3RWY0Z0s1MVVRMXJMV1dDcDZsQk9qUC9LRHBM?=
 =?utf-8?B?dVZ2RCtPemdMRnRYa1VCMnFLa2dESlJiTVJsTmFCTitJamc1a2s2S0J5UUFE?=
 =?utf-8?B?djBNOUxRWXE1M0pYUUZWUTAyTUUvdjlwRjZVZzNsQnRTYzcvWUozZThsbjJL?=
 =?utf-8?B?Y0I4ZURwWk1qbGc5NUxSUlN0NHVTbG5kb0xhSHczRmx0SnFRNVJDd0FUd2dG?=
 =?utf-8?B?YmxsVHF3OHlSbWd4WGtLMTYrbUdhK2dWcmU2bnJPcGJ5cGNSUEFjUVpMSnVu?=
 =?utf-8?B?U2Z1QmpSWmlKS045dDFjUVMraU95azQ1SWNRZHlzb1JSenZWNWwwZVBxMFRE?=
 =?utf-8?B?NVlFK0h4Z2NuWlVHZ3dsQ1BqRWVoajA3Sm91dkdXUFFhNFZ5T212aWN4U3Rh?=
 =?utf-8?B?N2Y4RUZuT1FCRWZYQ3JNeXRFelQ0TzJJbVh5MU1VcHJzQzBobC8wclZUb3dw?=
 =?utf-8?B?bEdMRjlXTnA1ckkyeG5BeGtWSW13QjFkdE13OGExOFVWOFhiUmc0dnloemZt?=
 =?utf-8?B?ZmNqeHRUREVjK1pPSE1vbWZBZWVoaGE5RnBsY1EvNVhXVHpxMHlJbTc0TW55?=
 =?utf-8?B?b1RlT050b2FIM2pEeWRabVBnTUtxSnJUMXRPRmZWUVU4S3RDaHUrMTdJR2Q1?=
 =?utf-8?B?ODE1ckpEQlVlQk83cGxseWQxeFkvL1NLeUFrU09rUEFRMUtTMlpEOWJIL2Fv?=
 =?utf-8?B?VFpFT1lIWUVmUk9xODJ6N2ZnblVKTHZRTll6dDJQUnhvOGNaeFE1SW0rK2Fo?=
 =?utf-8?B?MUNHcnNvZW1HQ2k0dXNNakN4T2xJNDFJQnBBby9TaHVIOWRLWjdQQ3ZyRG9Z?=
 =?utf-8?B?ZW41ZEJMdE5ZZWZrWnNJYnBTeExobEpGbXcvSFVYTWMyc1puVHo2SEVRUGln?=
 =?utf-8?B?aFJ6M0w1TFpRU2Y0ZnVPems0QjdNV2E2bnZCOFlKRkI4UjlkajJHUkt3WHFS?=
 =?utf-8?B?aUZZSlVuS0UvVE01RGgwTGRmeFowMFNuaTZKMklhNVFRSmVNcHVaYjM0WlFE?=
 =?utf-8?Q?2iWp/31F/c1WNhZE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4156C93D9AB0E14E97C053A0D4C70D7F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jHjsfEyC7lTpEKa54VGqc0WTCBIOOBsGtDtfJWqvWK0mtAmn5RQ48Mt6ElLvmb2Aqq1Y9tOE7qs9W1sVXg2BKFsN0ykswZ2ZgFca9IhgyORa0g3qLihkxpAyKUkYAJEx7UuiiMh4ToFDlhz8YBoYYmr1vBfn25rv6bW4Y7vbgcyB8YL7h+UOBVQMjw9twaATan9VExZM9KKpTl0Hm4dIsDijFjisJcCDFyIbF4dbWXHTOVkuS1ZQ4Bc05mr0fJHyLfPwJMl3R4CiMCNmtnUE3+iEI6zhDCfqUPnFUnGFs3VYhKPm+s1QC6R2+EoYuHfF1x7efqqMZwjJytsRdrEXTQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5663.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b2e4377-0321-4bcb-05ed-08dee7da6ce5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2026 10:17:24.7943 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HwVUdymeiYqhOFQWBjT4CGv/DYoW3bBHUX6F9Vzjffswdnf/yif9TDQL7c6gxXhktIJYlof5B+hZv6/QomoDrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5949
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

T24gV2VkLCAyMDI2LTA3LTIyIGF0IDExOjU5ICswMjAwLCBLYW1pbCBLb25pZWN6bnkgd3JvdGU6
DQo+IEhpIERvbWluaWssDQo+IE9uIDIwMjYtMDctMjIgYXQgMDk6Mjk6NTkgKzAyMDAsIERvbWlu
aWsgS2Fyb2wgUGnEhXRrb3dza2kgd3JvdGU6DQo+ID4gUmVtb3ZlIFhlIEVVZGVidWcgZnJvbSBt
ZXNvbiBhbmQgbWVzb25fb3B0aW9ucywgYXMgdGhlcmUgYXJlIG5vIEVVZGVidWcNCj4gPiBmaWxl
cyBwcmVzZW50Lg0KPiA+IA0KPiANCj4gK2NjIFJ5c3phcmQgS25vcCA8cnlzemFyZC5rbm9wQGlu
dGVsLmNvbT4NCg0KQ0kgc2lkZSBpcyByZWFkeSBmb3IgdGhpcywgc286DQoNClJldmlld2VkLWJ5
OiBSeXN6YXJkIEtub3AgPHJ5c3phcmQua25vcEBpbnRlbC5jb20+DQoNCj4gDQo+IA0KPiANCj4g
UmVnYXJkcywNCj4gS2FtaWwNCj4gDQo+ID4gU2lnbmVkLW9mZi1ieTogRG9taW5payBLYXJvbCBQ
acSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tpQGludGVsLmNvbT4NCj4gPiBSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gIG1lc29uLmJ1aWxkICAgICAgIHwgMiAtLQ0KPiA+ICBtZXNv
bl9vcHRpb25zLnR4dCB8IDUgLS0tLS0NCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGRlbGV0aW9u
cygtKQ0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkDQo+
ID4gaW5kZXggZTA5MTIyYTA5Li5jYjZkZWEzMGUgMTAwNjQ0DQo+ID4gLS0tIGEvbWVzb24uYnVp
bGQNCj4gPiArKysgYi9tZXNvbi5idWlsZA0KPiA+IEBAIC05MCwxMiArOTAsMTAgQEAgYnVpbGRf
Y2hhbWVsaXVtID0gZ2V0X29wdGlvbignY2hhbWVsaXVtJykNCj4gPiAgYnVpbGRfZG9jcyA9IGdl
dF9vcHRpb24oJ2RvY3MnKQ0KPiA+ICBidWlsZF90ZXN0cyA9IG5vdCBnZXRfb3B0aW9uKCd0ZXN0
cycpLmRpc2FibGVkKCkNCj4gPiAgYnVpbGRfeGUgPSBub3QgZ2V0X29wdGlvbigneGVfZHJpdmVy
JykuZGlzYWJsZWQoKQ0KPiA+IC1idWlsZF94ZV9ldWRlYnVnID0gZ2V0X29wdGlvbigneGVfZXVk
ZWJ1ZycpLmVuYWJsZWQoKQ0KPiA+ICBidWlsZF92bXRiID0gZ2V0X29wdGlvbigndm10YicpLmVu
YWJsZWQoKQ0KPiA+ICB3aXRoX2xpYmRybSA9IGdldF9vcHRpb24oJ2xpYmRybV9kcml2ZXJzJykN
Cj4gPiAgDQo+ID4gIGJ1aWxkX2luZm8gPSBbJ0J1aWxkIHR5cGU6ICcgKyBnZXRfb3B0aW9uKCdi
dWlsZHR5cGUnKV0NCj4gPiAtYnVpbGRfaW5mbyArPSAnQnVpbGQgWGUgRVUgZGVidWdnZXIgdGVz
dCBmcmFtZXdvcms6IEAwQCcuZm9ybWF0KGJ1aWxkX3hlX2V1ZGVidWcpDQo+ID4gIGJ1aWxkX2lu
Zm8gKz0gJ0J1aWxkIFZNIFRlc3QgQmVuY2g6IEAwQCcuZm9ybWF0KGJ1aWxkX3ZtdGIpDQo+ID4g
IA0KPiA+ICBpbmMgPSBpbmNsdWRlX2RpcmVjdG9yaWVzKCdpbmNsdWRlJywgJ2luY2x1ZGUvZHJt
LXVhcGknLCAnaW5jbHVkZS9kcm0tdWFwaS1leHBlcmltZW50YWwnLCAnaW5jbHVkZS9saW51eC11
YXBpJywgJ2xpYicsICdsaWIvc3R1YnMvc3lzY2FsbHMnLCAnLicpDQo+ID4gZGlmZiAtLWdpdCBh
L21lc29uX29wdGlvbnMudHh0IGIvbWVzb25fb3B0aW9ucy50eHQNCj4gPiBpbmRleCBlMjM0MDJi
MzYuLmZjODI0ZGRhOSAxMDA2NDQNCj4gPiAtLS0gYS9tZXNvbl9vcHRpb25zLnR4dA0KPiA+ICsr
KyBiL21lc29uX29wdGlvbnMudHh0DQo+ID4gQEAgLTQyLDExICs0Miw2IEBAIG9wdGlvbigneGVf
ZHJpdmVyJywNCj4gPiAgICAgICAgIHZhbHVlIDogJ2VuYWJsZWQnLA0KPiA+ICAgICAgICAgZGVz
Y3JpcHRpb24gOiAnQnVpbGQgdGVzdHMgZm9yIFhlIGRyaXZlcicpDQo+ID4gIA0KPiA+IC1vcHRp
b24oJ3hlX2V1ZGVidWcnLA0KPiA+IC0gICAgICAgdHlwZSA6ICdmZWF0dXJlJywNCj4gPiAtICAg
ICAgIHZhbHVlIDogJ2Rpc2FibGVkJywNCj4gPiAtICAgICAgIGRlc2NyaXB0aW9uIDogJ0J1aWxk
IGxpYnJhcnkgYW5kIHRlc3RzIGZvciBYZSBFVSBkZWJ1Z2dlcicpDQo+ID4gLQ0KPiA+ICBvcHRp
b24oJ3ZtdGInLA0KPiA+ICAgICAgICAgdHlwZSA6ICdmZWF0dXJlJywNCj4gPiAgICAgICAgIHZh
bHVlIDogJ2Rpc2FibGVkJywNCj4gPiAtLSANCj4gPiAyLjM0LjENCj4gPiANCg==
