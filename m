Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F06EA3C23
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 11:03:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1A510E7C7;
	Thu,  9 Apr 2026 11:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hK4LebVy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC410E7C7
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 11:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775732610; x=1807268610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=+tNPytjbfZo5UvZ0x5era0/x1l4erMyxrhgT1IDaM24=;
 b=hK4LebVyli5D4x1dYkfQg/l9TJ6hAG+hFLIKHrWSKP2U346K4+0qNbQV
 78Byqa4TIDL0IuZnu8WcAvFMAvtBY904do9kyUyPAco66dF9ZWxG5/9/h
 71QtH1eNfD6gBxc8Ev76xWZFZd2JWpQXde3/RWhZNB8z02DHVoTVa1a3K
 9HoSz3E1pU4BvqRkEE/XLrMXBvGDjq7aQlfaxP/4n0O5w3DBNoAvh/+Jh
 1PFG2ZimsG4mU+C45nV+hgBEf10KSU5KHLp9AwXUaVkTu7nid/WpuDYrY
 qXBqwcyR8cUEx9PtoQtKmcpZoW4vnFSZr86cWlKddgY+1c3M1nlvYRfD9 A==;
X-CSE-ConnectionGUID: LLz5RDnOSnKLQe3hxsgB4g==
X-CSE-MsgGUID: dLh5KiVsQqaqZjghGRneFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="75905510"
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; d="scan'208,217";a="75905510"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:03:29 -0700
X-CSE-ConnectionGUID: xWLrIvyoQJG9Y2yN18JZkg==
X-CSE-MsgGUID: YYgJmAwXS72JRs2vegl8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,169,1770624000"; 
 d="scan'208,217";a="223988885"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2026 04:03:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:03:28 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 9 Apr 2026 04:03:28 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 9 Apr 2026 04:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EWOMpokCX7BBm4uVrGo3P7kYJPgdDNXK+LenzUXioJw/znRGaQyUa8gdXIPA7Yz1RhFY+4z9vDOL7dYAe1iPOgtYNVVaMetjgbI1m7+LCjOUtstxVYvh2E2diDiFH520Aw55uyWk98GTnyAo3mv1L4odQ4DSC+4qqdxTrij+PkEIlGzDZD1tkAwi0wiAPZFITNUjxgMo6sM6tA04874PGeIogClVJ4VEwBhJRlJ4cDGNvBkdWXuoT9YpkPDdviFa8+91ZA9GXdUzkML0HW/BfBMW08XZPXd6LAWqVP3q1AqfgzVYcL8mHTMOujnthGfJi+1rgqfzw6q3UNQWMaJEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83rak7l+8BcNBpnpKIDANiEpve6ufUUyrJNI7OKoX7Q=;
 b=G5ZJenScpw1EuzVG20zh8/ziJvKtveUt0nZXrj0px6ZxLNO4PWVt8fuepd3zyhUS+WnZKjW9XEyr2oNEJXhb6vUiUKHZhozPb7eFHeXfLU+/lHsBtIoSSRkKYeFf4kvrIo2TdpfDcwi4Yru/khV4Uzvbh6V0La8Ra4VjweKgokEfC5/VpvGpl0lAT7+/lg1cqyTkvg94zjXCvOeyNRoNY4znA7Q3s4Wsif//zB/UWWyHpHn8I97i/bBFjB2MAdoe/PC2SGThAYhfoAKuaAHqQ2te3VA7qVS9faWh96yZ9wvAoGr3yp4EdgdahIHciJDqwtVmgYeI/H8+C5KqGQc9bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8485.namprd11.prod.outlook.com (2603:10b6:408:1e6::13)
 by DSSPR11MB9619.namprd11.prod.outlook.com (2603:10b6:8:376::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 9 Apr
 2026 11:03:22 +0000
Received: from LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c]) by LV8PR11MB8485.namprd11.prod.outlook.com
 ([fe80::9ec6:998a:b515:890c%4]) with mapi id 15.20.9769.041; Thu, 9 Apr 2026
 11:03:22 +0000
Content-Type: multipart/alternative;
 boundary="------------hafHVpNhXKp0m8EVS0EREO2n"
