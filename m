Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478D9C2BA18
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 12:07:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF34910E09F;
	Thu, 20 Jun 2024 12:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kICLXkdd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 537A810E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 12:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718885251; x=1750421251;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=owtB/JKGg48D1D9gB7gOgvLT8nf2B7dQHWGkidQpB5c=;
 b=kICLXkddEgsICkSuO7DlJkRlCXI6hmQayj3Ot9eObdS9yNC/FH5clTeK
 l7iANOg0nrOk58tfd6OuN6gmoaziLVDidKKLgs6S9QpS9PQTIgfFh1HzP
 LnCf/G8MXomM05xpdMQnqSVeWgP/gc1StyAXIfV95sXvwgTfDOhi+nmNq
 QyP533mV9z4AKhPpgox76rT7ax09C2sTwknzdITTS0gSWC24kMHqaN8f8
 UzV3ZKx6sgPa3JHbCyjLw7B4nlfQTwgCQMvg27OeDwnbz3GnviFOgehhj
 gEhz91Ym2nYoFV7bxrhWEGVHKzvHNP9VGC5ATMzdLokxVzCmCFxLyS7Q/ w==;
X-CSE-ConnectionGUID: BqbBNhKcTEic60SHtgYpQw==
X-CSE-MsgGUID: ohAm8E/QSumq71djkUVvPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="33395720"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="33395720"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 05:07:31 -0700
X-CSE-ConnectionGUID: rtg5pId5QcKz0Q4aAxvvEA==
X-CSE-MsgGUID: y90WQaSYSSS8X74w+uDF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; d="scan'208";a="42041296"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 05:07:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 05:07:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 05:07:30 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 05:07:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cx3LM8Vbfab92Li2KdRq/mugKpSgmkqrEg4laHPXUlrWv5ibfd1Ns0h2I2ucAiAxn3hKFkNRX0oDb/Yy3rd96TMhIS7FLttes3aOkm7gkCMi2fAi1M5l1oeXI1pYJLjTSX50768XdlGBZJKeLY/c+ey5Sj5oH97h/dG9iNlEhODy4B/ufzZWYcPnA64rt+5/OaUePcpNtfnCoI9yZF+eVsTUF03Afv2aQBs1n1CLpdWBgiYnbzyf3iRTX6vZE1MP5S8xmiz/uQeJ+yV3K9Urx2EHmlbBUWsHB38Ld1O+YyEE2mGXQq2YFnw5WCbiOaPt5+CtTzzYA7P467Ou3ZYmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVviGJXswzc3ClDoLA1128oV6gGpl+QMDxGQAREGFj4=;
 b=FFaf725upftfY+/qC7m8U0BPLiC3tz2mG6xINhg78mK7d+v+fuOQD4Ev0FJlLF32aE70o7jPAMYRGNnRE4EEq2AFnPXgg9rIzANMXOIN9nN2zC9n1IjusLolxeSxO085+ItuGW0DDjAVZIrqwKWh47U8gGdWqzVgkWND2BQSRAbZNA+/AaMp9QF/XJRvmTLtZjUPyDs2NBbtb7GM2U1Tsa4fxfz7P1bYzW4jt5ubUYkMaGEWHwOgNs9P7/9snMEVDpejbPwlKLXyUZTqJBuPoKYasIjTIE+aSnZ+0JJw/rN/Dnrmq8RUcgkXhavww3E8e99ZRAvWWppwm+iA/UI8Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB7614.namprd11.prod.outlook.com (2603:10b6:510:28f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Thu, 20 Jun
 2024 12:07:27 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.7677.030; Thu, 20 Jun 2024
 12:07:27 +0000
Message-ID: <f2004ac5-7583-493e-af79-5e18f3c95f6c@intel.com>
Date: Thu, 20 Jun 2024 17:37:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_gt_freq: Resolve freq_low_max test
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <vinay.belgaumkar@intel.com>
References: <20240614173520.51631-1-badal.nilawar@intel.com>
 <20240618114833.zpfs2vds24kqdfds@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240618114833.zpfs2vds24kqdfds@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cb15b3a-6dc2-4392-b0f8-08dc91218d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|1800799021|376011|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmJsK1VxQjRKaFRDRjVYbkR3L3BNckYveXVsOTlyNTVobVBIM3ZzbDZQMkto?=
 =?utf-8?B?NmdPUC9JMHJxTVNJQ3pxbjd5UFUzS0cxenlBeDJwVENlMTdmTjgrZkFoL2po?=
 =?utf-8?B?NWkvVDBRaDhTOVNLNEs3WkFMdzN4Z2l0T2xaV1FYM0RoRHhLQnJUYjRoU0Ni?=
 =?utf-8?B?ZDRocEgyMHNWUSttem10VVN6MC9UWVVjUzdvdUpoaGRoUzBITHpTKzlqV0hZ?=
 =?utf-8?B?b0FoZkQ2TDM0ZS9aam44ZUljVVQwMkd0Y2FGQnM1cU1Dc2pzQXVXWkoxUlN0?=
 =?utf-8?B?dFVCVjc0cGd5MDZzZlkzU2lwYmdYWmhHZmVTZmFCR0ZzeHI4aG9NQlJZNGtt?=
 =?utf-8?B?WWZEaEkxQWttbXF3bnhFZTIzd2VVZHZyYXNRTjlDZDA2dlZoTHh6Qkd2QlN4?=
 =?utf-8?B?VW9KdW5obkZ2VGVHdGY4SCtLNWNYdUUyQXVFamUzM1dzNDFRZGlnMW45MFZ5?=
 =?utf-8?B?NENrUjVwU1BLbHg5MHJpQmEvejUrV1E4bkxHUUlraCtyWUI4WEtQRlZRbTlu?=
 =?utf-8?B?ckNzaWVyOEl6QnhwS1Rsc3E3SEc4NGhyWXlrWC9jdGcrVGY0RFNjOEtzSlZv?=
 =?utf-8?B?dU01dTFUNFBTTFB2d0RaYzByeXhQcVlkamxhdVR3NUxNMzFCMEs4ajBhT29n?=
 =?utf-8?B?TkxheitQNExwSmU2MDhpaDB3aGdnSE9oOUxFUjc0OHhiZW11R0JWSUdtSG8r?=
 =?utf-8?B?ZnZBUlRnc3N3dGxlL01pZDZ3Z2xxc01wVkJhSFNQYUdqczBXZGx0eHJQd0p3?=
 =?utf-8?B?c21WeG1PcXEzTmdZUEhUSC9sMXhXN09TRm9NcEFlRkowU2p3RTdFamY5bDll?=
 =?utf-8?B?ODFaYkVyQUx2M1p4WGNIRWJPZnJVVUFaRGNiMUF2aDQwVkxBc2xYTGdsRHRw?=
 =?utf-8?B?b2gxWXdyc1dVQXV3VHJYRjk0QWdGbDFnWXpPa2xmTllmVVRnUWpoUFJpWWRw?=
 =?utf-8?B?WEk1eHJGWHpZNjY2QXNJYnFYMFM2V1pjVVcvd0J1eUg0dGg3L0FVZEtHWmlo?=
 =?utf-8?B?K0lnenh2N05KZ2hjWU1uaTB3SHF4WDlNTGRlK3RFbXMxSVltWWYvSUJ3MDB4?=
 =?utf-8?B?ZENueW80dVlsZHVCamR3bGwrVFNYdHNrdmxzYVJ0RHdscDJTM1BvS3VRR1FQ?=
 =?utf-8?B?amo5Q1Nwa2NaZU5VLzEydFBPY2cvb0JOLytLckptQ0ViV1NJRTU5R0ZTdXQ0?=
 =?utf-8?B?MDRVcytiakxpaG84T01xaWJmbkdMaHZuc1p3MlFXZm1vL3hkNmUvZzZGZ1Rm?=
 =?utf-8?B?Z2owdUNxOXBtZ0ZmaE4wclJXSmR3QUhTWUdrV0FhM050QXZTa1VNdmQ3U21m?=
 =?utf-8?B?UnAzeVlIbnJ4T0VrcEpNR2tFZjhaS2Y4MUJTNC8rN1NWNkk0N2VVMy9PNThI?=
 =?utf-8?B?UUtma0ppTXd4eitnWjUrSmp3Q3VqOHBXaGJjU0c5dUZleXVBNXk5ODFOZDFr?=
 =?utf-8?B?UmRrbGFFL0NTRXdwM01BVDVDN2JmQm1PeHZ2aVRqN2NHSDNYUmJ3bUZGSDA0?=
 =?utf-8?B?NS9iM2hET1lJNnRicnZQOHpmeDk1Ri9UaVZsaHBLYTVFbXB3bmFFeFRpWkNu?=
 =?utf-8?B?WjBEREV3aEZ6a1lNK01iMmZxT0xGNjVFNzMyaDJGdEcvUnp5Z2FsdGhFNzRW?=
 =?utf-8?B?K2ZCbGtwcndDZ1pvZGduMkFVRmJZaklKMjhvOVl2aHpGaFg3bTdKK3BLbUxK?=
 =?utf-8?Q?R+A8UQzgGpo5fFXwe7yG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(376011)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTB3SnRxcUg5LytUS0NGcGxXYWVIYlk4Qi8xZXd2ek9vZkJuTEdCUWJ3Mk1v?=
 =?utf-8?B?ZmVKeHBuSjI3VDkySTBMRVdnY2ZaRmJOQ0VhWlJxRjNnaWFObnBlV0FHRVlZ?=
 =?utf-8?B?c1VIN1IvRW9hZ2NTWFQraWoxS1FIR1FqKy9NVTljckFFQWQzQm02VmpuK250?=
 =?utf-8?B?c2dBVy9GNUc1Y1VaYlpIRFRKdFFKckVySzdNVFAzdzl1bFQ5K0xHWVFxb282?=
 =?utf-8?B?Y3FrZXJGWVBxckFxVmRZa1dYbXdidDlTNTlOQnRXRi9IREd2K0tiekdIb2ow?=
 =?utf-8?B?ZU9CQjBrdVl5OFVJbEdsMFljT3VPaFRVQXZmM2RkQklnYU41eFRueCtORk1H?=
 =?utf-8?B?bEgvVWRtK2EyY2FIS1Z2UFBMWk5BYk1DcitZNlhySlo5NWY5MzlucWxHSi9y?=
 =?utf-8?B?RTJlSU96UHdUWmxsLytFRktKSHAyMENYakFCTHZTblJFbllLQ3VlWjNkbTNh?=
 =?utf-8?B?dklqbW85NnNlSlV3TnBSUFFHdmZZUzBDY0tkY05oWlMzclZPSkdJQ2NwWW1v?=
 =?utf-8?B?a1h0eTZ4NEV4MFlNbzRkMVBabWJkeVBlSFRxTEE1RjlBa2EzVWNWMC9tRUNy?=
 =?utf-8?B?VnNIckprY0NKYzhPMEo4TDU1VUt1NC9ac0Yzek1panNkWFZ2ZmpZdmxOZlZu?=
 =?utf-8?B?SkdVN1ZDSXVCclJVbGxxWVZXWmMzdm9aa1l2ZFRLcnh2R0JKbHUydVlhZ09Q?=
 =?utf-8?B?M1IzRlBsYVpFMDdHbHNFTk8xM1VxU0JLUXl6MDNYeXlwL0J2VnhTM1dWUEJC?=
 =?utf-8?B?OGtZK0xtN3V5L1FjeE12dWlpeHNVaWtGTDIvSkxYVmV3YVZpYUFXTGpENkxY?=
 =?utf-8?B?K09zMDZ0VVc0YklmWUlSTXFMY0JGZWVzeFRacG9EU2E0OGNQS3EyZ0FvWVlo?=
 =?utf-8?B?d3hidHkwL0h5emExNG05bDR3WVRxMFl1YzhKU3IrTkpuclBqb01iQkgwRExw?=
 =?utf-8?B?Rlk0YWVrbUlQUld1MHQrRGVNQ2IwM3lXeFAyZGFDRGU4MDRGZmNHOWRtVFNv?=
 =?utf-8?B?Yjl5d0RiekVPVUg1dU14YXE2TWs1a3h5NitmZ0JORG1Oa2QyZGl3Y3hxOXIr?=
 =?utf-8?B?WDRvZ0RjeWlXLzNSVmlVenh5bmRYdmlRQmtWV1hPZjJzQUw2V2ZyWHVpLzBT?=
 =?utf-8?B?ejFpdld0ZjIyaEdIbGFlN2c3bm1pUXoxRy9XZ1B3QmI2U2F6ajVBL3AzMkdi?=
 =?utf-8?B?UFdLT0FZdkM2YStiUlVZQmpORDhYTThWOGVuVEQxSDRlMVpqTW44d2pZYzBX?=
 =?utf-8?B?Mi9jMllndk9WMS81VVBCSy9Nd0N1QXoxUFA0SHNHZTU4eGFQbTNUcWtHS1RU?=
 =?utf-8?B?Rzg1dGloZzg2K2pXeWVCQm5OdE5sU2k3dnIwOFNoTGlJMndyNHRkRjNKajdD?=
 =?utf-8?B?amhnNWFaeDdyVkEzWnkwcUdBdjJzd3BUclY1QWVya3N1UFc3R2owWTEyU1B2?=
 =?utf-8?B?MjVBMldET0k0ZUxDT242UHUrK2dvL0V5MG9TZDJGbW1PYVhjSk9BRlFFb2dG?=
 =?utf-8?B?S0cxOThpRFpwQk0zKzhtc3FzN1Jxb0QwMkxPSmpEUmNXT1dPdlo3WmdSOXJh?=
 =?utf-8?B?NzhnNHZpYWhUZC9VbHpmT3RaUmFzVkVVWTNxSms4SzR4MzZVMHJ6TlYzKzdn?=
 =?utf-8?B?Rmw4ZDdaRUFId2JVNGFJK01YTHFqVGlVRjErQTNiQkg3QUxXWGtxSGl4SUVh?=
 =?utf-8?B?VFpobFo0YkZQajVndDIxcTFtYjBBdjFRZmx0My9jNWxqellqbGpCSHZvUXNo?=
 =?utf-8?B?U2EwYnd3NmlJQjlLd3lNbWVNVzdrUnhFbkV0aXVIOFNEbFlyR2MwMkI3aEo4?=
 =?utf-8?B?ZXBIRW5uRjZYbkJ0aTBzempYSk4wY2lCYThGeWtvbmVWTDhSR2ZmbFJwTkJG?=
 =?utf-8?B?c2NvQVVhWVhHbkEyMmZaZHRENU5wS2xzTEFucEhqd28yajhkMXZjenNSYkR2?=
 =?utf-8?B?VHhDcHpwNHA5bjhQRURLTk5UaVhMSnUrZUdYUGRlRTVFL3RrOXJoR0Y0VEVu?=
 =?utf-8?B?K3JER2tCR0p3QkIwWTVIcFFwaGJhNExZNHFaMkZrRXQ3Y2l1V3ZPSm8yQS9x?=
 =?utf-8?B?Q1dGUWRmWkFIbkxZYjJ4SllRN0FYTXdINXNEUmJRZ2lCN005K2FxcVl1Q3NZ?=
 =?utf-8?B?UE8xMGx0ckFlMGt0cFhuVmNHaUd6YzFYZzRub0x3a3JWNU9DVWVMcVZWblZQ?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cb15b3a-6dc2-4392-b0f8-08dc91218d3e
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 12:07:27.2634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lsHFq56u8qRiFyJEy4e7wY/XVV3pEPPyOcbhv5OgSDh+Ped4RAMqF/seW16CoHPX1zz3tpNMS2P/QMebhL1IBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7614
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



On 18-06-2024 17:18, Kamil Konieczny wrote:
> Hi Badal,
> On 2024-06-14 at 23:05:20 +0530, Badal Nilawar wrote:
>> In GUCPC flow when max freq is less than min freq and min freq is greater
>> than rpe then cur will be set to min.
>>
>> By nature rpe is variable as pcode changes it as per its calculations.
>> So for above scenario when rpe is greater than min then GUCPC will set cur
>> to rpe.
>>
>> To validate GUCPC behaving as expected it is enough to check cur freq.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1045
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1829
>> Fixes: 1a1e668e774e ("tests/intel/xe_gt_freq: Fix freq_low_max test")
>> Fixes: adcc68266b8e ("tests/intel/xe_gt_freq: Check for RPe freq updates")
>> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   tests/intel/xe_gt_freq.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
>> index d2e4d1a09..664ea3f79 100644
>> --- a/tests/intel/xe_gt_freq.c
>> +++ b/tests/intel/xe_gt_freq.c
>> @@ -264,6 +264,7 @@ static void test_freq_low_max(int fd, int gt_id)
>>   {
>>   	uint32_t rpn = get_freq(fd, gt_id, "rpn");
>>   	uint32_t rpe = get_freq(fd, gt_id, "rpe");
>> +	uint32_t min;
>>   
>>   	/*
>>   	 *  When max request < min request, max is ignored and min works like
>> @@ -276,10 +277,16 @@ static void test_freq_low_max(int fd, int gt_id)
>>   	/* Refresh value of rpe, pcode could have adjusted it */
>>   	rpe = get_freq(fd, gt_id, "rpe");
>>   
>> -	igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>> +	min = get_freq(fd, gt_id, "min");
>>   
>> -	if (!xe_is_gt_in_c6(fd, gt_id))
> 
> Why did you dropped this check? Please write about this
> in description,
Sure.
Removed this check as there is possible race. We check gt idle status 
first and then act freq. By the time of checking act frequency GT may 
get transitioned to C6.
I will float separate patch for this.

> 
> Regards,
> Kamil
> 
>> -		igt_assert(get_freq(fd, gt_id, "act") == rpe);
>> +	/*
>> +	 * Refreshed value of rpe can be lesser or greater than min (previous rpe).
>> +	 * So when rpe < min then cur = min else cur = rpe
>> +	 */
>> +	if (rpe < min)
>> +		igt_assert(get_freq(fd, gt_id, "cur") == min);
>> +	else
>> +		igt_assert(get_freq(fd, gt_id, "cur") == rpe);
>>   }
>>   
>>   /**
>> -- 
>> 2.34.1
>>
