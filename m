Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80D65CAC598
	for <igt-dev@archiver.kernel.org>; Tue, 16 Sep 2025 08:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C60910E30B;
	Tue, 16 Sep 2025 08:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IiCaosmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9DE10E301
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Sep 2025 08:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758009843; x=1789545843;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=c6dMeyOMxzjM4xirQmHnlMGi4dIFx4NZUEzZYpOKl20=;
 b=IiCaosmIYzXHdggvJuNslkp07/NYN9qSGb7vPjpjvLFplKjf74Q+hGuE
 /QDneS2aOamWacUkGDEaFL1ThlQ1EncIf8Po9uP4CxmgUjGPZlf21jvw6
 rnM4SKcIflA2tkLDQa6C523QDLrrA1pG040Fs9iYYjjmVThX3wocLpVkL
 zqg2ad7P2Bp2YZ6xyhe6Zkla/1lHwNYoTaCSoQ8hOwBshj2WNEJmngLnW
 nTjnpfPpCy/PGPVkVGYlg3T8eWvq116vxnB8GmJ+b04Foat/00ggXToAQ
 1hoO9yW2y66o961wjdVPYnAk68JZBAuJ2QA/QG8CBvmPpJQu54SUanwNa w==;
X-CSE-ConnectionGUID: PWvSRAskSVChjqPvkeA66A==
X-CSE-MsgGUID: OgX/7rFrRHKmIJZjlXHQag==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="85718623"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="85718623"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:04:03 -0700
X-CSE-ConnectionGUID: u8LkpDFmRpys4Z0BMQRnAQ==
X-CSE-MsgGUID: PDBVMNcTRg2kEM7SAHHkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="180119265"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 01:04:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:04:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 16 Sep 2025 01:04:02 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 16 Sep 2025 01:04:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSJmOyua+znk0yg/7wfkGiq/Qls1IF1VRCOT7by2YXKi82IkL1qcohrnFvsAwFo00igfDQuvT2sQy8N71vh0XzDVPogj0jpyzi8yhOdUyv4PB8/uXdvj3S3ptDoQFdXJNLIL4yv+XJBmkYQBY+C80vUo+N5bdSLwbxoFGyqI8a0LLh1mLBUS+npQAo/UCbSjquECAtJs3oBoxcvNOOzMucpeTkJ7laXiX8vUgKVuaeJmkXF7nFjN6FED3NhnHu+GNFRBx/hRE8HSqL89R0huaitGzy+r2ZBTW4/YY04StkJVxH4olFTODSrFlNxOCYhOUzXTEyUFkuIttSeD6OXJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6dMeyOMxzjM4xirQmHnlMGi4dIFx4NZUEzZYpOKl20=;
 b=jH147Rn0I6Ca8gOh778x1HpPsRTHgLkVGuCKS5jd2w1uSSdbiLEGPMafs8Jp2/pCMWYLZqWlFq1FQLCHbLgSmhiIvf5AJWcyMvXJZ2V07bE/BNczP+lCpyvEJyg/xh848gQ1U/0HSU0byF6G2PhmwAuIzHNwt4wU9er/q9Lyc8f6xdcpHF/uw+ywmIeziyg6ofXGvjU/QR/lCmma1pcEFDVBRngKVXeG/rpf+azIrGApYV44dGdJOv77bpR1K+ewfi+p19R9IvzdQ/fIxITpOCVqbeQTUG7Xe7/8AaygW9g0J9PvMRVBUQrgQlu2bwabek2BeRmemQNdsndi8wZW0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7777.namprd11.prod.outlook.com (2603:10b6:930:71::14)
 by CH0PR11MB5219.namprd11.prod.outlook.com (2603:10b6:610:e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Tue, 16 Sep
 2025 08:04:00 +0000
Received: from CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8]) by CY8PR11MB7777.namprd11.prod.outlook.com
 ([fe80::60a1:eab8:65ee:6bb8%6]) with mapi id 15.20.9115.020; Tue, 16 Sep 2025
 08:04:00 +0000
From: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Reddy
 Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
CC: "B S, Karthik" <karthik.b.s@intel.com>, "Sharma, Swati2"
 <swati2.sharma@intel.com>, "B, Jeevan" <jeevan.b@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/kms_fbc_dirty_rect: Limit to one
 format on simulation
