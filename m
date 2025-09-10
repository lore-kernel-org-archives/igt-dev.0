Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D685CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 10 Sep 2025 04:27:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8B510E2AD;
	Wed, 10 Sep 2025 04:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bt+dKhkb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09A410E2AD
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Sep 2025 04:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757478459; x=1789014459;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MquvXOcSycxAHkW56vvNMHoOOLJqtfWF8+3osZ93hfY=;
 b=Bt+dKhkbi54dZlVWHvoX+j6O/NVc/DmQRnU8DXPELIJuRbxNsv7XHm3M
 sPnqOUyr6e/MFM+/2sgjd0VGazXs4Dsey2r/3ZHfevpwVtHPhYevWZkzM
 Gq4CU6TdgfuyGIk5QZxxk8chBqTtLLCe9gu7ATpeX8Lth6fbp3PN/s8oQ
 i3vDHDMe3xKAhxmnkDVYUI5poRfbPxmYS8NQyJ+w36bwD9i/7vUEhuh8G
 KmpiX6DGqzLLL6zXszpcGN1m1q60yYhPKKpCoCZMbONGN87Yrw5wrAsYN
 qPD4UyCgGRBgT+Xi0J6L26p9R7dcn8SaD4PKqCkzIy/NxFr0wda7xB5Pq Q==;
X-CSE-ConnectionGUID: 8oHpovXrSZCDo3+HRHGKkQ==
X-CSE-MsgGUID: SRbbRvarT6GjAe+tiKGdeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11548"; a="59921620"
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="59921620"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:27:39 -0700
X-CSE-ConnectionGUID: gA5uvayvQruwXzwWMrOHHg==
X-CSE-MsgGUID: IPYrNPucSXO9oOr74MifsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,253,1751266800"; d="scan'208";a="178481071"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 21:27:38 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:27:37 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 21:27:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.46) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 21:27:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j59m7KyCB3XBvshbWx5RXFMBulz9z93XjSRwSdrThsSe61vfwljMijHTka/kY/UxEnSwsVCHP37LxpE84mghPwBNHPgILTB1Vil7fCj18QS2DDLJ5V3rFWuV1WXiDioKcoJsIe++X4HbCHUjgtpD1RLE729x9l0Yc25Gv5z2gSpsJMpaXu1ufiVOeL8gHlCvipyLpzCyun7TRbgmhFoTOU5G51Q2/cm6icCoWJkR+RLWxELDrgCjQnxOAuoqnf1X96mKz3j8v/J1ajJhyyN06mjz1k6QCXEVrBAWya0F8Liwo5xVcjBdNwsiSSp/uxErurz8AfZy1Zjy9ZC0/DjdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0lpdGdojS76XhjkHTcUgMExWngENUGbB5kHb3weC8s=;
 b=LLRNrHh+1OMlXDgQJjQVPyJOx3oR72C+/u8mwrPnWo2PUPeqiTKs3Pvxt3zx01ALS0oScXIF1KE8OhwoQluUCqt78pl4JkDmtIlGQcU1HvpprBqmqz1R/pouYvkN9Ri/Uh0HpFKZddFtiGzc1+/ON2Xe9bJvjNI49XNMWxbJPjHAt8AhXvGWEjvWQLW0AvpbowjSudeSs9fnE04Dx5Kef1RRB/a49FbsJ0n0A7tXoWtsj37RUtmdC81eaCrQX3eacZY5RXoFUSekZy+NDatRoU1iEUhe58yd8XKZUqo1HnLeNbDVRmwzoOpxnpSBKCo8jkNLj8DBDgMjTna+NpKFdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 04:27:34 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 04:27:34 +0000
