Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A135FD3C550
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 06:58:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5150510E8A4;
	Fri, 18 Oct 2024 06:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vb6dpEoC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CA5910E8A4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 06:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729234698; x=1760770698;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Xu7a1qWydd7erzxK0n9jjNJ/c5S9Y836b7tOtQzD6D4=;
 b=Vb6dpEoCVwNJ5Fu6tCccGPg+puFbiJLI7vhnvqWZj/yMr0PUSzF9EXfz
 nt5bJ6TjBiI5FajvUFwZVf0SR95AzTAGWs+DtvdxxtNuF0SlBuBftQ1hM
 U+Y7Q0Aa8laywMTESFK26Vi1tLh20IWz1DWetWmfstXU4vCYpqJ5KWUZj
 55LpgKGwdq5kjLb2tv+9FRor0WvZkGnJ9acflLUtf1SpzlaHOdIPW/w25
 lIXfejvndEB1SEcW4JksOY+dDI/wGD7gNMB4Qb8eKkr1bEeXZXeQoFNlo
 1Be0kXJnsuuyrWwGra1Pj0hBbHEBuFHNgb+cOCx2dWvP9bivaQv4/OF6b g==;
X-CSE-ConnectionGUID: a3GAJOK0R4+KGd91xLwLGQ==
X-CSE-MsgGUID: zLY6r9XYTU6GlnPyLdprGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28886981"
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="28886981"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 23:58:17 -0700
X-CSE-ConnectionGUID: 3OkrlmjQQCGMeMdiUeG/YQ==
X-CSE-MsgGUID: WamLPORbQKiy4V3Hbj4FCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="78389635"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 23:58:17 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 23:58:16 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 23:58:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 23:58:16 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 23:58:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjPBOVz4CSkSO26BKxwhJqbC7H+GP8UfCcq3hEOG7Ddzq4r7uV+5fSTf2HipLuiHBpx/2gAyVV9YMbbPvs6MywYkK7GG9gDgYOaytjgiab7WCElS9ZXGGmCYfm1Fmn9WLRnBypDGzjI9ObaztHWTBdXgvUXwCK8Au7DH/57mb1EG6Bis26I9nP/tUjxpZm/Rr791LIxi7xmpl9uMY8es2mQij51hXXijMWwRjfWUp5BhRrxx74lKlkY4Z+dSp4duimWD+CjxSyq+BqIWlk54HvhEk/SY2UPslBIJSRGuq0GKGQmfKcrNMkndo5IyMupIZzh6iCMeOXTAJkxtF4R1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQ+//KPkQrsfKVsjAWrsFjA5Gucoh2tjqmk170z4kFQ=;
 b=NHFImIzsFQDd2hsOB+yIaDSWSJ89+a6DMX8UdnIGGAicDWPPv/TZmYUYtAD+Rgx56hnaAG16g2adA2XVf1f1vNlIyk9dBikPf40g3K/JXSW73i3fH/nBBNVe1H6GYh8uxqdTMLKbPjmHq546qgT0OJfzHB3TnvF1NtdRPleKBA/LxizkECIb07VRWbWHF4EcXorEDdKAXTfMVWeweMBQwQQJmxR8+yuuYASuOuz2a7OTYTzXms8qmaGcgSHtH5pJVFyJpYq5QuvWttj5N0ZhZcfycD5hpsQTeH/Skzvi1fD9+ZUu3+7gqi/WV1xfDMFLUTKVdt8cUVX44GMQZZmS8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 06:58:13 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 06:58:12 +0000
