Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9328C624A5
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 15:59:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7718210E2E4;
	Mon, 31 Aug 2026 15:59:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aooA3VWs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FAB10E2B8
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 15:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788191934; x=1819727934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Z4qAZNzwcSVdeiruOUG4rdTyuTVwxGH3SnOa22af5MA=;
 b=aooA3VWsb1uDTZd7G4RTgcpv7ss9Wp1rvwiVrCy51l5DDt/0LWDPcPYl
 aXiB3FQmLDIDo2hah561dvMwh5cuerDNvM6E5MKwkLBNsDQNipneRFdBv
 /+Ds4yBa2PawV+4yyPHxlEOAPFIyIidYk0zKUn7afBELFZYDCIdAysIk9
 DkdHnNzAL32zVXvzGDsRjyuDEPyotB8P3T2cnGGyBmAsMg++aM7sCuOE4
 wtvRT11Rh/ZEUzzUQ+A6mhdPEvF9SNwa9evMZ2NLEoTX7+pN6Y31PP/7i
 r9N+3umIH+scoyzCNCEEkJGehyFmF0a4EMhVDfA3+pDV1QnPQ+ofw62Xk Q==;
X-CSE-ConnectionGUID: kViIaLiHS7OxPFdMm8zc3Q==
X-CSE-MsgGUID: GheucKtmT9uiLEW0JgD6Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="114141514"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="114141514"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 08:58:54 -0700
X-CSE-ConnectionGUID: rRsxU+d3SrKgF6Dhdri2vg==
X-CSE-MsgGUID: PjqsBaUXQNG/du2+aAfR3A==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 08:58:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 08:58:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 31 Aug 2026 08:58:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.38) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 31 Aug 2026 08:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yQ5wapiPNm5ncderj5T6T2VDgZ3VOj2sgc21dQfx4wTiOPI5teQBGO0FjHpTaDfoTH+PGM2RauSQR73IrZ6+rng43BcgVjr7qgTytROvXNe/imcaFqEld1sXfMLTob9Jt4G38PcIYN2zhjeyQt6yBfIqCW9AGv0RlcF14y9UrqWozA+HB/Hso6YAslknF7UkMWYyuz/u9Kh2BMko2UYpNyENWRBHJXkK2VWbc6zb6LphKUYyo4/qmhNnTa49p5i4sAHXCK5xJOfHJzJ03sJdNl6XX/89egtBs8ZScMtZBGHIYgc7srtbHuxQyHW6T/RDYRIdAVRfUtnyjyjcNHNQFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDy0sz2aZ+xbNWjxtNVQUHzCuwgambvkeKQGo3myHOs=;
 b=Yngc23/iyLodnI9AaTOihxg5MLD6EN6V3pUsbFqITbMs9n0CcYULfM6MZ91xFcw3Th1N7dMFRd9P9L90kX7+nFcIQpkcw8Q4Q7TOflt/gb5+7xK5tEYZ3cofpSN6cfvtWGamk7DaMQMP5ZJVk2HoO0pdMNXjpAcR7WETtqViQX9aw5W2Ih5rO6CBWIDPz1Q0VHnTJCV5sfyGqkRnFTJwIRvqDoDPSqXtNW8kaMMs+oUpCe5pCnP60Xr4Go48zVcTboS/CK0RvqqcvgHpYdDN6BHkvjlbtPLw+iltmOJjT4M0CEvJ/XkMLRkG3i+uBkiiLirQqVEU9SwU3/pmE1CY4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 15:58:51 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 15:58:50 +0000
Message-ID: <1ff57ea1-8351-460f-919a-88c817a3c2d0@intel.com>
Date: Mon, 31 Aug 2026 21:28:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <mallesh.koujalagi@intel.com>, <raag.jadav@intel.com>
References: <20260824164133.129138-1-ravi.kishore.koppuravuri@intel.com>
 <20260824164133.129138-5-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260824164133.129138-5-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0204.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::16) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|PH3PPF73E424DB7:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5b602c-33ce-48ed-ad7e-08df0778bfa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|22082099003|56012099006|11063799006|4143699003|18002099003;
