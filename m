Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2BB6C3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 11:41:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C4810E672;
	Tue,  8 Apr 2025 11:41:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2mA9vUq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D47C10E671
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744112472; x=1775648472;
 h=message-id:date:subject:from:to:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=L9WtYEmKPYTAPAm/gmNb9tkWqiOUPSLBSeE5mQJgFFM=;
 b=i2mA9vUqxBLj/YMNd0/U7Az3qAo19yXvnRiBVH0WciaDOCt8bVJd3RUU
 KESLgi58TsxsdaIkItYdOFab/5L520+KsExJAA4Sd7zlolBKl4zknZB/P
 GD6jXyOrQroerVJDpOl24YVmscDiDCCX5pATy3isVyOfgy6Ld+CGv0yWV
 NLaKm8HUm/D7qHDTU3TnKh+y1c6rSI0r3Gm9yZCtqkPgF3dAlc4zGosUI
 g1Ki0uLHLOVs+tNotLBthjlTZA2qHKy1fXXr8mDuuD0b5cBt9JzAxjJxO
 jcd+bYyREqwb44n8pF23dHzl4heSLUIXylO3auQgBzdrbkIduqIgOLXPN w==;
X-CSE-ConnectionGUID: ID27nalgSo+K56PhTuKrPA==
X-CSE-MsgGUID: KijYnTRiSt6It6Q7mdn+9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45674828"
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="45674828"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:41:11 -0700
X-CSE-ConnectionGUID: i1NMfH+/SCGzJ+GhgP5ZFQ==
X-CSE-MsgGUID: 863eCEAwSuaLf7Qzj5kyLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,198,1739865600"; d="scan'208";a="151425916"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2025 04:41:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 8 Apr 2025 04:41:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 8 Apr 2025 04:41:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 8 Apr 2025 04:41:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBeE8hXvsotJ7LxMpaWQK2YCScIEmPPR+jDkHbyG5jxkCu6GbCv4skrLa4WmvhHRU+yVhRWDMx+MzTaEeNeM6xrAxrsGh/V7dJOgGp0CFiauTWAm8wZK/lgFeozLhRNmgj7WcSvHmE80H8+mFou7TmgjJvrlOGM5vPjGjjjWQk702+yD7aVPQ6Qrb1ZzauKrC4FkowzXBk8BPaONYHnPJCrb13yPjlXJGG/tMkiSX/Zr/+fnVVzBR5mAe3u6I4GYcRrfL53+w6omjCoxizdUPAGuJ0AuUFc93blr2wBkMHPoHBIP/wVJFbgA9ivXWkoV6YrnfcKKsGHiP3EHEG5Utg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcP1NEy6qgMHT+l5ymD5BPE21TyRPYw9ZRD/DLeEz1E=;
 b=q/W1b3T++Kh7u/a4QNoFImFtZ/HbQfBOUUEqgEiHIOpqrpmhjWA2dQ7c+BeAMfocPy40y0qfn7Tm55gPBZu8Y5ZkJ2QhBd0WiaKNBlO7ry2f0CgPusv2BkUleAbM9FW9u0jORn+qu/dL3rxbO/0zfUnKphwEGCdaRQLDEZxeu7wmoZuhUmZp2Le1tpDhzL8b4VvTwaxQp6WfHTsglIvyya+4Lx+Lf775va03otyW7+uQE/26nzQaCYQnn5BW/wHOvtHesaBSmDcjZFkzBokPD43nh5ZKe5HWQ+Ow/y0ihGhKEJde7m/gzfaA1RDhFja3h3dn0YXjzAj0KymEJWL5Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by CYYPR11MB8331.namprd11.prod.outlook.com (2603:10b6:930:bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 11:40:25 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 11:40:24 +0000
Message-ID: <e926a698-7c1d-4ac6-a7da-15bd50f835c8@intel.com>
Date: Tue, 8 Apr 2025 17:10:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/kms_plane_cursor: check for display
 before cursor size
From: "Sharma, Swati2" <swati2.sharma@intel.com>
To: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250407144504.2907700-1-jakub1.kolakowski@intel.com>
 <20250407144504.2907700-2-jakub1.kolakowski@intel.com>
 <2840052c-5312-4965-8703-5a2f0dd99112@intel.com>
Content-Language: en-US
In-Reply-To: <2840052c-5312-4965-8703-5a2f0dd99112@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::16) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|CYYPR11MB8331:EE_
X-MS-Office365-Filtering-Correlation-Id: 81c51063-96be-481f-9703-08dd769226c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHRxeEwvcElLbk1tNlNKMW9RZjhpeXBFdUxZb0pUcW43dllmdHRYTHBDOXFq?=
 =?utf-8?B?ellnOTFrR0JacWZqajl5cHhKNTEzTjkyUmFTd3JCT0RaTWs0OWJUbHluMnRH?=
 =?utf-8?B?bjNaMkxZVktZNW1VZmRRV0IwejVnRnZucEdCT2o2OXVMU1Z5dTV3N0FiVml3?=
 =?utf-8?B?dXUrSWo1R1NKeEZPdmdUQWtPazc5ZTBGWUZ0QzNjSjBGNDZXT0FCcThhRTBr?=
 =?utf-8?B?MDQrd2NJclpFUFRVWEtQY2wrK2dsQ2VvYkF1SWE1cE9ZaENTaUFFZEp2dGZ1?=
 =?utf-8?B?TUJLREQwS1daODdQbnR2L1Z2djVFeDJya1p0T0ZnVlU5Z0dJTjh3M04ybnd6?=
 =?utf-8?B?WWdRZVVTeVEwZ2dCWHpLV3ExdytzNEJyb3RHeUpCazZHSWVBRUpKRWI5bE5L?=
 =?utf-8?B?OUF4NXVHcE9lRlRMTFBoUWp3UThMRTFkZldkUHFuVFU2K3Azdm1qZnZSUk5Y?=
 =?utf-8?B?Q3dXYVRBL1ZhTnlFZWZ2ZzNhQjg2TEFkQ1p2TlJqN213b0xwUHZYb2Y5L1NB?=
 =?utf-8?B?YXlwTVdsWXU0UUllSDBjWE9GM01Ha0Z2anJUR29mSzExajhmc1pieTlxZGVu?=
 =?utf-8?B?WGRMU2FFdXBLcEpLeUJjUjNmL1h4NStvMHhNWVA2aWk0SVJTVkxsR3NBUFNG?=
 =?utf-8?B?VVFuMld3ejhsSS9pVVp4UW5qSG5EVkI0LzFodmZvaEU5VXh1dHI3R3JpWGtL?=
 =?utf-8?B?bENwd3VHRkswVFpWNm05UDI0QW1rYVFwZlpGSkh5TTJxYXNQWldkQzVJTjVR?=
 =?utf-8?B?OUZRN2ZpSkkxdHQ2LzdreFVVVko2R2xiMkJEd0ZwdHRTekM5UkNJbG9TOFpj?=
 =?utf-8?B?UUlVSnRBZnRoUktkdXQyOXp5WHZJSXc4TnA2elJjMmFHQWMxZDc1d1VRbXFi?=
 =?utf-8?B?aUFxeTczVUxFNE9EbTgwTEJLN1BMU3RJdHRKOExtYUd5WGc4KzhjYVg4ZlJX?=
 =?utf-8?B?R29Dd1pnVFVjZVFiY21tcWhjMkE4dldPSzdMVFZxU1NvQmpvUTBDbG1uR0Z0?=
 =?utf-8?B?a1V6SnlCVFZqd1p2VkdkM1JRZU5hTnJvcVVDdlc4d29FNHpnREV3eVEvQ0hE?=
 =?utf-8?B?R28rckFjMzU0Z1dZQ1Vxbk16blB4UUE0TDgvL2JUYlNydnJMaEpPYUE3M21z?=
 =?utf-8?B?bmRhZy9sVTJiK0gwT1MwY2kyQnZDNnF3NnhBWVBxaGI5Ti9MdGQ1STdSb0M0?=
 =?utf-8?B?MHFEUzg0RGZWVHZ0MUZxM2ZVb0ZlamROcFEzdElLWG81SCtNWnNEemgxazNF?=
 =?utf-8?B?ZUdWOUd6ODVXOXo4Q1Q3OURQVVF2QXpBcEdmZWlnTjI2RkhmOERmK1FJVmJy?=
 =?utf-8?B?cWZUK0dkNE1pYTJPWUlZYWVpMVZVMGppeDdHMjNCOUdUOGt0anBXcG81N2Vt?=
 =?utf-8?B?eTFvemZ3azZIVExkaDFEVlQ4NXFVMDFWajFGaFFka05XcVF5VFAyK0szN204?=
 =?utf-8?B?QUVjRmF5MlNIcnd4dThkdUs3Nk5KbVRHakc2M1lhUWpCaWx5TGw4Mng5SWpK?=
 =?utf-8?B?dzlrMjRQR2FUaDQ5ZUtkTVdpS2pvNnV4eDd1N1Y5N2hJQWl0VmNvVFZjc0JD?=
 =?utf-8?B?cm9CWHFDQ24raVB2MFlJSENIdjUyU1Z4U1lJWHRCemNuZ2lEWjh1d2ZNamxk?=
 =?utf-8?B?clRkVSt2ZFRHTXZCMGwyeVMzTExiaDJCclpFdWlOaWk5UzdWQXdtSkt4UEcv?=
 =?utf-8?B?Y3BiZ213WnJwNmY5bG11MjFqNytiYy9adnRzc0x4VWpRMTlWSU0yOGRHOFUx?=
 =?utf-8?B?cXNNaldhSEprbkJReFZ4czdxb2Y0dzJhb0FRS1oycGE3TjlEc1p6UXljYUgr?=
 =?utf-8?B?WGk0MTBuTEcrdjlvVXloQWxhZkpnSzJUMlU0R1FCcy9qU0JaREZMUEN4a1dU?=
 =?utf-8?Q?nBpKDGQne1jLY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzdmRWJOZWY0Wkwzd1M5ZUpkN3JFZVJ3cE9jV0pLSFlyc2FRcXVGYk5YUWR2?=
 =?utf-8?B?UDIrUkxSdnFjSTVqYThjd3FCL21HS1pOalJxQ0hsV3lsWUd5L3N0bWRjTHRH?=
 =?utf-8?B?NnQ0Rmt3eGJDTEVQQ0F4THBETyt1RTR0MlhhVUZRNUF3bjBuY0RTYVEzRUEr?=
 =?utf-8?B?SXEydmZHdTNlak01d2lPNldqQThvdnZic1hlbGx0eTk2TnFqTm11ZFRGNEFV?=
 =?utf-8?B?VUFKcW00aDdTZG8rWWMwSjVZWFBJRUtFWVpVWVh0UlR3MGJkOGhLOW1GSzFK?=
 =?utf-8?B?bTFuVzN0V1ArRjN1RURCZlVZemRxTGdJUTNyMU9UU2NjK0VTalZvWUhDaWkr?=
 =?utf-8?B?emN1anI2RXdCSHA1QXUremJEd1pGNTk5bytpNG1RQkdIQVhNZTgzL3EzazY4?=
 =?utf-8?B?eDhodnl0OW1RKytqbjBqUFowanVveVFyRm9DWE9yMDhzUno2SWVKaCtLekZJ?=
 =?utf-8?B?OGMydENndVFKVmMrQWdZdFpvZ09RU0Q2Mlo2aUtCcXFqb1lrdjBtcHRxWjJU?=
 =?utf-8?B?TnpEeFJWaGpvUWM1UWhJQ0lTZCtVSEJac2xQMDMxd2QrVWZ4eXFwSFdtaWg4?=
 =?utf-8?B?bnZodmRXblBWYUR1YXpSOVNUYmhHRXlZVmZIRGZHNVZLWStNWTN0MmJ3dVNZ?=
 =?utf-8?B?dzBmYnNjcXdsTVBlQjY5dWthbUZ5SnpuSW80SDBkNVZzekVPZDliWXRzL0NO?=
 =?utf-8?B?dm0vUU5SSWNlUWUvSkZiUlNuQ1JzNFlNS1Uyc0IyZGdnWGtGdzBJWUtpaW9V?=
 =?utf-8?B?Z2xQUXl6ZGtCci9nejAzK0djdmEra3dZdTVHdWhIY2FIYit5T0ZVSlkxZ04w?=
 =?utf-8?B?Vm4xL1BwU29wSFdrNll4ZTZWMkU3ZDl3cnJraHpKR0Z6RlJSQU5IUVF2RGs0?=
 =?utf-8?B?SVRFaTdHMVJVSE5GVTQ5TFEwODV5VmxLTGVHa1Q0aE8wMTk2ODlUTVNQMlhq?=
 =?utf-8?B?cU9mWnVEdTNabkEyK2p3T1dsdHJnMmNMNHhmQmFKUmRBeXFtcGV5Q0RyNzg5?=
 =?utf-8?B?aWdGRjBnY3AvRkYxSkdJY0hCcUxVbGo3SmJrRVcwOFBHWmxJVjNLREpQMWJQ?=
 =?utf-8?B?bnB5VGM3TDNSNE83WXJwTU5nOGppa0JvQW4xZExFM0c2VGRkZmY0dmZXTEFM?=
 =?utf-8?B?alNLRVhiMGpVMlV0Tjd2R3EzVFJJMlFuS0FJWHc2em5FRmJVOTVVUTFNR2RN?=
 =?utf-8?B?dU56b3l3MG9wTVBHUkpwTW5NTWhaOWxJMkxZcEx4dG5tbWV3Y1Rhb25xQlNZ?=
 =?utf-8?B?ZGJnejJEeE1ST01sM1FML2J6WEZkQ3lCL21GYmVxMk5nSUxGbWZUUFhHV1Ez?=
 =?utf-8?B?ZWFGTGMxUjVzejMzd1hmV1d2dElZbm5DanJXSVYzV1AyUUp5Q3hpN1FpME9W?=
 =?utf-8?B?YWoyMUQ3elZuNEx1bkZISmRxY2RZTzhlVG1aNVhzZGdyalZXVU45TzBnLzZ3?=
 =?utf-8?B?Z25NVjBrSTFvVlhCMk50V1BiNzNiRjgxRVRCRHVwMmd2YnMyMHl2Z2pXeUI1?=
 =?utf-8?B?emh3VlQ5Vi9pajh2ZndhNE9nVkRSeVlPWkpJSEJIdGZnSStwQllkQWdDb1lz?=
 =?utf-8?B?R25DN2hYSmZqc3VSc0FjRGtVdVhyL3VhOGl6N0xZdjNsUXhCZk0rWnlsNWVK?=
 =?utf-8?B?R1U4YnArOUZ5TDB0Ym84VzMyaVBmR3YxR1IvSS95d3RrOVY3Z3hLQkFuRVZq?=
 =?utf-8?B?VVBpbDZsTlF3anRLWU1GRGN0N1haWmtHeUwydm5JZXdTanpyUG1jTEZNL0d5?=
 =?utf-8?B?d0t5WGRrTHdsZ1dIVWpwSmRGdzdFdzg0dEJjVnFjeWJLU3IvNjNwV0IySHA2?=
 =?utf-8?B?anc4VTdrM1pLbU1nU0M1SFUxV2k2ZGltUzUzSW52TUQ0b3VGSld3T01nNFRD?=
 =?utf-8?B?M1hBNnhiK0llT1VIWk9JTUNVMnpZMUlmbVp1Ykp2TERTTCtsMHhldFNSOHNa?=
 =?utf-8?B?QU0rd016SDhabnR4dGl3VGM3RGxKRm5IZjl2QzNxWVpQTys1aloxUDFOTlpj?=
 =?utf-8?B?UmdRdnNpMHVhc3Bzdy9TZjVSVExrOEtaNlVXY3NRZkpVL1h4blplZlhoTEdV?=
 =?utf-8?B?TVZqTVJMRmpiMnU2TDJuOGl4ZFZzL0JmeHVpUmJsYk5mVC8xRzR2L3diaUdN?=
 =?utf-8?B?bjdUd08yeFkzS0VuZjJka2V1cjZCS2RsMnRWSTI5MmJweXhCZVlOYVRsSFBy?=
 =?utf-8?B?VEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 81c51063-96be-481f-9703-08dd769226c4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 11:40:24.8233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtMowucXAjleaNLljii3KhJdMUc3OgoDFUUg+IXqYL8J9yvHE4WCJ65ESlfkSHFGLU1bVCdExbvQSeAwVfmHMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8331
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