Message-ID: <842bbf88-4939-44b0-8c95-e01a58d3c0cc@intel.com>
Date: Wed, 10 Sep 2025 09:57:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v4 3/4] tests/intel/kms_dsc_helper: Add helper func()
To: <igt-dev@lists.freedesktop.org>
References: <20250905210816.319104-1-swati2.sharma@intel.com>
 <20250905210816.319104-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250905210816.319104-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: a511d041-86e3-4a1a-99d2-08ddf0225d90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NWl3SmtuYXFKbUkzSUM4TGwwNGRpeUZzQmhqeTdEWFVpbUk3bEZ2ZTFPWW10?=
 =?utf-8?B?bVpYUElWc2ZVazllVTBPOWxoZVphVnRMeXJueHVHSU85cUd5V0dra0htMExw?=
 =?utf-8?B?U2tQeWxwclF1TVREMVFVQTF3TFdtRzNtNW85amxMNXE4WlMrYkZtTjlXY1Fx?=
 =?utf-8?B?UVVUcmlGa3Z1eDlXUkI1ZXFIbEhtQWx3dEhFYW1xQjBQd1paSlZtbFNTYVJP?=
 =?utf-8?B?TUV6ZXY0VVVmaHA4TmtYV3M1TVpDUDNsc0JiZlhWZHMvUll1WnRtOXVhQjNq?=
 =?utf-8?B?S1g1Q2tBeURQVEFkeGdQczhhaHhTSDlrYmtDSVdhZVNaWFMzYVVJY1htMlp4?=
 =?utf-8?B?YTg2M3U3ZWJMcEE0MGl4cFo3eFBGMnhJbkxhd2FzU0Q2UFp2SnBLaGN5cGQw?=
 =?utf-8?B?ajJBa3pPUnhtcS9kZEdSRWhERmNRK0d6TzNJdlM3VnAvbmMwcU5RM09mREtT?=
 =?utf-8?B?U2NFS3dCOUlOVmFIcVRtM295aGlTZk11KzU2NGovNU9MV0RpWXVERDNNY0k5?=
 =?utf-8?B?SjZFWnBtOExtakM4MEMwK1BkZGFpT1VuL2o5M3RtZWFJVklaaFQ0cCtPVW1M?=
 =?utf-8?B?a2Nhc3ZldHEyTFFOcWNVVzUxRlcwbEoyRjlGT05WQTFxYXBZY0w2UnhjWFcz?=
 =?utf-8?B?aTAzVjdhUHoxbndsdHhOMHZNZ0lZbHpqaVdMWWFFbCtIS3p3QkQzbzMvN1Ew?=
 =?utf-8?B?QUdteGQweTloaCtBMVZ5Smw5UzFEeUE0WVVaVWlBemlBT2gwbXFUOFZCRU9F?=
 =?utf-8?B?VGtUclJvMjBEK3I0bDlqVXBmZFRhSStqNHRaK3FUVEQ2SFA2TytSeEdOTDZt?=
 =?utf-8?B?VUZwRmtCRkF1bXlnWTBZT1BYQnBEdnJUUUwyL2RHWFo4a2dqV0ZrYlVrckR1?=
 =?utf-8?B?K0JNWFpSbUQ4WGV6c0I2RUxoSkVDeHpIRS82Zm8yWmVZM3VLUE1VYWFRNnh1?=
 =?utf-8?B?VTZmWVo3eSsyY2l5VkZDTlo5YTRFZ1laZ1BIckZTWDVzSnA0ckFEdWFUaW5F?=
 =?utf-8?B?QVJqeFJjRHEyVjNzcXBnOWI3OUQ1ZEx5Qnd2aldqUHlNVTBKWUN1cm1EOExU?=
 =?utf-8?B?aGRGR2tuQWM2R2Q0bmEwTHh5c2NhS01SR2IvZjJsT2ZTdGo4RzJYZ2dQT2hT?=
 =?utf-8?B?bGVWazY4U1AycFVjbldYY0MvM25kREZLQVcvSW1FNWFreUNCOU9NSVl4VGk2?=
 =?utf-8?B?S0hRbCtidTQrS2diU1pTbTlLai8zSjU5bTFWNHJ3a0FycjAxOGxhL2ZBKzg4?=
 =?utf-8?B?QUR1ckhrUXd5anZQakdqMzdkWUk2cmdaOTU4djIyN1VpWXJqVkdiRFlzOXNK?=
 =?utf-8?B?L2x5aVJLRVR4WEh5Q2pES0k5azZrQTY1eTFnL1FFc0lhZzJuZ1dhNHBCTDZl?=
 =?utf-8?B?MWpuVmVtVnV0aEd2MXhRaVZ1alFhdGEzcml3bld4SXVhYXJBRUFMVVpwMFpi?=
 =?utf-8?B?MGh2Sk1VdGl5TGNMSGwxRHJDQUZybVRIQXMrOTdvN283K1M1S2FDRHlTcG1I?=
 =?utf-8?B?Y2U4QU5FcmYvdWwyWmsrbUQ2VDF4VTh2WHJWSUE3WmFwYVdHV3F6UWRoNUln?=
 =?utf-8?B?N3UyQTlPZGVPZTUwSUc5MDVsS0ZYakFZS3ZvM0FTWlpzbi9Cbk1RODJmMzVI?=
 =?utf-8?B?MEhWZUZKZDcyZkNiQ0JxMFdQZ0Q1cTNGZmhGWEFtMjAzajMzYUpxYTBIcXFt?=
 =?utf-8?B?SEZKQnBzTHZ5K3JJT3dqMGdXc21Rd2hPM2tRaWhxbTFxc1ROTEpvL0VISXRJ?=
 =?utf-8?B?UW1wc3VUNTZDc2VzVE1SRGN3cTNIdjJhK1Joc3ZucDAvZWd6ODluSDVuL1RJ?=
 =?utf-8?B?YXJkbEcrZFNsVm9QUzBpZlU3UXhyQVUyK2VWWmJ3K2RRM1dhN1lxcno1UFdx?=
 =?utf-8?B?MC9zNWlmTUhXZ3U5YlEzNlBYTThzMjBhY3pyeTM5c3I5ZjJNVnlIYis3YndO?=
 =?utf-8?Q?HlmDYZg2m2M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVQ5cDU0cUZMUEZrK04rZ0o5ejVoamtVNDhNWlZuOHNzcExoMkdQbkR5aWRr?=
 =?utf-8?B?eGZJRis0VnpnY0pFTjZkc1p1Qm80VmF4djU5blFOSVA4QkxRUitzdkRpK21Z?=
 =?utf-8?B?YWhDU09yVWw1VWNpK3RxZUd1YTJhdFNWZHRTMmNrcDRPV1Nuc25RRXgwMDlV?=
 =?utf-8?B?ZWFqUE9rZUEzVTA3WTBJYXR3SmJ0aEFLSXhXMUp3Zk94Wk5sc2JaaXVMSVNW?=
 =?utf-8?B?ektCbjdia0lGa3gxR0Y0SUtWb3V2bmlsSTB5eHdJeDI3VXluSHZSeUY5SVFn?=
 =?utf-8?B?cWhQcXZCTGJZaGx2MDhqYkZ2T2RDMi9WRmtVS2VYZk1rUmMxRnFKRi9VQ2JC?=
 =?utf-8?B?R2pXTW9COUIrbUw2VWJvYmpUT1NGTDdxZzdHNFM3OHZ6d2VhUkNCYmNMOHMz?=
 =?utf-8?B?NkdiOWtqQWhFd2ljb0E3aFNTMmFQNm1ydEx0aDhMdEVseW04OXlEd0IyYkxU?=
 =?utf-8?B?dzFxVjl4ZTA4MkhUeUw1ay84T3JLWWUra01FU1RYWmdiVVBUdmtKMWJBTTRP?=
 =?utf-8?B?YjN0VVFqWGdwVXZxclp3VTBMRkp6WFZRY05nSEUydXVlSGt4QmM1ekdIaURa?=
 =?utf-8?B?dlI3UzhXNWFrUlFTQkNFQ0lwZ2RLWVNTeXhBTU5LRHl1c0tEUU03TG9DTzlZ?=
 =?utf-8?B?WjNSSTJCREZMQk5UcTFsNnBPK1A2QkhYT0V3YWNBenVTaGM0YS9XSXRHSTUy?=
 =?utf-8?B?QStwZVo0NXZUbDZQVFRuQnFzdTJnQXQ5OUovN1BDN1l5UEJpcmpMOElOMjhL?=
 =?utf-8?B?dXphWjllL2I4WG01SVZMd0xPQytGckU0RjhRU1QrS1BVc2p6OXFzMklzV2ZJ?=
 =?utf-8?B?bVRUdFFjUkkxZGRUcStpRnB0MnFhRVNqVEhoUy9wVEM1TkI5SDMyWmxPUXVD?=
 =?utf-8?B?Q2tGMGJHM2YxKzJLbS9SemtzQ0xxcGFqcWgwYXdhOW5tNi8xeWRqT01zQVJw?=
 =?utf-8?B?WnlKQWQwOWJIT0w0VS9CaVp5eFB4Zmphcm82SzNTR1JwMGhoZndIOCs2TmQr?=
 =?utf-8?B?Znp1RXFobXova0cwUzhjUGd3cWpmUGt4WWE5WGtMb1ZQeEpEanhKU0h2NllI?=
 =?utf-8?B?Nnlmb0Vaam5UaHRxSUtNK0V0QTEzUTd6TjNTZUtRV3FIS2tzc2M0Ym1oTlZr?=
 =?utf-8?B?dFRYb0d5YUsxVDkzRVM1WVlDWGQ1dTBUUVJJMmovU3JTNDh6ak54MEkzVk9C?=
 =?utf-8?B?Z3VGcTJJYjBRRjc3a3FBNDB3eU9mZVkzUFhiSUsyYVNwRnMxQzBwVnN4S0NO?=
 =?utf-8?B?aGNQZTJ5bm5ycytkb0R0dHcvbXEvKzA1WlFGR01tcjhOODVJWHhWSnhrSkFm?=
 =?utf-8?B?YXkvM1lXbFBVdUxGUnR2OHpha2RGV3NFbjFReGw2TkZzL0g4QVA3RnE1NnVL?=
 =?utf-8?B?bytGa3orMjFlOHBlaGpEQ0xlb3NiOUc3VEtnTGUwT29hQ3VjY2VmU21MalNm?=
 =?utf-8?B?clFWM2R4Rkx4ZlNXS3RFeTd1bVRXbmkyUnBHZXRSeDIrc1NndTVXSnM2WTF3?=
 =?utf-8?B?RHkyNGVCOUFTTmVTMW5GOVpKVVpkR0VESzJyczM1UnJPUWF2Njh0SklJaHd5?=
 =?utf-8?B?OUJyWmIrZFFhbTNuUVRDcFB5U2s0WDFUK05kSHBVMmF6RzQ4NEpOaTViOHA0?=
 =?utf-8?B?QU9zS0ZvVnNIOG02ZEJ5UkN6Z3JQc2pWbm9EVHJsL01FUDI4dmxlS0tiUTd3?=
 =?utf-8?B?WmE5MTlVa0hSajNnUjBzU0lsUlNSMmROczN6dW9kaVFJVlQvb2ZrOFd6ZzMy?=
 =?utf-8?B?Z0N3MTNFbVRHYXVidDUrNUMySDVwVzBHelFjbXdPcjlKZ2JRRlBLUUVKU25D?=
 =?utf-8?B?NlVxYk11RjBuVnlOTlBmb2FqZGdjUzJkdEVuMEZCajUyVE12ZW9rKy9PMG8r?=
 =?utf-8?B?bVc2MXF1UXNEakxuaTVraXV6U0Njdm1welJmaUx1WVNJTVpXc0hyZElVL3JH?=
 =?utf-8?B?TENjd3VyV001dUJGQ1UyTENobG5xU2wwZlpXQmFQUVhqQnpzTXlkbVhvWm5L?=
 =?utf-8?B?Y1llZ2NDK0RwbENheGszWTcvaHl4bXpSOXFzYTQ0OFZEa0RhTkp6WnE3MWxv?=
 =?utf-8?B?cmIvbDNWRUJDQXBtNDBMWHJUS0xXVXY3ZWJ6Qk5IVHNtMGl2dm9zWGZJQ0tO?=
 =?utf-8?B?ZDJpOVlpZFZLU0JrQ1ZWa0hGMEpoL0xGbE1NSkVyemo5bVNLVlZkblF6K1BY?=
 =?utf-8?Q?ZD/jVXlIP0sgnBR0TI2512k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a511d041-86e3-4a1a-99d2-08ddf0225d90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 04:27:34.7794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7rZ/vOI8Sbce673Xhr7j0jnBWeUB5DEVmKakhGJbzLLsezSX/u6fztv6iURcZ0Z/gGq93wLjeP/25W4K94uu3eEzV8ZEPM+fzDknAoYnWwi61FcDuBwxW7uiCRewO4dz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
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

