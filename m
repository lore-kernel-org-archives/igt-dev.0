Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677E6CFD2F6
	for <igt-dev@archiver.kernel.org>; Tue,  2 Dec 2025 09:11:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DADC10E552;
	Tue,  2 Dec 2025 09:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fnh6AbhL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4AD10E544
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Dec 2025 09:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764666706; x=1796202706;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=4FC5RylaA3IxJt1AHcpVyuXioREvMVyzSkYUYMCJWcQ=;
 b=Fnh6AbhLTtSShxIYXjYSGK/gzW2ExokOtMmZHFNmZ9wRtQqmEaXdmSTa
 dnOc4HfTLKDjc/+rFUtNH0nkXpNscC8Opyn/IzZSICn6g/5V1QslYcg8E
 Vk/0mLqaiD3X2plKnMnS+qJANSQEuTZ1l9dLpBk32ZIjuZ8QWg1rv+tFm
 tkNfbd4ksucH+PbqVQ3XOUv4GBbl1axMwtANfNIJUhAM+uH6HO+3ENvyk
 M0m9eVnDeO3lxOMZdjm1lRB/bmvV/wvv2Qpf4tXYB2S171PkO03tO1jCm
 60GonUiQleTM2yWY7uqZX0bfOs7Se4ZyLk8xFepiPMdWdwta1t6b6sgwC Q==;
X-CSE-ConnectionGUID: TbNetrtFToKXmuUt7FAPhw==
X-CSE-MsgGUID: gYVlyN5aSia18wmpGacTHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="54177868"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="54177868"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:11:46 -0800
X-CSE-ConnectionGUID: 96IwhYFSTpukPOQ9BKVivw==
X-CSE-MsgGUID: DWDHxSr2TaCLdYDdPmct4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193995394"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 01:11:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:11:44 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 01:11:44 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 01:11:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOPWqFQTHhcXRRmgSmFZ1NtdGiLLLRzuq613t0fjOP2PO0ckPyKoatMWJVtqxVXD0qBatmDpAqAukF5OAiIQ5u4WivqPLLx9IqluOJjUBe6FvVzQ8JyjnnEwxlbNztAdu4U8sm6lDniNMzpgb0M1OZvsvSv26iK9/OUdxYFCCEYTeIyOhd59+RSUTzxulw1BsCMlg1U0s5yJHPAWpMVOmYIjxd6tX0eBI3U4Qb2Ksh1AaHdj8sEuJ/PBJRoLnOZ8hvAH+fkNdXGxLkQJBS8PFEXnJ0sNXV+ClqnsPexLB2H7gjLDw1ziNVeDMylDzeev8j+fgQS55aLaIj5Zx41roQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4FC5RylaA3IxJt1AHcpVyuXioREvMVyzSkYUYMCJWcQ=;
 b=si5lJ+W8pbfpQI21Q7o2b6LZND1x4Zq3YuKppoOL8aoSrZT35xUY0bOuJ9XaTy2+LN2NnW844MhQMPxNUQgQNzjWldSjW2s+G6rMH95aEKvne9fmwMjBT7cVlcz69AkffpIPN9NYNRL11ER96h9VDaIHzhTduMWbDZOykiwd+S0jTyzolIblV/hDebJuRUHIwg/Z6u8dOEesEx9v600G+M5NYdny+DaubNGQZW8JAmhT7bm9BkZzYJ8tXtoCvDqRaBM5+S9htIiRquUjT0Sx3tnP/+aGiC0Gpk8Kjk3DDZ7ooXZo0Vhu8lrBJQn4G13GLJUgwSQdi1ynAvVdo4nh1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA3PR11MB8001.namprd11.prod.outlook.com (2603:10b6:806:2f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 09:11:42 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::41a9:1573:32ad:202c%6]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 09:11:42 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Sharma, 
 Nishit" <nishit.sharma@intel.com>, "Gurram, Pravalika"
 <pravalika.gurram@intel.com>
Subject: Re: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Topic: [PATCH i-g-t v9 08/10] tests/intel/xe_multi_gpusvm: Add SVM
 multi-GPU simultaneous access test
