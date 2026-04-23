Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1261FFAD40D
	for <igt-dev@archiver.kernel.org>; Thu, 23 Apr 2026 05:47:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B975C10E2F2;
	Thu, 23 Apr 2026 05:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hCzBajhH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB59D10E2F2
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Apr 2026 05:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776923238; x=1808459238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/41AzgHaolljUBqkeBA84WgP31jVBaFcbY8Qbunf9VM=;
 b=hCzBajhHN60Ww0mb1DKW7HjsHp84kEA8btVsszttHGN/3PfpwwQZucQ3
 wz/hP8BHKTFl2Xu1UkL6f6hqNhyncW3hCZ588li1owyYcViRk4FLwsivl
 gpuZQSENczdmIdZaW4LwxsWsAmbk6uQehoYZCuEXv1iUu4WS+YfQQGcWP
 V8yW9YNwUONNR6Kmab0kenyDTXRqu/hgLiHPiQ8jgf89Hs56y4i+ie6OV
 /9mOExCku9SCkVn/+gdH4d4UEHO2SuyQMBvwo39Dg/AuhefLpbjh3YYQE
 eYg6sJ1O7oxqnpo4gxJdeG0sAfOixY9M8vWvanJcOIjIk5TjY9STSivTQ Q==;
X-CSE-ConnectionGUID: 97+jOLPiQDq4/b/+thm7IQ==
X-CSE-MsgGUID: yCgheeTuTAywO6ftF+t4Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77767298"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="77767298"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 22:47:18 -0700
X-CSE-ConnectionGUID: wYugN1jTRQiQQ4F6+/5q1w==
X-CSE-MsgGUID: 9QCHzggeQA+t9ener8KqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; d="scan'208";a="228214278"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2026 22:47:18 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 22:47:17 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 22 Apr 2026 22:47:17 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 22 Apr 2026 22:47:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gB5B54JQ5TsL6gBLFeEBavrvJPiz/I1SkKHMXHr/jlYG2Gj2mi53a+eluzN9Zm5X0ebHp72pFrJ3kDUSNm6gqZ9lnrI75FH0GCDvd3Ol9TV/S8s+/FeUaMv9Xf1RvnK4avvzR363N5ooBMM7tQCPvOEh3ZHLMrjj9H6Pim81IuueiYub2Lf3vaf8kWVX+Ao8eZuhsKi+g08v2uZKu2kxiP47sc53/tupcihcn44QCpgKfCVA58l/sp7wbFKtyqNLPrUl6497gE8IQSUkC9ms5qoAm0BkKCMpfT0GPjNO//sYRsqvCG31XkLEVuHJMe728FFihnyqm/kN9TsfSYJnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/41AzgHaolljUBqkeBA84WgP31jVBaFcbY8Qbunf9VM=;
 b=KZoJheGV3/AHoOOlbrMNki2L3u0uZNReZFWz7bpMKe7r2SPesXNBmpx4Z7AE2BOBrnuqK5FRab8jXYn0Nh2xSIT65xz76ZyJ6inOf7Db/3tO4Wjq4ib2eUIjazxg6x880A2skIawmEntdwV1JbjH5vOQ8T6Aczm3wPwlmX9tf9FrLllDYonUCRyRNH/ibcci9eaOw4o9NEKbSPwEGYVqzaPBlTZOufiTbLt5ZkIY3112SFXbQ9TVUEgcZiQWCWWDMzd9N+Nome/fbPU+tks+jvOBwIiB2pFDfjxjs4dwAMBGi4DOG/xTAhjmIPBZb2w/MK4VkJ6/t0Rfvj6EtbcR0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB7907.namprd11.prod.outlook.com (2603:10b6:8:db::13) by
 CY8PR11MB7732.namprd11.prod.outlook.com (2603:10b6:930:71::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.21; Thu, 23 Apr 2026 05:47:14 +0000
Received: from DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809]) by DS7PR11MB7907.namprd11.prod.outlook.com
 ([fe80::12f4:5e22:c1b2:3809%6]) with mapi id 15.20.9846.016; Thu, 23 Apr 2026
 05:47:14 +0000
