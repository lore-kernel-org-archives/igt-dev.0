Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087EC021A6
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 14:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8C10ECBA;
	Fri, 14 Feb 2025 14:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EzY3QfjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D273810E496
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739543550; x=1771079550;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IWpagj5PrPFCS3RLDRc90MI1b1jFD3o1KYBeoBw+c3U=;
 b=EzY3QfjWHjLRr8J1QthmIWEkNAKoNDMzW9wojjtVlJJUF+Xycb+AkN2X
 5LiKfEwYlGUJIrxEs/yqTy80txyxcT7cALvJwZ0+Dlhdm5/qO20DMBwnr
 pVx8xsAyefDMdOfIrfzk27kmvKvgv88vy7tr15G8TjFbqKLHXhWv8HHCS
 katv/+VYx1V/X1ECxu0+/n3WvrrPEksx0is3zUkkz0CSOiadZcp8aUXC+
 0YGwhBt3UYWkNI+e6WeoBiHLhbRdDC5ieCi4x9bJVI5LnQi6CnGvMw0nk
 eCAL97B6OydA+ZkD+U6S70a5EU5TG9IUFM8JioZGdYIKeDxvt8eBIk2lk w==;
X-CSE-ConnectionGUID: qHPYUWxbTuiPYxokjGHD0Q==
X-CSE-MsgGUID: mPPMjgaaRI28yHKhQzsmNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40327655"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40327655"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 06:32:29 -0800
X-CSE-ConnectionGUID: lcYUL4mqT4W7iVo/7D5Tvg==
X-CSE-MsgGUID: dk4ywZNCQMGfK9cOHOdl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="118577271"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 06:32:29 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 06:32:28 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Feb 2025 06:32:28 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 06:32:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ux5n+mxqC27F0XV/w4ILxNJGMR99VWzM/IQ1PhKEepaSJv0MY69cQ7HK4gkmp8R8j3B20k62//jof9fs25Uuc7ftBqRBQb+EKqLmG1TJzx6rM//6XwOux6Pez6FPF4mlRHJee12IDth44+yUMA4USL8VmBWsfSv5yQVkMN6/2k4rYI5Zj+Fzty+dMT7GMY3oM6tjJjRpAOnygw/fc0jl4+9yBe7aqCvTAKSql+DKLyYP5ZKxR4kwYgyj4RaD4fpmN3Uch58DyOLmqIXMEKZM0Y8Ks6/IeAY/vyX6sSFHfKsKpREksEQfLWwL8x4ZZOxEV0Sw4W3j0Ro9lgfjlwHpqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I/jOXx91bwYvTn8FFFyIL+G4G8dwhotZp6qB8VMbxIY=;
 b=jkADTDrbUSD0CbPY6rxBQ62xYw3H127uz70e1iBoOatVyZR8tJd8Iy4O6YUqtc0lJfK3YIQgZUmWrmUSF1Nk/2FxmoJxKBgqZNQaUzx0uYHuqtJWRm0WHbb6UTm21MEeaayEq8xvQQkDSIfEqNjsHgvynSDaj7rkBt0+svcR/M4RTPpl7cYEfAxlGAVq5AnhEs4T8u76X9V8bRta7PlpRKGqMg8Wn5GHCUJ3+EL0e0DduQM8XSMeMyWIv1OOs5yebEuXYmqqjHQxriXbDnhRzmIj0NAfFS/0JbQF16EecUTysYDkQG5iz1d2TqOtA2Bap3p2VebuOlaeoLL4LdEpTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB4958.namprd11.prod.outlook.com (2603:10b6:a03:2ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Fri, 14 Feb
 2025 14:32:25 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.8445.016; Fri, 14 Feb 2025
 14:32:25 +0000
Message-ID: <83096dcf-92b8-4a9d-b3ea-0ef6917bcf6c@intel.com>
Date: Fri, 14 Feb 2025 15:32:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 3/5] tests/xe_sriov_scheduling: VF
 equal-throughput validation
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Narasimha C V <narasimha.c.v@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>, Tomasz Lis
 <tomasz.lis@intel.com>
