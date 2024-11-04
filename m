Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B11BD132A2
	for <igt-dev@archiver.kernel.org>; Mon,  4 Nov 2024 09:42:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D4310E128;
	Mon,  4 Nov 2024 09:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1U2E0Jc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D5910E128
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Nov 2024 09:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730713343; x=1762249343;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=ptfnR+Q2vaUu6gLu00yT23YOeOSwvptBgX5iOeVyoJU=;
 b=Z1U2E0JcKzgpvtb/8RLTIeizKcRMgqHELku8biMOUBIwTC37FoN+5pri
 DvPW/ulJrgExhVvTe4RkWrQAg8UEEXR+jFU00ULrZFUiHEWR230Di69Ec
 O+8j/ZUp0n6/LeZrrFxf4MRPB+EbvGuZ5ThyT0jInxaBiI8vV1ibj1aFj
 KtMm6454ZE8ZiaeayTQux+HP0Fn6ZIzXYnrUEgrLFcMeGwSqxWZ2EKt2p
 DSoW3EYGKJL8ZIz3xO/J1L9GdePKHpNbq+EaQLOj+zhdftPoVBNLOYJvh
 kEp5m4PwTxLMUgTdhsEjjaKP+ILsX1gJY2cNecH7jqhm7Q9NBey+lQ55y w==;
X-CSE-ConnectionGUID: baWAglBYQge3OwMql9yGvw==
X-CSE-MsgGUID: KdiQnXyXRAOuRLPXSvCYvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11245"; a="55801261"
X-IronPort-AV: E=Sophos;i="6.11,256,1725346800"; d="scan'208";a="55801261"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 01:42:23 -0800
X-CSE-ConnectionGUID: /many6u3Te6Aw3RU5r0CBQ==
X-CSE-MsgGUID: QFMOCe5gS7uVHvxeKEu8vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88368192"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 01:42:22 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 01:42:21 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 01:42:21 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 01:42:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nXHpa2bAvAYPuomM7bF+EI/X5YEV+x+NRMXnVIV9rqingpp5P03GO7IcdmBQebsjHmvB/wkaNyDHeblSwEO5MDiHt2SCMyzQOlDibnN5m0aQ6GYgDu5emDCpcQW0mYoxXFRWPC7RLIbGjmXOgggjuC7VjtQ0OKCJtxUM3PlEqxTmlnAU+31BDdm8gizzPwZ4/SZjnJioDGFr5LYSB54y4hztkO9mBcwVG2Yxffc4dVUaHuZvjdZC/XFO1fVVKKbFsk2ImQoR1hrjvBCi2us0YMnYPlSx091IuZ2LTUdSe/REvUCKB5UrNaKODpTZeouwZfB0dAHRZEWymX5NDY6fUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptfnR+Q2vaUu6gLu00yT23YOeOSwvptBgX5iOeVyoJU=;
 b=nvu0X6y+Oh5hPpD7ykM0trH8HFVtOs3yp5qziN8b0QsxyBZVnYW9sU8ec2Mbw2iOpHVDdR5EMdepA7qVM4VYor/w8RB5C94oAb7jIPkm1xVrq2XzfMHvsjvQTzNztVEwpxZPbWzTCD8yV4Gu4G1wBPQYzxylNJB+kvBMpQR6ltEATcLIbM+tmjE4Iu8XprtcbhfmnwBqk76eAxpm8jwfTsz+4Dv7AVfeFHGmdNXlN22RIef3NeDLAGAlb5DuVnjE2pBInjy8c+Il+D25zc3wAMtqiMzZDIH8eYBIbQ+YYKiEmbEqAC2l2kPzUj9tmmLYuog7rtQEnR/udyF9nCtMIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MN0PR11MB6303.namprd11.prod.outlook.com (2603:10b6:208:3c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 09:42:19 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::fc1:e80f:134c:5ed2%4]) with mapi id 15.20.8114.023; Mon, 4 Nov 2024
 09:42:19 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "B,
 Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t] tests/kms_vrr: data->switch modes[LOW_RR_MODE] not
 initialized for lobf test
Thread-Topic: [PATCH i-g-t] tests/kms_vrr: data->switch modes[LOW_RR_MODE] not
 initialized for lobf test
