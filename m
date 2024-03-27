Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7889C47DD9
	for <igt-dev@archiver.kernel.org>; Wed, 27 Mar 2024 12:26:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3977C10FC98;
	Wed, 27 Mar 2024 12:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L81Ds+/T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DF3C10FC98
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Mar 2024 12:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711542404; x=1743078404;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=0TY91oPLZo1vuUTKTEteCLAEplsyzOh1XYj2iKY6XD8=;
 b=L81Ds+/TDRHokY14Olj6zrPLN6RHaYDXTCGM08UvXNGt2ZqxfC6OQt9V
 qEXat7TE3ChD+5kzq6xIgZaycdWGxtvyqGocb8TURxDomPfkhzP7G6MUj
 jJUKS0WGPdeEp9H9E1HlC+ip+OZWQnCjkzEcRMhXTRSGznyBYnzqhUq3F
 otgyCTo1PNfn0uaG+FsWl/FNE4UNPrjbQdmbKZNzrs134Lo0/oNWzVx/Y
 QcF2RUWQ3kwOxOl01fI5OiX9ul/pCZxNRXc1steOZN/9inNGybaipbwj2
 0WH08mAaTLJkPCx13sHxzhhB26KhyEEM3lrsjHbQ17nekSue/8wRACBpK w==;
X-CSE-ConnectionGUID: Je+ZVl1yTUyxjReUWitT0Q==
X-CSE-MsgGUID: ZztQqOG5SaekNw2FiZnCyA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17369313"
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="17369313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 05:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,158,1708416000"; d="scan'208";a="16372863"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Mar 2024 05:26:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 05:26:42 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Mar 2024 05:26:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Mar 2024 05:26:41 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Mar 2024 05:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HT788fp4BPu+UP/0+8NxMPiJtFO8fMBZcy5NAXB2NaRH1TPisLds06by1wLp/LYNAt44Qws+VILKIGBHnRnFd4kKkkOjyt537kHc+9dyg48PLNSfC21dv2a3n4wZ7RV20q57AvU0MYbyjWO0LGQsyNAlFcRVbaBuJawHMofFrw6V2J6BKYtjg7BVcGKr3Fm6X6DhBKr0Hbn5Y/QTm/1dIbcEgQgofODlH7jIiUQtt3DLY/Bm0MR1J/eFI2mNBTU/irq+RvX3Rb1kZHbSImS51RB2Tx4aZPLlk4a8npKwuoQMhW34jS0SIFLm+oaG9gEYa4zD29BsiFHpL345W17I1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TY91oPLZo1vuUTKTEteCLAEplsyzOh1XYj2iKY6XD8=;
 b=dCEV5DLtsYubfLy28XYmPvVmHCx0wwtZAL0mdQk/l+kvMQ/EDqh3RaL7eIvUeUf8n9G9Nivwal110XttY0Fa+1tRnAz1SO4r0HkZmxGfuGQBjwKpNXFVE59medyzjlpLs8j9oOs64tZgdCaIB1xT62tLm6QC/sFDHB3sGUnVpRIqvvfP8x0ozd03mE1fAkbhlaDhoU9cwBjbeatzhVhyhQi8L93Z6TBlUij/U5ZEJwt9J+0+bM1BQcZsQUoxxbWKnsh1LH4UGMViilnQC5qN/xXzNaC6SHQ1nJPtxlEX8I81AvSJmoOsfd4yNlq23AH/yyVigdOAT3zS4+HoUweTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by MW5PR11MB5858.namprd11.prod.outlook.com (2603:10b6:303:193::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.30; Wed, 27 Mar
 2024 12:26:39 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::f:d87:3265:6573]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::f:d87:3265:6573%6]) with mapi id 15.20.7409.028; Wed, 27 Mar 2024
 12:26:39 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Hogander, Jouni" <jouni.hogander@intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/intel/kms_fbt: Skip fbcpsr tests on
 Wa_14016291713
Thread-Topic: [PATCH i-g-t 1/2] tests/intel/kms_fbt: Skip fbcpsr tests on
 Wa_14016291713
