Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A4ECD5BA4
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 17:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B28F10E278;
	Wed, 20 May 2026 17:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F74eaFYj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6259589C69
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 17:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779297294; x=1810833294;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BIXGE37lnxikKL4pRWGLWW/03M/L08fb4zFu+u1V7iQ=;
 b=F74eaFYj6r1tcZOl/NR7DZWLlDkYflqC4GhIFXm4VkVAysIDbU0GH962
 FNkikCBub7J++qiSDvH4rUJEyf1J0ghXl83pr6eUu3XQHkXV7ZKWAEWCM
 CBv0sLPojbN482mE3ZK1oDUEsp3Alq4/HCuVsa9JRw99UZBrnyt2ECodw
 J92S6v7IMzYRfzaBHxTCMV9yCtl8tG7ydDEhVjdrgx1mykSeR4e2SRb5r
 TYCpbSdF2atqQyqla5gH8qijdzUUFH6lu05HRVxfgM2AT694XuVETaYe9
 pWZoR90yj/tkvzELi2Px5wv0a7I8hQcZrQnaYdDIfVVs3QpHhwJCqKPCj w==;
X-CSE-ConnectionGUID: uLU1u8PkQ0W9CakDVDKuMQ==
X-CSE-MsgGUID: onmB9PTVQ5Oym0+QSyrUWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80321930"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="80321930"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:14:53 -0700
X-CSE-ConnectionGUID: PZSmOARQS4+bragywaYMbQ==
X-CSE-MsgGUID: aQqSnCJ1Slaan/p1LTykAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; d="scan'208";a="240492567"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2026 10:14:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 10:14:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 20 May 2026 10:14:53 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 20 May 2026 10:14:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BGVdML0RL+jH2t0ZcsL78brxlBTRJuvIAp/BKYFPr03Ozk8m/tK/Xid3OYmbn28hF1kIYOKP6wv/TxSmf0ATPRlzyH4xu+yMAsob1qkirSUPKlAPMExNlhz3pIXK0gHrFBTA08I3TbQmvTUBuhzayjIqhgg9XiQzScm7x9DAxYhQc/I/SD+B6vw4h2rapuBqiyuMBx/Fkk23uWssTXgUe1bMMAFJQm9vxVZcj4jx2gTMLiMqxlOic11aV53gkE2Yjfhp27rhLUVE1SFrQMPdkN2O0KuhFbKfXiNOC/Yaj1Tb2xndwiZnWAceweek92tEVoaCfe0/5qIJTAFXsza18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BIXGE37lnxikKL4pRWGLWW/03M/L08fb4zFu+u1V7iQ=;
 b=B9DIABMJYf6ZpkST81zsBRHxkQxwB2gcxmSJJyvjxpP4PGbm7fz2X3MliuAdUEp8mk3q98ekb3HqzBEV6Xx7TVO3WBDTv9zyx9SlkddDCD7YBcNyoQxjg+fo6QvtavxCPEah3xemeKOTJ8Vjnw7e3n207QV4WM0KM58YSZ0u/KNZM9NZ6RxTxnPnHk4FyAYOQGu2sTVjCdcWPYn3TtMbSExwZOcfg+bwoawBEiHEZ8m77aXBZx0Ck5f9Zi1f7mtENzpmYxG3bvP+29arjU8QKO99XKA1sEqJDRBH/bo3PZH6FQBBxfuQNGbQmIIFPBlEhMGBITWVcxGarpyXinzuRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB2842.namprd11.prod.outlook.com (2603:10b6:5:c5::12) by
 SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 17:14:45 +0000
