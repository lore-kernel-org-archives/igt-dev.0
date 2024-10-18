Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7283D3C551
	for <igt-dev@archiver.kernel.org>; Fri, 18 Oct 2024 07:06:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1F610E8A8;
	Fri, 18 Oct 2024 07:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Anag0D8i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A9810E8AF
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Oct 2024 07:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729235187; x=1760771187;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=z1bdWqCQdF51uOvffdrH00UrtOf01DHT+5A/Z+Wpr9g=;
 b=Anag0D8i2MHTZZC5z/bMBsrSElM3HcHGmGIMY1SbGK/uvu1hxNmfH28z
 IaZAMnur5Y2Yv3fiBJ63TFGbz/7i1K+Xpkt5wwCBTXfZy2ZzAFGqb1IvY
 wBjl5Gw6HKYtsM5u4MHpBhDbVi6SZEUS2dAMP/aPET4fBukCYx7POvKtY
 fSRgBNiM4lAkNW9OEQXfkZH1qko0uaCd7IZg7boJMYhA4jSZcmjsZ2WsA
 Cp9iKf632FpuOJs7jvHcwkOEXiysW+Wv0a2r5VH2z/X5Zgkkf+CFZO5Ud
 Ug1yT6YExEuT9/x1ZMkukvbJm5jrGRZrZdbDuk6Cc9xYMnn5JYThxGk2/ Q==;
X-CSE-ConnectionGUID: /punBJDvTYicwQ61Sqq7eA==
X-CSE-MsgGUID: jV0ihZaRRJuAdFWYRSi7mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28853987"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28853987"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 00:06:27 -0700
X-CSE-ConnectionGUID: ggC2mWXAQhyoYzUAwJxz8Q==
X-CSE-MsgGUID: Yy3OzI3nTB68n6P5Bq6D9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; d="scan'208";a="79129194"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 00:06:26 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:06:25 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 00:06:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 00:06:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 00:06:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycq6ajXdDuKBumqBf3ZlcE/M1fXCgiy65eE53VeOG6DV1xVWjAi5bALdSSozYgkIk9fM3ey4wYDFjh62nh4NNkM/f9askBjFfTRbAD7NuUXDSOReUs5YLMr1TTAsDQH53vFUE2aDFsuYhXoCUWdUvULqDQEvFSjj3N2/Zir4BJS8jDxhGz9JabDxQAEXY2bLylo8M/DIHawwRGGSIyPzysx6Uskz69mwWaHY6gPakCDE9GWG0iFonbLENvrGt3GI3LH43DbVTLLXeK76Onn6lhFmCuI+q79Nq1Zq1lWH4AbAsbPkIy44JaonXJON7sAVmSOkfAA8VaNIRM0ZZOYxJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lc4FxI/HuUN8AMzRYQD52JG6759PLD4nsD6ikFxFRbo=;
 b=mMphINkbrcM75U50Vvy2GeGhybYv6tTsF0RFL/qIa2bTRqkGHB3IOasycIzYR+Fek2M2vHPZpLGIqEGHX59TIHkYIgZh+Ht6JrjO0uwHgOIrmHI4tBuFzbkr95ddvhPBDYVnlFNMtlP//xdEdsEBnZmGEJd0/OCkUj8XSGPnlfkWs+mXci+g0pSbKmggSxREThPOKjoN618oPJc5wPFvqyJmRbL84E1ySkpF1UJGApeKx0lZjIY/r7X6ezuuCTVA3ug+jYwQV5wy7LYrqbrhT5AbgyIpuLdG3QOdR/xgKF1nH6Cjb1Pl+S25DiDLEk27tMVl/R/xXhB1HAtiiykX3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB6743.namprd11.prod.outlook.com (2603:10b6:a03:47c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 18 Oct
 2024 07:06:22 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 07:06:22 +0000
Message-ID: <7f1f4e17-b9dc-491c-a791-9c33c5b0b96b@intel.com>
Date: Fri, 18 Oct 2024 09:06:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/6] tests/intel/xe_sriov_flr: Implement clear-ggtt
 subcheck
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Satyanarayana
 K V P <satyanarayana.k.v.p@intel.com>, Tomasz Lis <tomasz.lis@intel.com>