From: "Piatkowski, Dominik Karol" <dominik.karol.piatkowski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Hajda, Andrzej" <andrzej.hajda@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "B S, Karthik" <karthik.b.s@intel.com>
Subject: RE: [PATCH i-g-t] tests/meson: Move Xe experimental info to Xe EUdebug
Thread-Topic: [PATCH i-g-t] tests/meson: Move Xe experimental info to Xe
 EUdebug
Thread-Index: AQHc0nVu9Nm9VhCSlEqb5lYDt9ehhbXsJCUg
Date: Thu, 23 Apr 2026 05:47:13 +0000
Message-ID: <DS7PR11MB79077BAAAC4245A88FE5A20FD92A2@DS7PR11MB7907.namprd11.prod.outlook.com>
References: <20260422163043.153991-1-kamil.konieczny@linux.intel.com>
In-Reply-To: <20260422163043.153991-1-kamil.konieczny@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB7907:EE_|CY8PR11MB7732:EE_
x-ms-office365-filtering-correlation-id: 1c811154-5a99-475e-0903-08dea0fbc554
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info: B1GIpE39hW1KQawlZIsabYcq+852wg2l3xMnEL20BazhDrFm/y8M1vodhHnK3bOgOQ9y2dvFHXfVYAH8QQd2RRZyzeyQw4go2tPBwHduKXuOmfc9a7aMHf+uzcLGUMnf1UQ6MMfF4J43gD/9buBz6eLaFdX/MTVbxAM9f2gGykWxNtJ9Yb9usB5oFwTa1zAfQnkf5H/LyegJmpBcI5lRSMZlMMkqZHZPwRvAwPnAhcLg4+08yFKAYwoRyxYokLYpPHZjjbgr5cpediGCOZ8ciASBdQWumxvQndRBfkTMmCkHZZIOt5HmYq3Jt0d/TGd5rufJD+GAbAy5QK/d1up2Qv9QAFeAfCR2irIvlp/jdyXbJWMtmJiFalrZogyoLmSaHXD453kOA2IeAk5qcVyUa0tgWwBHtkf8XrxOl5+Ypek4llpejpvD84omI0na9+O8BbxrRYTsFZwNUYx/9kNqMDkJTqNTFmVM+NItguzDe/j01WT/Q3ZF32wFPLgRkxBh6MbXf1v1bMNNOWET7y7wm3F/PHMC1OZ9zYHUl2XMk2WVJsA0HUPH7YOsgtcO7rAAsEagR0XCaAe5nRjosg49MzOQkMeyZkO0LF/T1mII0W0aJjfIA6NvLt/i7ajjDqNaC3nUTn2DDFI6bBkE7dkWqdPO/v9mdru4EheeoA5p2Pe8THcoajLfISMjKLzL4bP2QpcXz3jePSJtwlgGC4mVYSHhyUiq69y7q1YV1BEE0FOt//kXjJeX143QRhwaB8aEH4Pr3uhw7jzfworoVrb5BHKlLYd2HSw3kUSAY3dEUrg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7907.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RlNpZDBEZkVTZnUyZnJzYVlySmJpZSs1NFBScE9sU0RuMzhmdzlmcC9KSlMr?=
 =?utf-8?B?YWVMbDN4UnFkZUZ2REg5NU9SRHdnSmxBOENHTVVtcFlVcDVuWkU3WHl0ejRT?=
 =?utf-8?B?M2QzZUg4V3BJU1R0M24xVzFqSjhjRXpvRVZQeUh0b2pTSEhWTERsZFlyaFVC?=
 =?utf-8?B?SDU0RU1TTFV4ZjFpVjFWdUFwMTAyVVdpck5KTEFlTWxjZE1wRlk3YXh4UTZN?=
 =?utf-8?B?ZjNFb1A0SDd5d0xQbk5MNkM5M1lEbC9VK0dpVS9rKzFzcWxpeXZoRHNjWTRU?=
 =?utf-8?B?cmhLR3g2YTVaZWZWMGxjanJkSFEvV3FQL2Q0d0dMdVBEdG5TS1F4RXVJR3pp?=
 =?utf-8?B?VWJKUVNub0tucW5tQjJndG96MXAwdklwZW9xb3p4UUdiaHh4UlVhUU5FUFdl?=
 =?utf-8?B?QUlmRGlaRWhNd3FLWG10dElabktHRGVXTXhEMXc5WUdHaDYyT3BmL2dkS0Fa?=
 =?utf-8?B?c3VhU3BHSHV4bE13VVUrUTZ2RkFYd3lIVEI0SE9aV0cxZC82VTdKZGtVYmRh?=
 =?utf-8?B?UzhrRkdXWDhDTEtIS2hxc1FBQWl3YVcvWHN2VVVXdmhlNUtKRG5QdzA5U2kv?=
 =?utf-8?B?dFEyWjRNOE5mOCtyYnpWeGpYU3B5L0Q0VllOditEVGJ0SGNiMFhkQ0JCWjYz?=
 =?utf-8?B?ZjcxaEhVTTNuMk9ad05aZUV3akZCQ1cxMnhRY3B5d0gwQkFtSzNkd1lMNEFD?=
 =?utf-8?B?RHZVTGxGOTJ1VXVMNUJuV1VvVFRtbDJBQWM2ZUF4RlMrcjMxRXZBdUl4NGhE?=
 =?utf-8?B?T0ZNVnIwVjRlTjNwUkQ1WTREempJZW85TDhkZTNuQ3k3RDFMcEhuRkdDMktZ?=
 =?utf-8?B?WHhFMHB2dlpNa1hGWXNOZjZHQm5LNVJMU0NKamtqR0tia1FoWUluZXdqcUNm?=
 =?utf-8?B?VVFoSXA0UGtpYVNQMjgyVHRVZUFjeHByVUowejhpeFBzTmF2bmp3WmhpM2lz?=
 =?utf-8?B?UTRKRXBHMGh2UmVGc0VqTHFlTHFMRVVrUE4rR2w3S1g3Y0xzSUxNMHZHRnkx?=
 =?utf-8?B?Z21na21DTEVuMWFtclVJNUJMcTlwbktyL0dKTTYwS3VkTW12bkpnWTc1T3A3?=
 =?utf-8?B?cW5XWUVZSWRkNW04cmhKUFRpL2NhVGx3MnVyV1hjeXY3THg4NXA1d0ZpMnFM?=
 =?utf-8?B?RnhHaDh5cU5GWlo1QnBERit6dU1XeUxHc2djWGkwOE1rUHVMczBtT2xUNlNY?=
 =?utf-8?B?Y2RxT21uSys3UVZWanRxYnl0Z0lJQ0VrUElla1FOaW5sUW5oOXBWOE5XeENJ?=
 =?utf-8?B?bE9iTFNqSnhnVW41M3VzRnpSQXVtWTVXTUhYOWlKNHF1d1Q5YzduZ1Z5YlZ5?=
 =?utf-8?B?OUtSdHhEUk04OHI2SjFxdlJJSy9pSG9HbUJ1QXh2WFVCZ0I3ZGVpa1hvYUR4?=
 =?utf-8?B?V1l4VlhoVHZ1L2pNVWlnUXRjaitvZFpqMnB5MHNCZmxMTFAzcjFNQ280akth?=
 =?utf-8?B?N0tmd3d4c0pNQSsxRHVxRzdmVm1oN3hxcWdyNHFOVnQ4bWo4eFJnUW8ybnJX?=
 =?utf-8?B?TVhDMjJVS1RDS3dEYkwvSllobzlXc1paWVRzckludmRvYitYVHVpYkt6Y2Y5?=
 =?utf-8?B?ZmRzK3RHcnFhU0ZiRDhLQTE4N2UwNFZqU1EzbGZSbU50WXNDUEFpeS95bDB3?=
 =?utf-8?B?d3NhRVVvTkgrc3dOOTJURllXTi9GRjFPTWZQb1hwSUhhUDJrRW0yMXZsZ3Y0?=
 =?utf-8?B?ZTRyNkM0SHJrdWY1b2JsSmJrTU5CUERJZG1FbVAvVHBiTmpja251cjNSQ2pw?=
 =?utf-8?B?VnJzMEhIeE9HTHRpcElyb25mLzZjVTN4ZVViS2Nod3dhYjJyMzQySzdEYWN5?=
 =?utf-8?B?NE5OL3RzRXFzMXJUQms2Y0V2RUtQWXlPV3RuTzJpVENGK2ExeS9HbHcvdjI0?=
 =?utf-8?B?b0wyQXpCWlkxR1VDaWhMQ2VBcFB0czVFbmY4blVHaTlmc3BtTU1OdXFETWZ5?=
 =?utf-8?B?U055TVFXNWxVa3BIdWh5ZUtBcHJmVW1Od0dQWGNvQTFFOFFYUmFBWHF5dmlh?=
 =?utf-8?B?Y2hvVXZuaFZWRzFINkovTU45TE9ndS9MLzRMcjFIbzRWRHpBeHBCcVg1dzdH?=
 =?utf-8?B?ZllJUmc2RElaNWZpalpDVS9qT3lYWS9qWitBVk9iMm1NR0VUT2xyakNNWTU5?=
 =?utf-8?B?ZUJUZGU1SXo5VWNVcTQxU2drejhhNkZkVlhjUnh3djV2ZTVVM1JXNEdlM0s2?=
 =?utf-8?B?YlpmNHlTVHdXVS9paHhTajYxYldDYVdGMlVZcUw0NjhtZE5ldWZoRWpHRUlG?=
 =?utf-8?B?US9vUjltYlE4QlVncThONTR6ak5qT3pJQ1VQRGhaQjFScCtWeHFxTkx4cnRO?=
 =?utf-8?B?cHlsTHFOVlRkaytlNzJQRWtVR1lWalFKWWtNUytyYTc4QkZXNHgrNDBkQWo1?=
 =?utf-8?Q?1cf7daKZGM1744j0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: aPN4uH6g0As2ZKvpKo5EqVSO6oPrF6A94UY9LZ7fK3Vxk/dW8uX93Qhzc98KmtT4iW/Xl9bQnCXqCRbiOBnegI7JyV/nWrX2RGq3p2XVma+xbSRTu6MTw4WlfVdFzQOzel+Y2Zd9DkYbnqRyvwQCbwOlx0ti3+vDmWS+nS9QkovWG8P7kNdiv491UwNfi6uzxoq0w9zmt+PgkT320cOYS3wTbsGG0HWmMFzryYegmIjxJ2n7nQy324oVymo/sdl6WzV4gXs9iyvFZYLU10Z7tr8LgYjFIgja3L4gUCq1nwvarGt7slZ1nIVd010R6ol48q6kna2dfeY8MkgVmMWftw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7907.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c811154-5a99-475e-0903-08dea0fbc554
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2026 05:47:14.0746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l3LipZwkugts6/0ycsaImVct5kn28XUz3iav+Dsl2UY8WP22Kf2MBHD1PnexaAJDJFb0RT9+6xHdHBTICvtXfrgqbsQAWUd+BcFlQYJOrdy1Q39stW+SuOk2vSUZyaS5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7732
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