Received: from DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62]) by DM6PR11MB2842.namprd11.prod.outlook.com
 ([fe80::8022:1ef8:d7b3:cb62%5]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 17:14:44 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Kempczynski, Zbigniew" <zbigniew.kempczynski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: RE: [PATCH 3/3] lib/intel_batchbuffer: log overflow size in case
 there is no place in ibb
Thread-Topic: [PATCH 3/3] lib/intel_batchbuffer: log overflow size in case
 there is no place in ibb
Thread-Index: AQHc6D8uYSkDBKo4kEKOVPkIkkgORbYXJTIg
Date: Wed, 20 May 2026 17:14:44 +0000
Message-ID: <DM6PR11MB28427E9359ED7856027C0BF6E5012@DM6PR11MB2842.namprd11.prod.outlook.com>
References: <20260520-ibb_fixes-v1-0-d0c8ab2d07d3@intel.com>
 <20260520-ibb_fixes-v1-3-d0c8ab2d07d3@intel.com>
In-Reply-To: <20260520-ibb_fixes-v1-3-d0c8ab2d07d3@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB2842:EE_|SN7PR11MB7602:EE_
x-ms-office365-filtering-correlation-id: 331a18d1-50c7-45ad-f78d-08deb69349e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|56012099003|22082099003|18002099003|4143699003|38070700021|11063799006;
x-microsoft-antispam-message-info: ZJ6HroNQvVVwxA0um2zvuMXSZD2AC4/RSDfKtsfuCPccG4P7CrvjRYTvN3KxciFB0ITxuGrHdTIXhf9Egbr42kUwG1d+cdh20GgJDazif/lNs33QCZdQXzMF0jGWXz49iGfQbfK4AW4+C+lF/ZEB+NkxlziqeM8zYPCx3g+XJNeVnz/5q9/tzqFiukGWv/yPlCzOxDAYLdeuhi0JDp3/smsqQP5SQH48Qk3lTJf5vKWF3M4jo+ekqZKnxzF9hNfIr+SXUt1tFSJJd1YF3RfbtZ3mP7URDBSUy3gStVe14/sERXsOvZElXIYCz7puTkfpUvzjBN6+AES3lGCmo1TviVSHEIB60QV+Cl6tCUax83yRFMiXLlDWI3utdcNvEzHjGg2jyHxVJHTZp7YPfdlXkiJd/WgnV0+s6teCQZFRL8Hw2ZXx/Tv52lLiSz9r8kjqE2IJ9xZT+rm3PRl+EM3TZcTSaBLotLw7RFNiCWi52zImQiinamdtrcbguEzLYdWuSObzGfub5vfyZ1ldzhiVPOMFlLqklyAkwKxztAr+CJeKUzxe1SBhvjtGwrVJFARuLrcF4WZFcEBvT3mH4fb0WmN5OXeOYdcl5FJ0lbk3D5M8wll33/EUrbIZXbk2wjwxCyCgBrNKS4TxUxyzL9aZ+XZywcWYpOsC09KwTv1O01IemCtkWd7tGtzp5Jc/FhLPxZFD22J0DqTRfgMbyO4h4s1vksX/7dZFmEy37jEZhwa9q6ocGeEHz6WMoIRWDYLB
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2842.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(56012099003)(22082099003)(18002099003)(4143699003)(38070700021)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rk1qei9iTVVMRTNXRzlyditXdWQ2WDhmbHY2MEwzdTk3SFpLU2hOSm5qM0x1?=
 =?utf-8?B?Wm45ZXZ2a3RlU2ZmWGZjNXV5U0FxalRkejhIZXNINUJkQzZlWUl4TVprNEhu?=
 =?utf-8?B?LzFCbk8vQUh0WHd6WXdKY2pFajIxZmRXcHovZnRoRFhsMDdwT2M3Z1BaNEJR?=
 =?utf-8?B?Mmc5cDhOVndGQVh2ajA5YjRaT2ZYbWtxNm9rL1RaajdHRW9PdEhYUEorT29k?=
 =?utf-8?B?aFNLMW1SWGxvSHBKbmRyamxWNTZCblZWS1hyWnhwV3hhSFpYRk5RUVIxMzI2?=
 =?utf-8?B?Y1N0cTF5UzVreEFUUlpXYjZKbGVrSkZzMGdWWkw2NitUbDYzWlVMNW1EaXNw?=
 =?utf-8?B?QW1uV0pveDI5TlFZdERlSFJ6eDRqL2JsYkJqVGFtekhvRDA2S1plaXJwY1Vy?=
 =?utf-8?B?T1dFYUs2N09EVG5WOWtURHcxeGUxWGhOcTFLTHI4SUlUNEtIYkNPZ3RqRkVD?=
 =?utf-8?B?R2JaOFhscUM0MXY4Q2c5ZytMdGR0a1NtdnNXNEVOcy9Jb3NRS0VITzdrTHlr?=
 =?utf-8?B?NkoxUThkNlQwOFdWbzdxa0NteEpiK3JGZDN6UHkxcFZxaE1mZnZOQ3RNZDBM?=
 =?utf-8?B?OHp3TFdkTzNCOWljcFpaZHQvdW51SzNZeWxpVCtkbXpOMW5IbGFCaDNCSWtK?=
 =?utf-8?B?eTJlUkhLQUwvSXpVK1NvcmhjZGRUeFVTYmVwaFBlU3ZVVys5SHFSUTZYZUhm?=
 =?utf-8?B?Y2FFV05EWHRSdUxBVEZHMFNuc0kxZXBTWEFCcDh5QWJPT211U3NWb2U5ZmQy?=
 =?utf-8?B?YVU0Mm5QTloxSjJLTlZDMmQzNXBhdUNJTTVyc0hkMkJLdjViS1FWSVlKMEhQ?=
 =?utf-8?B?N0NFekFYZ2ZoRmFZd0cveEFadmk0VVk0YS9DSUl3ZjIxNXRPcTlWZTFKNGJX?=
 =?utf-8?B?NFJJaENyVzlYVEVySjVMOU5IUU9UWmV1ejJYaStZZFBhM3lWMzRaZjJUclZO?=
 =?utf-8?B?RHFOZnZwOURsMW9sTmlLOEtZbWlWNGc1WEN4L2lyZFNjZ1RpNlA3RlBlQkQz?=
 =?utf-8?B?SE9HcldhOGJjeW50ejNYTEhVWkk0WVh3UVJROUlXS0lyanBTcFBlZFd2VnVz?=
 =?utf-8?B?M1hPUHJwN3lUWXhHWnBraXBrb1JUcy91Wkx2SW91a2RDRkpCSkJPWGhGTDhn?=
 =?utf-8?B?Qy9pNGdEd0ExU1hGYTdkdHcwZGdrSW4zOTlwQ1VlT3V5bDNBSFJYRWhtVDFO?=
 =?utf-8?B?ZkhJTmQ1MUw0UnNmUzV4dTN5a0p6UnJRVmRpRm5IR0lQN2QwVkZyclYrbUl1?=
 =?utf-8?B?Skt4Q2xVVWlSUVRmQ0NDbWpzQi8vS0k5cDNDL1U4ZU1RQ0NadTdkUnRydW9N?=
 =?utf-8?B?MTYxRDdGWEEycTVaRkRDMFZDd240U0lkeElieGEyd1dEaTJwa28zeE1MVEt0?=
 =?utf-8?B?dURHSUJsVmoyMHc4OU5LYzNZdkdhSHcxWXZMUGFVMDBUdGtuZnBkN1VkUzJN?=
 =?utf-8?B?a3pHUUszRDY4d0dDcGhlN00xemkvOTB0L0F6Zk9IQnh6M09lWmVSamVWdGx3?=
 =?utf-8?B?OGI3Z2grbFpFMnZlN3FsYUsrOGU5V0VMV1N2VjJKZVhmV2VuZUJpbFo1OENH?=
 =?utf-8?B?VDhqaXp3LyszeE5YbXpZTnNUQ0dRTGY4TkMvbU5QYWhVam1TMGd6WjEzQjQr?=
 =?utf-8?B?K0VzZUh4ZGZzdEI5Y2g0TXA0VzR1SmQ2SHp1cXU0bGJ6V052S1Q1eDBRbXFS?=
 =?utf-8?B?NUIyMkQzQTVqSVI0aXdWR2g1WEtQQ25BZEh4bWtzRUd6bFhrdmZuZENtOWg3?=
 =?utf-8?B?bUxqZk1ONjh6Tyt3NXVzZEx6V0htdFVzOVYwVTMrdVIrRmRkU0Y0N0pPRUV2?=
 =?utf-8?B?NEFveDJ1TTJTVkp0VU9lbFJiaFpFOGtVV1o2VnBLYUZlbkxkMUp5VGdxMVc1?=
 =?utf-8?B?U2RLN1JVRnNCaThNUjJySkZpSjdoUzExVnpGckY0ZW5KOXp1dnQvT0tPdHJV?=
 =?utf-8?B?U3NCWTl3elNVT2dXZFBId2xocEhtaHpzQVIwTmx6OGV1b0VwM3FyT1Rzd0VV?=
 =?utf-8?B?NVZINGFac1ExY253a3kzTVJFeWpqWHkzZkgwaWZqT3JhNmZlaFRUZzF1UGFC?=
 =?utf-8?B?ak1GRlE2UE9SaE02Q1FrNHN5S3NESHJqekg5d0xKaHN1S0dPcVF0UDhERkUw?=
 =?utf-8?B?NS9pWTE5N1R0L2RsY2lEbWtzY2d4RnFjVy8wZUVyNmZQdlJudXFUOTVJZk5B?=
 =?utf-8?B?S0lYYW5HSW1MVWNWUFJ4Y0ljL3JQSDFsV0FweUN5NnZHZmJsNUtkSXFTWnRw?=
 =?utf-8?B?YW9ZQ3hzRlcrY3h2L3Y4UDEvNFhITXl3T0lRS3FsbEJBQ3ZWbGh1WlZxVEtG?=
 =?utf-8?B?NENXN1lIMmhXU3JoV01vL0xILzNhN1BtZnBtcmMzckZHdGhyVzNuTFFaUldX?=
 =?utf-8?Q?qaSTW0IXbfk6XZ0PrYqr1OizmKog4GltpEr7KsK43K+iP?=
x-ms-exchange-antispam-messagedata-1: q7lOKiNZN9i7Kw==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OdhJIKWX19+4nVAUmzT9xXcB+LulyJ5E5ZU8F4hMUuSwNWVYO6gIncZBWfE5ZO9mGcM1jnUnB0AiOXxcBd2Jg6BSj2i7+X1/q5DltiqyzF2NVuamWic8/iDY6yZ3u9hET9y3NROKBzvYauGIico+SXwAAKgFx/vuyrmGyiJoGzVLCPjeO/ErONzfm/wd1WG8rmVs3Bp9z9viHKGZibCCx1Q7RSoO6YMOY6P2VqllVcFUVIFBSTGvaRv5cL7CzVyKY3IOFu8ueyUDcq4aS/or+7vWy85t2X8PAA1LO+6ArNXMgwT+8B4Yv21KmPLM70rN21miMvSHfUAS3GNN1WWxrw==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2842.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 331a18d1-50c7-45ad-f78d-08deb69349e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2026 17:14:44.8712 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X+F0LA9FOmg/nR6KZniKiKVJa+PU22kRrYzkjal85cARjYHQ1qXhy/mb/wtTdLhKiUYkUab4/jMTig8biPG43de2zZ8ficHskcreiVOEQOU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEhhamRhLCBBbmRyemVqIDxhbmRyemVq
LmhhamRhQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIE1heSAyMCwgMjAyNiAyOjU2IEFN
DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBLZW1wY3p5bnNraSwgWmJp
Z25pZXcgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT47IENhdml0dCwgSm9uYXRoYW4g
PGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+OyBLYW1pbCBLb25pZWN6bnkgPGthbWlsLmtvbmll
Y3pueUBsaW51eC5pbnRlbC5jb20+OyBIYWpkYSwgQW5kcnplaiA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+DQpTdWJqZWN0OiBbUEFUQ0ggMy8zXSBsaWIvaW50ZWxfYmF0Y2hidWZmZXI6IGxvZyBv
dmVyZmxvdyBzaXplIGluIGNhc2UgdGhlcmUgaXMgbm8gcGxhY2UgaW4gaWJiDQo+IA0KPiBJdCBz
aW1wbGlmaWVzIGRlYnVnZ2luZy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFuZHJ6ZWogSGFqZGEg
PGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gIGxpYi9pbnRlbF9iYXRjaGJ1ZmZl
ci5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgYi9saWIvaW50
ZWxfYmF0Y2hidWZmZXIuYw0KPiBpbmRleCAxODlhNDExOTY4NTkuLjE3YjJiODYyNWQ0ZSAxMDA2
NDQNCj4gLS0tIGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMNCj4gKysrIGIvbGliL2ludGVsX2Jh
dGNoYnVmZmVyLmMNCj4gQEAgLTI5MzEsNyArMjkzMSw3IEBAIHVpbnQzMl90IGludGVsX2JiX2Nv
cHlfZGF0YShzdHJ1Y3QgaW50ZWxfYmIgKmliYiwNCj4gIA0KPiAgCWludGVsX2JiX3B0cl9hbGln
bihpYmIsIGFsaWduKTsNCj4gIAlvZmZzZXQgPSBpbnRlbF9iYl9vZmZzZXQoaWJiKTsNCj4gLQlp
Z3RfYXNzZXJ0KG9mZnNldCArIGJ5dGVzIDwgaWJiLT5zaXplKTsNCj4gKwlpZ3RfYXNzZXJ0X2x0
KG9mZnNldCArIGJ5dGVzLCBpYmItPnNpemUpOw0KDQpUaGlzIGRvZXMgdGhlIHNhbWUgdGhpbmcg
YnV0IHdpdGggbW9yZSBsb2dnaW5nLCBzby4uLg0KDQpSZXZpZXdlZC1ieTogSm9uYXRoYW4gQ2F2
aXR0IDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29tPg0KLUpvbmF0aGFuIENhdml0dA0KDQo+ICAN
Cj4gIAlzdWJkYXRhID0gaW50ZWxfYmJfcHRyKGliYik7DQo+ICAJbWVtY3B5KHN1YmRhdGEsIGRh
dGEsIGJ5dGVzKTsNCj4gDQo+IC0tIA0KPiAyLjU0LjANCj4gDQo+IA0K
