Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B12C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 05:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D65710E1CC;
	Tue, 18 Mar 2025 05:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iPOvl1Ac";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E9510E1CC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 05:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742277220; x=1773813220;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pZODhb4J+YR4vOycsuEIebLgJzZNRj6hLmPpmnq+ZhQ=;
 b=iPOvl1AcCm6JZfBWslOGaH/21R+18Wqmnrelq2TU1q6vrYgPfCjCF/Eb
 5SSBNoMmEkEXEu4VAqI38pIz63JWZ6yhDPviyTq6F2KjRJ8x/iQfRPL/9
 gfEInEkf8tC+eogKk6hZ95PHqbRVdncQqO1kLBF6ld9YXVGw8sb+aRPvI
 SOeyOV6pULHhrHebdjF3nKQEWrg3yekdqFyEc5KKJYozWco8dB6cN+Zwi
 21L28zt9rnMm3cppr/F52hXR+As9R6Z3U+M1Hm261QOTjGukOEcTZEZJM
 FzG4e6t3EmlHVRYfd5mp3fGyPknaZtnky3Y6N4U8Dz9TL5RrfNpS6fndt Q==;
X-CSE-ConnectionGUID: SDBSV7P0SNm4/Wt0sguc7g==
X-CSE-MsgGUID: mx6qYA96QfGRkh2IAvY3gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="43313500"
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="43313500"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:52:21 -0700
X-CSE-ConnectionGUID: 55EQ8KG0SVCn3Qfz3sGCQQ==
X-CSE-MsgGUID: zRkPzE5CRvaQ7O1xK67IGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,256,1736841600"; d="scan'208";a="126352949"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 22:52:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 17 Mar 2025 22:52:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 22:52:19 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 22:52:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dHgEvXj07ON/i0k7ISs3tI518K0xr6frFSKlgk3UHr78TMfgq3fwNj1dnKmHZ3Q4Buj14qgtomzbrPSf01DwCWxiE8whAkStX9mOXGh0nd8PFL/4jUT8LcaSB34S+OCM2HRVG04FfiVjKXwCgCTRb0B5izudC7ZvVAphUjKM6OA4l6TO9olTPqF7MxkE2cKqyUaEeUxwS/cv3X0gn7CfRpzt4mwtq9nxlv7KizI3H0tQ5BVUqr9BTunLUBgkdufwbj5VJwygaNjKVeAPj0j/EeZhfIuHcq1jhh4m5o2fx/qh4cY/QGrT0AjeGof+gOR80tsAjHH3eOhvTB4fm0wcWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVZKd87g1SJ44ayjGLAJTmoubnDZh2bMaMKHXFpeVuk=;
 b=CuUhJqB5yfv9SDKThDnqJNV9nhXHXuc0IgVH9ESdJtVVOLuCaxXdwXpXlxAOGCLWbnQa1dc1QvMU7Jrg7ktULJSeX50i4exleRJv7p08P64xTGXcMIwNi5QNdqUjnYgZFvjrD60nU+M34ibAOVGMEgAMlpC7X6AofcvtlWKoBn2T651Ag6HmuqCkfOTN8JHoHBLKknSxlWQuQHNBK4NWTcLaUB04YrO8eP76AdrX3Vqc3nDeaFz27UEh760XffReYXheByokXY8W10VijdJ0hlobN6XV7O5+c4cExeex737x8mCsrM5NJNjHbQRRRuz/OkU86CfGlBEd8QDidRQ4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by PH7PR11MB6932.namprd11.prod.outlook.com (2603:10b6:510:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 05:51:35 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%4]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 05:51:35 +0000
Message-ID: <8ebeceed-321a-45f4-b241-8a7992c2d19f@intel.com>
Date: Tue, 18 Mar 2025 11:21:30 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
 modifiers and formats
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "B S, Karthik"
 <karthik.b.s@intel.com>
References: <20250311085422.2573860-1-santhosh.reddy.guddati@intel.com>
 <20250311085422.2573860-2-santhosh.reddy.guddati@intel.com>
 <SJ1PR11MB61297304FD895ED97AEEAA43B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SJ1PR11MB61297304FD895ED97AEEAA43B9DF2@SJ1PR11MB6129.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0049.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::10) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|PH7PR11MB6932:EE_
