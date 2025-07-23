Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7BEC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 06:40:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C0810E0A8;
	Wed, 23 Jul 2025 06:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CsFzWgfI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E0410E0A8
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 06:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753252832; x=1784788832;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oT2G6YUeBssTfz0rRximctH4sRlV/B3eG7iqwNMYukg=;
 b=CsFzWgfIwl+Ui8UZ8b7IHFPtlve+/uWZssZM0vjIdiSZolybjQNyFdtS
 Qr2ztzmCL7zzrSLb7rsNhZE1kPZvJm3wwE+yF4+zI68gEVl5ZJhnivT96
 z0r456udLH16y/Jbc858KYBODmcbX/FA+gkbkzlZEHEzIqDbu35R+kxsq
 4tDDahqXDw9FIhT1jsqVaPWNsuo/zkHQAfD21KWjC8zwkB/HHUARjniMb
 B4VSbO169Jwn2IQcPwXx0CasJetUpRRAAnQtAQ827eqAp880pXo5o19jU
 +ysx3YzANiDRkS0pbW+UzGijEqHCosnmRohNQTwmg15iovXobNXVJRuo9 g==;
X-CSE-ConnectionGUID: Qo9P3pSrSeWl/uEzgzJDyw==
X-CSE-MsgGUID: C4pTnnkfTMe91mm7ArfV/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="59323864"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="59323864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:40:32 -0700
X-CSE-ConnectionGUID: ZHaaU8XKQu+PoB0fD+mrtw==
X-CSE-MsgGUID: klDFImBITDmz7A9CL0u6Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="158644793"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2025 23:40:32 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:40:30 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 22 Jul 2025 23:40:30 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.63) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 22 Jul 2025 23:40:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVgHDdhC56UCKoE2VapPzFyQ2PA0a2EhFNz0PLJSxdv+lEhQCg1Tkjdis0VdSEUimFFU5TZBxl4uQDfDsx0BVvTSGEzmuGYU+GdoC6xLhLjJwu/k1HovUezl007YRTejPkeoeXVzmNFWy+RS1GY9wEZNx0eb00utyof80c5oC9BRa8p85yMIuXuhzQRJnE/KvH4msbGQwEPJL6pSKPlnuW7qCEKzJj1hh/FeMmvVahMRodTcnSn8IZ77iB1/ihY2p/xiSUiFkRIatBtY37n5zdyCN3fjgILCsRUUtuHRdZTG2VD6faAqxwQ1uPgWq0TmmZ26sFlxMLfIE4Cjl3Q+FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEYfxPzkgaH6hlejeq7wPJGtMKKBtgW/Xb26s+aGlPk=;
 b=Z3KsbS15AcdafVpdSJt+28LT1v9CakdED2VNdZTr97n7yr4x9kg3bSg5LgKDqoTFShAz0VgCYzoV7XZiHrCgQMVEj5o18jtcdaE9KmTTmSr6SHL9e+mzJXbX7WZuSTKpH4pszjIBPHkZb3iQ3zAcvB/3gel1NW50A64FpnK/RKXkrRb5XQ683oukFdm+1y7SQnJE6QuLW7VSiYl1clJwvhEsmumteP0K+MJS5iqILJJ582X4rXU4gkaZPEv/U+lA4iAx4PHJm0ulR+yFZ9xhSFUkbyo0g/zL9N86NyWgxh19p5BcOg5eX4R2tjO2u7gm8z1JWxRT2cuv6/jD4wE2Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH0PR11MB5030.namprd11.prod.outlook.com (2603:10b6:510:41::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Wed, 23 Jul
 2025 06:40:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8922.028; Wed, 23 Jul 2025
 06:40:27 +0000
Message-ID: <36076813-18fe-4ad9-ab8b-6fa0790acb0d@intel.com>
Date: Wed, 23 Jul 2025 12:10:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 02/41] lib/vkms: Add minimal VKMS library and
 test device default files
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 <igt-dev@lists.freedesktop.org>, <louis.chauvet@bootlin.com>,
 <zbigniew.kempczynski@intel.com>, Jim Shargo <jshargo@chromium.org>, "Marius
 Vlad" <marius.vlad@collabora.com>, Swati Sharma <swati2.sharma@intel.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
 <20250715102513.5636-3-jose.exposito89@gmail.com>
 <20250721163317.g56z3bvqdonod2lp@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250721163317.g56z3bvqdonod2lp@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH0PR11MB5030:EE_