Thread-Index: AQHcYqEwl+jrun6WuUSm8Wph+7Ing7UOEhQA
Date: Tue, 2 Dec 2025 09:11:42 +0000
Message-ID: <9ebdf1d1b8d53e5f74ed27b25c4624fe4c5e108c.camel@intel.com>
References: <20251121162537.77551-1-nishit.sharma@intel.com>
 <20251201090201.326595-1-nishit.sharma@intel.com>
 <20251201090201.326595-9-nishit.sharma@intel.com>
In-Reply-To: <20251201090201.326595-9-nishit.sharma@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA3PR11MB8001:EE_
x-ms-office365-filtering-correlation-id: c4777e7b-ef6b-42c8-4e3b-08de3182cf33
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?TVB1SVV3ZnZndE9sL3pDYWY0ZjVHT2lHTnIwMCt1UDRoRy9ZY1ZmN0R4eWtk?=
 =?utf-8?B?RlAydVB3YlZ3eE4vTnVyVjF2Qk5STnlzV3NOV1VhRlB0cG1VaDU4SFF2cSt2?=
 =?utf-8?B?RnVNZHJjdlMrWEhFU1dkU1IzZTdNSmtkNVVOYUZrSklQYW9yenNHZWdxWjRl?=
 =?utf-8?B?U0FVRjI2VWk5ZUZ2bXRWaTNlZFVVV0tGb3NJYWRHNW9DZzArRWlQVzFndENN?=
 =?utf-8?B?ckJyVTkzM1pjM2ZNSkZINUU4Tk1NRFlRNFRPSWxSWFBXd3M0bGdDUFZsOVJV?=
 =?utf-8?B?b1hjK0hwUHJZdzFVb2Z1NXNWS3JhTndFNWdkR3FlTWZTZmExbS9XM2luYlZn?=
 =?utf-8?B?WDUxeWNncFhLRW1wbG1jeEZJWThNa1M3L3R0Ymc0MGJUbnJoSkVGWVcyNFNo?=
 =?utf-8?B?NURZaU1Va2UwYnZ6RDlScWpGcHFTeUdhWUJGRjNjaGsxNU9kKy9qa0sxc2hG?=
 =?utf-8?B?Z0h5REgraXNJQ0I2emo1ZFNWNzM4OVdkaVI1NnFIb01Mb01KMmRZeFVKZ0xW?=
 =?utf-8?B?WmRqQnVBRjhBSE5FSk5Rb2Y2aG1rMHUzT0g1N0NDSGVGNnE5U0JmYloyUFdD?=
 =?utf-8?B?NC9hN2UzZW1oaUZwaU1Gd2VyTVJ6cFdERDZZZXVUdjlGQUg1Nitzc1M1Sk91?=
 =?utf-8?B?V0lhYWdhSVB4K3BsZW5wcGxRUzgwMEVZUWxGZWV6QlZtYjhEaXFZajE5bGtk?=
 =?utf-8?B?WmtVOTUrbHBNcnpqdWJBTjN6Nk9sTUU3VzN2V1RjaDVRSXlwU2g0dllVZXR3?=
 =?utf-8?B?TUFyN1FTSTV4cldybjJVRzdSaWtROU5LVmpPcTBScE5KQlM4b1FsVVp4Nlps?=
 =?utf-8?B?N2FvUTVRbG9qcmM1NjhBL2g0YUxkdlRQOFgvTmhIZzN4TGMwa3JQS1Y5NExR?=
 =?utf-8?B?QzZMeTAycGllZFFPUERHZ1YvQTNhb0ZQT29oWGVrNmYyZnpteUdUc0JuWHBn?=
 =?utf-8?B?VWs2TGZhQzlxc2lpQStGS1JQSzRZcE1UY01KdjFuaEdRVkFLQUdFdzJLZG9F?=
 =?utf-8?B?bm5oMVM2RnZxdW1jWnJvRGp2YXBiK1dVYVVuTVExTDZkK3VHVkpFUlVWR2xt?=
 =?utf-8?B?TTV4SjU0Ym9QSzNkNFd3ejhVNXlpaDFsUkJ5RzhHOWt1VlR4UkpmNElSQjFG?=
 =?utf-8?B?OEdiZ1p2aDVaMGtHZzNlYUN1Y1liRFBuRklDd2tMazZEZVNrN05mRWJZLzQ1?=
 =?utf-8?B?Mk42SEZHUzZwVm9YTnRKcXlBV0RYZVF2QTRUZzNMSXIvN09sdjVkNjlxV2hT?=
 =?utf-8?B?ZXFzckhGeE5EbWp2MVpNeFdhOGxSRXpqdk5VWkR0dWdQRUNRM1lnZnV4NjNu?=
 =?utf-8?B?THNOZXhpb0dnSytkcTFORWoybVZLVk44Y1pocVF3aTUrVUs5L0JjRWFlRXll?=
 =?utf-8?B?N1VYcHdXekxCWHNabVRqRG5JMitXUlhUYXU4ZFlHa2d4VGgxVGlIMzVuR2wz?=
 =?utf-8?B?VkxMU3F4eFE3Y0xmOGN4WldZL1IreE5lVktiMWpuOVFiNkV1MG5IcFkyZlo2?=
 =?utf-8?B?b2VEdzM0bm5WZ0xFSGxPYnQ1b1k1azhnOGllc0NUL3ZZd0VITFJxUE1QU1Fu?=
 =?utf-8?B?QXM2SDFpQ21OSVViL2xJQ3dUa0xXTlZ4V2h0bVIwaHdnQy9OYXJkcGtjUWNa?=
 =?utf-8?B?WWFEODdmQUl3YkhzY1A2NktKTGNvWHRZMUtwVGdEVkU4VG00dHFHMjVsc0tF?=
 =?utf-8?B?M2l1azRyc2gvRnV0dVpya1FvYnNpNGVVYWs1WW9Jb1JTS1QvY3kzZlhYRmpJ?=
 =?utf-8?B?a25qdDRuV05sUmtqWlFoYWFRVkhjaHQvZkZYeDcxMlBwWFVkWkhGaHN4SEJh?=
 =?utf-8?B?YmdOVlJKdHJsVDl3Y2hsa1hqOXYvakJ3ZDB1UVFQM0F4MjFUMm5PeVpnTisy?=
 =?utf-8?B?eTdmTUYxMUdPeWlIcSsxWlhKSERkd2RIQWhZSGRQbmVVOGgxam1jMlNYU2Yy?=
 =?utf-8?B?Y1lPVmJLZVk0Qk9TRUVmM2d5SEp2ZzF1U3Q4V1ptdEdFMnZIOUNud3NJeGh3?=
 =?utf-8?B?ZUF2ejNTTi9NbG8wM3N0MVVXZkFIOG5sSEd6MFdLNTRmQllTQkpWemVOdkRj?=
 =?utf-8?Q?SLhn91?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OU5qaU1QNW5NM2hVOWdvZTBtdGcvWnJNNW4rRDhjV3locE9oRXQvTGJyTmdJ?=
 =?utf-8?B?Vzh0elkzaVJxbEZZcXN1N0d1c0J0SmNlVmIxcnNzcGlWUEtFeHZQQ2xQZ0R4?=
 =?utf-8?B?anZDMjZCWGw0ZVA1YzBRWjFPNUFPVUdtOWJHRUxUQTZJM2Y5MHBJQUdhTjFN?=
 =?utf-8?B?ek9RelVBd3d2a2YzblJyalNvT2xibGk3c1F3c1JPSXNUbDlHOE9wcTJPeXc0?=
 =?utf-8?B?K1lsT1EzN1VQa21iZzJtb1gySG5WY0M3bWFobVQ3T2JMVWpNVXVGekh0Q2U0?=
 =?utf-8?B?eWFJQ3owK1RZOERlMWVOWmZsWUNFNHExOXhQRnh3cytqaEFUUy9QdEZuK015?=
 =?utf-8?B?VlhsaVJ3OTlHSElhTy9mVWY5blEzUEZkdERhenNWd3ROWFNWUHcrbjA5eElh?=
 =?utf-8?B?cmxySm51YkF0RjQrL2tRbjJTUG84RHB1TjFpbzV0SlAvNkFwbi9VeVlEczlL?=
 =?utf-8?B?VW01T2FTME5GVXNCWGtJWWVjZFRpbzlFVU9EMm5XeWZUMHhDREtyQzdOb0JM?=
 =?utf-8?B?SUNHV2RvUGN0K0lkL2VacjdLWm40aitYY3dIRFJUb1d4aDZ2QnVXQkdGZTJY?=
 =?utf-8?B?N1VxSlNoWVJVZW4wQUxEVHBvSjR2M3hRQkFRTFE3S0lRQmg2UUdXa1ZzZjdC?=
 =?utf-8?B?YUlOYXlRS2hFWis0QnVhUjZEZitxNHR3akQ1ajRzTkFnUkYzZkFDRmJKUDZK?=
 =?utf-8?B?S3NzQ0RxYXlUVCtOQkxJdXpPVHdFQVNIdzJFMjZPQkg3bDkyNXFmTXRkUFVv?=
 =?utf-8?B?Z0pTdTFHc2RXb2RqcEQ5eExpL3ozZ3Y0Z3hndU9USUM5eVBEYlBYVDdDRFNZ?=
 =?utf-8?B?SGZtZjM0czFOOG1HektNeHBOaTFYUitCRjlYL01XNUtXeEpjSE1SUGpOTm84?=
 =?utf-8?B?VnVkcUUzUDdQeDhXSnVqSWJwU3hDSW9DTVhIRkJmRWRhQUxHU1NUeEF6NjZT?=
 =?utf-8?B?bXRSZWpyYVgyRm4yaHI5Ykx5d3BQc1h5MFVEZ1lEdDJnRnNVd1ovUnZTZjFT?=
 =?utf-8?B?dGVmalkrVlpmdkJCeDZYcVVOUkdqQ25aaEtoeWpxbnFqS3VCLzAwNHcrUVlF?=
 =?utf-8?B?NnFBOFFFMEpKNWpBMlM2cGJHSVBOQmJJQUFZYlJZLzFDZk5ENytOTUVUZzRJ?=
 =?utf-8?B?WEZuZGVWUE44VnpxT3ljeXBORFl4NklNQ0tqRzNueHlZdnAvM3docDljK2pR?=
 =?utf-8?B?SVVnS0NhUU5kM2IydktQQ3BKd2tCdGlETlFYd3g2SmIxUmxnbEl5V214UFpF?=
 =?utf-8?B?ZmF4SkVEaW96ak1ZRE04QjlNZ2RrNmFCOGJaNmFpdCt1YzRpRmk4VUFsdzBr?=
 =?utf-8?B?YWlUUjZrU0QyTEk4bjUrS0FFQVJHRXhwUG80YWd0N2k2eUJUdTN6clF6SVpQ?=
 =?utf-8?B?bnFVTGlFYmpwM092akt0Yk5QSGFVcUYwUWJZeVErc3E3ajFRcVl2d1dxZkNm?=
 =?utf-8?B?MmkvcHM2MUExMm1FSWNxT2pIZ0E0dk81YVNTMXB1cStxVFBGbENIL3hZVkFO?=
 =?utf-8?B?ZXZySnV4ZFJ1UGc2S2tKUmFYZFZlUFByZHVwUGFOWlNnbitnZzFVRVNLZ1FV?=
 =?utf-8?B?RytXd0JRbStqdG5mN2JUNTUzVGdxNWNuK2p1WTdSYzZoVUpKVHFOYVBuRzdL?=
 =?utf-8?B?THc0dzc3MGZhbUFPRXp3cVlQYitSbHE0Z1F3eWNuK3BSOEx0TTltM0dCZUk3?=
 =?utf-8?B?bnJ5eHVLRW43endUNTZUc0NZR3MwVUdMS3M4c1ZVQkJyNGFXODJSZS9vODBF?=
 =?utf-8?B?aU1HcVN6b2FSR25jeWNucURzdjlOajJVcVNzVm1DRzNHb3JtOUtUMS9jdXQy?=
 =?utf-8?B?OGRuc0dFRVdqN1JSNnZzczkxMWpHbm8vVHVsdUI3YUFOT1NVb1liSjBmRHlh?=
 =?utf-8?B?RTlKaFhaWlY3VVdrM3NIU1haMTNmbjBUSEl0THl1bmZvVmFQMDMyQ1ovNGl1?=
 =?utf-8?B?NVB3M2xPQzFRT0dQNloyV0FYM3o4ZjJ6ZVo2blBjRVlxN1h5SWlnSkJyV1Fh?=
 =?utf-8?B?OWtwOGM1R212UTRSTHcxZmxTdWszNm92ODJGbkpxaGZOanZXT1crNU5FSWtu?=
 =?utf-8?B?M1dNNktGZTZ2RTlDVmJRQTROV1NNQkxEUzNWdnNXYU9pRW1wYy9TQjBPeHE1?=
 =?utf-8?B?andiY00yYnNUaDBMenNyMlF2clZVWHhSbmtLTnA5QUhwVXNEZzI5ZGdJejNa?=
 =?utf-8?Q?LOV66BUki3K5cq00gCku+t/w/JuGEfeho/wDqpwm3ouh?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <32BFDDB4D484434A805D7CE4BA3EB84F@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4777e7b-ef6b-42c8-4e3b-08de3182cf33
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 09:11:42.2065 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TRntazXnQqSGyF5dpCEyE47WBWucw/k4wpYlF2nSsa4neDfuiRKOMaG1bq4KhgjPXTBSA/B9ixRZnjDGXATNS62CQW3HExEdT+IDKLcj8F8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8001
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