Thread-Index: AQHbK454lOGW0zG8W0ilP9EbfX3Z+LKm2tsAgAAJtAA=
Date: Mon, 4 Nov 2024 09:42:19 +0000
Message-ID: <bab478932f9c69426127ac97f429b60ff0b80366.camel@intel.com>
References: <20241031121355.3419367-1-jouni.hogander@intel.com>
 <DM4PR11MB6312F9E60F059D0919EE461090512@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB6312F9E60F059D0919EE461090512@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MN0PR11MB6303:EE_
x-ms-office365-filtering-correlation-id: 9ef4ba3a-489a-4071-977f-08dcfcb4f992
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?elVBMGlNNlgxWm1zUEdOK3p5Z1J6SlN4U2hLUGY3UzBWa3hQUTVBUzFoT3NW?=
 =?utf-8?B?OEhjc3d6UEFRMkxSdWdVRXpZbjdOSW01ZDk4R3hIUkxERnVlS3BrTGhTT2Ro?=
 =?utf-8?B?NEJJYzNXcEZ6QXRMYVB5UGg5SlY4MW0wdDRvZG9mR1J5UTNGVHlLYmJQSjRW?=
 =?utf-8?B?VFFLUDhXUWVSMzBTbFQwd0xPZHI5c0ZPZjk1aUo5NEtVRlFnYW1Dem5Sd05Y?=
 =?utf-8?B?VXMySzR6SmNya2R6NmI0RlpnYUhSUWdsL0M3dUVKRFJ0Y3pIbTlXS0tzNFRq?=
 =?utf-8?B?bWt3T2lNb0ViaWIrZGdzUXNtOEFMQUNQQ0dEUzRycjJEeEd2YXpuZXU3UlIv?=
 =?utf-8?B?V21WOEh5V3RrUkljY3FCakkrUHd0VStRbTEzRnFyYTFDYThFOHJIK3hNaTht?=
 =?utf-8?B?ZWYzWERrN2dMcHlOdktXNDhJdnNqZG82T0ZHQXgzNllIcU9BYnRtSXdsVGRN?=
 =?utf-8?B?Ync3ZWhqYnNhKzllUkRQTWdWc1FNRG9MdUp3SWFsdXJMUEt6WlYxQWFIeWVs?=
 =?utf-8?B?RVV5TmpaZGQrdzFFTXIxZzlnL0RMNzdiakFKTU9tQnpxNWVaZ1YxQzIxVUR0?=
 =?utf-8?B?ZENJRzR4Z2FweVlJNkY5Z3JDLzdKMlQwRWVpNFVrUUYwWkJ3TStNQjFKckhI?=
 =?utf-8?B?MHFTZnpjZGxqZUI1cXlhZmlwU3d4WTVFKy9hb2FrMHRYVngvTms5RUkwMG9p?=
 =?utf-8?B?anpPbDBLcVhhSDBFOTRXT0VzSzhTNmRna0w2L2EwazRMcENwcmkyNmh3TVBl?=
 =?utf-8?B?bVgyNzBHTzJFOGYrNGVmK2o2bVdFOGl1c3ZnSWtzTkdjaGVLN0U0dGdLMWpq?=
 =?utf-8?B?QUpsUjdNOHJEcXIzOEhkZHZ2NXJKQVRtZDIwVDV2ZHVQbTdZa052NU5DRVBk?=
 =?utf-8?B?dkd5bVRLMkFsOW5adC9NK25FSDUrTWk0c2hDc2NRWU56cmV4TmRFb1NGWkFq?=
 =?utf-8?B?em1Td2c1YW9KbmVLOXJIK1Q5MGFic20zQTFWeWcvUCtJbm5OSWJSTFNLZGV2?=
 =?utf-8?B?MzFxY1NQMWRPZWkrU0hYcjJhMzlWUjNFOG0rdUJzOHZiWVdJdjVwS2tXN2Ry?=
 =?utf-8?B?YzBkdThCZksxQ2llT0Q5STBiYUlMYm5nVjBCK0hOeWNtM0c0N2pxN1g4bmcr?=
 =?utf-8?B?bWtackMzcmYwNFQ0enBkdjFKb1dyTmRwQy82eC9OMXIvdmNQKzROZGN5YTJR?=
 =?utf-8?B?VGdmbFNXR3ZxNDFWZ0xkVFMvZ2IyMUdnZkJ4d01aRVl2Ym1qbjN0aFVTQ1dJ?=
 =?utf-8?B?d3BPdThvKytiNlI0YnBCY1dPOHJYMTllbndJTkFqTm1aenhka2lya3p1TVp1?=
 =?utf-8?B?b1JXeGNIZGgyQUpEUlhyZjE2TGdibWlSZTE0SHdBV1hZNWFxS1pnV2RGUkF1?=
 =?utf-8?B?MHZKSVQzL21pNVJqbHk3UERkODR4czJETjNNYWorTlZ2OGlMM01ZUE5rQUE5?=
 =?utf-8?B?REF5S0ZLL1VYQlBaSlo4MlhNWEp3UnhtVHorSDM5R2htcjMvNmdDZlhwVkdP?=
 =?utf-8?B?R3F3eEY5M3FHa0JLc3lCbmQwWkJOK0ppWnoyK2NobGpZZ0tLdGpKWThDU0Ez?=
 =?utf-8?B?dng0dnNFaXplUStvWHpmZzdLMkxlUG1mWDZJL1hnUFZEaEtQTGJrOURmVldY?=
 =?utf-8?B?bjVkUzJHOVV2cUxzeWNMOU9YZHVjNWZNcFNSeUZmQk95TWtnZXBua09HbXRv?=
 =?utf-8?B?U3gzSlQzcWpOREI5QTdDMFFibm1IQk9KVDc5cGE2WlhMRmNPdWRzbHF6Qkcx?=
 =?utf-8?B?RmxGTmoyZXF6WHdiUHF2SGJDWVlNVDVsUVJGVmhSdDNJVmptaUNkaTFlSXpC?=
 =?utf-8?Q?ep6a7IHpK/PQZyikcSTHVdLzpzwXtRejfnn5Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MDNrMlR1SWtNY2pjMlZkZWRkMHk5aGtkTVlzUzhOU3dIWldnc2ZtZCs5VXBZ?=
 =?utf-8?B?L3h3aXkzSG1FWHBzenMvMytkaTh5YzErQ2h3d3RzRzZKME9vNFoveG1VUWxo?=
 =?utf-8?B?SWdUVEY4OEIzdEg4RzdRU3QyL21iTWVFLzNTcWd1TTFyQStGdG4yREt4UzF6?=
 =?utf-8?B?YkRtbnh5ZWxhb1RKaGJCZURjbDAyN3lFVVlTRGdLZ01INlBMS0ZlaENtbDNo?=
 =?utf-8?B?dEVVbG4zeUtzcU9uZi82cWlnamlTQWJzQVhtVmxKQVkzTWxjc0J0dW9ZeUFR?=
 =?utf-8?B?cm8vd3E2RnlrUzZacHRINUhtVEwwcEIzZFpNdnVscnhWQ3A1cnhGaXByQVVY?=
 =?utf-8?B?VlJMV2pSRWxSNUhyMnFsV1JXcHp2VnN2TUNKVzN3RitoTGVaa0tyNXlZRjNh?=
 =?utf-8?B?dlhZUFliZUNoYk9uRjJqMDVJZUNSRDhZanI5d3B2UTBoSUtlcURtaEpXMjE0?=
 =?utf-8?B?RHF4K3czZzR1VjlSSnFxcmhNQ3lTVzZwOWQyOGg1QmZCZ1RTVWQ1ZWV3OHBP?=
 =?utf-8?B?MjhMcVRhZ0tuZVRVQ09RWTRqWW1YV3FDQ2xVMXVGejlES2p3NkVIN0pCQ2Ry?=
 =?utf-8?B?aVp2eWRTdnZzSUFsS09ySFhlWGRkeXQwYlZ2UG9lK3pEblo5QlFPUXgrWXpY?=
 =?utf-8?B?VEJQd2JsSk1HZUNQaGNuMlhXT2t4Qy9tNmZNOTlxVk5zMVB5eWVvdkRXSmpu?=
 =?utf-8?B?OFN2TEZKeWMvNCtONUVOK3pPbkdLMytGbTlucnNEa013a0pMMTFYdFphK0xx?=
 =?utf-8?B?WHMxL2FVSmo5b0QrcmhVQmNBUDE4MURrNEhoSjIyRGgvd0lmbHVPU1BsVGtT?=
 =?utf-8?B?ZE95M2x4VDJ5QXpWUkx4eVpKUkVFZEIySGk2blU4SDhrTHE5eGdmV2VWcGdz?=
 =?utf-8?B?RWIvYytGaENuVFFuNW9CbmFVeFhFd2hWT2FGNXU2TFZIWVltZHF4aTVMS3ZL?=
 =?utf-8?B?WStsT1V5WmIyV21TdFJtN1IrTGZyVHZhV09JVEc5U1BhWDFwM2VicUx1cmIz?=
 =?utf-8?B?M1YzY1lPL3BWUGppdmFpWVR6S0h6d1MxRVdrejBRZnUyd3p6elBlOW1NR3Bz?=
 =?utf-8?B?RjZNb1cyV1RWVUtlVUlkdHRjdGEzdWowOWVSQnVWWlRQWWxISkdqTVZ5enpW?=
 =?utf-8?B?dm96MmpwSW81dzFTV3kydmNuR044STdJcDh2RHRWNUVUQmJ4MVJuVStGdTFo?=
 =?utf-8?B?a1l6QWphWDVlMFlTVHZuSzN4dUZaVnlaRWxlaXVianBKaGJaZTBwTUNQT1RX?=
 =?utf-8?B?amRtVVI0ZzB3TXM4NWdUWGJnU0Y2Zi94U09DWUd3VG1pY2NPdDhBZFVobGZ3?=
 =?utf-8?B?QzRmSnhPRnJld0VmVEp2VmNMRXRmdnJGMmpMVmdEQ1dXRSsza0hFUDFiNk12?=
 =?utf-8?B?bjlzZDB3K1FzZHlVTjhGVU9sV292QlFGYjdOQmxNb1VRSEZpakk5MDlTYmoz?=
 =?utf-8?B?T3FWc2FrTzU2VmVzZy9UYTlGZ05hVHdya2Jja0ZqbXdqV1RZbzRCRXRHWG1z?=
 =?utf-8?B?RDRlUnp2QjB2a0hacjRkd24xLzM4b3hkaXd0ZzJBVXRsLzFnTXFJRTRhcXlR?=
 =?utf-8?B?aEwrYzZRaG9ZSDZnVjFBb2kzZmVWZk0vQnhLMUd0TE85Ulc3UTFXTGNGeDEx?=
 =?utf-8?B?YXN0L0hUZzBhVW1nT2wrZ1FlRnNPMkpiR1Y3VUl5RHc4UmNIYUJPZ3BqOFZ5?=
 =?utf-8?B?V2hVRTZ6TXNWdUU4SnBtQldMYnNYZUZZa0xqNytML1hCdm1BbThpMWFGRXFQ?=
 =?utf-8?B?YnlkaGNkZlBVL3hsamIwaWlRSlNBVzJvZ0dOSGNRQTdSbWRBbWhCcVg1a0k5?=
 =?utf-8?B?Sld5bFFzOXlOekgwMVlkMVJrRWFMVE8vNHRFdDA2bGVmR3NuZnZoSm9xNnh0?=
 =?utf-8?B?VlFjSnR6c05YSW1mVG9nZytUUUJrd3dzWDZjUzhYMG5YNkxXWEpIU2pNYXRK?=
 =?utf-8?B?dUdlc29Va0MvRVZ2N2ZpbDd1MEJpM3J6TG85UjJUdm9zS1NQNjBPWmhuOWRw?=
 =?utf-8?B?STFrY1ZxeHJhbWtvZmd4eDdraC9TbmY0VktzNWFHYm5DbWNpWm10WWZqV25Y?=
 =?utf-8?B?VWFiSU9sVVlQMGFoVzRXTWprLzBjdXJXL3Z0Q2N5UUZGRXk1UXRtc254bXdP?=
 =?utf-8?B?RTNaY0ZRK2hXMDhmaCtyRVlLVzRiTmdBMGVJWlI1UUlzRDlwcW85eFM0b0ps?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1E1D3CEFF6DCF54F866DABA7A58048F8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef4ba3a-489a-4071-977f-08dcfcb4f992
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 09:42:19.1044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tPpaKF6bQgiatxqOH6wIJalNgLplb7ah7woocQ57GkljRnuss9ORaGQggVRTeu+DodRG9o9mjEQQKdC7l/6tqEBr7UM9FRw2OzSCUqFSgWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6303
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

