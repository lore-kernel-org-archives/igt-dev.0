Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 834F8C10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 09:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE7961124CE;
	Tue,  7 May 2024 09:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKMB9azi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607EE10F41E
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 09:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715074990; x=1746610990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pWMqlGAI+5PFgOnrIcK2jrhdtAfjXmYEL0FbiMem5RA=;
 b=gKMB9aziwf4NmHwmuLddAXXjaKJIpyifZ1udXcSIrZhLAiDM/KqtY1cu
 UDg4YNzI1GUjbBLqUVsnf7vtZFOdNlkQfV+cpeRCwVKDBY2o/vRWX50Y4
 H/qHtDU5iJYOvI7Qmtxth9jW0Sfvm6Ch1jmjYvsh+eavfLRnq2ykuRYiM
 7drFQZ9Lp4oR7OTF1/Uz8PjQQkmBJHNajVUSb92cfBTl4iJyXi9TX1zEk
 npxI2d3DbEUWuDIIpA4oBYVHaaL6xhS+aVCzxALVmU/UKz4opPQMUSJjA
 J+tcLsqm0TsdIXF8hno1r/v7AmQIM9qfGq0TS06veNSSkXKmWoeSBYgk0 A==;
X-CSE-ConnectionGUID: P8mfELWFT1a+s+GYWKP2qQ==
X-CSE-MsgGUID: HpT6TPZNS6WVkx+84QRkPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28330559"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="28330559"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 02:43:10 -0700
X-CSE-ConnectionGUID: wPob02AoTde4g8VGyeldmw==
X-CSE-MsgGUID: L681YRdCS1WnL4ETRXD9bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33030409"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 May 2024 02:43:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 7 May 2024 02:43:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 7 May 2024 02:43:09 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 7 May 2024 02:43:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BvUUiYw6JoglUPuOelJmphJPERPWlJNWVkI8ixHwq1n/Bw6wUDRmjmm6EYsfV3Wra6ijo1QBT0mEc7TLMT3Xu8bbSjpjuUnLag4ytdqcmsuwLUcQyZgUUpNKTgfbuFWXTiTLkGx9YNHKg3fgXHRW1uPiYgXfdhFwZ727zpsHBmCkfX298DYSX8exU+JA3f9ExAc2SRn1hL3dQ4L9fy3U2ubY4zNAPQE3bDs2aaOj8ZEbbkTmPxKfSrNVvL6CxbJqvIdXEWKNnhmfk1273awn2ypKGoJR4BCtVWSI5koEJ3ls1itE5wg0iwndhLogVv9tD8VZpBybIXWQ58wbjr6Kxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a9QFGg3i3ZuDFmQz6UOW0uOgH3gLIe4OOndrZxOWyfs=;
 b=aBPPBp8FdgFqOymFWpxs5h4VWkVWbJ8IFW7tsXmeJgbHzdj1K6ysV5V+JfGi5vNm/xAfZ238qwl3IhmeWwoQdORmb+55vx8OUcmkYpRp65QaE0XRtNG/fNlpTNVbugixN7whVUA0caUb2+rKwp3Y5Po4C5KP1oY0aTuRWMbh8q7yjzvWAkAvmeiZkUMjXVjTbPMZ/SJKX9qr3dmAlb/gXPuQYivpj8Wf4a/SUV0acWEt2bgeDdK9AZo8dOZn+DH+Mx6fDRhEn9JS/FohFpd1JGqnoglIK40992hBnNgvQklEyfvxJNUAlUQbKiOTbC4gnDQwIdCIVy9Td48RZ2DxZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.43; Tue, 7 May
 2024 09:43:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%3]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 09:43:06 +0000
Message-ID: <0426a690-7c73-435c-b264-bac5422c9caf@intel.com>
Date: Tue, 7 May 2024 15:12:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/intel/xe_pm: Add mocs runtime suspend
 resume test
To: <janga.rahul.kumar@intel.com>, <igt-dev@lists.freedesktop.org>,
 <ramadevi.gandi@intel.com>
