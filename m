Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB76D3C526
	for <igt-dev@archiver.kernel.org>; Thu, 17 Oct 2024 17:13:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9B010E891;
	Thu, 17 Oct 2024 17:13:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IgAHPZK+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E735010E893
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Oct 2024 17:13:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729185205; x=1760721205;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9zrS+qZUGUBCcPL4ZQY9y9l2SqUuCAQ8/hRaXZg8gu8=;
 b=IgAHPZK+wCGSTNHdUjaNdcP7zkG9kaGOqD0MusKtjTT2nr4UYfAt7lGt
 R+eqh4cjjbezsR7gLGqN5u4fuGfnZpfo6qlyoFSrFTVxC575mIff9LdPy
 dtO+QmFi1TM+JxTBkUwu/5vH6J6SDFQrtOZ7UmtgQ3YAwOHskgnii36g9
 Py33V9wdy/Jndmble1982abetpbPE7r2d9ojslcQulBQWoVkGBQv3kQf5
 9e2BfzxnxMKE557mtrEkAXjs+d3P2Z2r+yWLbhSyHWRqH/LPAebCYiE+8
 cW3XOzzwrDwBfV7cWYCvoYvPUSBSLQyaV1vP2XrZocp5WJHzRxfjx0hep g==;
X-CSE-ConnectionGUID: 68xiD//3SJS63cNX1M+FUA==
X-CSE-MsgGUID: /vXwPrbgSvSkbIQKM7YUQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11228"; a="28897596"
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="28897596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2024 10:13:22 -0700
X-CSE-ConnectionGUID: PVbAVi0fTii3DMyQdCid+g==
X-CSE-MsgGUID: lmVi/7jDR8Kv3dmoOtKAKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,211,1725346800"; d="scan'208";a="83163031"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2024 10:13:22 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 10:13:21 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 10:13:21 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 10:13:21 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 10:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJHemkUXn0sK8AqQeqONcKgXtPHFd3xLwxWSzp5qT+wqFCkXWTW6cIWjbqt5WyvVDN22f4c7RK4C6fsgplP3lZ4PpJjlCWavyJ1adD/2bT5ac8JpUpx1YhrPA7W619RKz4915qBS40vZ0/gLilhDaD7Klr9EOiQs3qnma9QdPsCd/MJs/EGL9vmxrf5yR9F0T5kkwmsdmxVxHbPM67mR1hMWtFzZWYXBNXQ8zQEQhdPSrMf/0PbM6x25nqoxrx8TN6eLtYxy9Nm8S+LrswCcHICR8Mg8/e5nQBO/H6nTLTTXvs5bIwZJvyoBR2hcIsWAVbfucABZkvSWEkGrV2yAVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vxtfiza5YpYWffcb3qVPTxR+4yqRTvwTJiF15zBMCHk=;
 b=aMYLjhh3T6O1GUdZslVYmjGTXk/b6cjYigyjs/w8fFjriVj5TUnzc/YuX6vSJ9Sugj5fgUYOmtQwwRUtfDIc2o2kjE2plhsBWmX+5XFo6TtJf4ZxHqhcL9cHeMHfACGJP6VueWV8oK7FmUSCKAWKveYgUb+Fz54PchvSkryWDOW6FrB6YmaYgfOSAZtKDyTwLAt97bf5tYzZSjuNCly07HledezeOKPW8hnhgk/z0wpFtUbEWPW4/veDZ6p5C0KO1jSL+rF6fw8Fj1W3qM4dlsGz4yxZSFFO1VfeCDf/SwGgZoAAP7Jbj3QGGsa+wM/qyBYRvxfSLcst4AJUN728yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CYXPR11MB8754.namprd11.prod.outlook.com (2603:10b6:930:dc::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Thu, 17 Oct
 2024 17:13:18 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8048.020; Thu, 17 Oct 2024
 17:13:17 +0000
Message-ID: <422b6b14-0fa2-46ca-a2a2-3249390d8174@intel.com>
Date: Thu, 17 Oct 2024 22:43:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to
 lib
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>
References: <20241015162336.304730-1-santhosh.reddy.guddati@intel.com>
 <20241015162336.304730-2-santhosh.reddy.guddati@intel.com>
 <SN7PR11MB675010485E8335B4A2091401E3462@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <SN7PR11MB675010485E8335B4A2091401E3462@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::17) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|CYXPR11MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: fc6be978-8091-4497-179c-08dceecefe2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UVk1dHZRQ3RoNzhmNFg2eXFzcDZYZVFkWTRwaE1FNDhBbjdBbjN2MWNZeUxI?=
 =?utf-8?B?dFE5NmM2eGtMZDRRQ09WTTU3cDA3Q3ZCWTdRRk91TWhZQTNpYzBjblJDOWdR?=
 =?utf-8?B?cGQrck1qZHRyTmFhVG10R2Nrb01XY1B4bCtOLzRKVnpBV3BpNVR6ZDV3MWxp?=
 =?utf-8?B?QVlvMXFHOVorVzc4R01ydnI5dmhnMmRmOEtSOERTeGsvajdwbmgxWUh0aFlV?=
 =?utf-8?B?azJUYlZNNlU0bGlnWW0rdTZHSmlFdFp0c2JKcHJqdE9EZVNkeENGTnVvUE9G?=
 =?utf-8?B?cWQrZ2xWQU5SSmhDVkZCRys1eDZjNVhEOE1HdnZTSzMzUGVkWG1qYm1sY1BP?=
 =?utf-8?B?am5KQ1dqcmIyTEVMSTB6YmpaYlVRSVVMWUZaSGNZd0lYcFZIYTVKczJNcy8r?=
 =?utf-8?B?TE0wZmJhYTlZL3ExazQ5dU1DQ3RMN0dZYVhScEdBNEQxWDRJUDZFMVkrWW1R?=
 =?utf-8?B?QmZuWkZxV0FIemVmeDM4Q1VGdkZia2ZyWGFsMWdXS3JCT0RCOFRJcC9MaS9L?=
 =?utf-8?B?ZU5sNDBVQjV3dHhtYlhGMkltUjhlSk55QzBJV1E3WjJVelgwbnV3K2ZvcDlq?=
 =?utf-8?B?cHJiWUh1dnBQQlJzV1FTSjZySHlWdFkvUWh5MlNXTjlRY2ZVdEFpV29ocE9q?=
 =?utf-8?B?M1JDTFc2TGpUY0VaOTVlK3dTM1U5T3o0TmFNc1FSZm5WQnh2WEp2Z2FPMm1J?=
 =?utf-8?B?SndUTEs5bW1aQTc3ejFHbS9YNW5TYkhqYXlQbjRaMlRwcDFYdmVodWF6OW5z?=
 =?utf-8?B?Qk1CUFRQcU1kYkFEdzZKeXFBMTJKb250NUpoQTdMWW8yZkVLc0Zpcmg4QTBu?=
 =?utf-8?B?ZVdaQjJrYy9FQmxnSDhpTGZXZjB2TlpwYXFYVnBrZ3drSVJzTEJDZ2R5bVlS?=
 =?utf-8?B?NzRWLzB2R0M0VWt3NnFhWFUvNUNFeEpwK3B0TGlyNUhyT0owUUNSM01WK20w?=
 =?utf-8?B?d04rNWlFQlBhRWZhTnY4b2FzVUNoamVVSUZMWEh2L2ZvSXpWYWtaNlVuMktG?=
 =?utf-8?B?UzR0eXdGcy9XcFpEOTB3TGtaaHhZMzhXSnFWa3YyeC9RelExS2VObFpWcDl4?=
 =?utf-8?B?NFNWVmx0eFJ1WVVNMzVSUU0xdEJDT0N3ZTcwQmJ5bzBsTG1xNXA2Q3FWWGcy?=
 =?utf-8?B?R09qWFlpaWZlVGJpMUsvaFhqY2VOaFhYcUx6YTdUTFNxOGY0UzFadXdTWmlL?=
 =?utf-8?B?eWFiOEVPbU9QMy9tYnVrazlxVG5vUFlvZW9hem9nUnRPeVdnYU1Rd2JSemZx?=
 =?utf-8?B?d0dRNERIeVNnUGdPRndpc1Z3VWd6OG4rL09JRkdZckVUeEgvVU8wODlEbER0?=
 =?utf-8?B?MWZwa0U5Q0d3eTQ2MG1ILzExa0RGbUxZdW1FZGNQeHArenZxS2Mvb09rNE5Z?=
 =?utf-8?B?ZXRUWjl1M1MzeU9SRTBMT3hpMVBVMEtNMUFCTnN6M1ZHdDZYOFNCUFZLR0ZS?=
 =?utf-8?B?UjVHL1pyN0xwOUNLOFR3Sk5seUtHeXhGWU03WHlnNDBMeWt3V1FxUjNsR1Rq?=
 =?utf-8?B?OFVwVzNTQlE5NU03Qno1T0YxdEVPb3N3dU8wYi9ra3RYVWhMbTV4bnNVSk9D?=
 =?utf-8?B?VHdJMlQ5c0FDSU9BcDZCMGF1T0E5K0liTnZWSlJEb0pCa3ZMeG9zZGRVN2Mx?=
 =?utf-8?B?MThCL1NvbnY4eW9zZkVzNXcwN1l5bzQzbjlIRjNFT29NcGlTbmZIM2twaE5o?=
 =?utf-8?B?d09PVTdza3Q5ZEc1SU9GMGNjbVk1ZW54cmgrUTdaV3lmLzBZVWFYMDU3aFRT?=
 =?utf-8?Q?e2328zUl4+i40QOjwvozdyT8e/vzMcyzAts+kj9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjhRQkpuWGFyN0hqSmNBSUk3WHJkRi83Rlh6VTE3Y2drRkFrZVhFVk1LSk1m?=
 =?utf-8?B?U2ZiL2svYWxNVTNXN01aTHROeS8vc1BVRnVLTGREaHpzZGFLZnpraUVFOVFB?=
 =?utf-8?B?WlVTOEhOQ2k2RjhVRUUwbEVpNDI5ZjBvUHljWmNFMDN4THFXZ0VKNWk4VUtv?=
 =?utf-8?B?NWJ4WXhLNmdwbkxJNkI5SVVITDMySWpIelZnSVkrL2FMYVJzSWVsSXpkRXJN?=
 =?utf-8?B?SmNmcDJFRU5VWHNQdG1ZMUxoeEh4ZDZPeGRrZ2RkN2xNSWJNVDZ4TE1yNVoz?=
 =?utf-8?B?SFkyMno4bkx1R2tmVTlOLzRCUzNJWnRwMERZeGtkVTJ5Q29FMDdxZnpDMXZl?=
 =?utf-8?B?bEQxYVlna1FRcW00YlNmQzJLajVDeUNjK01meUdBNGNranpKVThxL2JaamU2?=
 =?utf-8?B?eGx6b2hDR0hGMTJGK0tlRk5RSmRFUFRzcFRRSDRoa1BTdUhOaHA4dHBBUXdu?=
 =?utf-8?B?b2dHWGx5eDBJanNWNGFPWGJ1YUZONVZoTWVLME5IZEl1cXZSN1FTRXkwQ3dU?=
 =?utf-8?B?eFY2WWtqT2Rhc2N3OHByTWJ5MjM3aUx3NkdDa2Qrend1cy96QVJsVUlZUGw4?=
 =?utf-8?B?MzVVbEFlWmU5Z1liR2ZXRk8wYTRNVGdOT3ZCaEZPcWdlS2pnWHpybFd1QU9j?=
 =?utf-8?B?MlArUU5ZblQ2SWFzazFLNXJNSGp6amFZeGNZWFQyTWxvZmhxVFFkSWYvblBt?=
 =?utf-8?B?QU4xUnNOVlB5K2dXZGZFejVJSDEwVlFCRHVPNDE2ZUFLZ0hHUlB3U2ZhU2Zy?=
 =?utf-8?B?U3pBK1hmWGJpUEJDQTkzZ1EramlPUnl5UVdpQTJBZUg2QUhZWG0wYWMvckR2?=
 =?utf-8?B?Z1BWKys0ZFlycW9QZS9MM0o1dFZkR0p1MFRUaW5YekFaS2pyWXJpNmZaZCtw?=
 =?utf-8?B?Q0JVekVEdkQyOGwxVmxqTFhkV3JtazA3Qy9LZ2hSdWduY1ZCeXQvdXVDeGlB?=
 =?utf-8?B?Y0w0aFd5OGRXTUx1VGRxN3IzdGptZHA4WjFWWWxDWm0xb2VxUnJRb0xnR2dZ?=
 =?utf-8?B?Qis2RGF0YVg5Sm5DRERMekY4cDRjUVd1bkRSZzVFTDBObENEZUc5UUZVRENh?=
 =?utf-8?B?U2Zqclhra1lQVUpGMmVYUjVWN1FQSysyWUJsVnR2aHY4Ly9BUFllSmpEbDNR?=
 =?utf-8?B?T3BEdTVZQVVHNWN1YkViZ3JGcEVYdkxSOUVHZjQzOVRSWjltRVR6WDYvVzk1?=
 =?utf-8?B?cjFEZFZWYThCa3lqTDRDZ29JeGlyWDRCRnlPaEdXUGxkY3J1KzVsa3lTQlFP?=
 =?utf-8?B?dnZ5WDJmSENGWjEvLyt1a1djSlQ2UjQzS1MxNGprUWhWVDJBRVkzMnBHRU5D?=
 =?utf-8?B?Y3VvS3o5Yi9jZ1d0WVY1b21aUGlnOGt0UXdRKzhYVzBMYWZaWDd1b0FSSG5j?=
 =?utf-8?B?QmFGYmtVYjc4cStBMG5MTGpsdGd6N1hzMFl0WnNZSFBMa25GMnU5ejVYYVRY?=
 =?utf-8?B?TjBUa0NucE1aZ09oUXc2TTFvSVB1TGdsWXNjc2NTVHFpTDZJS0h6ZTNueUdr?=
 =?utf-8?B?elBqODhZaXJ6NjVSaEVIZXJWYSt2bHpseWxkb2dXM3RoaE1mSzdpdmVQV04y?=
 =?utf-8?B?V3hhWGkxbUJIY3I0VUdXQkpUOWNCbmw4WGwwZjIxU2VmZGQ5dFM4amIzajVh?=
 =?utf-8?B?aVZXUU1UcEpQeEZBZUhjUElTSGNNblJObXdlcHJUSys3bC9mN1kzSmtzWDJW?=
 =?utf-8?B?Vjh0M3Y1cStwTmJUNDBSbXZ3TytOdm82ZHVQSVBGYVJJWC9SUWQwSHovOW4y?=
 =?utf-8?B?ZHJNbFE3TDdMUjJTdVhPTk9LL1c4M2pKelM0MWtEb3VLUjlibWEzdGJLNFRw?=
 =?utf-8?B?Y1JmTG5JU2hTZjJEUnVod0EzeUo5ZGM2WEVIK3l4ZWRUSkx4NUl5d0F4ZUpJ?=
 =?utf-8?B?M0luS3dZNlkycGtSS3NHN0xZN0xTSWZBWlAvUFJhSUIxQms4ekZ3bE5tZUxP?=
 =?utf-8?B?a0doKzNQTlpJcTZOTS9lSy9XOFJqbmdCdFZyQm5CMU9FSXA0MU96aFY0OWx1?=
 =?utf-8?B?YVJKY1FwbE1vNXRBTVpwVGZMa0I4KzFDNDRZVnNKWGhtek5jaTZocXVIRXZE?=
 =?utf-8?B?TWtjeThLQlYvRFgycmxVVUt5QlQwVExRUlJYOU9TZ0ZvTmtXWGMrcS9hUzl1?=
 =?utf-8?B?MzVkSTduSHpzRDlzQW5rSzdCeEttWURmUytBZGZyM3dXUE1KMllCL2tUVHI1?=
 =?utf-8?Q?a5y4TBjvtiA6lsZyflHNFkQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc6be978-8091-4497-179c-08dceecefe2f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 17:13:17.9337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zaTn1YKkrUIJRDdvrOU1Zy+9rHAP7fcmXHWiaZJf6g3xRBdEot/2OfaQ5qPwuPctaed9CMk4W71FB3HWoKwad8E9THqNYOb0qE0p1hSdPPTCDROcno7stzHiaXBMC+ou
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8754
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