References: <20250212184757.586071-1-marcin.bernatowicz@linux.intel.com>
 <20250212184757.586071-4-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20250212184757.586071-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P194CA0042.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::31) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: 6399dfb2-6562-48af-2176-08dd4d046639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3ZXZ1hyejE2WG56c2hJSHBlU2RvZTg5MkVHYklvVkFsN0h3NGJTQUpySUdK?=
 =?utf-8?B?a2k2UXc0dDhHT1BuVmpsaC9GK0pSRm5Qa1RuVi9kbFVETUtOdjljYWpKd1FC?=
 =?utf-8?B?NTI0WHVOckhheTN5MUp3Z09weWFpR1BUU3ZCUXdlUmkvcEFZNG9Eb3hRSXRy?=
 =?utf-8?B?N04zckRkaUJBTXV2c1JHdzhBMjJGRkcvU1hqMUhiU2plNENKaElNc1lWOG0y?=
 =?utf-8?B?M3NDTkg3WHVqRjlBQjhueGJpbE1kSmtoVUMwOHYveiszRW1paHFUd1R1Vzl1?=
 =?utf-8?B?THRBTWg5OGRUbElzZHpsMlN6T0x6UUxOM1ZqRUw4aUd4dFdXV1FBelFLYzJv?=
 =?utf-8?B?aDVYbk15Ui9CQUw1T1VOQWgrbjZ4VXRPWnhKbkhrT1FBblNBNnJSYitKRkVx?=
 =?utf-8?B?STJ4V0d1WktKUGxxUDdZMUwyTCtHM0tDL3dMbEw4ckp4RHVEcmFNSXg2UHQx?=
 =?utf-8?B?ZTZta3pEbmdkODBEMjB6Ti8veUVHempWVzh3MFZCWVV4eWF1d0dKTVJKYytH?=
 =?utf-8?B?Z3Jpd2VFNkxTWVNRdlBxcFpzQi92ZDhpMmlpb3lyYkM0NDY3bjRQL1RmbSti?=
 =?utf-8?B?czFYVnBHVUpKRUdSZ05HOG50TXdobXUrNXVSWkovQk1DT05Ha0lvYnZmZHdM?=
 =?utf-8?B?Q1U2RHBOT2QyVGhORENQTzh5NVFiWGhTWUxreG1mWm9YME9WN0FJSmxrd200?=
 =?utf-8?B?MW16YXNINE9sbVRlMkd0OE9mVUx0bjYxNnl0NHRHOGdwa2t2L2Zvak4zUjB6?=
 =?utf-8?B?djVlMWErNDhJbTdmRXdITnN0U3I2cUwvQ01UbEtoYm1Ld3BMWGNSeS9NMlBm?=
 =?utf-8?B?cHhHemRaUFMvRERaWTZhQU03ekpOZ3FQZEp0TnhFdkRZbVRVWENZUkl4V0s2?=
 =?utf-8?B?TC91clBlRmNqdXBFOG9meWRSMDUwM3VLWFBPa3QyVXQreStKajJBSFUxTk5l?=
 =?utf-8?B?bkNGOVI3bXd4ZEplZkxrK3RGZTJRTHhLeU1QbHV6R09QMnRETFBYaHZWRXQ2?=
 =?utf-8?B?NUduVHU4aEh2TS9ML0dKNFVqeWhBTFVmemdFZ3NCdnlXajkwVWkwelZic3FE?=
 =?utf-8?B?NXdycWNQNUFPaXJ1cGYxMXo3LzhnWmRRV1V0YWFOMVRWbTlNZ1NML3dJdEs3?=
 =?utf-8?B?UXV2SXY5UmxjQ3VxUnAxQ09hWlJoZ1c5UHRrSEpoMkhCUzBINHRCQUx5Y0N5?=
 =?utf-8?B?RjNtamY1d1hPNDQvWjg1Q2hVRUhSb2JXRlA0Q1JKODhkNzRtNUpKb29pam04?=
 =?utf-8?B?Nno0eFRON2JHYjFzME9nYUYzWmhURVk5MHpoNVdNOXVFSUppcC92RnIrQlVo?=
 =?utf-8?B?cC9UUk9RTCtLTTY2anFBWURPdzdUT2cyQW50UkpaVXhkKzJITk90UUNjaXZX?=
 =?utf-8?B?NkpPblVWZW1WdWlmcFZ3cnJhSWRGVHh2QktyTldLbkt6b001QjZHanhiUWc3?=
 =?utf-8?B?d1A1MUFCMXBJMWdGOVpSanhLMVRjQUFURTRZbGJXL1o2MVNqWENYVWRaYW9D?=
 =?utf-8?B?ZzhIWXM2K1J3WklTOFFSZFVydE5xc2RhNWRGK252UWh1NjFlZTNiYitnZlVH?=
 =?utf-8?B?cWsybXlPbzBOQVVXWHBicEl6NCtSd1orNTEwcjJmd2ZGWkdhUWlLVXJWTmU4?=
 =?utf-8?B?UE9lZDNod1pjOFFJbGtKS0RBYll6VFpoL1VQT3VDOU1DTlVkYy9LTVlTeitO?=
 =?utf-8?B?OFJYdU42R0QxM3VDOXNSUTYxaS9yUkRZTXpacUZ0bklKRzhWK05mT0UwL2RN?=
 =?utf-8?B?QVkrRFZMU0hVOFlIbm82OUp2VzFpUFhHakpWQXY5ejkwRm4xZ3czalpFK1Ey?=
 =?utf-8?B?UDJMcmNXKzBXdGpxcCtTQWRiMWdUVlUwWUMyYzFhTlNOUG9iV0Rremo5Q2Nt?=
 =?utf-8?Q?RLcf56xNCJvk4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG5vYWpJM2FCMmd0NHBTQWFEM29lZ0Qvd0lmZkhtVXpLMDhQU3YzdFNQYVdL?=
 =?utf-8?B?WkN3bnpTSkxCaEpHVzVWUnJJeTZXYmtLa0cxb0JDVEVUam1sRXkyd1VtLzdW?=
 =?utf-8?B?aFBCeFI5MCt5NDVjRXVpTFhDR2RON05kNFZ1Vkp5Y0lyZ0dlV3hTazNoRGh6?=
 =?utf-8?B?aFExaU9WQlJ0VWRvc3c1SEtHYU1DbE05NFp3a3R1bUdtaHdhMUJTc0ZJR1Rx?=
 =?utf-8?B?QWJyTlNnOWUxRnJPa011SnNXRXdEbW9TSmdKbVovQUZxWlZmdG9UekUxREpn?=
 =?utf-8?B?aEZLaTZpRjF5MmMxMnZCRHpQeHZzelNpQyttbmxsR0FVL3I0ZWN5UFVTV2Q0?=
 =?utf-8?B?dDF5ZnFMWE4xd0hpM0paQlVMM1dTMEU5WFA5SWRhelhZYy9Zc1Z4RkZEZEJL?=
 =?utf-8?B?eFdoNnpDWTJ5NFpsTTBxNEZBY0Rhc3ZlL3h4cUNqV1NoZ0lkaWlTc0dTRGNJ?=
 =?utf-8?B?T2lQS1h3WTBiU1NzR291UkpCaGFFWmxrMGxNYjlld0RpSVVOb1d2aDhrQkZQ?=
 =?utf-8?B?N0dhMXhxemRiV2JwKzBSL1c0Ulc1dTVZTW5HYkhxeFg4M0lzT0pBbWt3Q1pQ?=
 =?utf-8?B?QUNrNS8vbjF2NytyS1N0SkM1TXJHWnhkNnVrM2lnYWErYzZWRmFZcklUOE5k?=
 =?utf-8?B?N1RLZlh4bmRPcGR0VWtRczFaanZsZGdOa0tRVTNwUzNBVkl4eFBNTWh4MWwv?=
 =?utf-8?B?NnhlL28wQU4rNFJBWlNNRGMzRXhEUUV4MC9KR2tMejJpUDJoV0IrTlRmTGhJ?=
 =?utf-8?B?by9YU0R5R0IxckdKUGJwREFiUHZkZkdEVDllT1FZcVAvdzY0aEZOSklEYkJT?=
 =?utf-8?B?NGVPOTFzYjJPWTNYd0F2V1FpMGRlWVoxc0RKZExtekhYb0RUUERvSG82V2tj?=
 =?utf-8?B?TlgxUHVNczVjZzJNam13UytsaEdMOXhXME5jQ3I0Y0dNcGdJTnNFQjg4alQw?=
 =?utf-8?B?cVI3RWVSNHA5WGV4ZDJsMG0rRkxyNTlPRHlTdzhsRDAzRUpZeURPNlZFM2xl?=
 =?utf-8?B?L3NwWCtkTURBVFYwUTNqazkza1FWQWJKUE4yc3dJdWU0OU9EcEpRVzgzMVdU?=
 =?utf-8?B?MnhoTkxxTjAvaG9lczRPSUVrbERFNTc3UDJrK3p2WnkyeVN4YWJXNHNEc0VQ?=
 =?utf-8?B?ZyswYkZRYllydGI1aTN6bTIrR2R5WmVuZ1MyVHh1LzZheTV3dDBOZ3RLNFgy?=
 =?utf-8?B?aTJnQ3VRdHA5NVV0UlpVSEo2WDk4MHJ3NUdkazBwWFRuMW51WU95eCtkTjFZ?=
 =?utf-8?B?TWxmeUMvdG9oNVdmRmE4ek45LzhSMjg3TXU0ekdGY0xVS0NVanA3NGhuZlJh?=
 =?utf-8?B?SG1NZm1OWDNoWUoyWURxdWZ5M0M5ajF6YXpERTQ2S29ZOXZhRmx2YW1jOW1m?=
 =?utf-8?B?bDVLSk1ndGlGOW55WmNIN2wzQWlveEJaWkxnYmFTOG5WMmhxTXdYL3dyM2hm?=
 =?utf-8?B?SzhGSC9QemdnS1prSW1MbmVkbVBMYjgwdnU2Mmtmck1ybzNtS1FxemF4b2FZ?=
 =?utf-8?B?Zi9hT1hSSVF6KzM2TFJYZTZHblphQS9MU2RobHNPcmxDUWk5UDlIODlvclcw?=
 =?utf-8?B?S2lsb25pZlg4amd2QjNnNmR3NkdoZzZ5ajBLMFhTSllQZnBkQlNpOWxaTFVZ?=
 =?utf-8?B?QWpCZjZ2M2hoY1laR213d0hET09tbWdVT1RCNzlPUEE2dHlhMGE5dzVHYWRB?=
 =?utf-8?B?R1VlZHhtOFEwWTcyTUI1WnNBTlF5M1hTMWVHZmN2RWVtQkNzbEVvZmNtVXZa?=
 =?utf-8?B?RG03QVJhNTFJdVpMbUk1eVFaK1paVjlCNFVBSHZGbmUzZXZwLzcrQ3RuL2FS?=
 =?utf-8?B?ZVVoZTdycm92UklMUW5rNUU4QVg0RzdGZkF3SWM4RXFkbUZPVmt6MGJoQ3Zq?=
 =?utf-8?B?Mjgyb1BHWW1OU3BZRUN4SDVXTXJ4QWNwRGhwSnM1SGdyUVNRZ25tUnRrdTR4?=
 =?utf-8?B?MVNKNkRza2d3ZmRzUnBZQ0JDZ0xyRk9DUUx5dGdKWnlqYjJxeElqMXRRaC9m?=
 =?utf-8?B?Y3Q2UmU4SzZuQ2gwbFlBSmpKU3I3endGeFlFUXdxTDVCaDlBbVR6R0x1eXE2?=
 =?utf-8?B?Qkg3R2lLMDQvQW9OdHJlNEFDRVpHUGJjSU9qeDdLTUpDZXJsREltZENwRzBo?=
 =?utf-8?Q?vUkp22Gzzrb82vJKtOHPlwMRH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6399dfb2-6562-48af-2176-08dd4d046639
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 14:32:25.0085 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XjUNJyeaLknSPsRAClFOU5ngBAjX/z35Fmf8odpzktnPQvPjlSU3mdlpiR0nBE/v5SixV4Ywns7R6xaY1AsN3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4958
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


