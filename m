Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF283CC6B30
	for <igt-dev@archiver.kernel.org>; Thu, 15 Oct 2026 10:47:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE321122BC;
	Thu, 15 Oct 2026 10:47:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AAF1122BC;
 Thu, 15 Oct 2026 10:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792061219; x=1823597219;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:mime-version;
 bh=BmsR7FOeRWNkhejLCmQUI6DS0Sb0DS+VyYcGOkHulbQ=;
 b=VR0AD03Yx4iGeVW7iaC567dIexkN3Z+LjGOb5GR8lRmX7ZVjd4vtYENu
 l41Q1MEEZRWqQ1eKU0x52xmEkj0rn7zi3+vO0D7yx/C8ZIp5xw7ZZqy/w
 YKwfFf+RkA+CZwNhH9p0m3PLpiYzSFMO57INMwSdQnc4xVLsctXnXI9d+
 Q23nLSW/6nuC/qhwjYx+FWldWjrHHtiBR3uOZkxrf5rGdb3fukiAZilDT
 AE03jk7tTEnRtA/eikGPHY3/YYuveMwSh8eyNrrEx0FVGe9uRb1lMT5k1
 rjQ90FaJxwqG3nBwgxDNDxud6vVaPGycVo6fYVU2TAU2W6+kexZMWK+4Y g==;
X-CSE-ConnectionGUID: aJ5wC++LR2W0KKvqaGA7gw==
X-CSE-MsgGUID: p1dSn6fZSeOAuABeaBmk1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="835797"
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; d="scan'208,217";a="835797"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:46:59 -0700
X-CSE-ConnectionGUID: 3JJge+XYT1+eirvbVIh/9g==
X-CSE-MsgGUID: UE9CZOxjTZOqIhkUdzN1xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,159,1787036400"; d="scan'208,217";a="2103038"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 03:46:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:46:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 03:46:58 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 03:46:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iXxz0rKpCvQUgX/DIPqX8o23QYhGQ9N+Tj1+CVudi94cwJqboKvSI3WbIah9Flwj21jlHLFWgzI2mY1Nyyb0KM5i3CFKvUEd6ytu02kmKNme5dVdM61pMcpWa4Tcps+9JiLcY0q1kyox/hIVKEXKijwklp6n7u4sWkfQ/Zm+v+q1uSFbNFZopSK8XP2Wflzi7QerSzYxFeMUZeRgKdEt8HVC50pBJNbjweohzbrJAIv9VlDhBCGV3kriwcbm6e9UG+1/Lxr3PcqaqVuA7r47PWdgw7a2Vst1RJ3lcMM7943g8grrJdn2id9jQxG0yBQlzNm2xaDvnhE6aVcmK/C7Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TCoCVmUxy3RMjSMhronY6sDsOEvhoJiVl7pGqR63dfw=;
 b=cFy8OA2TBEY5Dbhb9SMUM4tX0Twbkew1E8UlL28PkDZCrrtkctc1tK3Xd7DEnqxXqMcdAHbl8F9l177TontM7aew6mRmu67JKpjVnwthGvWBovUnHGso2vEv4Hly9mAyCD3znE/iQuenNAIqNOwR5a1aExTlnucWuETyOMjRAKZNmgK1Qfx3aCi3P/7N5FVmwyNOyzz999PvhAweg4rpIZHeafUCCuoz2Umh7mDxguMGacxHLBsh6y+ibqTpuwJbdhNetdhlTFcB8XW38/61/o5YCIhoVGZfQ1vEH4kHD8tgbKQnCMDCtfqE8BIVFInoR6rmMtvPhssv6utWdoIQew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV8PR11MB8607.namprd11.prod.outlook.com (2603:10b6:408:1ec::18)
 by SA1PR11MB8574.namprd11.prod.outlook.com (2603:10b6:806:3b1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 15 Oct
 2026 10:46:55 +0000
Received: from LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56]) by LV8PR11MB8607.namprd11.prod.outlook.com
 ([fe80::70de:934:a004:9c56%4]) with mapi id 15.21.0522.013; Thu, 15 Oct 2026
 10:46:54 +0000
