Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06599E77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 10:11:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B054E10E259;
	Wed, 18 Dec 2024 10:11:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iVDtFQz9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FA810E259
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734516714; x=1766052714;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=N6098r73WyINIAN/h/lRLdKQCFUZuu4u0YNFpQ55jL0=;
 b=iVDtFQz9q9yEMKm0XKoU3za1aeQhKj/uAj2+SXfY0eiZD2maJ8En4wgd
 rAaUOtYa/D+6kpjzs9po4k1Ishrks9Fn5frSBRgp+TEGlIxJqP6JT/607
 vFP1MDPK+Jl0f1RrsoPR3fxIahD36yK7tZzdhbkiZKJP011SDVJ1AphOs
 wNuemjJaTV9cF6cUaYQVUXo82tAz9ZfYjunWixCty5oEE2LHeqBfNhHA1
 wgN/aM8KjsE/xx2K3RZF2FZd+M2XmBCkliNF7DjS+2jZ7bobErqE4PZWQ
 KMp5/dWTDCW4nlUsfANnt0K+yA3bZF7IuvYfMfGOoBTum+SR5zIUW0Y1a g==;
X-CSE-ConnectionGUID: L/eEWZGUTKu4TP8mJaIxwQ==
X-CSE-MsgGUID: lTX6e+eHQbuf2tKZoFGkpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35113094"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="35113094"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 02:11:54 -0800
X-CSE-ConnectionGUID: PCzfX0mDRp+1+yJ4n6XGTA==
X-CSE-MsgGUID: 7Aaa+yM2Q3eBE0mrlK5cog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102434609"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Dec 2024 02:11:53 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 18 Dec 2024 02:11:52 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 18 Dec 2024 02:11:52 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 18 Dec 2024 02:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWPKtc3eBGVwnLbQAxtvqKye94n2PskcepJrN5jLW/MK3YD9kpav8MqkukA96a9MMsqupCGwVCziI2mjuPmdREwnZ70ytk+FeERYNOKKQFJh9ktEyR89JoxoUJMbmzMM62BpEyKe/zc7KOAMWJ0lDa1C7zDVpOA9/JYYu+fJ9SpcAdD4om/EFxLSxyzdmti2KIe4OgFnY+tKr3qhDmZGeAEJ+s68qD32OnAJj1Ec4Y0CYooYPVTlfDVpSU4OFyURrSkc/zZ9Q89acbC40XIm7ABjs5URmoDf8tEZdlRrBUSYkcucgzgL4WgPteckOaIHUuo4HD8CaoXZlq82i0JZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6098r73WyINIAN/h/lRLdKQCFUZuu4u0YNFpQ55jL0=;
 b=bnfwQf603G27R41RiQekXSK1SX9qB6hBTWsHglAbU4QYKJa5zRsaQrCmLP/D5bI5moimNsbzqrs+v+zwBmXAuVD5+9rGai/VP7TXCddJY/RAEMZZlE7thWdVdqS5xLdt0heyefqE9HaWBN2ibk4cTMY7+nwF+pmR9CjiJNaJMLc01J3gz71QsSBm+8dp7ayX1Ia0Gu8lUDyNjAqOQvoTQK+tZY1ON/KpI//xUTYokspfssadO1rA63lRHp9c65Ddaku6zYAV3+1YfnlBgtpCv0cb2taZ9VHcgZDpiRq5g07hDwrNuGk9RdwMI7lnyycFtBXi7Pt8+0+iYIVzQ9MM7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5525.namprd11.prod.outlook.com (2603:10b6:208:31f::10)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Wed, 18 Dec
 2024 10:11:45 +0000
