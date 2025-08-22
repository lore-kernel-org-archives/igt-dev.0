Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D141CA0EEB
	for <igt-dev@archiver.kernel.org>; Fri, 22 Aug 2025 14:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB24B10E12D;
	Fri, 22 Aug 2025 14:00:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWUlQ0Mt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F8110E12D
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Aug 2025 14:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755871200; x=1787407200;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9g7a3ssJ7gXGjQ8+y6wmIoBuoqy9uocBeeQ84k0eKqA=;
 b=dWUlQ0MtBnnT68z2L3ao2ptU5y4uM01aX9LRI9k4Liig6AxF1xEXkVIo
 mTQQBAcX2BQPneW/SOV/05QU4u7dnNFiwYPKROGZGRgtihhCFuypYO72a
 chbFcWXjeBRG4zPS7OYjm2APB3c6o+Eywdi039IKKvWrz6xKMO6LyMS3a
 KQRZWAUng3t3sQfOBpn6BhtQ6elTy0Jonolbthv++XjWAGXm8Ig7ycMNa
 FQkl58kgLhxEoMe2EAaBowm4R5F1Q6Y/cQbzrVwmxIZbSmUKQijDhZfyF
 KEzINovlyvFdfiynVBT3WXf3Cv50eSyX1DddqcgBVPB8psZIZLC/jtK3B Q==;
X-CSE-ConnectionGUID: N7Pd4hOwQyybDjDuq8tHag==
X-CSE-MsgGUID: bjGDhMUVSlq5IomnBLtcqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="75758827"
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="75758827"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:59:58 -0700
X-CSE-ConnectionGUID: jG235pFsRleMr58Av1+7zw==
X-CSE-MsgGUID: SNuVWH61RtWhGlTi/QzsJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,309,1747724400"; d="scan'208";a="168614313"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 06:59:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:59:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Fri, 22 Aug 2025 06:59:57 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 22 Aug 2025 06:59:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwuL5SUzj4Dh6RrMd2KjOtoKQI5gvffAcx1mVSD/zn1hqRhve73VeqHvWRSvicmPfzIKRoF9GXkKpz2/GEgAw0YZge/3oCxlOnSElxmWaH97s8SpecDKsJI6wUnqS9D4Sl3Ywd8/IZiAU299I28BEhdBRSfU7RBrloNy51V4QVw/3Qss5p3E6jPDuGIcldHY76VDZb9X0to8iLvDfwD6QbWrxUXnCbZxafbqD/aW4DqtfBdW0ypcU0YTb+HfDh/AzREMnsmBDiVGvShrb7UQZSeGJR0pFywaFcbQEnGezl85ZmldtOPpecjuAoExRxPus7F/Ck/Q4t14cQRuj749Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGoXlt/vTXoKpdB49BQrQost6SrvGN6+QXSbjx7/iYA=;
 b=UCwzTRbYHxtsS4OFfkaUcQa6w3KSor3jiy1Gsn0+2+6+pXZnWuPFa11tGIXz/gsEtjJ0QtxaELm7ak8cWm1dmlpLg9LfIPTIgiLgPln0WyzM1ZJKc4a17id2gVJbx56mDsSGGdGN3h+l758wpMWOz+DHw94beCpgHbqmHQrcSMrUkejPIIEVKiQIvRSF3EnFy8ZqE3fHdfsmn1rAe4B6xuKI4YM9EZzfyI0TyRINCZRyPFwjlmirvIiut4pGXyT7UCmu+7BirKrT0Rk1eucswz8qQRn19n8HMZH7fM1DRY6yWelwODAusP9S1X3IdLOxI3p/08z71UgALr30ZlrOhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.18; Fri, 22 Aug
 2025 13:59:53 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%6]) with mapi id 15.20.9052.017; Fri, 22 Aug 2025
 13:59:53 +0000