X-MS-Office365-Filtering-Correlation-Id: b1759edd-fd2a-4886-654e-08dd65e0f185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MUNSQzJobE9QdUxJS0Z6RzdjWGtuOXFoR3VQY0hSdllPeHJSV3ZYOTZtNUo2?=
 =?utf-8?B?dU4rYWlncWZNQng0NUN6YkswTWU4ak9QRnNsWmhzTmt5NHRDNlp4WDFlcjNu?=
 =?utf-8?B?QVIwQzY2TnMzZVNQRXFrQTNHL3FqRTliVkl1Y0VqQzdETWlBUXRYckgvelU4?=
 =?utf-8?B?L0pJNGRXRVpjR0x1a1AzdENZbnZTa2VlckhLTGNIY3RqbDJZeHY0U2tCMmJi?=
 =?utf-8?B?Z3BEcDFlOVZlMjhBL3ZyNEdEUlp3Uk1wVWVpZ1hXVC9ZcW5EVm9JWS9ueWZr?=
 =?utf-8?B?WGpYUWVxRTc4SnVxYXI0Y3EwYW9Mb2xJT1J2anE4MFhwK3daVDBqN0xQbzU1?=
 =?utf-8?B?dkVKL3paYTAxVklwU0grSC9odFRib2V0ZE44c01yak03UlBXdFMwQU10WnJN?=
 =?utf-8?B?TWRzTUVCMUhDQUQvSnBsTS9iRkxlc1dmdnJYVEpHQkJydmtDc0dTWi9wNGZz?=
 =?utf-8?B?M1RkSS8wSi9SYlRWekRodXlxZXRpUUNMUEc0RlpsWldrbXFSTTNQMG5VbC84?=
 =?utf-8?B?SWdmM0NIN2I2R0c1QTRoNVQrUjNWdllrT1RIMm9kbDlaMnpGNkJ4NTMyS0hz?=
 =?utf-8?B?SXlEeGdvMlA0ZmhpZ3JtdStvRDZPR1hiOVE5VXRQWVFHUU1KODdZS3FCWit0?=
 =?utf-8?B?Rmg1Qm5FbzVhUXM5dUhiMndXZTN4bkNnY3ByY1Bua0RkYnlFMnMxZEsvUTMz?=
 =?utf-8?B?a1hmL1FGN1o3eTE4UDdOeVZ2VnM0ZUVETlgwbDhyQmpzQllXRTg2SERnTEdQ?=
 =?utf-8?B?cm5XL2wzZGZZOU1kNTlNZjhsZjAvRzU4SWNraVZwRWdDR2JJNFc1SEhRMmpp?=
 =?utf-8?B?YXhUQ1FMQnZjTTFGdmJhTlNESjE3cDBjMnVBcGltTURRVkJyR0FkWVpoYkFM?=
 =?utf-8?B?dHBtWVFCaTBVUldhbVR1Z0UwbTN2aDdiZGtSQytscWw0clZrMXdTQy9nK2No?=
 =?utf-8?B?Tmhqd3NDRWRxcEl2WEZ3bmVmbFFQaldvSXBwckNoTTNkN3VPdmtjb2xPK0Js?=
 =?utf-8?B?RjcxOFRrUEQwTGtvTU1sS09HMXVHaDRFUzV1RlcwU0YrT2xuSXpmUXdJSklz?=
 =?utf-8?B?bExWVDdGVXViQjdkZEFUUmN4ZUJPcVU1cTFTNzJjQytRbzR6dnZDclZ5SUw2?=
 =?utf-8?B?UXRaM2tXT2ozLzlYTDRyakpOaENFL1VhdytYcUNNak8ydm9NM2Q4c0lheEdB?=
 =?utf-8?B?KytFU3MzS3hRWjA2RU50NEdYVDdIYjFWMzc5YnptM3ozZDZMdXpTb2lMS3V6?=
 =?utf-8?B?UndlazhHanY2blU0YkdqZUkyanFKa1QrQjhvT1B2elo5QTNBbzhSZEYvK2tU?=
 =?utf-8?B?ajhlMzBjN2x1NHg2ZTRXU2MwamhkVlo5Z1NjWXBFcUdscU55UDZTREtabXRY?=
 =?utf-8?B?bXREa0lmKzVYT2hHOGZBOG9IY0JZMTlqNU1yd1JHdkluSkhkeE5KNEc3UTBy?=
 =?utf-8?B?dnd0aUNKelg3UjhPbThNZTEyVk5Fa083L3R6VmIxVTZuUmVTd2FpQ2lKdllD?=
 =?utf-8?B?VGdFWTdwYTJpa0pkKzZmM2hsOE0xTXo1ZmNOVWE5SitJdWFRZFBtUnhnREls?=
 =?utf-8?B?b3hzdDd0QVF6ZkZZZUFkZVdpNDU5a3Jjdm5jczlCVmpGL2dCT0VIaEZuL2VG?=
 =?utf-8?B?QjJxKy9xcGpIeUlLYjFwNFh3YjhZSmxCZVFiSEJNTFFubTAvbnZ4bWxFYWVs?=
 =?utf-8?B?eFJ1R0VPclVmRTFGdk40c2NHMnVIcDBPYWE3RjdEQk1NcnVrTnVpUWRYMXJv?=
 =?utf-8?B?N1diNGYwbVJwd3kwa2wzZjR1bWl1UkllOENjd3lzdUZhUjdCaCtydHFxVmFW?=
 =?utf-8?B?dWlQRkxFaXZVQUJ0cGtiQTM5aUQ4ck9Vcm5UcW1xTGJoNHdxWlZkaFJDaEpk?=
 =?utf-8?Q?if6bgsxXS/TJC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2ZJc3pqK2d4QkRXRmdac0lzMUZsSTdYVld6T244RW5XUkhlRDNCeUhFZGsw?=
 =?utf-8?B?MXdIazBOMEdpU0gwSkdrMG9rSENpTzFXd0lvUVluRWNmNzhtcUtBYnJTTm04?=
 =?utf-8?B?T2hkbXFzeWtidjhSeVhjaTFKbFBzZlZiUERsY3JucFN4WWhIWmoycnlYTXFr?=
 =?utf-8?B?TXlKWk5GMUNRN25aRzY0WkdYTGxqNGFES3lVT0xDRXZUckNkd0ZGS2ZaRXJx?=
 =?utf-8?B?VkhnTXh4T1dhNE1WUDZINVFETTB4TXZ3ZTNsaGdSWko4QTFSYmc2dFdYdGVV?=
 =?utf-8?B?RjN2Z092NnpmSVBVajQ3eVB3clo4dTluWE1VN2VWYk9mWlBJdS9YeTlsb0N5?=
 =?utf-8?B?NWhMV3BaOUk5OEJLRXFRc1VlUkg2WXphbTdEczIvRHZEcmFFTmJHYzFzK0lK?=
 =?utf-8?B?bHE3N3poU211ODNVQVlhekhLOE55bVlKRUtIbnZhZTNkMkZZTkZLdWpUMlNQ?=
 =?utf-8?B?NjVoRWxwa1laaXk4Sks0T05mcXVPb0FCWGhoU1U0MUlqaFVvM3pUeHNubTdS?=
 =?utf-8?B?R29EVnFDRCtTaXNPUzFOTkNkZkxLcFd3YWxOS1ZYVllhdThXT2ozMFpGWEZ6?=
 =?utf-8?B?WjJGUDNkQThXWjFGaUN0czZnWXE4RktJUzJyR05lek9qV2NOVVZvSHd5QmpW?=
 =?utf-8?B?a29Sa3NqUzhXVFFPRUtuYWcvdXM2bGpTanREUnEvMEU0T3dIcVI2bjNRNERn?=
 =?utf-8?B?L2d4QkNMSmx5UVhLWW1aRW5BT1YrajFoUzlSODE1Sk1abHlVd0VNTjA0N1Vw?=
 =?utf-8?B?UkIrTE04bDdVTmpySkFFVWl6ZEVEUW1GREFRblNLZ1ZNK0FSRnMyTWxNRVNu?=
 =?utf-8?B?ZWVVSlpucGpmS2trTExLMEtPb1FMWGgrY1NjdlFaODQwWUw4MDJHL3NoeG5S?=
 =?utf-8?B?TVFqKzhpakM4N2dnSk1ESGwrTnYzQmpiRXFjL1JIL25PMi9PRmQvMjJkL1Np?=
 =?utf-8?B?SkZzSjUrc3ZWNkV5bUdHdjgrSFA1Y0krbG1rLzZNNWFKd1hzdUhpVVd5T3lF?=
 =?utf-8?B?V0czR2NCS0RMbHVEMFB0M3pTMFBDVmhOSkRaRENxdGhmRXg1WllaRnF0STkv?=
 =?utf-8?B?ZGZRRXJBNnZrUGUxTGJxVjNuMnorMitKaEZsZG5zT3hEeU1GR2gyYUJDQkxW?=
 =?utf-8?B?Z2Z5SE9tU1NkZWhKNStJL2RTZmZrcUtITFZJQUo0NmtXaXVFTWE1anhwd2xx?=
 =?utf-8?B?L1hlWkp5bGlLS0gyL012S1FMTmJTWWtiOTk4clBFMEZjQ3dzeHF4bE5HOUFk?=
 =?utf-8?B?d2xoaU4zMHNWYmNsSER5SWhkRllyT2lvNEU4Yk9YRzlRZWlHVEJJWkhzZUJy?=
 =?utf-8?B?dGc4dkZpSUdCbVcvZkFxRTJxZzIrUUpFeDBTQ0k2Rld4bW9MT1VnUXNRb2ti?=
 =?utf-8?B?SXlzajBFTlZqQzRiTGdKcTlPSEdhYWVXMmJVSmdDRXdIblAyMksvWllUcGxk?=
 =?utf-8?B?U2VXM01KcDAyZVpSYzBGVUcwZFRmUFFRTXlQdDVqM3o1VmZLZTRnam5CY0lF?=
 =?utf-8?B?VzFUYnFnRVRUUEIycXhjRzlUL0UvaFdwOVZtVUNnZllHNWZoK1dEd0JkUmhu?=
 =?utf-8?B?MjkwY1hyZ3BReE9oK3RiOG01RU1QUWl6Q013aEtScHB4VUpIa2hXVkE2YlJ2?=
 =?utf-8?B?S21abWhjaHRib1Jta0FiUWxOeXVIdXRyd0JFV0ZhS1FnYWpMUnFlRVVESjNI?=
 =?utf-8?B?bWFOazgwQ0pJOUJLbUN2L2hNQnJZNkxtY2pVMkR2NHVtK2NlZWs5RDJoOElB?=
 =?utf-8?B?TEY3cnRoN3FxN0FOWHRkbnFwZzFPdGxSeHJYREg5MkNsY1RRbmJBUlpCaDk1?=
 =?utf-8?B?c3NrUnpMenh1WTVYMi92RUJVeWszRzVERy9JTlUvVWRMdC8wSnVJay95dnAv?=
 =?utf-8?B?eTJITjRZM0s4Mm5LQ3o1SFBNeG9kdm84Sm9ZaVVpVTF0Q3BwczRXdUxGR1Rk?=
 =?utf-8?B?ZnRmcHY3WW9pR0VoeStkNkoxWkpGQUZDQ0hRYmRuK1RJQXRjaVJaSytsZ0g1?=
 =?utf-8?B?WWttME1mM2pxb2NUVzAyajN2QUJtc1lHRzhDWWVaaVVESUZkeUdIejFnU0FJ?=
 =?utf-8?B?TFlxWCtGNVlZUUM0bTRFS3YyUzlHaG56TjkzTEhqVHM2SVN1QzBuMmdlSVlO?=
 =?utf-8?B?cEhmNHc1UC9Rc0tXK2NzWGRURGxZeTd3YlpCRnV4TEpBY1B6NTFQVEtpTjhB?=
 =?utf-8?Q?4/ofGOJD2RyY9THwvub9bsI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1759edd-fd2a-4886-654e-08dd65e0f185
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 05:51:35.8815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ycdB0CyQmynK0u7aTir4o+hoVZDEYqQAfvW6SO9Jr065Y3/aa1mEgsu27QGbxf+5QRFt/S41B/o/pA8dZGnzeN4P7e7e/mqjMg52y2fuKwkL5xxh3jowNr1kMVfptREf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6932
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



