Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECACC48BF6
	for <igt-dev@archiver.kernel.org>; Thu,  7 Mar 2024 08:39:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36C0710EF32;
	Thu,  7 Mar 2024 08:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JaaymjG/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3FDF10EF2F
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2024 08:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800738; x=1741336738;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kLBRsCO7Avm/OahNHjrA+gzThoaXP2zsJWokbQN493w=;
 b=JaaymjG/HhYC70ekvAP3dgcCT3wKXhoxXg9N6wqx3pY3YDcux6kPv8Ro
 dQcuVzLNiuZ7KxvkJuofCw0BWsgrK8Z+K6dQUVaS+kU1/9Z2u8nqymK25
 knh5rcGh7dDX4zMT2ArlwvnPUXBXeXKbHKMf0A/9/4c6XOQvQq+iHgEOq
 o2Bqzf1gIldzPYPvd6DtOYznrbzNjbcTlEaz4Umn5hYbN8x0s3RUtHS2S
 057tEAJG6FJYLk7Uv+0xVAMe22/8kleSpkYgapBRyHXOHkp/4wOS48A85
 eYPc6aAWHDbOSH4kAPXHMJloLuKhmCDM3FGQ+mTqPBLWxnCpGHRQvQIfL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="15598579"
X-IronPort-AV: E=Sophos;i="6.06,211,1705392000"; d="scan'208";a="15598579"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:38:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; 
   d="scan'208";a="9938729"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 00:38:58 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 00:38:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 00:38:57 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 00:38:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OvM4Fj05KadCEnaVbwF1jQpQAlwKpy6wN2Gqty6/LwfePrjV4AStCSenZ6Jeank1DtWQFPtfQKoeJNLQlC+PJPWOG2RccuJaXurFnrH/arrNvYyTggYO9LEO7OEzJKQof/mFfCUlpMrjClEfUx1wdsdXW7QtccqFekBwRUTMUr0ZK0cswsUWlGNePe4657u7mArXaRwFmB2aUAXjbAU4C4CsclDTGIgYLK9RmYggsJQjAnp5+URF37qfa67b9CerPwJodZELCJwr8MMl1aqFujgaoqEcS/Kk41kHPsMjoz6Pao8SBPMuNE2YdrpUsKkRLw5A9YrykXdlDAT+ArwyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLBRsCO7Avm/OahNHjrA+gzThoaXP2zsJWokbQN493w=;
 b=B4qFotzEG3N04CZCyeuegJPaQvr4yl0N3Gq8yLWWxnCPLKph5TcKdBrXzekhdymBCpwCCzxF568tqNFvTUM88e3rlZuZzCaonkkbrZTUNgFVDqfK2/PPn1qiOOm3rye8qG4lta48/vJfG3lF51igrfvoVw5FRQQMtlaIFgjdyW4RPAP4wvQNneZ877BtJEROW2fy4YTMIH3UazQbP+ZzFQo1eUiItxnJERGhJeutSq0MeKMwvkbIy0uDwIxHt100ufR0RFjjNNXT4W+5eJI5Hjqrim6FFAE2ni02I5Pyh5mk6kh+uM0onGdIxRsk9YAsZ9GFdnvP/ycxYZ6ug+2mtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by LV8PR11MB8679.namprd11.prod.outlook.com (2603:10b6:408:1f9::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.9; Thu, 7 Mar
 2024 08:38:55 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 08:38:55 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Chris
 Wilson" <chris@chris-wilson.co.uk>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>
Subject: RE: [PATCH i-g-t 06/24] tests/intel: Introduce Context subcategory
Thread-Topic: [PATCH i-g-t 06/24] tests/intel: Introduce Context subcategory
Thread-Index: AQHabiWU09lD3htHnECNlKgDTsFgl7EnrswAgARKawA=
Date: Thu, 7 Mar 2024 08:38:55 +0000
Message-ID: <IA1PR11MB6097336B67B95A5D6E35E4EC86202@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240304111617.849785-1-katarzyna.piecielska@intel.com>
 <20240304111617.849785-7-katarzyna.piecielska@intel.com>
 <20240304160634.0327dc48@maurocar-mobl2>
In-Reply-To: <20240304160634.0327dc48@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|LV8PR11MB8679:EE_
x-ms-office365-filtering-correlation-id: 546238d1-3123-4905-4b0c-08dc3e820669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Eyn94lxJAfF25LSMj6vkx19PXMup8jcPLoJWOmHMXYX4BqBHEoYAJ/qpyrm+z0dK6u8AgDAKavLGSePXKKt564JZzQpgCSTLszhmZpmqwBbmMeI8JkHybEuvTc8nXOFhAQZmWhV5jzXXm1+5sMG+zoKZJROwCrk1CkenCN9OYvwGLNLUYXs6fPNGmmfc1BFSFkO5Yzit3NFFjV4fCyz+QrLZRq6bO9R0FrTc78g4MdlupqduPJ085rAhb7dUAQDyPYvApsCsMB+noEoDMS0yI0Sltj+f6j9gA66N+sEJPe6xsdiRYGWs3IypGset+wQ9xYqr1QZ4cUKxIeXd/oLdTqoWLcoIWYUbR3+M++7M1GG2ESuZhTr1ApMl+NXb3Rd981n1i1DduG/XsRIrqS5cIFJ1W252lLcRmiDb6vwL7dUqptT8chW3A7NGsYP2fC16XDzdy1r3SoQoKKKRAoavFkE9eP7rcTXRnu7wha6Asf8mhl4sRP3dC7TWj3WZ9weTVoxFiYmU2Fl8qPSb8kJ8YQXk31Mb6eb+qPNYSO6ZATwCltM+OiQq85RkhX/CYVIIMF/sJaGZCv7yUGm1Dst2GvDQuShi7q9WcPfMXmqc8G+B/us66RlFCXYs3KaI5CmDHkaLa2W7Vx3l/rotZwkl51pWu3EOnVhXmRt3IfGHD1wA7akO59hU8CqWZ1V10yJJZGUslh1GT6IZyIYTMKV4DA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QWlLMi9LamMzTkVteU1HVnMzQzVQSGNXNCtCTWZJNDVqa3praGZkbTZpN1Uy?=
 =?utf-8?B?WnQ1U3Z1SnZiUlBDY0EwclRzUnNwU2d1WXl3angxNTdyeGVUb1hKNkIrdjZj?=
 =?utf-8?B?RDJvK3V1UnR2bU1KVlJ6bExTWWI1OXhHMFJoNGhxaXVkZUp1L0Z0WG1jSjQ0?=
 =?utf-8?B?d1E2R2hUWXVpNGhWSE4yT0pxbUFqSkZRcEo5dUtaQUhWc0JVOXMrckZzRUJL?=
 =?utf-8?B?Z3ZNOXVJejZWamo3Z0F6ME0xNm5ybHBJdk9MNE9TaWthUTJFQlk1SzZZU2do?=
 =?utf-8?B?ZjU0eTVCOTVaOVRHNmt5RmxsYkZnOTZZOFQ2RlVFbnpWTDZNeTdENERVNk9Z?=
 =?utf-8?B?QnRhVU5rREdiK0NwaERvc2R0cUNiL20vWlRwRnlCRTVZQkNRcklEN1dsWUVX?=
 =?utf-8?B?NUYybmViRGY1R3E5QTVURTNSaTluQndMb2VCVkNGMVMrN05VRzIxMFF2ODdU?=
 =?utf-8?B?bkJ6TUJvS21GNU1LYm9IV1Zma1h4WlFJY1FvWlFiL1B2Z1Z0Q0hUM1FGSG54?=
 =?utf-8?B?aDlGNWQ3WW9aUFpmTDlIZUFrRkg1QWxBQW9aTCtjcXdqTU9wT25TWWJ6RlEr?=
 =?utf-8?B?eHhsNk56N1UwRlhrcWd4clc4bkJaMG5YOE9BQ3oyZkZ1dGdkV1pnNmhOK1Nk?=
 =?utf-8?B?S1BBVWFPd3djcmZyRDNmQ1FRL2s1S0tiSWVwTTZhR2E4cHppbjZQZ21PbFlK?=
 =?utf-8?B?OThJVENtNWJ2NFhZTzE4R3ZZUUdBaXBOK1VYMlZ6NGE3VEhBMmd4anVwS0dY?=
 =?utf-8?B?UE9MYzlTU3plNkpjc2p5MmJFcDBrWk4wczY5c29rMmJJdVp4MEd2QXZ6WUcr?=
 =?utf-8?B?VE5RUXZ1cmpkUHFnaGFLekRFQS93SXJESlMxYVVhZGZ5TmdobWR3SFFEcXBv?=
 =?utf-8?B?QjVReFUvVkR0NitwSTR6dWROVmpYbVo4MFhpMzFxL3BNaTd4L3pnMjkxa09Q?=
 =?utf-8?B?MjJleVlLSTFKNjVpbzdYMjhybXZ6amNLd2liQ25YNEdncUtZT1JLemZReC9L?=
 =?utf-8?B?RGsrL21xWWsvVGlUaUIzdU1WeFVLbUZYZ3crNDdjeVlsbWt0eVo5ZEU4bERF?=
 =?utf-8?B?eFk0RGdKcUExVkFHQjRQc1hETSsyMVNSKzJyQmlGSi91cXJRbDR0bUVKNXRL?=
 =?utf-8?B?cThibjYzK3R6UEx1a3dURmUxVnpNZVliRDhsTC9iVFJnWDk4S05TdEJxRWpR?=
 =?utf-8?B?V2VZbFU1Qms5YWpJWm9SZFVPNytBQ08vbkdzTm5ZbVprSEM0L1lQbkR4Z2hJ?=
 =?utf-8?B?Nkh3NVh0ak5KOWtQTC9NOTIvN2dDZWlRTzk4R0k0cFpkL3FiRXpxcVJTSkVW?=
 =?utf-8?B?eXNjLzR6dTlORmR5Yk8zRmFOWXZzYXJ4ejVxdGFKQWlFMnR6by95WXVJcDNY?=
 =?utf-8?B?ZXpieXZ6YmxDaC9WblZqd0U5Tk13WVVBZWdMNGtwM3JFcGp1ZVhXc1UwMTVX?=
 =?utf-8?B?ZkttMURxSVUrWEpaVjh0WVN6L3FEUG8waUNFNC96bm5iUUg3cGpxMWJYT0E1?=
 =?utf-8?B?am15NU02NnpkK2ZTT3p4bHJrMmFPbUtPZjZ2SUpiQjZZbk1PZ21kaCsyV2t1?=
 =?utf-8?B?TEhla1JISlRyZ2xQKzF5ekd6RUE4VHU4eXFVQUZVNHRFMFN4blg3enFFeGF0?=
 =?utf-8?B?cVpWdXp3QW4rYUdGbXZodWpaVFFsbDcwM2FDSTJER3FDZjU4bytzNGpmOWdJ?=
 =?utf-8?B?QlRWTFdmckF5MkdYOTZpd3ptVEdMRnpYQkh4NHJTNExOZ2hPRjZ0OFJIb3Nk?=
 =?utf-8?B?TnZOeTNWT2NJbG1zSWdWUXQ5VUpmT0dCVUQ1T2I5bERmWWUxZkxhQmxmQUM1?=
 =?utf-8?B?VEZwcWFOYVV6TXNycGlOTkV1cUsydFVMcDJGaHBLUlEveVJ4NFFFd3J6TnBG?=
 =?utf-8?B?UjFsL2x0RUlKTW5kZkVhZVY3dmErMUhOQU5zRTIvaVJBUWEycCs4a2tZTUds?=
 =?utf-8?B?Q2xvU243ek9ZSmtLcnVNaCtqL0tZVTZTclpaOEgzK1R3Lzl1ekxpbThFelVp?=
 =?utf-8?B?UjROc1MvaVJNYzlzaHREUEhUV0h0TllsWWZBYzhlRjR5bEMzb2NtUG9UZzA5?=
 =?utf-8?B?VmhmVG9TMmFwRDd6dGlQc2VjaGxqUkd2NUlCZjZsa3BWUXVCSHNlU21QbTVT?=
 =?utf-8?B?NW12SDJ6WU5Xc3hmMTBhaHhZTGRsMzFxS0tYNXh0N0pNOGR4T2E2N2JQZWZN?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546238d1-3123-4905-4b0c-08dc3e820669
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 08:38:55.3787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XXGOus+F4LZjG9Wx0Gy/OUhU4sHXHfi0vM7RUtsiwH92DbikdQlOM7qT6Nbo4IIEV+eAlHPzE9BVR4xKfevjL6QJzenGqVLGuBWYWq6lUGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8679
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

WW91IGFyZSByaWdodCDwn5iKIEkgd2lsbCBrZWVwIGNvbnRleHQgYXMgZnVuY3Rpb25hbGl0eSBh
bmQgbW92ZSB0aG9zZSB0ZXN0cyB0byBDTUQgc3VibWlzc2lvbi4NClRoZXJlIGFyZSBvdGhlciAn
Q29udGV4dCcgdGVzdHMgdGhhdCBuZWVkIHRvIGJlIGNoYW5nZSAtIEkgd2lsbCBkbyB0aGF0IGFz
IHdlbGwuDQoNCkthc2lhDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBNYXVy
byBDYXJ2YWxobyBDaGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+IA0KU2VudDog
TW9uZGF5LCBNYXJjaCA0LCAyMDI0IDQ6MDcgUE0NClRvOiBQaWVjaWVsc2thLCBLYXRhcnp5bmEg
PGthdGFyenluYS5waWVjaWVsc2thQGludGVsLmNvbT4NCkNjOiBpZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+OyBLYW1p
bCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+OyBEYW5kYW11ZGks
IFByaXlhbmthIDxwcml5YW5rYS5kYW5kYW11ZGlAaW50ZWwuY29tPjsgQ2gsIFNhaSBHb3d0aGFt
IDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIIGktZy10IDA2
LzI0XSB0ZXN0cy9pbnRlbDogSW50cm9kdWNlIENvbnRleHQgc3ViY2F0ZWdvcnkNCg0KT24gTW9u
LCAgNCBNYXIgMjAyNCAxMToxNTo1OSArMDAwMA0KS2F0YXJ6eW5hIFBpZWNpZWxza2EgPGthdGFy
enluYS5waWVjaWVsc2thQGludGVsLmNvbT4gd3JvdGU6DQoNCj4gTGV0J3MgaW50cm9kdWNlIENv
bnRleHQgc3ViY2F0ZWdvcnkuDQoNCg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLYXRhcnp5bmEg
UGllY2llbHNrYSA8a2F0YXJ6eW5hLnBpZWNpZWxza2FAaW50ZWwuY29tPg0KPiBDYzogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+DQo+IENjOiBLYW1pbCBLb25pZWN6bnkg
PGthbWlsLmtvbmllY3pueUBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBQcml5YW5rYSBEYW5kYW11
ZGkgPHByaXlhbmthLmRhbmRhbXVkaUBpbnRlbC5jb20+DQo+IENjOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1hdXJvLmNoZWhhYkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBTYWkgR293dGhhbSBD
aCA8c2FpLmdvd3RoYW0uY2hAaW50ZWwuY29tPg0KPiAtLS0NCj4gIHRlc3RzL2ludGVsL2dlbV9j
dHhfYmFkX2Rlc3Ryb3kuYyB8IDQgKystLQ0KPiAgdGVzdHMvaW50ZWwvZ2VtX2N0eF9lbmdpbmVz
LmMgICAgIHwgNCArKy0tDQo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC9nZW1fY3R4X2JhZF9k
ZXN0cm95LmMgDQo+IGIvdGVzdHMvaW50ZWwvZ2VtX2N0eF9iYWRfZGVzdHJveS5jDQo+IGluZGV4
IDY1ZjZiNTU4My4uYjY1NzVlMmQ4IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9nZW1fY3R4
X2JhZF9kZXN0cm95LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwvZ2VtX2N0eF9iYWRfZGVzdHJveS5j
DQo+IEBAIC0zOSw5ICszOSw5IEBADQo+ICAgKiBDYXRlZ29yeTogSW5mcmFzdHJ1Y3R1cmUNCj4g
ICAqIERlc2NyaXB0aW9uOiBOZWdhdGl2ZSB0ZXN0IGNhc2VzIGZvciBkZXN0cm95IGNvbnRleHRz
Lg0KPiAgICogRmVhdHVyZTogY29udGV4dA0KPiAtICogRnVuY3Rpb25hbGl0eTogY29udGV4dCBt
YW5hZ2VtZW50DQo+ICsgKiBGdW5jdGlvbmFsaXR5OiBjb250ZXh0DQo+ICAgKiBSdW4gdHlwZTog
RlVMTA0KPiAtICogU3ViLWNhdGVnb3J5OiBpOTE1DQo+ICsgKiBTdWItY2F0ZWdvcnk6IENvbnRl
eHQNCg0KQXMgZXhwbGFpbmVkIG9uIHBhdGNoIDMsIGhhdmluZyB0d28gYnVja2V0cyB3aXRoIHRo
ZSBzYW1lIG5hbWUgaXMgY29uZnVzaW5nLg0KDQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBHRU1fTGVn
YWN5DQo+ICAgKg0KPiAgICogU1VCVEVTVDogZG91YmxlLWRlc3Ryb3kNCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL2ludGVsL2dlbV9jdHhfZW5naW5lcy5jIA0KPiBiL3Rlc3RzL2ludGVsL2dlbV9jdHhf
ZW5naW5lcy5jIGluZGV4IDYxNzE4NDk0ZS4uNzU3NzBlMWYxIDEwMDY0NA0KPiAtLS0gYS90ZXN0
cy9pbnRlbC9nZW1fY3R4X2VuZ2luZXMuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9nZW1fY3R4X2Vu
Z2luZXMuYw0KPiBAQCAtNDcsOSArNDcsOSBAQA0KPiAgICogVEVTVDogZ2VtIGN0eCBlbmdpbmVz
DQo+ICAgKiBDYXRlZ29yeTogSW5mcmFzdHJ1Y3R1cmUNCj4gICAqIEZlYXR1cmU6IGNvbnRleHQN
Cj4gLSAqIEZ1bmN0aW9uYWxpdHk6IGNvbnRleHQgbWFuYWdlbWVudA0KPiArICogRnVuY3Rpb25h
bGl0eTogY29udGV4dA0KPiAgICogUnVuIHR5cGU6IEZVTEwNCj4gLSAqIFN1Yi1jYXRlZ29yeTog
aTkxNQ0KPiArICogU3ViLWNhdGVnb3J5OiBDb250ZXh0DQo+ICAgKiBUZXN0IGNhdGVnb3J5OiBH
RU1fTGVnYWN5DQo+ICAgKg0KPiAgICogU1VCVEVTVDogZXhlY3V0ZS1hbGxmb3JvbmUNCg==
