Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C1CCDE00B
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 14:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6670D10EB60;
	Thu, 26 Sep 2024 14:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eQPn6oUl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDED10EB60
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727359652; x=1758895652;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=l+Bs/WEWIFwr84urd2nCyaAvHsfC33HdE5H0vNvq+7M=;
 b=eQPn6oUlRG7O/famtKh7tUbvPPbT+H3mf7XJf/zy3zlNkGSLOYcV/BnY
 vouls+b5iWkKgp3xfaWL5zfe4sZDHqOdw+XLqHYI8GfAO7ymvevPsRcbk
 YoKFDLgY13011fJ+TPs7qUNm+F3ecr1kvh+bRTk7W62i+nYCUqXyF9yfv
 nA/SAF1Vg9KgzR6OQ2l7GvDCACUBsgTntQ8bCDeTdhNv3BTi0i9J7OoZJ
 PVm4jPPyttjMGYxF/GoM0oUrJfCER90L6lLe+NrpWeegNzcx+vGwpaz4b
 HSxyLRvXuUpdyaJr6UATk50qciVUpY4SUfRidP4wykPZz+fs/V90Xr/km g==;
X-CSE-ConnectionGUID: qXOKpB0nT7KafzuIZAGKeA==
X-CSE-MsgGUID: yjn5Zws8RlqJrCwso8WBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26268505"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="26268505"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 07:07:11 -0700
X-CSE-ConnectionGUID: aRpfqNg3Ruaz1zmIcLAx3w==
X-CSE-MsgGUID: 7qOS0nzjReO44bC0Dkim0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="72166732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2024 07:07:10 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:07:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 26 Sep 2024 07:07:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 26 Sep 2024 07:07:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 26 Sep 2024 07:07:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOK29kQYzO9xl0i7PzyeiFBwIm0Mr7O7nV/JFN1geuhNP4QJfw45/VS+B/bKYkS7xS7a2KwyA6ztNhy97hGtM+e/fpoftdMHXXabYOFwgUZgC/QzZBtqJAZaXBFd0V3OPLokHM0E0or8+CuQV4Pbcj+xgN33iPQ77VYCAnE4AKVCrMmvRN+naVWP8niQPXhSX20RQHpal2wB45vEpzyGvseuSnasIR4xjXmjTXF77ayAlrI+xnkusTIjhwR8W5rQi+m86yuQx7omnXS/iCgrQ1nNRfMkWOiTD7E/1YCp6nQGtxg/4nkPqqkANO/Ib4JBKkQntjkvUWd5Sby5z1O7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+Bs/WEWIFwr84urd2nCyaAvHsfC33HdE5H0vNvq+7M=;
 b=DZ8jqd/sobS/JqhOfGGFZYO6XfuGGv7G9Hz+U6zDwjC9zDoEnFFDPZHkBkyxUJgCMgcYcTpD1FIdvK7s+FSLK8thB8BAEWIHHv7XZ9WQgGSvXV5tzrybs0HP47pCbBX4eddN5Q9V8injMZq64mYs5FQ0HBvNEzTPVKqCqp3+m9CIPEFV770PISMPhK+wg5RZDDKn+JVS99pFm59o+4KBLIzX0DNdWtMzLm0QX4QARm63ZxLGVQ9LF+h9Ls337uw9JpROOz2yyKCdLcmsb2dQunNcLY2z2ipmtVsM7XnuzQQMimsaAmPsmbnnXUU9eEAGOudi1G4Bfi46pRl7iiNPtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7864.namprd11.prod.outlook.com (2603:10b6:208:3df::14)
 by DS7PR11MB5989.namprd11.prod.outlook.com (2603:10b6:8:70::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 14:06:59 +0000
Received: from IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9]) by IA0PR11MB7864.namprd11.prod.outlook.com
 ([fe80::9333:15de:faa8:4cf9%6]) with mapi id 15.20.7982.022; Thu, 26 Sep 2024
 14:06:57 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "mika.kuoppala@linux.intel.com" <mika.kuoppala@linux.intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Manszewski, Christoph" <christoph.manszewski@intel.com>