On 17-03-2025 14:26, Borah, Chaitanya Kumar wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, March 11, 2025 2:24 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Murthy, Arun R <arun.r.murthy@intel.com>; B S, Karthik
>> <karthik.b.s@intel.com>; Borah, Chaitanya Kumar
>> <chaitanya.kumar.borah@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v5 1/2] lib/igt_kms: Add support to retrieve async
>> modifiers and formats
>>
>> Parse "IN_FORMATS_ASYNC" plane property to identify supported format
>> modifier pairs for async flips
>>
>> V2: Add new fields async_formats and reset idx.
>>
>> V3: Improve commit message , remove unused declaration (Chaitanya)
>>      Introduce structure to hold a format modifier and its
>>      associated format list.
>>
>> V4: Implement format+modifier tuples for async similar to IN_FORMATS
>>      (Chaitanya).
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> ---
>>   lib/igt_kms.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_kms.h |  7 ++++++-
>>   2 files changed, 51 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index cc3bb3ae7..dfb23c45e 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -701,6 +701,7 @@ const char * const
>> igt_plane_prop_names[IGT_NUM_PLANE_PROPS] = {
>>   	[IGT_PLANE_FB_DAMAGE_CLIPS] = "FB_DAMAGE_CLIPS",
>>   	[IGT_PLANE_SCALING_FILTER] = "SCALING_FILTER",
>>   	[IGT_PLANE_SIZE_HINTS] = "SIZE_HINTS",
>> +	[IGT_PLANE_IN_FORMATS_ASYNC] = "IN_FORMATS_ASYNC",
>>   };
>>
>>   const char * const igt_crtc_prop_names[IGT_NUM_CRTC_PROPS] = { @@ -
>> 5758,11 +5759,14 @@ static int igt_count_plane_format_mod(const struct
>> drm_format_modifier_blob *blo
>>
>>   static void igt_fill_plane_format_mod(igt_display_t *display, igt_plane_t
>> *plane)  {
>> -	const struct drm_format_modifier_blob *blob_data;
>> +	const struct drm_format_modifier_blob *blob_data,
>> *async_blob_data;
>> +	const struct drm_format_modifier *async_modifiers;
>>   	drmModePropertyBlobPtr blob;
>>   	uint64_t blob_id;
>>   	int idx = 0;
>>   	int count;
>> +	int async_count;
>> +	const uint32_t *async_formats;
>>
> 
> I don't see a reason why we can't re-use the blob_data and count local variables.
> 
> But that got me thinking. Are we leaking the blob?
> 
> I don't see a drmModeFreePropertyBlob() call made after drmModeGetPropertyBlob() for both sync and async.
> 
> Otherwise the change looks good.

Re used the local variables for the async formats and yes, there was no 
drmModeFreePropertyBlob() for sync formats as well. Added this for both 
sync and async cases.

Thanks,
Santhosh>
> Regards
> 
> Chaitanya
> 
>>   	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS)) {
>>   		drmModePlanePtr p = plane->drm_plane; @@ -5822,6
>> +5826,46 @@ static void igt_fill_plane_format_mod(igt_display_t *display,
>> igt_plane_t *plane
>>   	}
>>
>>   	igt_assert_eq(idx, plane->format_mod_count);
>> +
>> +	if (!igt_plane_has_prop(plane, IGT_PLANE_IN_FORMATS_ASYNC))
>> +		return;
>> +
>> +	blob_id = igt_plane_get_prop(plane,
>> IGT_PLANE_IN_FORMATS_ASYNC);
>> +	blob = drmModeGetPropertyBlob(display->drm_fd, blob_id);
>> +
>> +	if (!blob)
>> +		return;
>> +
>> +	async_blob_data = (const struct drm_format_modifier_blob *)blob-
>>> data;
>> +	async_count = igt_count_plane_format_mod(async_blob_data);
>> +
>> +	if (!async_count)
>> +		return;
>> +
>> +	plane->async_format_mod_count = async_count;
>> +	plane->async_modifiers = calloc(async_count, sizeof(plane-
>>> async_modifiers[0]));
>> +	igt_assert(plane->async_modifiers);
>> +
>> +	plane->async_formats = calloc(async_count, sizeof(plane-
>>> async_formats[0]));
>> +	igt_assert(plane->async_formats);
>> +
>> +	idx = 0;
>> +	for (int i = 0; i < async_blob_data->count_modifiers; i++) {
>> +		for (int j = 0; j < 64; j++) {
>> +			async_modifiers = modifiers_ptr(async_blob_data);
>> +			async_formats = formats_ptr(async_blob_data);
>> +
>> +			if (!(async_modifiers[i].formats & (1ULL << j)))
>> +				continue;
>> +
>> +			plane->async_formats[idx] =
>> async_formats[async_modifiers[i].offset + j];
>> +			plane->async_modifiers[idx] =
>> async_modifiers[i].modifier;
>> +			idx++;
>> +			igt_assert_lte(idx, plane->async_format_mod_count);
>> +		}
>> +	}
>> +
>> +	igt_assert_eq(idx, plane->async_format_mod_count);
>>   }
>>
>>   /**
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 27b545f52..78d6a7ee4 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -365,7 +365,8 @@ enum igt_atomic_plane_properties {
>>          IGT_PLANE_HOTSPOT_X,
>>          IGT_PLANE_HOTSPOT_Y,
>>          IGT_PLANE_SIZE_HINTS,
>> -       IGT_NUM_PLANE_PROPS
>> +       IGT_PLANE_IN_FORMATS_ASYNC,
>> +       IGT_NUM_PLANE_PROPS,
>>   };
>>
>>   /**
>> @@ -438,6 +439,10 @@ typedef struct igt_plane {
>>   	uint64_t *modifiers;
>>   	uint32_t *formats;
>>   	int format_mod_count;
>> +
>> +	uint64_t *async_modifiers;
>> +	uint32_t *async_formats;
>> +	int async_format_mod_count;
>>   } igt_plane_t;
>>
>>   /*
>> --
>> 2.34.1
> 