X-Microsoft-Antispam-Message-Info: n7dFznO3KdDi2UEWcKT/Vi6Cmk42dw1bSCC3v+xPlW3x+uGdu2vhq6BdJTpD8j0besrmRQIIz1JClASFUa/ByK6/1F5onZkm6n3wzqLGDxExcEhZPvYjcdhuqfVSR0tuMS/+5/cWuglkDCOuRiUxZ8ghJdjbbXAaIsrqWb6iZAbCZIdVOJjnc8dpvRwK3rfyLtoqGjw7QqaopZXou2wl8dI2ntB6AayohpbrQEKbMW5IdncKZcvGTVBPxGoQFzop+nlATSjfrdFAJkOHiTvf1QczV0qTnAH9H8rE4L/0vpYaPMgOt2iB2Xq9MBh+xGRndUBsHLjDv0V4nkk+Tc9/1q7MYrJUfSsEb23doICn4siE5h5nuQ4o7mGXvx7er5mlgrD4ruPu+gnfEM5Z4BPMPcCW1EdMUQ0XV3j9WCSl8HSx3MXRnFGBRrLFXYqUfVQKOfeQowKADsFpwb8+J5ULb4kUSIWp+JGwvpdFMNyf47vkDdEIFBxfS0YFInvHQVqbyAuJyjB27d8YYYYTGHP4XO3QbglRveMh4nxxFto/fYY23vspxmhxYoA6eX3MuUvi/VSC63u3EK7g7fYfXfnnEknJsiIpRDge3abywUHu3YplDIm3VWM1Kx1hrbn6t5aAWfX+52QNMY+PE966KsslukV/iMGUcHgsex+xdeZ6f9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(22082099003)(56012099006)(11063799006)(4143699003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1ZGUlpBRG15VnNpbDhjUStyTnZpaXdNMk9OQjN3T0NJNEVzMk96bmFZdEtn?=
 =?utf-8?B?cll5SFh1dElCYkU2OURubVpSMGFzWDQ2dnJBN3lMeGlQU2pKenNzazBXcUtM?=
 =?utf-8?B?ZXRnb2Y2MFZQSVJ2T1RsVSt3OXUwQktkWVc3UEpTcVgxTFVDZks2MXllWmll?=
 =?utf-8?B?bk51Qzl6bng5VGttZmtvYlZ4N2cxOHl4ZnlCcjRoYlNpVGVVWC8wNkJwVHk2?=
 =?utf-8?B?VUlRMkNXY28wWmtsOXBZU2E5ZEh2OElQSU1lZzdWUDhmeFhEeVF6cm1IMG9x?=
 =?utf-8?B?elJ0OExsUnRnUjJDeGpWZzgzYjRCWmpIbjQrMkdMTFhrbTF3aS9IODQ2UW4y?=
 =?utf-8?B?U2xTSUxFdlBJRGJKd2tKSFowRHpaV2VtNFE3S3YzZzdBRmU3ajIySDRoS2N2?=
 =?utf-8?B?d1AzSmh6WGY4Q2orcGxqekZ0NkJlMVRPWVRibFcrb2hQYzdWbUVDRCs4QWcv?=
 =?utf-8?B?K2ZhWENoZDM5NVBXVWZTNjNwZk56UzFqR3AyWko4b3F5ZlRnOXlnRUVnTzFM?=
 =?utf-8?B?N29CWlZtYUMxOWszWUs3bWhMK2dXSGtTeCt3cFZaU254eTJmR2JQSDNxMTVD?=
 =?utf-8?B?ZTJNcHhURHBvVzJXTUd2WUdudExuRFh1eW5FalV1VVlJVCs2WThNMnlTdTFu?=
 =?utf-8?B?Mkp1MFB2YzJ3cW1WS0s5UklxY3BqRWFOR0VpME83RFYrNWcrWmZXd3lJUE95?=
 =?utf-8?B?eFlmUTBpYlFBeXgyNzhiWGNUc0tCM25mcExxY1ozMVlYdHl1NXVoZCtHZW5m?=
 =?utf-8?B?Mk5QRytvcDFheXdDLzRwMWlWWllHR1NKNmg3dWxJQjlqWjNIM1VpY3ZaTGR0?=
 =?utf-8?B?NW5PWnJLSGpLdE9pdjk5RDVzOEc4NWYzRVB4MlVZMlVXQnM1M1NXdGdWUmZP?=
 =?utf-8?B?VGhIeU1BYUpVMUpmV0hBMFI3V0JNald3Ymxjd1pyZW9CaUVXaXR3c0lGemxj?=
 =?utf-8?B?dmxBVUV5U0YxL3ZOTGwzT3pEUDVSaFg0ejkzS2pzdTFpcHRYNlJHQzZrY3U3?=
 =?utf-8?B?K1kxUWNONGxmZDJEelc1WVBoS1hQYXlrS2o4V0QwdXVMRzhnazlzNlR3VG9n?=
 =?utf-8?B?eGEvRGdLRWJ4QzJUTUhDOWwwTFRkaU1yTkZjeTVkdDlyeENKa2Q3YkZyZnBj?=
 =?utf-8?B?cmsraCt3TEVzMm0ya1d2MVgrQ0IyaVBJV0JIYnczNFNtTTF5Z292U3Z0RlFo?=
 =?utf-8?B?YzFOTnJFclNrSlV5c2lwVU1HMTZMaWIyTkhpOUduQk0wbUlGY2ZUMDZnUVI3?=
 =?utf-8?B?NllVNTB4MG82MW5TeDU5R1JkMkVaS0htNSs4UCtNMUFFYmFwWWQ5RlVuNDZL?=
 =?utf-8?B?d09JR2pXRzJwT2ZHbWdEM0lSUzNxVE5hZHIvRnZGZnUzMGJFaGJDOTYxZEtO?=
 =?utf-8?B?ZUwrT0hqU1I0VTE3YjNkQjcxS1NJYnVERDBCZFFBNzZnTytnRkhLOTZHNmZG?=
 =?utf-8?B?UWRxRFMvNkp2SVJRb0RzdFVSWCtrWG5QZThlZzYvRVNmaVBZNnhvbkVzcEJN?=
 =?utf-8?B?WW55cTVGdmhPQWtEKzBOODYvemM2VU5VV2NQb2RMcXhTWUZXOVcvdGJLN0Fr?=
 =?utf-8?B?NDR1cExsRjFFQXpKUFd4bGhHdEpLOWhxa09pT3lkb1lWeS83MkJLRUhPcEo0?=
 =?utf-8?B?T0E4ZjFDVlI4Q2VnYXR3anVack1kcnJHVFVRQTJBM0d3bG8xeFdtMlVpWUFM?=
 =?utf-8?B?SGxiaDFOVmhuTjluRmZ1K0NMZjRkRDE3OEdnc1pNQjRSOEp1cGw2YldzeHBX?=
 =?utf-8?B?QnIyUzRZSHl4WVJWa3hXaTBhREJaM1hsVDlSNzJINGNKNmJ3Z0x5NGNSQzVk?=
 =?utf-8?B?c2I2Zmo3d0x6Zy84RXpkVGxXVnNCWncxZlBwQVBTbEp5Rk9pS0tiNE80cVh5?=
 =?utf-8?B?MGVqZmFlNFBaTXVuMTVxMDRUNEl3STE5WE11QVVxcksvaGFNTnhmYlZRZkpN?=
 =?utf-8?B?RXdoSDUyRUljK1ZielIrV3RUQW5YaGRLSGJYOGhDQytXK1Q5ZmlNY3N3Qk51?=
 =?utf-8?B?MkhVVkNtUko1VTZ0UStOZmlpRUpDUWFjMDNvczJCcU44QVkxUzk2L0NaVDN6?=
 =?utf-8?B?MWtiUC9KQ0lKTmswOThoWW1ZVTQwRzFwWnNXY05NL3JZRFVmTGE5VVRPcEpT?=
 =?utf-8?B?bnkra3pQV0srNWxwMkFzeTVaT0xwMktrenp2dkxyTWJvTlQ0dnZqdjkvSTZ1?=
 =?utf-8?B?RlFjbVVrN0lrVGdJNUVPa2VHb1kzVWVpV1JpWWcydG85ZnY4N3A5Sjh6SU9m?=
 =?utf-8?B?NnVibjdranVSY05uS1NjN0cxQkJDajRXSERyYnROd0xTR09TUWVTVThuYkxO?=
 =?utf-8?B?Y0xmaTZPOFVFRm1wcUt3UGZLZjJNTGdBak5mRzZua0JjbGwwbTJzK0RZTFU4?=
 =?utf-8?Q?S+2VIM9eeci67Sho=3D?=
X-Exchange-RoutingPolicyChecked: rz+AjiCC8ibzt4yOI2AAGEAy3HEzRqM0iRSsbqYI6T/mIaGO58dc/oy9HKVEKdFnfVUUYXDEBYukcmlDZSfn1h8aQQk0XOP1JFJM5rhzoy4gsw6OKfllQVuNz+aXadNcmjw1REu3j5uamuCYSuFg0/UKZf3kwsY8l+ULUe/81857j/ttuFVaroJxFT9VXuUljFpRa75cwzJ6MpIEgbP2fpgfqgFzt1neKil2UJOuli6pdgXvs/Tb1JzGwPmMGG8nnWSx3zx34NQfbugo+0IdcwRp/qdJv9m0P4T+y/ehgRwJwLokqxUgJl8KjKAhjZcZfmHXoiqIlNoSNV7B7VsI/w==
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5b602c-33ce-48ed-ad7e-08df0778bfa7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 15:58:50.5617 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +FmbL+FFpXs19eTm4/pZauJkY4X0vmGnwSWIW8L1akZGBL3HdZNKWikjx1EbwSxDvo19BSPz5cT24npOQmfoKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
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

Hi Ravi,

On 24-08-2026 22:11, Ravi Kishore Koppuravuri wrote:
> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>     Added a check whether error_value updated by valid callback or not
>     Added a check whether response required for the command or not
> ---
> ---
>   lib/igt_drm_netlink.c | 264 +++++++++++++++++++++++++++++++++++++++++-
>   lib/igt_drm_netlink.h |  14 +++
>   2 files changed, 276 insertions(+), 2 deletions(-)
>
> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
> index fec1639b4..76223f3de 100644
> --- a/lib/igt_drm_netlink.c
> +++ b/lib/igt_drm_netlink.c
> @@ -5,6 +5,7 @@
>   
>   #include <stdbool.h>
>   #include <stdint.h>
> +#include <errno.h>
>   #include <stdio.h>
>   #include <stdlib.h>
>   #include <string.h>
> @@ -17,6 +18,225 @@
>   #include "igt_core.h"
>   #include "igt_drm_netlink.h"
>   
> +static int ras_command_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +	struct nlmsghdr *nlh;
> +	struct genlmsghdr *gnlh;
> +	int ret;
> +
> +	nlh = nlmsg_hdr(msg);
> +	gnlh = nlmsg_data(nlh);
> +
> +	switch (gnlh->cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER: {
> +		struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
> +
> +		ret = genlmsg_parse(nlh, 0, attrs,
> +				    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
> +		if (ret < 0)
> +			return NL_SKIP;
> +
> +		if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
> +			return NL_SKIP;
> +
> +		ctx->error_value = nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
> +		break;
> +	}
> +	default:
> +		return NL_SKIP;
> +	}
> +
> +	ctx->reply_received = true;
> +	if (ctx->ack_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_OK;
> +}
> +
> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr *err, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->last_nl_error = err->error;
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->ack_received = true;
> +	if (!ctx->response_required || ctx->reply_received)
> +		ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
> +{
> +	struct app_context *ctx = arg;
> +
> +	ctx->cmd_done = true;
> +
> +	return NL_STOP;
> +}
> +
> +static int register_callbacks(struct nl_cb *cb, struct app_context *ctx)
> +{
> +	int ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int send_and_recv_nl_msg(struct app_context *ctx,
> +				struct nl_cb *cb,
> +				struct nl_msg *msg)
> +{
> +	int ret;
> +
> +	ret = nl_send_auto(ctx->sock, msg);
> +	nlmsg_free(msg);
> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		return ret;
> +	}
> +
> +	/* NL Reply and ACK arrive as separate responses */
> +	while (!ctx->cmd_done) {
> +		ret = nl_recvmsgs(ctx->sock, cb);
If it is blocking, as this is being used by send_command, it will block 
the process for
ever if no netlink message is received.
In that case isn't it possible to set this nl_socket in non blocking 
mode and poll the messages?
> +		if (ret < 0)
> +			break;
> +	}
> +	nl_cb_put(cb);
> +
> +	return ret < 0 ? ret : 0;
> +}
> +
> +static int send_command(struct app_context *ctx, uint8_t cmd)
> +{
> +	struct nl_cb *cb;
> +	struct nl_msg *msg;
> +	void *msg_head;
> +	int ret;
> +
> +	msg = nlmsg_alloc();
> +	if (!msg)
> +		return -ENOMEM;
> +
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +
> +	msg_head = genlmsg_put(msg,
> +			       NL_AUTO_PORT,
> +			       NL_AUTO_SEQ,
> +			       ctx->family_id,
> +			       0,
> +			       NLM_F_REQUEST | NLM_F_ACK,
> +			       cmd,
> +			       DRM_RAS_FAMILY_VERSION);
> +	if (!msg_head) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	switch (cmd) {
> +	case DRM_RAS_CMD_GET_ERROR_COUNTER:
> +		ctx->response_required = true;
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
> +				  ctx->node_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +
> +		ret = nla_put_u32(msg,
> +				  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +				  ctx->error_id);
> +		if (ret < 0) {
> +			nlmsg_free(msg);
> +			return ret;
> +		}
> +		break;
> +	default:
> +		nlmsg_free(msg);
> +		return -EOPNOTSUPP;
> +	}
> +
> +	cb = nl_cb_alloc(NL_CB_DEFAULT);
> +	if (!cb) {
> +		nlmsg_free(msg);
> +		return -ENOMEM;
> +	}
> +
> +	ret = register_callbacks(cb, ctx);
Imho setting the callbacks only once makes it more cleaner.

thanks,
Soham

> +	if (ret < 0) {
> +		nl_cb_put(cb);
> +		nlmsg_free(msg);
> +		return ret;
> +	}
> +
> +	return send_and_recv_nl_msg(ctx, cb, msg);
> +}
> +
> +static int init_app_context(struct app_context *ctx)
> +{
> +	if (!ctx)
> +		return -EINVAL;
> +
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = UINT32_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +
> +	return 0;
> +}
> +
> +static void cleanup_app_context(struct app_context *ctx)
> +{
> +	if (!ctx)
> +		return;
> +
> +	ctx->sock = NULL;
> +	ctx->node_id = UINT32_MAX;
> +	ctx->error_id = UINT32_MAX;
> +	ctx->error_value = 0;
> +	ctx->last_nl_error = 0;
> +	ctx->cmd_done = false;
> +	ctx->reply_received = false;
> +	ctx->ack_received = false;
> +	ctx->response_required = false;
> +	ctx->family_id = -1;
> +}
> +
>   void igt_cleanup_nl_socket(struct app_context *ctx)
>   {
>   	if (!ctx || !ctx->sock)
> @@ -24,14 +244,20 @@ void igt_cleanup_nl_socket(struct app_context *ctx)
>   
>   	nl_close(ctx->sock);
>   	nl_socket_free(ctx->sock);
> -	ctx->sock = NULL;
> -	ctx->family_id = -1;
> +
> +	cleanup_app_context(ctx);
>   
>   	igt_debug("Cleaned up netlink socket.\n");
>   }
>   
>   int igt_init_nl_socket(struct app_context *ctx)
>   {
> +	int ret;
> +
> +	ret = init_app_context(ctx);
> +	if (ret < 0)
> +		return ret;
> +
>   	ctx->sock = nl_socket_alloc();
>   	if (!ctx->sock)
>   		return -1;
> @@ -58,3 +284,37 @@ int igt_init_nl_socket(struct app_context *ctx)
>   		  DRM_RAS_FAMILY_NAME, ctx->family_id);
>   	return 0;
>   }
> +
> +int igt_get_error_counter(struct app_context *ctx)
> +{
> +	int ret;
> +
> +	if (!ctx || !ctx->sock || ctx->family_id < 0)
> +		return -EINVAL;
> +
> +	if (ctx->node_id == UINT32_MAX ||
> +	    ctx->error_id == UINT32_MAX ||
> +	    ctx->error_id == 0) {
> +		igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
> +			 "node_id should be >= 0 and error_id should be >= 1.\n",
> +			 ctx->node_id, ctx->error_id);
> +		return -EINVAL;
> +	}
> +
> +	ctx->error_value = UINT32_MAX;
> +
> +	ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (ctx->error_value == UINT32_MAX) {
> +		igt_warn("No valid error counter reply: node_id=%u error_id=%u kernel_error=%d\n",
> +			 ctx->node_id, ctx->error_id, ctx->last_nl_error);
> +		return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
> +	}
> +
> +	igt_debug("Retrieved error counter: node_id=%u error_id=%u value=%u\n",
> +		  ctx->node_id, ctx->error_id, ctx->error_value);
> +
> +	return 0;
> +}
> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
> index f681a3a81..92ac665e2 100644
> --- a/lib/igt_drm_netlink.h
> +++ b/lib/igt_drm_netlink.h
> @@ -9,17 +9,31 @@
>   #include <stdbool.h>
>   #include <stdint.h>
>   
> +#include <linux/genetlink.h>
> +
> +#include <netlink/attr.h>
> +#include <netlink/handlers.h>
> +#include <netlink/msg.h>
>   #include <netlink/netlink.h>
>   
>   #include <drm-uapi/drm_ras.h>
>   
>   struct app_context {
>   	struct nl_sock *sock;
> +	uint32_t node_id;
> +	uint32_t error_id;
> +	uint32_t error_value;
> +	int last_nl_error;
> +	bool cmd_done;
> +	bool reply_received;
> +	bool ack_received;
> +	bool response_required;
>   	int family_id;
>   };
>   
>   void igt_cleanup_nl_socket(struct app_context *ctx);
>   int igt_init_nl_socket(struct app_context *ctx);
> +int igt_get_error_counter(struct app_context *ctx);
>   
>   #endif /* IGT_DRM_NETLINK_H */
>   