X-MS-Office365-Filtering-Correlation-Id: d94f98d5-84c9-4290-339b-08ddc9b3cf79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|42112799006;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3cvSTNtOFh1ZmU5YUxnQ3JSUG5MOTJTRit6L3loREUrYW1aaXRsc2d2WFg4?=
 =?utf-8?B?dmFCZGRBdk1nZW5tRm91ZDd1TjFPY2kzSXhDU2IzbEFlWlE5RXZZTHpEK3J6?=
 =?utf-8?B?YWRLb1JpdzhSbXFrWENzekg0Ylg3MjU2bkp1M09KY1VVSEhwV1RXalVoL2t4?=
 =?utf-8?B?U2NuYWhrVXdMSXRjZWhybXgxN2FZc2RUREJiMXpJQUVHR2hWd2krWUp2Mm9P?=
 =?utf-8?B?dnlUVzRlWVF1QUpsV2hWcVVqYm9RcHh3cG1mTngyRXI0R2d4TjNYWXgwZ2JX?=
 =?utf-8?B?ZVNZZm5JTGlkSEt3cnBVMWpSakV2MmJFMWFlcXg2emRtcEc5S0tUZGIyZVRa?=
 =?utf-8?B?VGZkMnRpNXZZZ1FyR0t6QjAzbGxTZjZFbmxuKy83NFhmbU0xY2g1Z3lDNFZB?=
 =?utf-8?B?RWVtTXMzZzNYOUc0QURkYmFaUnk3WHV4RmxEamcwRWxUSG0vWENjZHFDVFIx?=
 =?utf-8?B?TU1naTYzYklaL2p5RGREVDFvam4rdHpJWHNiT2RWKzJmQXpEUlF6Y3ZBUkxG?=
 =?utf-8?B?MmZtWlN5cU1VbEJ4QzZOTEhXRzFUU3hlYWthZ3AwN2o0VUFHRnB3N3VQL1pr?=
 =?utf-8?B?YTJXMVFMQThVeERDak5aaWhmeTk3YXFYMExpbWdwbCtoVFN6MXdTWnhSaVgy?=
 =?utf-8?B?b05wSkEzdmhiS2xkQ0poRi9xbllqNWwxZk9lQ0tNYmNvUXZERzlaMzRkdnRN?=
 =?utf-8?B?L2NpVjFKNG1jNDBpSExycUZ2eUpXdHNteFdRUnBLa0VHYVZZcEg3NWY5dlBV?=
 =?utf-8?B?QUhzY1o3ZWJ0SDZxYk9KYzJtK3hwUUNsOUp2UTdLM0YzVlkvcUhPV3J5MDFM?=
 =?utf-8?B?ejFkRlZyTFBSWkdqbUcvTVB6OXZjNlB1VHhJT0FZSG5qS0ZVcU1HSFZ6a1hs?=
 =?utf-8?B?WjNsYXlOaVViOWxPMytCVzZrenRZaStVeHNHUkpZN2gvUDNwWTNrQmhxWGxI?=
 =?utf-8?B?MTdvNms5TjRrRzJRS0JTNDJTTDc3L3F4SE1ueTNWV2Q4QzVOMVJSQlQyR1A4?=
 =?utf-8?B?Y0lXNW5TRFhZZC80YkJ0dEJrQWdkSVNFcDY3L1JtbFFQTmxrdnJGa1ViZ2lS?=
 =?utf-8?B?aVlCMVYvME9ZWVpDMG9sSU51bEVMT3p6VGVyTno3QkxramhLQU9ibENCVVd5?=
 =?utf-8?B?Tnp3amFTTmFBS2htZU04QmJYWG1kQTJ3OXoyVUtJd0VZYmZtR1VtL3MvRkJV?=
 =?utf-8?B?OUk1RGJnSkg0QTQwZlI3bE9XRkRVYVhLMko1amo1bDR0Y3dKWDdST20wbE5I?=
 =?utf-8?B?MXVWL20xTW92d0VKcU5lMlNrRUxFQmJtdXlyTXd1ZWRXbVV3a3d0alRnV0xG?=
 =?utf-8?B?WlBuY05xKzVsQUxQcDdhMVZWUGIrZ2tkSzhxVDBqR2pVK0JqQmpLZmdrUUJ2?=
 =?utf-8?B?VHVid3ExS09VU2kyUGZsTXoyanNlTmlvK2xQc2pEWmxZTkhRZmNSNjBHTE9V?=
 =?utf-8?B?bVI0NERLZllzRS9QTUxFb1orb1lRS2Evc2l3TXlJUitaSkg1bWJIazJhSDBC?=
 =?utf-8?B?NzlkRHQ0MytwVkhXdlFLQ3I1dkpjVU9qRXY3RlZ2aHBnbzN6QU03RzZtS3NG?=
 =?utf-8?B?Sy9FeVhQL0hibUY5K0FXTFRvRjYxMFdpek5ENXZLa0NNVW8zNXN4aVdFWjJy?=
 =?utf-8?B?dEpEdjZOUDd4YVdVN1VpbWtGS2UxWVhOdGg0T0pxY3dYN1NDdXNmK3VuOWEz?=
 =?utf-8?B?VnFkQStWU2JLVzV1ZDdOempiK1E2K3c1RC9aMnZDZE9kZXp6LzNObVhWRXQ0?=
 =?utf-8?B?SlRyeWhVM1dPYW9GbnZ6MUZ1S2ZYTzlnMDJVK1N2WlJpTGp4TWZHdmI0dXlM?=
 =?utf-8?B?K294MFJUenN4ZEVncEc1Zk5RZUVoVkpOVXRZNDVodW1NRE0rRlpwWXVwV2gw?=
 =?utf-8?B?akthYWc5eDhnMCtnWWU1bXF6NzI2amtRU2tMRmpTc1JJRmVNNThVd1JiQ0lr?=
 =?utf-8?Q?v/A/On+TfxI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(42112799006); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzNRZU5hVFovblh0MGxOZ0U2RHFBOGVYZ1dtdVZhL2ErT1NuS1RtZWVZUkxE?=
 =?utf-8?B?Z2hRTkRURGlwNk1RVm56UGIwZnA5RThXK2dVOEc4aGUyUHN0RHhia2ZHZElM?=
 =?utf-8?B?TWZTZ0xsM210WmhMdVNTS01leHRsd2ZhYWlQUkZIMTVuWk9CODZhN0Z3Tk1D?=
 =?utf-8?B?V1VFNm5UaFRtUEUyVlhycXkxRUt0RGRLaXk4bEI1U0laS2ZuR1VjNGJSN0J4?=
 =?utf-8?B?ZlRUV1NtanIreXVBakNJREE1NXhCWEY5aE9sR0dkcnYwaWRCRkR3OXA5Zjl2?=
 =?utf-8?B?UGZrcUVuYXp3dUtkOHlQTDJmNWVBUytRR2VmWXhEUEtpSldVeXhtS0xISCtL?=
 =?utf-8?B?SDgxeWllZE1LOTUwWml4ZlNtQThXUFc1WmpQcE5qM3duNC9JaVZyYnBTNnBD?=
 =?utf-8?B?cWdrWkUzemNackl4SFRSck4zbmJhb0hJY3M0QU9iRS9HcnFleVdlcUVrVHpq?=
 =?utf-8?B?ZU1TcVYvbXh6MFBUeW44UnZWUmNNbDc4V3lQRTYwWWg4THk0TWFld2ZacVlq?=
 =?utf-8?B?TlZwQlBhOWtSS3JaSjRzZGpiUkVMM2VKdi9tSjhRczcrc2diWnNlbmo4UXJW?=
 =?utf-8?B?Uk9SaWFWZGZZckxSclNRTlkyUTRuOC9BVU1SNDVKbU9jeUFJSXhKeFdBNC9V?=
 =?utf-8?B?QXhBWmVKL28yMGVGM0tFU2hOTXpaNlVNNlc5cXl3Tzd6UEhKTzdldklaV3pl?=
 =?utf-8?B?cDVwNjVlU244SlpjMXZrdko5S0dxTjQ4OXZXeDRCV3RvYmhzek43UzdCNk10?=
 =?utf-8?B?SnhNYmk0bHlqMXFqR2JMY2I5MVNFdWZ0NGpXR1BLbWJlLy84YTNnbGIxZXZu?=
 =?utf-8?B?Yk42SFZqZFNraCtXM3BXVHNpQzRTUkVWcTVZczVTNm1aSjNPdDBETlVoZDR5?=
 =?utf-8?B?c0RKdE8zc05mRHhTRVRTcGppdWxLY1F5UkpFdGg3dUVBc2E2ZnJLNjllaVpD?=
 =?utf-8?B?ejlqUE9iV1A3UDE2TXdzb1UrQndHallEcURwTUVMd1lsd3VHQ2Y4bE82QVlT?=
 =?utf-8?B?OFFWRjhkT1A0dUsxdWhjM21HdEJBWEh4VkRKWnlSS0E5ais1SThQQUozV2Qz?=
 =?utf-8?B?OEJWUWpLYnU2Mk9yeW14RWdWR2puWlNjcUpFNTZQemZRemU2b0pEUUhWMnRo?=
 =?utf-8?B?ZXN2cEw4Z3Z5T1U4YmxlUFpoTEREV0hyYWhua1IwNVN6OXgvOTRxdi9acC9R?=
 =?utf-8?B?UGRmaWVDQ0JRb0ZQNFRtWExlbWZEOThoREhURzFVSWp4MGVtaWZuZUpMODVo?=
 =?utf-8?B?WWhCbWRHR0ZTVWF1S2hFakpZWHIyUm1Jb05icGVJVkVnTTZSTlVLT3J1eE0z?=
 =?utf-8?B?RzhWbTNRR2szakM5cnVqeDFZaTQ4cVh0UEpWNWdpZy9tbzZ6eGllcFZqYUE0?=
 =?utf-8?B?aTBUSVNrc1NjYzIwbXUydDVSaURqUk5RRVZVVnMyMFF5c1ZSU0tVc2p1aGt4?=
 =?utf-8?B?amdHWDZZMURlQm1XLzFJSHFZSzQ0Z2hFYlZobEFMcEJib2Z4WG0xZXdTWDBY?=
 =?utf-8?B?WnZmRlJWY2dySmpwdFpoVGxaVVVGUGVuSnFJZXV4MkFBMFNFOTJHQ09DQXps?=
 =?utf-8?B?MGlFTWEvd0xaMUdWYm5BdHJvVlB5S2dPaU9Xa2N2aFIxRVZlUzliaythb1Bp?=
 =?utf-8?B?d09XSWNaNFh3ZGdEbnlmQXczZURreUd2ZVllL2RZOHduY2JNSGRQL0dKTEEx?=
 =?utf-8?B?VzVJbnBwK2NYTmNlSUNXRXlVSVlrMEJWbWwzVkwwK0lEa1pTK0VjMEdjUEhz?=
 =?utf-8?B?ZHRaMmxPMGErdU11L25Mc1duMmJhNGtNS2RDN2gyL2hSZGVudnVwN1U4UVlm?=
 =?utf-8?B?UmRlYmlNblV5OUpWak0wdys4c2M0WGdERU42cTVFNHBXVUNWT1JaNEVxR0hq?=
 =?utf-8?B?cEZBeGoySE9DZmhxUGJkN0dZcVVYbEJXL2JJV3hTaC9aRmgyZWZ2a1FBM21w?=
 =?utf-8?B?UERZQ3RHUEYzMXV5RUxkc1J6SDJDa1JzUEUwNGN4RVI5Rm9ZQy9aL0FQenlh?=
 =?utf-8?B?YWFDSjBSZ2hsV1g0QzRCSk1uS0RmaktjZ0tURVRNMFBoaWFZdGRuUHNhanJy?=
 =?utf-8?B?WWJOeHpFMHpndWw5bHhMWk5pbFRveElha2V3dm4ycmxZSjFCQnlmOE1tSnhi?=
 =?utf-8?Q?BzVW9EZ375T5hMIyQSOhlPsEf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d94f98d5-84c9-4290-339b-08ddc9b3cf79
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 06:40:27.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QsxSr8q7lc5HDJHwavXH8fyC8v9sW1/gcyu75rJ+NTmAEuycc1alMvVc9yhGb8Hs5//y1ppv0MebtGeT4N3mrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5030
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