Message-ID: <51c24cf3-99e5-4a83-999b-47ce6ca0393d@intel.com>
Date: Thu, 9 Apr 2026 16:33:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_pm_dc: Add new test for dc3co
 framedrop validation
Content-Language: en-GB
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <dibin.moolakadan.subrahmanian@intel.com>
References: <20260304043805.572087-1-jeevan.b@intel.com>
 <20260304043805.572087-5-jeevan.b@intel.com>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <20260304043805.572087-5-jeevan.b@intel.com>
X-ClientProxiedBy: MA5P287CA0164.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::16) To LV8PR11MB8485.namprd11.prod.outlook.com
 (2603:10b6:408:1e6::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8485:EE_|DSSPR11MB9619:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e02ac5-e28a-4a14-12ab-08de96279d17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|22082099003|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: oSOuR3LxUh/5moIuTfD80jeoUUELeKd2iK4C7VrA6m4TBEBKtcN8gd4dfrYj/zfKqhaXFwgRI75a8sbUW1caNmumgjUhUJ8z4Q/PY5+CHtaWyQgDvqMrANIBRzEDf+7NTI5BL3xKdJ7IEDFP1sRfwX7APmHWhXLWccIoDnSq8qJgwFvVftpvTVe/jKitB++mp9z0wLvwLtTZZi82QqYc+hyLoANUEsZ/GrUVkIUX09mNAo7Uf4ZRj9yWMRcTWF85r1L5btMEppUoRelBHkyJQnwi4xNB71WMx41InNq1vMuywqZSWBK3l3gCEpp8JTu0JCJ7MNq21qLQdDMVddBmB9vdVHMmojcBrzKOzXIFMmLKOG1G1Nb5+AOFroo+XRLcuMrRN2DIPZS8ksiaGA7uBjWbgOfC/y9O14Jjd0P4h+0dHPBJhX5sOOhP0E/u8HtSIV+CaL7HQDP603aSUOWEB5ccjybwO9GEpDaXO7+yJyLFODJzvHxxzKKCkLWNeNfXYbEkEylgkfAynQaSZerAjPiu7T0IHTvrei+oGeg8JD9X8Q+BnVv/tv2WGFi/G0hUEUgqUwGsjk/yfrr4kUHFClTdYWRK56Ey8h20vaZOVRFgG2PIyeRZn7IsUTgecbNljLckMq1yvgz2fVH+AqRRa4Q7wsLPVJ9fcV0GmZoLBDguketzJaYMDpNzF8l/8mKuYz00xPm5v4noJ4QMt89Wl8n9Syrwd8brM3DiiRZCTDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8485.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(22082099003)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjJaeTRtWjlpTW9YbTFacnhDcDgxbHhhTnJEOHFTL1hISFNGWkRKbDNLZ3hm?=
 =?utf-8?B?ZVc0bnNScjVKcW9NUEtkblJ4Rlg0eWNEMVQ3OGVQMkhTVEhDa1Nob0pFRHF0?=
 =?utf-8?B?Y0ZiV0NWdFByMk1rYUc1TGJzN0RabmhiT2pQVUpuTFloeXgzZjd6Qnk1Z2tt?=
 =?utf-8?B?QlRSSWdLOHJGb1RENW9jTS82WEpBVTZIeTZGajVCN0JHYmE0Q0tZM3FSbmt2?=
 =?utf-8?B?bmdUSkFPVWdaWEgwY21KVGtna3lIZXhUVVJnMTRLMDVtRkJsSmRYTk1TWkpo?=
 =?utf-8?B?WVk4am5lUVMyOXdLZW9Pd2gwTWNtUnkzUTZzc0g2VGhlRDczR0g4S1ZOemRs?=
 =?utf-8?B?VzlMdndreDJxUHVRQnkwZzdNZVBwaXFhVm9pakE1WE8xQjhmT2QzZUVTM3pv?=
 =?utf-8?B?RTNMMnlEanBLcVorc1NXaXY4Q0tQQjEzZWxPYy9BSC9KNmdTYjlHWGtjNkV2?=
 =?utf-8?B?c0lIdjRjL1FBYzd0WW5XT1VuS0prejZ1bFVnTGRsbktadXZ6Qm96NXI1cHVL?=
 =?utf-8?B?bjVUVExNcFhVS1RiMXdHRmtPRDhEQXhEMUd0M29PeWkzeWlFMzE1WHZWdVFF?=
 =?utf-8?B?WmtDb0Y4QW5NOEx2VEJoS2Z0N0Fna3RIaHdwZm5HN2RVQlIyUi92MGdSbjdN?=
 =?utf-8?B?dFFxOGFQMCtmcWplSFc5UW1hRTVDZ2dCT3FtcG9oa3JvdWRaa1crU0pKZW16?=
 =?utf-8?B?OUI4ZU0yeitJNUc0c0FwZHgyTzF5MFNSdklTU0VXNjJKSmpDZzIzellDSEFw?=
 =?utf-8?B?THFPcUhSVE1wemxYZng3ZytYSVZ6OGZNZUpwM0JWTjMybWw3eGwwTndMemIy?=
 =?utf-8?B?L1haZWNvaXFXSTJ1NEZLTjUxT1o5dFJBcmgwN2lNaGIvZTJ5UXBRc0Vmb3hH?=
 =?utf-8?B?Zzhuelg1aUU0Uk9IUjhpeDJ2cFpQSkdhcXhWVHh2amMzeTZ2YkRnU2UzVGZN?=
 =?utf-8?B?ZEJqRnd5Wng5cEhjOGYzWVVtMysrbm1hMU9lSExhMlZHbU9jUFFBdkFWRGZq?=
 =?utf-8?B?OEMzMXhyZGdCQXdRRDRUcm42NTZaMjlNbEtQbWttQUxTWWJMeHV0WkRYZ1RP?=
 =?utf-8?B?eHJwL0hyajVxcDY3b082cDFxRkVkTXphaHh5SzMyeUMyTDJsczcwKzhzM1U4?=
 =?utf-8?B?RWxTbUpCSnlRRVF4c0JKZkZ3M2EwM0tqZkg0L3RxdVdxV1BRVm50RGJNT1d5?=
 =?utf-8?B?emM5eHlNRlJxVlRJMENwZzVDN0JPVDVMZnRNUFV0dUYydnJEWThRZjRtdlZ3?=
 =?utf-8?B?ZkFINlh1c0o0RHZ4LzRKZmlOMUlsK25CbXFodXNoc0VERUpIdUkyeU9LZnBt?=
 =?utf-8?B?aWg0Q01iWC9wY1ZWZDFrMGxPMnN1SzlDVUtISGRtRUtPTVBMYXJiajRjcTc3?=
 =?utf-8?B?NU9RcE9HOEtPcml2Z1J0RXZHVnRIMUxXa0Q2SXEzWkk2Qmx4N3ptL21scW5h?=
 =?utf-8?B?V21acldiL1RtVUZMakdpSnhoUi9mUU5FV0hYQXorV09xT3I1dDhiYytSYTR1?=
 =?utf-8?B?WXU4Tit2RFFZdW9laHNBZXYra1lFMitFdU1WeVA0OVFYYS8zaUJZUXRlQ0x2?=
 =?utf-8?B?VkRXejlNaGpmSW9rSkYzZmxWYnBkZmdxYUxhVEpqczlTaENFMWloSW9MLysx?=
 =?utf-8?B?QnVqR2ZxTm8wTkdNeVpwM3BIS2dMN0NYc2VkTzJ5V014NmtZbFRXVURMZ2tZ?=
 =?utf-8?B?NHdlb1ZnNHZGaHhzcU9PbGZ0c1FMUzk0STR6b041VHRSNEVWYU5vaUhZMnph?=
 =?utf-8?B?NFcvb2dxODVIRTZKa1Y4N0ZaZGJZYWlOV016K3dWMXZSS0dyTTlZNmNaM3Np?=
 =?utf-8?B?c0ZNZ1NUUi9iclBvZjllam1HSTQ2bEFYTEZpTkdaZ3dJVlEwUE4rWGRuRlVB?=
 =?utf-8?B?dEwvcGFLSkZDaHhaWDNTT2VEcjRrdFZpbWlZaHlwNXRoUnBsdUx2VG11WEU4?=
 =?utf-8?B?ZHViYW9oUWdmZVhXVUFaRmNFSlZHbDhKaUlvM1p0ZUVnaDR0Z01paGZsUHJE?=
 =?utf-8?B?N2E4QWhSa2ZxK21SdlFUNGNuS083dWhoTlpDbXZySzBDV1JHTXYwd3BYZVlX?=
 =?utf-8?B?WkNHQ291WVhORThYZGRpRU40QUQxaGgyS3RIdGFPQUEycTBFejR5Qml2elZP?=
 =?utf-8?B?dEFpYTRZUGtQbXpwd0VNNHIxTlNVbEJ2UERVWWRFbjE3bkpBQWJmY0RnZXhu?=
 =?utf-8?B?QlBvMG1waEVRREw3OTFyenRkbUpqNGVyVVcyYWdGMjdtWUVjQ3B1NWMyZERt?=
 =?utf-8?B?RXcrNzZsd1VCZmkyeUd4NEZZaUlBbkRQaHdVbU01WU04cGxveUE1T3NScW5K?=
 =?utf-8?B?K3d4L3RmYjdHZDBPYUU5bW9xMnZzRGxOdkZxV2hQYm1ZTFJVSUNmS21MUWdI?=
 =?utf-8?Q?JPr3Jvx/0nwQ/O0M=3D?=
X-Exchange-RoutingPolicyChecked: mN7q4NNA2Jjo3ROKXb+/JJvwgdG3G+3eVkBPWDW4+Zbf6wAvP6vfPN16D2NcM6ch5A16QbW6B/kBSedM1lPyfPIY6YGqMjTsp9MODKthgYVvkOPx9fNtl2ZYziLeYlGAmsB/7Jzs6/8MfN2C+LmDl/tOdOnV+bgphb+R8mzwWJAljTB769JGRBlJsSkK9zyutgQaX30GTMMINAmp2JOyi1ESoynVURFtgf4ipxSq3k/fsAz0Eg74tpfZnPLxPj+rSmX0UGVbCqcl/X9+tPEGl1zxog83BxkXTuINcxBdSnFbJzJzca/vVksKRnx8JOD5Q2KrS0gdR2TuEufZ0ynLIw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e02ac5-e28a-4a14-12ab-08de96279d17
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8485.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 11:03:22.0044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6bEYv6n0hp60ZlNhddxLvQWm9nBnO1I+VAaI+Y8bSW9stx995r+2o2lM1Q2Q+iWt5AzE2/Lrr7wvVyJc+RXh3UP2FV/16mTojzpY4VmAvc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSSPR11MB9619
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

--------------hafHVpNhXKp0m8EVS0EREO2n
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 04-03-2026 10:08 am, Jeevan B wrote:
> Add a new subtest to validate that no frame drops occur during
> DC3CO entry, ensuring that no frame drops are detected and DC3CO
> is successfully triggered during the test.
>
> Signed-off-by: Jeevan B<jeevan.b@intel.com>
> ---
>   tests/intel/kms_pm_dc.c | 83 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 83 insertions(+)
>
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index 10450474a..b0e35dca1 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -51,6 +51,10 @@
>    * Description: Make sure that system enters DC3CO when PSR2 is active and system
>    *              is in SLEEP state
>    *
> + * SUBTEST: dc3co-framedrop-check
> + * Description: Verify that DC3CO entry does not cause frame drops and successfully
> + * 		enters the power state
> + *
>    * SUBTEST: dc5-dpms
>    * Description: Validate display engine entry to DC5 state while all connectors's
>    *              DPMS property set to OFF
> @@ -315,6 +319,50 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
>   	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
>   }
>   
> +static void check_framedrop(data_t *data)
> +{
> +	igt_plane_t *primary;
> +	uint32_t dc3co_prev_cnt, dc3co_cnt;
> +	int delay, frame_count, max_count = 100, ret;
-->set frame_count with 0.
> +	bool dc3co_flag = false;
> +	drmVBlank wait;
> +
> +	primary = igt_output_get_plane_type(data->output,
> +					    DRM_PLANE_TYPE_PRIMARY);
> +	igt_plane_set_fb(primary, NULL);
> +	dc3co_prev_cnt = igt_read_dc_counter(data->debugfs_fd,
> +					     IGT_INTEL_CHECK_DC3CO);
> +
> +	/* Calculate delay to generate idle frame in usec*/
> +	delay = 1.5 * ((1000 * 1000) / data->mode->vrefresh);
-->better to have : (int) (1.5 * ((<rest code>));  so proepr conversion 
to integer usec
> +
> +	for (int i = 0; i < max_count; i++) {
> +		if (i % 2 == 0)
> +			igt_plane_set_fb(primary, &data->fb_rgb);
> +		else
> +			igt_plane_set_fb(primary, &data->fb_rgr);
> +
> +		igt_display_commit(&data->display);
> +		frame_count++;
> +
> +		memset(&wait, 0, sizeof(wait));
> +		wait.request.type = DRM_VBLANK_RELATIVE;
> +		wait.request.sequence = 1;
> +
> +		ret = drmWaitVBlank(data->drm_fd, &wait);
> +		igt_assert_eq(ret, 0);
> +		dc3co_cnt = igt_read_dc_counter(data->debugfs_fd,
> +						IGT_INTEL_CHECK_DC3CO);
> +		if (dc3co_cnt > dc3co_prev_cnt)
> +			dc3co_flag = true;
> +
> +		usleep(delay);
> +	}
> +
> +	igt_assert_f(dc3co_flag, "DC3CO entry failed.\n");
> +	igt_assert_f(frame_count == max_count, "Framedrop seen during vpb scenario.\n");

--> Here we are just counting a loop itiration, as per my understanding 
the real frame drop should be vblank seq numers.
         I think we have to do like:
         before start loop read  prev_vblank = wait.reply.sequence and 
inside loop current_vblank = wait.reply.sequence;
         then vblank_diff = current_vblank - prev_vblank, so the gap 
greter than 1 indicates frame drop.
         on everyloop if  the gap is greter than previous, we can 
increment frame_drop + = vblank_diff-1,
         and updated the prev_vblank with current_vblank in side the 
loop till the loop repeats.
         which will give vblank interval w.r.t actual expected, Please 
check it...

-->  if it is intention then better to updated message  some thing like 
-->"Frame processing" instead of "Frame drop" ??

-->also print number of frame count and max count along with the message.

> +}
> +
>   static void setup_dc3co(data_t *data, enum psr_mode mode)
>   {
>   	data->op_psr_mode = mode;
> @@ -333,6 +381,16 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
>   	cleanup_dc3co_fbs(data);
>   }
>   
> +static void test_framedrop_dc3co(data_t *data, enum psr_mode mode)
> +{
> +	igt_require_dc_counter(data->debugfs_fd, IGT_INTEL_CHECK_DC3CO);
> +	setup_output(data);
> +	setup_dc3co(data, mode);
> +	setup_videoplayback(data);
> +	check_framedrop(data);
> +	cleanup_dc3co_fbs(data);
> +}
> +
>   static void test_dc5_retention_flops(data_t *data, int dc_flag)
>   {
>   	uint32_t dc_counter_before_psr;
> @@ -660,6 +718,31 @@ int igt_main()
>   		}
>   	}
>   
> +	igt_describe("Verify that DC3CO entry does not cause frame drops "
> +		     "and successfully enters the power state");
> +	igt_subtest_with_dynamic("dc3co-framedrop-check") {
> +		int modes[] = {PSR_MODE_2, PR_MODE};
> +		const char *append_subtest_name[2] = {
> +			"psr2-",
> +			"pr-",
-->here also same comments, provided at patch 2
> +		};
> +
> +		for (int i = 0; i < ARRAY_SIZE(modes); i++) {
> +			igt_dynamic_f("%s-dc3co-framedrop", append_subtest_name[i]) {
> +				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
> +							     modes[i], NULL));
> +
> +				if (modes[i] == PSR_MODE_2)
> +					igt_require(IS_TIGERLAKE(data.devid) ||
> +						    intel_display_ver(data.devid) >= 35);
> +				else if (modes[i] == PR_MODE)
> +					igt_require(intel_display_ver(data.devid) >= 35);
> +
> +				test_framedrop_dc3co(&data, modes[i]);
> +			}
> +		}
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC5 state "
>   		     "while PSR is active");
>   	igt_subtest("dc5-psr") {
--------------hafHVpNhXKp0m8EVS0EREO2n
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 04-03-2026 10:08 am, Jeevan B wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260304043805.572087-5-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">Add a new subtest to validate that no frame drops occur during
DC3CO entry, ensuring that no frame drops are detected and DC3CO
is successfully triggered during the test.

Signed-off-by: Jeevan B <a class="moz-txt-link-rfc2396E" href="mailto:jeevan.b@intel.com">&lt;jeevan.b@intel.com&gt;</a>
---
 tests/intel/kms_pm_dc.c | 83 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
index 10450474a..b0e35dca1 100644
--- a/tests/intel/kms_pm_dc.c
+++ b/tests/intel/kms_pm_dc.c
@@ -51,6 +51,10 @@
  * Description: Make sure that system enters DC3CO when PSR2 is active and system
  *              is in SLEEP state
  *
+ * SUBTEST: dc3co-framedrop-check
+ * Description: Verify that DC3CO entry does not cause frame drops and successfully
+ * 		enters the power state
+ *
  * SUBTEST: dc5-dpms
  * Description: Validate display engine entry to DC5 state while all connectors's
  *              DPMS property set to OFF
@@ -315,6 +319,50 @@ static void check_dc3co_with_videoplayback_like_load(data_t *data)
 	check_dc_counter(data, IGT_INTEL_CHECK_DC3CO, dc3co_prev_cnt);
 }
 