UmV2aWV3ZWQtYnk6IERvbWluaWsgS2Fyb2wgUGnEhXRrb3dza2kgPGRvbWluaWsua2Fyb2wucGlh
dGtvd3NraUBpbnRlbC5jb20+DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJv
bTogS2FtaWwgS29uaWVjem55IDxrYW1pbC5rb25pZWN6bnlAbGludXguaW50ZWwuY29tPg0KPiBT
ZW50OiBXZWRuZXNkYXksIEFwcmlsIDIyLCAyMDI2IDY6MzEgUE0NCj4gVG86IGlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmllY3pu
eUBsaW51eC5pbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplag0KPiA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+OyBEaXhpdCwgQXNodXRvc2ggPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT47DQo+IFBp
YXRrb3dza2ksIERvbWluaWsgS2Fyb2wgPGRvbWluaWsua2Fyb2wucGlhdGtvd3NraUBpbnRlbC5j
b20+OyBCIFMsIEthcnRoaWsNCj4gPGthcnRoaWsuYi5zQGludGVsLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIIGktZy10XSB0ZXN0cy9tZXNvbjogTW92ZSBYZSBleHBlcmltZW50YWwgaW5mbyB0byBY
ZSBFVWRlYnVnDQo+IA0KPiBYZSB0ZXN0cyBhcmUgbm8gbG9uZ2VyIGV4cGVyaW1lbnRhbCBzbyBy
ZW1vdmUgaXQgZnJvbSBYZSBidWlsZHMNCj4gYW5kIG1vdmUgdGhpcyBpbmZvIGludG8gWGUgRVVk
ZWJ1ZyBidWlsZHMuDQo+IA0KPiBDYzogQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+DQo+IENjOiBBc2h1dG9zaCBEaXhpdCA8YXNodXRvc2guZGl4aXRAaW50ZWwuY29tPg0K
PiBDYzogRG9taW5payBLYXJvbCBQacSFdGtvd3NraSA8ZG9taW5pay5rYXJvbC5waWF0a293c2tp
QGludGVsLmNvbT4NCj4gQ2M6IEthcnRoaWsgQiBTIDxrYXJ0aGlrLmIuc0BpbnRlbC5jb20+DQo+
IFNpZ25lZC1vZmYtYnk6IEthbWlsIEtvbmllY3pueSA8a2FtaWwua29uaWVjem55QGxpbnV4Lmlu
dGVsLmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9tZXNvbi5idWlsZCB8IDIgKy0NCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L3Rlc3RzL21lc29uLmJ1aWxkIGIvdGVzdHMvbWVzb24uYnVpbGQNCj4gaW5kZXggNGMxYTM5ZTll
Li42MGNlYTNhYTggMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL21lc29uLmJ1aWxkDQo+ICsrKyBiL3Rl
c3RzL21lc29uLmJ1aWxkDQo+IEBAIC0zNTksNiArMzU5LDcgQEAgaW50ZWxfeGVfZXVkZWJ1Z19w
cm9ncyA9IFsNCj4gIF0NCj4gDQo+ICBpZiBidWlsZF94ZV9ldWRlYnVnDQo+ICsJYnVpbGRfaW5m
byArPSAnWGUgRVVkZWJ1ZyAqKmV4cGVyaW1lbnRhbCoqIHRlc3RzIGVuYWJsZWQuJw0KPiAgCWlu
dGVsX3hlX3Byb2dzICs9IGludGVsX3hlX2V1ZGVidWdfcHJvZ3MNCj4gIGVuZGlmDQo+IA0KPiBA
QCAtNDU1LDcgKzQ1Niw2IEBAIGVuZGZvcmVhY2gNCj4gIGludGVsX3Byb2dzID0gaW50ZWxfaTkx
NV94ZV9wcm9ncw0KPiAgaW50ZWxfcHJvZ3MgKz0gaW50ZWxfaTkxNV9wcm9ncyArIGludGVsX2tt
c19wcm9ncw0KPiAgaWYgYnVpbGRfeGUNCj4gLQlidWlsZF9pbmZvICs9ICdYZSAqKmV4cGVyaW1l
bnRhbCoqIHRlc3RzIGVuYWJsZWQuJw0KPiAgCWludGVsX3Byb2dzICs9IGludGVsX3hlX3Byb2dz
DQo+ICBlbmRpZg0KPiANCj4gLS0NCj4gMi41NC4wDQoNCg==