Hi Swati,

On 06-09-2025 02:38, Swati Sharma wrote:
> Introduce check_dsc_joiner_constraints() to validate minimum pipe
> count, DSC slice requirements, and joiner support for DSC joiner
> scenarios.
> 
> Update meson.build to link kms_joiner_helper.c into DSC-related
> tests so the new helper can call igt_is_joiner_supported_by_source().
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc_helper.c | 54 ++++++++++++++++++++++++++++++++++++
>   tests/intel/kms_dsc_helper.h |  3 ++
>   tests/meson.build            | 17 ++++++++----
>   3 files changed, 68 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c
> index cea4304e4..df2f1d5c9 100644
> --- a/tests/intel/kms_dsc_helper.c
> +++ b/tests/intel/kms_dsc_helper.c
> @@ -201,3 +201,57 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *outp
>   
>   	return true;
>   }
> +
> +bool check_dsc_joiner_constraints(int drm_fd,
> +                                  igt_output_t *output,
> +                                  int num_pipes,
> +                                  enum joined_pipes type)
> +{
> +	int min_pipes = 0, min_slices = 0;
> +
> +	if (!igt_is_joiner_supported_by_source(drm_fd, type))
> +		return false;
> +
> +	/*
> +	 * For joiner, 2 slices per pipe is used
> +	 * i.e. min_slices = 2 * min_pipes
> +	 */
> +	switch (type) {
> +	case JOINED_PIPES_BIG_JOINER:
> +		min_pipes = 2;
> +		min_slices = 4;
> +		break;
> +	case JOINED_PIPES_ULTRA_JOINER:
> +		min_pipes = 4;
> +		min_slices = 8;
> +		break;
nit, Would it be possible to refactor this to avoid hardcoding?
	min_pipes = JOINED_PIPES_BIG_JOINER;
		min_slices = min_pipes * 2;
		break;
	case JOINED_PIPES_ULTRA_JOINER:
		min_pipes = JOINED_PIPES_ULTRA_JOINER;
		min_slices = min_pipes * 2;> +	case JOINED_PIPES_NONE:
> +	case JOINED_PIPES_DEFAULT:
> +	default:
> +		igt_info("Unsupported joiner type: %s\n",
> +                          igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (num_pipes < min_pipes) {
> +		igt_info("%s requires minimum %d pipes\n",
> +			  igt_get_joined_pipes_name(type), min_pipes);
> +		return false;
	This make the debug to print starting with -bigjoiner / -ultrajoiner, 
Can '-' be removed?> +	}
> +
> +	if (igt_get_dsc_sink_max_slice_count(drm_fd, output->name) < min_slices) {
> +		igt_info("Output %s doesn't support minimum %d slice count for %s\n",
> +			  igt_output_name(output), min_slices,
> +			  igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	if (!igt_has_force_joiner_debugfs(drm_fd, output->name)) {
> +	    igt_info("Output %s doesn't support force_joiner debugfs for %s\n",
> +		      igt_output_name(output),
> +		      igt_get_joined_pipes_name(type));
> +		return false;
> +	}
> +
> +	return true;
> +}
> diff --git a/tests/intel/kms_dsc_helper.h b/tests/intel/kms_dsc_helper.h
> index 4dbd88fe7..505821871 100644
> --- a/tests/intel/kms_dsc_helper.h
> +++ b/tests/intel/kms_dsc_helper.h
> @@ -8,6 +8,7 @@
>   
>   #include "igt.h"
>   #include "igt_sysfs.h"
> +#include "kms_joiner_helper.h"
>   #include <errno.h>
>   #include <getopt.h>
>   #include <math.h>
> @@ -38,5 +39,7 @@ void force_dsc_fractional_bpp_enable(int drmfd, igt_output_t *output);
>   void save_force_dsc_fractional_bpp_en(int drmfd, igt_output_t *output);
>   void restore_force_dsc_fractional_bpp_en(void);
>   bool is_dsc_fractional_bpp_supported(int disp_ver, int drmfd, igt_output_t *output);
> +bool check_dsc_joiner_constraints(int drm_fd, igt_output_t *output, int num_pipes,
> +                                  enum joined_pipes type);
>   
>   #endif
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..dbe434c3a 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -379,14 +379,19 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dp_linktrain_fallback': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_dsc_helper.c') ],
> +	   join_paths ('intel', 'kms_mst_helper.c'),
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_dp_link_training': [
> -           join_paths ('intel', 'kms_mst_helper.c'),
> -           join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	   join_paths ('intel', 'kms_mst_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
> +	'kms_dsc': [
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
> -	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +	'kms_psr2_sf': [
> +	   join_paths ('intel', 'kms_dsc_helper.c'),
> +	   join_paths ('intel', 'kms_joiner_helper.c') ],
>   }
>   
>   # Extra dependencies used on core and Intel drivers