CC: <matthew.d.roper@intel.com>
References: <20240504130458.2102132-1-janga.rahul.kumar@intel.com>
 <20240504130458.2102132-3-janga.rahul.kumar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240504130458.2102132-3-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1P287CA0019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::30) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: d52d77d7-f400-4f87-eb73-08dc6e7a18a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azJINUFWS2dVelJyWVBLOEo1bmNjSzlIZFRKMndWWUtjb3lRUzNIQ2ZROXJK?=
 =?utf-8?B?cmxSV0g3OTFsZ3RnMm96aXpqem8raU9hYWZtM0ZkdXlZS1lMN1czeDVMeHFO?=
 =?utf-8?B?bGo1QWk3WEp3dytwM0ZqRjdXRWhnTW02NFVMMFJXdkhUMXdQUVdSOExLSWtV?=
 =?utf-8?B?aFBPNE5JOHI5Qmo0cnRFNm93VnpwMkxwVEk3cEl2TS9jdnM0Q0pDcXRWQjdV?=
 =?utf-8?B?RnA3MDExeWJqMXZzc3UzaGh0VVFORkc1UUhWeGlWbUlpNTB1T2FNS2JSZlhx?=
 =?utf-8?B?cFNJLzdTc2NxcmMxY1BzeElqdko4L3lIdlUvZUg0MzBnUWRrUXk2SHFmZXJC?=
 =?utf-8?B?WStQb0EwMmV6cnhtYUU3enl5c2FHcENFdmROM2toUzJvRjlVN3NndnhWV1FJ?=
 =?utf-8?B?MjJ6QmpZMlMrbFBKQ0NWU1A2TVpycHdUckt3azZLYmJaVjk5aWEzb25YNkJQ?=
 =?utf-8?B?b3BiODRQWXhrd2JCREVEdjVuSk44cEQwT3hNSTcxV3ZBZWJ1R2dZNFlFdzIw?=
 =?utf-8?B?b0VCZjYyeEJyZ2RiU1dETWd0c2VNYlpIL3lobVgvWU5aYk1Gc3FiUnNPdkpE?=
 =?utf-8?B?WEhkejZiZjZxOXVxalF5MC8rbG5Zb1ROaGdMZzd4eVJNNGFOdU9CSjhHSnBE?=
 =?utf-8?B?STVCdzlEWkdrblRVYXVGbWpmaVhsVVNGWVF0MWNrckZCQysvellKUnUvaUdS?=
 =?utf-8?B?SDdmMk1sMEJwQ1hVSzh1MWRtU213S1BBSUtCbCtLMXo5UHdGbDcxaldHN2Iw?=
 =?utf-8?B?NmhWZDBaS0t6T0t4YWplVmlFR056ZjJXZ3FqNWEzeVJENkUrcVUvNFFKQXEx?=
 =?utf-8?B?WTNQMDhuTTc3Q21LbS9iYTZVRmJhYXJWTTVEZVAzNDgzY3R2VWlYZFZVNVF2?=
 =?utf-8?B?RSt0VE1XQWNnc0IyMzhIak1KR1dTeFFiRGovNVpCTFJiaHZaKzBHTm81cWhH?=
 =?utf-8?B?SXhHcDVyd25TditQUko2cTUvcndIUENWdGIvazhtd1lrWmk2SU5SRk5wZjVY?=
 =?utf-8?B?M05kK3BWMGI5ZFhYd2xvL042dUdxRk9QdkxHZDhicFpJRVdUU1BsTzVkdzFU?=
 =?utf-8?B?MW81NXhQZGhOZHJBSGpFaGU2OXhTSnRjQjIwUnNWbTFySEFTbGN3Wk95ZkZa?=
 =?utf-8?B?cGk3bXlLWW5SQklsdHVGeU5KUzYrbVhEQzI1YlRET0t2KzY0Z041ckthVmdJ?=
 =?utf-8?B?K3ZJQUl4cWtpRTc5ajBFbjZXRVlOY3UrWE03T3NlejEvRmp1Z0tSUjdQNWlh?=
 =?utf-8?B?TXphOG5OMzNlS1Q5RlcvbDFLWkhxU0V4QXlCOE41TVp0Y0dQNTEzYXNxeURQ?=
 =?utf-8?B?VTh0dkdERGJGdnlrSXJmSGEva2Rkclp1WlVUZU80TG10WGxCLzY4RVMyWU45?=
 =?utf-8?B?TVdwNVlPbmswOVN1TVYrMWpiaTFMelk3ZGxpaXBPTkhFYjBybzZzVjVxSElt?=
 =?utf-8?B?SmhLY2ZHTUhLLzhaYUFtWk42TlR6eGtzdzYrTTlQTklmbkEvZENzejBrSXZ4?=
 =?utf-8?B?ZDhnQktCN3JmZDJrK3BoaElxcnhoL0M2RU9IV0NvR2VnUllxVjEyc0R0Mm9r?=
 =?utf-8?B?RndzMldIUTN2Y2U3TGF0dU9MUkdrc0JTaFBNN0FWT2ZTTGVLc1BYV0p1WUcz?=
 =?utf-8?B?WGhnTnJKK2FtTWZiTnpFWU11TXgvR1VFd2I3ekc0bnJNR1RFVGt1c1V6ZVJS?=
 =?utf-8?B?QzU4cUhHbkJrQlF5Nms3andEUFVKN2ZRdFM0bWF1UDNhQTJRTXZGaHRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDhmN1pmN1NydGYrVytsOVBnTnFqYlVzVHlua1B4V25RRlVtNXZsdlJOeE1N?=
 =?utf-8?B?NU1DOHJwT0NVTGJ6YXVqYW9XOUF0c2xIYkNjdkVTUzBvWWZtNi9KZTVQZnFZ?=
 =?utf-8?B?YTRFY1RvTzI5SFVTbUIxNllVWlJjQk4vdkF0cTRIajV6ZDBYL1BZM1QxQ29D?=
 =?utf-8?B?UjZneHNsZXVKTWxEV1ZjWndydDVwSjQxQkJldXZmRWRnaE9tUllXQXNlRzJ5?=
 =?utf-8?B?L2VwUlBGM05MbHI1UjBJeU5DL052TEtRZWNIbXFaN01tWWVqNkRWQXZoWWNP?=
 =?utf-8?B?YkhHaURuZlRRQVBWS3VRY1pUWGlZSnhxTHhybGw0L2prLzFlcTdHS0hsTWIw?=
 =?utf-8?B?Vm5JT0ZLbGN5eDVOQ2c5Z0NBKzI1UzczUjBSK28vdG9Nbm92ZHhLUW5aVnJK?=
 =?utf-8?B?cjZNYis2S1NJRndwcGt5OCtEMUlpaXFTbXF4THJIa1RyYlh6OWlmVE1OTlhn?=
 =?utf-8?B?N3Q0MTZScWhHZEhZOXAzbm1JWkY3ZFc4VWt0dndlQTkzMGMrVnpiYUhVN0Zu?=
 =?utf-8?B?dXVnaDBiR0RTT25vczBPcE1zdVljM3JJLzh0QXRwdFcrU1pvdWgvays1TlI1?=
 =?utf-8?B?M2dOLythdmdyUFV6ZG9zalE5QU1rZmNraVR2WHVQcXZEMjRaVmFxZVl5aThL?=
 =?utf-8?B?OWwzTTUyUFNWMklVcDczQkZjT0REM1ZCektpUTQzRWg1dlBtODNrT0p3QTUv?=
 =?utf-8?B?a0FPNjFCcXhpd0ZPSDlSRDFmZ2U3K3NRZ0V0TnJCSXN6RDgzckpvYmEzR25K?=
 =?utf-8?B?THdPWFVxbmExVFlFczd1RjhmeXh5dU5VVkdneGdMNGdxMGk1UFU5elZyZmpW?=
 =?utf-8?B?ZzBSRzl1S2haT2paM2wxZHBzSXgvTXBvV0VyQytBdk1uQ3ExTDlWUjdmMm1r?=
 =?utf-8?B?b2JxZU5ZQ2FKYTE1TjdIaFhDeUNFbUo2TVhwc1k0YTBaRWMvaXNSd3YxQk5U?=
 =?utf-8?B?bHZIb01FclF3Vm9jbXVTd2I2UFkrMnlWMHorWCtvQy9TdFFieXltT0p0YTJO?=
 =?utf-8?B?dFRFUEFGWXBDalM4bGtLWTNkTUNLT1BKWnFOcHBWN3l3b2ZOSng3OGM0V0xO?=
 =?utf-8?B?ZmwzTG1Pb3dNeWQ0U3J4cUhhYTZic0c0bkZQNXJyajVyMkwvTVN6SXRDS0dC?=
 =?utf-8?B?aml2RXJ0dUVSTGxTV0ZaenhvTHNNc0lDTnRkVEF4amJHd2JJa2VNTkFTL1N2?=
 =?utf-8?B?T1V6Yys3Wk4rejRGTXRCdUlaYldOam5NRGxHODFWekZvODI3NUZEck9MVmdI?=
 =?utf-8?B?YW5hZmdMUVJZUEwvZEtCUnNQK2hGL3UwZmppTnVyUGdFTHE2SFFyRWFnT2lS?=
 =?utf-8?B?SmVlc0VIK0FtQnhZN25SeExjckFXZFN5MzJNUjVjZmVTZm9lRDBHSmhIVVdY?=
 =?utf-8?B?SU5rclF0UjdQdis3cTJseFRrQXJCK2s2R0xSOEtVZkkweERrL1pVSVdraUxE?=
 =?utf-8?B?cmFTNUhiaVh0U1owbU1LbnVYVFVWdWVYb1pCZGpySlg3SHNSbS8yRzBadmt0?=
 =?utf-8?B?akJsVUdYM3JZWUpDNU15eExwbStXRVl3K3hXdnpIdUtFa1ozd296QXRNVEVG?=
 =?utf-8?B?MjUvREQwUFVHSG41MlBkTkV6NzN1QklYZlUwOTNEbis2M05TOUJ2TUdQTUtu?=
 =?utf-8?B?dm9Rem1sMXdYcno2ZXgvM2QyMVJpUVBvMWt0dUYxVU1vdklNSlIyT1hiMEV1?=
 =?utf-8?B?VlI3Q0JoVFlqVTI1ZEl0Z0FsTU5SZURDN1ZWbkZTdkQ0NXFhZklHTzZ0LzAx?=
 =?utf-8?B?KzljWkdNQm01QkswdUhJYVJWbXdZaGdhNjZPNjNucTNzSU9XVnByMUI4b3pi?=
 =?utf-8?B?ZzRuUkJoNWJXTVZpT0pRUG1NckNUeC94QndERmhzNFhQR2E5K3pHQW9rZ3pJ?=
 =?utf-8?B?bjF2WDlvU1ZjS2dHbkwwQm4ySzY4M1lRaFNKWVBsNUZ1V2RyNE95cDF5WjhK?=
 =?utf-8?B?VHRGUVJGRnBDby90S2JyUCsvTVVhUEMxQ0tXeExnMXErL3RGNnlSbWlxYVVz?=
 =?utf-8?B?VFRpbU5aQ1FOeHp1NGhXd2k5RTNtOHFHanpKRGhPTGN0L1gybytDODFMVWNy?=
 =?utf-8?B?SjYxaDdPdU52dFUyYk1FdFpjYXQwcjQ2Y3BZdTg5R3V3NG1ZSmxxbU00S0hQ?=
 =?utf-8?B?SkEweUYzaWdUd25Fc0tObHBmVEp6NTExNU9NTmFhZDlSZWhoalprai8rclRn?=
 =?utf-8?B?Y3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d52d77d7-f400-4f87-eb73-08dc6e7a18a7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2024 09:43:06.2021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJGYcwVRsyLtFpV+y6JmybjP5QrI9IOzV6RV8qYt5v8o/hfT+y10d7Iv6un9NPiP+75wHwsf8Bkxe4xbWTY+Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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