Content-Type: multipart/alternative;
 boundary="------------kR3MF7O8oO4XDTPriiZnKyqT"
Message-ID: <83cbdd1a-e166-494f-b531-3936ca318743@intel.com>
Date: Thu, 15 Oct 2026 16:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_i915=2ECI=2EFull=3A_failure_for_tools/xe-?=
 =?UTF-8?Q?perf-recorder=3A_Wait_for_mmio-trigger-report_=28rev3=29?=
Content-Language: en-US
To: <I915-ci-infra@lists.freedesktop.org>
References: <20261007054409.3694489-1-shekhar.chauhan@intel.com>
 <179136623907.247220.8805329128360627949@61270ab9df2a>
CC: <igt-dev@lists.freedesktop.org>, <shekhar.chauhan@intel.com>
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <179136623907.247220.8805329128360627949@61270ab9df2a>
X-ClientProxiedBy: MA0PR01CA0098.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::8) To LV8PR11MB8607.namprd11.prod.outlook.com
 (2603:10b6:408:1ec::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8607:EE_|SA1PR11MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c937a5-58ba-45b2-edc5-08df2aa9a09f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|6133799003|18002099003|10067099003|22082099003|13003099007|8096899003|261009223027099003|4143699003|11063799006|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info: M2BPwILYdPGwFqAyhDEKkkkv/SX41+y46wNitl5P22H8ubgpKKhkl024pWupvhu1tyZ/SLT1IEiBC0iVd3YmBuv0asx++QxyzVfCtep+ZjgpJboYsfkamHFmsAZcIh9XHiMEE5mjqbagoRcG6xVCdDMaY/xPXIpV75G0GwZGaiIUuqNMnRCc6+5Gzpt+k67+RyDtE5HNNxBwsoRP4oAAdfjznTJ6MDYzDfM2+z9xcsrMGkt/8fLHqqsQsYbqMkwLMhoNduysYS5HspNhsHwwESnamZ0/dJD5kK1JUG1EPc0X7H8WB8J5khoL4+qQFTImTtUL/JKWJeGVn1jHmDbUMq9AF5muKZQ7teb2HB18Xp4Tkwx6Nl1tlelPzlM7uI/6vbjP564InrumiTzd0nM9kVxQcNayuOLOdHNeKuscLHyTfbh1YbGbdYjVsOX+OGKvYN1PEkBv9o4Dj2OKKRFH/VfdgtznqZvMiw4aZ4zELSd7K2nFzjnQ+HGhEMpGN+VO8IFn0z362ff3hYGbnUPCr9VLU2GTY0Lb/0KkLsX0krOaCky6CI97EVGtbzwXDqPNE9lm/2oHeRtPstqmITFyIOb8rUCZzScXg0yY43A18PE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV8PR11MB8607.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(6133799003)(18002099003)(10067099003)(22082099003)(13003099007)(8096899003)(261009223027099003)(4143699003)(11063799006)(5023799004)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVlRNjRaRmpzbjRDNWszd29QREFyZENkSVhhMUtIQXo2ZURCRE1YaGg0Q1RY?=
 =?utf-8?B?TWZldmwwVWpQRTg2aXpMK3VQUUNjQjFVVWJqM2QrZWFLN0FRNVo0NG9QRGZM?=
 =?utf-8?B?elRSSWJKUlVYcmhUTU1sdXd0Z1JqYnRLNjl5K3RiNXB0Z3lLcGNIVFlkS3cz?=
 =?utf-8?B?V2E5L0U1WmpiS09zME1QdWNRVGlTdjg5SXlYejlhT3lYYThLaCtWdkFXRys5?=
 =?utf-8?B?ZTVIZHdIbEhiOWFPMVh5UjVrUlE4WWZ5K3FtaXZhMTMyU0J1a1IycXlKUnE5?=
 =?utf-8?B?UDlwRXJRRE8zeEFYYVRqdXlXMlI5Rmd4R1JQTWZuYTNheDZKRlRKMDdoUmp2?=
 =?utf-8?B?L2lubHEwSlY3eG9NWCtYREFDU0F5SnRBYXFNQ1hlYnd0d0RaZkNPa2FUbzFt?=
 =?utf-8?B?N1U5cEJZNVlZTGpHbHJDU1preWp3Mk1rUmszdUZPazU1MUdqM1pYZHVBZnpI?=
 =?utf-8?B?YlgzMEtoU2ZZSlNZVklCZkFrNWRaMFdJQXZXajdweTBiVGRTNGtMdmVIZTF1?=
 =?utf-8?B?VjdVRktXK0FzczFxSmJOcVcrRmxEbkRsOGRReGRHVEFVUmVsY2dDdERrbEZI?=
 =?utf-8?B?SFdEWU5EaGtBRWgwN1htdlMrZjU5VzJnWjNaWFJNVjlPU3FNSGNtbmtucVE1?=
 =?utf-8?B?bGFpL3l5QmJ0YUd3b2twTmxnUzlQNlhueG1WL1o5ZlBvRmF5R3I3ZmxiYklm?=
 =?utf-8?B?WkI2OXYvdXd6Y2p0SVYzdVRZWTV4QkthY2tPZnE1MytSMExhb1pLN21vc2x5?=
 =?utf-8?B?Wk9nZm5ZQ0xRYmNXY3dkTDQyTnp4Zi9QOUZoMVZobEhnUjBGWFV6aVhZWWdV?=
 =?utf-8?B?WXhqSWtPbnJpQ0FDYzRoY3RmMnl4WEx5a3hsZFA4eThYVW5JTjlXdDhHNmFo?=
 =?utf-8?B?QzJlSzdpUU5zNVh6M3BVTHNvZGVYaUZ4ajBIZjZGaWhVWEFsakNIb0Rta0Zn?=
 =?utf-8?B?WVpaVDFHdWQ2TDlPSnVvcFVpbHhIYjZiL0l1aW5Bc0ppOTdBM2szcTZkUGM3?=
 =?utf-8?B?TExNT2RDc1ZWY0NHcmRUYjVHTG9pYURlcFdFNDVZT0tXellQTkh1OGUxVjZP?=
 =?utf-8?B?ZXdraU81Z080bkw1WUVydkVpc0FuMi92dmdPZk9teURrMnVIRTBJS0tnQnFT?=
 =?utf-8?B?TnRJMENTVGQwRmk2d005TEc2a3BycWxvNHhQaHZFSWYrajgxd3J2b2d1c1pB?=
 =?utf-8?B?M1Y3MUxtMFZHSTlrY1plTTBha0VHREhnNlpXaWZ0WGR4S2dwd0ozT0pBZXRi?=
 =?utf-8?B?bnNOYWt5dWxsSVhuMDRSV1Zidnl4bXppd0FtKzhtaGpNNnQvNHcveGVFbEF5?=
 =?utf-8?B?QkZqaHdvY2Y5dmZpRnZZU0dGZDl1YjFKeUpFcTZvK0lnVVE1M3VMbzR0UXlw?=
 =?utf-8?B?bU5vU0MzQXQwdjRhUDBSYm5nV0JoRkJkMFhmYjVNekZvMCtpcmFsQzZPS2Fy?=
 =?utf-8?B?c0lJNWtDZU1adlpKYklSZ01XczBTUzQwSUpVWUZueEJuV0ZSU2VSUVJVcTNy?=
 =?utf-8?B?UzFsMW9rZ3pNVFZ2eW9qRjdEUnNseDlSTFFqZU9pMDZFNnZCTUF4eUtqcG1v?=
 =?utf-8?B?UzJRRElHdWpBZzFKci8xR2JKb1dqVjBwUVhVellGekNKT21lVFZUWXB5TFFD?=
 =?utf-8?B?aDZjaUl5b2FVcUFyNDMxQjhGRnJmU2MvQzFIOHE4ZnBQaXp0d3N3Vkpqb3dv?=
 =?utf-8?B?VUVtQWJhbXlKc0YrUTZ6ZkZ0WS9xSXRISk04VTJyWVZsQTVMcTBUc3JFNEVY?=
 =?utf-8?B?OFI5K2pBU25rQUhCTjZvTzZHb1JJQ3RSZjVQZzhHSHFHaGVVaXlxeHdhbTdX?=
 =?utf-8?B?NE92K0tYRm8yREsvVy9Qa1ZJY25pVW5LYU1FVXBDdHhqZ1NscEQ3eTBIbmtP?=
 =?utf-8?B?Ty85S1p1QWw3SDl6VzNrYURYTlZkRUlhWjVDMnJudWdnT0NPT0FJekJ5aTJs?=
 =?utf-8?B?L1NYS0F5RVFwSXJocUNXb2swdEttZFcxM1I5c1JnaXpnemVBeERPQVNFeXFG?=
 =?utf-8?B?ejM0NDhkSk14Y0dDbTRXZllGU2tDbEJhUVB3d2IveUJ5Rm14YW5EZFAwUVJO?=
 =?utf-8?B?ZjhMTURGOHhxUE5Db3F2Zi9Vdm93a3VSQUpYNlo0aXQyNitYYVBuQktwc2VB?=
 =?utf-8?B?VU4xc1JEWjl5Mm9YZHlrVkw5cE9HWEh0d01YOVJsWUN3MGxwSFBvcUpFaktp?=
 =?utf-8?B?UVlOcllTN3VaaVFsZ3hLVExNSW5BTGpneXNMcE9ac0wxQWU3QjBjZVEyVUFT?=
 =?utf-8?B?azhKUGJRQmlMY1MwWmZvRHZTNmZYRzFDa2dKdllLdE04NWhZZDVtNVpoRmpL?=
 =?utf-8?B?OWZBQlQrWTlIN1pVMWtoVjR0S0VaUTY2V0grSlN4VUhhRHJCdXFJV0JWZEt1?=
 =?utf-8?Q?kHYMbjax7SPPdZak=3D?=
X-Exchange-RoutingPolicyChecked: JHRlQsLIkSKoDpepaQwiN2bfRkyuTwdaBtxIsbDijGVXIXIzOnze+dX7ismcxLQGky14OnBbu1Qvjkqkay8D0Cfev/uN0ACSZajvQoKju5C35jGnczFu790Rt/A79mB3tk8U39akWpD9bqCSS2ywNqq7DNS8UGbKP4eKoLSSEpSZ/dAY6h2qZJ7ORJwzlFFhDJSqv2l2T/QlLXQZcSIqyUGI4181wiZ8C3nYfQcUxtJ/f1WWwAXiiD6aoMT6DS3BHED2FOUbGe/cjkuLyhn9gcANL1ji4s9EnrKtsdI4mHS62mwLZoqgTv4c9//A3+ahtEN4RQWSE39ysaBAkViCEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c937a5-58ba-45b2-edc5-08df2aa9a09f
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8607.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 10:46:54.5433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M92YKeYze93O3XsePClTf/r4bG5E9UuITGWbrlXwXs8gDmONQII8v9Dcg+loYL19Sa8YTmo5m5CCH7+OCQaE8WY9YjAhpUHZno2anAWAVyo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8574
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

--------------kR3MF7O8oO4XDTPriiZnKyqT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Unrelated failures.  The changes introduced have nothing to do with the 
regressions reported below.

-shekhar

On 10/7/2026 15:13, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tools/xe-perf-recorder: Wait for mmio-trigger-report (rev3)
> *URL:* 	https://patchwork.freedesktop.org/series/172766/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html
>
>
>   CI Bug Log - changes from CI_DRM_19291_full -> IGTPW_15949_full
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with IGTPW_15949_full absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in IGTPW_15949_full, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
> External URL: 
> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html
>
>
>     Participating hosts (10 -> 10)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> IGTPW_15949_full:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>  *
>
>     igt@i915_pm_rps@waitboost:
>
>       o shard-dg2: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-8/igt@i915_pm_rps@waitboost.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/shard-dg2-7/igt@i915_pm_rps@waitboost.html>
>  *
>
>     igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:
>
>       o shard-mtlp: PASS
>         <https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/shard-mtlp-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html>
>         +1 other test incomplete
>
>
>     New tests
>
> New tests have been introduced between CI_DRM_19291_full and 
> IGTPW_15949_full:
>
>
>       New IGT tests (2)
>
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.83] s
>  *
>
>     igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.76] s
>
>
>     Build changes
>
>   * CI: CI-20190529 -> None
>   * IGT: IGT_9131 -> IGTPW_15949
>   * Piglit: piglit_4509 -> None
>
> CI-20190529: 20190529
> CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @ 
> git://anongit.freedesktop.org/gfx-ci/linux
> IGTPW_15949: 15949
> IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @ 
> git://anongit.freedesktop.org/piglit
>
-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation

--------------kR3MF7O8oO4XDTPriiZnKyqT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Unrelated failures.&nbsp; The changes introduced have nothing to do
      with the regressions reported below.</p>
    <p>-shekhar</p>
    <div class="moz-cite-prefix">On 10/7/2026 15:13, Patchwork wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:179136623907.247220.8805329128360627949@61270ab9df2a">
      
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">@scope { td { padding: 2pt; } }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tools/xe-perf-recorder: Wait for mmio-trigger-report
              (rev3)</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href="https://patchwork.freedesktop.org/series/172766/" moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/172766/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html" moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from CI_DRM_19291_full -&gt;
        IGTPW_15949_full</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with IGTPW_15949_full absolutely
        need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in IGTPW_15949_full, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <p>External URL:
        <a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/index.html</a></p>
      <h2>Participating hosts (10 -&gt; 10)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        IGTPW_15949_full:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>
          <p>igt@i915_pm_rps@waitboost:</p>
          <ul>
            <li>shard-dg2: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-dg2-8/igt@i915_pm_rps@waitboost.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/shard-dg2-7/igt@i915_pm_rps@waitboost.html" moz-do-not-send="true">FAIL</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d:</p>
          <ul>
            <li>shard-mtlp: <a href="https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_19291/shard-mtlp-5/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html" moz-do-not-send="true">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_15949/shard-mtlp-3/igt@kms_color_pipeline@plane-fixed-matrix-yuv-rgb-bt601-lim-lut1d.html" moz-do-not-send="true">INCOMPLETE</a> +1 other test
              incomplete</li>
          </ul>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between CI_DRM_19291_full and
        IGTPW_15949_full:</p>
      <h3>New IGT tests (2)</h3>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-vga-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.83] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-b-vga-1:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.76] s</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>CI: CI-20190529 -&gt; None</li>
        <li>IGT: IGT_9131 -&gt; IGTPW_15949</li>
        <li>Piglit: piglit_4509 -&gt; None</li>
      </ul>
      <p>CI-20190529: 20190529<br>
        CI_DRM_19291: daeb062fc40f727fafefed080c6d12a5ad1d0d12 @
        git://anongit.freedesktop.org/gfx-ci/linux<br>
        IGTPW_15949: 15949<br>
        IGT_9131: 5e43e9df3a1581074f0de2bbeddd939ebd950b93 @
        <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-tools.git</a><br>
        piglit_4509: fdc5a4ca11124ab8413c7988896eec4c97336694 @
        git://anongit.freedesktop.org/piglit</p>
    </blockquote>
    <pre class="moz-signature" cols="72">-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Intel Corporation</pre>
  </body>
</html>

--------------kR3MF7O8oO4XDTPriiZnKyqT--
