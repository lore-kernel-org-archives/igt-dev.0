Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E4EC55ABA
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 11:47:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CD8010E08B;
	Fri, 20 Feb 2026 11:47:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ErL9FnNw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFE910E08B
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771588037; x=1803124037;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w0buz7mSYy/pfZ4fBbhx6yzQwe9GpSeZ8q1w3fU2Jxs=;
 b=ErL9FnNw3h5jMjp8YAA06uS09otyZ+kFX1rM27FcjVmhetG6rVm+CDB8
 SmS7by3ufvM79egHdFbJV7HJ4MM2Kn1taFFF+bs2abEG0axaX+lbxOAkZ
 MZnsiiWnGHNrGKJ/W6vG5zpcBQZyGXJqz4lBFijQ5gk131d/ZZ6H3V1tt
 NQ8szNmM3vtF7ISuP1l7IDtEHf3+XNxpbsfXdE8XhUa6VSwUsrpW8qnNc
 fDc2kY8StEVqqb/BB7MXzNUd0mJWyjv5zpxI7R5jJk9m3N9dWzi5dLLr0
 Y3kdjUs4OdHgAt1HnTf1s8bx1eBTHBmTgJoVDdBJmJaMXR4s7V1MFWpPY Q==;
X-CSE-ConnectionGUID: JuOp2E60SiWr02BH+Ds5Sw==
X-CSE-MsgGUID: AkbWTcbnRneRn1ay8idD3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="95299582"
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="95299582"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:47:16 -0800
X-CSE-ConnectionGUID: 6o6LbFoETi+46yc1p3jnYg==
X-CSE-MsgGUID: RAjWiVsaRRyDX7b4Ar1a+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,301,1763452800"; d="scan'208";a="214945110"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 03:47:13 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:47:11 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 03:47:11 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.18) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 03:47:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPFXJonNcdQrYDW8XvUz/l2bNmM8GzM5im3c94A/q8mQjbwSgkm+jWHs+JDW+MrvXszKShnFpexEL2CR7MV15h6awJbTfqCOFCarBSfh841MrUPKx9HcoeQE7mFDKjOeYX45KUUaRIn1H5TiXqatWQ1d//rAkGCIbpr/aUsDvKrmIwjMcFzWqfue+0KAAVT5eCpWN65V2ht9gkxfAKoHR6swg5DxrYf0csT0h0fdlOaRqA9OMixXZw9h9Ec+RpLaPApg8VJMixWGTyssCVVXDDxFBDXXElU47jMAe3xvOJN51B1UHawd4av3T9p/CDEpgI2pLz9WRsAwfe5Z8aCzfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5e0lwnfh1K8M77jy+weUbnqEZiI2L7aOoMOYJnmSX8Y=;
 b=Fo+/dX4ktnlzchvWq2N2Qz3DtWECBlj+2mdo5A2XwzAFo+0YbSg+knjArnvrnftXfgWM9Zioo9KPylW2tLf4joomc8b9qkaxuEErTzBCJmg0z7YM289sAgTeO8z5qDzpiBqSMVawlkfvDPRc9df5fVCoFzrkkyA6rXT+n96wjarQQusyUmKw3tWHENO25pzn+I1HGVlBRqOm2gwWVfT8kn2UauoAPMvW22bqTgOOFCozOsSMaobhDFZIj3+kkEF2twtqtST0V1hPe7f59FYaK17Gh5lycMTzYli5ZbRIElq1uw9rC4I76FYOcGmBjLc1ffDZfbST2Vn3FQBxoyKs1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) by
 IA1PR11MB8098.namprd11.prod.outlook.com (2603:10b6:208:44b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 11:47:08 +0000
Received: from DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129]) by DM4PR11MB5993.namprd11.prod.outlook.com
 ([fe80::9b52:15d2:880a:6129%4]) with mapi id 15.20.9611.013; Fri, 20 Feb 2026
 11:47:07 +0000