References: <20241009113018.741371-1-marcin.bernatowicz@linux.intel.com>
 <20241009113018.741371-5-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241009113018.741371-5-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR0P278CA0206.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:6a::23) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: d65d3f0d-d7dc-42d5-8c88-08dcef435f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXFmY0h4WWZocUc2MlVqZDNBVVdDRThDMWtiM2tZaHdaR09Gc2pVUDRuMkU2?=
 =?utf-8?B?YW1uMmxnWWlnbWlGNExvYnJMRmFNNWtNTnVRWmhMeUt3WjlGaE9hRlVVRXB0?=
 =?utf-8?B?WVRZaldqRHFGb2Nzc0VqL0toQjRxanZYa1RDaDExbDhGTm1ZYmM4U2dJSFp1?=
 =?utf-8?B?VERNTXlGY0xHZlRvZ01UamQrYXJsOWxzem52djRLNEZNVzFINnNGVFc3bE41?=
 =?utf-8?B?ZDNGU2piUDJha1F6Y0FJcXRVYU9sT2Y5VFFzcWRqZnZTOXE1YTBMdnFnV09G?=
 =?utf-8?B?YW1uQlNsNndzUkJUUjR2cmYzRG9GbC9yVGFwTjVpNDlheVFFelp2MEYvQy9z?=
 =?utf-8?B?cVNlUE1WUWYra3I2c0NKcXo1NUwxTFRLa2F5QytmK0JydVpoOWsxVWpnWHFn?=
 =?utf-8?B?NCtnZGNGREZQaWRiTzJwVTdOUFgzeE9hTG9NL2JXUHhGYncxRjRHakR0RkVy?=
 =?utf-8?B?RHJFcWIwYTk3cGZGNllVOG5HOUVPZHJoSWFQb2pBdm9kZDVTN0diWGx6UzF3?=
 =?utf-8?B?eHRBaGsyMEk1TGJpVG0vZ0pjbFRjTW5VeWlXdW8yRzk2S09SZm1wdUFhS2Yy?=
 =?utf-8?B?eWZUWHZqSnZTRlJGaGVsZm5hVmxxWGJBUmx6M0x2aUl3MUR1NWE5R1c0TXBs?=
 =?utf-8?B?dDR1R2lOaVo1NEpDSFlpcmlESWQ3c0pJclpxaWRaU1BiU3ZwV3kzVU9uRy9t?=
 =?utf-8?B?bEw2ckR3Qm1vbFVFWXpjbkVDMEpuejd6cnBLQ3BJYmQrWmNkV1RUZ2o4Tlhh?=
 =?utf-8?B?c3NKRm0rRkl6RHdpam85dmtncjg3MFdIMko0Wko0NUdleUo2QVlRNmp5Y3Ji?=
 =?utf-8?B?L04zT3A0Yit0cGtUMGZXdXJDc3VFQU50aXY4R0Frby9acDBxd0NKeFo5UzAr?=
 =?utf-8?B?a0FEeTRoem00aWl0REQ5TWM5SmZESUtnME5xUHIxZTIvb0hiZnBSWllHbThk?=
 =?utf-8?B?ZzUxRkFEZ3B2cGtjeXU3TW91R2FlSURnYUdxV1M3K3V5VXlXa0oxelFSb3hw?=
 =?utf-8?B?aU9wYWhmYWhxY3dVY0ttYksxMkczVTZNSjROaUgxUDdSTnFKSnlzZEd3REtl?=
 =?utf-8?B?TjVlaEtWeEpBVnpnZjlzUEFSVVVaNnRwbElVZk5kbnYybnF1SFU1dTJYNzVK?=
 =?utf-8?B?WHhZeGJabUVheEllYkJqOGdZR1d6Ry9mVDBzbCthS1FtR0Q2RitPYzhwRzM2?=
 =?utf-8?B?YzRyMEhCNW5kYXY5QkRSenc0QVV5R1N5cG9QaHl5ZmM5NTlNWHVEb1lDM0gv?=
 =?utf-8?B?akd4T1hnOGJHa3VPR1B6L2J6bFRLWWFCRDlMejhjTTVLS3pYMTdTOWpPb2tC?=
 =?utf-8?B?dzRQM01NOWltY1ZRcUEzalhwNG9xbHlrclZqY2F5YjM4bk5GWFJRa1prWFJv?=
 =?utf-8?B?Y0NkV2M0M1dOMC8wMDg2NTNwWURrN2FYa1g2L04zQ0s5UlUrMGZTWWlhWW1w?=
 =?utf-8?B?YjNVUk9yYlVacUhHZFdlbDNKbTArMnJCMW5YOEtWNzBicGJOSEtTUmZ0TlNH?=
 =?utf-8?B?OHRZeW1BakwwZW1qa1BNYjhNMjNQWVVCWUFRQUZ3cTlCckNrME80cUs3c1pB?=
 =?utf-8?B?dDk3WXVUb2hmZXdyTEpxTDczRFh0VGFTUTA1bkFRR3lKRXNTdVNnRFpMYTBT?=
 =?utf-8?B?RnZEc1lvV3Z0U3MwOFFrTTZQcVZlVUkxQ1ZHLytYbFVWNUtTc0lTL25WWElH?=
 =?utf-8?B?QWhCZEFhMThLVUtPY3UzbEY4YnBoc1FtNzF2Mk5sZXNmd3pJeXJqTWNZS3Vn?=
 =?utf-8?Q?6tYyspR74Eql2ob5BM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlMUHJ2UFlIcHlCcXJtRkxwekh1M2lRWWlsTExrOWJKejRHNkNzTVZmRCtt?=
 =?utf-8?B?YTRReGhwbGhoYTFMbkZRMm1SL0dCaHFZZUdDb1VVaUsvdjR1QWtWNjJSRWxC?=
 =?utf-8?B?OW1TSW9oTVNPcnE4WkNUS24rYTJsdkM5Qlpqcjh0b2VoZDl1Ykd5WmlORzRn?=
 =?utf-8?B?UGZUZnlJT3NCVG1teE1aNm9NK2grVERKV2hXbG1HTEFPZWt2Q0dsVmZZdnhG?=
 =?utf-8?B?VHk1eUZoT25KOVhVV2phRE5raVpPcVB0WDdDSlFqeEoxUkV4bTE3YnJCNmF6?=
 =?utf-8?B?eEMxTERhYjBKTG82NkRXdGw2WEpkaVRFbm1raGU0Q3NPakhwYTQ4cE01RlZ0?=
 =?utf-8?B?MVNPTHpVSnNtV3BwakNQWm9ML1U2emhvdFVFRGVabXBqeUg1alQ5VXB0NXdp?=
 =?utf-8?B?SWZLTE5jNlloN25CTFJzbDdWUzVLWjBXa0dvWUVoYUxpVkVORk0wNU5IaS9O?=
 =?utf-8?B?N0lJM2NEWnJxV0EwTm04ditKczNBd2IyVjZJTlhKRVkwMkRuRUZtRTRhMW5j?=
 =?utf-8?B?NmlEaU16YmxURWx2YVQ4cDJkUmhmN2llRFowSkUwU3RBQUZ3LzlpRE51VlBU?=
 =?utf-8?B?LzZJOUZhbklqNWhBczFMOTJyTWN0WnpXbTFUdHF0ZGN6Y3pUWUFBSG9tK2Na?=
 =?utf-8?B?SkdtY0JTL3kzSWpZWGZIMlVONEVoRG43bll1cEI1WXRodTRDam45a3ErNVps?=
 =?utf-8?B?ZE1pZlp3NTdDbjE3aFgzUnNWMHdyeHNCUDBLNUdzTUhCWDllbTBaQnNnV0dE?=
 =?utf-8?B?RFI1cW5Ub1I2STYwTmk5VXJldnM3Mm5WMzQycWYrZkMyWTZDR0lnbytmQm1Z?=
 =?utf-8?B?T0hYVXpPYTJ1cjNDY1ZiNjI3U2E4citSVUdIRFJKOFZocFlIK01RWnhGWDNz?=
 =?utf-8?B?TEU4SUlBWVBXVjUwVEk1UUE1cTRKaXZydEtWOFlWYzl6M2xURjJrWDl3MzBB?=
 =?utf-8?B?U0tVVjd4OGU0QlpPd1lVazZMZFdSUDJRMytwZE5Uam9LTFYzYUU0RllhWVU2?=
 =?utf-8?B?NWlpZFN6OUw5STg3VnRRZ1oyNnZpSzhWclpZekhqRW9JSm01QXErbzVFUDFn?=
 =?utf-8?B?YnFGRTg5WDljamtZQ1FuSDdoZjFvbGNXYjk1QW43OVFMemN2ZnlwQXhoZElD?=
 =?utf-8?B?dFVrQkNBYkZ5ZEhmVEp2UGM4cG9KS2wyZHV1V29lL2xXNTlPVjltN3h4S0kv?=
 =?utf-8?B?dzYrcERvTERqVS9IekZZQ3FjT0NFdEorNmpGRUY4c2RaRVRLUnVoWnZEaUg2?=
 =?utf-8?B?c1JRd1g0eU0xSVk1NXE5bkJOTXJrQThZRCs1d0ZGWmNVdjVOTjlLOXZ5WVZ2?=
 =?utf-8?B?b2RBeHpUbUU1TDEwbUcxcGVCK2ZlVHMrK1JpcTh5c0UvQ1Vta0ovelcxV3BW?=
 =?utf-8?B?Nng0MVAreHl2OGNOaThVZTB1U2ZTN2xtTUswVWdqbkNWcURLbERVaTlNMFV0?=
 =?utf-8?B?eHl1S2t4TnlFVEVBTUZZckh6RTI1YlYxVFBHeE14NGZsQzZqaWJGZHdOSWVu?=
 =?utf-8?B?QUVndEZTRzR6THVpdTVDZ2d2bjVHTXlsMDVqdm91QlA0cWFIcFk1U3JZdjdZ?=
 =?utf-8?B?dHczUUVPNXdTWVBZN1pIQVhocnowcnFSOHVWeDA1SkJzV3JNWkRpQ3NobTJY?=
 =?utf-8?B?YytoZXV5TkZhY1ZzUVRFZ1Q4cURyaWpQSXJHNlpZRjNuL0xjYkQyNEtIc0Fm?=
 =?utf-8?B?VzJmTGY4TFhyMzRmYWl3SDJYMWRvK28rcVVOSUNNSytMM0NRQmc3bzE3eXBV?=
 =?utf-8?B?L0tmenJUeHA4ZHlFTVdubklaUVNERVdLZUJ5RE5JVWY1cElIQm9RdjErQ054?=
 =?utf-8?B?SmRPd09wSGppeitTRnlGV3NXclZZNkV5TEgwZ3Y4dkVHT2R4L1pCYUxuU1VE?=
 =?utf-8?B?QlhhckhqeHVKcjBqRW0xc3ZZd3ByZ2lYS1FuaHFhS2dVait5S2NYQWxHSjlO?=
 =?utf-8?B?VTY1b3BSYndjS1I3MG5odWRCN2l2YU1INUVKbmFRVzliRm9TWmtlZjJWQ1Z3?=
 =?utf-8?B?TndEcE5FSm5ZY1Z3SnFmeUdNUG9RY1Z1SHdVeUNyMmF3VUE4V3NrTUF0dnlE?=
 =?utf-8?B?QmhGSFpwZlpaR0s3ZzRmTyt2TUlUQnBXR3Q5eG9rNXYxcVEzMCtCRGJML1Rw?=
 =?utf-8?Q?yDw+4YhtScZAJpbqj84izrJYp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d65d3f0d-d7dc-42d5-8c88-08dcef435f74
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 07:06:22.4927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CsUL+VBVZMJURMsuvmoCWDlZvSKHpk4VSFixO48UCfbOWJl/EV4Ge7+B2ZNjXKU3ihObNsQGoQCq+DaCde9rgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6743
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
> Introduce the implementation of the clear-ggtt subcheck, which
> provides functionality to verify Functional Level Reset (FLR)
> across Virtual Functions (VFs) through GGTT (Global Graphics
> Translation Table) testing.
>
> This patch sets up the basic structures for manipulating GGTT
> PTEs (Page Table Entries), finds the GGTT ranges assigned to each VF,
> and verifies address resets after FLR.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_flr.c | 284 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 283 insertions(+), 1 deletion(-)
>
> diff --git a/tests/intel/xe_sriov_flr.c b/tests/intel/xe_sriov_flr.c
> index 26b59101f..3bce235de 100644
> --- a/tests/intel/xe_sriov_flr.c
> +++ b/tests/intel/xe_sriov_flr.c
> @@ -6,6 +6,10 @@
>   #include "drmtest.h"
>   #include "igt_core.h"
>   #include "igt_sriov_device.h"
> +#include "intel_chipset.h"
> +#include "linux_scaffold.h"
> +#include "xe/xe_mmio.h"
> +#include "xe/xe_query.h"
>   
>   /**
>    * TEST: xe_sriov_flr
> @@ -246,9 +250,287 @@ disable_vfs:
>   		igt_skip("No checks executed\n");
>   }
>   
> +#define GEN12_VF_CAP_REG			0x1901f8
> +#define GGTT_PTE_TEST_FIELD_MASK		GENMASK_ULL(19, 12)
> +#define GGTT_PTE_ADDR_SHIFT			12
> +#define PRE_1250_IP_VER_GGTT_PTE_VFID_MASK	GENMASK_ULL(4, 2)
> +#define GGTT_PTE_VFID_MASK			GENMASK_ULL(11, 2)
> +#define GGTT_PTE_VFID_SHIFT			2
> +
> +#define for_each_pte_offset(pte_offset__, ggtt_offset_range__) \
> +	for ((pte_offset__) = ((ggtt_offset_range__)->begin);  \
> +	     (pte_offset__) < ((ggtt_offset_range__)->end);    \
> +	     (pte_offset__) += sizeof(xe_ggtt_pte_t))
> +
> +struct ggtt_ops {
> +	void (*set_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte);
> +	xe_ggtt_pte_t (*get_pte)(struct xe_mmio *mmio, int gt, uint32_t pte_offset);
> +};
> +
> +struct ggtt_provisioned_offset_range {
> +	uint32_t begin;
> +	uint32_t end;
> +};
> +
> +struct ggtt_data {
> +	struct subcheck_data base;
> +	struct ggtt_provisioned_offset_range *pte_offsets;
> +	struct xe_mmio *mmio;
> +	struct ggtt_ops ggtt;
> +};
> +
> +static xe_ggtt_pte_t intel_get_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset)
> +{
> +	return xe_mmio_ggtt_read(mmio, gt, pte_offset);
> +}
> +
> +static void intel_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +{
> +	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +}
> +
> +static void intel_mtl_set_pte(struct xe_mmio *mmio, int gt, uint32_t pte_offset, xe_ggtt_pte_t pte)
> +{
> +	xe_mmio_ggtt_write(mmio, gt, pte_offset, pte);
> +
> +	/* force flush by read some MMIO register */
> +	xe_mmio_gt_read32(mmio, gt, GEN12_VF_CAP_REG);
> +}
> +
> +static bool set_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> +			uint8_t gpa, xe_ggtt_pte_t *out)
> +{
> +	xe_ggtt_pte_t pte;
> +
> +	pte = ggtt->get_pte(mmio, gt, pte_offset);
> +	pte &= ~GGTT_PTE_TEST_FIELD_MASK;
> +	pte |= ((xe_ggtt_pte_t)gpa << GGTT_PTE_ADDR_SHIFT) & GGTT_PTE_TEST_FIELD_MASK;
> +	ggtt->set_pte(mmio, gt, pte_offset, pte);
> +	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +
> +	return *out == pte;
> +}
> +
> +static bool check_pte_gpa(struct ggtt_ops *ggtt, struct xe_mmio *mmio, int gt, uint32_t pte_offset,
> +			  uint8_t expected_gpa, xe_ggtt_pte_t *out)
> +{
> +	uint8_t val;
> +
> +	*out = ggtt->get_pte(mmio, gt, pte_offset);
> +	val = (uint8_t)((*out & GGTT_PTE_TEST_FIELD_MASK) >> GGTT_PTE_ADDR_SHIFT);
> +
> +	return val == expected_gpa;
> +}
> +
> +static bool is_intel_mmio_initialized(const struct intel_mmio_data *mmio)
> +{
> +	return mmio->dev;
> +}
> +
> +static uint64_t get_vfid_mask(int pf_fd)
> +{
> +	uint16_t dev_id = intel_get_drm_devid(pf_fd);
> +
> +	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50)) ?
> +		GGTT_PTE_VFID_MASK : PRE_1250_IP_VER_GGTT_PTE_VFID_MASK;
> +}
> +
> +static bool pte_contains_vfid(const xe_ggtt_pte_t pte, const unsigned int vf_id,
> +			      const uint64_t vfid_mask)
> +{
> +	return ((pte & vfid_mask) >> GGTT_PTE_VFID_SHIFT) == vf_id;
> +}
> +
> +static bool is_offset_in_range(uint32_t offset,
> +			       const struct ggtt_provisioned_offset_range *ranges,
> +			       size_t num_ranges)
> +{
> +	for (size_t i = 0; i < num_ranges; i++)
> +		if (offset >= ranges[i].begin && offset < ranges[i].end)
> +			return true;
> +
> +	return false;
> +}
> +
> +static void find_ggtt_provisioned_ranges(struct ggtt_data *gdata)
> +{
> +	uint32_t limit = gdata->mmio->intel_mmio.mmio_size - SZ_8M > SZ_8M ?
> +				 SZ_8M :
> +				 gdata->mmio->intel_mmio.mmio_size - SZ_8M;
> +	uint64_t vfid_mask = get_vfid_mask(gdata->base.pf_fd);
> +	xe_ggtt_pte_t pte;
> +
> +	gdata->pte_offsets = calloc(gdata->base.num_vfs, sizeof(*gdata->pte_offsets));

Allocating (num_vfs + 1) and using 1-based VF identification would be 
more readable IMHO. The same applies for LMEM and scratch registers patches.

> +	igt_assert(gdata->pte_offsets);
> +
> +	for (int vf_id = 1; vf_id <= gdata->base.num_vfs; vf_id++) {
> +		uint32_t range_begin = 0;
> +		int adjacent = 0;
> +		int num_ranges = 0;
> +
> +		for (uint32_t offset = 0; offset < limit; offset += sizeof(xe_ggtt_pte_t)) {
> +			/* Skip already found ranges */
> +			if (is_offset_in_range(offset, gdata->pte_offsets, vf_id - 1))
> +				continue;
> +
> +			pte = xe_mmio_ggtt_read(gdata->mmio, gdata->base.gt, offset);
> +
> +			if (pte_contains_vfid(pte, vf_id, vfid_mask)) {
> +				if (adjacent == 0)
> +					range_begin = offset;
> +
> +				adjacent++;
> +			} else if (adjacent > 0) {
> +				uint32_t range_end = range_begin +
> +						     adjacent * sizeof(xe_ggtt_pte_t);
> +
> +				igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
> +					  vf_id, range_begin, range_end, adjacent);
> +
> +				if (adjacent > gdata->pte_offsets[vf_id - 1].end -
> +					       gdata->pte_offsets[vf_id - 1].begin) {
> +					gdata->pte_offsets[vf_id - 1].begin = range_begin;
> +					gdata->pte_offsets[vf_id - 1].end = range_end;
> +				}
> +
> +				adjacent = 0;
> +				num_ranges++;
> +			}
> +		}
> +
> +		if (adjacent > 0) {
> +			uint32_t range_end = range_begin + adjacent * sizeof(xe_ggtt_pte_t);
> +
> +			igt_debug("Found VF%d ggtt range begin=%#x end=%#x num_ptes=%d\n",
> +				  vf_id, range_begin, range_end, adjacent);
> +
> +			if (adjacent > gdata->pte_offsets[vf_id - 1].end -
> +				       gdata->pte_offsets[vf_id - 1].begin) {
> +				gdata->pte_offsets[vf_id - 1].begin = range_begin;
> +				gdata->pte_offsets[vf_id - 1].end = range_end;
> +			}
> +			num_ranges++;
> +		}
> +
> +		if (num_ranges == 0) {
> +			igt_assert_neq(asprintf(&gdata->base.stop_reason,
> +						"Failed to find VF%d provisioned ggtt range\n",
> +						vf_id),
> +				       -1);
> +			return;
> +		}
> +		igt_warn_on_f(num_ranges > 1, "Found %d ranges for VF%d\n", num_ranges, vf_id);
> +	}
> +}
> +
> +static void ggtt_subcheck_init(struct subcheck_data *data)
> +{
> +	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +
> +	if (xe_is_media_gt(data->pf_fd, data->gt)) {
> +		igt_assert_neq(asprintf(&data->stop_reason,
> +					"%s : GGTT unavailable on media GT", SKIP_REASON), -1);
> +		return;
> +	}
> +
> +	gdata->ggtt.get_pte = intel_get_pte;
> +	if (IS_METEORLAKE(intel_get_drm_devid(data->pf_fd)))
> +		gdata->ggtt.set_pte = intel_mtl_set_pte;
> +	else
> +		gdata->ggtt.set_pte = intel_set_pte;
> +
> +	if (gdata->mmio) {
> +		if (!is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> +			xe_mmio_vf_access_init(data->pf_fd, 0 /*PF*/, gdata->mmio);
> +
> +		find_ggtt_provisioned_ranges(gdata);
> +	} else {
> +		igt_assert_neq(asprintf(&data->stop_reason, "xe_mmio is NULL"), -1);
> +	}
> +}
> +
> +static void ggtt_subcheck_prepare_vf(int vf_id, struct subcheck_data *data)
> +{
> +	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +	xe_ggtt_pte_t pte;
> +	uint32_t pte_offset;
> +
> +	if (data->stop_reason)
> +		return;
> +
> +	igt_debug("Prepare gpa on VF%u offset range [%#x-%#x]\n", vf_id,
> +		  gdata->pte_offsets[vf_id - 1].begin,
> +		  gdata->pte_offsets[vf_id - 1].end);
> +
> +	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id - 1]) {
> +		if (!set_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +				 (uint8_t)vf_id, &pte)) {
> +			igt_assert_neq(asprintf(&data->stop_reason,
> +						"Prepare VF%u failed, unexpected gpa: Read PTE: %#lx at offset: %#x\n",
> +						vf_id, pte, pte_offset),
> +				       -1);
> +			return;
> +		}
> +	}
> +}
> +
> +static void ggtt_subcheck_verify_vf(int vf_id, int flr_vf_id, struct subcheck_data *data)
> +{
> +	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +	uint8_t expected = (vf_id == flr_vf_id) ? 0 : vf_id;
> +	xe_ggtt_pte_t pte;
> +	uint32_t pte_offset;
> +
> +	if (data->stop_reason)
> +		return;
> +
> +	for_each_pte_offset(pte_offset, &gdata->pte_offsets[vf_id - 1]) {
> +		if (!check_pte_gpa(&gdata->ggtt, gdata->mmio, data->gt, pte_offset,
> +				   expected, &pte)) {
> +			igt_assert_neq(asprintf(&data->stop_reason,
> +						"GGTT check after VF%u FLR failed on VF%u: Read PTE: %#lx at offset: %#x\n",
> +						flr_vf_id, vf_id, pte, pte_offset),
> +				       -1);
> +			return;
> +		}
> +	}
> +}
> +
> +static void ggtt_subcheck_cleanup(struct subcheck_data *data)
> +{
> +	struct ggtt_data *gdata = (struct ggtt_data *)data;
> +
> +	free(gdata->pte_offsets);
> +	if (gdata->mmio && is_intel_mmio_initialized(&gdata->mmio->intel_mmio))
> +		xe_mmio_access_fini(gdata->mmio);
> +}
> +
>   static void clear_tests(int pf_fd, int num_vfs)
>   {
> -	verify_flr(pf_fd, num_vfs, NULL, 0);
> +	struct xe_mmio xemmio = { };
> +	const unsigned int num_gts = xe_number_gt(pf_fd);
> +	struct ggtt_data gdata[num_gts];
> +	const unsigned int num_checks = num_gts;
> +	struct subcheck checks[num_checks];
> +	int i;
> +
> +	for (i = 0; i < num_gts; ++i) {
> +		gdata[i] = (struct ggtt_data){
> +			.base = { .pf_fd = pf_fd, .num_vfs = num_vfs, .gt = i },
> +			.mmio = &xemmio
> +		};
> +		checks[i] = (struct subcheck){
> +			.data = (struct subcheck_data *)&gdata[i],
> +			.name = "clear-ggtt",
> +			.init = ggtt_subcheck_init,
> +			.prepare_vf = ggtt_subcheck_prepare_vf,
> +			.verify_vf = ggtt_subcheck_verify_vf,
> +			.cleanup = ggtt_subcheck_cleanup
> +		};
> +	}
> +	igt_assert_eq(i, num_checks);
> +
> +	verify_flr(pf_fd, num_vfs, checks, num_checks);
>   }
>   
>   igt_main
