Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F360C5DF9D
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 06:56:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EDE210EE88;
	Thu, 27 Aug 2026 06:56:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lOGVQzqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A303610E3A9
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 06:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787813679; x=1819349679;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=M8MZVp0l93KCW098RvkvPX/2i1xTt8DNMrAlQgAByLo=;
 b=lOGVQzqoYm185p+MNZEXmM27FdDAUz6KOsVSvCumU4XAWgqAdjDPKN7L
 U6FwoEU3urlW1qqsGhV40EyY9074evaFKvIR9PDVWdq10u/0qrYHftDvg
 +9g569GMu6/Q7gjg9NDQ9NK2kKD31qo/tGPD20wvChhd9wJCnl6AFzSkU
 uyEqbBAhNAMj74WrCxAXtSRJBA6q5e5ry0TDHnWF0jlQ0kd2c+surZcEo
 QhAW2GzroxG8A2z2wCpZiXfehwT6dK5h25a8u6KeGZY/wtdAkme1rNXVp
 s/QOrDTUSX8LvX5DGMLq+rQW2zPlWjO84S6qOQLdZ8F/O6boi+ZimbRSp g==;
X-CSE-ConnectionGUID: y/SEhnksR9GGswbgbOvcaQ==
X-CSE-MsgGUID: 2T+TVsP7SdmLf/wQ46zVQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88362025"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; d="scan'208";a="88362025"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:38 -0700
X-CSE-ConnectionGUID: vXJtF/zBRHWod6+QSdSflA==
X-CSE-MsgGUID: 0gEKCTNXR2qhb1T+FDP+2w==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2026 23:54:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:38 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 26 Aug 2026 23:54:38 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 26 Aug 2026 23:54:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TXIdpB4v5pYrzEnX0VDHnopruWc+gLpOhk+mCNeB8uMwU15SsspWSPZaB7Sxx2qzK4DvIRxxudddjKNxdmqNL5nTK5XhL0dQ6Wx1iglszJa2BT72dGDW9CX+OmAN0zHBsZIbdy/kmOFtmDeD2Wn3N3UQ5QY/Re85OzqiZL91OzEdpl0I45Hd+mE8B2AKjNivHnALeaxeavkVrg75nwsQtx/BRgCMDY+lFow821+olVoZ0MKxJ0DkJbhrV66nyKzO74bYIM5liWNPQdZ/AMuwSFx4oFPZB2jYVeiYTkS7lYKIfUmFzMMiolRWOCU5ovrzziNxBh+dQpHOqJ8Cz8kJVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LT2BuSO9Tnk2SCw8KnYGGeVdSU6ruY6Xj3rIlLB4GGc=;
 b=FISdVcQU85XLmUsbDr8CpP73IaTL5ta3SBWWtwxVLsrlL0rp3xb8shE/er/LZHn8jPrn5RMrbTw6MyotmM/gAFa9aSLNIVPFjL6oRN3GNm1xFwRdCTrEk6VinFLvVIhPjwQj6METqu/QFNMHH2+v86bd6RK8UReTx5TLVITjIUUrjSOyziu/T7B8Udemh+B9XlPChcIb23Yn/rbmQkkBU4qFQ3MqK70MBJdwbTXx3f1gbtPZHNnh6m6oik6nr4bZhDLYY7cR7RzCykhkLAAUkXeiZ+qz1GUDtL/rnRasQgvx4eb/MENTsGZ8aUi8PERFzoexJqy85ZzqF547Akb7Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by PH7PR11MB6697.namprd11.prod.outlook.com (2603:10b6:510:1ab::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Thu, 27 Aug
 2026 06:54:34 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.005; Thu, 27 Aug 2026
 06:54:28 +0000
Message-ID: <23fa19f3-b3b7-4d84-bb29-1c32e81c1a90@intel.com>
Date: Thu, 27 Aug 2026 12:24:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 2/3] lib/igt_vrr:Add VRR helper library for
 display refresh rate testing
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <mitulkumar.ajitkumar.golani@intel.com>
References: <20260825183359.2791891-1-ramanaidu.naladala@intel.com>
 <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260825183359.2791891-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0207.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::15) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|PH7PR11MB6697:EE_