On 16-10-2024 09:59, Kandpal, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Reddy Guddati, Santhosh <santhosh.reddy.guddati@intel.com>
>> Sent: Tuesday, October 15, 2024 9:54 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Thasleem, Mohammed <mohammed.thasleem@intel.com>; Modem,
>> Bhanuprakash <bhanuprakash.modem@intel.com>; Kandpal, Suraj
>> <suraj.kandpal@intel.com>; Reddy Guddati, Santhosh
>> <santhosh.reddy.guddati@intel.com>
>> Subject: [PATCH i-g-t v1 1/2] lib/igt_kms: Move backlight read, write to lib
>>
>> move backlight_read and backlight_write functions from kms_pm_backlight
>> to library to re use in other tests.
>>
>> Signed-off-by: Santhosh Reddy Guddati
>> <santhosh.reddy.guddati@intel.com>
>> ---
>>   lib/igt_kms.c | 60
>> +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h | 13 +++++++++++
>>   2 files changed, 73 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index bb35d4b82..c9c0ca1d3 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7119,3 +7119,63 @@ void igt_reset_link_params(int drm_fd,
>> igt_output_t *output)
>>   	temp = drmModeGetConnector(drm_fd, output->config.connector-
>>> connector_id);
>>   	drmModeFreeConnector(temp);
>>   }
>> +
>> +/**
>> + * backlight_read:
>> + * @result:		Pointer to store the result
>> + * @fname:		Name of the file to read
>> + * @context:	Pointer to the context structure
>> + */
> 
> Now that this is a library function the naming should start with
> Igt_backlight_read same comment for the read.
> 
>> +int backlight_read(int *result, const char *fname,
>> +intel_backlight_context_t *context) {
>> +	int fd;
>> +	char full[PATH_MAX];
>> +	char dst[64];
>> +	int r, e;
>> +
>> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
>> INTEL_BACKLIGHT_PATH, context->path, fname)
>> +			    < PATH_MAX);
>> +	fd = open(full, O_RDONLY);
>> +	if (fd == -1)
>> +		return -errno;
>> +
>> +	r = read(fd, dst, sizeof(dst));
>> +	e = errno;
>> +	close(fd);
>> +
>> +	if (r < 0)
>> +		return -e;
>> +
>> +	errno = 0;
>> +	*result = strtol(dst, NULL, 10);
>> +	return errno;
>> +}
>> +
>> +/**
>> + * backlight_write:
>> + * @value:		Value to write
>> + * @fname:		Name of the file to write
>> + * @context:	Pointer to the context structure
>> + */
>> +int backlight_write(int value, const char *fname,
>> +intel_backlight_context_t *context) {
>> +	int fd;
>> +	char full[PATH_MAX];
>> +	char src[64];
>> +	int len;
>> +
>> +	igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
>> INTEL_BACKLIGHT_PATH, context->path, fname)
> 
> Maybe add the path as a variable so that other may later on use it to
> Read their own backlight path since this is not isolated just to intel_backlight
> Test
> 
> Regards,
> Suraj Kandpal

 >> Thanks Suraj, I will update to use a new member in the existing 