Subject: Re: [PATCH i-g-t 1/3] tests/xe_eudebug: Keep engine for each client
Thread-Topic: [PATCH i-g-t 1/3] tests/xe_eudebug: Keep engine for each client
Thread-Index: AQHbEAHdDM2tXIOTQE+Y6m7x105zZ7JqGquA
Date: Thu, 26 Sep 2024 14:06:57 +0000
Message-ID: <f9d7b42576b7e085b9e94cdb503dc8bf5b0e06e2.camel@intel.com>
References: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
In-Reply-To: <20240926103939.550907-1-mika.kuoppala@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7864:EE_|DS7PR11MB5989:EE_
x-ms-office365-filtering-correlation-id: e1162765-48c0-402a-60b5-08dcde347bbf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ckRlVjVsc1ZsYktWNVdXWEt3SVY1RXhjTmtyMVkvOE9pZE1DT0RYQWdvV3JT?=
 =?utf-8?B?c2h2eEFVZ1Z0a01DYjREa3NvRFhpODloL2ZyN3ZvaGxhbzhWNkhuWkxWL3Vk?=
 =?utf-8?B?VlpwN2xRdU0ybEE5a2h2L21COEcxdklFblJMRzZOY01nTGRwTi9VZkpiaTEw?=
 =?utf-8?B?VWE2U2ZzclJUdGZiT1lqdXlqcWRoN3FkRFNaZTdZbWRLWUVDRmhDM2FXdXpH?=
 =?utf-8?B?Z0JLS3ExYk1xM0lFVHk2WXdTTHAyUU15d0p0dUM5TnpTME5tNzVtNlR0THoy?=
 =?utf-8?B?UHpjWHFSNHlMa1A0MnFqRENsOVM5MmVNRUw2YWVRb0VyTlRvK1dEK3g0QUpN?=
 =?utf-8?B?NlRBb3BldWcxTDFBVFBLcG9yTjc5TFZiR2VqaXZmb0VvdVhzK1JQcC9NNlRa?=
 =?utf-8?B?cktKRmdaeFNTVktRYm9WSytWNFA3WFBsSVpwcEt3V0tSSWtvWlZLTVNFa2k2?=
 =?utf-8?B?dWZLb21xU2hyOUh3WnZGZ1pkdjJKSThCWmFJU3dsSVZ0Z3hUZ1NoSDdwZmJY?=
 =?utf-8?B?dlIwZ1orMDNDaUVCQmhCbVNzKzNWblBPOHFZbDhNZTBJZjBBb1VRb0lmMG5Z?=
 =?utf-8?B?U1hQSXh2MHo3OWxiK3dXdWR5bTQxa1BUK3ZtTGZHSk9iT2lCM0JzRndEUG0w?=
 =?utf-8?B?NUlPL2h6VGREclVnaEw3L21vLzhISzZ2NzJqUHpTNFFCbTRYUDdIbis0OUI3?=
 =?utf-8?B?M3JRS29WZU5YMlQvSXdRanphMWVyMnlJQkpNVWRIQzlyN2orRlNqRVRJUFAv?=
 =?utf-8?B?ZzA4K0NmUHB1K1JjYTFKSkZmVDBMZGZoL2poQ1puK1RWT2VOaU13eVg1dWxY?=
 =?utf-8?B?b3ZtbU93akhwOUp3d2pyditLWG0vUkw5UUk3bm1xN29nUnNBSUllc0FpUzJm?=
 =?utf-8?B?S1NQTXVFelo4bnlQZnd0QmN1blNyMzlhRTJwbEdpaEdkZDBvTlU0eE8wSmlp?=
 =?utf-8?B?UmhOL21Dd1JsOFRmelVCamt1c21FSUhqS3NPR2FIVUxpendxaVV0MHY4Skw1?=
 =?utf-8?B?R0tiVjJWUGFiVjFwUXZHN0poQjhJOEwyanpibWxIV0NiejhpT1o4RXBvR3VO?=
 =?utf-8?B?TFJncnQ0czVYZDVhWlp0VnVRV3B1V3FPNkxTT0xpby9NQUxWVmRUZ2h4d2hR?=
 =?utf-8?B?UWtUWmZWaW90MHJSaHo3VDcxMUk3L01LVi9GZlpZdHdFeGQwdnI2Wk45c2px?=
 =?utf-8?B?d0VJK2pRUXpOdlkwd01ySE83UXYyRlp4OUVVZko2bVc2T2QzMkVaWm1DdVRk?=
 =?utf-8?B?MFFYUktiaWlhcVdWUmUzSkErVlZJV2gwRjhnZngwWmM0NkNvWXNVaGVRcndl?=
 =?utf-8?B?Q2VMd0x6anRLdFVPanRoaW41Mm9ncUxnRDhSTUdLT3Vid2ZEc3JvTUhNZUtS?=
 =?utf-8?B?c3lreTNpNEZDcFBjbHZJcXM4NTFrREc0RXRNY245dmVjdnhrSkI0V0phT0VQ?=
 =?utf-8?B?KytBUDhYWmROSlVDMVR1NGlpYUJHQVNsalRKQXBING5sa2Y2NmFhbG4zODhq?=
 =?utf-8?B?VGI3Qlp0bDZhcDNJczhaMVptL1NpR2Z3UVNEU2lrSkJRTWhiWkhBOSt4cldy?=
 =?utf-8?B?V0I3ZCtUdnF6Tm83S3ZmOFM3TGUwMkJQRU5WYmtHSzlQODVsakhBOGxiTTR3?=
 =?utf-8?B?M0VxNUdLem1FbElqOHh4Ry9MNWY3NDJsNWFramJ4bjNLSGhvTlRtRkN5WkZx?=
 =?utf-8?B?K3h5dmt0ME1hUVp4cHFkUGlWNFg1MFlOK0FhTE5UT0x4b1phcm1lVWhYdVNL?=
 =?utf-8?B?WExoaXRUWEQxZHhqRkUyUElVaGtKTFhHaGQ3cklKWFFmNFNCc3R4MnRURVNJ?=
 =?utf-8?B?Vk1TTGZHTlZYYXp1TWx1UT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7864.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U01FQThQOWU4bHk2elNVaE5oWnhCUlltWnFLWW9QbmhhRmFhRldNZFZEdE1J?=
 =?utf-8?B?WHdqbEZrZjFQbC80U0FlUWVxOCtBc09LRktpZ0plZENKaHhjY3pXUjRQUnF4?=
 =?utf-8?B?ZzkwWlVpOFF0a21yYk9rdnNVUWljSitVd21kUDltY1gzVTY1dVYxUC8rSEpv?=
 =?utf-8?B?b2QrdFAraTlGRE92bFlVS3c5aVJiUjh5UzlaS2pEL2ljOXVRZDYwYUJ4WEUv?=
 =?utf-8?B?cDdDcmRxV1J3cDdCTkpWMFQwSmc3bzNtZVVNK1F4TmpjZ3lVck1KWHQxSW9S?=
 =?utf-8?B?dFJGbkFJM3QwZ1pmUUxsa29zTUZwUG81RVBRd3cwTDFmSGlHdGNyNEVpNWN3?=
 =?utf-8?B?UzhLYUtZckdZOGwvbmNrZ1FtY0pDQlI5aGhxTS9KSW1UeUliSUNvdkkwam5l?=
 =?utf-8?B?bjh5NXZuTDRrRXdRSkhad1hqMkNxZTY1ZHVKN3F1WjhWV1JiTGgxOFp4TEJW?=
 =?utf-8?B?bjY0dC9wZnhxc0prQTBKU05ucU55SktBd0tSNi9vdTkvajBLNkNOc3I2SmM1?=
 =?utf-8?B?WFpCT2xFTzZ2U28wWlVvTFNhM3pOQ1NuNzQyekdpampVVE0vVlUxOG1mZWZv?=
 =?utf-8?B?dXYwQ2J3a0YvelNLOVdTcDJFUktpSXBjZmU2LzVoUTFrVTdSUUN5Q2tnZkYz?=
 =?utf-8?B?OFFCSzFjNjJObDJHRmo1SnpQYnErRG5PU0hycnd1c2hRdkkvdWRSVnVjakNw?=
 =?utf-8?B?ZGMwM1ljQWU1c1NXaG9TeUNKMmJGZjdhVkI0bHViVzZodU02OERHYlkxcG80?=
 =?utf-8?B?VTZYeXgxcGQxUTZqMXZHSjVLQzhiY3VIZHhrSE9WamJ4ZmhWeVhhSEUrdjBZ?=
 =?utf-8?B?WE0zcmN0QUd1VXl0UEwzWHRYaGQrZjBSWEhOaTNHN1VFcUdaUmFzQzlCaUZk?=
 =?utf-8?B?Q0J6U0pGd3RtMUpQeFRNV0gwVmhsVDNTdkVCZmpPZzJaSFpYRWt0RjRmWHBm?=
 =?utf-8?B?ejJnc0xmUWhqUEpMVG43M2VVRkVhT29GUFlhWkxiTDd4TFhPMGh3WGRWUWhK?=
 =?utf-8?B?NlpqK29mb0NzZ0UvU2JhQVQ4U2V2YisyNU9ORHhmaFVWWjZ0RGZjYWEwMW1D?=
 =?utf-8?B?cDQ2endLTmJPa1F4S2oxbGpOczFOWDN1V0RxY1NGMjhNa2E4VUhvN3NnUDBV?=
 =?utf-8?B?VW5xQjVKaWkzSTMvRHgrMmp6d2dIWWtmaFA2UStuV3A3NTd0dlhPeWhNVTlo?=
 =?utf-8?B?cU1YeFh3ZFMxQVA3RVFhUFprbkdhcFZ5TG9xVy90WmRQQ3kzM1hoZnZiVTRY?=
 =?utf-8?B?QWRFeVFwbUtQaFptNUZYWDZkVWRRNTAxSXNOSVZKWmt6M1djeDFvN2xoRXk0?=
 =?utf-8?B?WUtLVnJyV3RUb2hkMFVSUEhuRWdzaHF3eHpZSGFwRGw4d3dBYU53clYwL1hF?=
 =?utf-8?B?L0tWMzRTOEo2RjFveExSZVc5dGZBUVhlbncxWEo4aFlJSkNiOVQvSUtSZ2o1?=
 =?utf-8?B?VHNIU2x3NDlqSXQycCsrcEU0NnpxVkNpRE9FOWU3aHhLOXlHN1lwSnYwN2pr?=
 =?utf-8?B?V3RtK1RYanZscEVBRStKOG9yVzgwSy9CSno3N0NzbUV4QjVyZnBpaDdjaE1k?=
 =?utf-8?B?emh0ZTBOYjdicVVFWXIzSDIrQm1PMzFHakI5MTE4a3dzejZXWGVBUEE1UjZO?=
 =?utf-8?B?TmM5VkZDc2JqVHZmZStsZ1hpWjRML2ovODc4SVNOUzN3ZHB6NmFhRmlNcHFy?=
 =?utf-8?B?Q3dzdnNHb00zVUNIekE1bFdxV3JpUzU0UW1XY1NFOG1GcUxVdXRONHY2YXdL?=
 =?utf-8?B?aVJzcHBUVjA2Z0VhanJsbVptRCtCM3Q0U0h1S2FVRG5CTHh5R1VGSG9oMXhh?=
 =?utf-8?B?Q1F6L2phaFFQSmxScXpJSU9jcG5OeEtDUE50QTFYU1EyRG53bmhMZEtsNG5R?=
 =?utf-8?B?SElFV3NVNExrWGloaWN6VHM1Y1lUNUwwTkNnL1dFcStJbXFlRnN5YlZsTEdn?=
 =?utf-8?B?dEpVNzU0NDNmUGc4VGxmTDJjSDBtbkFVN1lnYkNQSTJ5bkNYUUhnT21ieERy?=
 =?utf-8?B?MlBrQ2wxOXRKQSs1WmFtSm9PTU5IcEVxcXdSc2cvdkRIZXJnS1FtNjVmemhj?=
 =?utf-8?B?aTJPbHNpaG9teU85L0VGRmc2QW1nWUhDVXFVMFdWcVZoL2hMcDZwMFVFei9D?=
 =?utf-8?B?KzFjaVk1S2V0aDZ3cSs1ZE5sUGhGT3BnQUpDeXhSUncyZTRRUE4wdis2M3V3?=
 =?utf-8?Q?PQ8+9NUfHpMzCa9e1R+xyo0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB2B4ED2D48C804095FDC5841A0E9EA8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7864.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1162765-48c0-402a-60b5-08dcde347bbf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2024 14:06:57.5317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LdDfwj3+FOrMLc4yN0rSaOV13PduwfAFi8rcWw1I08QdFWC3ZuhBkQldJ2KIRJamt5GZHyDAYiLqMzE3rP6WsbjSCL21JZUm/Gi6rUfWDwY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB5989
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