X-MS-Office365-Filtering-Correlation-Id: a3212522-e68a-461d-5815-08df04080702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|3023799007|56012099006|4143699003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: k7jbPLAvLTOzAdidI1Kq9FiXsRJu/tkWy9WSgI2OyCswCXU3LIxtbkOv+2G9CLc5FcDScek9BCJ0X1JvR+YmnDAZENAT0+Vsa2KexdZwDdcFy889XzSbijTGR3rfMZiOVXxg5S6lQOUm+DHeljMmcK7AnXGVMHrf0Ouox9beCt1FKzvCxRJ3gFzaLNiBurLRSVfPjhsE70JfCSe7xmAx2wQgTdHU/P8gyjNWQBenIDIhLxaqXZuYIBcd2N5hcpTCDNzX2KQXEUPLqo12eeeeTwT/PtnvN9a4JtM9Xt8+shNUEB3TdaeJVdbHW8qn3xG7iZDOZd2lqjRo6Sy+YTY3p31EaehWRFUVXSCTunSsEM7t6mvk5WSjMgiKIrm/I4RiyGW+TVXTQZDZFY3dsU+3oMBwyDYed3YclNWruAX7Y3ztXlrpxKUpnFYYuhBNH2F6wvXNL3hwj2+tEIXHbgDou28VrxKMl/jJld0WpMfuOKot9j9xNLZTw1WPi2NZpyMizzhz15k6OcBkpr+I2YWDlFXFRqUna9gJN5v3RNWumglF3qRv3tiYzS1gN1GlhFXsPCKVNyi5FRaIm83tlRxL1TzeR4+x6tRzOl7FHwgT98jo/vhd74A5WsIcd7r17QYEPkcwfb64B07ZEaGajbwchHLplsu3FRw7Py+p2/q3Z7I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(3023799007)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cldrbWQvaHpNd1I3Z3p5ZDVWZFhpNEZLVEY2S1NtditobVFmankzSnhHUU5G?=
 =?utf-8?B?MjY5VEFneXlqdVBWcDVNb2Z0anZCVGZ3bW9uUHBhZzdUZmM1QXNpWmswRnhp?=
 =?utf-8?B?bVhBQUx1dlFBSFZ1T3d2blZhQlppbWk1SVBuL0wrOFpOMFVCOE1pVXdtRlZB?=
 =?utf-8?B?WG9VYmlBY21IS284VG1uaERRZ3NORUlUbVB3aHhDb2p3M1JVZURPNmUyQ3M0?=
 =?utf-8?B?bE5HMVFHd05lcW1kSHVKelJIS2lmWXYrODFIVXcxT2F4cTRNeG5OalAyUHdP?=
 =?utf-8?B?UWZHSGU3aWNrS0Z4NitPeVFjV2VRTDJ1azFMcjgwcmRSRExOZUt5SjNucnpE?=
 =?utf-8?B?N2preXMvNGU1V0xHOUNSK0hnbWcwcGM4Z3I4OGNaZUdLT1NkU3Z3Mk5ac1hO?=
 =?utf-8?B?UHNrOXR5YitYcjNtdmNiZjZQaUNsZ3B6QlNBL1k4ZUF6ZXdVRzhabGErTXpK?=
 =?utf-8?B?Y2ZnWlA3YndwcGp3SmF3Sk5xSzhyZVNudzVMSjVzN2RSUWRMSkV6N1M4WlR0?=
 =?utf-8?B?dXU2dGFud0t5YzMwdVh3OXpRY3N0YUVLbGl2Vmd6eUw5dFlFaS9WRXg1MVRW?=
 =?utf-8?B?ZzRJOXdUY0FlSXFwMTJpZ0RaQms4VW53TUVUd3AwU0dmT3JLWk9hVXVmdnhV?=
 =?utf-8?B?ak1hUGdLbmtBNUlsUEg0UU41alU5WVhwTnFMa2tQdEJkRHc4VDkxSjJ1aUVk?=
 =?utf-8?B?OUhwRU5tOVU3NHZEOEFDL0xZcS8rWW9UU0sxQ1h5L2cwemwxL1F1d1VSS2lr?=
 =?utf-8?B?VXlCV2pZSkM2VFhKaFFheHJlM3pzRTl2K3R1WnVtZm1iM0VuUlZBTkJjN3FJ?=
 =?utf-8?B?a0xUVzFiai9mQXh1WnJUU2FRQkNlOEVNYXFsOTBHTU5PbnZuOHhsYlJRMmt1?=
 =?utf-8?B?ZGV1Z0RReU9MeWNpVmhNOGxXYXVUMkhNT1VEc211S3VNQVdNbGhwb3JPV3ly?=
 =?utf-8?B?eEhhNWpRWnBWRk9KMTJUazRudjJWUVRFbDU5dksyTmRvOVVSNFU5Q2hxU3U3?=
 =?utf-8?B?WERld3dXOFVLc3pEUlk5QjR6eTdzNUppa2Q2elAyZ2I2b1BpbnViclVqclp5?=
 =?utf-8?B?YTdwR3l1RTNTb2g0dm9taTBMb3k3UUZjNWRTTjFJa2Q0OEpacnNZOXRhSm1D?=
 =?utf-8?B?OEJSdHQ5enJURFRsRUZxRUdtNE5KZVFnTUZ4TWlnQkF4SXVIYXhVRXFuNTVK?=
 =?utf-8?B?eDVKYy9TWHFIaHZuQjJvLzFDeU5DQWx2WXZma2hXZWdXTmFqd0ZqbEJhZTll?=
 =?utf-8?B?clYwVWwxQjdGM3V4NDBjRDdDSWhiTlFIWG50QVVpNHFtWlhEMW1HMlZVeHdh?=
 =?utf-8?B?TFVBSUJYV2VCODVRYmVwOTBDMExrSnVsM1RmWElZK3JhN3ZvUXRxRlRMN0Rw?=
 =?utf-8?B?ckFidG5MM0VBOC9Ud1RSVk1MaVpVWVJGdE5aKyt3WjNFSk9ZaGQ1Y0dTc2RQ?=
 =?utf-8?B?bDBmY2cvOUs2bVpxd3h4T25xNTc3MDIreVVSMlk4SSsvV3R1MVp1WTdGdndl?=
 =?utf-8?B?L0RrQkhJWFQ0MGhyQ3ozUGE5QWRzUTdHdjhKS0w1OGZLR29RVVhsV2JEUDQv?=
 =?utf-8?B?K3lUbnBvZUFTai8xejc1akl4T1hOSzJlS0swcEYvL3JwMTNxZ1k2QkxqdGdl?=
 =?utf-8?B?S09UVXlVclB6RzdrTDFxUU9CaWdsTnRBTnEyd0NETzlETHR2djhBOEMxZUZO?=
 =?utf-8?B?WTgzb0lOL0hrMUVhbGhRYmxPdUVRTCs5Y2VRQ3pGUVJhMGFEcHY1WjRRamRt?=
 =?utf-8?B?eWpvU3J4WUhYUVQ5V0grVmV1MjZRMHp4NWcxNytWbW02ZjFNemgxbXJDWHVI?=
 =?utf-8?B?NWszQ014OTFXNGdsWk5CeGdxdTR5blZrSWhnTm8xd3dMNTAvcC82NFg4M2Rr?=
 =?utf-8?B?YjFTc3VvVEhHK0lRUXgvTFBkYURndEtYQldQS1hzWDR4dVRxS3RqWmZpQTZN?=
 =?utf-8?B?ZXZXYzZabWE1VGhnYmRnTkltVlVoMklaUGc1K01mZU1uSEVVNGh6aktRNGV2?=
 =?utf-8?B?VHVuVHliV3hvZ3IxVEpFdjJ6d2RCYUhoeGhXZDB4czg1YUJkQSs1OVJQa0dE?=
 =?utf-8?B?ZnV5c20xYmUwR0ZraVJJS0M2OTlDWll1VXdZeHlhaTdCaHZlODFNUkNmTHNn?=
 =?utf-8?B?VkNrVDNlbmdPSm0vVWdZK1VDeHl5dm8wS2dWQU9oVy8xcUErS0Mvb2FjMGJp?=
 =?utf-8?B?akpZK1NDbGFwZk4rYnI4OENveEwydUZsSUcwcEMveWpROStYcWtNOXRzTUhs?=
 =?utf-8?B?dWw2N3RLQ0xWcUU3NEpqWXRmNEgxaTRQREJtZmxra1JFQ244Sk4wdGZERHha?=
 =?utf-8?B?ejNKTmh4dzFkdDVTSzZjdURrN3haWjl5VXV5Ui9keDI0NWxMcFdCRVJzbnNF?=
 =?utf-8?Q?/0NQQm6zuy2ShBi1/SYALZqAm1Ycd7Qui9GZb?=