T24gTW9uLCAyMDI1LTEyLTAxIGF0IDA5OjAxICswMDAwLCBuaXNoaXQuc2hhcm1hQGludGVsLmNv
bSB3cm90ZToNCj4gRnJvbTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBpbnRlbC5jb20+
DQo+IA0KPiBUaGlzIHRlc3QgbGF1bmNoZXMgY29tcHV0ZSBvciBjb3B5IHdvcmtsb2FkcyBvbiBi
b3RoIEdQVXMgdGhhdA0KPiBhY2Nlc3MgdGhlIHNhbWUgU1ZNIGJ1ZmZlciwgdXNpbmcgc3luY2hy
b25pemF0aW9uIHByaW1pdGl2ZXMNCj4gKGZlbmNlcy9zZW1hcGhvcmVzKSB0byBjb29yZGluYXRl
IGFjY2Vzcy4gSXQgdmVyaWZpZXMgZGF0YQ0KPiBpbnRlZ3JpdHkgYW5kIGNoZWNrcyBmb3IgdGhl
IGFic2VuY2Ugb2YgcmFjZSBjb25kaXRpb25zDQo+IGluIGEgbXVsdGktR1BVIFNWTSBlbnZpcm9u
bWVudC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFA
aW50ZWwuY29tPg0KPiAtLS0NCj4gwqB0ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYyB8IDE5
Mw0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+IMKgMSBmaWxlIGNoYW5n
ZWQsIDE5MyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvdGVzdHMvaW50ZWwveGVf
bXVsdGlfZ3B1c3ZtLmMNCj4gYi90ZXN0cy9pbnRlbC94ZV9tdWx0aV9ncHVzdm0uYw0KPiBpbmRl
eCA3YTA2ZTI4OWMuLmJkYmFhN2ExNiAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfbXVs
dGlfZ3B1c3ZtLmMNCj4gKysrIGIvdGVzdHMvaW50ZWwveGVfbXVsdGlfZ3B1c3ZtLmMNCj4gQEAg
LTEzLDYgKzEzLDcgQEANCj4gwqAjaW5jbHVkZSAiaW50ZWxfbW9jcy5oIg0KPiDCoCNpbmNsdWRl
ICJpbnRlbF9yZWcuaCINCj4gwqANCj4gKyNpbmNsdWRlICJpbnRlbF9ncHVfY29tbWFuZHMuaCIN
Cj4gwqAjaW5jbHVkZSAidGltZS5oIg0KPiDCoA0KPiDCoCNpbmNsdWRlICJ4ZS94ZV9ndC5oIg0K
PiBAQCAtOTgsNiArOTksMTcgQEANCj4gwqAgKglUZXN0IGNyb3NzLUdQVSBtZW1vcnkgYWNjZXNz
IHdpdGggcHJlZmV0Y2ggdG8gdmVyaWZ5IHBhZ2UNCj4gZmF1bHQNCj4gwqAgKglzdXBwcmVzc2lv
biB3aGVuIG1lbW9yeSBpcyBwcmUtbWlncmF0ZWQgdG8gdGFyZ2V0IEdQVSdzIFZSQU0NCj4gwqAg
Kg0KPiArICogU1VCVEVTVDogbWdwdS1jb25jdXJyZW50LWFjY2Vzcy1iYXNpYw0KPiArICogRGVz
Y3JpcHRpb246DQo+ICsgKglUZXN0IGNvbmN1cnJlbnQgYXRvbWljIG1lbW9yeSBvcGVyYXRpb25z
IHdoZXJlIG11bHRpcGxlIEdQVXMNCj4gKyAqCXNpbXVsdGFuZW91c2x5IGFjY2VzcyBhbmQgbW9k
aWZ5IHRoZSBzYW1lIG1lbW9yeSBsb2NhdGlvbg0KPiB3aXRob3V0DQo+ICsgKglwcmVmZXRjaCB0
byB2YWxpZGF0ZSBjcm9zcy1HUFUgY29oZXJlbmN5IGFuZCBzeW5jaHJvbml6YXRpb24NCj4gKyAq
DQo+ICsgKiBTVUJURVNUOiBtZ3B1LWNvbmN1cnJlbnQtYWNjZXNzLXByZWZldGNoDQo+ICsgKiBE
ZXNjcmlwdGlvbjoNCj4gKyAqCVRlc3QgY29uY3VycmVudCBhdG9taWMgbWVtb3J5IG9wZXJhdGlv
bnMgd2l0aCBwcmVmZXRjaCB3aGVyZQ0KPiArICoJbXVsdGlwbGUgR1BVcyBzaW11bHRhbmVvdXNs
eSBhY2Nlc3Mgc2hhcmVkIG1lbW9yeSB0bw0KPiB2YWxpZGF0ZQ0KPiArICoJY29oZXJlbmN5IHdp
dGggbWVtb3J5IG1pZ3JhdGlvbiBhbmQgbG9jYWwgVlJBTSBhY2Nlc3MNCj4gwqAgKi8NCj4gwqAN
Cj4gwqAjZGVmaW5lIE1BWF9YRV9SRUdJT05TCTgNCj4gQEAgLTEwOSw2ICsxMjEsNyBAQA0KPiDC
oCNkZWZpbmUgQ09QWV9TSVpFIFNaXzY0TQ0KPiDCoCNkZWZpbmUJQVRPTUlDX09QX1ZBTAk1Ng0K
PiDCoCNkZWZpbmUgQkFUQ0hfVkFMVUUJNjANCj4gKyNkZWZpbmUgTlVNX0lURVIJMjAwDQo+IMKg
DQo+IMKgI2RlZmluZSBNVUxUSUdQVV9QUkVGRVRDSAkJQklUKDEpDQo+IMKgI2RlZmluZSBNVUxU
SUdQVV9YR1BVX0FDQ0VTUwkJQklUKDIpDQo+IEBAIC0xMTgsNiArMTMxLDcgQEANCj4gwqAjZGVm
aW5lIE1VTFRJR1BVX1BFUkZfT1AJCUJJVCg2KQ0KPiDCoCNkZWZpbmUgTVVMVElHUFVfUEVSRl9S
RU1fQ09QWQkJQklUKDcpDQo+IMKgI2RlZmluZSBNVUxUSUdQVV9QRkFVTFRfT1AJCUJJVCg4KQ0K
PiArI2RlZmluZSBNVUxUSUdQVV9DT05DX0FDQ0VTUwkJQklUKDkpDQo+IMKgDQo+IMKgI2RlZmlu
ZSBJTklUCTINCj4gwqAjZGVmaW5lIFNUT1JFCTMNCj4gQEAgLTE4MCw2ICsxOTQsMTEgQEAgc3Rh
dGljIHZvaWQgZ3B1X2ZhdWx0X3Rlc3Rfd3JhcHBlcihzdHJ1Y3QNCj4geGVfc3ZtX2dwdV9pbmZv
ICpzcmMsDQo+IMKgCQkJCcKgwqAgc3RydWN0DQo+IGRybV94ZV9lbmdpbmVfY2xhc3NfaW5zdGFu
Y2UgKmVjaSwNCj4gwqAJCQkJwqDCoCB1bnNpZ25lZCBpbnQgZmxhZ3MpOw0KPiDCoA0KPiArc3Rh
dGljIHZvaWQgZ3B1X3NpbXVsdF90ZXN0X3dyYXBwZXIoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAq
c3JjLA0KPiArCQkJCcKgwqDCoCBzdHJ1Y3QgeGVfc3ZtX2dwdV9pbmZvICpkc3QsDQo+ICsJCQkJ
wqDCoMKgIHN0cnVjdA0KPiBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICplY2ksDQo+ICsJ
CQkJwqDCoMKgIHVuc2lnbmVkIGludCBmbGFncyk7DQo+ICsNCj4gwqBzdGF0aWMgdm9pZA0KPiDC
oGNyZWF0ZV92bV9hbmRfcXVldWUoc3RydWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1LCBzdHJ1Y3QN
Cj4gZHJtX3hlX2VuZ2luZV9jbGFzc19pbnN0YW5jZSAqZWNpLA0KPiDCoAkJwqDCoMKgIHVpbnQz
Ml90ICp2bSwgdWludDMyX3QgKmV4ZWNfcXVldWUpDQo+IEBAIC0xMDU4LDYgKzEwNzcsMTY0IEBA
IHBhZ2VmYXVsdF90ZXN0X211bHRpZ3B1KHN0cnVjdA0KPiB4ZV9zdm1fZ3B1X2luZm8gKmdwdTEs
DQo+IMKgCWNsZWFudXBfdm1fYW5kX3F1ZXVlKGdwdTIsIHZtWzFdLCBleGVjX3F1ZXVlWzFdKTsN
Cj4gwqB9DQo+IMKgDQo+ICtzdGF0aWMgdm9pZA0KPiArbXVsdGlncHVfYWNjZXNzX3Rlc3Qoc3Ry
dWN0IHhlX3N2bV9ncHVfaW5mbyAqZ3B1MSwNCj4gKwkJwqDCoMKgwqAgc3RydWN0IHhlX3N2bV9n
cHVfaW5mbyAqZ3B1MiwNCj4gKwkJwqDCoMKgwqAgc3RydWN0IGRybV94ZV9lbmdpbmVfY2xhc3Nf
aW5zdGFuY2UgKmVjaSwNCj4gKwkJwqDCoMKgwqAgdW5zaWduZWQgaW50IGZsYWdzKQ0KPiArew0K
PiArCXVpbnQ2NF90IGFkZHI7DQo+ICsJdWludDMyX3Qgdm1bMl07DQo+ICsJdWludDMyX3QgZXhl
Y19xdWV1ZVsyXTsNCj4gKwl1aW50MzJfdCBiYXRjaF9ib1syXTsNCj4gKwlzdHJ1Y3QgdGVzdF9l
eGVjX2RhdGEgKmRhdGE7DQo+ICsJdWludDY0X3QgYmF0Y2hfYWRkclsyXTsNCj4gKwlzdHJ1Y3Qg
ZHJtX3hlX3N5bmMgc3luY1syXSA9IHt9Ow0KPiArCXVpbnQ2NF90ICpzeW5jX2FkZHJbMl07DQo+
ICsJdWludDMyX3QgdmVyaWZ5X2JhdGNoX2JvOw0KPiArCXVpbnQ2NF90IHZlcmlmeV9iYXRjaF9h
ZGRyOw0KPiArCXVpbnQ2NF90ICp2ZXJpZnlfcmVzdWx0Ow0KPiArCXVpbnQzMl90IGZpbmFsX3Zh
bHVlOw0KPiArCXVpbnQ2NF90IGZpbmFsX3RpbWVsaW5lOw0KPiArDQo+ICsJLyogU2tpcCBpZiBl
aXRoZXIgR1BVIGRvZXNuJ3Qgc3VwcG9ydCBmYXVsdHMgKi8NCj4gKwlpZiAobWdwdV9jaGVja19m
YXVsdF9zdXBwb3J0KGdwdTEsIGdwdTIpKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwljcmVhdGVf
dm1fYW5kX3F1ZXVlKGdwdTEsIGVjaSwgJnZtWzBdLCAmZXhlY19xdWV1ZVswXSk7DQo+ICsJY3Jl
YXRlX3ZtX2FuZF9xdWV1ZShncHUyLCBlY2ksICZ2bVsxXSwgJmV4ZWNfcXVldWVbMV0pOw0KPiAr
DQo+ICsJZGF0YSA9IGFsaWduZWRfYWxsb2MoU1pfMk0sIFNaXzRLKTsNCj4gKwlpZ3RfYXNzZXJ0
KGRhdGEpOw0KPiArCWRhdGFbMF0udm1fc3luYyA9IDA7DQo+ICsJYWRkciA9IHRvX3VzZXJfcG9p
bnRlcihkYXRhKTsNCj4gKw0KPiArCVdSSVRFX09OQ0UoKih1aW50NjRfdCAqKWFkZHIsIDApOw0K
PiArDQo+ICsJLyogR1BVMTogQXRvbWljIEJhdGNoIGNyZWF0ZSAqLw0KPiArCWdwdV9iYXRjaF9j
cmVhdGUoZ3B1MSwgdm1bMF0sIGV4ZWNfcXVldWVbMF0sIGFkZHIsIDAsDQo+ICsJCQkgJmJhdGNo
X2JvWzBdLCAmYmF0Y2hfYWRkclswXSwgZmxhZ3MsDQo+IEFUT01JQyk7DQo+ICsJLyogR1BVMjog
QXRvbWljIEJhdGNoIGNyZWF0ZSAqLw0KPiArCWdwdV9iYXRjaF9jcmVhdGUoZ3B1Miwgdm1bMV0s
IGV4ZWNfcXVldWVbMV0sIGFkZHIsIDAsDQo+ICsJCQkgJmJhdGNoX2JvWzFdLCAmYmF0Y2hfYWRk
clsxXSwgZmxhZ3MsDQo+IEFUT01JQyk7DQo+ICsNCj4gKwkvKiBncHVfbWFkdmlzZV9zeW5jIGNh
bGxzIHhlX2V4ZWMoKSBhbHNvLCBoZXJlIGludGVudGlvbiBpcw0KPiBkaWZmZXJlbnQgKi8NCj4g
Kwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEtPmZkLCB2bVswXSwgYWRkciwgU1pfNEssIDAsDQo+
ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX0FUT01JQywNCj4gKwkJCcKgwqDCoCBE
Uk1fWEVfQVRPTUlDX0dMT0JBTCwgMCwgMCwNCj4gZXhlY19xdWV1ZVswXSk7DQo+ICsNCj4gKwl4
ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTEtPmZkLCB2bVswXSwgYWRkciwgU1pfNEssIDAsDQo+ICsJ
CQnCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX1BSRUZFUlJFRF9MT0MsDQo+ICsJCQnCoMKg
wqAgZ3B1MS0+ZmQsIDAsIGdwdTEtPnZyYW1fcmVnaW9uc1swXSwNCj4gZXhlY19xdWV1ZVswXSk7
DQo+ICsNCj4gKwl4ZV9tdWx0aWdwdV9tYWR2aXNlKGdwdTItPmZkLCB2bVsxXSwgYWRkciwgU1pf
NEssIDAsDQo+ICsJCQnCoMKgwqAgRFJNX1hFX01FTV9SQU5HRV9BVFRSX0FUT01JQywNCj4gKwkJ
CcKgwqDCoCBEUk1fWEVfQVRPTUlDX0dMT0JBTCwgMCwgMCwNCj4gZXhlY19xdWV1ZVsxXSk7DQoN
CkFjdHVhbGx5IEkganVzdCByZWFsaXplZCwgc2hvdWxkbid0IHdlIHVzZSBhbiBvcmRpbmFyeSB4
ZV92bV9tYWR2aXNlKCkNCmNhbGwgaGVyZSBmb3IgdGhlIGF0b21pYyBhdHRyaWJ1dGVzIGluc3Rl
YWQgb2YgeGVfbXVsdGlncHVfbWFkdmlzZSgpLA0KYXMgbm8gZmFsbGJhY2tzIGFyZSBuZWVkZWQ/
DQoNCi9UaG9tYXMNCg0K
