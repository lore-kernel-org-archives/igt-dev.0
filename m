Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB6C5475B
	for <igt-dev@archiver.kernel.org>; Mon, 11 Mar 2024 14:17:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174B10E29A;
	Mon, 11 Mar 2024 14:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wgi5Zypd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0B8710E29A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Mar 2024 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710166652; x=1741702652;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1NeINiX5Ff20jKZcx3KA9Tv6Dh/2mAa/HGejmtUUV+4=;
 b=Wgi5ZypdqEiJvsNdxdumajxoicRyPRujlx4UwVbEvw0NJlJrI47diRtA
 pTJtowX4FnCjZIgQhmJFmPJ5MQKI25GIIt6DXMCHB7YuObxu1JC79clR5
 1NFbrEIvcdpoUjuupEBbDuklSb0QGSxNNqbIweLckx+xy0DE7tQUk5ecX
 4QxYFobBpRLncss8nAqN2vFP4MDEpGnrNxgrfC3DQDvZoQPVyzR24pfoK
 tT3aoG+B00EDgKrOTMJ6YP367R/rxP2+jelTKU3ntV9/YPOWhByzrgZMp
 LI7yBZxo646fo8MnRzFCSteV4kxml97wF2g2L6g9RwrGrmDzf5f2SJYDU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4690947"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4690947"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 07:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="15818484"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 07:17:31 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 07:17:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 07:17:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 07:17:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9qYqO8c7l2rmCfhdfpsHnbh6adPb+Blq4jp1ooQYgTpOI0Jabn8SUzaJXzQA/AR5FccW+1aGWnqPnuTjfc9jCtqP3c+iGTBUUZzbMk8Ly0QJ7Kmh8kfMWNIzOIqcH+5PiyHpM8oE+rJiWFjtDEo05Ey1/iOimDzvsGJy/Ats+EfcT0WvU7U+FvfOwhW0lUgzns9t3207SI5k3k9aWqeVxcY0FVMf5uUi3uo3HfphUFLish9IOLAUVf1HYHsme58Wdcw/Ya6PPU0am74HYNZlV+WgRcpJITNoKW5cVFdIo8WyJ9J/E9mfZK9n32ESoIA4CSfRsPQA3DXQkjOnUKeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1NeINiX5Ff20jKZcx3KA9Tv6Dh/2mAa/HGejmtUUV+4=;
 b=OQYdLOFqLm9BGW1DjsvDtmuz5KXBAS1AGwBaI9fs170cq549HCRVw1oiBwMoWixKEo2qkS36HgSVRQBrQZuD6rSma7yAoaYU0znPk3ZNANzywd2iP2oRbuBvBVwlaoR3sBeQ2hozDfEIKmgb6m9G6Gs3R2mig/7e9877u6xfiduZDuq8AK10Ndd161nD8/4JUzqsD7qLEVVujOAB8vzeVdHZJ5RIloUCkUrfAqb9TgNpY24UwpeePR8e8FUXbky5ymB1r3ckRvzjMqHyvxCKEaDbxHG2F/Lhq3d6YJJtQxywhDJ9svjD2SqlvArqq4mhnCQxfRmFHk2tsGIlEAybng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6097.namprd11.prod.outlook.com (2603:10b6:208:3d7::17)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.15; Mon, 11 Mar
 2024 14:17:25 +0000
Received: from IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0]) by IA1PR11MB6097.namprd11.prod.outlook.com
 ([fe80::12a0:a81e:3093:97d0%3]) with mapi id 15.20.7386.014; Mon, 11 Mar 2024
 14:17:25 +0000
From: "Piecielska, Katarzyna" <katarzyna.piecielska@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v2] scripts/doc_to_xls.py: split code into a XLS
 conversion and main()
Thread-Topic: [PATCH i-g-t v2] scripts/doc_to_xls.py: split code into a XLS
 conversion and main()