Thread-Topic: [PATCH i-g-t v2 2/2] tests/kms_fbc_dirty_rect: Limit to one
 format on simulation
Thread-Index: AQHcJr9j8aASnMALIECWlQ7UAFKQUrSVc2kA
Date: Tue, 16 Sep 2025 08:04:00 +0000
Message-ID: <a6f6ab43bef88c0f1887351dde72672e6e3cc160.camel@intel.com>
References: <20250916040455.267648-1-santhosh.reddy.guddati@intel.com>
 <20250916040455.267648-2-santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250916040455.267648-2-santhosh.reddy.guddati@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7777:EE_|CH0PR11MB5219:EE_
x-ms-office365-filtering-correlation-id: 55fe9f54-e702-494a-b74c-08ddf4f797ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eFJMTDZyZHZwWUg1Tmp2MEVYS3g1VjdJS29UV00xN05yN01iUTM3L2NDelMx?=
 =?utf-8?B?M09BNFhSREZKY3VwQit3dVE3a1J4VWlwNk93emtFc2ovLzg3MVZJREVua0Zy?=
 =?utf-8?B?a2F5TkVsM0Y1Y3hEZDRyOElnV0prKzZ1VmR5QnBta2FWUCtqbTQvcFRza0o1?=
 =?utf-8?B?MCtyajk1QWQxWDFrbDkraVVlc0pPUVNUUnRCMXJ6Q1FiRG84K2I2K1ErbEpH?=
 =?utf-8?B?OGRpSytsSXN3NERaZDkrK25rbEkvb2kvSUpwVEY4M2p1dXQyZHRjWWd4NWJw?=
 =?utf-8?B?bVowd0JwZEJBY2dySXVpcytwS1BuaHA5RFhpRkd2VGZrcEwyWjhrb3lVYlU4?=
 =?utf-8?B?YVphZTdhdVo4QmY2d0ZxRmlzaDVDUzI3Q2VuMVkvS3c2MGdLTU9QbDYwZ0k3?=
 =?utf-8?B?QXZmRnFVUlhnTW1aZHUyREFRVC9pQ2ViWlBlZGdhRjlYN2dpMzkrWmhtQ1hx?=
 =?utf-8?B?L1VHTEZXR3M1Y1lrNGM1WUtnQjlNc0VXajBPNjBwTmpOc1RXdkx3TWp4MGdP?=
 =?utf-8?B?Q21sOGg3UWFTT2ZhK3ZjVk5YNkJSdjZwUEhRVTNTZHBYSW85NmNMekZXT2M4?=
 =?utf-8?B?aWhaYnlSbDZYcXY0T0VxUnBMVUYydFB1STNOMGtIck8yOHJSdVNWVmh6RHNR?=
 =?utf-8?B?VTRqSm9CbWlwVEJabjRHS2d3OVN5K2IySzlicjFyZW9VMnNHU1J6ZFlRdHRQ?=
 =?utf-8?B?V3p3M1kzRmhxTWU5OHgvdlhGNWx6SVZreURrVmxZZlQyZjJvT3B6dlp2UkNT?=
 =?utf-8?B?RDNOTXNZNHArZGRNQkhkeVJzNDVkMHl0cUNPRDFYM0pFYVl4S3g2eVFtaktX?=
 =?utf-8?B?c1JMZ3ZzMi85TFNrL0x4OEh2c1ZkUm5RWHE1cEk3QzBtbmJjb2hRL0xYT1lZ?=
 =?utf-8?B?WStoL3FSaGRNcllFd2R3RVA5RCsvaUEycCs3bHJ5c3FmdGNyV2xpeDE4T0ZS?=
 =?utf-8?B?WlVMcmJiNzRFZHFMUnhwRGllSzVQZXh5OXU2ZTZPd3ZkeW16K0pRL3k1K3BB?=
 =?utf-8?B?UVpXQVV5dDExVDNXckxycXpLZnIvN0tOdmVWSW1QcUdSSmdyZ005dGVSWVJt?=
 =?utf-8?B?SWJ5V04rK085dFBDV293TVUwbklEdFE4eTAxZmNiMk8wQjJKL2pRMGphNDk3?=
 =?utf-8?B?RU04b3ZpY01pb2YvK3IvZ1lyMHE0aHF0eVRpNmZvVWFPYS9ScEtoNDZiWmsy?=
 =?utf-8?B?SnFMcWNpVXUrV0plajE5eFRuYW9BdmhpSG5XWW5TTDB0RXpydlRwSE5zWkk4?=
 =?utf-8?B?MTg2RzdMcmxCclpFUTN3ZlpQQkl3MjlEcGNBL1pZUm9hdFAwLzkxZ1NxdWtZ?=
 =?utf-8?B?bHF5ZWcrYUs1UXJhN2FiWmhyazJvYnU0VGVMK0diRklFd2RNamlTM2ttQWN0?=
 =?utf-8?B?L25yeHJUblJ1MGp5Nk5MYXIrUTdhSHd5bGdoODFoNEVya3NKdHE1Um9sdUNP?=
 =?utf-8?B?NStNSnovSVk1cEJ3WC8vZzRuQ2luZU5scE0zSFZIT05lZFNDS3FuKytsaGdt?=
 =?utf-8?B?elhrWmYvTEVOVXhySFNTN2lHc3c1RGJDNWhpcDh3ajdtVWNuOVBkWHl2d2FI?=
 =?utf-8?B?bkNZQkRvWExNZ0lVOWtuMVlKSmZmK2R5NHIzUFJidkExQk5CNkkzSERYaUh0?=
 =?utf-8?B?Z2pETHJvNGdvU215bEp3RUhadzBxSGhhaGNqV1Zlajg1NDdWdHpyZmx3MnpY?=
 =?utf-8?B?Z3h2ZjBlb21Ga3VqVWkraFprTnVGVTV4OGNrcFNsdWM3QUZGQkdxUDE0RWp3?=
 =?utf-8?B?VGx4ZnVBaTI4cmtjQ014Q1ZaQXg1QndtUERNaWRXOTRFdk5vTk5PTm1sWHBt?=
 =?utf-8?B?dkNjZ1RhSlVpMVh1SWJyWFFpT1c0clNPcE5qTlNKUUsxUVRNL2dvMklYTCs2?=
 =?utf-8?B?b2JUT21EcVJlM2RyMUMrOVRaS08xY2VCUmNUZ3I0Nk9KVmRYK0dRc0F5eFl5?=
 =?utf-8?B?Myt2SGxlcjAzcGZZTGU4bmE1SUdxYk1sTlQ3UEtUZWk0bC9BbWV0ck1RWGZ1?=
 =?utf-8?Q?6Y85pRPQEiZHNkXLM7zBqHTSzrFckY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7777.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c0p1amJySHdIaHJIOUllU1RoZDI3RGlzT2MzcGFKN0RxQVJzVVlybnpWZXdG?=
 =?utf-8?B?OWZSUDN5T2ZqOERmbm9YQUNPY05VMmZTcUR1UkRGZzRQcDV4Y2V5V0dZU3Vp?=
 =?utf-8?B?MVgrQ0hLbE9MUytidDVrclhhK2NoWUlvNk9sVXBRcWJycVpDQzd6NnJCM0NY?=
 =?utf-8?B?dFZNa0ZmcDBmYWZTbTNJM3NJR3lPRUwzV0hwZTl6UDAzdGhYSGc5dTBvWTM1?=
 =?utf-8?B?V2J6emRXK3EvOGRYOENNdTJmL0NZZVBhbkhhVXNCelZsVHdJZ21XVTcrblpY?=
 =?utf-8?B?K0xONU1EWllpKzlyd082Vll2bFV0SThQamQ1RTFnblhTVWJsUnpJL3VCaTUv?=
 =?utf-8?B?WExJTm5LMThoOVByMDdnaTR2M3JVRm5jOFl4Y2ZjUFYreFBPOE5OTDdUTzEz?=
 =?utf-8?B?RThNaWpxK0QyS3lHSXN4eFBhWjFEOUg2R3ZTRWJPcmxubDlwcXZvRE0vOE9v?=
 =?utf-8?B?aVV5ZTFMNFN6ZGpDQVhNTGc3UmU1TlBNOGVpN2MxdGFXaE5MaXlmRGZUdkZN?=
 =?utf-8?B?bmNWQjJUYUprUnZNRDN0R3M5eU1Kc3JXOVR0T3RHOERMWVZQUUMyQVVWZHZo?=
 =?utf-8?B?SDd1RkdPUUlZYjBYdnh2SVRrc0NSenRpU1h0SmZPbS9Rb2ppdWdxYkNBWGdk?=
 =?utf-8?B?M0g3NGJZVGhIcnkrM3JKOE5zUWVYYldUK21wTlBrS1E0b1daNWtwMzBEbUpR?=
 =?utf-8?B?NFUyR1l4VU9yaldXVWNnMjVGdzFoc3RJNjlSZlZPaGFEZWJoeUJiWmFGSEFK?=
 =?utf-8?B?MWxPV2FRNXY2MVhYTlVZRGJkVUJIRlBYRWRzcE9ZVkMzdkt1N0dSR05aSnU1?=
 =?utf-8?B?NlEzVHE4WUovSFQrNmNqakNWTWVqWURETUFyalNkTVBKRWpkMkQ5L2ZObEZG?=
 =?utf-8?B?NFd6VUJPZ29TZjRXVTMrZXNtKzN6Qk1tcHNMcEJtd0ZxSGwxclhBMTU0N0tN?=
 =?utf-8?B?Ylo3bEFlaXA1UXJDZmtQQ0V6OHJYcU81MWo3c3VTdGZSaGxlRERsSE5EM2ha?=
 =?utf-8?B?clRVNkVFU0tkaFI1QzEzdUE1T21IV29JQytzanFUd0FlQkxiOUg4bzFSY2pH?=
 =?utf-8?B?bEtYYXBzN1ZQV2dNc0FCNWpxa2RDdXNmd2x3ek9mbHI1bzJiRWp3cXlaaFFt?=
 =?utf-8?B?akxvZHBpcEo5UlQ3TVh1NmFMSnozcHhXajkzbVh1ZU1ad0Y2MDBBVWVlMHdx?=
 =?utf-8?B?L1FGTTVhYkN3Z0hzYTNFOWd5TUlNeFVkUk0yL1lwY0xhT05Lekg0aFFoQTlt?=
 =?utf-8?B?LytkQnBDQUJwZGVybjRwRjgrb3RhbzhUMkhoekgvQzZIT1drU3hpbXd5ZGNq?=
 =?utf-8?B?ZDhtT24ramFlUnpWTmN5VjEzNUx0YkNaSjAzWDlGckNjZ1BLcTQ4RFJDdXRa?=
 =?utf-8?B?WVRKOVVMS1pmRE1uSDB0eDhrU0xBa0xHaFJkendnUzlsOFlxcEVmcG5EbDYx?=
 =?utf-8?B?cE1UaHZrTkFaeStEcG16aUZhSllXU0FWaWw2MHNsZXVoaEMvM1BBajhmKzI1?=
 =?utf-8?B?L0o3RlBKU29WVjR2RXVMV0JEVWFzT2w1dGRaNVIwdzlxZW9hM1lGYnpwSDBH?=
 =?utf-8?B?OHhxMDRCRStDTHM1TDM1eHczbUVvSFZDQ3F4U0IrRVFyZDZPNklQbHZPcVUz?=
 =?utf-8?B?TGdiSzBBZzAzSWZFVnFrYXdqSGlKeFZXN0lYdzdnVkVZZWVyQnB2WUpPaXNY?=
 =?utf-8?B?NStJN0M5UVJHbFRBdGx4OFF1SUlXVGw5Q2tZVUNHSWFobmlLYWI2eW5jVEpU?=
 =?utf-8?B?K2xHTGdRdDFRdzNiZ3hhamdrdWk5QVFkMk15VnE1ZFFWa25scm02TTFwcDU4?=
 =?utf-8?B?SjRVaFJBNXFuUzNFOGpDZThqNEF5eDRsdzYyejIyWStQOU5tSStXWVFpb0Q1?=
 =?utf-8?B?UTdHUVpmMW41eDczR3JtZDI3UnVicm9BSnZMWjcyMHpWVUc0WllLL25Ya2Z2?=
 =?utf-8?B?S25tSW9NZzhCWXdoTVZGZng0eWsrUTVFNUdmOHRHM1JGRjIzc1lKVlV5cmQ0?=
 =?utf-8?B?bGcxNGtTODQrd29md01OZnJiUUkvSk9kajAzN3BQZjV5ME5oSmJyM2JuTGNZ?=
 =?utf-8?B?bnN6Qm1hdVBEU0ltdUVRNUNieXl4R3A5d2ZSa3lvMURoSisyR3BvUlRQY09G?=
 =?utf-8?B?RFFJd0VsZWFTM1NmOWd5UmQ1L2xBSXpjUk9RY1ZBOXBWaGhTVDFNS1dSdTVw?=
 =?utf-8?Q?J+6jQqsnYq8jbwaFBRoq5Fg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <216DF35C83F82E4CACEF4AA97E06F55E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7777.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55fe9f54-e702-494a-b74c-08ddf4f797ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Sep 2025 08:04:00.0274 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CunVknEt+/3hgRrgs0YYR/HBH2sUzwp+PdA2kfX5ydpYqFpdi3xurL2Ek9Ba2cI/pkgGR1iyGrWT3xvNUDpHy67YWuJzY7MecRKO5AUxYeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5219
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

