Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54AFC71135
	for <igt-dev@archiver.kernel.org>; Sat, 14 Jun 2025 22:37:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5542710E085;
	Sat, 14 Jun 2025 22:37:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3j5CbyP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5943910E085;
 Sat, 14 Jun 2025 22:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749940628; x=1781476628;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xnk/ERIXFlDYgpvOiArBTNgoxEertlY19qXcjvaEEuI=;
 b=O3j5CbyPitmtmnyzoImK/nq4Me5n6iZeTA+EuoKuTzLiJo50nIZoh2RM
 O1Byyek1RldwQQ6dgyuPiYkAtCC3wUREHMl1GywCuq8UudYRQLwUSZ8mx
 X0ULjGw76/IWk4ymU652Xf73WInZUeUpRek2iKvy7eSZAuxioRvWc93mN
 kgrSpA0qG7KEvyoBv43bj2a/rXXMu8EziQRKMY7KSEnF8vyFKxdMQlsLY
 CqQNZBfl0NUGDYIimO4avR6/nXwZPj7+4PD/pcGmf4ROQzCi2i2CXnXaJ
 gYDMG74j+BDLJUTNQ0NEgMgScI+ccUfnSx9gtRWiew3hU+moTbIzayuOl g==;
X-CSE-ConnectionGUID: lyw0lmvlQqmVLj+97OBm8g==
X-CSE-MsgGUID: n3QZu0FMQCK8UP5vDXCQQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="55926835"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; d="scan'208";a="55926835"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 15:37:08 -0700
X-CSE-ConnectionGUID: NyPcxtOFQhuMe0ftAPsb1Q==
X-CSE-MsgGUID: 1sg2wHd+Q3yHkcaP0pnKuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; d="scan'208";a="151948588"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2025 15:37:08 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 15:37:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 14 Jun 2025 15:37:07 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.67)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 14 Jun 2025 15:37:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dBia2f+4rUOJgBOmUGx9Lx3d1nLbgKsot2rDfWIgstT40yKhXzi5oQrrzNsVq+n9y0BeMACb3ICYS8IdpMBGCfa3aAHm7kvrV08JlVx1pdI2dKEwnrjsfF8mm6sccgcaxNdvKZgnsAHOMGDF9QUqyuBnhtQRYQqxkKB/q/krydmp09YVWqKaBZfzZGyZb22ZSTkJsZ/7GxzmYpOy8bJy5xl4as+dxW42N1O+AWZqc5xY++Hyzpi+IDtLmAEmhewwOGcpnEkg9RkRD0fIT8jDMxK2iDZZ8VnNpzRaa5+uviWxAxQdtnSWabha4W4KQrXdQQjYIUQWmUHLpSPDoyocLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xnk/ERIXFlDYgpvOiArBTNgoxEertlY19qXcjvaEEuI=;
 b=PXOQ7LajBPKs10FxlpsaCCuO4pOjwfrigdl/KXwTGsvQzLLlB1xk873QSrj9beB7Bsa81/VrnAVtw0B6nkityz/v8N/9PCpJh5a16fR2TVsCsuq97m/YoFGFqvB5lcoiB7D89gVN7LYKNvp/xGa0gX+FbrGvlda7VnE2/yo+qFDkEjx8j+c4m7wzG63mnk1qs8KaRp8oX9FABnli9v0qpvYKj4+z8Q7ChG0I3oluiGrm8aRvfx0r1+qGRm6oDo0ZQrVO96mNpqBWWz+kOGfqdtV0k46o3QfNKnIcF7StrADXnBKzQUSzlGAghdqLYFT9ZKO0nu3TQk4MB1SitFKzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by SA1PR11MB8326.namprd11.prod.outlook.com (2603:10b6:806:379::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Sat, 14 Jun
 2025 22:37:04 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%4]) with mapi id 15.20.8835.026; Sat, 14 Jun 2025
 22:37:03 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "I915-ci-infra@lists.freedesktop.org" <I915-ci-infra@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
Subject: =?utf-8?B?UkU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC94?=
 =?utf-8?B?ZV9leGVjX2NvbXB1dGVfbW9kZTogRml4IGFzc2VydGlvbiBvZiBiYXRjaCBi?=
 =?utf-8?Q?uffer_size_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIFhlLkNJLkZ1bGw6IGZhaWx1cmUgZm9yIHRlc3RzL2ludGVsL3hlX2V4?=
 =?utf-8?B?ZWNfY29tcHV0ZV9tb2RlOiBGaXggYXNzZXJ0aW9uIG9mIGJhdGNoIGJ1ZmZl?=
 =?utf-8?Q?r_size_(rev4)?=