Patch LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 08-04-2025 11:12 am, Sharma, Swati2 wrote:
> Hi Jakub,
>
> Patch LGTM.
> Please add "Closes" tag for the gitlab issue.
>
> On 07-04-2025 08:15 pm, Jakub Kolakowski wrote:
>> Currently igt_display_require() and igt_display_require_output() is
>> called after trying to get cursor width and height which leads to
>> fails on configurations that do not have display enabled.
>> Move igt_display_require() and igt_display_require_output() before
>> getting cursor width and height so instead test will skip on
>> configurations without display.
>>
>> Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
>> ---
>>   tests/kms_plane_cursor.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
>> index fd9e00085..1b72515f7 100644
>> --- a/tests/kms_plane_cursor.c
>> +++ b/tests/kms_plane_cursor.c
>> @@ -307,17 +307,17 @@ igt_main
>>             data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>   +        igt_display_require(&data.display, data.drm_fd);
>> +        igt_require(data.display.is_atomic);
>> +        igt_display_require_output(&data.display);
>> +        display = &data.display;
>> +
>>           ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, 
>> &data.max_curw);
>>           igt_assert(ret == 0 || errno == EINVAL);
>>           ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, 
>> &data.max_curh);
>>           igt_assert(ret == 0 || errno == EINVAL);
>>             kmstest_set_vt_graphics_mode();
>> -
>> -        igt_display_require(&data.display, data.drm_fd);
>> -        igt_require(data.display.is_atomic);
>> -        igt_display_require_output(&data.display);
>> -        display = &data.display;
>>       }
>>         for (i = 0; i < ARRAY_SIZE(tests); i++) {
>