Message-ID: <af4fae8c-01cc-4b47-bc27-d42407fcc9de@intel.com>
Date: Fri, 18 Oct 2024 08:58:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 3/6] tests/intel/xe_sriov_flr: Add skeleton for
 clear and isolation tests
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, C V Narasimha
 <narasimha.c.v@intel.com>, Jakub Kolakowski <jakub1.kolakowski@intel.com>, "K
 V P Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
 <20241009113018.741371-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241009113018.741371-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA0P291CA0002.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::29) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: d35e502d-de16-429b-2b6b-08dcef423b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Tnc3YXVSOFRnZTdWWlhXSVVVcHl6NGsyby9WQk5qOCtDelpFT0pYbjFBTVZN?=
 =?utf-8?B?elQ3ck5qS29wTisxRUNjRFZic0lPQlY3WlhjaEU1M0IxeHJJYTArbTgzam53?=
 =?utf-8?B?MUtQMS9KRlhGU3AxRU5EWDhoRmNxYjdrSFVsSDNqVTFwWUZGU1VLVStKb1ND?=
 =?utf-8?B?NDIwQjlxK3FQWTFoSHRjQVBFSW9oQ2tJU0RRS0RZSmtmUHNjTjBqTkkvZWRR?=
 =?utf-8?B?VTd4N3p4bXJlZVc2ZWV6OVpkdWF5THZxUk1OOVRIMWN3TGRZTHNSblNaVUJt?=
 =?utf-8?B?NTllY0pvcXo0WTl5N0lYWkF3SHd6V09zdFVwWExWVEg2aDB2a25Mbk1wMkE1?=
 =?utf-8?B?YUh2dnFuU0QrSXdjNVlRWVNOd3BKaFpGOVQ3M2h1S2h6aFBlc1RydjdnZEN0?=
 =?utf-8?B?eDJGTU40MjZ0K1plZmdpS1BHcVpOd2Z6cklvMEplMFJINHlVbTlVYkd5YVBW?=
 =?utf-8?B?WEVSRko4YXFmWUd3YmgvbnVDczBtS3dYMW1hcnV5ZWZMVC9wd0ZkNWpSM01i?=
 =?utf-8?B?emhNRWZiSTEvbnZYMEEveWcyWDZjR1FScjB0bm05cDg1MHp2WlptbThuV1li?=
 =?utf-8?B?M3R1SHVESW1tZUluejl1aDlBdldtelJTTGR0SFhLaXVERnFVS2JMd3czaTRT?=
 =?utf-8?B?ZEF1c29YY05FSEthRzhsd2VlNjNkWXVhRzFqaXZGTEwrQksyMzMvUUN4dTh1?=
 =?utf-8?B?by9xZlBoZVpsV1paemh3L05mQ2tDUVYwZG4wQnVLTHgya3R1aTFDMGJsbkw2?=
 =?utf-8?B?ZSs4dmNOa1hVdkdDdHJob1hISWtoYUwxcDRNN0ZZSmlnQ3pUSUJTYS9tMk9T?=
 =?utf-8?B?dm5hT1YyRzVhbXlLS25iUnJRSFhNdmVVVmVpUjJaaDV5R1M0Tk5mZVhDUW5i?=
 =?utf-8?B?M2ZmMjlZRGFzSkVjdDgrRkZLaW5YWmR3MW8rN3p2WE9oNUpTOXVYYmxpR3pk?=
 =?utf-8?B?M002TWZDaGJCdnhtSkt5SnRaOERnUWY3aklQM2RpLzE3QnBHMTUxL2FXeDA1?=
 =?utf-8?B?UXRrRGZhaEtFamFSVXA2M1ozZ0s5V0JqWXZqM1Nuby9tM3VGa2FYY3A2dmx6?=
 =?utf-8?B?NnRHVWY3YURqVU9aaGlrUWxJd3B3OVFUYS82L0NLcHlCT1ZGaWp6TjdCemtX?=
 =?utf-8?B?TVlKaGIzUGhGTGRCWWJLc1JhNnJ5bXhXVEhWcDc2UnF4RSsxc1RYS3Vxbk5P?=
 =?utf-8?B?b2ZqdlM2cEhlWUNSWmJIV0RsTXNjcU1iSjdRSGtsQm15WHJNTjY2VTBKYXlT?=
 =?utf-8?B?bVE5SHp3MGt4ME55REorN2NuVFpRb3RHQ2pobGZsQUtnUjhhUUQ1NGxSNE1W?=
 =?utf-8?B?L3RxNXJZTFBESWlUUmUza0IxNnhnNlRSNWNrdjNWWFFLc1ZBVno2Wmw4U1R3?=
 =?utf-8?B?TmpLb3I0U08xb3BmTTZUd0tQUWRiamM0YlRpSzV0WTdSakxWVlIwZ2RtWkRi?=
 =?utf-8?B?czljd1FPZFBCQ2x0OUJBQSs5LzZydG5BeXAyKy9sTEVPb1BRL3pDUEpjaFg3?=
 =?utf-8?B?dlEwbCs3V0xrUGlVNzJZa2NoWGFJVHhyYmZ3YkxMTktndEo0cmdwRXNmczh5?=
 =?utf-8?B?T28zM1c4TnI0d2M2dzdEYlVZc0dacFUxMHJVQktaZytrNlp6bEhwQWtEN0x4?=
 =?utf-8?B?QjVKTm8xeFBwMHg4QndxdnZFR3FYbG1pK3E3V0g1WEhVN2Q0dGtabWJtR0VN?=
 =?utf-8?B?OWNkSDlDeWt4QVp5aE5tYmNocTIyTzVIRGdhWklHT1RmVzJqZ21pK1UvZXRh?=
 =?utf-8?Q?RiBX8Ua1yOl9s2GzRbSEnB9s8lC0EiLEsm7J0rv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGIwQmk4bUVEb0RQVE5BQTJ3OXZlSXdUZTdCWDFYRkxoZlBxNGh1NzBKdUZZ?=
 =?utf-8?B?NHA1UFBRNmZ4b0xkVWptTUYxSGtMUjdjS3VybXAvdkFtdE9vRHJOTzNtNU5S?=
 =?utf-8?B?dHZzejhWaTNIeWZTTGcvYXUyOE8yV0pNWC80UU14RktXUzBmd2k5M2tDQnlI?=
 =?utf-8?B?RGZHKzhyTkpNeTIrYzRoZnRvaDA5Z3F4bXRvMFNLUHFDN3JlTDlndzJrbVRT?=
 =?utf-8?B?dHlHeHArRExFK1FsS25ESUsxd1MvZjB5bU5ydkNsY1ZzSUlYbXdiN1FrbnAv?=
 =?utf-8?B?Zk51bVhTMkkzWWVrR0QzRWRKRnoyeWN0M2JjOTdJWWFPeE5jeGZOeVhqcENj?=
 =?utf-8?B?YzhDcytnSG1zZCtUVjV5MXl0M0xDWk41QXVTeUVCT1MxQmFOOGZmdVkyYW1U?=
 =?utf-8?B?ZlJWc2VhMVFEQ29aSzlPMHBZaVRXdlNENFdldUY2a2hiVnZPMytpd2dwUGRt?=
 =?utf-8?B?NGFIQjh3MEhHNWgvL2RXMTZqME9iaklzdWNtbVZYWDdDMGp4bmtLb3ZLZnNR?=
 =?utf-8?B?R1p4MVdiMzluUUZBL2V0MlE4MlZQaHV5Zngxd3ZQdlNYaEVVRjNQQ25DazUz?=
 =?utf-8?B?bzRBUFdibzRLZGwzeDZrUWIxd1pVMHlySWJLdGFMK1liTjI2YW1xZmhsekxH?=
 =?utf-8?B?NWZwSW1LYncxaU1pbWNUNXZNVEQxN2xwNHd5Q2p6aG9FRUt2NXZuVHNFZW1m?=
 =?utf-8?B?ZzRxbG0yenBJQ2VCSkhFOTZDNnhQZld1ZWdyT2phbmh5NGxCdXJsN0E3UU5w?=
 =?utf-8?B?WUJXSHdhQXkwcDR5S3RuSzdtWTB5am5LNFVOSnF0UTR4TlBoREQyZTltQlIr?=
 =?utf-8?B?UkZSOTJiRDhGK0p1cFdZa2UxTEVUZU1rdUxOdkJYK2xxdTQwR2dUODExM2xw?=
 =?utf-8?B?dzRwamxzNnhJbW9BNXhsQzRLUTB2OUVqblRWSHU0UGRTTTVMVWsvWDYrbXlN?=
 =?utf-8?B?TVYrMUJSSmljeXFOUEdlQjQ5TWJPcXd3V2xGRE9FdXF3MDRVTzk1M09LUmRn?=
 =?utf-8?B?em9EbURpWnBqKy9JaHRZUUpoUmJrcElQMTBiMXlKVnQ3REhoOUYwclIrOHcz?=
 =?utf-8?B?ZzNnV3ZJUG4xSTQ2U3d3QjN0MFQ2SWhzY0h5cmZ5R1RNcGdha0lFN0VjL1dG?=
 =?utf-8?B?NmQxM3I4Nzh4WnordnVpcHB3WlVxajQraDlnNzJxSmNCRDNYUjh4VmdoaU1J?=
 =?utf-8?B?bkxmQ2M1YnlUQXZjTlRiZ0MralJLVzhWSTlMemNOMTJ3RkhtRkY5eTFRQWFa?=
 =?utf-8?B?WllhRG1XSmFBZmlUV3RjdC9nS1U5Zml4dGVjYlZUZ1p2SVJ1MENxNFlOSWlw?=
 =?utf-8?B?ZDdhckp4NlprNzdlQWZaYW03VWN0c2dnWVFhTHR5aFZYU0hOcWltUm0yNHBW?=
 =?utf-8?B?NFdON3ZjNitKK3lHMXVHT3hzVVNJY3U4NWdFSENzR1BEYkU2TktBTTBJSDZR?=
 =?utf-8?B?TENKWnU0SVVyR1JJcGxSMkJ6YU1SV05ncEVDZ1BJSTNFVERvTnAreDFzbmw5?=
 =?utf-8?B?M28yc25rOE1xSmtzZ0JwTnRpOFdBcW1ldTZUanFQZHI0VTBYV2lNWkpKUHhv?=
 =?utf-8?B?YnZBYUVSdk5zSHdrSlFsOVYxRy8xaXBBVFZUREFHeGEvdlZZRFhzd0ZPNWxl?=
 =?utf-8?B?TjhSY1owOURncUN0Qnd6NndBTHJ1T0pBYnBiZ1BQcHhEWHpNS05XQVQzNUlt?=
 =?utf-8?B?dnhVendlNy9DalR3Nm0vTlhjMVBkUVV6bjVsTDhwNDZNVFJTZ3ZDSU5TTiti?=
 =?utf-8?B?d3Bwa24yeGV2d2pXL1RnWHk3UU9OK202YlRKQ0Q4Q1NFS1dkbml1Ry9WbDVK?=
 =?utf-8?B?MzBCcGFGbmxyUzN3Z1VkRDdEbys5Q0lWa3d3YXNSd0FVKzNqMmxXVmVheGN6?=
 =?utf-8?B?a0NpZFI1c3hZd2dYaVZ1VHVhM0liZFpBMjlqclcyMnBuQ1lhYVNzcUtSQXRr?=
 =?utf-8?B?WmFISklSOFFRUiswa2VXSWdVMEFtVEc5cUFNRTRvcUdFd3U3UnR6Rk43YTVT?=
 =?utf-8?B?L0hnQmllQ1dRSU9LclhvUm5qNUlNV2lTenQ0bVFXdUlMcHp5SERPWTg0SE5S?=
 =?utf-8?B?dUVwUzlrUU9GS0lESDFQejRiNjlUZTdiVTZjaVJYRCsvV3lTaTU3T3hveXI2?=
 =?utf-8?Q?0GYRuX5z9IFv31xw+Wn8HcZ7B?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d35e502d-de16-429b-2b6b-08dcef423b64
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 06:58:12.5393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W1PTj4Gv/EnnbPfwE57Z5Bmfg/88yZ0DHTimVGGfgcHuJoOxbzzXyuJ/upkzTrAuQcQVk780uWaNGj5duzz2fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
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


