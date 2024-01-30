Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A63BC46CD2
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 15:44:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09EB5113239;
	Tue, 30 Jan 2024 15:44:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CBB8113239
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 15:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706629466; x=1738165466;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=menXUmFsbaJ/KkSOfFWBkQri0mHhLq4mAr+MyDHgBw8=;
 b=CihCa47gyCeTTQMdrP6O+UNXaQb6lTJDiRsrWpV8QMasOv1ZVslpxQZX
 l/gTQaQ39SWpyphgF5mxDGYoZqN0WtOdnKB8eabpfNQrRFQ1iMbGjK/sF
 5RRExXl/KylsI0tu4xjOHOquHTcgT2+VYpBf/B7DJ9ZtBTTSUKZhFdKdC
 aiBCScANve2HWmHNAqtFi2AjoSI7RO+rjpo+hHuHf5gvC8+Q0VQ5SN72N
 TFbP7NJheZn7bkrBmLovOkVk/RcAMJfRGMd4JuGajijwfBJPcJ0RKHIUV
 OKXnUgGOQmZgvGbSoDUDiCqr3XEkjxeRf0DqsHIFXdWINKSoCoLk1sw+G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="16690441"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="16690441"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2024 07:22:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="788226763"
X-IronPort-AV: E=Sophos;i="6.05,230,1701158400"; d="scan'208";a="788226763"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2024 07:22:00 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:21:59 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 07:21:59 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Jan 2024 07:21:59 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Jan 2024 07:21:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aj/5YZUQZwR+0O0r0IBSu45IgkmJWJgGolhu8bxqJE6/a8pQFP6KVG20tBXjDY5d3fbQ0CGKe+hzQKnRptH8P5lNIisgVrwXkaw8gsO5dc0EXOPgDmJPSaJRBB6bEBUJZ6ocR8x1M90hVXBkflDIwzsE/aYm5zmJW0JUesv/G6vKIb+bbIB2+9E/ryd8UT7og4PdoUWquGDoUQKVg9pWt96QHupUFStEXWaoTaFq4vCIchtQwqlYyK1qR8Rp66WTBeRV8XgLK0XHAwOCaCxddZJ9ON7Pd823PSJSI1XooJPLc0F4gZ4Ws+b0t8yIsjm97eNx9uipViE5I1I/CHKKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=menXUmFsbaJ/KkSOfFWBkQri0mHhLq4mAr+MyDHgBw8=;
 b=JLMHKH1op9mngMGSU3bkIciL8/gq1os3OW5NXw72wwOGVmjj2IS7PHArJcd0YbRwagVWwIvzNnf7VBMooDfxNbcGfKhfr6bQZapSUMYCjAFbWuhaIXa33g1adcDS3JimAIqLDSvRnQ9MZRJO3TZOhGddieGzLvEpUlvPF1ghwaz40zWvoRbNk6SyGslxnGnMoys3ehMmKuqLS9eBJcn0Pet/YwcgreSkSFjq+Fiv76xIh4tiv8Stb2AkgP0RHWZaDK15lYmuS1cV6b+QZ97fkJeC1BEjaPOHlygR+ImqnwoNZhV7VweSjO2KoGADkZLhlDxOsAn34epwBfqAOMAVsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6312.namprd11.prod.outlook.com (2603:10b6:8:a5::11) by
 IA1PR11MB7870.namprd11.prod.outlook.com (2603:10b6:208:3f8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.32; Tue, 30 Jan
 2024 15:21:55 +0000
Received: from DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553]) by DM4PR11MB6312.namprd11.prod.outlook.com
 ([fe80::8f01:f682:2d14:5553%5]) with mapi id 15.20.7228.029; Tue, 30 Jan 2024
 15:21:55 +0000
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
Thread-Topic: [i-g-t V2] lib/igt_draw: Fix the usage of FB width & height
Thread-Index: AQHaU3GipXurk8LRr0WoG+5Ba75nvLDyeJfA
Date: Tue, 30 Jan 2024 15:21:55 +0000
Message-ID: <DM4PR11MB6312FA1F866732BC8436A42C907D2@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
In-Reply-To: <20240130113727.721365-1-bhanuprakash.modem@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6312:EE_|IA1PR11MB7870:EE_
x-ms-office365-filtering-correlation-id: 354a7b42-23e5-4d4a-de46-08dc21a731c0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Bd0IT1yhefU90/1+jp+aDg6wZMZSlEztOQ9h3HznkXJN8wQs7wpOd6c7JTd7eY0g7DkNIAU8J/hFg0ajQty+xkEZfNVgPvgOBGzwfaBkrddGgymN3XeEgJp8MsUTMie0De3ofAZ/xkzY4ybsqX2EbZ7gsPTxOayBu4LWrVpTfH3iqcSarBK4923s0YFaf6wpdLizpVg4Wc9pXnenTbRhJSqNuFeEVNCleV13yx9LM0PkX9RXjmJiLBwv18v2rcQNFJCjzQJ6Lgf/Uv7YF1JuDUJ8necB0fsi/R9nvkc8WYajO/+3cI42ofd2i25Uq2mmvn+E8GvlQ5tf7krOBFNUUN2e6ASWR8JKLFtMSmQbbGwHWxOCVxFjtYcGDZFz4yKHyrQw1GqjjursqGCzTPHqzvi2GzHKPhx+VdFJrXn5lYd2MDITpTxbO0nwPc5vxxsS35cuJRKk42Wx114TzTneklfJl5t7fmez6T/D/2Lb43utp+UKZLknCGE2LUUSowPodBUqOQDVm32pMvSYBb039rHrwfY/E89krl5smn0LsvSHqffwlMe1ehDmqeQe3D3RTJ0SWz38uLDcr5N7fXed/CISpfWCsSQ1kKYcVjMRHU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6312.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(366004)(376002)(39860400002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(26005)(55016003)(7696005)(6506007)(53546011)(83380400001)(86362001)(33656002)(38070700009)(82960400001)(41300700001)(52536014)(5660300002)(4326008)(38100700002)(9686003)(66946007)(122000001)(478600001)(71200400001)(316002)(8936002)(110136005)(76116006)(66446008)(64756008)(66556008)(66476007)(2906002)(966005)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXFBdElzS1EzUGNTTXhHMzFlbnBQcDFUdnd4KytCNzYwc1ZPOWtLMVNLVVhm?=
 =?utf-8?B?dHJmYUU1aXhscU5qODYyWHFsNlI4Nys2aTB2S21XMnp1MUh3Ulk3NmRXTWRH?=
 =?utf-8?B?ZzRiN0dkU2FvWWRyVkV6NWYrVmVYaXA5Y3IyNWl2Y2xtT1dRK1F2TFFRMjFv?=
 =?utf-8?B?OElkakV6cUsxZXg2S0tXeXlLT0tHbVFsSmJTREpoendFQXEycEJsL1l0QUNm?=
 =?utf-8?B?dXF6ZWYvamdQQ1pqbWxKTjB3cGhVeHhqSEw1MjZoWXBnWFVoK05jdDBDVUd1?=
 =?utf-8?B?VWdlYWFwbzFScnpyZDErN2FQLzVRbW5LbVFQYisvR2trQnVDc21LcFcrWFpz?=
 =?utf-8?B?U3pqM2JmajRiZ1dEamdudW1iVUd1cmJvOEU2ZmJyelNHc29YRzNHa0EwTitE?=
 =?utf-8?B?b201c0pBSVFjR1l5UHROVllNcDVRM09qek9pRHVmNTdPM3lUV3JpQ2VERjNl?=
 =?utf-8?B?cnF4a1IzL01VRnNlYjgyelFFUFlTSGZzaUNjd0hDZjlPMU9DMmh0a1AvMTJS?=
 =?utf-8?B?aWgzdmlsOVdEcmFWVjRSUWdMMWhjRGh6R0doaFhjdFFoU2FOVS9XNzBJOE1I?=
 =?utf-8?B?amVZVWxmSFduS0NPK3o0bXZxVXlITTV1aHQ3d0dBTDdCWlhJQUtSbE9TUHFt?=
 =?utf-8?B?bEMxcnJKZzJVZWZzeGMrdnZRb1RRQ2w1NFJram15dThTSkZGYTlMekxDdXhB?=
 =?utf-8?B?NDhSL2lEUW43VDdyM3JSUXl2NG9tY25rbjNGMktRbFBSMzdCVW9Xa1dmdzhM?=
 =?utf-8?B?dWtFdk1nT3V2OStrY05SNEpZSE9SbHhtYlBNQ2Q4N3hLaUZDUDYzVlBuWGRT?=
 =?utf-8?B?Vk9lL3dQS0piR0R4YzE0ckpmV3hFMzBreW9IcGtrWU1iRXN3RUo1a3FqdWxG?=
 =?utf-8?B?clZLYWwxVlprdG5XTzlpOWVBdTlTNkNVMlYzWW1Xd1lvWmpYS1NtZklsRjg5?=
 =?utf-8?B?Y1hrN0ZrdXlFY25BdGQyNW5yWmliTUpNYUQ4Z3JlcGhUc0NqWXVPRmhYei9l?=
 =?utf-8?B?VkRNMnJjcnJydDZTMlFVTkdLRzkyV2NBMkoySEt0Q25mUFlpSU9PaWI1T1hR?=
 =?utf-8?B?RVRIZDlLaWtOR3lSTjNuMXUyN2JXVHZaZ0xMSnV5L0FjK2QyOGx0ZjVSZmlu?=
 =?utf-8?B?QyszV2RzbE5rVFRPaGQra3Zpc2pZcFN4SFZjTnZrNk9rNlpVUWhFem44VWdC?=
 =?utf-8?B?dnk0aERwUWQ1SDl0NkdoWHJMVUxwSXMyQUp6L2Z6dE83TmYxSjZRY29UbUFh?=
 =?utf-8?B?NHAySE9iRkpIbXFqRnJ6bUxaN2pGUHd3UmpGeEE5ZVFCTksveWNsNEtyZlpS?=
 =?utf-8?B?VFJPVXk2RzNRUDN0cDNCaFR1clIrakV0TTZTSER3UEcwZUppNVEycnV0bkVh?=
 =?utf-8?B?QWxHeXdYUjhDb2lXVDAxMWpsSkpEY05KOGpEUFdYUGMrcmRhOWd0NXpXdVRF?=
 =?utf-8?B?L25wcEc5UVFDb3UwdkFJMmlBb3dCNTRmaWRSQlREdW5IU0FqSkdoalV5WUtT?=
 =?utf-8?B?eGZuTFB2MmpSdU9lVFE5MS9VZHR2cERySFU1RXptRkVZNmkzbm1oZUdKR3NJ?=
 =?utf-8?B?MVZiVHNxelJZSDBvd0UvZ0xERGhsV3JPVEV4UCtHQnRPOGxkR0JqcFYzTDdD?=
 =?utf-8?B?ZGRPeXpIbWhPd0VhNnZ4VFVoWUV2SFZWZWdVck5TcWVmTjlzYVJjamhOZGhK?=
 =?utf-8?B?RExvcTU0aTBnRU9wL2lkRm02OFRFanlKTUlieVBvRmhKb2c3K29iWFA4MVlE?=
 =?utf-8?B?MjZod0tEUDkzaFVkRS9UOGNjdjgvUEt0akNSWDV3Tm9ZeDBXSmNEQVl5QXVo?=
 =?utf-8?B?MTlvclpoQ2tqSklHanRVZDduKyt5VnE5cVZweFRYVG9EM2Nhb3dTWkhYY3dQ?=
 =?utf-8?B?WEhuNnNnR3BKRDVmbHFCVFpISklLMG1CYUxZQ2xGQWQ1OCtiQVdObW5GQUxP?=
 =?utf-8?B?VlFyd1VxbXZsZmQySlI4bFlkRE96ZG9YN3JlYjBadkh0ZG1aWm9XaUhQNXRS?=
 =?utf-8?B?OUdjMkZaOEhHempUZVFTNEtqQmFEdmQxUUN0OE5LVWxSM0lmL0tMRVlMY0lP?=
 =?utf-8?B?dzFkT0FMTFNKdjNna2I5STRjZnM2TmtrQ1hjV3ZLbHp0TkFBQnhwMTJjS1F1?=
 =?utf-8?Q?0Q5UK2PZ1BUZLevbpyVe0ivkD?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354a7b42-23e5-4d4a-de46-08dc21a731c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 15:21:55.7373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1YnX/G+issZyvSiohFUhapHSQQ0sd5ULvicH3TAbDdYGfyLrr78Ce3dPFpJrwTMRAAoGZbg4uLMH9Pu2DaDU7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7870
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
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBpZ3QtZGV2IDxpZ3QtZGV2LWJv
dW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj4gQmhhbnVwcmFrYXNo
IE1vZGVtDQo+IFNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMzAsIDIwMjQgNTowNyBQTQ0KPiBUbzog
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEg
PGp1aGFwZWtrYS5oZWlra2lsYUBnbWFpbC5jb20+DQo+IFN1YmplY3Q6IFtpLWctdCBWMl0gbGli
L2lndF9kcmF3OiBGaXggdGhlIHVzYWdlIG9mIEZCIHdpZHRoICYgaGVpZ2h0DQo+IA0KPiBBbGln
aW5nIHRvIHhlIGRlZmF1bHQgYWxpZ25tZW50IGlzIGNhdXNpbmcgdGhlIG1pc21hdGNoIGluIGRl
cml2ZWQgaGVpZ2h0IGZyb20NCj4gZnJhbWVidWZmZXIgc2l6ZSAoaGVpZ2h0ID0gc2l6ZS8gc3Ry
aWRlKS4gSW5zdGVhZCB1c2UgdGhlIG9yaWdpbmFsIHdpZHRoICYgaGVpZ2h0DQo+IGZyb20gdGhl
IGNyZWF0ZWQgZmIuDQo+IA0KPiBWMjogLSBGaXggaXNzdWVzIGluIENJDQo+IA0KPiBGaXhlczog
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNjA4
DQo+IENjOiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVs
LmNvbT4NCj4gQ2M6IEp1aGEtUGVra2EgSGVpa2tpbGEgPGp1aGFwZWtrYS5oZWlra2lsYUBnbWFp
bC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEJoYW51cHJha2FzaCBNb2RlbSA8YmhhbnVwcmFrYXNo
Lm1vZGVtQGludGVsLmNvbT4NCj4gLS0tDQo+ICBsaWIvaWd0X2RyYXcuYyAgICAgICAgICAgICAg
ICAgICAgICAgICB8IDE2ICsrKysrKysrKysrKystLS0NCj4gIGxpYi9pZ3RfZHJhdy5oICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgdGVzdHMvaW50ZWwva21zX2JpZ19mYi5jICAg
ICAgICAgICAgICAgfCAgNyArKystLS0tDQo+ICB0ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJf
dHJhY2tpbmcuYyB8ICAxICsNCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9saWIvaWd0X2RyYXcuYyBiL2xpYi9p
Z3RfZHJhdy5jIGluZGV4IDYzN2I5YmE3Ni4uMDc1N2U5ODAxIDEwMDY0NA0KPiAtLS0gYS9saWIv
aWd0X2RyYXcuYw0KPiArKysgYi9saWIvaWd0X2RyYXcuYw0KPiBAQCAtNzUsNiArNzUsOCBAQCBz
dHJ1Y3QgYnVmX2RhdGEgew0KPiAgCXVpbnQzMl90IGhhbmRsZTsNCj4gIAl1aW50MzJfdCBzaXpl
Ow0KPiAgCXVpbnQzMl90IHN0cmlkZTsNCj4gKwlpbnQgd2lkdGg7DQo+ICsJaW50IGhlaWdodDsN
Cj4gIAlpbnQgYnBwOw0KPiAgCXVpbnQ4X3QgcGF0X2luZGV4Ow0KPiAgfTsNCj4gQEAgLTY0OCw4
ICs2NTAsOCBAQCBzdGF0aWMgc3RydWN0IGludGVsX2J1ZiAqY3JlYXRlX2J1ZihpbnQgZmQsIHN0
cnVjdCBidWZfb3BzDQo+ICpib3BzLA0KPiAgCXVpbnQ2NF90IHJlZ2lvbiA9IGRyaXZlciA9PSBJ
TlRFTF9EUklWRVJfWEUgPyB2cmFtX2lmX3Bvc3NpYmxlKGZkLCAwKSA6IC0NCj4gMTsNCj4gIAl1
aW50NjRfdCBzaXplID0gZnJvbS0+c2l6ZTsNCj4gDQo+IC0Jd2lkdGggPSBmcm9tLT5zdHJpZGUg
LyAoZnJvbS0+YnBwIC8gOCk7DQo+IC0JaGVpZ2h0ID0gZnJvbS0+c2l6ZSAvIGZyb20tPnN0cmlk
ZTsNCj4gKwl3aWR0aCA9IGZyb20tPndpZHRoOw0KPiArCWhlaWdodCA9IGZyb20tPmhlaWdodDsN
Cj4gIAlpZiAoZHJpdmVyID09IElOVEVMX0RSSVZFUl9YRSkNCj4gIAkJc2l6ZSA9IEFMSUdOKHNp
emUsIHhlX2dldF9kZWZhdWx0X2FsaWdubWVudChmZCkpOw0KPiANCj4gQEAgLTY4Niw3ICs2ODgs
NyBAQCBzdGF0aWMgdm9pZCBkcmF3X3JlY3RfYmx0KGludCBmZCwgc3RydWN0IGNtZF9kYXRhDQo+
ICpjbWRfZGF0YSwNCj4gIAlpbnRlbF9iYl9hZGRfaW50ZWxfYnVmKGliYiwgZHN0LCB0cnVlKTsN
Cj4gDQo+ICAJaWYgKEhBU180VElMRShpbnRlbF9nZXRfZHJtX2RldmlkKGZkKSkpIHsNCj4gLQkJ
aW50IGJ1Zl9oZWlnaHQgPSBidWYtPnNpemUgLyBidWYtPnN0cmlkZTsNCj4gKwkJaW50IGJ1Zl9o
ZWlnaHQgPSBidWYtPmhlaWdodDsNCj4gDQo+ICAJCXN3aXRjaCAoYnVmLT5icHApIHsNCj4gIAkJ
Y2FzZSA4Og0KPiBAQCAtODA3LDYgKzgwOSw4IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVjdF9yZW5k
ZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGENCj4gKmNtZF9kYXRhLA0KPiANCj4gIAl0bXAuc3Ry
aWRlID0gcmVjdC0+dyAqIHBpeGVsX3NpemU7DQo+ICAJdG1wLmJwcCA9IGJ1Zi0+YnBwOw0KPiAr
CXRtcC53aWR0aCA9IHJlY3QtPnc7DQo+ICsJdG1wLmhlaWdodCA9IHJlY3QtPmg7DQoNCklzIHRo
aXMgcmVxdWlyZWQgPyBJIHRoaW5rIHRoZXNlIGFyZSBub3QgcmVxdWlyZWQuIA0KUGxlYXNlIGNv
cnJlY3QgbWUgaWYgSSBhbSB3cm9uZy4gDQoNCj4gIAlpZiAoaXNfaTkxNV9kZXZpY2UoZmQpKQ0K
PiAgCQlkcmF3X3JlY3RfbW1hcF9jcHUoZmQsICZ0bXAsICYoc3RydWN0IHJlY3QpezAsIDAsIHJl
Y3QtPncsDQo+IHJlY3QtPmh9LA0KPiAgCQkJCSAgIEk5MTVfVElMSU5HX05PTkUsDQo+IEk5MTVf
QklUXzZfU1dJWlpMRV9OT05FLCBjb2xvcik7IEBAIC04MzQsNiArODM4LDggQEAgc3RhdGljIHZv
aWQNCj4gZHJhd19yZWN0X3JlbmRlcihpbnQgZmQsIHN0cnVjdCBjbWRfZGF0YSAqY21kX2RhdGEs
DQo+ICAgKiBAYnVmX2hhbmRsZTogdGhlIGhhbmRsZSBvZiB0aGUgYnVmZmVyIHdoZXJlIHlvdSdy
ZSBnb2luZyB0byBkcmF3IHRvDQo+ICAgKiBAYnVmX3NpemU6IHRoZSBzaXplIG9mIHRoZSBidWZm
ZXINCj4gICAqIEBidWZfc3RyaWRlOiB0aGUgc3RyaWRlIG9mIHRoZSBidWZmZXINCj4gKyAqIEBi
dWZfd2lkdGg6IHRoZSB3aWR0aCBvZiB0aGUgYnVmZmVyDQo+ICsgKiBAYnVmX2hlaWdodDogdGhl
IGhlaWdodCBvZiB0aGUgYnVmZmVyDQo+ICAgKiBAdGlsaW5nOiB0aGUgdGlsaW5nIG9mIHRoZSBi
dWZmZXINCj4gICAqIEBtZXRob2Q6IG1ldGhvZCB5b3UncmUgZ29pbmcgdG8gdXNlIHRvIHdyaXRl
IHRvIHRoZSBidWZmZXINCj4gICAqIEByZWN0X3g6IGhvcml6b250YWwgcG9zaXRpb24gb24gdGhl
IGJ1ZmZlciB3aGVyZSB5b3VyIHJlY3RhbmdsZSBzdGFydHMgQEAgLQ0KPiA4NDgsNiArODU0LDcg
QEAgc3RhdGljIHZvaWQgZHJhd19yZWN0X3JlbmRlcihpbnQgZmQsIHN0cnVjdCBjbWRfZGF0YQ0K
PiAqY21kX2RhdGEsDQo+ICAgKi8NCj4gIHZvaWQgaWd0X2RyYXdfcmVjdChpbnQgZmQsIHN0cnVj
dCBidWZfb3BzICpib3BzLCB1aW50MzJfdCBjdHgsDQo+ICAJCSAgIHVpbnQzMl90IGJ1Zl9oYW5k
bGUsIHVpbnQzMl90IGJ1Zl9zaXplLCB1aW50MzJfdCBidWZfc3RyaWRlLA0KPiArCQkgICBpbnQg
YnVmX3dpZHRoLCBpbnQgYnVmX2hlaWdodCwNCj4gIAkJICAgdWludDMyX3QgdGlsaW5nLCBlbnVt
IGlndF9kcmF3X21ldGhvZCBtZXRob2QsDQo+ICAJCSAgIGludCByZWN0X3gsIGludCByZWN0X3ks
IGludCByZWN0X3csIGludCByZWN0X2gsDQo+ICAJCSAgIHVpbnQzMl90IGNvbG9yLCBpbnQgYnBw
KQ0KPiBAQCAtODYyLDYgKzg2OSw4IEBAIHZvaWQgaWd0X2RyYXdfcmVjdChpbnQgZmQsIHN0cnVj
dCBidWZfb3BzICpib3BzLCB1aW50MzJfdA0KPiBjdHgsDQo+ICAJCS5oYW5kbGUgPSBidWZfaGFu
ZGxlLA0KPiAgCQkuc2l6ZSA9IGJ1Zl9zaXplLA0KPiAgCQkuc3RyaWRlID0gYnVmX3N0cmlkZSwN
Cj4gKwkJLndpZHRoID0gYnVmX3dpZHRoLA0KPiArCQkuaGVpZ2h0ID0gYnVmX2hlaWdodCwNCj4g
IAkJLmJwcCA9IGJwcCwNCj4gIAkJLnBhdF9pbmRleCA9IGludGVsX2dldF9wYXRfaWR4X3VjKGZk
KSwNCj4gIAl9Ow0KPiBAQCAtOTI1LDYgKzkzNCw3IEBAIHZvaWQgaWd0X2RyYXdfcmVjdF9mYihp
bnQgZmQsIHN0cnVjdCBidWZfb3BzICpib3BzLA0KPiAgCQkgICAgICBpbnQgcmVjdF93LCBpbnQg
cmVjdF9oLCB1aW50MzJfdCBjb2xvcikgIHsNCj4gIAlpZ3RfZHJhd19yZWN0KGZkLCBib3BzLCBj
dHgsIGZiLT5nZW1faGFuZGxlLCBmYi0+c2l6ZSwgZmItPnN0cmlkZXNbMF0sDQo+ICsJCSAgICAg
IGZiLT53aWR0aCwgZmItPmhlaWdodCwNCj4gIAkJICAgICAgaWd0X2ZiX21vZF90b190aWxpbmco
ZmItPm1vZGlmaWVyKSwgbWV0aG9kLA0KPiAgCQkgICAgICByZWN0X3gsIHJlY3RfeSwgcmVjdF93
LCByZWN0X2gsIGNvbG9yLA0KPiAgCQkgICAgICBpZ3RfZHJtX2Zvcm1hdF90b19icHAoZmItPmRy
bV9mb3JtYXQpKTsNCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHJhdy5oIGIvbGliL2lndF9kcmF3
LmggaW5kZXggZmU3NTMxYjc5Li4xZGVjOTVlODYgMTAwNjQ0DQo+IC0tLSBhL2xpYi9pZ3RfZHJh
dy5oDQo+ICsrKyBiL2xpYi9pZ3RfZHJhdy5oDQo+IEBAIC01NCw2ICs1NCw3IEBAIGJvb2wgaWd0
X2RyYXdfc3VwcG9ydHNfbWV0aG9kKGludCBmZCwgZW51bQ0KPiBpZ3RfZHJhd19tZXRob2QgbWV0
aG9kKTsNCj4gDQo+ICB2b2lkIGlndF9kcmF3X3JlY3QoaW50IGZkLCBzdHJ1Y3QgYnVmX29wcyAq
Ym9wcywgdWludDMyX3QgY3R4LA0KPiAgCQkgICB1aW50MzJfdCBidWZfaGFuZGxlLCB1aW50MzJf
dCBidWZfc2l6ZSwgdWludDMyX3QgYnVmX3N0cmlkZSwNCj4gKwkJICAgaW50IGJ1Zl93aWR0aCwg
aW50IGJ1Zl9oZWlnaHQsDQo+ICAJCSAgIHVpbnQzMl90IHRpbGluZywgZW51bSBpZ3RfZHJhd19t
ZXRob2QgbWV0aG9kLA0KPiAgCQkgICBpbnQgcmVjdF94LCBpbnQgcmVjdF95LCBpbnQgcmVjdF93
LCBpbnQgcmVjdF9oLA0KPiAgCQkgICB1aW50MzJfdCBjb2xvciwgaW50IGJwcCk7DQo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMgYi90ZXN0cy9pbnRlbC9rbXNfYmlnX2Zi
LmMgaW5kZXgNCj4gM2ViNDM1MTVhLi4wYmQ3OTM5NGIgMTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2lu
dGVsL2ttc19iaWdfZmIuYw0KPiArKysgYi90ZXN0cy9pbnRlbC9rbXNfYmlnX2ZiLmMNCj4gQEAg
LTE4OSwxOCArMTg5LDE3IEBAIHN0YXRpYyBzdHJ1Y3QgaW50ZWxfYnVmICppbml0X2J1ZihkYXRh
X3QgKmRhdGEsICB7DQo+ICAJc3RydWN0IGludGVsX2J1ZiAqYnVmOw0KPiAgCWVudW0gaW50ZWxf
ZHJpdmVyIGRyaXZlciA9IGJ1Zl9vcHNfZ2V0X2RyaXZlcihkYXRhLT5ib3BzKTsNCj4gLQl1aW50
MzJfdCBuYW1lLCBoYW5kbGUsIHRpbGluZywgc3RyaWRlLCB3aWR0aCwgaGVpZ2h0LCBicHAsIHNp
emU7DQo+ICsJdWludDMyX3QgbmFtZSwgaGFuZGxlLCB0aWxpbmcsIHdpZHRoLCBoZWlnaHQsIGJw
cCwgc2l6ZTsNCj4gIAl1aW50NjRfdCByZWdpb24gPSBkcml2ZXIgPT0gSU5URUxfRFJJVkVSX1hF
ID8NCj4gIAkJCQl2cmFtX2lmX3Bvc3NpYmxlKGRhdGEtPmRybV9mZCwgMCkgOiAtMTsNCj4gDQo+
ICAJaWd0X2Fzc2VydF9lcShmYi0+b2Zmc2V0c1swXSwgMCk7DQo+IA0KPiAgCXRpbGluZyA9IGln
dF9mYl9tb2RfdG9fdGlsaW5nKGZiLT5tb2RpZmllcik7DQo+IC0Jc3RyaWRlID0gZmItPnN0cmlk
ZXNbMF07DQo+ICAJYnBwID0gZmItPnBsYW5lX2JwcFswXTsNCj4gIAlzaXplID0gZmItPnNpemU7
DQo+IC0Jd2lkdGggPSBzdHJpZGUgLyAoYnBwIC8gOCk7DQo+IC0JaGVpZ2h0ID0gc2l6ZSAvIHN0
cmlkZTsNCj4gKwl3aWR0aCA9IGZiLT53aWR0aDsNCj4gKwloZWlnaHQgPSBmYi0+aGVpZ2h0Ow0K
PiANCj4gIAluYW1lID0gZ2VtX2ZsaW5rKGRhdGEtPmRybV9mZCwgZmItPmdlbV9oYW5kbGUpOw0K
PiAgCWhhbmRsZSA9IGdlbV9vcGVuKGRhdGEtPmRybV9mZCwgbmFtZSk7IGRpZmYgLS1naXQNCj4g
YS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBiL3Rlc3RzL2ludGVs
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jDQo+IGluZGV4IDJhMjY5MGQxOC4uOTEyY2NhM2Y4
IDEwMDY0NA0KPiAtLS0gYS90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYw0KPiBAQCAtMjI0
Miw2ICsyMjQyLDcgQEAgc3RhdGljIHZvaWQgKmJ1c3lfdGhyZWFkX2Z1bmModm9pZCAqZGF0YSkN
Cj4gIAl3aGlsZSAoIWJ1c3lfdGhyZWFkLnN0b3ApDQo+ICAJCWlndF9kcmF3X3JlY3QoZHJtLmZk
LCBkcm0uYm9wcywgMCwgYnVzeV90aHJlYWQuaGFuZGxlLA0KPiAgCQkJICAgICAgYnVzeV90aHJl
YWQuc2l6ZSwgYnVzeV90aHJlYWQuc3RyaWRlLA0KPiArCQkJICAgICAgYnVzeV90aHJlYWQud2lk
dGgsIGJ1c3lfdGhyZWFkLmhlaWdodCwNCj4gIAkJCSAgICAgIGJ1c3lfdGhyZWFkLnRpbGluZywg
SUdUX0RSQVdfQkxULCAwLCAwLA0KPiAgCQkJICAgICAgYnVzeV90aHJlYWQud2lkdGgsIGJ1c3lf
dGhyZWFkLmhlaWdodCwNCj4gIAkJCSAgICAgIGJ1c3lfdGhyZWFkLmNvbG9yLCBidXN5X3RocmVh
ZC5icHApOw0KPiAtLQ0KPiAyLjQzLjANCg0K