struct intel_backlight_context_t to cache the backlight path.

Thanks,
Santhosh
> 
>> +		   < PATH_MAX);
>> +	fd = open(full, O_WRONLY);
>> +	if (fd == -1)
>> +		return -errno;
>> +
>> +	len = snprintf(src, sizeof(src), "%i", value);
>> +	len = write(fd, src, len);
>> +	close(fd);
>> +
>> +	if (len < 0)
>> +		return len;
>> +
>> +	return 0;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h index 2b26d2bbf..90b911e4d
>> 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -33,6 +33,7 @@
>>   #include <stdint.h>
>>   #include <stddef.h>
>>   #include <assert.h>
>> +#include <limits.h>
>>
>>   #include <xf86drmMode.h>
>>
>> @@ -513,6 +514,16 @@ typedef struct {
>>   	uint16_t tile_h_size, tile_v_size;
>>   } igt_tile_info_t;
>>
>> +#define INTEL_BACKLIGHT_PATH "/sys/class/backlight"
>> +
>> +/* Backlight context*/
>> +typedef struct {
>> +	int max;
>> +	int old;
>> +	igt_output_t *output;
>> +	char path[PATH_MAX];
>> +} intel_backlight_context_t;
>> +
>>   void igt_display_reset_outputs(igt_display_t *display);  void
>> igt_display_require(igt_display_t *display, int drm_fd);  void
>> igt_display_fini(igt_display_t *display); @@ -1253,5 +1264,7 @@ bool
>> igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t
>> *output  int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t
>> *output);  int igt_get_dp_pending_retrain(int drm_fd, igt_output_t
>> *output);  void igt_reset_link_params(int drm_fd, igt_output_t *output);
>> +int backlight_read(int *result, const char *fname,
>> +intel_backlight_context_t *context); int backlight_write(int value,
>> +const char *fname, intel_backlight_context_t *context);
>>
>>   #endif /* __IGT_KMS_H__ */
>> --
>> 2.34.1
> 

