Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F01FEA83D
	for <igt-dev@archiver.kernel.org>; Wed, 25 Mar 2026 09:49:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD8C10E84A;
	Wed, 25 Mar 2026 09:49:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiNZRn06";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D693110E6F4
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Mar 2026 09:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774432144; x=1805968144;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y2uQ/0IgqYtnKhgE3WR43WODZvwbTrcxn0CrG+4nBYI=;
 b=IiNZRn06HNqLujKGkz7O9v1OIunycNsSnKqtgqCrqAoCC4vQmj5TMPYV
 3OOxkIROQfNAAXAagAaJDrnmbOXUGOyMu2Xp03OQJFi8TJ9k1bR7hUX/V
 A8PlqAcAuDFhZWDwaLpgw7cMrVaSN4pC+LiwRACOVJ3URAYxwssB6h1ZH
 emaVcsHy4+nX7D7PbveX6GhMmyEAZJiewm71QW/AMH5icHX7S+YZwh8UZ
 SVfCRz0/NRmFmfOiGIPM3b/K8pPNJ1MIwt+cPxDvhWomMU9PrqM4SmArW
 DJ2H2AIiPCXNxBgRUhrKF+Zv+9W5+TzR0Q0b6Sjlqvh3HanFIW8T4fsei A==;
X-CSE-ConnectionGUID: RCVEQSXGTHGsNpVVY0VcTA==
X-CSE-MsgGUID: EZ4b0KKcQqKLS4zdLPe6Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="74644447"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="74644447"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:49:03 -0700
X-CSE-ConnectionGUID: 2YUmT2kCQoyZ6NhBIXgr+Q==
X-CSE-MsgGUID: V6/GIzdQRKGPU/PRM0Jt7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; d="scan'208";a="229096611"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 02:49:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 02:48:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 02:48:58 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.37)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 02:48:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk8Alu9Pyk27i1CWY3VkC+xGDs/UmKCoUp6Zs/9LlTGcbd00QsVFOXW8Z0SgrwCqdWRU0svYXpXxOT8biI+/ggvZmXpa+X1dNF/8CK1DZpboVDI6WQ7osZMS/Zib6GHrDlwvBcFbjrk62dHhFfED9s/HWHCXvPNA8MO2E5hS0T/4fNxITVEcJvOSKC2N62MxcwqHzyl/u1iU2+ct/fEhCuj+klok3vYfbZsTUDLD2zq/G3lNXl28daAkixhgMKfeq1JBtNt6UmZ7clYAkBrEGRjTvo5S4NtCb6QTGhcavcp55S4x41kMoVZfzTSjeS2b/di1dUBmcn6en9a8XS2VHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2uQ/0IgqYtnKhgE3WR43WODZvwbTrcxn0CrG+4nBYI=;
 b=OYoYLKUnajJSKm0w6Lhsw5Sj15P6C8ckUQ0JpBG4LOXi9WH0VVpG+swLu1vqfhCpOsz26AtlO1QhYA1KpRjrk0aNa81xUIUKhhrwLHvRLAH9VFMIYM8Vm3fi51GzTO4VxfEnphEDL5FEmIIpLXszOscFMnR8OdRfackHQqMCD8q9k1Ed7y0LkGAj3GAWSa4meiUCSSOGyQe99l2/MLJmfrh6gkJ0YG35ziRexxJHltS3mOYcIgDJ3ncNN72ROSri62RnExB0JQfcRCIuSNskJfbYxyzJtO1AbBAq09FowFO8QHNaOCK3SLYm9pY6AqAwMnmZjhmCUpjJtWQmRXJovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5564.namprd11.prod.outlook.com (2603:10b6:610:d7::18)
 by CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 09:48:51 +0000
Received: from CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb]) by CH0PR11MB5564.namprd11.prod.outlook.com
 ([fe80::bdb2:f221:b705:aaeb%2]) with mapi id 15.20.9769.006; Wed, 25 Mar 2026
 09:48:50 +0000
From: "Girotra, Himanshu" <himanshu.girotra@intel.com>
To: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, "Wang, X"
 <x.wang@intel.com>