T24gVHVlLCAyMDI1LTA5LTE2IGF0IDA5OjM0ICswNTMwLCBTYW50aG9zaCBSZWRkeSBHdWRkYXRp
IHdyb3RlOg0KPiBsaW1pdCBmYmMtZGlydHktcmVjdGFuZ2xlLWRpZmZlcmVudC1mb3JtYXRzIHN1
YnRlc3QgdG8gZXhlY3V0ZSBvbiBzaW5nbGUNCj4gZm9ybWF0IG9uIHNpbXVsYXRpb24gcGxhdGZv
cm1zIHRvIGF2b2lkIENJIHRpbWVvdXRzIHdoaWxlIHN0aWxsDQo+IHZhbGlkYXRpbmcgZnVuY3Rp
b25hbGl0eS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNhbnRob3NoIFJlZGR5IEd1ZGRhdGkgPHNh
bnRob3NoLnJlZGR5Lmd1ZGRhdGlAaW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC9r
bXNfZmJjX2RpcnR5X3JlY3QuYyB8IDQgKysrKw0KPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKykNCg0KUmV2aWV3ZWQtYnk6IFZpbm9kIEdvdmluZGFwaWxsYWkgPHZpbm9kLmdvdmlu
ZGFwaWxsYWlAaW50ZWwuY29tPg0KDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwva21z
X2ZiY19kaXJ0eV9yZWN0LmMgYi90ZXN0cy9pbnRlbC9rbXNfZmJjX2RpcnR5X3JlY3QuYw0KPiBp
bmRleCBiMTg3YTU5NDIuLmMzYTg2YWVkYSAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwva21z
X2ZiY19kaXJ0eV9yZWN0LmMNCj4gKysrIGIvdGVzdHMvaW50ZWwva21zX2ZiY19kaXJ0eV9yZWN0
LmMNCj4gQEAgLTUxMCw2ICs1MTAsMTAgQEAgaWd0X21haW4NCj4gwqAJCQkJYnJlYWs7DQo+IMKg
CQkJZm9yX2VhY2hfdmFsaWRfb3V0cHV0X29uX3BpcGUoJmRhdGEuZGlzcGxheSwgZGF0YS5waXBl
LCBkYXRhLm91dHB1dCkgew0KPiDCoAkJCQlmb3IgKGludCBpID0gMDsgaSA8IG51bV9mb3JtYXRz
OyBpKyspIHsNCj4gKwkJCQkJLyogb24gc2ltdWxhdGlvbiBwbGF0Zm9ybXMgLCBsaW1pdCB0byBz
aW5nbGUgZm9ybWF0ICovDQo+ICsJCQkJCWlmIChkYXRhLmlzX3NpbXVsYXRpb24gJiYgaSA+IDAp
DQo+ICsJCQkJCQlicmVhazsNCj4gKw0KPiDCoAkJCQkJaWd0X2R5bmFtaWNfZigicGlwZS0lcy0l
cy1mb3JtYXQtJXMiLA0KPiDCoAkJCQkJCcKgwqDCoMKgwqDCoCBrbXN0ZXN0X3BpcGVfbmFtZShk
YXRhLnBpcGUpLA0KPiDCoAkJCQkJCcKgwqDCoMKgwqDCoCBpZ3Rfb3V0cHV0X25hbWUoZGF0YS5v
dXRwdXQpLA0KDQo=