Hi José,


On 7/21/2025 10:03 PM, Kamil Konieczny wrote:
> Hi José,
> On 2025-07-15 at 12:24:34 +0200, José Expósito wrote:
>> Create a library containing helpers for creating VKMS devices and
>> configuring them dynamically using configfs.
>> For the moment, add the minimal number of helpers to be able to start
>> testing VKMS's configfs support: Create device, destroy device and
>> destroy all devices.
>>
>> Also, include the simplest possible test using those helpers (checking
>> the device's default files) and the scaffolding required to generate
>> the documentation.
>>
>> Co-developed-by: Jim Shargo <jshargo@chromium.org>
>> Signed-off-by: Jim Shargo <jshargo@chromium.org>
>> Co-developed-by: Marius Vlad <marius.vlad@collabora.com>
>> Signed-off-by: Marius Vlad <marius.vlad@collabora.com>
>> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
>> ---
>>   docs/testplan/meson.build        |   7 +-
>>   lib/igt_vkms.c                   | 207 +++++++++++++++++++++++++++++++
>>   lib/igt_vkms.h                   |  27 ++++
>>   lib/meson.build                  |   1 +
>>   meson.build                      |   8 ++
>>   tests/meson.build                |   2 +
>>   tests/vkms/meson.build           |  13 ++
>>   tests/vkms/vkms_configfs.c       | 132 ++++++++++++++++++++
>>   tests/vkms/vkms_test_config.json |  72 +++++++++++
>>   9 files changed, 467 insertions(+), 2 deletions(-)
>>   create mode 100644 lib/igt_vkms.c
>>   create mode 100644 lib/igt_vkms.h
>>   create mode 100644 tests/vkms/meson.build
>>   create mode 100644 tests/vkms/vkms_configfs.c
>>   create mode 100644 tests/vkms/vkms_test_config.json
>>
>> diff --git a/docs/testplan/meson.build b/docs/testplan/meson.build
>> index 5560347f1..9e22f4c7d 100644
>> --- a/docs/testplan/meson.build
>> +++ b/docs/testplan/meson.build
>> @@ -11,6 +11,7 @@ stylesheet = join_paths(meson.current_source_dir(), 'testplan.css')
>>   xe_test_config = join_paths(source_root, 'tests', 'intel', 'xe_test_config.json')
>>   kms_test_config = join_paths(source_root, 'tests', 'intel', 'kms_test_config.json')
>>   i915_test_config = join_paths(source_root, 'tests', 'intel', 'i915_test_config.json')
>> +vkms_test_config = join_paths(source_root, 'tests', 'vkms', 'vkms_test_config.json')
> I am not sure if we need them in a testplan here and below?
> +cc Karthik and Swati

Agree. This is not required as these are skipping on intel CI in any case.

Regards,
Karthik.B.S
>
>>   
>>   check_testlist = []
>>   kms_check_testlist = []
>> @@ -37,12 +38,14 @@ if build_xe
>>   	test_dict = {
>>   		'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>>   		'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
>> -		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist }
>> +		'xe_tests': { 'input': xe_test_config, 'extra_args': check_testlist },
>> +		'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>>   	    }
>>   else
>>   	test_dict = {
>>   	      'i915_tests': { 'input': i915_test_config, 'extra_args': check_testlist },
>> -	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist }
>> +	      'kms_tests': { 'input': kms_test_config, 'extra_args': kms_check_testlist },
>> +	      'vkms_tests': { 'input': vkms_test_config, 'extra_args': check_testlist }
>>   	    }
>>   endif
>>   
>> diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
>> new file mode 100644
>> index 000000000..fa41f741e
>> --- /dev/null
>> +++ b/lib/igt_vkms.c
>> @@ -0,0 +1,207 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Google LLC.
>> + * Copyright © 2023 Collabora, Ltd.
>> + * Copyright © 2024 Red Hat, Inc.
> Should it also be 2025 here?
>
>> + */
>> +
>> +#include <dirent.h>
>> +#include <errno.h>
>> +#include <string.h>
>> +
>> +#include <ftw.h>
>> +#include <linux/limits.h>
> Why not <limits.h> ?
>
>> +#include <sys/stat.h>
> Why not <stat.h> ?
>
> Btw please keep all system libs sorted alphabetically.
> The same goes for other code below.
>
> Regards,
> Kamil
>
>> +
>> +#include "igt.h"
>> +#include "igt_vkms.h"
>> +
>> +#define VKMS_ROOT_DIR_NAME		"vkms"
>> +
>> +/**
>> + * SECTION:igt_vkms
>> + * @short_description: Helpers to create and configure VKMS devices
>> + * @title: VKMS
>> + * @include: igt_vkms.h
>> + *
>> + * Helpers for creating VKMS devices and configuring them dynamically.
>> + *
>> + * First, create a VKMS device, next, add pipeline items (planes, CRTCs,
>> + * encoders, CRTCs and connectors) compose the pipeline by attaching each item
>> + * using the _attach_ functions and finally, enable the VKMS device.
>> + */
>> +
>> +static const char *mount_vkms_configfs(void)
>> +{
>> +	static char vkms_root_path[PATH_MAX];
>> +	const char *configfs_path;
>> +	int ret;
>> +
>> +	configfs_path = igt_configfs_mount();
>> +	igt_assert_f(configfs_path, "Error mounting configfs");
>> +
>> +	ret = snprintf(vkms_root_path, sizeof(vkms_root_path), "%s/%s",
>> +		       configfs_path, VKMS_ROOT_DIR_NAME);
>> +	igt_assert(ret >= 0 && ret < sizeof(vkms_root_path));
>> +
>> +	return vkms_root_path;
>> +}
>> +
>> +/**
>> + * igt_require_vkms_configfs:
>> + *
>> + * Require that VKMS supports configfs configuration.
>> + */
>> +void igt_require_vkms_configfs(void)
>> +{
>> +	const char *vkms_root_path;
>> +	DIR *dir;
>> +
>> +	vkms_root_path = mount_vkms_configfs();
>> +
>> +	dir = opendir(vkms_root_path);
>> +	igt_require(dir);
>> +	if (dir)
>> +		closedir(dir);
>> +}
>> +
>> +/**
>> + * igt_vkms_device_create:
>> + * @name: VKMS device name
>> + *
>> + * Create a directory in the ConfigFS VKMS root directory, where the entire
>> + * pipeline will be configured.
>> + */
>> +igt_vkms_t *igt_vkms_device_create(const char *name)
>> +{
>> +	igt_vkms_t *dev;
>> +	const char *vkms_root_path;
>> +	size_t path_len;
>> +	DIR *dir;
>> +	int ret;
>> +
>> +	dev = calloc(1, sizeof(*dev));
>> +
>> +	vkms_root_path = mount_vkms_configfs();
>> +
>> +	path_len = strlen(vkms_root_path) + strlen(name) + 2;
>> +	dev->path = malloc(path_len);
>> +	ret = snprintf(dev->path, path_len, "%s/%s", vkms_root_path, name);
>> +	igt_assert(ret >= 0 && ret < path_len);
>> +
>> +	dir = opendir(dev->path);
>> +	if (dir) {
>> +		igt_debug("Device at path %s already exists\n", dev->path);
>> +		closedir(dir);
>> +	} else {
>> +		ret = mkdir(dev->path, 0777);
>> +		if (ret != 0) {
>> +			free(dev->path);
>> +			free(dev);
>> +			dev = NULL;
>> +		}
>> +	}
>> +
>> +	return dev;
>> +}
>> +
>> +static int detach_pipeline_items(const char *path, const struct stat *info,
>> +				 const int typeflag, struct FTW *pathinfo)
>> +{
>> +	/*
>> +	 * Level 4 are the links in the possible_* directories:
>> +	 * vkms/<dev>/<pipeline items>/<pipeline item>/<possible_*>/<links>
>> +	 */
>> +	if (pathinfo->level == 4 && typeflag == FTW_SL) {
>> +		igt_debug("Detaching pipeline item %s\n", path);
>> +		return unlink(path);
>> +	}
>> +
>> +	/* Ignore the other files, they are removed by remove_pipeline_items */
>> +	return 0;
>> +}
>> +
>> +static int remove_pipeline_items(const char *path, const struct stat *info,
>> +				 const int typeflag, struct FTW *pathinfo)
>> +{
>> +	/* Level 0 is the device root directory: vkms/<dev> */
>> +	if (pathinfo->level == 0) {
>> +		igt_debug("Removing pipeline item %s\n", path);
>> +		return rmdir(path);
>> +	}
>> +
>> +	/*
>> +	 * Level 2 directories are the pipeline items:
>> +	 * vkms/<dev>/<pipeline items>/<pipeline item>
>> +	 */
>> +	if (pathinfo->level == 2 && typeflag == FTW_DP) {
>> +		igt_debug("Removing pipeline item %s\n", path);
>> +		return rmdir(path);
>> +	}
>> +
>> +	/* Ignore the other files, they are removed by VKMS */
>> +	return 0;
>> +}
>> +
>> +static int remove_device_dir(igt_vkms_t *dev)
>> +{
>> +	int ret;
>> +
>> +	ret = nftw(dev->path, detach_pipeline_items, 64, FTW_DEPTH | FTW_PHYS);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = nftw(dev->path, remove_pipeline_items, 64, FTW_DEPTH | FTW_PHYS);
>> +	return ret;
>> +}
>> +
>> +/**
>> + * igt_vkms_device_destroy:
>> + * @dev: Device to destroy
>> + *
>> + * Remove and free the VKMS device.
>> + */
>> +void igt_vkms_device_destroy(igt_vkms_t *dev)
>> +{
>> +	int ret;
>> +
>> +	igt_assert(dev);
>> +
>> +	ret = remove_device_dir(dev);
>> +	igt_assert_f(ret == 0,
>> +		     "Unable to rmdir device directory '%s'. Got errno=%d (%s)\n",
>> +		     dev->path, errno, strerror(errno));
>> +
>> +	free(dev->path);
>> +	free(dev);
>> +}
>> +
>> +/**
>> + * igt_vkms_destroy_all_devices:
>> + *
>> + * Remove all VKMS devices created via configfs.
>> + */
>> +void igt_vkms_destroy_all_devices(void)
>> +{
>> +	igt_vkms_t *dev;
>> +	const char *vkms_root_path;
>> +	DIR *dir;
>> +	struct dirent *ent;
>> +
>> +	vkms_root_path = mount_vkms_configfs();
>> +	dir = opendir(vkms_root_path);
>> +	igt_assert_f(dir, "VKMS configfs directory not available at '%s'. "
>> +		     "Got errno=%d (%s)\n", vkms_root_path, errno,
>> +		     strerror(errno));
>> +
>> +	while ((ent = readdir(dir)) != NULL) {
>> +		if (strcmp(ent->d_name, ".") == 0 ||
>> +		    strcmp(ent->d_name, "..") == 0)
>> +			continue;
>> +
>> +		dev = igt_vkms_device_create(ent->d_name);
>> +		igt_vkms_device_destroy(dev);
>> +	}
>> +
>> +	closedir(dir);
>> +}
>> diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
>> new file mode 100644
>> index 000000000..48c48f296
>> --- /dev/null
>> +++ b/lib/igt_vkms.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Google LLC.
>> + * Copyright © 2023 Collabora, Ltd.
>> + * Copyright © 2024 Red Hat, Inc.
>> + */
>> +
>> +#ifndef __IGT_VKMS_H__
>> +#define __IGT_VKMS_H__
>> +
>> +/**
>> + * igt_vkms_t:
>> + * @path: VKMS root directory inside configfs mounted directory
>> + *
>> + * A struct representing a VKMS device.
>> + */
>> +typedef struct igt_vkms {
>> +	char *path;
>> +} igt_vkms_t;
>> +
>> +void igt_require_vkms_configfs(void);
>> +
>> +igt_vkms_t *igt_vkms_device_create(const char *name);
>> +void igt_vkms_device_destroy(igt_vkms_t *dev);
>> +void igt_vkms_destroy_all_devices(void);
>> +
>> +#endif /* __IGT_VKMS_H__ */
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 35ca0e0e9..c47ab29b1 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -50,6 +50,7 @@ lib_sources = [
>>   	'igt_types.c',
>>   	'igt_vec.c',
>>   	'igt_vgem.c',
>> +	'igt_vkms.c',
>>   	'igt_x86.c',
>>   	'instdone.c',
>>   	'intel_allocator.c',
>> diff --git a/meson.build b/meson.build
>> index 4efad72cf..dce46e0b2 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -290,6 +290,7 @@ msmdir = join_paths(libexecdir, 'msm')
>>   panfrostdir = join_paths(libexecdir, 'panfrost')
>>   v3ddir = join_paths(libexecdir, 'v3d')
>>   vc4dir = join_paths(libexecdir, 'vc4')
>> +vkmsdir = join_paths(libexecdir, 'vkms')
>>   vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>>   mandir = get_option('mandir')
>>   pkgconfigdir = join_paths(libdir, 'pkgconfig')
>> @@ -352,6 +353,12 @@ if get_option('use_rpath')
>>   	endforeach
>>   	vc4_rpathdir = join_paths(vc4_rpathdir, libdir)
>>   
>> +	vkms_rpathdir = '$ORIGIN'
>> +	foreach p : vkmsdir.split('/')
>> +		vkms_rpathdir = join_paths(vkms_rpathdir, '..')
>> +	endforeach
>> +	vkms_rpathdir = join_paths(vkms_rpathdir, libdir)
>> +
>>   	vmwgfx_rpathdir = '$ORIGIN'
>>   	foreach p : vmwgfxdir.split('/')
>>   		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
>> @@ -365,6 +372,7 @@ else
>>   	panfrost_rpathdir = ''
>>   	v3d_rpathdir = ''
>>   	vc4_rpathdir = ''
>> +	vkms_rpathdir = ''
>>   	vmwgfx_rpathdir = ''
>>   endif
>>   
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 881b204a5..8886c1cb8 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -487,6 +487,8 @@ subdir('v3d')
>>   
>>   subdir('vc4')
>>   
>> +subdir('vkms')
>> +
>>   subdir('vmwgfx')
>>   
>>   gen_testlist = find_program('generate_testlist.sh')
>> diff --git a/tests/vkms/meson.build b/tests/vkms/meson.build
>> new file mode 100644
>> index 000000000..e55ba32ba
>> --- /dev/null
>> +++ b/tests/vkms/meson.build
>> @@ -0,0 +1,13 @@
>> +vkms_progs = [
>> +	'vkms_configfs',
>> +]
>> +vkms_deps = test_deps
>> +
>> +foreach prog : vkms_progs
>> +	test_executables += executable(prog, prog + '.c',
>> +				       dependencies : vkms_deps,
>> +				       install_dir : vkmsdir,
>> +				       install_rpath : vkms_rpathdir,
>> +				       install : true)
>> +	test_list += join_paths('vkms', prog)
>> +endforeach
>> diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
>> new file mode 100644
>> index 000000000..b942cec64
>> --- /dev/null
>> +++ b/tests/vkms/vkms_configfs.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2023 Google LLC.
>> + * Copyright © 2023 Collabora, Ltd.
>> + * Copyright © 2024 Red Hat, Inc.
>> + */
>> +
>> +/**
>> + * TEST: Tests for VKMS configfs support.
>> + * Category: Display
>> + * Mega feature: General Display Features
>> + * Sub-category: uapi
>> + * Functionality: vkms,configfs
>> + * Test category: functionality test
>> + */
>> +
>> +#include <dirent.h>
>> +#include <string.h>
>> +
>> +#include <linux/limits.h>
>> +#include <sys/stat.h>
>> +
>> +#include "drmtest.h"
>> +#include "igt.h"
>> +#include "igt_vkms.h"
>> +
>> +static void assert_default_files(const char *path,
>> +				 const char **files, size_t n_files,
>> +				 const char **dirs, size_t n_dirs)
>> +{
>> +	DIR *dir;
>> +	struct dirent *ent;
>> +	int total = 0;
>> +	int ret;
>> +
>> +	/* Check that the number of files/directories matches the expected */
>> +	dir = opendir(path);
>> +	igt_assert(dir);
>> +	while ((ent = readdir(dir)) != NULL) {
>> +		if (strcmp(ent->d_name, ".") == 0 ||
>> +		    strcmp(ent->d_name, "..") == 0)
>> +			continue;
>> +
>> +		total++;
>> +	}
>> +	igt_assert_eq(total, n_dirs + n_files);
>> +	closedir(dir);
>> +
>> +	/* Check that the files/directories are present */
>> +	for (int i = 0; i < n_files; i++) {
>> +		char file_path[PATH_MAX];
>> +		struct stat buf;
>> +
>> +		ret = snprintf(file_path, sizeof(file_path), "%s/%s", path,
>> +			       files[i]);
>> +		igt_assert(ret >= 0 && ret < sizeof(file_path));
>> +
>> +		igt_assert_f(stat(file_path, &buf) == 0,
>> +			     "File %s does not exists\n", file_path);
>> +	}
>> +
>> +	for (int i = 0; i < n_dirs; i++) {
>> +		char dir_path[PATH_MAX];
>> +
>> +		ret = snprintf(dir_path, sizeof(dir_path), "%s/%s", path,
>> +			       dirs[i]);
>> +		igt_assert(ret >= 0 && ret < sizeof(dir_path));
>> +
>> +		dir = opendir(dir_path);
>> +		igt_assert_f(dir, "Directory %s does not exists\n", dir_path);
>> +		closedir(dir);
>> +	}
>> +}
>> +
>> +/**
>> + * SUBTEST: device-default-files
>> + * Description: Test that creating a VKMS device creates the default files and
>> + *              directories.
>> + */
>> +
>> +static void test_device_default_files(void)
>> +{
>> +	igt_vkms_t *dev;
>> +
>> +	const char *files[] = {
>> +		"enabled",
>> +	};
>> +
>> +	const char *dirs[] = {
>> +		"planes",
>> +		"crtcs",
>> +		"encoders",
>> +		"connectors",
>> +	};
>> +
>> +	dev = igt_vkms_device_create(__func__);
>> +	igt_assert(dev);
>> +
>> +	assert_default_files(dev->path,
>> +			     files, ARRAY_SIZE(files),
>> +			     dirs, ARRAY_SIZE(dirs));
>> +
>> +	igt_vkms_device_destroy(dev);
>> +}
>> +
>> +igt_main
>> +{
>> +	struct {
>> +		const char *name;
>> +		void (*fn)(void);
>> +	} tests[] = {
>> +		{ "device-default-files", test_device_default_files },
>> +	};
>> +
>> +	igt_fixture {
>> +		drm_load_module(DRIVER_VKMS);
>> +		igt_require_vkms();
>> +		igt_require_vkms_configfs();
>> +		igt_vkms_destroy_all_devices();
>> +	}
>> +
>> +	for (int i = 0; i < ARRAY_SIZE(tests); i++) {
>> +		igt_subtest(tests[i].name)
>> +			tests[i].fn();
>> +	}
>> +
>> +	igt_fixture {
>> +		igt_require_vkms();
>> +		igt_require_vkms_configfs();
>> +		igt_vkms_destroy_all_devices();
>> +	}
>> +}
>> diff --git a/tests/vkms/vkms_test_config.json b/tests/vkms/vkms_test_config.json
>> new file mode 100644
>> index 000000000..4e84e184a
>> --- /dev/null
>> +++ b/tests/vkms/vkms_test_config.json
>> @@ -0,0 +1,72 @@
>> +{
>> +    "description": "JSON file to be used to parse VKMS documentation",
>> +    "name": "Tests for VKMS Driver",
>> +    "drivers": [ "vkms" ],
>> +    "files": [ "*.c" ],
>> +    "fields": {
>> +        "Run type": {
>> +            "_properties_": {
>> +                "mandatory": true
>> +            },
>> +            "Category": {
>> +                "_properties_": {
>> +                    "description": "Contains the major group for the tested functionality 'Display'"
>> +                },
>> +                "Mega feature": {
>> +                    "_properties_": {
>> +                        "mandatory": true,
>> +                        "description": "Contains the mega feature for end to end use case"
>> +                    },
>> +                    "Sub-category": {
>> +                        "_properties_": {
>> +                            "mandatory": true,
>> +                            "description": "Contains the technical feature/functionality"
>> +                        },
>> +                        "Functionality": {
>> +                            "_properties_": {
>> +                                "mandatory": true,
>> +                                "description": "Groups page table tests on buckets containing more detailed functionality"
>> +                            },
>> +                            "Feature": {
>> +                                "_properties_": {
>> +                                    "description": "Describes the lowest level feature bucket"
>> +                                }
>> +                            }
>> +                        }
>> +                    }
>> +                }
>> +            }
>> +        },
>> +        "Test category": {
>> +            "_properties_": {
>> +                "description": "Defines the test category. Usually used at subtest level."
>> +            }
>> +        },
>> +        "Test requirement": {
>> +            "_properties_": {
>> +                "description": "Defines Kernel parameters required for the test to run"
>> +            }
>> +        },
>> +        "Issue": {
>> +            "_properties_": {
>> +                "description": "If the test is used to solve an issue, point to the URL containing the issue."
>> +            }
>> +        },
>> +        "Depends on": {
>> +            "_properties_": {
>> +                "description": "List other subtests that are required to not be skipped before calling this one."
>> +            }
>> +        },
>> +        "TODO": {
>> +            "_properties_": {
>> +                "description": "Point to known missing features at the test or subtest."
>> +            }
>> +        },
>> +        "Description": {
>> +            "_properties_": {
>> +                "mandatory": true,
>> +                "description": "Provides a description for the test/subtest."
>> +            }
>> +        }
>> +    }
>> +}
>> -- 
>> 2.50.0
>>