Thread-Index: AQHagApjM2zs7p6Lz0WYCeAFRLSFSLFLg/IA
Date: Wed, 27 Mar 2024 12:26:39 +0000
Message-ID: <7d4e83557e56bea9fc347d3a8b71963d9733eeb9.camel@intel.com>
References: <20240327054750.159017-1-jouni.hogander@intel.com>
In-Reply-To: <20240327054750.159017-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|MW5PR11MB5858:EE_
x-ms-office365-filtering-correlation-id: 106be58a-5e3e-423e-24c3-08dc4e592726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yzQIvaHM+2oICqEVYlziqBbwA7Y46Dgkg1EdXyXXQq3l5C3q5iMOIbbwl1QfVRKA9t7LjlPpfrePn2d2qeK64iu9OhkXDGEQeuCh3RPdASk7UnwOBkFqzy1oMGHvBInl9vrieEHLJa+B4LMI7kmiDI7q5kYR+Vh1C0kZmcC7nf/l59hGQ+PSn4fLubHxMAcKXYqdCEm1A9KScML8S7I0UBPHsm0qhdDP1juCxzkGAY06RvgRYXpqD6e06s8UWU0QixqISC25lN+a0D7k/mbcl28mHZ3gt89TgMZbeLtymVHnrc1DegtptncSrMl/MOMouPPWEVcCZs+iBxpkKlMY4I9gixjvGr0ROEFElFj1l3TzA25QC0h6Ig1fYm2EhQg/xDY62KVIKt7xtnuowr7XaZ3arifgpzN3wO8DSDsxv7yHU35nlZyqnw3yBMupHakpWTTYH4R43DR3NX9GeQm7D1V1deh+T3jO9z6R2ZPdj0l3X9t1VySfc+G73yfLcCi7CtgKqbj34d7RQiqPPdYZ5mLBcOx40EDjH7OuYOX7VHuyfdEICOVHVbGYZP0j5RMFqEuWA4NaItQMnpLfZF4WwSPI+lOZ7JcPogFD0GHEQ+yG7MhLy6FoUk1tQEXOqYsl8s2kSQJr8Lx2b+kmg+K+9Ue+ctKz+uAZ5i+yqMEeKsU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0U1V1lDd1Y4SmQ0K0hwOUEwdlNrR2hlcDlSRkdnNEhBNVpxN0VYM3VrK1dr?=
 =?utf-8?B?T2Z1L0t5K0JyQVM0SUFHQk93R2M3SUVNT01xUXpkbEdQYTB3TlZxcDlzeXRR?=
 =?utf-8?B?Uk5raWdjWG1CRHlRLzRyMHBtaWRmc2hhYjR5UmMxS0JoWGlrZWNQTUxDVENF?=
 =?utf-8?B?UUhGTVlGSktpM0RDZCtWVUQ3aFU3VkJFNXM5OFBVU0RUekp2by9sQmV2bzBC?=
 =?utf-8?B?b253VnQwdTEyYnArWC92OUJDVkZtU1BqbndvWnpPY2FIYktZQmU5Yzdubndn?=
 =?utf-8?B?ejNjazhCOW1KVGFMdDNyYldxYzdadTYrR3licTNkWGtIUlUrVFFvYWZiYkN2?=
 =?utf-8?B?TXVkcVFyZ1VreHh3V2FwenJncEtOSldOd1hBUVE4cjZ2ZnRtcmZhd1lwcGU2?=
 =?utf-8?B?NjBVSE1GUWg4TGZnaUcrQmRtR0NrOG1GYkVXNnNkOTZVblp2Zko1M3VTL0NO?=
 =?utf-8?B?ZFE1MkJUUXM0bzRYQ2g5bnpDT0xOQ2N5ZzBiYm81WENGc3MzVVZneTlhd1Rq?=
 =?utf-8?B?bkprb3oxQVZrMWlyb2QwU1g2VzdEaysxaUtGUjljcmR2TVNKcU5qTU9mRTQz?=
 =?utf-8?B?bkVBRkZkVlYza3lOMWRFbE1oZkp1TmE3azdoTDJLRi95MFhCZVl5R3VzbGhN?=
 =?utf-8?B?ZzRRQ3o5WUc1QlFMWlc0Uk55Z2RwQUV5dU9YNTZEckVGa0s4QVJJaDBXOHov?=
 =?utf-8?B?LzhzSWV1bEVwbWJIZDNjZ0JrSzFBTjExak9hMDEvdVdtamRJTHV3M1VvR2R0?=
 =?utf-8?B?WURxTnpNaVBra290aE5wUzVqVGxzcG9HZS84K2dBcnowNzE1bUo0ZXFUVURq?=
 =?utf-8?B?NEs2cFlVbDFPbG8wZnJtaXdHM1h3NW9EOTdoWDJyWWhlbUFpNG03dXFCU2ln?=
 =?utf-8?B?akYzR3l3N0VtWnc5Yjlpa2Z2TXV1MUVFeVpRb3hSQWdEdGR0TFhaR1dXdVlR?=
 =?utf-8?B?NENmUHNCQ00yUEZBeHlqcmNENmVwdEQxbHVSTCsyeFp2WTQrK29GUkEyd3BX?=
 =?utf-8?B?cnRpNHVzVTNtZVZzRXZSdzBONzBCMXlzbEJGc0VKVUdpY1JlcHVtRWdoSzc5?=
 =?utf-8?B?MG5HRkg3dVNDNWJGc3VRK2FRS1p1eldkdW16Y21WNGhXdVFjdFVQalA2TFFN?=
 =?utf-8?B?RUM2c2t0NGhnaS9jWS9vOHRzVXRSWGo2YXFBcVF0NmYxY2FWRVhwMmJ5QkpT?=
 =?utf-8?B?TDhlTCt0dUJ1Mko5Uit0ejM3aHFraFk0UVc0NlljalU5ZW5IY1B6emNMV3Fr?=
 =?utf-8?B?RisxbXd6M3RWNEg0RmVZS3psdDM5allCK3Q5K25qakJJNE5rTnhHaXA3Wk44?=
 =?utf-8?B?UnVISytWcnpaajcvcVZCQi9OSDdYc1pzSjc1UkNrWWVONmU3RFJYRXBsUU9C?=
 =?utf-8?B?RWpSdSt3MklzbnN2SDg2VC9rRzV3R0diY3hYSXE4OWt6S2d1cThHNTRYWHZP?=
 =?utf-8?B?MDlOZ1FsK1d0SE1zR0xoYVByMllRQVJZQWVxTjRJRHl4Yi8xSkx6TlJRc2Q1?=
 =?utf-8?B?YTBnUWtNeGlNaCs4K2gwME00TzdQQ1Z1T20zTGYzT1lpWVdBUXV2WFNXWlNT?=
 =?utf-8?B?czdTTHpzaCtYcllvTDlmTXFxTmVDMnR1Um5xdWw0SDcxeEV2TXZiQXJYb3U4?=
 =?utf-8?B?NThjdXNGVGdEVnAxd1NHV3kzdEhWbWRPOGJFS2MzLzdlYkE5KzJ3SkxrQzRq?=
 =?utf-8?B?TWdlS1hocUVPYVA4clVUcUdPM05XQnRsY1VsWXgxbjEvQjJNZzMydlpmeEdF?=
 =?utf-8?B?WnRMbG9BNVRJT0pSSjZadE9KeTFLOTVTaXh1dzcxZFUybytxNXlZUmVXeStF?=
 =?utf-8?B?eC8zb2grYVNzYVF5T0FBMWpnRjA2Mmt1OG1FYnR0SFE4dStWZ3hHbU1hU3V2?=
 =?utf-8?B?bFk1ckllTnBKdjArQ1Y2SHFQM1p4Z0JqRklKeW1PRjVEZ3ZHOFdwNnJDOCtr?=
 =?utf-8?B?OTJ5ODFaMi9GSHpPQ2NKK2NtUUt4UjYwV1hOclNwVEh3ME1PcWVvcFhHZ1hS?=
 =?utf-8?B?Q2poMGt0dDlzLzFRcFdoYVROOHBmVDZJaS9XaWcrc1pEeWozQzM4bklmWW4y?=
 =?utf-8?B?cmlPb01LWUFRMHlhVmRoeitXUW5CNEt1TFprSk9uMEV5N29YdHBqQ1BDT3Ri?=
 =?utf-8?B?dVpDTnRkYnJGVVdaL3N4M1FUMFhiYk15UTVIOVBYNThTTEFlbkhQazZzcmc2?=
 =?utf-8?Q?bFrgC9NTLS1Gysq8VTQ28Rk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <23F82FC31D9FAD45B31BD5E7B8C67AB9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 106be58a-5e3e-423e-24c3-08dc4e592726
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2024 12:26:39.5523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUshLFQ+kCQ3sau4uDgIaR0csRCY6CaiD6fq6FtJNA1acgIv+MhpCS7KcnQCxcXHG3ioXRCrcGislPRNhrPyDXeyy6MzcDCdl9kxHhiNJBQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5858
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