Subject: RE: [PATCH i-g-t] lib/intel_pat: Fix typo PAT_MODE -> PTA_MODE
Thread-Topic: [PATCH i-g-t] lib/intel_pat: Fix typo PAT_MODE -> PTA_MODE
Thread-Index: AQHcvDjiqN45VZO7aU+VY85wqbmxBLW/AIZA
Date: Wed, 25 Mar 2026 09:48:50 +0000
Message-ID: <CH0PR11MB55644C7D35F37AF4BA8A1BBE9849A@CH0PR11MB5564.namprd11.prod.outlook.com>
References: <20260325092134.112722-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20260325092134.112722-2-zbigniew.kempczynski@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5564:EE_|CY5PR11MB6414:EE_
x-ms-office365-filtering-correlation-id: 7bb4bdbf-341f-47bd-e68f-08de8a53b7f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|38070700021|56012099003|18002099003|22082099003|7053199007;
x-microsoft-antispam-message-info: RS/rN14ha2Ej943vBRH0Xbyop0nZM4kA7+9zhVxmoVeTM+w5x0jxP+lBvM0yQHNzLhjQaGAFklBFJ54POvcb/zkri5MYH24EUyB+LSVEPuIlCtx7gxbr+jP5V2ycUbX1V42Z47eqSIDzDsaX/WL3l/IPKJmkb8EKAXmAt9yAxNA6XKYFdVBaDhipGT296/4Uc3Pfnp7Ao6pkKBBIPxYR+VKzTdi3TbzDOa8KFGKjNlKTBgWaWEwJgUUEmKWYLz6cxeByI0r4H4Y5ZCuTLhfH7sHAzzxmtZygC3lAnbWgurLJZSOYpk15BAZg7OWNlkMNcaCsg7H1gZuWBLRELCiN+tq1eq1wymyoPzmJp5gWe226OYLDYJyatFkWp6cRIP2Ypz7ZjPTPlnkDM1vt0DxundqOE2APg5f4Pdu3eBI7vGUP4Y8suCdXFiHSM/mhjCpGRvIcvjYHiF8+rWxx88ZPw2Ls5+PgnK8eST7yP4TeSxTI2K6rUwq+NUUBmknfleKf+Cm3T1hDnAhztU4jf8aoKvtwCbJFSP0ZwncItU0GATSj1xRGS08hnq2z8n24hKVAYVl6G9r7BKTqEGrRnnhUvwDgvp5z9x/qceAQrCm2IYm41sd9Kc2WarcDz4qOoFaEIgJH987W/OXmGm0KdileV52vQqnysiO0FnIjWOlK1hjCZm2iaDnTK7HJBRgW5rgPe0go/MLylS+JQ7JdKNKgqhbc3MUrQDSrP/WUO8kUC+BSW/s50c+IdqY/+PsuBcxFajX+4+Zcep74R3VJs9/FVYTvdmnKnb1ESB/Yo1BhsYQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5564.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(56012099003)(18002099003)(22082099003)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzhHRXBYeHA3RUhGYUp3dXk4cEM3YmpGZy9HWlZXZVpLNEhCeGZ2UnRxU0xR?=
 =?utf-8?B?OGE4Nmcxb0Z2cHdhNmNlZ2I5YXpvZmlWWURtRVB1SzdtOUxaWTh6bUE2Q0Rn?=
 =?utf-8?B?Nk5RYUhVN0tsQkw5SDZBOEw1Wnl4S0ovSnZST1gydDdSckd0U0ZRcXdqQlRB?=
 =?utf-8?B?Slkwb0JBU2RTWUpOOWpqbFNXM3p2WDg3bW9sOTlzWDlRK0E5RVJUREdTOHR1?=
 =?utf-8?B?OUJBQ0N3NHNnY29ML0lCQWxzTjVwekVIc3pocnFDSjE4bTdTV2luWkFja1d2?=
 =?utf-8?B?bkJac2RWWHNDTm1ydzJxcFpWbFEvYmhpYk5oYXYveWR1cW5hWlhtU29FaWxk?=
 =?utf-8?B?Z09JWkc0Q2wvYi9vUGRNMThXU0ZrUDNIT1JtMm5zanJmM0gvOVpDQXQrTEt5?=
 =?utf-8?B?NlVSREt4QWU3ZFFZRkZzajhOMHVoYjdrZWZIdlpPQTZaQjl2T29sSEcxMzJD?=
 =?utf-8?B?eEZ2VVVrZTFwMkRTV1BaRm95eCtSWXFlUW5EMFM1OHdyTjZhcGk0SGJFMEVW?=
 =?utf-8?B?UTl0OENFNGJWa2JXcENPWEhnays4MWNlSnpRNG1HeDBDY2pMb01ZQmU0RFBh?=
 =?utf-8?B?ZS9EQ3g4ZkxONVdCY1lqUXN4cVQrRmowcEZtenpSVDBMSVlSYXdSMHUveVNG?=
 =?utf-8?B?blk5ZlRESVRjQjNzK25iOGdXbXVOYWFnWk1kd0RqRkpwdExRU3B1ZllaOVBB?=
 =?utf-8?B?dndNc1VwUTVYVUs3UnBXZk5FcitjM3FIbVA0QnZNaUJaMTlHdlN1aXhFcUlT?=
 =?utf-8?B?Wm1yQ0NpWGFkYU9QMW85TjAzaTAzcFI4NFBybGFLcVdPdTdZcFpxeFhUaEhT?=
 =?utf-8?B?dDRHMWQwOHhQQ01UdkhvcXgwcFZaLy9hQldFVnkrd3BTVVYyQVJpVnNnWEhv?=
 =?utf-8?B?czFja2tSR3p2Z1g4bDdqR1FpOXdMUGptQUMvWk10dUdGZ3NCelBPRUNaV0FU?=
 =?utf-8?B?Sm83RjNUVkU5Q1dMeCtGUEJGYlhJTloybXJNQzgrMCtwdHhTQjFNeExZZkNs?=
 =?utf-8?B?ZCtlaUU3dERNM1F0eEpKY3JUVERyR1hZaEdWcWJxbkRVMGxMUWw1RlVZbGl3?=
 =?utf-8?B?b3RqK1ZEUEZINGNoaDYybnNhOFdXcTVJVXN0bVZIaGFkcXRvdmRvdFBEci9z?=
 =?utf-8?B?bkQxbjdNWm5OTHlrTndzcnYwc2NCc2duNzl1NmNJL0lMZXFQWnJTci81NzVC?=
 =?utf-8?B?VStnbnlZUTNaS2hydkVGMldWbEdYRDF5M1hib1lVM0JXcVhMMlVaSEk5ekFK?=
 =?utf-8?B?VHVyMitPTDFhWnBqRWhJNlJoNThtRVRWWFdUSnc5NnN5Y2ZGY096TEs3eXNK?=
 =?utf-8?B?WlNUR0t0dnd1bkJzejQ2eGF2ZTlFejNVZnRTeVYxQjhHOWs5ODIvUmVsSmNR?=
 =?utf-8?B?TjEzOHhpQzBvOUdUWE40OUVXdXlrc2V4MVRVWWRoMHBhTlpTWmE0czljUUxV?=
 =?utf-8?B?Mmw1ZkI3YVZzZ2xNRWI5WHJVL0lJMEpKRk5pRE00MUZzbGJNYlpDRTd1eE8z?=
 =?utf-8?B?K2RzZWdCaDNmai9UWWpVenIvRGIyL0RaVW11S1NaUUtEejBjblV3enVaRHlx?=
 =?utf-8?B?elZpenU2dUU5YjFuZDlITE02TWxkYlhFekI0MnVmbmVhc1oyYzBodTAxVVFo?=
 =?utf-8?B?S2svRFRxamdyc0FGUlhJaytUTTNKRWQzOWs5MXdSSDZ5TmN3QjJQTWYrVWJP?=
 =?utf-8?B?Y0tqcWd6ZkJ6NzR1Q3BLSjA2NnMxU2VvMXlYNkNrd1ArZnNZTy9QRktBOTM5?=
 =?utf-8?B?SzE3MXEvYkxuUklsLzk0M09qNUtJd3Z0UlJUdk9NZzJyVmU1T0Y4NllQNy8z?=
 =?utf-8?B?R1Y3UGRMY1JYUjB3RHkyNlNrckNjQnkxdTdYR2t2MzZ1VFloRkVLR2prQWdE?=
 =?utf-8?B?VE8xTG1qZXhOMmFFR05IaS9XK0tHYU4zYktTaTJFK2JzMFhzbW5jbzRVM2Zq?=
 =?utf-8?B?OXJjdENNQlZVNlp4RHJkTFdVZ3BXaGNOUXR0UExidSt4U09LeGYyck52M3Vl?=
 =?utf-8?B?Qk5HRTNwajZxSFR5Y2pMWXdTbzVodTg5eWJ3SWJBRThmUkk0aVVyTHpteGVM?=
 =?utf-8?B?QVY0ZzFkdHhJUzYrSk43WVhJVURqY1BpSkkrYWNnam5ja2ozakZqVzVHcVhN?=
 =?utf-8?B?RTYxT3dSMkxQaG9BbTR2anJIcHYyVmx1VEJHekpkY0NGQzlQaW5oZS9tU0l4?=
 =?utf-8?B?SExDM1ZZWEdlRWZCenlDbzJ6U3BGQi9vRm9JWHVYd3BoeTBsS3p6Mmo4aVFj?=
 =?utf-8?B?Vkc4YVlsNThMdE94U1JUYUVXLzFPbW5hdVZNZmE5VGlVNFdWdndibEEzbDh1?=
 =?utf-8?B?TFVmVW9DMHJaUXJRejJIRDRsT1FCT0ZnenlXbkEzUlIwcHR5V1M0UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MHoDGemFvioOyHiTCDV7bugPd39KEJqE3h4ppf2KKb5TC7heaxVo4grwBxdCgcLyH5pDvn4iqOjIC2f2XyDg764oG3fpr0c2uiOxfpcvOCSWZh5wDEgCEKU0vTcxu2kjnqWl3eq+BmH3hPOdQoBe6OXjTkpRHZ5JWpEMdYeS+bsUOlzIAudX1VicWMg6dmUsJZf0nXzsapH5Qa1KpV36SaQVrgBIc4z7SLl958Fl4YCQUF0DGIDuv/+xDU2tYoh+HGao/pzUQZd8oUTVZ6d5YYQwflwkdBqW0+/JH/PQFN4hO72sf2ckbC+hz0SAln9BY6BK4naUBjoQmSBNxDYP/g==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb4bdbf-341f-47bd-e68f-08de8a53b7f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 09:48:50.6280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 32tYTyzsbHoPje+YPmBxTSlwWdOY+z97kO/1z9b9fj8MhVPt+ziC/adGoqQTuz7eIz7R7b6ohN/FJBu8rJep+dwP0h7TJkx9fppOTkwNyFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6414
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaWd0LWRldiA8aWd0LWRl
di1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIFpiaWduaWV3DQo+
IEtlbXBjennFhHNraQ0KPiBTZW50OiAyNSBNYXJjaCAyMDI2IDE0OjUyDQo+IFRvOiBpZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogS2VtcGN6eW5za2ksIFpiaWduaWV3IDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+OyBXYW5nLCBYDQo+IDx4LndhbmdAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggaS1nLXRdIGxpYi9pbnRlbF9wYXQ6IEZpeCB0eXBvIFBBVF9N
T0RFIC0+IFBUQV9NT0RFDQo+IA0KPiBQQVQgdGFibGUgY29udGFpbiBQVEEgbW9kZSBzbyBmaXgg
UEFUIHR5cG8gYXMgcGFyc2luZyB0aGlzIGxpbmUgaXNuJ3Qgd29ya2luZw0KPiBwcm9wZXJseS4N
Cj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25pZXcua2Vt
cGN6eW5za2lAaW50ZWwuY29tPg0KPiBDYzogWGluIFdhbmcgPHgud2FuZ0BpbnRlbC5jb20+DQoN
ClJldmlld2VkLWJ5OiBIaW1hbnNodSBHaXJvdHJhIDxoaW1hbnNodS5naXJvdHJhQGludGVsLmNv
bT4NCj4gLS0tDQo+ICBsaWIvaW50ZWxfcGF0LmMgfCA0ICsrLS0NCj4gIGxpYi9pbnRlbF9wYXQu
aCB8IDIgKy0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9wYXQuYyBiL2xpYi9pbnRlbF9wYXQu
YyBpbmRleCA1MjVkOWFkMjRhLi5iMjAyYTYyNDE5DQo+IDEwMDY0NA0KPiAtLS0gYS9saWIvaW50
ZWxfcGF0LmMNCj4gKysrIGIvbGliL2ludGVsX3BhdC5jDQo+IEBAIC02NCwxMCArNjQsMTAgQEAg
aW50MzJfdCB4ZV9nZXRfcGF0X3N3X2NvbmZpZyhpbnQgZHJtX2ZkLCBzdHJ1Y3QNCj4gaW50ZWxf
cGF0X2NhY2hlICp4ZV9wYXRfY2FjaGUpDQo+ICAJCQl9IGVsc2Ugew0KPiAgCQkJCWlndF93YXJu
KCJGYWlsZWQgdG8gcGFyc2UgUEFUIGVudHJ5IGxpbmU6ICVzXG4iLA0KPiBsaW5lKTsNCj4gIAkJ
CX0NCj4gLQkJfSBlbHNlIGlmIChzdHJuY21wKGxpbmUsICJQQVRfTU9ERSIsIDgpID09IDApIHsN
Cj4gKwkJfSBlbHNlIGlmIChzdHJuY21wKGxpbmUsICJQVEFfTU9ERSIsIDgpID09IDApIHsNCj4g
IAkJCXAgPSBzdHJzdHIobGluZSwgIigiKTsNCj4gIAkJCWlmIChwICYmIHNzY2FuZihwLCAiKCV4
IiwgJnZhbHVlKSA9PSAxKQ0KPiAtCQkJCXhlX3BhdF9jYWNoZS0+cGF0X21vZGUgPSB2YWx1ZTsN
Cj4gKwkJCQl4ZV9wYXRfY2FjaGUtPnB0YV9tb2RlID0gdmFsdWU7DQo+ICAJCX0gZWxzZSBpZiAo
c3RybmNtcChsaW5lLCAiUEFUX0FUUyIsIDcpID09IDApIHsNCj4gIAkJCXAgPSBzdHJzdHIobGlu
ZSwgIigiKTsNCj4gIAkJCWlmIChwICYmIHNzY2FuZihwLCAiKCV4IiwgJnZhbHVlKSA9PSAxKSBk
aWZmIC0tZ2l0DQo+IGEvbGliL2ludGVsX3BhdC5oIGIvbGliL2ludGVsX3BhdC5oIGluZGV4IGU1
ZGQ4YTBhZjcuLjE3NzI3ODUyMDUgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pbnRlbF9wYXQuaA0KPiAr
KysgYi9saWIvaW50ZWxfcGF0LmgNCj4gQEAgLTI1LDcgKzI1LDcgQEAgc3RydWN0IGludGVsX3Bh
dF9jYWNoZSB7DQo+ICAJdWludDhfdCB1Y19jb21wOyAvKiBVQyArIENPSF9OT05FICsgQ09NUFJF
U1NJT04sIFhFMiBhbmQNCj4gbGF0ZXIqLw0KPiAgCXVpbnQ4X3QgbWF4X2luZGV4Ow0KPiAgCXN0
cnVjdCB4ZV9wYXRfZW50cnkgZW50cmllc1tYRV9QQVRfTUFYX0VOVFJJRVNdOw0KPiAtCXVpbnQz
Ml90IHBhdF9tb2RlOw0KPiArCXVpbnQzMl90IHB0YV9tb2RlOw0KPiAgCXVpbnQzMl90IHBhdF9h
dHM7DQo+ICB9Ow0KPiANCj4gLS0NCj4gMi40My4wDQoNCg==