On 10/9/2024 13:30, Marcin Bernatowicz wrote:
> Introduce a skeleton with basic structures for subchecks execution and
> a `verify_flr` template method to orchestrate the verification of
> Functional Level Reset (FLR) across multiple Virtual Functions (VFs).
>
> The goal is to reduce runtime by limiting the total number of FLRs. Instead
> of repeating the FLR process for each subcheck (clear-lmem, clear-ggtt,
> clear-scratch-regs, clear-media-scratch-regs), a single FLR is issued.
> Afterward, all subchecks verify if any failures occurred and report the
> results accordingly. The proposed skeleton ensures that while one subcheck
> may stop due to failure or a skip condition, other subchecks can continue
> execution.
>
> Concrete subcheck implementations (clear-lmem, clear-ggtt,
> clear-scratch-regs, clear-media-scratch-regs) will be introduced
> in subsequent patches.
>
> Proposed IGT tests (will report each subcheck's status):
>
> flr-vf1-clear
>      Verifies that LMEM, GGTT, and SCRATCH_REGS are properly cleared on VF1
>      (with only VF1 enabled) following a Function Level Reset (FLR). This
>      test can be included in the BAT (Basic Acceptance Test) suite.
>
> flr-each-isolation
>      Sequentially performs FLR on each VF to verify isolation and
>      clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
>      This test is better suited for FULL runs.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: C V Narasimha <narasimha.c.v@intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: K V P Satyanarayana <satyanarayana.k.v.p@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 290 +++++++++++++++++++++++++++++++++++++
>   tests/meson.build          |   1 +
>   2 files changed, 291 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_flr.c
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> new file mode 100644
> index 000000000..26b59101f
> --- /dev/null
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -0,0 +1,290 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright(c) 2024 Intel Corporation. All rights reserved.
> + */
> +
> +#include "drmtest.h"
> +#include "igt_core.h"
> +#include "igt_sriov_device.h"
> +
> +/**
> + * TEST: xe_sriov_flr
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: Reset tests
> + * Functionality: FLR
> + * Run type: FULL

Shouldn't we define run type for subtests instead? In commit description 
you mentioned that flr-vf1-clear is suitable for BAT.

> + * Description: Examine behavior of SR-IOV VF FLR
> + *
> + * SUBTEST: flr-vf1-clear
> + * Description:
> + *   Verifies that LMEM, GGTT, and SCRATCH_REGS are properly cleared
> + *   on VF1 following a Function Level Reset (FLR).
> + *
> + * SUBTEST: flr-each-isolation
> + * Description:
> + *   Sequentially performs FLR on each VF to verify isolation and
> + *   clearing of LMEM, GGTT, and SCRATCH_REGS on the reset VF only.
> + */
> +
> +IGT_TEST_DESCRIPTION("Xe tests for SR-IOV VF FLR (Functional Level Reset)");
> +
> +const char *SKIP_REASON = "SKIP";
> +
> +/**
> + * struct subcheck_data - Base structure for subcheck data.
> + *
> + * This structure serves as a foundational data model for various subchecks. It is designed
> + * to be extended by more specific subcheck structures as needed. The structure includes
> + * essential information about the subcheck environment and conditions, which are used
> + * across different testing operations.
> + *
> + * @pf_fd: File descriptor for the Physical Function.
> + * @num_vfs: Number of Virtual Functions (VFs) enabled and under test. This count is
> + *           used to iterate over and manage the VFs during the testing process.
> + * @gt: Gt under test. This identifier is used to specify a particular gt
> + *      for operations when gt-specific testing is required.

Please use GT, instead of Gt, gt.

> + * @stop_reason: Pointer to a string that indicates why a subcheck should skip or fail.
> + *               This field is crucial for controlling the flow of subcheck execution.
> + *               If set, it should prevent further execution of the current subcheck,
> + *               allowing subcheck operations to check this field and return early if
> + *               a skip or failure condition is indicated. This mechanism ensures
> + *               that while one subcheck may stop due to a failure or a skip condition,
> + *               other subchecks can continue execution.
> + *
> + * Example usage:
> + * A typical use of this structure involves initializing it with the necessary test setup
> + * parameters, checking the `stop_reason` field before proceeding with each subcheck operation,
> + * and using `pf_fd`, `num_vfs`, and `gt` as needed based on the specific subcheck requirements.
> + */
> +struct subcheck_data {
> +	int pf_fd;
> +	int num_vfs;
> +	int gt;
> +	char *stop_reason;
> +};
> +
> +/**
> + * struct subcheck - Defines operations for managing a subcheck scenario.
> + *
> + * This structure holds function pointers for the key operations required
> + * to manage the lifecycle of a subcheck scenario. It is used by the `verify_flr`
> + * function, which acts as a template method, to call these operations in a
> + * specific sequence.
> + *
> + * @data: Shared data necessary for all operations in the subcheck.
> + *
> + * @name: Name of the subcheck operation, used for identification and reporting.
> + *
> + * @init: Initialize the subcheck environment.
> + *   Sets up the initial state required for the subcheck, including preparing
> + *   resources and ensuring the system is ready for testing.
> + *   @param data: Shared data needed for initialization.
> + *
> + * @prepare_vf: Prepare subcheck data for a specific VF.
> + *   Called for each VF before FLR is performed. It might involve marking
> + *   specific memory regions or setting up PTE addresses.
> + *   @param vf_id: Identifier of the VF being prepared.
> + *   @param data: Shared common data.
> + *
> + * @verify_vf: Verify the state of a VF after FLR.
> + *   Checks the VF's state post FLR to ensure the expected results,
> + *   such as verifying that only the FLRed VF has its state reset.
> + *   @param vf_id: Identifier of the VF to verify.
> + *   @param flr_vf_id: Identifier of the VF that underwent FLR.
> + *   @param data: Shared common data.
> + *
> + * @cleanup: Clean up the subcheck environment.
> + *   Releases resources and restores the system to its original state
> + *   after the subchecks, ensuring no resource leaks and preparing the system
> + *   for subsequent tests.
> + *   @param data: Shared common data.
> + */
> +struct subcheck {
> +	struct subcheck_data *data;
> +	const char *name;
> +	void (*init)(struct subcheck_data *data);
> +	void (*prepare_vf)(int vf_id, struct subcheck_data *data);
> +	void (*verify_vf)(int vf_id, int flr_vf_id, struct subcheck_data *data);
> +	void (*cleanup)(struct subcheck_data *data);
> +};
> +
> +static bool subcheck_can_proceed(const struct subcheck *check)
> +{
> +	return !check->data->stop_reason;
> +}
> +
> +static int count_subchecks_with_stop_reason(struct subcheck *checks, int num_checks)
> +{
> +	int subchecks_with_stop_reason = 0;
> +
> +	for (int i = 0; i < num_checks; ++i)
> +		if (!subcheck_can_proceed(&checks[i]))
> +			subchecks_with_stop_reason++;
> +
> +	return subchecks_with_stop_reason;
> +}
> +
> +static bool no_subchecks_can_proceed(struct subcheck *checks, int num_checks)
> +{
> +	return count_subchecks_with_stop_reason(checks, num_checks) == num_checks;
> +}
> +
> +static bool is_subcheck_skipped(struct subcheck *subcheck)
> +{
> +	return subcheck->data && subcheck->data->stop_reason &&
> +	       !strncmp(SKIP_REASON, subcheck->data->stop_reason, strlen(SKIP_REASON));
> +}
> +
> +static void subchecks_report_results(struct subcheck *checks, int num_checks)
> +{
> +	int fails = 0, skips = 0;
> +
> +	for (int i = 0; i < num_checks; ++i) {
> +		if (checks[i].data->stop_reason) {
> +			if (is_subcheck_skipped(&checks[i])) {
> +				igt_info("%s: %s\n", checks[i].name,
> +					 checks[i].data->stop_reason);
> +				skips++;
> +			} else {
> +				igt_critical("%s: FAIL : %s\n", checks[i].name,
> +					     checks[i].data->stop_reason);
> +				fails++;
> +			}
> +		} else {
> +			igt_info("%s: SUCCESS\n", checks[i].name);
> +		}
> +	}
> +
> +	igt_fail_on_f(fails, "%d out of %d checks failed\n", fails, num_checks);
> +	igt_skip_on(skips == num_checks);
> +}
> +
> +/**
> + * verify_flr - Orchestrates the verification of Function Level Reset (FLR)
> + *              across multiple Virtual Functions (VFs).
> + *
> + * This function performs FLR on each VF to ensure that only the reset VF has
> + * its state cleared, while other VFs remain unaffected. It handles initialization,
> + * preparation, verification, and cleanup for each test operation defined in `checks`.
> + *
> + * @pf_fd: File descriptor for the Physical Function (PF).
> + * @num_vfs: Total number of Virtual Functions (VFs) to test.
> + * @checks: Array of subchecks.
> + * @num_checks: Number of subchecks.
> + *
> + * Detailed Workflow:
> + * - Initializes and prepares VFs for testing.
> + * - Iterates through each VF, performing FLR, and verifies that only
> + *   the reset VF is affected while others remain unchanged.
> + * - Reinitializes test data for the FLRed VF if there are more VFs to test.
> + * - Continues the process until all VFs are tested.
> + * - Handles any test failures or early exits, cleans up, and reports results.
> + *
> + * A timeout is used to wait for FLR operations to complete.
> + */
> +static void verify_flr(int pf_fd, int num_vfs, struct subcheck *checks, int num_checks)
> +{
> +	const int wait_flr_ms = 200;
> +	int i, vf_id, flr_vf_id = -1;
> +
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	if (igt_warn_on(!igt_sriov_device_reset_exists(pf_fd, 1)))
> +		goto disable_vfs;
> +	/* Refresh PCI state */
> +	if (igt_warn_on(igt_pci_system_reinit()))
> +		goto disable_vfs;
> +
> +	for (i = 0; i < num_checks; ++i)
> +		checks[i].init(checks[i].data);
> +
> +	for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +		for (i = 0; i < num_checks; ++i)
> +			if (subcheck_can_proceed(&checks[i]))
> +				checks[i].prepare_vf(vf_id, checks[i].data);
> +
> +	if (no_subchecks_can_proceed(checks, num_checks))
> +		goto cleanup;
> +
> +	flr_vf_id = 1;
> +
> +	do {
> +		if (igt_warn_on_f(!igt_sriov_device_reset(pf_fd, flr_vf_id),
> +				  "Initiating VF%u FLR failed\n", flr_vf_id))
> +			goto cleanup;
> +
> +		/* assume FLR is finished after wait_flr_ms */
> +		usleep(wait_flr_ms * 1000);
> +
> +		for (vf_id = 1; vf_id <= num_vfs; ++vf_id)
> +			for (i = 0; i < num_checks; ++i)
> +				if (subcheck_can_proceed(&checks[i]))
> +					checks[i].verify_vf(vf_id, flr_vf_id, checks[i].data);
> +
> +		/* reinitialize test data for FLRed VF */
> +		if (flr_vf_id < num_vfs)
> +			for (i = 0; i < num_checks; ++i)
> +				if (subcheck_can_proceed(&checks[i]))
> +					checks[i].prepare_vf(flr_vf_id, checks[i].data);
> +
> +		if (no_subchecks_can_proceed(checks, num_checks))
> +			goto cleanup;
> +
> +	} while (++flr_vf_id <= num_vfs);
> +
> +cleanup:
> +	for (i = 0; i < num_checks; ++i)
> +		checks[i].cleanup(checks[i].data);
> +
> +disable_vfs:
> +	igt_sriov_disable_vfs(pf_fd);
> +
> +	if (flr_vf_id > 1 || no_subchecks_can_proceed(checks, num_checks))
> +		subchecks_report_results(checks, num_checks);
> +	else
> +		igt_skip("No checks executed\n");
> +}
> +
> +static void clear_tests(int pf_fd, int num_vfs)
> +{
> +	verify_flr(pf_fd, num_vfs, NULL, 0);
> +}
> +
> +igt_main
> +{
> +	int pf_fd;
> +	bool autoprobe;
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +	}
> +
> +	igt_describe("Verify LMEM, GGTT, and SCRATCH_REGS are properly cleared after VF1 FLR");
> +	igt_subtest("flr-vf1-clear") {
> +		clear_tests(pf_fd, 1);
> +	}
> +
> +	igt_describe("Perform sequential FLR on each VF, verifying that LMEM, GGTT, and SCRATCH_REGS are cleared only on the reset VF.");
> +	igt_subtest("flr-each-isolation") {
> +		unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
> +
> +		igt_require(total_vfs > 1);
> +
> +		clear_tests(pf_fd, total_vfs > 3 ? 3 : total_vfs);
> +	}
> +
> +	igt_fixture {
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		close(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 2d8cb87d5..49740d11d 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -314,6 +314,7 @@ intel_xe_progs = [
>   	'xe_vm',
>   	'xe_waitfence',
>   	'xe_spin_batch',
> +	'xe_sriov_flr',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',
