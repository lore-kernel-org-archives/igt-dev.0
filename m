Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F4ECA5FB3
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:59:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DD010E327;
	Thu,  1 Oct 2026 07:59:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXzii/WY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D9810E327
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790841552; x=1822377552;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rPUkwMdKthUkKNrW6pf6WNgyhcss5kyIhq24y0bxiTg=;
 b=MXzii/WYHFY7q73/6G93StGTGxPwc8h6VgipzKRMNA6vJlKfDBtU7jdp
 VzC2dKm6bIiTz/HMnGq1t5rhQjRnl4p2nL5FSu/2bncXupX+1Aq2KCHP/
 FHlwkGxsHwm+JbMlND2FpwggCrO+wUTcmBX6Ok/Hr0plAoJbcsErPTMDa
 lmnEt+D2+mtS4+rxUYCSNtTe+AtqLzR8B/vFkPfGsZjEkgsUfa3FP35u5
 m0SuToILTuUkM7jjJzgMrzbDnnz0UzEiIqhvfSO3Y+5kJnSx4eMj8xGOp
 gADqQ7ej0FWcz51xgF1xBy4Din5vQFIw+QxYo7dvoQw8xzPV4QgOk7Fx/ g==;
X-CSE-ConnectionGUID: SBokaRuGSk2Oi12v0V/ofQ==
X-CSE-MsgGUID: ayAFeEnnQWGdQHS7+q1QpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="113380025"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="113380025"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:59:11 -0700
X-CSE-ConnectionGUID: TdQKF/ZBShuyLiCVJZYLYg==
X-CSE-MsgGUID: dx6EJO68RmutCjrFOzrQcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="275470733"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:59:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:59:10 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 1 Oct 2026 00:59:10 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.38) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 1 Oct 2026 00:59:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EKhh1mg7bYrkeG6vChM0XnraLmfb5ARznk608BDHQG6v7wGCVOuw6LkFoYMe3rWRR78yuj1oNV1Kjcd/tbvZVGK8Sv4hEwcDLSL8BhO/VxSer/NtgGwoiPmfk9EJn3edtgGba4sQAG3eNgMrFzZNaajfSO61PFQjyqQigZ6VIWcUO/O0CGWsdS/EunzghLP+r2To1Z2mU2ig/68oucsZwkblR2YWuMezuVCL/i/M/xvRUdxGJrDPYbC0rvR0ULIZGMO5IvNwgHx5ZW7/G5k23oQ8cFRWwGIuiJpJ+cnfVkObAZDbmgoqA4/h3L8on2p0CbqiaThEnUyWFF6QS2UbvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZFzvTFL7r7MIGZ/XCqbvSp5OFmVwlBj3GW3QUCMzck=;
 b=OA3ybosckQ0GVm/gJBshSOdha7N2blSNdoPWZD4kmRgtFEEjtrNCYYcabxd7xY1QIS6FYlo1d5lhz2NuI2tlPcmE/aQ+ieRwprMUdBO03M0gOP7YWsN8mM452OpVjDO7snfTqRxL5GVZgE0gyCjoIyiAgCC6KfE8mjak+feVscMgPMd3oenSd8sIv/pBYigsiX0ZLD7NMS/VS3vef61yflS4uTnXNWu1j1HzW7AMiSKx7ZJ+pf9yboFzq7cPXNqX+Ngoftk9Aef2JlLZ5aznSXexferP9jc0BaSW4WRXy+lPyUYHI9S4+UStDgYtnDWiFgw3XaGEPKV1rmw3Cmj3eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) by
 DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.24; Thu, 1 Oct 2026 07:59:05 +0000
Received: from DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f]) by DS0PR11MB7651.namprd11.prod.outlook.com
 ([fe80::901e:b308:292b:1b2f%4]) with mapi id 15.21.0451.026; Thu, 1 Oct 2026
 07:59:04 +0000