Thread-Index: AQHac71ccrKiiuribUWJhQwtc6M4KbEylfDA
Date: Mon, 11 Mar 2024 14:17:25 +0000
Message-ID: <IA1PR11MB609753B18FE6E545754F82F586242@IA1PR11MB6097.namprd11.prod.outlook.com>
References: <20240311140515.988767-1-mauro.chehab@linux.intel.com>
In-Reply-To: <20240311140515.988767-1-mauro.chehab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6097:EE_|IA1PR11MB6323:EE_
x-ms-office365-filtering-correlation-id: c37b38a5-bb3f-41f7-70c0-08dc41d5f9cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YtXJ0B9KOoliziekybkMUTribDAEN4ebIYPJmkXSsnA8xCXimQvRFKJ6xDU/suVI7wZmYbFX4QreAZCunNadGryp8wk7quzjofQPipd+ewpXUkofNE3c3ToHZC1gevPyyxyFY0aTFkjJhO58vxfP7fckuMups4FARFYXuhl/NpYmfOTsoIyR84Cr5f7sVfH802L5IaWoGBVE0vlfGe73CfbcWjXHaqrlMxNI8kmTjbY3E5yEp7oPgAY1/nww/O99GVr8yyh0ermZJdh6ImDk6Kc61EzHpcVn2YVG1c9g8g4jYdL6RlbzAMJjR38BNbp6gatrSHz/KqHCLQQ2/hgRdu0hfBtFgH9hKhP5WpJICvTyEyeSYriSZJGcYNmt2L8s+IjTjch/pAKF0I/lLyiEmNd/pa9qHmFKu4lvX8ohJTxInAB6Qla7rrLQA1Qlb4WLrFL9mlwyf1F4EnjEsPFsECcNff/oeR1VbuIMQjhJ91VGbRM2sEXhpJr4C8yPsXGsev4Bs1/EY7PeFD7aMB12hf1X73tTT0le/0f2GBnmW1EGC9B10c/c34i1xq06hiyMONQ2B3X2OEpVlahqGq/jUrRCmhWONESq/sUFxl4U6VL3K2N8OxsFTv+ZP0h5dPKrSZRpaJ5cFDoBE/4PWG+uP4N9bLM3HwMVIsMop6X32SadW2+oAIAnBf0dkoIrqIzPsF8g4Op7Wx5rd239tODmcqOKOJm7V1hqgHTS43y773I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6097.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VVJRMlpkcGJybXhIeEhtR2ZJTGo3ZWZWdHJwT3YxWmFGWklxUmE4RFRHNEpK?=
 =?utf-8?B?dXRCZDByRTJaRlA5eVMxbk5HQzNCZEROdHdRallVNTJTY0NrQUJkWk96bE9w?=
 =?utf-8?B?YUkzelA0d1RrRWh0SjFpelJibDJ4c2I1S25JWmxkU1U4N2NPNzR1akJSUDIz?=
 =?utf-8?B?dGpicGpzcjRRM2p2NzVJMitIYm03emMydjB3ZDFkN29tUktqekZodFNWTXJm?=
 =?utf-8?B?eElrOVNPOE01UGcyS2x2MHBKSFlFS2lURldlcGl1aDkzTEM3UnJzM1Q3c21q?=
 =?utf-8?B?TVcwbFBzeENPNmdmL1dpZW9pdXNLSEdLZStja3BheWs2dmJCbFo5Q3NITm1O?=
 =?utf-8?B?SVVmRWl4V2RGY29tcEl6eXYxSFlZZkdmNUxhd1hXQ1NhR0FRYS91dkVJZytZ?=
 =?utf-8?B?NTdCclc3VCtKeGtwZDBEREhNZjIzcTlzK2ZORzdPU1A1L293dzlWNWk2ZUZp?=
 =?utf-8?B?NHp3NjhLU2NsWkJyYnpIVDRZR0F4ck9XV0d5RnVWMklQa3lnaUxVcWVoZ3VE?=
 =?utf-8?B?Z09jRGhsTDZyWWRyMUJRcTFhVENPNzlFdkQxaWU0RTF4cm55b01qWVFuaHRy?=
 =?utf-8?B?RTcwQm1lakpYWEJsWTZoZkE1MkFIbWhRaEdVeHFWdVFiMkRjZ0ZvUTBqOVlz?=
 =?utf-8?B?YmtVRzN1bkswWWd1TTdwTVc0eUh5ZkdJZldFUWxzMUR0aW1nbUUxVFM4d1hv?=
 =?utf-8?B?RHExL0JQaFFycCtPdnVvK0tFNGdpMEJWMmlEOGFWbVgxN3RvazVlWkEwTTAv?=
 =?utf-8?B?Y2FSZW1OaU1mZ01TQnNNNThxVzBsOCtmL2Q0VkFJVDdGZVk4YUxjVVpXUTYr?=
 =?utf-8?B?czIvVzlrNkhMUEhVNmVFc1pvYTBZbzNITGlCMTFiWlgvS3I1MFNMZC9NeVQr?=
 =?utf-8?B?cCsvcy9oY05vbjEwQTdsUjFscWU3Q3pxQmtrNUN2cURhbGQxaW5aUEpwbWZ2?=
 =?utf-8?B?YVJPeVkrYWQraFNDZ1k3MWFTWWxmYm96ajU2WWx1czRIenJKaTdiMjZ5MkQ1?=
 =?utf-8?B?K2F4U1dQM3pGK1pvNWo5SUhpUE1BZlUzSFBiN3Bza0NnQ1BBM3Z2dzg4M2V5?=
 =?utf-8?B?bUxudjZSMCt4VDdKdjZ2bllQSlRRY0luSVpzZmFvNVF3UVF0a0hnSVhqejZn?=
 =?utf-8?B?N1MwY2hWY2pVOEdVbHdmWVdYNDBiVHUra2xsRTJLZGVqZ0Q4MHdsT3pKWVM1?=
 =?utf-8?B?TDVNUjU2MmZ6YlhpNDYrZDFPd001TE9hRGp6WjJQeUNqMlB3R3BCN1JIL0R6?=
 =?utf-8?B?NGVqUDlvQWRNQjNLVFczY3gzeTdqOE94aDdOTGF4N1B1OTBsbStsQzN5N1Z2?=
 =?utf-8?B?Mld3anlyc3I4Q3A2NDJTdnFGc0xkcDN1T2lmdjNoaUNPUVkvK2R1L3RtRDc2?=
 =?utf-8?B?bUFSYnhEVVl2NW9meTM4dWtqLzRFNWc0dndvSUg5dTkwMHkvQXErYVJZQlo0?=
 =?utf-8?B?QlRwYyt3SGR5cjhnRGlpZjNYSEtidEFEeUtUOHhaUW9lQUx0VHNTUm9IemRw?=
 =?utf-8?B?OU5aeEtMNWg0YVQ2QXd0eUFHdytta3g1VlpXbzVOdUNFWXpqZ2ZKNFJPMFEv?=
 =?utf-8?B?SGx1aFhnMG9zejJsQzVpZm80SEVrVGJsOUFqeDlFRTFmMTJDR256ZkZVQXlT?=
 =?utf-8?B?WFQxdUFnV3lsaDR3dTJGUkR3RHZFWFQ0M1BGSitUZU1SYTZWbDFqQWgyQzFH?=
 =?utf-8?B?eEdzUnVkc2VNclNISlh0dDlsdWYrT1R1Z2dKdG9JVzFhUElsOERWb1JPbUtT?=
 =?utf-8?B?QmZ2UXM3ejZxLzVCc29UWHN2Njk3UGo0L1gwczF4U0hpVFZvYjJVcUEzalg2?=
 =?utf-8?B?d3hGays4eVJTSDBBQ1BLMGtBWFhiTWFzYmNTQ1BzZUR1UHpuT0drMndQSkR5?=
 =?utf-8?B?dVRQY2JFbG13RW81VlZ0MWVEdDRpMmpzejhUSUhoOVZtdFlPeWpFTHBYczJY?=
 =?utf-8?B?SEduVU8rWFJEVzB2cUMvMVh1SWtzOHhJZUtJTVNkb3YvOVoyaEFQZXUwbS9R?=
 =?utf-8?B?SVUwelhaSTN0SUxjamR6bG1jOGtkSTVmdklWcUJVTWNTUUFMUk82Wkh6end6?=
 =?utf-8?B?c1NTZE14cHhFREt6MDZEY0dMWXdoVjRDMWEyTzFCaVpWZ0tpWVlhdlYvVXg0?=
 =?utf-8?B?dUV5MXdwK2VNbU9EWC9kNC9pNGpkZG1EOE5RalJtcW9jTDRsOGJNS3VqdWtt?=
 =?utf-8?B?MlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6097.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c37b38a5-bb3f-41f7-70c0-08dc41d5f9cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Mar 2024 14:17:25.4257 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5EwEMzdruBOzOC6/E0Aap5yLFK6gU/Bl56BTqsrpO2SH7wnSB0BSVMknAP+5tDYb8Xsc033TiSGNx8RGxv9dWhnIcYKMfRcr06r2RDdUEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
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

RnJvbTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+DQoNClN1Y2gg
Y2hhbmdlIGFsbG93cyB1c2luZyB0aGUgY29kZSBvbiBzb21lIG90aGVyIHB5dGhvbiBzY3JpcHQg
dGhhdCB3b3VsZCBiZSBjb252ZXJ0aW5nIElHVCBkb2MgdGVzdCBkb2N1bWVudGF0aW9uIGludG8g
WExTIGZpbGVzLg0KDQpTaWduZWQtb2ZmLWJ5OiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVo
YWJAa2VybmVsLm9yZz4NCi0tLQ0KdjI6DQogIC0gdXNlIGF1dG9wZXA4IHRvIGZvbGxvdyBQRVA4
IGNvZGluZyBzdHlsZTsNCiAgLSBtYWtlIHB5bGludCBoYXBweS4NCg0KIHNjcmlwdHMvZG9jX3Rv
X3hscy5weSB8IDEzMiArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0N
CiAxIGZpbGUgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgNTYgZGVsZXRpb25zKC0pDQoNCmRp
ZmYgLS1naXQgYS9zY3JpcHRzL2RvY190b194bHMucHkgYi9zY3JpcHRzL2RvY190b194bHMucHkg
aW5kZXggMTJjMDIyMzkyMGFlLi40NDhmZjE4NDI5YjYgMTAwNzU1DQotLS0gYS9zY3JpcHRzL2Rv
Y190b194bHMucHkNCisrKyBiL3NjcmlwdHMvZG9jX3RvX3hscy5weQ0KQEAgLTEwLDcgKzEwLDE1
IEBADQogDQogIiIiV3JpdGUgdGhlIGNvbnRlbnRzIG9mIHRoZSB0ZXN0cGxhbiBkb2N1bWVudGF0
aW9uIHRvIGEgWExTIGZpbGUuIiIiDQogDQotRVBJTE9HPSIiIg0KK2ltcG9ydCBhcmdwYXJzZQ0K
Kw0KK2Zyb20gb3BlbnB5eGwuc3R5bGVzIGltcG9ydCBGb250DQorZnJvbSBvcGVucHl4bC51dGls
cyBpbXBvcnQgZ2V0X2NvbHVtbl9sZXR0ZXIgZnJvbSBvcGVucHl4bCBpbXBvcnQgDQorV29ya2Jv
b2sNCisNCitmcm9tIHRlc3RfbGlzdCBpbXBvcnQgVGVzdExpc3QNCisNCitFUElMT0cgPSAiIiIN
CiBFeGFtcGxlczoNCiANCiAxLiBDcmVhdGUgYSBYTFMgZmlsZSB3aXRoIGEgc2luZ2xlIHdvcmtz
aGVldCB3aXRoIFhlIGRyaXZlciBkb2N1bWVudGF0aW9uOg0KQEAgLTIyLDcxICszMCw4MyBAQCBF
eGFtcGxlczoNCiAgICBzY3JpcHRzL2RvY190b194bHMucHkgLS1jb25maWcgdGVzdHMva21zXypq
c29uIHRlc3RzLyovKi5qc29uIC0teGxzIGlndF90ZXN0X2RvY3VtZW50YXRpb24ueGxzICAiIiIN
CiANCi1pbXBvcnQgYXJncGFyc2UNCiANCi1mcm9tIG9wZW5weXhsIGltcG9ydCBXb3JrYm9vaw0K
LWZyb20gb3BlbnB5eGwudXRpbHMgaW1wb3J0IGdldF9jb2x1bW5fbGV0dGVyIC1mcm9tIG9wZW5w
eXhsLnN0eWxlcyBpbXBvcnQgRm9udA0KK2RlZiB0ZXN0c190b194bHModGVzdHMsIGZuYW1lKToN
CisgICAgIiIiDQorICAgIENvbnZlcnQgYW4gYXJyYXkgb2YgSUdUIGRvY3VtZW50YXRpb24gdGVz
dHMgaW50byBhIFhMUyBmaWxlDQorICAgICIiIg0KIA0KLWZyb20gdGVzdF9saXN0IGltcG9ydCBU
ZXN0TGlzdA0KKyAgICB3YiA9IFdvcmtib29rKCkNCisgICAgd3MgPSBOb25lDQogDQotcGFyc2Vy
ID0gYXJncGFyc2UuQXJndW1lbnRQYXJzZXIoZGVzY3JpcHRpb249X19kb2NfXywNCi0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBmb3JtYXR0ZXJfY2xhc3MgPSBhcmdwYXJzZS5SYXdE
ZXNjcmlwdGlvbkhlbHBGb3JtYXR0ZXIsDQotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZXBpbG9nID0gRVBJTE9HKQ0KLXBhcnNlci5hZGRfYXJndW1lbnQoIi0tY29uZmlnIiwgcmVx
dWlyZWQgPSBUcnVlLCAgbmFyZ3M9JysnLA0KLSAgICAgICAgICAgICAgICAgICAgaGVscD0iSlNP
TiBmaWxlIGRlc2NyaWJpbmcgdGhlIHRlc3QgcGxhbiB0ZW1wbGF0ZSIpDQotcGFyc2VyLmFkZF9h
cmd1bWVudCgiLS1pbmNsdWRlLXBsYW4iLCBhY3Rpb249InN0b3JlX3RydWUiLA0KLSAgICAgICAg
ICAgICAgICAgICAgaGVscD0iSW5jbHVkZSB0ZXN0IHBsYW5zLCBpZiBhbnkuIikNCi1wYXJzZXIu
YWRkX2FyZ3VtZW50KCItLXhscyIsIHJlcXVpcmVkID0gVHJ1ZSwNCi0gICAgICAgICAgICAgICAg
ICAgIGhlbHA9Ik91dHB1dCBYTFMgZmlsZS4iKQ0KKyAgICBleHBhbmRfZmllbGRzID0gew0KKyAg
ICAgICAgIkdQVSBleGNsdWRlZCBwbGF0Zm9ybSI6ICJibG9ja2xpc3QgIg0KKyAgICB9DQogDQot
cGFyc2VfYXJncyA9IHBhcnNlci5wYXJzZV9hcmdzKCkNCisgICAgZm9yIHJvdyBpbiByYW5nZShs
ZW4odGVzdHMpKToNCisgICAgICAgIHRlc3QgPSB0ZXN0c1tyb3ddDQorICAgICAgICBzaGVldF9u
YW1lID0gdGVzdC50aXRsZQ0KIA0KLXRlc3RzID0gW10NCi1mb3IgY29uZmlnX2ZpbGUgaW4gcGFy
c2VfYXJncy5jb25maWc6DQotICAgICMgSW1wbGVtZW50ZWQgdGVzdHMNCi0gICAgdGVzdHMuYXBw
ZW5kKFRlc3RMaXN0KGNvbmZpZ19maWxlLCBwYXJzZV9hcmdzLmluY2x1ZGVfcGxhbikpDQorICAg
ICAgICBpZiBub3Qgd3M6DQorICAgICAgICAgICAgd3MgPSB3Yi5hY3RpdmUNCisgICAgICAgICAg
ICB3cy50aXRsZSA9IHNoZWV0X25hbWUNCisgICAgICAgIGVsc2U6DQorICAgICAgICAgICAgd3Mg
PSB3Yi5jcmVhdGVfc2hlZXQoc2hlZXRfbmFtZSkNCiANCi13YiA9IFdvcmtib29rKCkNCi13cyA9
IE5vbmUNCisgICAgICAgIHNoZWV0ID0gdGVzdC5nZXRfc3ByZWFkc2hlZXQoZXhwYW5kX2ZpZWxk
cykNCiANCi1leHBhbmRfZmllbGRzID0gew0KLSAgICAiR1BVIGV4Y2x1ZGVkIHBsYXRmb3JtIjog
ImJsb2NrbGlzdCAiDQotfQ0KLQ0KLWZvciByb3cgaW4gcmFuZ2UobGVuKHRlc3RzKSk6DQotICAg
IHRlc3QgPSB0ZXN0c1tyb3ddDQotICAgIHNoZWV0X25hbWUgPSB0ZXN0LnRpdGxlDQotDQotICAg
IGlmIG5vdCB3czoNCi0gICAgICAgIHdzID0gd2IuYWN0aXZlDQotICAgICAgICB3cy50aXRsZSA9
IHNoZWV0X25hbWUNCi0gICAgZWxzZToNCi0gICAgICAgIHdzID0gd2IuY3JlYXRlX3NoZWV0KHNo
ZWV0X25hbWUpDQotDQotICAgIHNoZWV0ID0gdGVzdC5nZXRfc3ByZWFkc2hlZXQoZXhwYW5kX2Zp
ZWxkcykNCi0NCi0gICAgbWF4X2xlbmd0aCA9IFtdDQotICAgIGZvciBjb2wgaW4gcmFuZ2UobGVu
KHNoZWV0W3Jvd10pKToNCi0gICAgICAgIG1heF9sZW5ndGguYXBwZW5kKDApDQotDQotICAgIGZv
ciByb3cgaW4gcmFuZ2UobGVuKHNoZWV0KSk6DQorICAgICAgICBtYXhfbGVuZ3RoID0gW10NCiAg
ICAgICAgIGZvciBjb2wgaW4gcmFuZ2UobGVuKHNoZWV0W3Jvd10pKToNCi0gICAgICAgICAgICBj
ID0gd3MuY2VsbChyb3cgPSByb3cgKyAxLCBjb2x1bW4gPSBjb2wgKyAxLCB2YWx1ZSA9IHNoZWV0
W3Jvd11bY29sXSkNCi0gICAgICAgICAgICBpZiByb3cgPT0gMDoNCi0gICAgICAgICAgICAgICAg
Yy5mb250ID0gRm9udChib2xkPVRydWUpDQorICAgICAgICAgICAgbWF4X2xlbmd0aC5hcHBlbmQo
MCkNCiANCi0gICAgICAgICAgICBpZiBsZW4oc2hlZXRbcm93XVtjb2xdKSA+IG1heF9sZW5ndGhb
Y29sXToNCi0gICAgICAgICAgICAgICAgbWF4X2xlbmd0aFtjb2xdID0gbGVuKHNoZWV0W3Jvd11b
Y29sXSkNCisgICAgICAgIGZvciByb3cgaW4gcmFuZ2UobGVuKHNoZWV0KSk6DQorICAgICAgICAg
ICAgZm9yIGNvbCBpbiByYW5nZShsZW4oc2hlZXRbcm93XSkpOg0KKyAgICAgICAgICAgICAgICBj
ID0gd3MuY2VsbChyb3c9cm93ICsgMSwgY29sdW1uPWNvbCArIDEsIHZhbHVlPXNoZWV0W3Jvd11b
Y29sXSkNCisgICAgICAgICAgICAgICAgaWYgcm93ID09IDA6DQorICAgICAgICAgICAgICAgICAg
ICBjLmZvbnQgPSBGb250KGJvbGQ9VHJ1ZSkNCiANCi0gICAgIyBFc3RpbWF0ZSBjb2x1bW4gbGVu
Z3RoDQotICAgIGZvciBjb2wgaW4gcmFuZ2UobGVuKHNoZWV0WzBdKSk6DQotICAgICAgICBjb2x1
bW4gPSBnZXRfY29sdW1uX2xldHRlcihjb2wgKyAxKQ0KKyAgICAgICAgICAgICAgICBpZiBsZW4o
c2hlZXRbcm93XVtjb2xdKSA+IG1heF9sZW5ndGhbY29sXToNCisgICAgICAgICAgICAgICAgICAg
IG1heF9sZW5ndGhbY29sXSA9IGxlbihzaGVldFtyb3ddW2NvbF0pDQogDQotICAgICAgICBhZGp1
c3RlZF93aWR0aCA9IChtYXhfbGVuZ3RoW2NvbF0gKyAyKSAqIDEuMg0KLSAgICAgICAgd3MuY29s
dW1uX2RpbWVuc2lvbnNbY29sdW1uXS53aWR0aCA9IGFkanVzdGVkX3dpZHRoDQorICAgICAgICAj
IEVzdGltYXRlIGNvbHVtbiBsZW5ndGgNCisgICAgICAgIGZvciBjb2wgaW4gcmFuZ2UobGVuKHNo
ZWV0WzBdKSk6DQorICAgICAgICAgICAgY29sdW1uID0gZ2V0X2NvbHVtbl9sZXR0ZXIoY29sICsg
MSkNCiANCi0gICAgIyBUdXJuIG9uIGF1dG8tZmlsdGVyDQotICAgIHdzLmF1dG9fZmlsdGVyLnJl
ZiA9IHdzLmRpbWVuc2lvbnMNCisgICAgICAgICAgICBhZGp1c3RlZF93aWR0aCA9IChtYXhfbGVu
Z3RoW2NvbF0gKyAyKSAqIDEuMg0KKyAgICAgICAgICAgIHdzLmNvbHVtbl9kaW1lbnNpb25zW2Nv
bHVtbl0ud2lkdGggPSBhZGp1c3RlZF93aWR0aA0KIA0KLXdiLnNhdmUocGFyc2VfYXJncy54bHMp
DQorICAgICAgICAjIFR1cm4gb24gYXV0by1maWx0ZXINCisgICAgICAgIHdzLmF1dG9fZmlsdGVy
LnJlZiA9IHdzLmRpbWVuc2lvbnMNCisNCisgICAgd2Iuc2F2ZShmbmFtZSkNCisNCisjIyMjIyMN
CisjIE1haW4NCisjIyMjIyMNCisNCisNCitkZWYgbWFpbigpOg0KKyAgICAiIiJNYWluIHByb2dy
YW0iIiINCisNCisgICAgcGFyc2VyID0gYXJncGFyc2UuQXJndW1lbnRQYXJzZXIoZGVzY3JpcHRp
b249X19kb2NfXywNCisgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm9ybWF0
dGVyX2NsYXNzPWFyZ3BhcnNlLlJhd0Rlc2NyaXB0aW9uSGVscEZvcm1hdHRlciwNCisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXBpbG9nPUVQSUxPRykNCisgICAgcGFyc2Vy
LmFkZF9hcmd1bWVudCgiLS1jb25maWciLCByZXF1aXJlZD1UcnVlLCAgbmFyZ3M9JysnLA0KKyAg
ICAgICAgICAgICAgICAgICAgICAgIGhlbHA9IkpTT04gZmlsZSBkZXNjcmliaW5nIHRoZSB0ZXN0
IHBsYW4gdGVtcGxhdGUiKQ0KKyAgICBwYXJzZXIuYWRkX2FyZ3VtZW50KCItLWluY2x1ZGUtcGxh
biIsIGFjdGlvbj0ic3RvcmVfdHJ1ZSIsDQorICAgICAgICAgICAgICAgICAgICAgICAgaGVscD0i
SW5jbHVkZSB0ZXN0IHBsYW5zLCBpZiBhbnkuIikNCisgICAgcGFyc2VyLmFkZF9hcmd1bWVudCgi
LS14bHMiLCByZXF1aXJlZD1UcnVlLA0KKyAgICAgICAgICAgICAgICAgICAgICAgIGhlbHA9Ik91
dHB1dCBYTFMgZmlsZS4iKQ0KKw0KKyAgICBwYXJzZV9hcmdzID0gcGFyc2VyLnBhcnNlX2FyZ3Mo
KQ0KKw0KKyAgICB0ZXN0cyA9IFtdDQorICAgIGZvciBjb25maWdfZmlsZSBpbiBwYXJzZV9hcmdz
LmNvbmZpZzoNCisgICAgICAgICMgSW1wbGVtZW50ZWQgdGVzdHMNCisgICAgICAgIHRlc3RzLmFw
cGVuZChUZXN0TGlzdChjb25maWdfZmlsZSwgcGFyc2VfYXJncy5pbmNsdWRlX3BsYW4pKQ0KKw0K
KyAgICB0ZXN0c190b194bHModGVzdHMsIGZuYW1lPXBhcnNlX2FyZ3MueGxzKQ0KKw0KKw0KK2lm
IF9fbmFtZV9fID09ICdfX21haW5fXyc6DQorICAgIG1haW4oKQ0KW0thdGFyenluYV0gDQpJJ3Zl
IGFwcGxpZWQgcGF0Y2ggYW5kIGdlbmVyYXRlZCB4bHMuIFRvIG1lIGl0IHdvcmtzLg0KQWNrZWQt
Ynk6IEthdGFyenluYSBQaWVjaWVsc2thIDxrYXRhcnp5bmEucGllY2llbHNrYUBpbnRlbC5jb20+
DQpLYXNpYSDwn5iKDQotLQ0KMi40My4yDQoNCg==