T24gTW9uLCAyMDI0LTExLTA0IGF0IDA5OjA3ICswMDAwLCBCLCBKZWV2YW4gd3JvdGU6DQo+IExH
VE0NCj4gDQo+IFJldmlld2VkLWJ5OiBKZWV2YW4gQiA8amVldmFuLmJAaW50ZWwuY29tPg0KDQpU
aGFuayB5b3UgSmVldmFuIGZvciBjaGVja2luZyBteSBwYXRjaC4gVGhpcyBpcyBub3cgcHVzaGVk
IHRvIG1hc3Rlci4NCg0KQlIsDQoNCkpvdW5pIEjDtmdhbmRlcg0KDQo+IA0KPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+ID4gU2VudDogVGh1cnNkYXksIE9jdG9iZXIgMzEsIDIwMjQgNTo0
NCBQTQ0KPiA+IFRvOiBpZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+IENjOiBCLCBK
ZWV2YW4gPGplZXZhbi5iQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaQ0KPiA+IDxqb3VuaS5o
b2dhbmRlckBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogW1BBVENIIGktZy10XSB0ZXN0cy9rbXNf
dnJyOiBkYXRhLT5zd2l0Y2gNCj4gPiBtb2Rlc1tMT1dfUlJfTU9ERV0NCj4gPiBub3QgaW5pdGlh
bGl6ZWQgZm9yIGxvYmYgdGVzdA0KPiA+IA0KPiA+IGxvYmYgc3VidGVzdCBpcyB1c2luZyBkYXRh
LT5zd2l0Y2hfbW9kZXNbTE9XX1JSX01PREVdIGJ1dCBub3QNCj4gPiBpbml0aWFsaXppbmcNCj4g
PiBpdC4gRml4IHRoaXMgaW4gb3V0cHV0X2NvbnN0cmFpbnQuDQo+ID4gDQo+ID4gU2lnbmVkLW9m
Zi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+DQo+ID4gLS0t
DQo+ID4gwqB0ZXN0cy9rbXNfdnJyLmMgfCAyICstDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zX3Zyci5jIGIvdGVzdHMva21zX3Zyci5jIGluZGV4DQo+ID4gMzZhMjJlZWJlLi5kMGRiOTU0
ZmENCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS90ZXN0cy9rbXNfdnJyLmMNCj4gPiArKysgYi90ZXN0
cy9rbXNfdnJyLmMNCj4gPiBAQCAtOTIzLDcgKzkyMyw3IEBAIHN0YXRpYyBib29sIG91dHB1dF9j
b25zdHJhaW50KGRhdGFfdCAqZGF0YSwNCj4gPiBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgdWludDMy
X3QgZmxhZ3MNCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWd0X291dHB1dF9vdmVycmlkZV9tb2RlKG91
dHB1dCwgJmRhdGEtDQo+ID4gPiBzd2l0Y2hfbW9kZXNbSElHSF9SUl9NT0RFXSk7DQo+ID4gDQo+
ID4gwqDCoMKgwqDCoMKgwqDCoC8qIFNlYXJjaCBmb3IgYSBsb3cgcmVmcmVzaCByYXRlIG1vZGUu
ICovDQo+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKCEoZmxhZ3MgJiAoVEVTVF9TRUFNTEVTU19WUlIg
fCBURVNUX1NFQU1MRVNTX0RSUlMpKSkNCj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoIShmbGFncyAm
IChURVNUX1NFQU1MRVNTX1ZSUiB8IFRFU1RfU0VBTUxFU1NfRFJSUyB8DQo+ID4gK1RFU1RfTElO
S19PRkYpKSkNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiB0cnVl
Ow0KPiA+IA0KPiA+IMKgwqDCoMKgwqDCoMKgwqBkYXRhLT5zd2l0Y2hfbW9kZXNbTE9XX1JSX01P
REVdID0NCj4gPiBsb3dfcnJfbW9kZV93aXRoX3NhbWVfcmVzKG91dHB1dCwgZGF0YS0+cmFuZ2Uu
bWluKTsNCj4gPiAtLQ0KPiA+IDIuMzQuMQ0KPiANCg0K