Received: from BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66]) by BL1PR11MB5525.namprd11.prod.outlook.com
 ([fe80::1a2f:c489:24a5:da66%4]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 10:11:45 +0000
From: "Gurram, Pravalika" <pravalika.gurram@intel.com>
To: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Subject: RE: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Topic: [PATCH v1] tests/intel/xe_debugfs: Extend gt test to check few
 debugfs entries
Thread-Index: AQHbUIvtbGeU9Btf7USQIGmd/sEedrLrtFMAgAALNwCAAAe8sA==
Date: Wed, 18 Dec 2024 10:11:45 +0000
Message-ID: <BL1PR11MB55254606B8D1785DBE18402E84052@BL1PR11MB5525.namprd11.prod.outlook.com>
References: <20241217135659.673564-1-pravalika.gurram@intel.com>
 <55894817-9c88-4e95-b648-72e3f031e10c@linux.intel.com>
 <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
In-Reply-To: <17f7620a-c797-447a-8eea-f9120e8af98f@linux.intel.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5525:EE_|DS7PR11MB6246:EE_
x-ms-office365-filtering-correlation-id: 5245e4a7-bda4-4164-4bc8-08dd1f4c60af
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YnlwVFdkaUw0a0lHSmx1Y3B4ZU9DS2xhcU9pdFJtVWpFYWRqbUhuL240U0Yr?=
 =?utf-8?B?Nk0rbzBEM25UdGd2ZEs2ZlMzWDdEREU1dVdzTjJiZ0RSanVNWVh5bmxQTmlt?=
 =?utf-8?B?R3hYSlp0d2hjUWg1NGExbHJFcU84SDBMbXptVlFtblYrVkNsOUtsczhCN0tp?=
 =?utf-8?B?NWQzUUpha1hzc2tUY1VKdForMS9WeTl5TEFjczVIZmZ1SVdRZDRJcXFqSEJx?=
 =?utf-8?B?Q3V0QmZkS25BcFEwNTR3cWVWSHlHSEtmQ0tPb2twYnVIYVJ0Z1cwaTFQQzAx?=
 =?utf-8?B?d3JVdncwVDhVYW10KzVuU28weU9vQWZWT003TzRsVitxcnd3N082TlVLQ1N1?=
 =?utf-8?B?VTY4dno5SlV5bE5YWG1vY0lqZUpSNmpiK3owRm5WdVY5a2JzYXNHaGV0VnRa?=
 =?utf-8?B?Zmc5aXdwNWVOTk8wWDdnT0orUkkzaFQyZlAzVTNLU3MzMDdIcXcvSXl3NExQ?=
 =?utf-8?B?ZHBaTVpEeVlUN21icHo4V0NVdXdEUkFGSUZrTWx6S2U0ZVRoZ0U0aURoZjZi?=
 =?utf-8?B?aitPWGxiR1FPSVN4elFYMWVQdlNIamN4cmw0c0pYN251OVpRdU11STRRR1dZ?=
 =?utf-8?B?a1hoZ2FwTUVFZitQQi82RG1RbXBnVEJFeEJaRm1JLzdyRXMvNkRITGZLdkFK?=
 =?utf-8?B?YkREeWNkWWFLUEZrWHNkRkVBdzg1ejl1RzFOWmdwYURmZXJTcXZYZXVTbWI3?=
 =?utf-8?B?OHVjaFNSYlBKcldyd3NtNVk0ckFoWG5NOFg3S1MwZDJ1R0JqMDREQ3BjVFdT?=
 =?utf-8?B?K3d6djRuZEFNWmlZdGw1WHZQUDM1YStRWUJCbEYyRHEyNU5KdHJCdXRsdFN0?=
 =?utf-8?B?cTdBSlhZcDBpeU1jcUNGQndVVEZ5MjhPc2pGWFh4WUVLQStoSXFkVTA2RkZG?=
 =?utf-8?B?UnFKWHJoeTRWVzdnVENQckxqbjdIQjYvOGd0dDNGZFB1THljVks0blhBUC9F?=
 =?utf-8?B?ZGE3UzBvc2tXdUJPL1NwbGYyT2tWMk5TbEVrZzRkaUxEd3h4RzFRanJ3cXdl?=
 =?utf-8?B?RkdXakZ3TEt4L1JJeXBGQXIrNS9OTTlOV0c5ckkzQk1EOTRuSHdZamw5U1ZC?=
 =?utf-8?B?SmRtM205SGloc0d5ZWFCT1Y0akowY1VXL2liU3VySG1ZRWtqMzdoK0VqbDhF?=
 =?utf-8?B?Um9VZnZFbFJWYW1UdTV4KytxK01jUENETmVtUHowWCtKRlNsVjhYNEl6Mncx?=
 =?utf-8?B?OWQxNHo5aHhZUGRGM245aElBTS9KY2VmMkxCWGwrcEdPQjFvdkIxOWdlWnJM?=
 =?utf-8?B?ejRFbkRhVjEreVp1Z0M3VmMyTVlKM1BYbmJTUUVjR3NqYjhXNGVCMkQ3d0JP?=
 =?utf-8?B?OURLWU1uaTRXVndkam0xKzRIVXdoLy9tUkY5V2NNcEFpYS9uRWpya2Fhd3By?=
 =?utf-8?B?S2o4dzdzT3A5a1M4SG1zUTE2c0dGNnJwY2lpTExiOVNJZU4zK0ZjeitkN25W?=
 =?utf-8?B?WSt5cFhubVVDQ1FjcUllenJGcG92cnZCT0w5M0pCNUVBK2J1dGloS0xSdEJ0?=
 =?utf-8?B?azN2REY3YjJSVXdsQlFJRVNHNlhUVngyUXlteU4rSHY2a2VSekN0eVBXTnUw?=
 =?utf-8?B?TE9NZG4rTnduNDg5dGRtcHg5dG5nRG9wT2M1R1IzbENNQjVReExPcFFKUEhk?=
 =?utf-8?B?Y2VqYUdXLzZFYjRDUHFtVzhRdlZ5QXh3ZHpvb2gwL0FDQ29Fcm1DdUlMUjZL?=
 =?utf-8?B?OFFidUxDSTRiNkFkZUM2YWlzbzZDcjdEL3lYQnVwRE5Cdy95Mm9tRTBoTjNF?=
 =?utf-8?B?NE1wWVBsdHpLZkpQbGVVM3dhOGFqVHBzNHlOOFN1MlpNb3Vkc20yRDh6THZn?=
 =?utf-8?B?UUdFV21XN3FSSzdZTXZ1Z2dZQnhSTFMyL1FiRzR1YkhMSytYUEc4Q3hVNFF2?=
 =?utf-8?B?cGQxQ0dsVGhzejkrN002VFB1eVYxYTZrTi9SeGNscHpXZ2tIUllETVhSRFc0?=
 =?utf-8?Q?Dhwdi4VnD6nVnI0kAqvhaZiklAlq9SZy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5525.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NjEwNzkzQkR6bU4vU3I3MU1zQ1JoNVNhUTJ2VUlrd0Voa1lEQXlrSFV1WEcx?=
 =?utf-8?B?OGttMzlibmVYbnJQL21QRHhtYXBCWEdMUkhmTlh5bjBXcXMrOXRtV1FzZUZF?=
 =?utf-8?B?emtQRlVkTVZOMWRSclRRTHpIM2RyNkQ0UkZ5bEw5TjVJcWltVmFHSWJEdXpx?=
 =?utf-8?B?VHphVVpxTWlWOTFuOEFnZ0lWUGJRUmpoOUp2bWx5cnJEU2Y2VFI5UmsxM05k?=
 =?utf-8?B?Nm1XSHhleERlbVoxdzN2TGV3Vkl5WGxTRm14ZmlZdlZJeFhyalBmQ1RlM0l6?=
 =?utf-8?B?akZqYUVNZUVIV3N3Z2t2NldNR0NQQkg4V25xY0hTNlpkd3dzOWgxUGxyTGJI?=
 =?utf-8?B?bXlxZG5HUkxGTHVZd1BDNkRBQURrM21TT0RCbEJ6RTgrQzJoT2ZNZVBsamh2?=
 =?utf-8?B?bHVLWjRVTkc2U1p0OGYrSUlOTjcrUnoyMVVOeFpyMG1mcFhzQTE0aTg1anJk?=
 =?utf-8?B?cEF2Y3dNWiswVzdvSzdxSEZCM0RCcE1kSDdEQ1piSTc3Y3pvVkkydGh2eS9O?=
 =?utf-8?B?VkM0R3B2ZE9vNWMweTM3andBVFFUdDdEWjdXbERHWEdZb2JXTkpqblhHQUdV?=
 =?utf-8?B?QWc0OEVhMTZXR3d5aTdISXEyTjF4THlnbHhOZWc1SzlsYUZnRlAvWGw3cXo1?=
 =?utf-8?B?Q0MvUUczM2pVMGJMdU93NVkrcUJ6dnBSSkMrLy80NVd0MkJiMHQ4WkVocXda?=
 =?utf-8?B?Y0hlVHdBNHZDVDVqanlCWVBkUkFSbTBESGFPNFRyYlVCZ3JqcTl6Z3lZSGhC?=
 =?utf-8?B?eWZqUE9IK2UrU0c3cGlOcmlDNVN2ZFZNcjlrNWFNQTJ3N1dmSW5GQittZXY0?=
 =?utf-8?B?MjdnNzlSNWFBTEEvMU9ENW5jdGwxYmNKZ281WDBBRWFXVDhOL1VDMHRSbFNM?=
 =?utf-8?B?eURRNXpac2FyNVFmT1JQN01qa0JnaVBhMEg0MVJqWjBlMk13QjVaVHF1SUlE?=
 =?utf-8?B?Y3A0SysybGVxdTBaS1Zhdm5oeko5dmFMcGxPQzhWUzZGUEFacDVsbkVDUUlP?=
 =?utf-8?B?Qk1rcVhWR1RTQ0hMS1Y2bzJubXgvMGpENGhTMTJaSnBZSm1CQ3l4SFh3Q1RH?=
 =?utf-8?B?QmZ1clZzM1BiZEhIOWpsOTV1bmdkaHFUYVc4VGg1eHN1dERxNjBlaThJSnd5?=
 =?utf-8?B?ZmpoeUZxYy95ajhoU3d3L2pqL25UZmFMZFY5cVBwR0tzOEJXTDk1MS9Cc29a?=
 =?utf-8?B?WitCWEg4ZmE5amVyYTczaE9XYkV1cEpzcGd5ZFdZK0VJbWpJSWIyemFpam5y?=
 =?utf-8?B?ZkhuZ3dSSmdDOWo4VHUyazQ5TzN5NGtCZFVYdnVCQllGK1dkTzVwQTlSRHJX?=
 =?utf-8?B?eWNtakVsaE9DMzFzaU1XOXZvRHFqZmJvSFRaalRMbVlWcnZMLzAvNEN6Q1J3?=
 =?utf-8?B?MmdSdmEwV0c0Z2ZFM2xxUmRTbDNpNjlxK0JqM09weS81ckZqbkg2WG5QWlZq?=
 =?utf-8?B?TmdZMjhLQTZiWDdWQ0crdmZYdDM2U3Ywb0RpQTdEckFaZ1JmeVZHazh3UTdU?=
 =?utf-8?B?TW5tSkhrNTZOeFRaN2dHc0gvckdJZXJNcmU1Z2psOHd2aHV6aG5mSkwzT2dC?=
 =?utf-8?B?bktUOXpCb1pZL0dpQndSMGx6SGZtMmxlSk9BTEluVkpkdFNQRGVvMVRlQmZW?=
 =?utf-8?B?NkQ1NkF3QmZYb0Ixand1Q015cVE1MTIyZFNCRTFmdzBJUjVSVGVnK1g1V1FH?=
 =?utf-8?B?U1AvaTFJZVBKblE2UWZoVWpVYXp5cjhSemFZQnBZdzRMY0VmdmtHMDloSzN3?=
 =?utf-8?B?aVhrdHFibmtQdkxQbkQ4WTd5VFlrTlNzcmk0YWw2Sk8xMTM2eVplUkNIc2J1?=
 =?utf-8?B?TU01dFpnUHRGWGtVT3E3UlcxMStwNWQ1VTNwMEFSVytJTno3UE44cGt3MVVs?=
 =?utf-8?B?T0dEL1BoelVXWDJIbElyekdyTG13TlVJQWZHbEZZQVpJV3p5cUJnVW9ENGJC?=
 =?utf-8?B?TXBoM3cra0lPbU9MN3BOUnZnNXg2U3JrdTlDU1FtUUV3SjQ2eWI3b3orN2dI?=
 =?utf-8?B?RFE3WXEySitDNFNSWWcwODQ1Y3RVL2srd1dOS01uN2srWUpPZUpuY29FeDN4?=
 =?utf-8?B?S1RFcHg4RUZYOHZlanBiYzg5UTJqQW9CSStBOTJFTWhPQkVLQlVpcXliYmk1?=
 =?utf-8?Q?dnZC+WK2NiGTRwu0IswhtlDm6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5525.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5245e4a7-bda4-4164-4bc8-08dd1f4c60af
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 10:11:45.6170 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ABOttfpb7C89STqe2o96BhgiZ5aErKfL337FzdfwMug5wWcoOS1fOCvaQIhDlpgIY7g9XCajZ7wxRX6247z8cYsP76aKB1/mX1PBKrVkmuo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUGV0ZXIgU2VubmEgVHNj
aHVkaW4gPHBldGVyLnNlbm5hQGxpbnV4LmludGVsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBE
ZWNlbWJlciAxOCwgMjAyNCAzOjA3IFBNDQo+IFRvOiBHdXJyYW0sIFByYXZhbGlrYSA8cHJhdmFs
aWthLmd1cnJhbUBpbnRlbC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gdGVzdHMvaW50ZWwveGVfZGVidWdmczogRXh0ZW5k
IGd0IHRlc3QgdG8gY2hlY2sgZmV3DQo+IGRlYnVnZnMgZW50cmllcw0KPiANCj4gSGkgUHJhdmFs
aWthLA0KPiANCj4gVHdvIG1vcmUgY2VudHMuDQo+IA0KPiBPbiAxOC4xMi4yMDI0IDA5OjU2LCBQ
ZXRlciBTZW5uYSBUc2NodWRpbiB3cm90ZToNCj4gPiBIaSBQcmF2YWxpa2EsDQo+ID4NCj4gPiBQ
bGVhc2Ugc2VlIG15IGNvbW1lbnQgYmVsb3cuDQo+ID4NCj4gPiBPbiAxNy4xMi4yMDI0IDE0OjU2
LCBQcmF2YWxpa2EgR3VycmFtIHdyb3RlOg0KPiA+PiBSZWFkIGFuZCBkdW1wICBiZWxvdyBkZWJ1
Z2ZzIGVudHJpZXMuDQo+ID4+IGdndHQNCj4gPj4gcmVnaXN0ZXItc2F2ZS1yZXN0b3JlDQo+ID4+
IHdvcmthcm91bmRzDQo+ID4+IGRlZmF1bHRfbHJjX3Jjcw0KPiA+PiBkZWZhdWx0X2xyY19jY3MN
Cj4gPj4gZGVmYXVsdF9scmNfYmNzDQo+ID4+IGRlZmF1bHRfbHJjX3Zjcw0KPiA+PiBkZWZhdWx0
X2xyY192ZWNzDQo+ID4+IGh3Y29uZmlnIg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQcmF2
YWxpa2EgR3VycmFtIDxwcmF2YWxpa2EuZ3VycmFtQGludGVsLmNvbT4NCj4gPj4gLS0tDQo+ID4+
ICB0ZXN0cy9pbnRlbC94ZV9kZWJ1Z2ZzLmMgfCA0Ng0KPiA+PiArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNDYgaW5zZXJ0aW9u
cygrKQ0KPiA+Pg0KPiA+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVfZGVidWdmcy5jIGIv
dGVzdHMvaW50ZWwveGVfZGVidWdmcy5jDQo+ID4+IGluZGV4IDcwMDU3NTAzMS4uYmNiYjUwMzZh
IDEwMDY0NA0KPiA+PiAtLS0gYS90ZXN0cy9pbnRlbC94ZV9kZWJ1Z2ZzLmMNCj4gPj4gKysrIGIv
dGVzdHMvaW50ZWwveGVfZGVidWdmcy5jDQo+ID4+IEBAIC0xNjIsNiArMTYyLDE2IEBAIHRlc3Rf
Z3QoaW50IGZkLCBpbnQgZ3RfaWQpDQo+ID4+ICAJCSJwYXQiLA0KPiA+PiAgCQkibW9jcyIsDQo+
ID4+ICAvLwkJImZvcmNlX3Jlc2V0Ig0KPiA+PiArCQkiZ2d0dCIsDQo+ID4+ICsJCSJyZWdpc3Rl
ci1zYXZlLXJlc3RvcmUiLA0KPiA+PiArCQkid29ya2Fyb3VuZHMiLA0KPiA+PiArCQkiZGVmYXVs
dF9scmNfcmNzIiwNCj4gPj4gKwkJImRlZmF1bHRfbHJjX2NjcyIsDQo+ID4+ICsJCSJkZWZhdWx0
X2xyY19iY3MiLA0KPiA+PiArCQkiZGVmYXVsdF9scmNfdmNzIiwNCj4gPj4gKwkJImRlZmF1bHRf
bHJjX3ZlY3MiLA0KPiA+PiArCQkiaHdjb25maWciDQo+ID4+ICsNCj4gDQo+IDEuIEFyZSB3ZSBj
b25maWRlbnQgdGhhdCB0aGVzZSB3aWxsIGFsd2F5cyBiZSBwcmVzZW50PyBJIGFtIGFza2luZyBi
ZWNhdXNlDQo+ICAgIG9mIHRoZSBpZ3RfYXNzZXJ0KCkgdGhhdCB3aWxsIGFib3J0IHdoZW4gYW4g
ZW50cnkgaXMgbm90IGZvdW5kLg0KPiANCkZyb20ga2VybmVsIGNvZGUgcG9pbnQgb2YgdmlldyB0
aGVzZSBkZWJ1Z2ZzIG5lZWQgdG8gYmUgY3JlYXRlZCBvbiBkZXZpY2UgYm9vdCB1cA0KDQpzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgZGVidWdmc19saXN0W10gPSB7DQogICAgICAg
IHsiaHdfZW5naW5lcyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEg
PSBod19lbmdpbmVzfSwNCiAgICAgICAgeyJmb3JjZV9yZXNldCIsIC5zaG93ID0geGVfZ3RfZGVi
dWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSBmb3JjZV9yZXNldH0sDQogICAgICAgIHsiZm9yY2Vf
cmVzZXRfc3luYyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSBm
b3JjZV9yZXNldF9zeW5jfSwNCiAgICAgICAgeyJzYV9pbmZvIiwgLnNob3cgPSB4ZV9ndF9kZWJ1
Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IHNhX2luZm99LA0KICAgICAgICB7InRvcG9sb2d5Iiwg
LnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IHRvcG9sb2d5fSwNCiAg
ICAgICAgeyJzdGVlcmluZyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRh
dGEgPSBzdGVlcmluZ30sDQogICAgICAgIHsiZ2d0dCIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19z
aW1wbGVfc2hvdywgLmRhdGEgPSBnZ3R0fSwNCiAgICAgICAgeyJwb3dlcmdhdGVfaW5mbyIsIC5z
aG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSBwb3dlcmdhdGVfaW5mb30s
DQogICAgICAgIHsicmVnaXN0ZXItc2F2ZS1yZXN0b3JlIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2Zz
X3NpbXBsZV9zaG93LCAuZGF0YSA9IHJlZ2lzdGVyX3NhdmVfcmVzdG9yZX0sDQogICAgICAgIHsi
d29ya2Fyb3VuZHMiLCAuc2hvdyA9IHhlX2d0X2RlYnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0g
d29ya2Fyb3VuZHN9LA0KICAgICAgICB7InBhdCIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1w
bGVfc2hvdywgLmRhdGEgPSBwYXR9LA0KICAgICAgICB7Im1vY3MiLCAuc2hvdyA9IHhlX2d0X2Rl
YnVnZnNfc2ltcGxlX3Nob3csIC5kYXRhID0gbW9jc30sDQogICAgICAgIHsiZGVmYXVsdF9scmNf
cmNzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IHJjc19kZWZh
dWx0X2xyY30sDQogICAgICAgIHsiZGVmYXVsdF9scmNfY2NzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1
Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IGNjc19kZWZhdWx0X2xyY30sDQogICAgICAgIHsiZGVm
YXVsdF9scmNfYmNzIiwgLnNob3cgPSB4ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9
IGJjc19kZWZhdWx0X2xyY30sDQogICAgICAgIHsiZGVmYXVsdF9scmNfdmNzIiwgLnNob3cgPSB4
ZV9ndF9kZWJ1Z2ZzX3NpbXBsZV9zaG93LCAuZGF0YSA9IHZjc19kZWZhdWx0X2xyY30sDQogICAg
ICAgIHsiZGVmYXVsdF9scmNfdmVjcyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hv
dywgLmRhdGEgPSB2ZWNzX2RlZmF1bHRfbHJjfSwNCiAgICAgICAgeyJzdGF0cyIsIC5zaG93ID0g
eGVfZ3RfZGVidWdmc19zaW1wbGVfc2hvdywgLmRhdGEgPSB4ZV9ndF9zdGF0c19wcmludF9pbmZv
fSwNCiAgICAgICAgeyJod2NvbmZpZyIsIC5zaG93ID0geGVfZ3RfZGVidWdmc19zaW1wbGVfc2hv
dywgLmRhdGEgPSBod2NvbmZpZ30sDQp9Ow0KPiAyLiBXaHkgZG9uJ3Qgd2Ugc2ltcGx5IHNjYW4g
Zm9yIGF2YWlsYWJsZSBmaWxlcyBpbnN0ZWFkIG9mIGhhcmQgY29kaW5nDQo+ICAgIGV4cGVjdGVk
IGZpbGVzPw0KPiANCj4gVGhhbmtzDQpUaGUgdGVzdCBzY29wZSBpdHNlbGYgaXMgbGlrZSB3ZSBu
ZWVkIHRvIGNoZWNrIHdoZXRoZXIgaGFyZC1jb2RlZCBlbnRyaWVzIHRoYXQgYXJlIGNyZWF0ZWQg
YXJlIHByZXNlbnQgb3Igbm90IGlmIG5vdCBhc3NlcnQuDQphbmQgdGhlc2UgY2hhbmdlcyBhcmUg
dG8gaW1wcm92ZSB0aGUgY29kZSBjb3ZlcmFnZSANCkZZSTogaHR0cHM6Ly9qaXJhLmRldnRvb2xz
LmludGVsLmNvbS9icm93c2UvVkxLLTY3NDgyP2ZpbHRlcj0tMQ0KDQotLSBQcmF2bGlrYQ0K