On 2/12/2025 19:47, Marcin Bernatowicz wrote:
> Implement equal-throughput validation for VFs (PF is treated as VF0)
> with identical workloads and scheduling settings.
> Scheduling settings are adjusted to consider execution quantum, job
> duration, and the number of VFs, while adhering to timeout constraints
> and aiming for a sufficient number of job repeats. This approach
> balances overall test duration with accuracy.
>
> v2:
> - Correct description (Lukasz)
> - Remove short options (Lukasz)
> - Refactor scheduling parameter preparation for reuse in other tests:
>    - Extract prepare_vf_sched_params from prepare_job_sched_params.
>    - Make prepare_job_sched_params take job_timeout_ms as a param.
>    - Modify compute_max_exec_quantum_ms to take min_num_repeats,
>      job_timeout_ms as params.
>    - Introduce derive_preempt_timeout_us, returning preempt_timeout_us
>      as twice the exec_quantum_ms.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

LGTM,
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 713 ++++++++++++++++++++++++++++++
>   tests/meson.build                 |   1 +
>   2 files changed, 714 insertions(+)
>   create mode 100644 tests/intel/xe_sriov_scheduling.c
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> new file mode 100644
> index 000000000..a9ac950cf
> --- /dev/null
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -0,0 +1,713 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include "igt.h"
> +#include "igt_sriov_device.h"
> +#include "igt_syncobj.h"
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_spin.h"
> +#include "xe/xe_sriov_provisioning.h"
> +
> +/**
> + * TEST: Tests for SR-IOV scheduling parameters.
> + * Category: Core
> + * Mega feature: SR-IOV
> + * Sub-category: scheduling
> + * Functionality: vGPU profiles scheduling parameters
> + * Run type: FULL
> + * Description: Verify behavior after modifying scheduling attributes.
> + */
> +
> +enum subm_sync_method { SYNC_NONE, SYNC_BARRIER };
> +
> +struct subm_opts {
> +	enum subm_sync_method sync_method;
> +	uint32_t exec_quantum_ms;
> +	uint32_t preempt_timeout_us;
> +	double outlier_treshold;
> +};
> +
> +struct subm_work_desc {
> +	uint64_t duration_ms;
> +	bool preempt;
> +	unsigned int repeats;
> +};
> +
> +struct subm_stats {
> +	igt_stats_t samples;
> +	uint64_t start_timestamp;
> +	uint64_t end_timestamp;
> +	unsigned int num_early_finish;
> +	unsigned int concurrent_execs;
> +	double concurrent_rate;
> +	double concurrent_mean;
> +};
> +
> +struct subm {
> +	char id[32];
> +	int fd;
> +	int vf_num;
> +	struct subm_work_desc work;
> +	uint32_t expected_ticks;
> +	uint64_t addr;
> +	uint32_t vm;
> +	struct drm_xe_engine_class_instance hwe;
> +	uint32_t exec_queue_id;
> +	uint32_t bo;
> +	size_t bo_size;
> +	struct xe_spin *spin;
> +	struct drm_xe_sync sync[1];
> +	struct drm_xe_exec exec;
> +};
> +
> +struct subm_thread_data {
> +	struct subm subm;
> +	struct subm_stats stats;
> +	const struct subm_opts *opts;
> +	pthread_t thread;
> +	pthread_barrier_t *barrier;
> +};
> +
> +struct subm_set {
> +	struct subm_thread_data *data;
> +	int ndata;
> +	enum subm_sync_method sync_method;
> +	pthread_barrier_t barrier;
> +};
> +
> +static void subm_init(struct subm *s, int fd, int vf_num, uint64_t addr,
> +		      struct drm_xe_engine_class_instance hwe)
> +{
> +	memset(s, 0, sizeof(*s));
> +	s->fd = fd;
> +	s->vf_num = vf_num;
> +	s->hwe = hwe;
> +	snprintf(s->id, sizeof(s->id), "VF%d %d:%d:%d", vf_num,
> +		 hwe.engine_class, hwe.engine_instance, hwe.gt_id);
> +	s->addr = addr ? addr : 0x1a0000;
> +	s->vm = xe_vm_create(s->fd, 0, 0);
> +	s->exec_queue_id = xe_exec_queue_create(s->fd, s->vm, &s->hwe, 0);
> +	s->bo_size = ALIGN(sizeof(struct xe_spin) + xe_cs_prefetch_size(s->fd),
> +			   xe_get_default_alignment(s->fd));
> +	s->bo = xe_bo_create(s->fd, s->vm, s->bo_size,
> +			     vram_if_possible(fd, s->hwe.gt_id),
> +			     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> +	s->spin = xe_bo_map(s->fd, s->bo, s->bo_size);
> +	xe_vm_bind_sync(s->fd, s->vm, s->bo, 0, s->addr, s->bo_size);
> +	/* out fence */
> +	s->sync[0].type = DRM_XE_SYNC_TYPE_SYNCOBJ;
> +	s->sync[0].flags = DRM_XE_SYNC_FLAG_SIGNAL;
> +	s->sync[0].handle = syncobj_create(s->fd, 0);
> +	s->exec.num_syncs = 1;
> +	s->exec.syncs = to_user_pointer(&s->sync[0]);
> +	s->exec.num_batch_buffer = 1;
> +	s->exec.exec_queue_id = s->exec_queue_id;
> +	s->exec.address = s->addr;
> +}
> +
> +static void subm_fini(struct subm *s)
> +{
> +	xe_vm_unbind_sync(s->fd, s->vm, 0, s->addr, s->bo_size);
> +	gem_munmap(s->spin, s->bo_size);
> +	gem_close(s->fd, s->bo);
> +	xe_exec_queue_destroy(s->fd, s->exec_queue_id);
> +	xe_vm_destroy(s->fd, s->vm);
> +	syncobj_destroy(s->fd, s->sync[0].handle);
> +}
> +
> +static void subm_workload_init(struct subm *s, struct subm_work_desc *work)
> +{
> +	s->work = *work;
> +	s->expected_ticks = xe_spin_nsec_to_ticks(s->fd, s->hwe.gt_id,
> +						  s->work.duration_ms * 1000000);
> +	xe_spin_init_opts(s->spin, .addr = s->addr, .preempt = s->work.preempt,
> +			  .ctx_ticks = s->expected_ticks);
> +}
> +
> +static void subm_wait(struct subm *s, uint64_t abs_timeout_nsec)
> +{
> +	igt_assert(syncobj_wait(s->fd, &s->sync[0].handle, 1, abs_timeout_nsec,
> +				0, NULL));
> +}
> +
> +static void subm_exec(struct subm *s)
> +{
> +	syncobj_reset(s->fd, &s->sync[0].handle, 1);
> +	xe_exec(s->fd, &s->exec);
> +}
> +
> +static bool subm_is_work_complete(struct subm *s)
> +{
> +	return s->expected_ticks <= ~s->spin->ticks_delta;
> +}
> +
> +static bool subm_is_exec_queue_banned(struct subm *s)
> +{
> +	struct drm_xe_exec_queue_get_property args = {
> +		.exec_queue_id = s->exec_queue_id,
> +		.property = DRM_XE_EXEC_QUEUE_GET_PROPERTY_BAN,
> +	};
> +	int ret = igt_ioctl(s->fd, DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY, &args);
> +
> +	return ret || args.value;
> +}
> +
> +static void subm_exec_loop(struct subm *s, struct subm_stats *stats,
> +			   const struct subm_opts *opts)
> +{
> +	struct timespec tv;
> +	unsigned int i;
> +
> +	igt_gettime(&tv);
> +	stats->start_timestamp =
> +		tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	igt_debug("[%s] start_timestamp: %f\n", s->id, stats->start_timestamp * 1e-9);
> +
> +	for (i = 0; i < s->work.repeats; ++i) {
> +		igt_gettime(&tv);
> +
> +		subm_exec(s);
> +
> +		subm_wait(s, INT64_MAX);
> +
> +		igt_stats_push(&stats->samples, igt_nsec_elapsed(&tv));
> +
> +		if (!subm_is_work_complete(s)) {
> +			stats->num_early_finish++;
> +
> +			igt_debug("[%s] subm #%d early_finish=%u\n",
> +				  s->id, i, stats->num_early_finish);
> +
> +			if (subm_is_exec_queue_banned(s))
> +				break;
> +		}
> +	}
> +
> +	igt_gettime(&tv);
> +	stats->end_timestamp = tv.tv_sec * (uint64_t)NSEC_PER_SEC + tv.tv_nsec;
> +	igt_debug("[%s] end_timestamp: %f\n", s->id, stats->end_timestamp * 1e-9);
> +}
> +
> +static void *subm_thread(void *thread_data)
> +{
> +	struct subm_thread_data *td = thread_data;
> +	struct timespec tv;
> +
> +	igt_gettime(&tv);
> +	igt_debug("[%s] thread started %ld.%ld\n", td->subm.id, tv.tv_sec,
> +		  tv.tv_nsec);
> +
> +	if (td->barrier)
> +		pthread_barrier_wait(td->barrier);
> +
> +	subm_exec_loop(&td->subm, &td->stats, td->opts);
> +
> +	return NULL;
> +}
> +
> +static void subm_set_dispatch_and_wait_threads(struct subm_set *set)
> +{
> +	int i;
> +
> +	for (i = 0; i < set->ndata; ++i)
> +		igt_assert_eq(0, pthread_create(&set->data[i].thread, NULL,
> +						subm_thread, &set->data[i]));
> +
> +	for (i = 0; i < set->ndata; ++i)
> +		pthread_join(set->data[i].thread, NULL);
> +}
> +
> +static void subm_set_alloc_data(struct subm_set *set, unsigned int ndata)
> +{
> +	igt_assert(!set->data);
> +	set->ndata = ndata;
> +	set->data = calloc(set->ndata, sizeof(struct subm_thread_data));
> +	igt_assert(set->data);
> +}
> +
> +static void subm_set_free_data(struct subm_set *set)
> +{
> +	free(set->data);
> +	set->data = NULL;
> +	set->ndata = 0;
> +}
> +
> +static void subm_set_init_sync_method(struct subm_set *set, enum subm_sync_method sm)
> +{
> +	set->sync_method = sm;
> +	if (set->sync_method == SYNC_BARRIER)
> +		pthread_barrier_init(&set->barrier, NULL, set->ndata);
> +}
> +
> +static void subm_set_fini(struct subm_set *set)
> +{
> +	int i;
> +
> +	if (!set->ndata)
> +		return;
> +
> +	for (i = 0; i < set->ndata; ++i) {
> +		igt_stats_fini(&set->data[i].stats.samples);
> +		subm_fini(&set->data[i].subm);
> +		drm_close_driver(set->data[i].subm.fd);
> +	}
> +	subm_set_free_data(set);
> +
> +	if (set->sync_method == SYNC_BARRIER)
> +		pthread_barrier_destroy(&set->barrier);
> +}
> +
> +struct init_vf_ids_opts {
> +	bool shuffle;
> +	bool shuffle_pf;
> +};
> +
> +static void init_vf_ids(uint8_t *array, size_t n,
> +			const struct init_vf_ids_opts *opts)
> +{
> +	size_t i, j;
> +
> +	if (!opts->shuffle_pf && n) {
> +		array[0] = 0;
> +		n -= 1;
> +		array = array + 1;
> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		j = (opts->shuffle) ? rand() % (i + 1) : i;
> +
> +		if (j != i)
> +			array[i] = array[j];
> +
> +		array[j] = i + (opts->shuffle_pf ? 0 : 1);
> +	}
> +}
> +
> +struct vf_sched_params {
> +	uint32_t exec_quantum_ms;
> +	uint32_t preempt_timeout_us;
> +};
> +
> +static void set_vfs_scheduling_params(int pf_fd, int num_vfs,
> +				      const struct vf_sched_params *p)
> +{
> +	unsigned int gt;
> +
> +	xe_for_each_gt(pf_fd, gt) {
> +		for (int vf = 0; vf <= num_vfs; ++vf) {
> +			xe_sriov_set_exec_quantum_ms(pf_fd, vf, gt, p->exec_quantum_ms);
> +			xe_sriov_set_preempt_timeout_us(pf_fd, vf, gt, p->preempt_timeout_us);
> +		}
> +	}
> +}
> +
> +static bool check_within_epsilon(const double x, const double ref, const double tol)
> +{
> +	return x <= (1.0 + tol) * ref && x >= (1.0 - tol) * ref;
> +}
> +
> +static void compute_common_time_frame_stats(struct subm_set *set)
> +{
> +	struct subm_thread_data *data = set->data;
> +	int i, j, ndata = set->ndata;
> +	struct subm_stats *stats;
> +	uint64_t common_start = 0;
> +	uint64_t common_end = UINT64_MAX;
> +
> +	/* Find the common time frame */
> +	for (i = 0; i < ndata; i++) {
> +		stats = &data[i].stats;
> +
> +		if (stats->start_timestamp > common_start)
> +			common_start = stats->start_timestamp;
> +
> +		if (stats->end_timestamp < common_end)
> +			common_end = stats->end_timestamp;
> +	}
> +
> +	igt_info("common time frame: [%lu;%lu] %.2fms\n",
> +		 common_start, common_end, (common_end - common_start) / 1e6);
> +
> +	if (igt_warn_on_f(common_end <= common_start, "No common time frame for all sets found\n"))
> +		return;
> +
> +	/* Compute concurrent_rate for each sample set within the common time frame */
> +	for (i = 0; i < ndata; i++) {
> +		uint64_t total_samples_duration = 0;
> +		uint64_t samples_duration_in_common_frame = 0;
> +
> +		stats = &data[i].stats;
> +		stats->concurrent_execs = 0;
> +		stats->concurrent_rate = 0.0;
> +		stats->concurrent_mean = 0.0;
> +
> +		for (j = 0; j < stats->samples.n_values; j++) {
> +			uint64_t sample_start = stats->start_timestamp + total_samples_duration;
> +			uint64_t sample_end = sample_start + stats->samples.values_u64[j];
> +
> +			if (sample_start >= common_start &&
> +			    sample_end <= common_end) {
> +				stats->concurrent_execs++;
> +				samples_duration_in_common_frame +=
> +					stats->samples.values_u64[j];
> +			}
> +
> +			total_samples_duration += stats->samples.values_u64[j];
> +		}
> +
> +		stats->concurrent_rate = samples_duration_in_common_frame ?
> +				     (double)stats->concurrent_execs /
> +					     (samples_duration_in_common_frame *
> +					      1e-9) :
> +				     0.0;
> +		stats->concurrent_mean = stats->concurrent_execs ?
> +				      (double)samples_duration_in_common_frame /
> +					      stats->concurrent_execs :
> +				      0.0;
> +		igt_info("[%s] Throughput = %.4f execs/s mean duration=%.4fms nsamples=%d\n",
> +			 data[i].subm.id, stats->concurrent_rate, stats->concurrent_mean * 1e-6,
> +			 stats->concurrent_execs);
> +	}
> +}
> +
> +static void log_sample_values(char *id, struct subm_stats *stats,
> +			      double comparison_mean, double outlier_treshold)
> +{
> +	const uint64_t *values = stats->samples.values_u64;
> +	unsigned int n = stats->samples.n_values;
> +	char buffer[2048];
> +	char *p = buffer, *pend = buffer + sizeof(buffer);
> +	unsigned int i;
> +	const unsigned int edge_items = 3;
> +	bool is_outlier;
> +	double tolerance = outlier_treshold * comparison_mean;
> +
> +	p += snprintf(p, pend - p,
> +		      "[%s] start=%f end=%f nsamples=%u comparison_mean=%.2fms\n",
> +		      id, stats->start_timestamp * 1e-9, stats->end_timestamp * 1e-9, n,
> +		      comparison_mean * 1e-6);
> +
> +	for (i = 0; i < n && p < pend; ++i) {
> +		is_outlier = fabs(values[i] - comparison_mean) > tolerance;
> +
> +		if (n <= 2 * edge_items || i < edge_items ||
> +		    i >= n - edge_items || is_outlier) {
> +			if (is_outlier) {
> +				double pct_diff =
> +					100 *
> +					(comparison_mean ?
> +						 (values[i] - comparison_mean) /
> +							 comparison_mean :
> +						 1.0);
> +
> +				p += snprintf(p, pend - p,
> +					      "%0.2f @%d Pct Diff %0.2f%%\n",
> +					      values[i] * 1e-6, i,
> +					      pct_diff);
> +			} else {
> +				p += snprintf(p, pend - p, "%0.2f\n",
> +					      values[i] * 1e-6);
> +			}
> +		}
> +
> +		if (i == edge_items && n > 2 * edge_items)
> +			p += snprintf(p, pend - p, "...\n");
> +	}
> +
> +	igt_debug("%s\n", buffer);
> +}
> +
> +#define MIN_NUM_REPEATS 25
> +#define MIN_EXEC_QUANTUM_MS 8
> +#define MAX_EXEC_QUANTUM_MS 32
> +#define MIN_JOB_DURATION_MS 16
> +#define JOB_TIMEOUT_MS 5000
> +#define MAX_TOTAL_DURATION_MS 15000
> +#define PREFERRED_TOTAL_DURATION_MS 10000
> +#define MAX_PREFERRED_REPEATS 100
> +
> +struct job_sched_params {
> +	int duration_ms;
> +	int num_repeats;
> +	struct vf_sched_params sched_params;
> +};
> +
> +static uint32_t derive_preempt_timeout_us(const uint32_t exec_quantum_ms)
> +{
> +	return exec_quantum_ms * 2 * USEC_PER_MSEC;
> +}
> +
> +static int calculate_job_duration_ms(int execution_ms)
> +{
> +	return execution_ms * 2 > MIN_JOB_DURATION_MS ? execution_ms * 2 :
> +							MIN_JOB_DURATION_MS;
> +}
> +
> +static bool compute_max_exec_quantum_ms(uint32_t *exec_quantum_ms,
> +					int num_threads,
> +					int min_num_repeats,
> +					int job_timeout_ms)
> +{
> +	for (int test_execution_ms = MAX_EXEC_QUANTUM_MS;
> +	     test_execution_ms >= MIN_EXEC_QUANTUM_MS; test_execution_ms--) {
> +		int test_duration_ms =
> +			calculate_job_duration_ms(test_execution_ms);
> +		int max_delay_ms = (num_threads - 1) * test_execution_ms;
> +
> +		/*
> +		 * Check if the job can complete within job_timeout_ms,
> +		 * including the maximum scheduling delay
> +		 */
> +		if (test_duration_ms + max_delay_ms <= job_timeout_ms) {
> +			int estimated_num_repeats =
> +				MAX_TOTAL_DURATION_MS /
> +				(num_threads * test_duration_ms);
> +
> +			if (estimated_num_repeats >= min_num_repeats) {
> +				*exec_quantum_ms = test_execution_ms;
> +				return true;
> +			}
> +		}
> +	}
> +	return false;
> +}
> +
> +static int adjust_num_repeats(int duration_ms, int num_threads)
> +{
> +	int preferred_max_repeats = PREFERRED_TOTAL_DURATION_MS /
> +				    (num_threads * duration_ms);
> +	int optimal_repeats = min(preferred_max_repeats, MAX_PREFERRED_REPEATS);
> +
> +	return max(optimal_repeats, MIN_NUM_REPEATS);
> +}
> +
> +static struct vf_sched_params prepare_vf_sched_params(int num_threads,
> +						      int min_num_repeats,
> +						      int job_timeout_ms,
> +						      const struct subm_opts *opts)
> +{
> +	struct vf_sched_params params = { MIN_EXEC_QUANTUM_MS,
> +					  derive_preempt_timeout_us(MIN_EXEC_QUANTUM_MS) };
> +
> +	if (opts->exec_quantum_ms || opts->preempt_timeout_us) {
> +		if (opts->exec_quantum_ms)
> +			params.exec_quantum_ms = opts->exec_quantum_ms;
> +		if (opts->preempt_timeout_us)
> +			params.preempt_timeout_us = opts->preempt_timeout_us;
> +	} else {
> +		if (igt_debug_on(!compute_max_exec_quantum_ms(&params.exec_quantum_ms,
> +							      num_threads,
> +							      min_num_repeats,
> +							      job_timeout_ms)))
> +			return params;
> +
> +		/*
> +		 * After computing a feasible max_exec_quantum_ms,
> +		 * select a random exec_quantum_ms within the new range
> +		 */
> +		params.exec_quantum_ms = MIN_EXEC_QUANTUM_MS +
> +					 rand() % (params.exec_quantum_ms -
> +						   MIN_EXEC_QUANTUM_MS + 1);
> +		params.preempt_timeout_us = derive_preempt_timeout_us(params.exec_quantum_ms);
> +	}
> +
> +	return params;
> +}
> +
> +static struct job_sched_params
> +prepare_job_sched_params(int num_threads, int job_timeout_ms, const struct subm_opts *opts)
> +{
> +	struct job_sched_params params = { };
> +
> +	params.sched_params = prepare_vf_sched_params(num_threads, MIN_NUM_REPEATS,
> +						      job_timeout_ms, opts);
> +	params.duration_ms = calculate_job_duration_ms(params.sched_params.exec_quantum_ms);
> +	params.num_repeats = adjust_num_repeats(params.duration_ms, num_threads);
> +
> +	return params;
> +}
> +
> +/**
> + * SUBTEST: equal-throughput
> + * Description:
> + *   Check all VFs with same scheduling settings running same workload
> + *   achieve the same throughput.
> + */
> +static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opts)
> +{
> +	struct subm_set set_ = {}, *set = &set_;
> +	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
> +									    JOB_TIMEOUT_MS,
> +									    opts);
> +
> +	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d\n",
> +		 job_sched_params.sched_params.exec_quantum_ms,
> +		 job_sched_params.sched_params.preempt_timeout_us,
> +		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> +		 num_vfs + 1);
> +
> +	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
> +		    &(struct init_vf_ids_opts){ .shuffle = true,
> +						.shuffle_pf = true });
> +	xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	/* enable VFs */
> +	igt_sriov_disable_driver_autoprobe(pf_fd);
> +	igt_sriov_enable_vfs(pf_fd, num_vfs);
> +	/* set scheduling params (PF and VFs) */
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &job_sched_params.sched_params);
> +	/* probe VFs */
> +	igt_sriov_enable_driver_autoprobe(pf_fd);
> +	for (int vf = 1; vf <= num_vfs; ++vf)
> +		igt_sriov_bind_vf_drm_driver(pf_fd, vf);
> +
> +	/* init subm_set */
> +	subm_set_alloc_data(set, num_vfs + 1 /*PF*/);
> +	subm_set_init_sync_method(set, opts->sync_method);
> +
> +	for (int n = 0; n < set->ndata; ++n) {
> +		int vf_fd =
> +			vf_ids[n] ?
> +				igt_sriov_open_vf_drm_device(pf_fd, vf_ids[n]) :
> +				drm_reopen_driver(pf_fd);
> +
> +		igt_assert_fd(vf_fd);
> +		set->data[n].opts = opts;
> +		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> +			  xe_engine(vf_fd, 0)->instance);
> +		subm_workload_init(&set->data[n].subm,
> +				   &(struct subm_work_desc){
> +					.duration_ms = job_sched_params.duration_ms,
> +					.preempt = true,
> +					.repeats = job_sched_params.num_repeats });
> +		igt_stats_init_with_size(&set->data[n].stats.samples,
> +					 set->data[n].subm.work.repeats);
> +		if (set->sync_method == SYNC_BARRIER)
> +			set->data[n].barrier = &set->barrier;
> +	}
> +
> +	/* dispatch spinners, wait for results */
> +	subm_set_dispatch_and_wait_threads(set);
> +
> +	/* verify results */
> +	compute_common_time_frame_stats(set);
> +	for (int n = 0; n < set->ndata; ++n) {
> +		struct subm_stats *stats = &set->data[n].stats;
> +		const double ref_rate = set->data[0].stats.concurrent_rate;
> +
> +		igt_assert_eq(0, stats->num_early_finish);
> +		if (!check_within_epsilon(stats->concurrent_rate, ref_rate,
> +					  opts->outlier_treshold)) {
> +			log_sample_values(set->data[0].subm.id,
> +					  &set->data[0].stats,
> +					  set->data[0].stats.concurrent_mean,
> +					  opts->outlier_treshold);
> +			log_sample_values(set->data[n].subm.id, stats,
> +					  set->data[0].stats.concurrent_mean,
> +					  opts->outlier_treshold);
> +			igt_assert_f(false,
> +				     "Throughput=%.3f execs/s not within +-%.0f%% of expected=%.3f execs/s\n",
> +				     stats->concurrent_rate,
> +				     opts->outlier_treshold * 100, ref_rate);
> +		}
> +	}
> +
> +	/* cleanup */
> +	subm_set_fini(set);
> +	set_vfs_scheduling_params(pf_fd, num_vfs, &(struct vf_sched_params){});
> +	igt_sriov_disable_vfs(pf_fd);
> +}
> +
> +static struct subm_opts subm_opts = {
> +	.sync_method = SYNC_BARRIER,
> +	.outlier_treshold = 0.1,
> +};
> +
> +static bool extended_scope;
> +
> +static int subm_opts_handler(int opt, int opt_index, void *data)
> +{
> +	switch (opt) {
> +	case 'e':
> +		extended_scope = true;
> +		break;
> +	case 's':
> +		subm_opts.sync_method = atoi(optarg);
> +		igt_info("Sync method: %d\n", subm_opts.sync_method);
> +		break;
> +	case 'q':
> +		subm_opts.exec_quantum_ms = atoi(optarg);
> +		igt_info("Execution quantum ms: %u\n", subm_opts.exec_quantum_ms);
> +		break;
> +	case 'p':
> +		subm_opts.preempt_timeout_us = atoi(optarg);
> +		igt_info("Preempt timeout us: %u\n", subm_opts.preempt_timeout_us);
> +		break;
> +	case 't':
> +		subm_opts.outlier_treshold = atoi(optarg) / 100.0;
> +		igt_info("Outlier threshold: %.2f\n", subm_opts.outlier_treshold);
> +		break;
> +	default:
> +		return IGT_OPT_HANDLER_ERROR;
> +	}
> +
> +	return IGT_OPT_HANDLER_SUCCESS;
> +}
> +
> +static const struct option long_opts[] = {
> +	{ .name = "extended", .has_arg = false, .val = 'e', },
> +	{ .name = "sync", .has_arg = true, .val = 's', },
> +	{ .name = "threshold", .has_arg = true, .val = 't', },
> +	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
> +	{ .name = "pt_us", .has_arg = true, .val = 'p', },
> +	{}
> +};
> +
> +static const char help_str[] =
> +	"  --extended\tRun the extended test scope\n"
> +	"  --sync\tThreads synchronization method: 0 - none 1 - barrier (Default 1)\n"
> +	"  --threshold\tSample outlier threshold (Default 0.1)\n"
> +	"  --eq_ms\texec_quantum_ms\n"
> +	"  --pt_us\tpreempt_timeout_us\n";
> +
> +igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
> +{
> +	int pf_fd;
> +	bool autoprobe;
> +
> +	igt_fixture {
> +		pf_fd = drm_open_driver(DRIVER_XE);
> +		igt_require(igt_sriov_is_pf(pf_fd));
> +		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
> +		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
> +		xe_sriov_require_default_scheduling_attributes(pf_fd);
> +	}
> +
> +	igt_describe("Check VFs achieve equal throughput");
> +	igt_subtest_with_dynamic("equal-throughput") {
> +		if (extended_scope)
> +			for_each_sriov_num_vfs(pf_fd, vf)
> +				igt_dynamic_f("numvfs-%d", vf)
> +					throughput_ratio(pf_fd, vf, &subm_opts);
> +
> +		for_random_sriov_vf(pf_fd, vf)
> +			igt_dynamic("numvfs-random")
> +				throughput_ratio(pf_fd, vf, &subm_opts);
> +	}
> +
> +	igt_fixture {
> +		set_vfs_scheduling_params(pf_fd, igt_sriov_get_total_vfs(pf_fd),
> +					  &(struct vf_sched_params){});
> +		igt_sriov_disable_vfs(pf_fd);
> +		/* abort to avoid execution of next tests with enabled VFs */
> +		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0,
> +			       "Failed to disable VF(s)");
> +		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
> +			    igt_sriov_disable_driver_autoprobe(pf_fd);
> +		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
> +			       "Failed to restore sriov_drivers_autoprobe value\n");
> +		drm_close_driver(pf_fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 33dffad31..c8868d5ab 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -318,6 +318,7 @@ intel_xe_progs = [
>   	'xe_spin_batch',
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
> +	'xe_sriov_scheduling',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',