X-Exchange-RoutingPolicyChecked: 5XcmDjkGpmfprtBTSAxr94tBzt+vK+R0zHf9iI1z9Seh20U1hPB8V+iveKW1uKH+mgaOf+EhLcpKSdvyV56U9P1GFhBjzFNUcJ9VYvOh0xzsgS4KoQNHHDGJ2Bn3U5i23J1LIA8uzMRy6P+Zg1+i4UWtSKq+UkPj6Ad0MRDXGEPHfk3O4Xt4LJCozREw5d7XxdwQjMcFkWI2xRJOCh7KiPKzvH5dhEent3dQwG863TbhkAR9DzF8TogQcxlOwzAfSwiHBecilgfj6ETGbQpK8mKIVkHFdqSzHTJn0K5PWkYgz0xNyu1SE9mtHpH7ek52npUQuaKpAYclXp5MvL4+Kw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a3212522-e68a-461d-5815-08df04080702
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 06:54:23.4804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+H8a4rdfgwj0VSFZMXIiKE7/bBtSBfBZnRo5JGVMgDB3//5SAiUuaehYktxjSxk/b2Jal2mPiiDO5cIKZ07VnmbHgVin56hfTBt98ovipo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6697
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



On 8/26/2026 12:03 AM, Naladala Ramanaidu wrote:
> Introduce a new helper library for Variable Refresh Rate (VRR).
> 
> Add helpers to validate targeted refresh-rate testing.
> 
> v2: Modify debugfs with helpers.
> v3: Add helper to check cmrr support.
>      Address review comments. (Mitul)
> v4: Address below review comments.
>      - Add source and rationale for standard timing refresh
>        rates. (Chaitanya)
>      - Restrict target RR debugfs helper to Intel devices. (Chaitanya)
>      - Make Intel target RR debugfs helper return bool instead of
>        asserting in the library. (Mitul)
>      - Avoid assertions in library functions and return status
>        instead. (karthik)
>      - Reorder source list as per naming convention.
>      - Rename cmrr_supported() to igt_vrr_target_refresh_rate_supported()
>        for consistency. (Chaitanya)
>      - Move CMRR-specific macros and enums from the library to the test
>        file. (Chaitanya)
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   lib/igt_vrr.c   | 149 ++++++++++++++++++++++++++++++++++++++++++++++++
>   lib/igt_vrr.h   |  29 ++++++++++
>   lib/meson.build |   1 +
>   3 files changed, 179 insertions(+)
>   create mode 100644 lib/igt_vrr.c
>   create mode 100644 lib/igt_vrr.h
> 
> diff --git a/lib/igt_vrr.c b/lib/igt_vrr.c
> new file mode 100644
> index 000000000..5b710b3cf
> --- /dev/null
> +++ b/lib/igt_vrr.c
> @@ -0,0 +1,149 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include <inttypes.h>
> +
> +#include "igt_vrr.h"
> +#include "igt_sysfs.h"
> +
> +/**
> + * Integer refresh rates that sinks advertise as standard video timings, and
> + * for which a fractional (rate * 1000/1001) counterpart is also defined:
> + *
> + *  - 24, 25, 30, 50 and 60 Hz are the film and broadcast (PAL/NTSC) cadences
> + *    carried over into the CTA-861 video formats.
> + *  - 48, 96, 100, 120, 200 and 240 Hz are the integer multiples of those
> + *    cadences, also listed as CTA-861 video formats.
> + *  - 75, 90, 144, 165 and 180 Hz are VESA DMT/CVT and adaptive-sync panel
> + *    rates in common use.
> + *
> + * The fractional variant of each entry (e.g. 60 -> 59.94) is what a target
> + * refresh rate in video mode programs.
> + */
> +const uint32_t igt_vrr_standard_video_timing_fps[] = {
> +	24, 25, 30, 48, 50, 60, 75, 90, 96, 100, 120, 144, 165, 180, 200, 240,
> +};
> +
> +const size_t igt_vrr_standard_video_timing_fps_count =
> +	ARRAY_SIZE(igt_vrr_standard_video_timing_fps);
> +
> +/**
> + * igt_intel_target_rr_debugfs_write:

Don't name these intel specific.

Otherwise these won't belong in lib, right?

For now just make the debugfs check intel specific.
If other drivers want to have similar implementation they can add their 
own debugfs.

Also keep the debugfs check in igt_intel_target_rr_debugfs_read and 
igt_vrr_intel_target_refresh_rate_supported

> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @numerator: Numerator of the target refresh rate fraction.
> + * @denominator: Denominator of the target refresh rate fraction.
> + *

Use actual arg names.

> + * Write the target refresh rate configuration to the per-CRTC
> + * VRR debugfs interface. Passing 0/0 clears the target refresh
> + * rate.
> + *
> + * Returns:
> + * true if the target refresh rate was read successfully, false otherwise.

written

> + */
> +bool
> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
> +				  uint32_t rr_numerator,
> +				  uint32_t rr_denominator)
> +{
> +	char buf[32];
> +	int ret, dir, len;
> +
> +	if (!is_intel_device(fd)) {
> +		igt_info("Not an Intel device\n");
> +		return false;
> +	}
> +
> +	len = snprintf(buf, sizeof(buf), "%u/%u", rr_numerator, rr_denominator);
> +	if (len <= 0 || len >= (int)sizeof(buf))
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_write(dir, "intel_vrr_target_refresh_rate", buf, len);
> +	close(dir);
> +
> +	return ret == len;
> +}
> +
> +/**
> + * igt_intel_target_rr_debugfs_read:
> + * @fd: DRM file descriptor.
> + * @crtc_index: Index of the CRTC.
> + * @buf: Buffer to store the target refresh rate string.
> + * @size: Size of @buf in bytes.
> + *
> + * Read the target refresh rate from the Intel per-CRTC VRR debugfs
> + * interface. The returned string is always NUL-terminated on success.
> + *
> + * Return:
> + * true if the target refresh rate was read successfully, false otherwise.
> + */
> +bool
> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index, char *buf, size_t size)
> +{
> +	int ret, dir;
> +
> +	if (!buf || !size)
> +		return false;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +	if (dir < 0)
> +		return false;
> +
> +	ret = igt_sysfs_read(dir, "intel_vrr_target_refresh_rate",
> +			     buf, size - 1);
> +	close(dir);
> +
> +	if (ret < 0)
> +		return false;
> +
> +	buf[ret] = '\0';
> +
> +	return true;
> +}
> +
> +/**
> + * igt_vrr_mode_line_refresh_hz:
> + * @mode: DRM display mode used for the calculation
> + *
> + * Compute the refresh rate directly from the mode timing parameters.
> + *
> + * Returns: Refresh rate in Hz as a floating-point value.
> + */
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode)
> +{
> +	return (double)mode->clock * 1000.0 / ((double)mode->htotal * (double)mode->vtotal);
> +}
> +
> +/**
> + * igt_vrr_intel_target_refresh_rate_supported:
> + * @fd: DRM device file descriptor.
> + * @crtc_index: Index of the CRTC.
> + *
> + * Checks whether the intel_vrr_target_refresh_rate debugfs node is present
> + * for the specified CRTC, indicating CMRR support.
> + *
> + * Returns: true if CMRR is supported, false otherwise.
> + */
> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index)
> +{
> +	int dir;
> +
> +	dir = igt_debugfs_crtc_dir(fd, crtc_index);
> +
> +	if (dir < 0)
> +		return false;
> +
> +	if (faccessat(dir, "intel_vrr_target_refresh_rate", F_OK, 0) == 0) {
> +		close(dir);
> +		return true;
> +	}
> +
> +	close(dir);
> +	return false;
> +}
> diff --git a/lib/igt_vrr.h b/lib/igt_vrr.h
> new file mode 100644
> index 000000000..d56639727
> --- /dev/null
> +++ b/lib/igt_vrr.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef IGT_VRR_H
> +#define IGT_VRR_H
> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include "igt.h"
> +#include "igt_kms.h"
> +
> +extern const uint32_t igt_vrr_standard_video_timing_fps[];
> +extern const size_t igt_vrr_standard_video_timing_fps_count;
> +
> +bool
> +igt_intel_target_rr_debugfs_write(int fd, int crtc_index,
> +				  uint32_t rr_numerator,
> +				  uint32_t rr_denominator);
> +bool
> +igt_intel_target_rr_debugfs_read(int fd, int crtc_index,
> +				 char *buf, size_t size);
> +
> +double igt_vrr_mode_line_refresh_hz(const drmModeModeInfo *mode);
> +
> +bool igt_vrr_intel_target_refresh_rate_supported(int fd, int crtc_index);
> +
> +#endif
> diff --git a/lib/meson.build b/lib/meson.build
> index a7cde027e..b5aece55a 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -56,6 +56,7 @@ lib_sources = [
>   	'igt_vec.c',
>   	'igt_vgem.c',
>   	'igt_vkms.c',
> +        'igt_vrr.c',
>   	'igt_x86.c',
>   	'instdone.c',
>   	'intel_allocator.c',