Message-ID: <25388f69-596b-4a08-8c7e-7ec8e8174f83@intel.com>
Date: Fri, 22 Aug 2025 15:59:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 i-g-t 3/3] tests/intel/xe_sriov_scheduling: Make
 in-flight submissions configurable
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Adam Miszczak <adam.miszczak@linux.intel.com>, Jakub Kolakowski
 <jakub1.kolakowski@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20250819165045.467613-1-marcin.bernatowicz@linux.intel.com>
 <20250819165045.467613-4-marcin.bernatowicz@linux.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20250819165045.467613-4-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::27) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SJ0PR11MB7701:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fd64684-81e9-44e1-0afe-08dde1842ae4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkZFWVFUQ240UDFkYm84ZThYSXFXV21nWE5PTmk2eVVLNUNVN09tM3J2MFZl?=
 =?utf-8?B?YkcxcC9GMHMxNi9DWGp5YWY0K3k4WmdvdHFLRmZoK3lnbnNBWk8vb2tHcmdE?=
 =?utf-8?B?Y1ZjQUIzRGtySkZTWlQ5YlNkczNIZ1lLeGxLeTJDSStzTTl1UEFkeE1jcnBY?=
 =?utf-8?B?d0ttTi93UWV5WGVhcnBGRlJJWkdiSzYyWDNLMmE0YVgyak9RdlNBWDlwcDV6?=
 =?utf-8?B?SVY5c1N4b0wrYysxY0RoVWRvVWdZallPeDFBdVhSUGtDRStPTjd1ZWFXeFV4?=
 =?utf-8?B?cThIYzg0Tk96SlNuUE1hTVJCT1pnUU03Ym1zSGdkQWtaTHJtdXV5ZVRYM0c2?=
 =?utf-8?B?WXBmamcvMm96eWlrMXk5OW9YUXhxM0dtSUlWbi9XcHRrOW9sME9EZER3UDEw?=
 =?utf-8?B?dCt4ZktRT2tTb29CZE4zUnNFMkU3NXpLSWxYMHZ3eTdxeFFiQS9LWG4yU1ho?=
 =?utf-8?B?TkNkMXFjU2xWZEZ5YlY4d2xieTAxaEc0VnJidGdxSWllNTNXeVNYN1V0Z05k?=
 =?utf-8?B?czNtK296NUdqaFk3QTJjbUhGQWttTGxxc3IvU3VHTXFyOGVDQ3ViTUtFT1dK?=
 =?utf-8?B?TWJyYVZ4V05RcEJ5dUM2eVNGMVByVlM0R2hUWWQzTUtGbzJjUUF3c1RRU2ZG?=
 =?utf-8?B?YkJabEdFdDBWWHcwRGNZVzF1UUc0MDVseXRQaDlXbFRTa29OS0g0VFFweEhz?=
 =?utf-8?B?SjRBWUhzZnhxWlozeFQ5RWhkdjk3Q2lTMW9xMHZhUVBFaFBjcEszQ2I1c0dn?=
 =?utf-8?B?K2UrMzQ3NUdmTnNTV0FZMHNFdzBjTDI4N2xwU3dmNTVDWU8wMWlsSExlOUZT?=
 =?utf-8?B?UDZBS21xd3JpYThHU1F2bWl5Q1d4ajlxQnBMVkIvTmloZ0ljREpjZnBFMDlO?=
 =?utf-8?B?aDl4UkZ3MGVTWXhxMlovUDZmYzdmQkxkNUx4OFZpd0h6YzhiNlNWUGhCT0RY?=
 =?utf-8?B?RzFnNUlydlVBaFZIWkcyOFFGZmp1eUtmVDlOVENYWnIxeG9rNHpMOHdiNUFM?=
 =?utf-8?B?SHNoUjh5OVBiSmlsbFRzRVRBeHdmL1BrZ2xBZU11LzhiazJwbTlMdUx5Qit2?=
 =?utf-8?B?dXY0V1ZWcG9wOXdXYURwV1ZiZnR0VUFtdDFXRnhvWGZpc1FZRXdyU0hBUFBq?=
 =?utf-8?B?S2FLVVlmNENTVnlnbGVJYjgxOTh3WEkvY0orcGNPeXI5UGpGYWhHdUlrMGdn?=
 =?utf-8?B?anc4T0VKcVp4QS9VdEtxazZtRkNzbHBTNmxteXRSMDhtaWk4SDdtWm9zaVVK?=
 =?utf-8?B?UUJYMlZ4NXpMWHpkZmw5TmNtMmJNcllNY0FEMm85S1hObEtTbXVUdm1PZWdB?=
 =?utf-8?B?ZjgySkdZbWk3L3RHWGkxSklFQlduRFdEZkVxVS8vcTk0WURxY3RjekQrekEy?=
 =?utf-8?B?WjlBUEdmMndvVXZMWFRDWGJKSGpmZXR6eU1mTTV0cUE5SFM3R1k3WkRxdHNF?=
 =?utf-8?B?Vy9GeGJMOGNwaUVLQW9odStYUjlxdVRCZklyWHdadTM0K3owdm1EeXNVZmFT?=
 =?utf-8?B?M0NNZkNyeHJKcmdsSGw2MWZqOUNSYjZnby9JQjR5bHN5b0J1TThpeTFSZEtl?=
 =?utf-8?B?cFRGS0l4K0wwMnFpWCs0V2IrcURHYXVuUXhvSy9JV3ozckZjL3BFMWhkb2VR?=
 =?utf-8?B?amhVY3pkK1Vvb3VHK1NPbmU3V0t3V1NRa2lHRTdMWDNmcEdjV2M0clEzQzd1?=
 =?utf-8?B?TDh6Zlc0Y3V4RHp0NmpGZDZOcnprcG8xQlE1NGNiQS9QZmE2T3l2bVJDQjZM?=
 =?utf-8?B?MTVZT3p4dDRMMWIyb2pkSzdZL0Q5dUE0TjU5WnVjU0s1MGtpTGowbklQZHZE?=
 =?utf-8?B?OGJObWl6SkF3UWczYkhCeEhFOW1GWG9IczVHVW9Xa21kZ0NuYklIaVlKamxD?=
 =?utf-8?B?Qm51cWlZYlJIb2JZR2NJZ0V2aTdDdUE5U2hzb0syaWlmSkxVTFlLaEM5dGUx?=
 =?utf-8?Q?71tKaOoh8mw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUNDTFFBZkdGZmV6ZFJOY05tVkVvbDdGby82cEFPY2hSWWw2eEtqclA5Tis5?=
 =?utf-8?B?Sm5JTmI1RGZYZmQrMU1OR1RIcDlidUtOOXlqUjB5Z1k4VXIxZmpaNmxlVkQ3?=
 =?utf-8?B?SFR2Q3RiNTRabmpHNHNCRENQV2daUlVjeUxMRHpmY0tHN2NvVWlpZ2M1NEta?=
 =?utf-8?B?cTFSaWZmdUczOFZJemlaNEFyRzRvZlFjVzdRTmJJdktUNUYyWG40eXJFQ1BH?=
 =?utf-8?B?Y3BPS200OTF0aWc5WHJ1azFkdHVDR1VtbWxIcmt4QmtUb1RwOGxMODdjTC9P?=
 =?utf-8?B?TVNtZU5ISno2MGFncng4L1lCcUZQZXNhZkk2eGRhM2hLTmlMNEF4VnAvMnEy?=
 =?utf-8?B?WjZKeXp4VkFLSExoU0ZLNVl0VC9ZeGhISkhyWWp6b3BEd1BKNmpVYTJxVkFp?=
 =?utf-8?B?dmE2KzQvcmFhV2Y1UjRmUjZ4M0VycUE1L05QUWVzV2ZJbzc3eEhkb20zM2hp?=
 =?utf-8?B?Slp1a3F6TVFQQW5hWGdlRzBOY0pJbXBGdGxZSEd5Rk5iOVJUUnZSSnozZzRp?=
 =?utf-8?B?aUE1YmVnSk12UFduS3Z2V2ZUOEFaR3lqdlZicXBaSUhLMlBBdWdjb1ZzaUEv?=
 =?utf-8?B?RGZNS2FYQ2NMNVJ2bEpiekRvRHpxL2N5em85dm5EZXpDUXYzTTdBNmgwdUxy?=
 =?utf-8?B?bzFBYWZpRDVDNDc4Qi9uNldiN0dsOERJN1hGRzZ0RUR6Y0RUNDVzWGpaQjBy?=
 =?utf-8?B?akFCOHpmMDlyOVdHWXdWMzIwNzFSK0pnZVN4eXNZaHFsOVNRTXB2ekJlbStq?=
 =?utf-8?B?QmoyM1B3dWMxRDM3SWcrM3hWcUtVbElrYVJUZVM2NGN3bjZGU05BNlNhT3I4?=
 =?utf-8?B?MmhrZDFYZXFnbk9uaEkrRTJGNjFvb1hUcFllTkNIZ0VKVnQ1bDU5aFZCN2hi?=
 =?utf-8?B?UDRMdmtWZUxVOXhOaldwYzUzRFErc0o5QXBDR1grNFNnV1JoWnJoeFBuYTJr?=
 =?utf-8?B?dWE3TG13TllBWGxEVHplYVlpc053L2FGc0t6Uko5RExxYUVCa0MxTVdiTDFx?=
 =?utf-8?B?NitFT0VUUjJldjRSa0l1ZXlOVmZwVlpyTVZOa2kxYTBmdUU1NnJUNWpTQ2pV?=
 =?utf-8?B?b004Y1F4TFlBemQwSkRqVU0yNlh1WGxRcFNBbEpYSmxoclZqMVREREtXYm1l?=
 =?utf-8?B?TVVXWU0xVDdqdzdEMjErM0ZFcWdNbXJqTDUvdFl5bE1UZ254OEU4WEwvMkVK?=
 =?utf-8?B?TUlmeUtqOElzMVVDZjI2bnhNcjFDV0xMSXZkQ2dzSWw3NUJmWGlpNGl4aFZs?=
 =?utf-8?B?TXlYSFhSTndBUy9TdW5IL0l1RWRZWXJXblR3MlZ6VWl5Q1hhcHVtWUdRajBD?=
 =?utf-8?B?bnRTbU9ncFpJeC9jWFpkbGMyZnZQQVFhVW5NaWFLK2FrZ01DbUhMYmJHV1RM?=
 =?utf-8?B?WXhuOGhtdHFoMXR5d2pqNEVYZ3lhMjhPTHNHVkN2V3c4dC9LS1g1ZXhNaE1V?=
 =?utf-8?B?WThpUDIxWEdXb3JFTnc2Q3BydEJNR3FMWDVkOFJzYUpGTFNqYnFldGhlUUlk?=
 =?utf-8?B?Rmk2M2M5VTZNZTBvZkJ2VkZBNU56MHludm5CUUF1Z05kWFd3NHBvSzEvbmxy?=
 =?utf-8?B?OEtIQlZiNTQ2d0FBOHEzV2NNUnhqM2IzaVppajh2ZXp6c3BVRjYwS0tpRjVi?=
 =?utf-8?B?QkJtRWVSa29PUzdvaldiMkNhMjEyaGVzY1VmQXh3MWV0TEpDeDNlTjdLQmxG?=
 =?utf-8?B?cGFLZVVveXUxZm84ME1zZHR1NDRWQ0YxVlFGOXg4M0o0V2lCZU53UzZQTUxx?=
 =?utf-8?B?WUZ0ejdNN3pkYVlCaEwvUVVOaGRvWWRxWXVzS2hVbkx1aU1PZkhVWjRpdGlv?=
 =?utf-8?B?QXJtVHdreFQwTzJiOCs5R0YrTGk5VU4wZnlSeDNpWjhQRkI1MlJlZFQySDNT?=
 =?utf-8?B?MG83UjlxbmtPQnNDOVhrY0plSHdleGRBQnYxSWcrUHRhMk1HVTNlVlFTc2JF?=
 =?utf-8?B?YTJKN3c4cm5MUnhPNTQ1WktxQWtGV0NOWDJKS2x5dDczcUFxMFdxc0RVMnN0?=
 =?utf-8?B?MGFaaTgyU3ZINm9UMDhzdk5DRDVHM2xaZTBOeEpQbGJ0K0M0SkNqRU5KQTBK?=
 =?utf-8?B?T1ZETGZXUnZZVUk1bEVPRTloeXhjSlZtY0piWXMzQ08vNjlpWS9hL1U1QmlS?=
 =?utf-8?B?aGhsMjdEcHMxMEtnNklWajFvaTZlb2x3TDAvaTl5TUdBOGI1SGE0TDdTL1lY?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd64684-81e9-44e1-0afe-08dde1842ae4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 13:59:53.0304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q/KVjranjtcxKdttTGbdKt78KWzmhXudt5CN2BpVWfWuqRN/E5cyzjcJtzDhU6792G6T1gVwD/3DcoWZvzgwgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
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