Thread-Index: AQHb3MwP+U75OY+eokqOAL8/5YhI6rQDPTRQ
Date: Sat, 14 Jun 2025 22:37:03 +0000
Message-ID: <DM4PR11MB5456D968DA8D37FB4E661DCBEA76A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20250613001943.3704187-1-shuicheng.lin@intel.com>
 <174986467931.79413.4642861730446456372@1538d3639d33>
In-Reply-To: <174986467931.79413.4642861730446456372@1538d3639d33>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|SA1PR11MB8326:EE_
x-ms-office365-filtering-correlation-id: a65cdba9-a5a3-48e1-f263-08ddab93fc62
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TVdKeUdmRFNrejZiQzRLdTZhSTRpc2x6RkpKeE0rNHlZZUJmVDNsM0I4bURK?=
 =?utf-8?B?YVkrcmgxd21vaWtKRys1b2I3Y3dXVHR5SUJIQ1pPZW55VXdIUThRd2s4TDdT?=
 =?utf-8?B?eEVDQ1ZROFNONDlEVEF4ZG9qZFJ5NGpKYkJoWHRXUzJrQ3VZNFVKd0E3cWVK?=
 =?utf-8?B?bVBtSno3dFJvVllpcUZFbG5aTjM3cmtuU0d5Uzd5ZDhmd3E1Q2pJRlZZbXNE?=
 =?utf-8?B?LzI4TUE2QjNvRHArb0NCekhxKy8xbmpyY0w2TFovdmVhUERJS3JXek1ucnRm?=
 =?utf-8?B?MGVNT0ZhK2FBZkU3K1U1ZzVDS3pieGgrMDZsU0tNYzlvc2dxd2o5cFFPRXhF?=
 =?utf-8?B?QkdQNDRwTWpZYXVRT2dydi9rSHl4YXVlNlFMLzVUZjBXTUtDN0pLQUZlTmtN?=
 =?utf-8?B?cHMvcERpQzJ0b0NCanAvVDhocGk2TVVodksxdUUrSXVBSnBUMkpxc2xJdjFk?=
 =?utf-8?B?M0dESXl0NnNuT1V4bkZVVFNXR3pwME1sbHM5emJCZ1BOaVRrRU14YW1YeUVp?=
 =?utf-8?B?VStpTzc4NmdGQ210MSs2VjVhU3ZKdDYxdzJGclVDOVFBMGpjdktLcjlaaHc5?=
 =?utf-8?B?R3VwZHVtaWJSRUhSVHFuZG1GQ3pVcmdsWFNmeDBhRTZ5Q2oxb3RzVVNuTnhv?=
 =?utf-8?B?OVIweWlkeDZFdUpCTXhMeXh4SmZBaXVQUWtUbVVPMVgxTFd5NkkwZXRUVjZH?=
 =?utf-8?B?c1BZclBna090UENBMnRoMjVrWEJESERVWGxBbjdtWHhmbHJmYXdqU3E5WHFI?=
 =?utf-8?B?elE0QzBMSUd2Yk13cVBKaE52a0pIMDdrTDVySW9jOXg4dS9OSDg4MnhpbDU1?=
 =?utf-8?B?U3NCaFlHYzFaTDVScThrSDhNRHlMeGFCeHAxWkxFdzAxbVZ4T0VuYzRTbExD?=
 =?utf-8?B?MTNhYVhvUlpNMDF4dUtYTVBEcjk4SVRTbzJpU0tsZDFDWUx3VFdBMjhwRzlr?=
 =?utf-8?B?cVBTZ0RYY2NQd3F3VGVpZDB4dXFHMTFqQ0M3U29zZUpCYVVSRlhycW41YXhP?=
 =?utf-8?B?OXlPUmxxSFQxb0ZQdUt6eEVzbGtEMlROWE1LclhCczRXQmZSTjdNSzF2RTBQ?=
 =?utf-8?B?R3J1RUtsbUJJWkt0OUo2RTF1VFRQSXRKS1lraDhkWXpWM1A1RHlDYm1WaEJJ?=
 =?utf-8?B?LzFKUVY4OFdscXhtN1ZiMVR5SDU5OGdzTWk3U2ZSQ3RNbWFLeHJta0h2VjdZ?=
 =?utf-8?B?U3Z2S3g1aTZCV2diMnl4SmJscjVONkVEVlM1ZXhUQkNUb0lVanJBV3ZmN200?=
 =?utf-8?B?LzhrcHNyTUNxNEs3SG5Xd3U5V2VJZE91OEdnSUd3ZUtXWHhpb2NQQmU1OWxS?=
 =?utf-8?B?bFFhdkswL3M5NVEvRHkvYmtyMVFwTmRiRG16UVRDcGJNWmNUSWZndlUvMlhH?=
 =?utf-8?B?TUtxTnd3V0tGM3FUU2NDWUE2MjZZZERoUlhkOEJzKzJrQTFJTzMzWmxQRkxw?=
 =?utf-8?B?enczYU1KcGxobWhReHNYNmNlb1lkNDFvblZVU0JvTFRZVTc2enp5Rm1CWGpJ?=
 =?utf-8?B?Q0d6cC9tU2NsVjltdXhtdjN2Rkp4V0JaejQyNkx2eWpvdUpyZUFTVFdiQU1W?=
 =?utf-8?B?eXdXNUZyRGR3QklIWXh3TDdZQWRJZzA2a05HYTVKZTQvM2l0ejJIdko4d3dq?=
 =?utf-8?B?SWFhR1pCK3BnZW5FcGZhSjZYdUxSV3VKdnl3akNsSk9SV1NwY3ZJN2JYRk5F?=
 =?utf-8?B?a1ZCcHR4YmtrUVZEY1FUeEJJd1NFSkNZcEM0NTZPaXRJZFh1c1lpUFUyTFJm?=
 =?utf-8?B?UC95NWpIdjZqaDVqeHBMem9qdlVGRHhlclN0MjlmM25SOTFydHI0K0czMC9Y?=
 =?utf-8?B?Vm1yWDNGUTJGamtibXEyQ1ZMbzlZT3ZyZ3dvVCtrb2duMzVXQmJ0b0pJWkRV?=
 =?utf-8?B?d2Z6VE9FTWNqMmExbzk3VWVlbUo2MWErUjhGY3VOZU95UUlKV1d1QURSTnBs?=
 =?utf-8?Q?iPxfqE5gL4M=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTYweXVVRHJBamY3K2tHZE1CRDltOFlYMUJKVjhVM0ZycUZ1N0RaSkxWYVBP?=
 =?utf-8?B?eTlvS09nTktkdkRvYUt6dVZpa1lqaldqRlo0YzUxWVdiNnJIQzlKQkszUlZp?=
 =?utf-8?B?TEdhaCswVHkyR0JSQm9NaHN5cU9xNjlFMkdDdm8zN0JKaUpQWGxhZ2RscTlQ?=
 =?utf-8?B?UWFZOVhFVldza3NaN0U0aUhqM0xmNC92N1FhbkN3TnM0QkZyUXZUbmpaQW5m?=
 =?utf-8?B?RDdwM2J4ZnNRajdzR3hJUS9helAxbkVhRlowZUcxRUYzSTJRdlJCa0FlcURq?=
 =?utf-8?B?ZG1QajhXYmE4UGQyV3d2M2Jyay9UM0x6bWxKYkdqZFIwOERZMm8vemNTRXlD?=
 =?utf-8?B?MmN5NW9kTGVkVnN1UXRONHFXMG1XRGVwUERiZERTQjdFT2h3ZHFjVWxZRnFV?=
 =?utf-8?B?TWxncTV3eG5mdXVHZERCZ1VjOCs5M3BBRHVJa0IxUldXRzJHSzQ4VnBsamJs?=
 =?utf-8?B?aWJGZ09SVFJNNzZvY210UjN3NjB5cnlsQjBGREQ5YWk5YnRkUCtCZ21QbnYr?=
 =?utf-8?B?U3JRN1dWMy9UMWxmRmJXd0dsRFgyU2Vwc3JxTFAzdmFPL3pwMGwvU1ZPRHM4?=
 =?utf-8?B?c25pZkhhT24rYXc1OGdVdzRWSFVHK3NONVNRYk43K0hXV1V0NnRyS0hkbjRy?=
 =?utf-8?B?NmtrM2VZbS9aeUVMMk1VeCtFeVNGQis0RzR4RmEzbU4rODVIVERTVVloREUv?=
 =?utf-8?B?NlNaaVQreEFoRmkxempDTlZJZHd0Vkl1bjdoaURTZllIMDRXZDNDSnZ1N0pU?=
 =?utf-8?B?V3BHS09WclJjSWQyMFgzTEc0a2hwYmV4UkJpRkxXcGxjSno2WWtsN1dYTDMv?=
 =?utf-8?B?NU05cFRjdFdqbkNpOUp5STFaWE13VlorLzVKb25nbUVaei9hbjNyRDVXNFlG?=
 =?utf-8?B?R3hzME9ndkJPYVExaFlDaTRFWnZJM1BsN2pGdWpSQlVNdnp3K252QU5CZVFW?=
 =?utf-8?B?QXhmZ2hwUkNIRlc0Y1lYb1ArQkI5YTJjcEIrRklZSDFEaVROQmFXYXNHdGVT?=
 =?utf-8?B?c3ljYWIvRE81T2ROM3d6ZkFzUjhNQjlNaDdjUklrQnQ2YzJOYTlnWjUzSE5X?=
 =?utf-8?B?UUdkKzJPYlhDaFhLeWRCcVFkOEZiakdXVDdKRU5pMUJ6M1czN0ZzWFg2QmEv?=
 =?utf-8?B?Z1JGUWVMM1F4YnhJU3RLc1Fqc0d3YjgwZW5RcVBWVkhKNnI1L2FZaStjK0Iy?=
 =?utf-8?B?bnFNKzlGYzlNQTRmNllBUVh6M0lqT1hzNUpZMWY4ZnhzVWZPZzI5TFBWOXNn?=
 =?utf-8?B?NyszVjNUT3lLTU1QMHgya3I3LzRVcDBBNGVkZC9qTXJWRXRrREh2RmZkZ1pE?=
 =?utf-8?B?Skk3YVJTVldOUXgxVTR2bm1iZ3BzQ2owMlhobUFZcmFpVTBjK2RSZFR4Y3VK?=
 =?utf-8?B?Y1RCN1Q3dDBTWTFFRWZ2ZjE5alFkcWxpY3NtWUloNGYxZkY1alRUUG9rTjJq?=
 =?utf-8?B?L3R6Nmt3d0lRYnVwSUh1QWl1ZXp1czNKaFJDcTlKemxIWlFsNXRqZEU2b2Na?=
 =?utf-8?B?MDA5djZvazd3U2t3Ykd1UUllYlVEZGlpcG0zSkpIeTBqVmZGVE1WZlRnSjQ4?=
 =?utf-8?B?RkxUUkRGalJnS1hzVGlyMHVnUDJSODlGeE1hUWZVMkZtUWVKZy9TUzZNOGVP?=
 =?utf-8?B?b05MQldSK3hTWk56MG5uUnZPdWJmNmlhd1g5T2kvNUlhUURQMjg1Y2hVUm9M?=
 =?utf-8?B?N1k2NWdmWGhQdUZpckJQR3V1QnVaTzlIbmg2T3JRUUNxRUFPNGFEVlZxVTZ6?=
 =?utf-8?B?b3BjODdFNkZGbmhxVjQxWXlobFYrVGo2NDFLd0xwL2dJdWtYWmhRZjJ6bjFv?=
 =?utf-8?B?WjVCZEQxcHkwSEoybVlJR21vSk9XWjFxenZlTTFESUxXZ3VHeW9EaEE0UlRP?=
 =?utf-8?B?YkRPQ0huQ0M2ZFhoUW1ydTJXQm1WeWdFa0lmV3E0UGk1cnBFUzFqdnFSZ2hx?=
 =?utf-8?B?cklkc0lNdTVWVEg5c0JxRG9Wd1g4dXFNMnRER3lsbjVlbFRyakJBMUVWYTEw?=
 =?utf-8?B?bEpleG1xdVJ0QmZ6WGY5czR2TzRaZkxvM21kb2RTZnR0dlMrVGljUWFrMlk5?=
 =?utf-8?B?Q3lRSGF6NEUzYVV3WUZqYXIwb0sxZjUwYy9IVVA3OG9YeXdUbFcwYTlTdXJX?=
 =?utf-8?Q?73sHcWJng28Lk+na3/vj9rj6p?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a65cdba9-a5a3-48e1-f263-08ddab93fc62
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2025 22:37:03.8945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJHzMufB5fApeSYXeyaZpdsdP+tkEc8ttuW8cKoMr1msxf/uq4ct6dw0WPaAk3n/D83Fa6HaC8QcbSgXIUMmvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8326
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