Message-ID: <45857297-d05e-45bc-a8ce-b313e5351f87@intel.com>
Date: Thu, 1 Oct 2026 13:28:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/10] lib/igt_drm_netlink: add get_error_counter
 support
To: "Purkait, Soham" <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Gupta Anshuman
 <anshuman.gupta@intel.com>, Jadav Raag <raag.jadav@intel.com>, Nilawar Badal
 <badal.nilawar@intel.com>, Koujalagi Mallesh <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>
References: <20260903073335.339540-1-ravi.kishore.koppuravuri@intel.com>
 <20260903073335.339540-5-ravi.kishore.koppuravuri@intel.com>
 <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
Content-Language: en-US
From: "Koppuravuri, Ravi Kishore" <ravi.kishore.koppuravuri@intel.com>
In-Reply-To: <1ed559f2-2dbd-4048-aa5b-d4b6e2493e91@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::8) To DS0PR11MB7651.namprd11.prod.outlook.com
 (2603:10b6:8:149::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7651:EE_|DM4PR11MB7254:EE_
X-MS-Office365-Filtering-Correlation-Id: bd7535d0-29cd-4134-015a-08df1f91dccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|10067099003|56012099006|6133799003|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: dyGutrBpNS09UIY6SvtjxJvagOYVDkqgDTRBmWRj5ZA7V6UTnjCH33OYiviV4T14G2L6B4KTN+BmNgUoYxoiVi7QyTOma1J+3pV3ormAd3Caj/o5131wRJgRghNHfRMdDPQUR3Ri3DdjuS0quORaNM9KW06IbSNqTAwZMglmB9UG864m1OyAOA5AOFqF0Ek3F6CUoQ6PJSAa/lHIpDTUwZ0Wg8XnVWvfURCAATAdzle0bnFW8RlvBXa6sFGOh63TE1fwPvTkOfXLjdjMAeE0WyvYa9jLdkHlekeZb0JqRTl0dU+CauYy8hBw1BpLfeVKMC3kk9yh45ZwC6CVGiJXUJ31eRfx51HMZWd35kAFy0nKx5EimR8Ci9yuLeaYyCS1pbjdSeIMlas/RXCfnWQc4T7EZsuDEeBQ6CWeD7MJAUZwy1wMmKtubbPO9ZOOLjeSqCl125XPcuyfVvvjl0dWIiQleISgn481t94RNUK+ng7LKZowMH5vQ2X7kjsLsX6xFt39QyV/oI2rce0hNqoCJpovdhyq2ftNgmLCSH8DSLwSiMbW0g8Y5yikt9ZJ2hc/XOPaqvuYQ5Zz6q1hlW4zAb0pNOYLSk5LgTTGt6sf2kHkQCe/VJnYFaV3Y+Io3rSCdLA0skIbX/+xkDUDRR9gcwQI8zYZ8LUlHLMvwy64ltk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7651.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFh4dzhxUFlLdG5iR2V2dnpyU1IzRk9NWVRXcmQ5QVFOY1pmVGdIOXhBbHh4?=
 =?utf-8?B?UmZsNDFSZUtvK01jUGtNQnUwQ0JpVGx5MmE3SGlhSXloQnJPdDFYQ3d6ekNt?=
 =?utf-8?B?VTdvamNSblJ5WHJlWWZYRWcySGt0ZFZCRkVNRGN3a3hFWk9oYUFzTHpFb00r?=
 =?utf-8?B?S1BTMkpsWnRqNm44NzdoZHQ5UGlSOStwN3BRQ1dZOFFDMjloL09Ca3RrN0Zw?=
 =?utf-8?B?R2M1Z05lTkxNbHZnTUFDSVY2dUVHVjNHdU0vQ0l0S3Y0Ulo5QmRTZ2Y0OENJ?=
 =?utf-8?B?SWNxd2sxMzR6MEREUldiVjlxREIrYVQyME1sUlFLOWJHVFFUcnFkTTZ6eHds?=
 =?utf-8?B?SExoWGs4aGRSYkV4Ujh3b3Fza0NHSXdSWmFQYm9CRDhNV01Jc3NpdFlDZjJX?=
 =?utf-8?B?NTVQbWs4RXF3emxISW1TVSthdlpmMUNxSTArZFNjOXZlSi96Y1hNV2g1OVRB?=
 =?utf-8?B?bGlIK1BuOTZuZWxkOTZibDhub256Y0NnWWtpV0duZWlXT0NieUZqczNqQ21P?=
 =?utf-8?B?T3piczFVK0FoNFBISmZCWmoyc0lSZXNGUEFETEswUkdrZ2dYQ3J4QWlYTEJv?=
 =?utf-8?B?WGdkejZSTmRJSnJiNUFNVEVacDVudWJEdXA5NlVmM2VUWFloajc3YkhTblZ4?=
 =?utf-8?B?cVpSb1ZJeVp6UUNKdTNCSWRVZDJnRTJZNmtoOUdDZmgwUU92NmVKaUxYckg0?=
 =?utf-8?B?dWV1TmhYOFA2L1BqTFBDejE0MXpQOFhVUW1WbUVzWFpSanlFUXF1dkpKU3pZ?=
 =?utf-8?B?N1JidHVPdHdGdVM3cDN3Zk4wdjNZREpCRzVrOUc2SG9xQVdaK0pWa01TL3Fz?=
 =?utf-8?B?TW9rQm0vT3g2UzlHVVY0QXNpcVpsQk91NnBFTERYaE84WUJUbXVoWGlORWJH?=
 =?utf-8?B?REZlY3IxeXBmaE5MQ0V2dWJmWFBJdUgxSFZDRXZBQ2dhbWlqT24zUXVDeHRR?=
 =?utf-8?B?NDc0NjJMc1YyQTdRTmJoUXMzWHZIZUk2TGNOSXAzWFhmSzd1S1FSUGxvTE92?=
 =?utf-8?B?b2taaGFxTERPTXFnMys0dmJhcUR5YmprNUV0Um12VWhKMlNpOGZjejJkNFlk?=
 =?utf-8?B?YXluR0EzRVBGZnNXb3pGSFZXQVorb0pFZ2lxWG5WK3o2SDRvNTZEU0RCZGJT?=
 =?utf-8?B?djFIaUxodS80KzRXeWR2Vzg4cFdHNVMyQytzMkE2Y0Vaay9YN2dZVGtQcm1h?=
 =?utf-8?B?eXVCS2lWR3FFQUxjUjR3NC9rKzdmeTB1TjQ4cUdiTjRjTzBLWUR2d01XZEE1?=
 =?utf-8?B?M2JoNVFVTUx1MkxtM0tPU1JXeWJrdE9sWkpCdzZTVEpZRFdjalFuaGEwVHo3?=
 =?utf-8?B?ZUt3S0cxa21haFZjSTEwOTFyMEhISnNFRUFHMkZkM2lNTnl6d1pNWVBUMXlD?=
 =?utf-8?B?dkk5eUM3ajR6aFdFTWNzc3k2WUZBK0RIVlo4ZzU1OHluV0ZaZzk1eWQ1S0NS?=
 =?utf-8?B?WE9PZ2ZycGRjeHhvRnhtbm5JOXhtVVorUXA3RnE5ZVRQL2xqNmdkMmpGMW9i?=
 =?utf-8?B?bkNlNGdNZXJCSmFpYnNTdXZVaW1mRW9KeEVKb1NEVkQ5bkpna2VsRW1GUlI0?=
 =?utf-8?B?c21yLzhGc2crRmVLemxGSHZLejBXOXhpc0o5dUNMNDdzcDRHaTgrMzhtVTR3?=
 =?utf-8?B?Wk5GNWRHNW9yZ2I5Y0c5aUtRRG5EN29GNXphM0NYZzZ4K2Y3WldYV0lrQWNj?=
 =?utf-8?B?WWFzSjNkOU1ta2dLK2NDWGxvV0pETWxRdmc3RVgwaVg2ZXA5M3FQMVJzMW9K?=
 =?utf-8?B?TVMzdjNvN0pQdVA1ZGNWQ0VuYkVNMVNOVnlTVEtxc0RTWGZ0QWRsN2VkVmo0?=
 =?utf-8?B?Y2ZIT1NoVkw4eG0rNHRZQXpZRlVXN0lFMldXRTQrMkh4dlNEMG9XOU5pVHZP?=
 =?utf-8?B?NVpUUVRsU2FBVlM3MFROWGYyQmZ1Tm42UGNzS1NmVzRZS3BpYU9ja0ZZTmZW?=
 =?utf-8?B?dWFwYVBBc0h5bFYvbnlkUkNUNDh1anRiT2ZhMlNjaWNKZUhISHpTT3FVZFhG?=
 =?utf-8?B?aVRyZXZ2RmV2UVQ3S0FEdk9aQjFVdFRQdC9CNzYvQjFwSzYvNW45SEVDaUdN?=
 =?utf-8?B?U2k1ZFNycFVHRzhzYTY1Q0M2ME40VkluMVdzaW1rdUpmNWNLemlHNExOTkdY?=
 =?utf-8?B?T1ZUSUUvT2wvUmtJRFU4eWFIeVdteUIvYjNGTi8wbURkK3ZxWUZpZURmVjBn?=
 =?utf-8?B?Q0Jwd2tmVlY0RmJFR2psaWhKVldscGxBRGh3dnplbjdUR2JHTHRyd2lIQzNt?=
 =?utf-8?B?OUNtZGxZU3BkVTN0VkRSS3RaWEQvYmhHclJ5cjBlQndybVh3dFVHaEtnaURF?=
 =?utf-8?B?ZHdvVWl3ZHpyZHBacEJYRkIxcnlRdjkzaVV6aFhsZUhtZVQ3ZHpCT0lPV2R6?=
 =?utf-8?Q?gkm3+IZaolPwt3DhGfL7ijkprs9bSHe33Ej4G?=
X-Exchange-RoutingPolicyChecked: TvUsIwiYXnGBcXUI8P2R5+7vviUV9eD1KLt2hdvSZFyYryA5WipDvQZNlt1FktT/lkFSndwCiN1JZ2Yc/tSERSzrk0Mmgwn235s0quIQ/Dnbh8B8jjz9dHxSITZ2XoRBtVYuJL/gsJwJEqKuLl693BNWRJHkmgQiIYBrqe2pdvt8tc2TL5DMw5zrOysx9zBgvJ5+pcH8WwZYUWFwlq3E19fP2W7z8UlkWtMEkBjO850VO71q8rxnnRpdZ4tNTbQ6PYG6wKM9Iiy5VBOJb5C1kZpJhRaCBzpCVSHFzYZRBOZD4ajsDB7RRaWvgjew1kHhWO9EVC1eYVkt3TtmGJ4WIQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bd7535d0-29cd-4134-015a-08df1f91dccf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 07:59:04.9171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Sr3OtmzSj0lbz3bsxzFuKGaw4FVc9R53j/uxhw/8RWtxvGfGO40bca0OKesKUnV+yGpvSZZT13Eh2z7tym8gY6g4pjqQN5YpouKLEoh2oA3dqgUDs4gvkQi83u3uTqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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


On 10-09-2026 17:35, Purkait, Soham wrote:
> Hi Ravi,
>
> On 03-09-2026 13:03, Ravi Kishore Koppuravuri wrote:
>> Add netlink request/response handling for DRM_RAS_CMD_GET_ERROR_COUNTER.
>>
>> Cc: Purkait Soham <soham.purkait@intel.com>
>> Cc: Riana Tauro <riana.tauro@intel.com>
>> Cc: Gupta Anshuman <anshuman.gupta@intel.com>
>> Cc: Jadav Raag <raag.jadav@intel.com>
>> Cc: Nilawar Badal <badal.nilawar@intel.com>
>> Cc: Koujalagi Mallesh <mallesh.koujalagi@intel.com>
>> Cc: Harish Chegondi <harish.chegondi@intel.com>
>> Signed-off-by: Ravi Kishore Koppuravuri 
>> <ravi.kishore.koppuravuri@intel.com>
>> ---
>> v2:Handled ACK/FINISH/ERR nl responses using separate callbacks
>>     Added a check whether error_value updated by valid callback or not
>>     Added a check whether response required for the command or not
>> v4:Added support to poll for incoming netlink messages with 10 
>> seconds timeout
>>     Renamed the library functions with prefix "igt_drm_netlink_*" and
>>     other cosmetic changes (Nikula Jani & Kamil)
>> ---
>>   lib/igt_drm_netlink.c | 268 +++++++++++++++++++++++++++++++++++++++++-
>>   lib/igt_drm_netlink.h |   9 ++
>>   2 files changed, 275 insertions(+), 2 deletions(-)
>>
>> diff --git a/lib/igt_drm_netlink.c b/lib/igt_drm_netlink.c
>> index 709c01987..b18e3eeb6 100644
>> --- a/lib/igt_drm_netlink.c
>> +++ b/lib/igt_drm_netlink.c
>> @@ -3,6 +3,8 @@
>>    * Copyright © 2026 Intel Corporation
>>    */
>>   +#include <errno.h>
>> +#include <poll.h>
>>   #include <stdint.h>
>>     #include <netlink/genl/ctrl.h>
>> @@ -11,6 +13,229 @@
>>   #include "igt_core.h"
>>   #include "igt_drm_netlink.h"
>>   +#define DRM_RAS_NETLINK_REPLY_TIMEOUT_MS 10000
>> +
>> +static int ras_command_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +    struct nlmsghdr *nlh;
>> +    struct genlmsghdr *gnlh;
>> +    int ret;
>> +
>> +    nlh = nlmsg_hdr(msg);
>> +    gnlh = nlmsg_data(nlh);
>> +
>> +    switch (gnlh->cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER: {
>> +        struct nlattr *attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX + 1];
>> +
>> +        ret = genlmsg_parse(nlh, 0, attrs,
>> +                    DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX, NULL);
>> +        if (ret < 0)
>> +            return NL_SKIP;
>> +
>> +        if (!attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE])
>> +            return NL_SKIP;
>> +
>> +        ctx->error_value = 
>> nla_get_u32(attrs[DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE]);
>> +        break;
>> +    }
>> +    default:
>> +        return NL_SKIP;
>> +    }
>> +
>> +    ctx->reply_received = true;
>> +    if (ctx->ack_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_OK;
>> +}
>> +
>> +static int ras_error_cb(struct sockaddr_nl *nla, struct nlmsgerr 
>> *err, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->last_nl_error = err->error;
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_ack_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->ack_received = true;
>> +    if (!ctx->response_required || ctx->reply_received)
>> +        ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int ras_finish_cb(struct nl_msg *msg, void *arg)
>> +{
>> +    struct app_context *ctx = arg;
>> +
>> +    ctx->cmd_done = true;
>> +
>> +    return NL_STOP;
>> +}
>> +
>> +static int register_callbacks(struct nl_cb *cb, struct app_context 
>> *ctx)
>> +{
>> +    int ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_VALID, NL_CB_CUSTOM, ras_command_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_ACK, NL_CB_CUSTOM, ras_ack_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_set(cb, NL_CB_FINISH, NL_CB_CUSTOM, ras_finish_cb, 
>> ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    ret = nl_cb_err(cb, NL_CB_CUSTOM, ras_error_cb, ctx);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>> +static int send_and_recv_nl_msg(struct app_context *ctx,
>> +                struct nl_cb *cb,
>> +                struct nl_msg *msg)
>> +{
>> +    struct pollfd pfd = {
>> +        .fd = nl_socket_get_fd(ctx->sock),
>> +        .events = POLLIN,
>> +    };
>> +    int ret;
>> +
>> +    ret = nl_send_auto(ctx->sock, msg);
>> +    nlmsg_free(msg);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        return ret;
>> +    }
>> +
>> +    /* NL Reply and ACK arrive as separate responses */
>> +    while (!ctx->cmd_done) {
>> +        do {
>> +            /* poll for incoming netlink messages with 10 seconds 
>> timeout */
>> +            ret = poll(&pfd, 1, DRM_RAS_NETLINK_REPLY_TIMEOUT_MS);
>> +        } while (ret < 0 && errno == EINTR);
>> +
>> +        if (ret == 0) {
>> +            ret = -ETIMEDOUT;
>> +            break;
>> +        }
>> +
>> +        if (ret < 0) {
>> +            ret = -errno;
>> +            break;
>> +        }
>> +
>> +        if (!(pfd.revents & POLLIN)) {
>> +            ret = -EIO;
>> +            break;
>> +        }
>> +
>> +        ret = nl_recvmsgs(ctx->sock, cb);
>> +        if (ret < 0)
>> +            break;
>> +    }
>> +    nl_cb_put(cb);
>> +
>> +    return ret < 0 ? ret : 0;
>> +}
>> +
>> +static int send_command(struct app_context *ctx, uint8_t cmd)
>> +{
>> +    struct nl_cb *cb;
>> +    struct nl_msg *msg;
>> +    void *msg_head;
>> +    int ret;
>> +
>> +    msg = nlmsg_alloc();
>> +    if (!msg)
>> +        return -ENOMEM;
>> +
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +
>> +    msg_head = genlmsg_put(msg,
>> +                   NL_AUTO_PORT,
>> +                   NL_AUTO_SEQ,
>> +                   ctx->family_id,
>> +                   0,
>> +                   NLM_F_REQUEST | NLM_F_ACK,
>> +                   cmd,
>> +                   DRM_RAS_FAMILY_VERSION);
>> +    if (!msg_head) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    switch (cmd) {
>> +    case DRM_RAS_CMD_GET_ERROR_COUNTER:
>> +        ctx->response_required = true;
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID,
>> +                  ctx->node_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +
>> +        ret = nla_put_u32(msg,
>> +                  DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
>> +                  ctx->error_id);
>> +        if (ret < 0) {
>> +            nlmsg_free(msg);
>> +            return ret;
>> +        }
>> +        break;
>> +    default:
>> +        nlmsg_free(msg);
>> +        return -EOPNOTSUPP;
>> +    }
>> +
>> +    cb = nl_cb_alloc(NL_CB_DEFAULT);
>> +    if (!cb) {
>> +        nlmsg_free(msg);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    ret = register_callbacks(cb, ctx);
>> +    if (ret < 0) {
>> +        nl_cb_put(cb);
>> +        nlmsg_free(msg);
>> +        return ret;
>> +    }
>> +
>> +    return send_and_recv_nl_msg(ctx, cb, msg);
>> +}
>> +
>> +static void reset_drm_ras_netlink_context(struct app_context *ctx)
>> +{
>> +    ctx->sock = NULL;
>> +    ctx->node_id = UINT32_MAX;
>> +    ctx->error_id = UINT32_MAX;
>> +    ctx->error_value = 0;
>> +    ctx->last_nl_error = 0;
>> +    ctx->cmd_done = false;
>> +    ctx->reply_received = false;
>> +    ctx->ack_received = false;
>> +    ctx->response_required = false;
>> +    ctx->family_id = -1;
>> +}
>> +
>>   void igt_drm_netlink_cleanup(struct app_context *ctx)
>>   {
>>       if (!ctx || !ctx->sock)
>> @@ -18,14 +243,19 @@ void igt_drm_netlink_cleanup(struct app_context 
>> *ctx)
>>         nl_close(ctx->sock);
>>       nl_socket_free(ctx->sock);
>> -    ctx->sock = NULL;
>> -    ctx->family_id = -1;
>> +
>> +    reset_drm_ras_netlink_context(ctx);
>>         igt_debug("Cleaned up netlink socket.\n");
>>   }
>>     int igt_drm_netlink_init(struct app_context *ctx)
>>   {
>> +    if (!ctx)
>> +        return -EINVAL;
>> +
>> +    reset_drm_ras_netlink_context(ctx);
>> +
>>       ctx->sock = nl_socket_alloc();
>>       if (!ctx->sock)
>>           return -1;
>> @@ -52,3 +282,37 @@ int igt_drm_netlink_init(struct app_context *ctx)
>>             DRM_RAS_FAMILY_NAME, ctx->family_id);
>>       return 0;
>>   }
>> +
>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx)
>
> Aren't the return codes here mixing -errno and libnl -NLE_* values, 
> which overlap numerically and mean different things?
>
> Thanks,
> Soham

Agree. will add support to convert libnl return codes in alignment with 
errno codes.

Thanks,

Ravi Kishore K.

>> +{
>> +    int ret;
>> +
>> +    if (!ctx || !ctx->sock || ctx->family_id < 0)
>> +        return -EINVAL;
>> +
>> +    if (ctx->node_id == UINT32_MAX ||
>> +        ctx->error_id == UINT32_MAX ||
>> +        ctx->error_id == 0) {
>> +        igt_warn("Invalid node_id (%u) or error_id (%u) provided. "
>> +             "node_id should be >= 0 and error_id should be >= 1.\n",
>> +             ctx->node_id, ctx->error_id);
>> +        return -EINVAL;
>> +    }
>> +
>> +    ctx->error_value = UINT32_MAX;
>> +
>> +    ret = send_command(ctx, DRM_RAS_CMD_GET_ERROR_COUNTER);
>> +    if (ret < 0)
>> +        return ret;
>> +
>> +    if (ctx->error_value == UINT32_MAX) {
>> +        igt_warn("No valid error counter reply: node_id=%u 
>> error_id=%u kernel_error=%d\n",
>> +             ctx->node_id, ctx->error_id, ctx->last_nl_error);
>> +        return ctx->last_nl_error ? ctx->last_nl_error : -ENODATA;
>> +    }
>> +
>> +    igt_debug("Retrieved error counter: node_id=%u error_id=%u 
>> value=%u\n",
>> +          ctx->node_id, ctx->error_id, ctx->error_value);
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_drm_netlink.h b/lib/igt_drm_netlink.h
>> index 0e563e55f..5db7f4ab5 100644
>> --- a/lib/igt_drm_netlink.h
>> +++ b/lib/igt_drm_netlink.h
>> @@ -10,11 +10,20 @@
>>     struct app_context {
>>       struct nl_sock *sock;
>> +    uint32_t node_id;
>> +    uint32_t error_id;
>> +    uint32_t error_value;
>> +    int last_nl_error;
>> +    bool cmd_done;
>> +    bool reply_received;
>> +    bool ack_received;
>> +    bool response_required;
>>       int family_id;
>>   };
>>     void igt_drm_netlink_cleanup(struct app_context *ctx);
>>   int igt_drm_netlink_init(struct app_context *ctx);
>> +int igt_drm_netlink_get_error_counter(struct app_context *ctx);
>>     #endif /* IGT_DRM_NETLINK_H */