+static void check_framedrop(data_t *data)
+{
+	igt_plane_t *primary;
+	uint32_t dc3co_prev_cnt, dc3co_cnt;
+	int delay, frame_count, max_count = 100, ret;</pre>
    </blockquote>
    --&gt;set&nbsp;<span style="white-space: pre-wrap">frame_count</span>&nbsp;with
    0.
    <blockquote type="cite" cite="mid:20260304043805.572087-5-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+	bool dc3co_flag = false;
+	drmVBlank wait;
+
+	primary = igt_output_get_plane_type(data-&gt;output,
+					    DRM_PLANE_TYPE_PRIMARY);
+	igt_plane_set_fb(primary, NULL);
+	dc3co_prev_cnt = igt_read_dc_counter(data-&gt;debugfs_fd,
+					     IGT_INTEL_CHECK_DC3CO);
+
+	/* Calculate delay to generate idle frame in usec*/
+	delay = 1.5 * ((1000 * 1000) / data-&gt;mode-&gt;vrefresh);</pre>
    </blockquote>
    --&gt;better to have : (int) (<span style="white-space: pre-wrap">1.5</span>&nbsp;*&nbsp;
    ((&lt;rest code&gt;));&nbsp; so proepr conversion to integer usec
    <blockquote type="cite" cite="mid:20260304043805.572087-5-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+
+	for (int i = 0; i &lt; max_count; i++) {
+		if (i % 2 == 0)
+			igt_plane_set_fb(primary, &amp;data-&gt;fb_rgb);
+		else
+			igt_plane_set_fb(primary, &amp;data-&gt;fb_rgr);
+
+		igt_display_commit(&amp;data-&gt;display);
+		frame_count++;
+
+		memset(&amp;wait, 0, sizeof(wait));
+		wait.request.type = DRM_VBLANK_RELATIVE;
+		wait.request.sequence = 1;
+
+		ret = drmWaitVBlank(data-&gt;drm_fd, &amp;wait);
+		igt_assert_eq(ret, 0);
+		dc3co_cnt = igt_read_dc_counter(data-&gt;debugfs_fd,
+						IGT_INTEL_CHECK_DC3CO);
+		if (dc3co_cnt &gt; dc3co_prev_cnt)
+			dc3co_flag = true;
+
+		usleep(delay);
+	}
+
+	igt_assert_f(dc3co_flag, &quot;DC3CO entry failed.\n&quot;);
+	igt_assert_f(frame_count == max_count, &quot;Framedrop seen during vpb scenario.\n&quot;);</pre>
    </blockquote>
    <p>--&gt; Here we are just counting a loop itiration, as per my
      understanding the real frame drop should be vblank seq numers.<br>
      &nbsp; &nbsp; &nbsp; &nbsp; I think we have to do like:&nbsp; &nbsp;<br>
      &nbsp; &nbsp; &nbsp; &nbsp; before start loop read&nbsp; prev_vblank = wait.reply.sequence
      and inside loop current_vblank = wait.reply.sequence;<br>
      &nbsp; &nbsp; &nbsp; &nbsp; then vblank_diff = current_vblank - prev_vblank, so the
      gap greter than 1 indicates frame drop.<br>
      &nbsp; &nbsp; &nbsp; &nbsp; on everyloop if&nbsp; the gap is greter than previous, we can
      increment frame_drop + = vblank_diff-1,<br>
      &nbsp; &nbsp; &nbsp; &nbsp; and updated the prev_vblank with current_vblank in side
      the loop till the loop repeats.<br>
      &nbsp; &nbsp; &nbsp; &nbsp; which will give vblank interval w.r.t actual expected,
      Please check it...<br>
      <br>
      --&gt;&nbsp; if it is intention then better to updated message&nbsp; some
      thing like --&gt;&quot;Frame processing&quot; instead of &quot;Frame drop&quot; ??<br>
      <br>
      --&gt;also print number of frame count and max count along with
      the message.</p>
    <blockquote type="cite" cite="mid:20260304043805.572087-5-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+}
+
 static void setup_dc3co(data_t *data, enum psr_mode mode)
 {
 	data-&gt;op_psr_mode = mode;
@@ -333,6 +381,16 @@ static void test_dc3co_vpb_simulation(data_t *data, enum psr_mode mode)
 	cleanup_dc3co_fbs(data);
 }
 
+static void test_framedrop_dc3co(data_t *data, enum psr_mode mode)
+{
+	igt_require_dc_counter(data-&gt;debugfs_fd, IGT_INTEL_CHECK_DC3CO);
+	setup_output(data);
+	setup_dc3co(data, mode);
+	setup_videoplayback(data);
+	check_framedrop(data);
+	cleanup_dc3co_fbs(data);
+}
+
 static void test_dc5_retention_flops(data_t *data, int dc_flag)
 {
 	uint32_t dc_counter_before_psr;
@@ -660,6 +718,31 @@ int igt_main()
 		}
 	}
 
+	igt_describe(&quot;Verify that DC3CO entry does not cause frame drops &quot;
+		     &quot;and successfully enters the power state&quot;);
+	igt_subtest_with_dynamic(&quot;dc3co-framedrop-check&quot;) {
+		int modes[] = {PSR_MODE_2, PR_MODE};
+		const char *append_subtest_name[2] = {
+			&quot;psr2-&quot;,
+			&quot;pr-&quot;,</pre>
    </blockquote>
    --&gt;here also same comments, provided at patch 2
    <blockquote type="cite" cite="mid:20260304043805.572087-5-jeevan.b@intel.com">
      <pre wrap="" class="moz-quote-pre">
+		};
+
+		for (int i = 0; i &lt; ARRAY_SIZE(modes); i++) {
+			igt_dynamic_f(&quot;%s-dc3co-framedrop&quot;, append_subtest_name[i]) {
+				igt_require(psr_sink_support(data.drm_fd, data.debugfs_fd,
+							     modes[i], NULL));
+
+				if (modes[i] == PSR_MODE_2)
+					igt_require(IS_TIGERLAKE(data.devid) ||
+						    intel_display_ver(data.devid) &gt;= 35);
+				else if (modes[i] == PR_MODE)
+					igt_require(intel_display_ver(data.devid) &gt;= 35);
+
+				test_framedrop_dc3co(&amp;data, modes[i]);
+			}
+		}
+	}
+
 	igt_describe(&quot;This test validates display engine entry to DC5 state &quot;
 		     &quot;while PSR is active&quot;);
 	igt_subtest(&quot;dc5-psr&quot;) {
</pre>
    </blockquote>
  </body>
</html>

--------------hafHVpNhXKp0m8EVS0EREO2n--