SGkgaWd0LWRldiwNCk9uIFNhdCwgSnVuZSAxNCwgMjAyNSA5OjMxIEFNIFBhdGNod29yayB3cm90
ZTogDQo+UGF0Y2ggRGV0YWlscyANCj5TZXJpZXM6DQo+dGVzdHMvaW50ZWwveGVfZXhlY19jb21w
dXRlX21vZGU6IEZpeCBhc3NlcnRpb24gb2YgYmF0Y2ggYnVmZmVyIHNpemUgKHJldjQpDQo+VVJM
Og0KPmh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTUwMTM0Lw0KPlN0
YXRlOg0KPmZhaWx1cmUNCj5EZXRhaWxzOg0KPmh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2ludGVsLXhlL0lHVFBXXzEzMjg3L2luZGV4Lmh0bWwNCj4NCj5TdW1tYXJ5DQo+RkFJTFVS
RQ0KPlNlcmlvdXMgdW5rbm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIFhFSUdUUFdfMTMyODdfRlVM
TCBhYnNvbHV0ZWx5IG5lZWQgdG8gYmUNCj52ZXJpZmllZCBtYW51YWxseS4NCj5JZiB5b3UgdGhp
bmsgdGhlIHJlcG9ydGVkIGNoYW5nZXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhlIGNoYW5n
ZXMNCj5pbnRyb2R1Y2VkIGluIFhFSUdUUFdfMTMyODdfRlVMTCwgcGxlYXNlIG5vdGlmeSB5b3Vy
IGJ1ZyB0ZWFtIChtYWlsdG86STkxNS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRv
IGFsbG93IHRoZW0NCj50byBkb2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdp
bGwgcmVkdWNlIGZhbHNlIHBvc2l0aXZlcyBpbiBDSS4NCj5QYXJ0aWNpcGF0aW5nIGhvc3RzICg0
IC0+IDMpDQo+TWlzc2luZyAoMSk6IHNoYXJkLWFkbHAgDQo+UG9zc2libGUgbmV3IGlzc3Vlcw0K
PkhlcmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVj
ZWQgaW4gWEVJR1RQV18xMzI4N19GVUxMOg0KPklHVCBjaGFuZ2VzDQo+UG9zc2libGUgcmVncmVz
c2lvbnMNCj7igKIgaWd0QGttc19wc3JAcHNyMi1jdXJzb3ItcmVuZGVyQGVkcC0xOg0KPm8gc2hh
cmQtbG5sOiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RfODQw
OS9zaGFyZC1sbmwtMy9pZ3RAa21zX3BzckBwc3IyLWN1cnNvci1yZW5kZXJAZWRwLTEuaHRtbCAt
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9pbnRlbC14ZS9JR1RQV18xMzI4Ny9z
aGFyZC1sbmwtMS9pZ3RAa21zX3BzckBwc3IyLWN1cnNvci1yZW5kZXJAZWRwLTEuaHRtbCArMSBv
dGhlciB0ZXN0IGZhaWwNCg0KSSBjb25maXJtIHRoaXMgZmFpbHVyZSBpcyBub3QgY2F1c2VkIGJ5
IG15IHBhdGNoLiBNeSBwYXRjaCBkb2Vzbid0IGNoYW5nZSBhbnl0aGluZyByZWxhdGUgdG8gZGlz
cGxheS4NClRoYW5rcy4NCg0KU2h1aWNoZW5nDQoNCj5Lbm93biBpc3N1ZXMNCj5IZXJlIGFyZSB0
aGUgY2hhbmdlcyBmb3VuZCBpbiBYRUlHVFBXXzEzMjg3X0ZVTEwgdGhhdCBjb21lIGZyb20ga25v
d24gaXNzdWVzOg0KDQouLi5jdXQuLi4NCg==