Message-ID: <ca27ff12-cec1-458e-82c6-311185ff40a6@intel.com>
Date: Fri, 20 Feb 2026 17:16:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_rotation_crc: Add vblank wait for
 multiplane rotation synchronization
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>
References: <20260217060825.517098-1-jeevan.b@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260217060825.517098-1-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0098.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::18) To DM4PR11MB5993.namprd11.prod.outlook.com
 (2603:10b6:8:5c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5993:EE_|IA1PR11MB8098:EE_
X-MS-Office365-Filtering-Correlation-Id: 4df4e0e0-11fa-4da9-dedf-08de7075c520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1krVVdFSzBraEkzY0JZbEhlUFVDZm1CcGMzRnlKNjhlQnpvTElBcTI4Qm4v?=
 =?utf-8?B?SWdkeWEvK1JVQlluMkdWTERFQ3ZTS1FtR3dIQXZPVm96UERETURzOUh6RURv?=
 =?utf-8?B?U1NHeUJxakZOamhGTnRGNkhiN1F3VEgrVTFtay9iOWE4eWFhOWFjTTNoTmJH?=
 =?utf-8?B?eWw5TVhkSHFvZHNNQml4UkVJNE1odzRJQUptVGNJM2dGQysrbDhNREJya1Nw?=
 =?utf-8?B?NHR3N2ZxU2hYTFRxb1UxOUJkdVR5bHRMODNUV1A2bEhtbUZuc0x4K1NyVHRu?=
 =?utf-8?B?UFhhT2toRy9ta3VUenRTTVFseSs4K2djUnhnQnlGdGUyMTZQTjY5OCtOUTFY?=
 =?utf-8?B?eXVnUUh4YWgwT2tqUHpsVDRoYmt1VEFmWEpJMVd1UDZSZXR3TkVxaEVrWkY1?=
 =?utf-8?B?QVpESktjYUYwT1Q0OVJlVXRBMEgyQ1ZMZG1Cdi84cHBKbmpDRHAvOVdJcktl?=
 =?utf-8?B?NTYyQjB5ZmJ2WEZTYnhDTDZlUWJsT05saEVXSGxGMWZJalpDc2t3OEFQbDZU?=
 =?utf-8?B?dTI1eXZRMVpobzJsVHlhV0x1NG0xMGhUTjNBTitSamZpOXRrdzJJWVpEdHVY?=
 =?utf-8?B?TFIyQlBaQ3U1NThZU0EwZEU3NTNQMzJhUXkzYnVCd2p3Q2lLRjRZV2pUY2dy?=
 =?utf-8?B?WEFnNUFWams0aHQ1cm04MmhkWm1rM0dOUVpOa3VabzZiZDBRTTAwRG50VXhn?=
 =?utf-8?B?SGZkYkpncnRjS3ZVeWVFOXZqTDlUb09mYTlOUFVCSlpObEREc2RZSm1KQnQz?=
 =?utf-8?B?NmkzU3RsbWZzWDZkWGVwRFZTaFJRTjdjUEpEb2QvbDREMm90a0RyTk1PQnlL?=
 =?utf-8?B?YU1ZZmRsNkY1TmRyMGxrTUNxR2dVNDNLOXkzU3BFQk10aGpWYmxtODQzT1U1?=
 =?utf-8?B?SitQanVzSFdQZTM4OWVsYlFVYUtMTXlOcEo2b2dTUFdlQ01tWGoxd0VQejdI?=
 =?utf-8?B?VnhxL200Y1RzcVE2djE2Vmt5R2V3U1B2aTJpUWJmVmx2WHIwSWdoVHEyQWFF?=
 =?utf-8?B?SCtqWHBZMzRDQW5sV0UwZlhPTmtyZUJDK3VJNDJIcGt1aE16am9LcU5WMVBn?=
 =?utf-8?B?aTMzUFBGWUNzdDUrQU1SU01hcmhwNjljQWRma3oyOW94SmtFbkNETUx2VFNK?=
 =?utf-8?B?b01UUWJKc0ZDM090T2ZaYzJTQjdPdE0yaUFJajM5N0RxQjJELzg0L2YrZGgy?=
 =?utf-8?B?VW4wRE9mdXl3U3dvR2F5WkxxSHNja1QzTk9PZDA2VDNQNmxwOS9JS2I5aWxv?=
 =?utf-8?B?UW5uYTN0MDh4dFRMaHM5ckh0bG4vSGt4My9mRm9JMWtqdk5hbDRIVTlqZ3RY?=
 =?utf-8?B?QkM0dnd5cDhvUVQxN2NTVmcrSVJkODdHZjRjTkZGSnVJOWthYmdjTFRXY01M?=
 =?utf-8?B?YVUzdG9kZnY5RkExVmh6L2paMlIrOFhtQ3dEY3JUZ0s4YzUzd0hQUWRmSmx2?=
 =?utf-8?B?VHBzV2pPYzUza0NXWGs2Ry9HV2UxMy9lYllrTEVEUStqM2dKLzF4UVUwV2dJ?=
 =?utf-8?B?NTZxVEkzSzFJMHJ2WHJoRFpNNVRoUjcyRzRLc1FxNWV5OTJobjExaWlxR0FY?=
 =?utf-8?B?K2dlUHIwazJyQUM5TmJyeEFzTXBLcjZub0lxSGVBVlhRWm56UXg4Zi9Nd2pK?=
 =?utf-8?B?U2YrYzlLVmQyaWRkL3gzV0M1YmhLWXgyTDJHS0FLU3FoU3BTT09SMkt4MVZz?=
 =?utf-8?B?MThQS3pWeDdFdi9oY0EwUTNITy9QY0ROcm56L2ZDM3F3OTYzNVUyTDZBZXNJ?=
 =?utf-8?B?b1M3VDhieUVHbGFLN21nOHg3ckFxeHAxWjZpbk9YOStmQXdCNVFYZzRza282?=
 =?utf-8?B?UHROT0FhRUxqYXlkcHFxTERuajdJYkVTYjFaUVZ6OGhNSHZHRkxpTVFBOEcw?=
 =?utf-8?B?RXc3SzNkYU9mcFE1L21DWi9uNU1GZk1qdVFsZThRd0h5V3NDejNRVU5tQ0p6?=
 =?utf-8?B?UzJYUUdiaHIzbzNyUlRZTlpVYmdXVlpMWGZsRVhxYnNNdTNEMDRKTCtiSmRo?=
 =?utf-8?B?eFAwYTZsSFdvb1NlL3R0NlJjSmZGTitzRnJLYlp3amV2M0ZFR3h5blJsTW1t?=
 =?utf-8?Q?xca3xR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5993.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QURaQjYwazlwc0NpOTNWY2xtbUlkYmRJQjRPZm44b3h4WkR6RGJJcW9OZXdo?=
 =?utf-8?B?TERnWjF2c2JNMWNpenFYeWRpOERUeHZ0OFFkQ3hONFM1ZENHd1JQTUpHVkFj?=
 =?utf-8?B?UjVQay9vOHZnMEdrblNFbmRQZWhoTzhJYUYyY1lmMmZhVTZOV1VmNVRpOS9u?=
 =?utf-8?B?VVFkb1c0ay9jNEcwcjk5ZXFZdHFVbkNLeXZ3cHRPZTFTZVA1eEVuN2xlSnBq?=
 =?utf-8?B?NjByV3ZRTU9XaVg0SnBVNGpsWDgvblVVQVJ4NUliT3krWjJDTyszcnFuWDlX?=
 =?utf-8?B?UXdRWmQxenVsejFYR2lTM09qM1dJWXBtUHRwVXZSZ2kxWkZKYWxBMDI3VnFI?=
 =?utf-8?B?UHFsNmhxckllOE56V1E3aWJuNEVsVllESUpoVjJ3YjdUcEJnMk9BZ3VqcEx2?=
 =?utf-8?B?UWRIenNyQmdBK0FDT0xnbnpsM1E1WVdOMW16SVVYb3JCcWdkUkdiN2MrQ0Rj?=
 =?utf-8?B?dXJzTTc5SXhyYmxXVitaT0VadktaajNSNm9nU0Z4MU4wK25aYXZyTGZuREps?=
 =?utf-8?B?NmhTMUk5ZjJLdFhwSkdUWEh6RTVKRXJJODFPc3pIZ3E3Tk9yZW9vZlVKcUoy?=
 =?utf-8?B?NjVHcWdvMjdRdGRha0NUakRyQndKbVRCbktsaldkNjVnZUpFRjNxME9GZlRi?=
 =?utf-8?B?eUtwNElIZ2d2K0pRUnNRZjkvdEY3c1BVZGhmMTVDVTlkTFZ1NlRBZGxaMndG?=
 =?utf-8?B?OStGek54L1l3dTFsU3dFdFRFMEtYNzNwYjU5dFJpSUIwN0RzK1liVDZ1SGtN?=
 =?utf-8?B?SEIzWGFRUCtZN083TW1lKzVQT21QT3VmdVJLMWFqOEphNU0wSUh3c1Rybm9r?=
 =?utf-8?B?akZxMzFubUtsaVVDMDRaVmMwU3ZpRmcrTnRCcGIxUGxuVHdFcGVXTXY4RVd5?=
 =?utf-8?B?bGJOdXBGWDFzMi9oWlFyOWZLNi8rRFRKSkJpRm02UmsreVRFbGEya1VUS3ZD?=
 =?utf-8?B?OHkrbHRXQjZZRGJVd3ZHci9sVmxRbTJuakQyTzFGREJqR2RqTC9SVDQxeE1h?=
 =?utf-8?B?a3haQTNEUFhQT3hkRXhmWFRjV3h2dWtHT2FvMkdlUTNUaVMxaUNrdXhBUnBx?=
 =?utf-8?B?Zk5wQjh4NFoyZjE4VXhIbGJEbVAyS1BoV281Y2N0Q3Rpd05ZUnhTZUJOeFNa?=
 =?utf-8?B?c0tJait3T2VvOTFIVFNsemZ0RkQrR1p5UDhrQk9JN0JGUS83YmVYOVAzNUh2?=
 =?utf-8?B?bFZFWjA0VDJhckFVejU2bkF5QlZGMVhvay9WVTk4eWc3RUJUS2pIcytsZ2JG?=
 =?utf-8?B?a1NySHYvSE0vYUNzc0FIZDRlNkdWemhJRnRnUkRGb3BoeEpCbHB4UllaMDJn?=
 =?utf-8?B?YkxIVzBDdTh3M3pnWDlzSTk2cDliSkJ5a0NEd05CL0xuOXluOEN5b1N5TWd1?=
 =?utf-8?B?QlYxUHRxYU1JOE44bTA2UnFLVVBKWHhhQkIyTDJ2S3AyQ0RHMzJ5VWZXZXhv?=
 =?utf-8?B?cnF2ZE50c1gwU3dIdW5kOHdhV3haYXZBWmlaVEdZMlE4ZEtvd0ZLczkvMjZD?=
 =?utf-8?B?M0JtcEhHQjYybm9yREcxamlrZ0pBWThzeit1R3I3UGkyRjhkTDh2d2N0ZzRl?=
 =?utf-8?B?d29NYUFBVTF3VVZWd3NVek00SnFPaGpBNmUvUE9uTXRGeUhqMDlsMFdwQUs3?=
 =?utf-8?B?dm80bVlGNFZueVNrKzB1ODJMWUF4aHBLOWhNSXNtS1plSkFMSlQxUFNGc1Bw?=
 =?utf-8?B?djZrSEhIS2Rva01NbXlQcTlnMll6TmRQNUxQUE4vdk1TVGN1MWVkOTF6UWV5?=
 =?utf-8?B?TklqVDc4emNEREVyYkJkMFlXdjZueDV6RGliOStWWlRGcEsvZXpWODkvdWxU?=
 =?utf-8?B?TXpjL0ROWVpHbWFXcVplNnU1MWZBR1FwNURud3E1bHlHdEN1SU9wSWZUVStZ?=
 =?utf-8?B?WjNjdExiSEhTdk5zOTN3QndzU3Jja2ZoNE5EVVh4T0RMaEU5QXozaVQ4OTJJ?=
 =?utf-8?B?Z2hnY2RJS3dBbVA5RUkvR0JTZFdvZ1VrSG1xcGhsSWRCTkNtb0ErMGwrVjRn?=
 =?utf-8?B?eWtPR0VlTzdlVElLZ2tCTWhUQlNOOFIvV1ZvQUJuRFhMT1BUdVJqRWtMbCtI?=
 =?utf-8?B?Z09BNndoMTlaZFJXdHBBS1k2Y3Z5QVRwdUhSaCt0Y2Q3V3FpVGgyUDNSaFNV?=
 =?utf-8?B?NWliSnM1YWFBdEVhdlZlRElaWk1SMUVRUksrcWFtZjhZUTc4VXZnUk5zTzhr?=
 =?utf-8?B?ZVUxTVR3RS9IbjFObTBLWVJ4R2RsYU9QeVk2aXg0WmluY0tiWVQrbTB5MTZI?=
 =?utf-8?B?TlRpUXZBYmp3RTludWU4dzdQNE5QZjBTamZROHo5d2t4WnZueHcrMmxIdXVJ?=
 =?utf-8?B?QVVzWW5ZVjJHU2RCQlMrWUNqRXVpMmQxcFR0UWJjc09ucUlmK2h4STN0Tmsz?=
 =?utf-8?Q?X99+axf0mBtF8yvw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df4e0e0-11fa-4da9-dedf-08de7075c520
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5993.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 11:47:07.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OCQ//7h0lKpl6OdNhZtkK/06/oaBWwvowlBO357V/SFbnjWvJkCnzqGnpGMVdbpv85HMNTZtFalYoXc8mCGOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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

Hi Jeevan

I see test passing with and w/o your patch 
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14562/shards-all.html?testfilter=multiplane-rotation

On 17-02-2026 11:38 am, Jeevan B wrote:
> Add explicit vblank wait after atomic commit in test_multi_plane_rotation()
> to ensure both planes are fully synchronized before CRC capture. This fixes
> sporadic CRC mismatches observed on CI.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6946
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_rotation_crc.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
> index 8721a8311..93e5c3e91 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -1032,6 +1032,7 @@ static void test_multi_plane_rotation(data_t *data, enum pipe pipe)
>   							continue;
>   
>   						igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +						igt_wait_for_vblank(crtc);
>   						fliphw = kmstest_get_vblank(data->gfx_fd,
>   									    crtc->pipe,
>   									    0) + 1;