T24gV2VkLCAyMDI0LTAzLTI3IGF0IDA3OjQ3ICswMjAwLCBKb3VuaSBIw7ZnYW5kZXIgd3JvdGU6
Cj4gV2FfMTQwMTYyOTE3MSBpcyBkaXNhYmxpbmcgRkJDIGlmIFBTUiBpcyBlbmFibGVkLiBDaGVj
ayB0aGlzIGZyb20gRkJDCj4gZGVidWdmcyBpbnRlcmZhY2UgYW5kIHNraXAgY3VycmVudCB0ZXN0
IGlmIEZCQyBpcyBkaXNhYmxlZCBkdWUgdG8KPiBXYV8xNDAxNjI5MTcxMy4KPiAKPiBDbG9zZXM6
IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaW50ZWwvLS9pc3N1ZXMvOTUyNQo+
IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29t
Pgo+IC0tLQo+IMKgdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCA5ICsr
KysrKysrKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKUmV2aWV3ZWQtYnk6
IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmluZGFwaWxsYWlAaW50ZWwuY29tPgoKPiAK
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90
ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwo+IGluZGV4IGRiMmRiMGZmMS4u
NmQ1Mzk1YTBjIDEwMDY0NAo+IC0tLSBhL3Rlc3RzL2ludGVsL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKPiBA
QCAtMjAyNSw2ICsyMDI1LDE0IEBAIHN0YXRpYyBib29sIGZiY19tb2RlX3Rvb19sYXJnZSh2b2lk
KQo+IMKgwqDCoMKgwqDCoMKgwqByZXR1cm4gc3Ryc3RyKGJ1ZiwgIkZCQyBkaXNhYmxlZDogbW9k
ZSB0b28gbGFyZ2UgZm9yIGNvbXByZXNzaW9uXG4iKTsKPiDCoH0KPiDCoAo+ICtzdGF0aWMgYm9v
bCBmYmNfcHNyX25vdF9wb3NzaWJsZSh2b2lkKQo+ICt7Cj4gK8KgwqDCoMKgwqDCoMKgY2hhciBi
dWZbMTI4XTsKPiArCj4gK8KgwqDCoMKgwqDCoMKgZGVidWdmc19yZWFkX2NydGMoImk5MTVfZmJj
X3N0YXR1cyIsIGJ1Zik7Cj4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIHN0cnN0cihidWYsICJGQkMg
ZGlzYWJsZWQ6IFBTUjEgZW5hYmxlZCAoV2FfMTQwMTYyOTE3MTMpIik7Cj4gK30KPiArCj4gwqBz
dGF0aWMgYm9vbCBmYmNfZW5hYmxlX3Blcl9wbGFuZShpbnQgcGxhbmVfaW5kZXgsIGVudW0gcGlw
ZSBwaXBlKQo+IMKgewo+IMKgwqDCoMKgwqDCoMKgwqBjaGFyIGJ1ZltQQVRIX01BWF07Cj4gQEAg
LTI2OTksNiArMjcwNyw3IEBAIHN0YXRpYyB2b2lkIGRvX3N0YXR1c19hc3NlcnRpb25zKGludCBm
bGFncykKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9yZXF1aXJlKCFmYmNf
bm90X2Vub3VnaF9zdG9sZW4oKSk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBp
Z3RfcmVxdWlyZSghZmJjX3N0cmlkZV9ub3Rfc3VwcG9ydGVkKCkpOwo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoIWZiY19tb2RlX3Rvb19sYXJnZSgpKTsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWd0X3JlcXVpcmUoIWZiY19wc3Jfbm90X3Bv
c3NpYmxlKCkpOwo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCFpbnRlbF9m
YmNfd2FpdF91bnRpbF9lbmFibGVkKGRybS5mZCwgcHJpbV9tb2RlX3BhcmFtcy5waXBlKSkgewo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlndF9hc3Nl
cnRfZihpbnRlbF9mYmNfaXNfZW5hYmxlZChkcm0uZmQsCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHByaW1fbW9kZV9wYXJhbXMucGlwZSwKCg==