T24gVGh1LCAyMDI0LTA5LTI2IGF0IDEzOjM5ICswMzAwLCBNaWthIEt1b3BwYWxhIHdyb3RlOg0K
PiBJZiB3ZSBvbmx5IGZpbmQgaGFyZHdhcmUgZW5naW5lIGZvciBmaXJzdCBjbGllbnQsDQo+IGl0
IGNhbiBiZSBzdGFsZSBmb3Igb3RoZXIgY2xpZW50cywgYWZ0ZXIgd2UgY2xvc2UNCj4gdGhlIGZp
cnN0IGNsaWVudCwgYXMgaXQgd2FzIGFzc29jaWF0ZWQgdGhyb3VnaCB0aGUgZmQNCj4gYW5kIHdl
IHNob3VsZCBub3QgdHJ1c3QgbGliL3hlIGludGVybmFscyBob3cgaXQgaGFuZGxlcw0KPiB0aGUg
ZW5naW5lIGFycmF5Lg0KPiANCj4gSSBmb3VuZCB0aGlzIHdoZW4gdHJ5aW5nIHRvIHRyYWNrIGRv
d246DQo+IA0KPiBbICAxMzIuNDY3NjE2XSB4ZSAwMDAwOjAwOjAyLjA6IFtkcm1dICpFUlJPUiog
SW9jdGwgYXJndW1lbnQgY2hlY2sNCj4gZmFpbGVkIGF0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9l
eGVjX3F1ZXVlLmM6NjExOg0KPiBlY2lbMF0uZ3RfaWQgPj0geGUtPmluZm8uZ3RfY291bnQNCj4g
DQo+IHRyYW5zaWVudCBlcnJvciB3aGVuIHJ1bm5pbmcgeGVfZXVkZWJ1Z0BkaXNjb3ZlcnktZW1w
dHkuDQo+IEltcGx5aW5nIHRoYXQgYSBwcm92aWRlZCBjbGFzc19pbnN0YW5jZSB3YXMgY29ycnVw
dGVkL3N0YWxlLg0KPiANCj4gUmVkaXNjb3ZlciB0aGUgZW5naW5lIGZvciBlYWNoIG9wZW5lZCBj
bGllbnQgc28gdGhhdA0KPiBpdCBwb2ludHMgdG8gYSBwcm9wZXIgdmFsaWQgZW50cnkgZm9yIGV4
ZWNfcXVldWVfY3JlYXRlLg0KPiANCj4gQ2M6IENocmlzdG9waCBNYW5zemV3c2tpIDxjaHJpc3Rv
cGgubWFuc3pld3NraUBpbnRlbC5jb20+DQo+IENjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWlu
aWsuZ3J6ZWdvcnpla0BpbnRlbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IE1pa2EgS3VvcHBhbGEg
PG1pa2Eua3VvcHBhbGFAbGludXguaW50ZWwuY29tPg0KDQpMb29rcyBnb29kIHRvIG1lLg0KDQpJ
dCBpczoNClJldmlld2VkLWJ5OiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsuZ3J6ZWdvcnpl
a0BpbnRlbC5jb20+DQo+IC0tLQ0KPiAgdGVzdHMvaW50ZWwveGVfZXVkZWJ1Zy5jIHwgMTggKysr
KysrLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMg
Yi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnLmMNCj4gaW5kZXggNDBlMDdkZGY2Li5hMmIyZjM1OTYg
MTAwNjQ0DQo+IC0tLSBhL3Rlc3RzL2ludGVsL3hlX2V1ZGVidWcuYw0KPiArKysgYi90ZXN0cy9p
bnRlbC94ZV9ldWRlYnVnLmMNCj4gQEAgLTEwMDcsNyArMTAwNyw2IEBAIHN0YXRpYyB2b2lkIHRl
c3RfYmFzaWNfZGlzY292ZXJ5KGludCBmZCwgdW5zaWduZWQgaW50IGZsYWdzLCBib29sIG1hdGNo
X29wcG9zaXRlDQo+ICAjZGVmaW5lIERJU0NPVkVSWV9WTV9CSU5ECQkoMSA8PCAzKQ0KPiAgc3Rh
dGljIHZvaWQgcnVuX2Rpc2NvdmVyeV9jbGllbnQoc3RydWN0IHhlX2V1ZGVidWdfY2xpZW50ICpj
KQ0KPiAgew0KPiAtCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2UgPSBO
VUxMOw0KPiAgCWludCBmZFtSRVNPVVJDRV9DT1VOVF0sIGk7DQo+ICAJYm9vbCBza2lwX3NsZWVw
ID0gYy0+ZmxhZ3MgJiAoRElTQ09WRVJZX0RFU1RST1lfUkVTT1VSQ0VTIHwgRElTQ09WRVJZX0NM
T1NFX0NMSUVOVCk7DQo+ICAJdWludDY0X3QgYWRkciA9IDB4MWEwMDAwOw0KPiBAQCAtMTAxNSwy
MCArMTAxNCwxNSBAQCBzdGF0aWMgdm9pZCBydW5fZGlzY292ZXJ5X2NsaWVudChzdHJ1Y3QgeGVf
ZXVkZWJ1Z19jbGllbnQgKmMpDQo+ICAJc3JhbmQoZ2V0cGlkKCkpOw0KPiAgDQo+ICAJZm9yIChp
ID0gMDsgaSA8IFJFU09VUkNFX0NPVU5UOyBpKyspIHsNCj4gKwkJc3RydWN0IGRybV94ZV9lbmdp
bmVfY2xhc3NfaW5zdGFuY2UgKmh3ZSA9IE5VTEw7DQo+ICsNCj4gIAkJZmRbaV0gPSB4ZV9ldWRl
YnVnX2NsaWVudF9vcGVuX2RyaXZlcihjKTsNCj4gIA0KPiAtCQlpZiAoIWkpIHsNCj4gLQkJCWJv
b2wgZm91bmQgPSBmYWxzZTsNCj4gKwkJLyogR2V0IGZpcnN0ICovDQo+ICsJCXhlX2V1ZGVidWdf
Zm9yX2VhY2hfZW5naW5lKGZkW2ldLCBod2UpDQo+ICsJCQlicmVhazsNCj4gIA0KPiAtCQkJeGVf
Zm9yX2VhY2hfZW5naW5lKGZkWzBdLCBod2UpIHsNCj4gLQkJCQlpZiAoaHdlLT5lbmdpbmVfY2xh
c3MgPT0gRFJNX1hFX0VOR0lORV9DTEFTU19DT01QVVRFIHx8DQo+IC0JCQkJICAgIGh3ZS0+ZW5n
aW5lX2NsYXNzID09IERSTV9YRV9FTkdJTkVfQ0xBU1NfUkVOREVSKSB7DQo+IC0JCQkJCWZvdW5k
ID0gdHJ1ZTsNCj4gLQkJCQkJYnJlYWs7DQo+IC0JCQkJfQ0KPiAtCQkJfQ0KPiAtCQkJaWd0X2Fz
c2VydChmb3VuZCk7DQo+IC0JCX0NCj4gKwkJaWd0X2Fzc2VydChod2UpOw0KPiAgDQo+ICAJCS8q
DQo+ICAJCSAqIEdpdmUgdGhlIGRlYnVnZ2VyIGEgYnJlYWsgaW4gZXZlbnQgc3RyZWFtIGFmdGVy
IGV2ZXJ5DQoNCg==