On 04-05-2024 18:34, janga.rahul.kumar@intel.com wrote:
> From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> 
> Add test to check mocs values are retained over runtime
> suspend/resume.
> 
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   tests/intel/xe_pm.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
> index 51442537b..73fd57636 100644
> --- a/tests/intel/xe_pm.c
> +++ b/tests/intel/xe_pm.c
> @@ -609,6 +609,45 @@ static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
>   	close(fw_handle);
>   }
>   
> +/**
> + * SUBTEST: mocs_suspend_resume
> + * Description:
> + *     Validate mocs register contents over suspend resume
> + *
> + * Functionality: mocs
> + * Run type: FULL
> + */
> +static void test_mocs_suspend_resume(device_t device)
> +{
> +	int gt;
> +
> +	xe_for_each_gt(device.fd_xe, gt) {
> +		char path[256];
> +
> +		// Mocs debugfs contents before and after suspend-resume
> +		char mocs_content_pre[4096], mocs_contents_post[4096];
> +
> +		sprintf(path, "gt%d/mocs", gt);
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_content_pre);
> +
> +		fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
> +		igt_assert(fw_handle >= 0);
> +		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
> +
> +		/* Runtime suspend  */
> +		close(fw_handle);
> +		igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +		igt_assert(igt_debugfs_exists(device.fd_xe, path, O_RDONLY));
> +		igt_debugfs_dump(device.fd_xe, path);
> +		igt_debugfs_read(device.fd_xe, path, mocs_contents_post);
> +
> +		igt_assert(strcmp(mocs_content_pre, mocs_contents_post) == 0);
> +	}
> +}
> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -767,6 +806,10 @@ igt_main
>   			dpms_on_off(device, DRM_MODE_DPMS_ON);
>   			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
>   		}
> +
> +		igt_subtest("mocs_suspend_resume")
> +			test_mocs_suspend_resume(device);
> +
>   	}
>   
>   	igt_fixture {
