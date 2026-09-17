Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A5BC982D6
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 15:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E6C10E519;
	Thu, 17 Sep 2026 15:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SGO+x3M4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3519F10E6F8
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 15:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789659207; x=1821195207;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wTH/injRil67CjqT0CZyMMVuvnryjh2ApZSwyd3zQTg=;
 b=SGO+x3M4tMv1d6gwIQTmBZbZ5a3BG9cHNXc9sS9VrW3VwYV1lxfVj+HU
 hVBtVUw5sQZBowLxmRhyQ7IXAUtxHllTInx1ftesHwR0iUzY8YXYSiVRx
 nagobkK3qpUXBHztIz4eOwnNfT/svaqHfLBQIBStloyrA2IlSF2zKTgzk
 GZHELrx46cz640xL9SZrnVPRrx4ZYuU7WNZGCrKSqqZZ2rkSkBGoq9Keh
 2W3/VKkGottagazJiLa5Ra5/j34NstJNXnv4BWcz9W9Bj0a3Sza7Jj8VM
 P0k+ulTZH2ATQlnLDpu7+dfT79IwXl90Quny8jywlXKE3ik3p73z9V1Yt A==;
X-CSE-ConnectionGUID: YMGK/AtkSI2W8ec8T/2Tsw==
X-CSE-MsgGUID: wILEBEK+SyORS0caoiC4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89229937"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89229937"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:33:26 -0700
X-CSE-ConnectionGUID: 2YJW/XLfQye2/55VtUYPhg==
X-CSE-MsgGUID: 7xj2y94WRrONRJTGagHNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="275824071"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 08:33:26 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:33:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 08:33:25 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.19) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 08:33:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBBtnkY/R0Ck8gFw9EQnWghgHZVxEFDJyKOx0iSsADmeDsU5sF/EJs0B1ko5jd/vmxenWMy5esa/daTJOP6YQ9+14Tt5LH9Dy7+6Z4VhulMTKhRfCQuFc9+dmBSR8158X/ldFv6JWWyPaSoWJUuM0tnEfDEVCCHAcIqu8sb0Woa4rhY7kWbsPa8XFOA/hjz4G0y6lVthVATODDhgRkNC/1LBTzECUwVUN2pPLVS2SnWaB6+3mS0LCFB/svai+IOYngdDTNmyYXWwF9rile5ERh/x+ULdGFUNSvl8K88jhZgLOjl3LaiTC9cp2RAxmumOLXElR3C8MMiPVYkVelgQjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQcYbxQ20OhcnA2ND9kDaKCPpfslPCyLIrcCd98iUPU=;
 b=k6GNbPLauZRAxQZYq7FM4rUKi0CmerlWABrRGWwjpfLbNcwbfE8fIUPflBD+VKnhZvJe9ZJ6iDYRD7z+7ZMVTVm+8HWqeZULsw8rcT82ny0S1K6pJ6vd8divV6VoVL9CEIjdOnuRJ66ejW0MpG8wA6L3/oZlpU/+9v5wXXT4A1Ivhtv0E4dQbTGKVmCQZhpqq7wZNrUG0NJ1xwXfwzNlGO0xXCMI4HX35mBgo6CBgbRy092dnZ9JTlXGd6OgMdmS0lGg8B5Hnz2bjGib0VQe5WkzDccQ8XmrKQubfu+9R8MxVrDCP9LNJG7LAZkaRA5ifIM8geMO2v1xgzbD0TqJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6195.namprd11.prod.outlook.com (2603:10b6:208:3e9::8)
 by IA3PR11MB9255.namprd11.prod.outlook.com (2603:10b6:208:578::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 15:33:21 +0000
Received: from IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391]) by IA1PR11MB6195.namprd11.prod.outlook.com
 ([fe80::9ca6:19ac:7036:d391%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 15:33:21 +0000
Message-ID: <0d543a61-f9f1-4282-93b2-ff0cece315e0@intel.com>
Date: Thu, 17 Sep 2026 17:33:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [v1,1/4] lib/igt_pci: Add raw configuration space helpers
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20260916115201.1973752-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <20260916115201.1973752-2-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0198.eurprd02.prod.outlook.com
 (2603:10a6:20b:28e::35) To IA1PR11MB6195.namprd11.prod.outlook.com
 (2603:10b6:208:3e9::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6195:EE_|IA3PR11MB9255:EE_
X-MS-Office365-Filtering-Correlation-Id: 335c01fc-145d-4c32-cf28-08df14d10173
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|10067099003|18002099003|6133799003|22082099003;
X-Microsoft-Antispam-Message-Info: MzEasXeSxIvgqXsjFU3hmVs7vfPey5Q+qHQfF/b7V2FxV6h+QEdfv1ziJhS2tpDB/ouL4jsc5USKyt+zAajIDiXx/AVOZhNejs4KNU8OsakmhMrx4NCn5p9aoAP9UdAF1C8sG+sxP7E8DuktCUdMSn/og2EOh38tR5J2j8nkykscdovfAYlO3whfJMbmwbRTb5NVJfh6k0WFvsLNj6g+/mceoLtGxz8Yp82OpNpARPxRC8Tf/oBJ2PXAkHdnyrWltNlKSjb5lWC7/fbBQxcQfS/WkEBA2tOGPsFpJfFlV/VA7Xc7sWKV4+CePYD1Y8UKyiyHx04JIXzZk+dAAdv0hc289JgiXo4OMlxy9aV70L7ChSU9kU5EMrk4Yfc6/4A/VJMdcWMNzAsi3Z6gfHYJwEUvDkHz6xklF7RHHsn0cXuNaqVtgYMBKEYkTEPDCWkamQIlynpL0SBg8m3TUD9qG6FDArC2zllconx6Kastjp0q7xgPA92pm8lmQVGchHFPeKHd90sW2v2jWQaUC9OgQZkNk2IB545iAe0XEHjlqZqsuY5k8rUQNreuNlh+y5bk9N0eWbOWgwRincoSunP+8lj4b+ajMFeMzt/IREADwxGCKItbiCafkOjJ2amCLnh3WdFwg+QYbZSnwv2oqUM5RNIUql4METTn+FoW2znTtlk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6195.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1VQSmEwL2V1ZEZuWFZDaVBsQy8xK0xVQXc2SEs3Ry9sKzJya0FvbmRjVUkw?=
 =?utf-8?B?dVRIN1hObFBZT1NtRmk1Q1dNVUR2anRYQTJ4NW1UOVhaVTVyUW9CSEtvQjJN?=
 =?utf-8?B?c0hoOVZQUlFsNkhMWURUZlhQUmZVNDhiRy9tK0lja09wbkdtWTl3TlkybGtO?=
 =?utf-8?B?UTlhUk0rWHo0MHhIOEZ6VERqUjZ3NDZnNWYreENiczNYcy9lWmdkejBGL3lh?=
 =?utf-8?B?eTlyZ2dPc21BbTMybXh6dUJjS0ZENEtQYkJmQ1dTL3k5VWFnMjlpYkoxN2dH?=
 =?utf-8?B?bDkxalh1WUx0V1RZa0JDY1ZrQVRUWUlGTE1LekJGbnRXanAvaTYwcGpyYWUw?=
 =?utf-8?B?dUpuOC90NW1LYTdvMFdYMFlkK1NuWnhrdXU2S3Z5cnVNNWZ5Rmc5dWtJY1dR?=
 =?utf-8?B?U0NRV2FwUUxkcDhNLzFua1c4UEtKUHZXZXgxQ0poSFhiVmp3SjNURmFURjJL?=
 =?utf-8?B?djdmMjE4d0RwWDd5WWZpNlJVZnBBYzR1MkJGbFo0UXBNeU5KQW1FOVBpSDZ6?=
 =?utf-8?B?TDl3bDEyRFpsVFk0Mko2MEpCQmQrVEtTZEJ3SVorNmdLa0dJM1Nvbk4ycHFN?=
 =?utf-8?B?TDh1bzF5TW1HZDZ4cFNkRFZIMDBYME0zc3E3SEVVeS8yNmZHYmVPTERXcjd6?=
 =?utf-8?B?QTgxOTRmcnFucXI2UTk4dUNFWHA2QnU1alFrellrZDZjeUdZL3dKc2tVbnFo?=
 =?utf-8?B?bnNnNTJaMHlWV1NPT2ZnZWJ5QWhqcnM1NDNhMU9pWnFhVXgyTERrQzdrbm1a?=
 =?utf-8?B?Z09vQUhid3ZQbzVGS0M4VEQvNWhrNXBNUFplaytMek9pQUdCdGxRUDhOZXBJ?=
 =?utf-8?B?UWQrK2RNa2NyK0pKS3BvZ1RFcnIxOWYxelo0bVRMNURQK0sxc1RwM1ZMS1dX?=
 =?utf-8?B?Y0JMUytweGdaeTlZWCtPVThBMkttMS9mS2p2Z21OeDA0ejJDK1pUSW9VcXp1?=
 =?utf-8?B?M21MNFhTNHRMcmtyRFpwK204cW1MSjU2aE8wdGcyaTNhVEZ0bTlaZGwvZXRs?=
 =?utf-8?B?RnMxR0dEajl2c3hjTEgySVhDYjdGNW5vTFU1dWwvZG80WjJkVzlOVzloTzRu?=
 =?utf-8?B?KzlmWVExcjBsMWNqc3o1M3ErVExsWjNEMHp1OHpOVW1KN0NqM3JmNjJtZDRN?=
 =?utf-8?B?MmNrRkMyQVJrUFNXaHFTckRreWVQa2kySHU5NEV4b1dIV3lPRE4rWHowSDhi?=
 =?utf-8?B?d2ZrQVdydXlVdUZaT2oydkZ2MGdVNU16S3NhSFphYzFBbjg0K1JMb3FXK2dT?=
 =?utf-8?B?cG0vSmlrOTVPclJwZ0h1RElqZmszTms4b0twa1Y3ZDhBNHVHaGJheEt1MDJT?=
 =?utf-8?B?SFExc1RKUWZ0UXJhcGZLaEVZUzdXSDJzN3pNb0c3L21Mb3NHT24vTE9SSG5V?=
 =?utf-8?B?T2xXVUxzUDU0V3F0T0hWWnUzVC9qTUFnNFhOVzdXUmRMQzZ5VFEwempCQ3g3?=
 =?utf-8?B?VGNBbnkvNjdaU3RUKytKYWR2Qk9nQ2lSd3FsUDZrR3FhUHozUGdVZVVFcVZP?=
 =?utf-8?B?ZGphOVg1U0M0ZnRmZnQ4NUdGdVBmdEJQMEY3WHFzdFduR1liNEpTNDRMcm5a?=
 =?utf-8?B?bjkxYmVmcUhnbUpTdStNVVk4emtSTmhlZnZZUmU3M1l2NW10WGlGS1FIbytJ?=
 =?utf-8?B?T2JEalpWT3dYQXo0bjFoUGQ3UW5DaENXbTgxa0RjMW82ZGJXRUJzd2d5Y1NC?=
 =?utf-8?B?NGVaaDdZNXNCVHgxR2N0L2x6Z0hxbS9FSjJBQW1wTElaOU1ZQUREUmJWRHhQ?=
 =?utf-8?B?b0p2MzZZcE5hNVlLaGRLdzNiVGZKYnlKVko4WmR3ZkJVNmdML0R0YmtvYm5q?=
 =?utf-8?B?VFg4NGdrL3NBU3gzaUZmaGN2S0J4TFYxTWhrbXp0T1FZK0tGMy9mQkE2RDhK?=
 =?utf-8?B?bzRsSjFCcUszREZ5SzJDbmhMSkd6NXNSVjlNdGE4V1lUQnJTNHJ2VDB5STNx?=
 =?utf-8?B?TWxaZU5OK29RQTZLa0NYQnROdXVCcDczbVBEQWFpN2JjVHZtaTBpY0wreFVR?=
 =?utf-8?B?ZEt4a0JyUFk5NTBxeTFHc0JDVmhmelZqdWdnV2gySUgxUlVLN3RaRW95RHND?=
 =?utf-8?B?VnRsQlZhKzQ3UmtTL3lWYUp2S3Bkd0xUcjdYd1cxdTBXMGdscXAzaFBUODkw?=
 =?utf-8?B?Y3BwU1NCMGhHb2Q5K1RabDY4QTdMWjNvQ21EaTJzMndObzRId1prMVplaDJI?=
 =?utf-8?B?NmdQaDZyYVRtbFo1ZUM4bjBXdzNROUVaT1FLYTdCZDBjVUdhV1kwY0hGczE0?=
 =?utf-8?B?Ni92UnFOYWxoNGRpejY1L0tjL3BrenEyOVVNRFloT2ZDTTYrN2pjdG1YWmMy?=
 =?utf-8?B?NzB3eE1qdWdGK042bUVPNnVYMTgxdXRBSEVyMzlCbWVJZjNvc3J5UT09?=
X-Exchange-RoutingPolicyChecked: AoHEbV9FrfiZ0f1U6lMWX9hV6FgdxZ/3bJXHB12X30UFlmg9bT7bIYQeRpa9cFXMsuufvOcSSfva1Oogz1437iYUUg04hitil9KSrI+xcTpNcr9K9DSw7axgkeu2HsfU214iuXGiWxV39YKZvIo8qNnwtuytN1bh5PqLmxfP64dCtIt3qiGNF3qIq8zJPDI1BBXrKy2wYzxvG/5YxsYhsgROhdnSP5YEtEZkp57Q1CQ7nt9pTBNVk3kmbejgWEcOeIyqsR3C44CjDzJzqHtW5SFmf+bDLYN+bCHOOcPvkzW95zMUdoRLIPEa+WWo2PmgS3npm54N6R7++6WmPHV0wQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 335c01fc-145d-4c32-cf28-08df14d10173
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6195.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 15:33:21.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CozjEpKaK64jfALGwyOzsGBDXO7i4FCmR/BFSX/gp3sGSIAlC/2SbMdbZoSTYnuxuI09q84PCGTjexFxIMUrgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9255
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


On 9/16/2026 13:51, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski <piotr.piorkowski@intel.com>
>
> Add helpers to read raw PCI configuration space from sysfs and access
> its contents.
> Provide little-endian u16/u32 readers and standard capability lookup
> helpers for configuration-space buffers.
>
> Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Assisted-by: GPT-5.6 Luna

Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>

> ---
>   lib/igt_pci.c | 86 +++++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_pci.h |  7 +++++
>   2 files changed, 93 insertions(+)
>
> diff --git a/lib/igt_pci.c b/lib/igt_pci.c
> index b63550b390..06717fe8eb 100644
> --- a/lib/igt_pci.c
> +++ b/lib/igt_pci.c
> @@ -61,6 +61,92 @@ int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id)
>   	return find_pci_cap_offset_at(dev, cap_id, PCI_CAPS_START);
>   }
>   
> +/**
> + * igt_pci_config_raw_read:
> + * @pci_slot: PCI device BDF (e.g. "0000:01:00.0")
> + * @buffer: destination buffer
> + * @length: number of configuration-space bytes to read
> + *
> + * Read raw PCI configuration space through the device sysfs config attribute.
> + *
> + * Returns 0 on success, otherwise a negative errno-like value.
> + */
> +int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length)
> +{
> +	char path[PATH_MAX];
> +	ssize_t ret;
> +	int err;
> +	int fd;
> +
> +	if (!pci_slot || !buffer || !length)
> +		return -EINVAL;
> +
> +	snprintf(path, sizeof(path), "/sys/bus/pci/devices/%s/config", pci_slot);
> +	fd = open(path, O_RDONLY | O_CLOEXEC);
> +	if (fd < 0)
> +		return -errno;
> +
> +	ret = pread(fd, buffer, length, 0);
> +	err = errno;
> +	close(fd);
> +	if (ret < 0)
> +		return -err;
> +
> +	return (size_t)ret == length ? 0 : -EIO;
> +}
> +
> +uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset)
> +{
> +	return config[offset] | (config[offset + 1] << 8);
> +}
> +
> +uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset)
> +{
> +	return igt_pci_config_raw_read_u16(config, offset) |
> +	       ((uint32_t)igt_pci_config_raw_read_u16(config, offset + 2) << 16);
> +}
> +
> +int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id)
> +{
> +	unsigned int offset = config[PCI_CAPS_START];
> +	unsigned int loop = (PCI_CFG_SPACE_SIZE - PCI_TYPE0_1_HEADER_SIZE) / 2;
> +
> +	while (offset && loop--) {
> +		if (offset < PCI_TYPE0_1_HEADER_SIZE || offset >= PCI_CFG_SPACE_SIZE)
> +			return -EINVAL;
> +
> +		if (config[offset] == cap_id)
> +			return offset;
> +
> +		offset = config[offset + 1];
> +	}
> +
> +	return offset ? -ELOOP : 0;
> +}
> +
> +int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id)
> +{
> +	unsigned int offset = PCI_EXT_CAPS_START;
> +	unsigned int loop = (PCI_EXT_CFG_SPACE_SIZE - offset) / 4;
> +
> +	while (loop--) {
> +		uint32_t header = igt_pci_config_raw_read_u32(config, offset);
> +
> +		if (!header)
> +			break;
> +		if ((header & 0xffff) == cap_id)
> +			return offset;
> +
> +		offset = (header >> 20) & 0xffc;
> +		if (!offset)
> +			break;
> +		if (offset < PCI_EXT_CAPS_START || offset >= PCI_EXT_CFG_SPACE_SIZE)
> +			return -EINVAL;
> +	}
> +
> +	return loop ? 0 : -ELOOP;
> +}
> +
>   static int open_pci_driver_dir(const char *driver)
>   {
>   	char path[PATH_MAX];
> diff --git a/lib/igt_pci.h b/lib/igt_pci.h
> index 509345b2d8..787c10fc51 100644
> --- a/lib/igt_pci.h
> +++ b/lib/igt_pci.h
> @@ -16,6 +16,8 @@ struct pci_device;
>   #define PCI_TYPE0_1_HEADER_SIZE 0x40
>   #define PCI_CAPS_START 0x34
>   #define PCI_CFG_SPACE_SIZE 0x100
> +#define PCI_EXT_CAPS_START 0x100
> +#define PCI_EXT_CFG_SPACE_SIZE 0x1000
>   
>   enum pci_cap_id {
>   	PCI_EXPRESS_CAP_ID = 0x10
> @@ -27,6 +29,11 @@ enum pci_cap_id {
>   #define  PCI_SLOT_PWR_CTRL_PRESENT (1 << 1)
>   
>   int find_pci_cap_offset(struct pci_device *dev, enum pci_cap_id cap_id);
> +int igt_pci_config_raw_read(const char *pci_slot, void *buffer, size_t length);
> +uint16_t igt_pci_config_raw_read_u16(const uint8_t *config, unsigned int offset);
> +uint32_t igt_pci_config_raw_read_u32(const uint8_t *config, unsigned int offset);
> +int igt_pci_config_raw_find_cap_offset(const uint8_t *config, uint8_t cap_id);
> +int igt_pci_config_raw_find_ext_cap_offset(const uint8_t *config, uint16_t cap_id);
>   int igt_pci_device_unbind(const char *pci_slot);
>   int igt_pci_driver_bind(const char *driver, const char *pci_slot);
>   int igt_pci_driver_unbind(const char *driver, const char *pci_slot);