On 8/19/2025 18:50, Marcin Bernatowicz wrote:
> Allow controlling (or auto-selecting) the number of concurrent
> submissions per VF to better saturate hardware, especially for short
> jobs.
>
> - Add --inflight option; 0 = auto (default), >=1 = explicit K.
> - Select K via a small heuristic (non-preempt: 1; <=12ms: 4; <=20ms: 3;
>    else 2).
> - Plumb K into subm_init() and print inflight=K in the banner.
> - Relax minimums to support short jobs: MIN_EXEC_QUANTUM_MS=1,
>    MIN_JOB_DURATION_MS=2.
> - Update CLI parsing and help text.
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>   tests/intel/xe_sriov_scheduling.c | 55 ++++++++++++++++++++++++++-----
>   1 file changed, 46 insertions(+), 9 deletions(-)
>
> diff --git a/tests/intel/xe_sriov_scheduling.c b/tests/intel/xe_sriov_scheduling.c
> index 97263cbd2..2fc78f570 100644
> --- a/tests/intel/xe_sriov_scheduling.c
> +++ b/tests/intel/xe_sriov_scheduling.c
> @@ -27,6 +27,8 @@ struct subm_opts {
>   	uint32_t exec_quantum_ms;
>   	uint32_t preempt_timeout_us;
>   	double outlier_treshold;
> +	/* --inflight=0 => auto; >=1 => explicit K */
> +	unsigned int inflight;
>   };
>   
>   struct subm_work_desc {
> @@ -496,9 +498,9 @@ static void log_sample_values(char *id, struct subm_stats *stats,
>   }
>   
>   #define MIN_NUM_REPEATS 25
> -#define MIN_EXEC_QUANTUM_MS 8
> +#define MIN_EXEC_QUANTUM_MS 1
>   #define MAX_EXEC_QUANTUM_MS 32
> -#define MIN_JOB_DURATION_MS 16
> +#define MIN_JOB_DURATION_MS 2
>   #define MAX_TOTAL_DURATION_MS 15000
>   #define PREFERRED_TOTAL_DURATION_MS 10000
>   #define MAX_PREFERRED_REPEATS 100
> @@ -570,6 +572,25 @@ static int adjust_num_repeats(int duration_ms, int num_threads)
>   	return max(optimal_repeats, MIN_NUM_REPEATS);
>   }
>   
> +/* inflight K selection:
> + *   user_k == 0  => auto
> + *   user_k >= 1  => explicit K
> + */
> +static unsigned int select_inflight_k(unsigned int duration_ms,
> +				      unsigned int user_k,
> +				      bool nonpreempt)
> +{
> +	if (user_k)
> +		return user_k >= 1 ? user_k : 1;
> +	if (nonpreempt)
> +		return 1;
> +	if (duration_ms <= 12)
> +		return 4;
> +	if (duration_ms <= 20)
> +		return 3;
> +	return 2;
> +}
> +
>   static struct vf_sched_params prepare_vf_sched_params(int num_threads,
>   						      int min_num_repeats,
>   						      int job_timeout_ms,
> @@ -630,12 +651,14 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   	struct job_sched_params job_sched_params = prepare_job_sched_params(num_vfs + 1,
>   									    job_timeout_ms,
>   									    opts);
> +	const unsigned int k = select_inflight_k(job_sched_params.duration_ms,
> +						 opts->inflight, false);
>   
> -	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%ums repeats=%d inflight=%u num_vfs=%d job_timeout=%ums\n",
>   		 job_sched_params.sched_params.exec_quantum_ms,
>   		 job_sched_params.sched_params.preempt_timeout_us,
>   		 job_sched_params.duration_ms, job_sched_params.num_repeats,
> -		 num_vfs + 1, job_timeout_ms);
> +		 k, num_vfs + 1, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>   		    &(struct init_vf_ids_opts){ .shuffle = true,
> @@ -664,7 +687,7 @@ static void throughput_ratio(int pf_fd, int num_vfs, const struct subm_opts *opt
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance, 1);
> +			  xe_engine(vf_fd, 0)->instance, k);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = job_sched_params.duration_ms,
> @@ -729,10 +752,11 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   			       vf_sched_params.preempt_timeout_us / USEC_PER_MSEC;
>   	int preemptible_end = 1;
>   	uint8_t vf_ids[num_vfs + 1 /*PF*/];
> +	const unsigned int k = select_inflight_k(duration_ms, opts->inflight, true);
>   
> -	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms num_vfs=%d job_timeout=%ums\n",
> +	igt_info("eq=%ums pt=%uus duration=%" PRIu64 "ms inflight=%u num_vfs=%d job_timeout=%ums\n",
>   		 vf_sched_params.exec_quantum_ms, vf_sched_params.preempt_timeout_us,
> -		 duration_ms, num_vfs, job_timeout_ms);
> +		 duration_ms, k, num_vfs, job_timeout_ms);
>   
>   	init_vf_ids(vf_ids, ARRAY_SIZE(vf_ids),
>   		    &(struct init_vf_ids_opts){ .shuffle = true,
> @@ -761,7 +785,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   		igt_assert_fd(vf_fd);
>   		set->data[n].opts = opts;
>   		subm_init(&set->data[n].subm, vf_fd, vf_ids[n], 0,
> -			  xe_engine(vf_fd, 0)->instance, 1);
> +			  xe_engine(vf_fd, 0)->instance, k);
>   		subm_workload_init(&set->data[n].subm,
>   				   &(struct subm_work_desc){
>   					.duration_ms = duration_ms,
> @@ -799,6 +823,7 @@ static void nonpreempt_engine_resets(int pf_fd, int num_vfs,
>   static struct subm_opts subm_opts = {
>   	.sync_method = SYNC_BARRIER,
>   	.outlier_treshold = 0.1,
> +	.inflight = 0,
>   };
>   
>   static bool extended_scope;
> @@ -825,6 +850,16 @@ static int subm_opts_handler(int opt, int opt_index, void *data)
>   		subm_opts.outlier_treshold = atoi(optarg) / 100.0;
>   		igt_info("Outlier threshold: %.2f\n", subm_opts.outlier_treshold);
>   		break;
> +	case 'i': {
> +		int val = atoi(optarg);
> +
> +		subm_opts.inflight = val > 0 ? val : 0;
> +		if (subm_opts.inflight)
> +			igt_info("In-flight submissions: %u\n", subm_opts.inflight);
> +		else
> +			igt_info("In-flight submissions: auto (0)\n");
> +		break;
> +	}
>   	default:
>   		return IGT_OPT_HANDLER_ERROR;
>   	}
> @@ -838,6 +873,7 @@ static const struct option long_opts[] = {
>   	{ .name = "threshold", .has_arg = true, .val = 't', },
>   	{ .name = "eq_ms", .has_arg = true, .val = 'q', },
>   	{ .name = "pt_us", .has_arg = true, .val = 'p', },
> +	{ .name = "inflight", .has_arg = true, .val = 'i', },
>   	{}
>   };
>   
> @@ -846,7 +882,8 @@ static const char help_str[] =
>   	"  --sync\tThreads synchronization method: 0 - none 1 - barrier (Default 1)\n"
>   	"  --threshold\tSample outlier threshold (Default 0.1)\n"
>   	"  --eq_ms\texec_quantum_ms\n"
> -	"  --pt_us\tpreempt_timeout_us\n";
> +	"  --pt_us\tpreempt_timeout_us\n"
> +	"  --inflight\tNumber of submissions kept in flight per VF (0=auto)\n";
>   
>   igt_main_args("", long_opts, help_str, subm_opts_handler, NULL)
>   {
