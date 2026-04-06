Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1123AE9D83A
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 05:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B033B10E217;
	Mon,  6 Apr 2026 05:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HQfpfCeO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181B010E21A
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 05:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775453042; x=1806989042;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zcyXcyARlOYCeEc85BwMZfrpmCLcOeFp3Rg91qft6Tw=;
 b=HQfpfCeO8HWYzmqpmR4ekw2F+USsrzuDKnOt3nHbq8t5ScaWEjFQ9jCS
 HiU4gv+4oJl8DxqUt1YCTv2Pp2Pt8piC4ycpfm1HH50xiSl6K2/MFNktx
 yhKLdBDUr5VFBPkO8eM91rNoPRNIVtHAcok/2kz6ARLlsH/xWBNYKelO6
 pA2xaQmfVnyrKxSaymBGDtrc3VkXMQJYwIekJkp+zhEmEi9Lys+d4Yf4d
 JgrBzV1iA7rGfJ4DY46dJl+zOf1fjhMmuhxGIJVPbPZOXRXs21FIGdULo
 yw1fP5yx0CW8gfMxu3rd2cUQGsSpbWfPy7eLmpAxUfMbPV6YN1Q9wGCvL g==;
X-CSE-ConnectionGUID: SljDXa0fRn+G75itA0P3vQ==
X-CSE-MsgGUID: ETZj7KgaQYGuSKwiS7Mv1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76526823"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="76526823"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:24:01 -0700
X-CSE-ConnectionGUID: ND87t4ZFR6i2n4WZmB/71A==
X-CSE-MsgGUID: 4j6M62o4TyagD6lD8oEcbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; d="scan'208";a="258249872"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2026 22:24:02 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:24:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 5 Apr 2026 22:24:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 5 Apr 2026 22:24:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtwUqzVD2X+3o0SAC3KZd0W/Q9vAVZWkrToWPIdawwBsMDBmSQoRbpbkOTOb70wCwSZmoOqN0WpbVITmJuAah+khRosKmInoaBFd7w1Fa9pYlylirq0qAlPbQkWk6SvL0gOkDLiBeWmbY/zEU+jm6kjU33hru6ygKM61Jpnxh9Rr/34BzVIHIWzFX/t2C++2xdKjuKgvLQuJiPWLb6x+TmoOD+FMb53CLzPUYsvQ4okK1qezP3KTt6867Fsrg6DVBNFx41XvZ9uvdtVG7oWmU+yRZjSSJYzhVNfnrE4Kj11VaZWNQP9LXQ96C3V/oXpJ4e3w7I/Fr2yDTSc0qdVQZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7k5LJh7Sgrl2jqVotQnCBplE94c0tNFvZpGuWhAeNuQ=;
 b=BsOSb9v+NdUSrVpxnYrUlZ39psVzFEnS6z2OASToh+mG2vXgqP4v4nqR+MbwmMYc2/NtddM3BBiRrHWlUGhjPsEOldaNZJkQlvq8lw75swT7ztHJa/xwhDTWOh8l76M/NB5ap+QGYBYm8e3K7YBl6sMdy+B+Iiy0VvOWHrr4x54YOqSF/vQ7quSDWphxw/1Sf4wCeME2cLzVdH55TofGqV+/qrlwy9u+V8S4gexH4zyWcwnipQicnWYr8FZ1VmU2Bzrn48qTQwHwl5uexQWydmCSJTkoer0HL2/lOqAA6Z3NyEfxOGGa5GN7d0/ckyBLjSXexWghhE7UUhwXjbgd/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by DM6PR11MB4692.namprd11.prod.outlook.com (2603:10b6:5:2aa::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Mon, 6 Apr
 2026 05:23:58 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 05:23:58 +0000
Message-ID: <2fa1646c-1dcd-42fb-bb81-f6bf42bce41b@intel.com>
Date: Mon, 6 Apr 2026 10:53:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v6 1/9] drm-uapi/xe_drm: Add UAPI support for
 purgeable buffer objects
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260325124426.3265234-1-arvind.yadav@intel.com>
 <20260325124426.3265234-2-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260325124426.3265234-2-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::18) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|DM6PR11MB4692:EE_
X-MS-Office365-Filtering-Correlation-Id: af92731e-b29f-4945-5e55-08de939cb486
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 3QO/hUwfRivQoLKG46hb1AZglMcTmJbaAikCuT1SZqRsMntKoUmnzhDM2FgwtcEi5XK+7mJW5pNyITqKSnAZtmoUZQ7PXU7Kc0EgtNWAmzI49njyZmuM7mcSBc/fuFJdblxR/8FrOY+8zKl7XQErMDhLxyALJwAMq8fdxzLnCJGHsOLF5UZ2ygQTWxaERrP8YuyhYW9194lnHnd22s0O/ARc6EIhJ2fbMLMahGfeY6kqF42kLG61fxnzJ4DqumIdgVF5C7k1rFyEqGN9ScijaEOg8BnqlEWP+FZPfLt4mjeDNdgB+Bnbn3frCv05dUbadBG5eMC/7Z17HWb4Er0ZRkDGmlE47oVmbbk6OkhTxXw0te6y607E7egQHuIsV6pCFf2GnaEkSKtrZyiQLRamcrphy70Pf8HoV/KgHuGrEhmUiMBA/bhOxBHjQvetTHGrmVQ/HIs6hyxQMrGwSdAiobnTv5Lu5C7Eo45IlGfniU+w7Z7TNdhF/K6JcZ38yjkhlJw4n5fJQGkhGN7UfbB3xV7SFFa1w4D8XJ+JfYLrDvqxFaz2VAcUFCFR8RrVFbn96WFrAK/yZ0J3saX78dZtYCY6zU/ct82M3GI7OxweVoJILGTFaaxP5fCM2u1OhsPva9e+y8O5xuvN3YWMiaRcF5UTKqAxMG/+yrsQGKQtZVUx/xzRDLBzIGcWVz23dZ5KQaz9QnODmvQTuC7jWtOkhomeeKkephN7+6u3V6QB9zY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFZrSWhUZFlZM29FODMwMDBieXNkdkNLZzhOWnVrZVBLWXhxYmxSWW0wUDRp?=
 =?utf-8?B?NFpUZS9MZVozQmJIQ0VnZldpa0JlejR1VVVzbVV5bUJYMkJrMW5uQWpJcDVW?=
 =?utf-8?B?VUNCR05SbmVSQnViUnF3Q3lLZ0VLS2NOWDVWaHpuQXdrT1NsUnNpbkh5T2VY?=
 =?utf-8?B?SWg5aitsVHdhVXIxaXIyZVdFVUZFSHZ5Zkd3aWs3dmV2dUZmSVlQNE9CTVhm?=
 =?utf-8?B?Y29EQ2FyZC9FenZ5YVR2Y1FxM1VpWnMzWHU0N0FxbGttYjJLZVkvaGJSVHFh?=
 =?utf-8?B?K2RDeEo1ZW55ZENEcm01Mmx1dkJiVUJNLzJHcDQvY1E5S2YwUUxzNUtoRzZn?=
 =?utf-8?B?c2MzVmN2TXB1RkhQc3M2dVphRWhYQUczb0lWVExXdk5MQy8wSXZVYjZac1VE?=
 =?utf-8?B?ZG9vMTNEZk03TXowRjk2QXZJWXZBU1BBU2dJUHJnRXVDTEM3bkoxWHJPbHRt?=
 =?utf-8?B?dUJGd0NBeTB2d0dwYlg5dENsY0lPMitGazVDaGlxd1pJT3ZzQzhLUkpYYldi?=
 =?utf-8?B?aFdrQmVXRG5SY3JNQW9HQzI4YXRBL0VQZU01OVNBVGh0andXV2JqNW9EZHQz?=
 =?utf-8?B?aGpveWVBaWZmWXBmTldNcThFMVlHTjZsMktFckJHV1R3bFRsazFycy9LRXhK?=
 =?utf-8?B?U0JSZnNXbFAxb3czeXZja0NnUEZZM0xWMjFQMTY1enBndjlSK0pHRmN0M0I2?=
 =?utf-8?B?amJOYVZtYS9HclRqdkhpRGNya1orVTVPZW5ISFNCY3k3bnYvZktFNnVnS0o3?=
 =?utf-8?B?d0hBTXhPTGtHanlLVnRHQlBwWlJOTVFPMDdrRWNPU25vNlpUYTlGTG91RkVM?=
 =?utf-8?B?Q2EzVjBVeG52OE5RejhWbWxvTDdHdmhaZzNDeTdoVytjdk5zc2YxS3ZLVzJF?=
 =?utf-8?B?RjBnVS9KU2RtaVErZEQ4bEFnQ0NlZUdCZTMvSTYxUkdQSDdZbDhsRWJsL2tS?=
 =?utf-8?B?Rk90dStmMG1QLzFTMVRJTExNdnJlNWhyNFdyeTRuZGg2SEVmaEZkT2pvcyt4?=
 =?utf-8?B?Rld4QjdUdDcvbG9PTWFtUlJkOWw2cVFCbHJKdmZhMTJkcUEwQ3hvSFFCdnEx?=
 =?utf-8?B?ZjBBeStPeVRVUXF4RmluZWMxcFpIYVJ3UXFoYnh5TGhrNENIWDFDVWcvR2RX?=
 =?utf-8?B?b3ZGLzZYYzFsb0RXRE55YlQ5WFRIL0dvVi9nNkttTEphbE1nZzdNWk5pVm9X?=
 =?utf-8?B?Zi9Ha0lrMnlXV3BkZ3JxZG1OZWp6VlZYTW5SeHJQMDVFTGcwd2hBaURtdFNi?=
 =?utf-8?B?d2RQRlJJall4cVAzMDl4VUhtcFRJTHExRThkejFUTm84WHQ3RFB6UVFZVlpV?=
 =?utf-8?B?dklpRG9EQ0M4QU5iUTB0aThQR0NRdkd0OVVneVhNWjAwZ2J5bG1sSmluY3NF?=
 =?utf-8?B?TW5uTXNBMmxsSmZxNHR2TlQ1TEp4bnFrMGJDcm9HN3FBbVl2QzllLzBMWFoz?=
 =?utf-8?B?VTQrR2E4QXN2T3ZKV3VKeDhkTFA3TEZPdUdjdTYyVm9Kc0wxVFluWUhJd3li?=
 =?utf-8?B?NGlIWU9uL09FR2t2eVpLVmxJNFpJTkw5TUxJRkhVNW9TT00ySW5JOWgrWmxK?=
 =?utf-8?B?L2lHYWhVWGpyN3ZFajJYVTJucDc2WnAvVWtIR3ZGbUdPTEJHYW1OQ0JSbERP?=
 =?utf-8?B?VlJJRGxjMXhPanJkZHI4NTdpNnliOHU3bVJhcWRWTDFmK2w2ZFZCSmlLMFFl?=
 =?utf-8?B?RVA2V3dickNUbHdFblRkNVlGMVFjWlFtenVWMk5PR3NCSkIrbkhXS2ZxSVA1?=
 =?utf-8?B?cllPV1hHR3ZFYTBDV2RzKzhnMVRiK0ZPckdvN2RJN2ZRY1BRZDJPUmUzWE9Q?=
 =?utf-8?B?eDNLYVcxKzhaV1FGSjZOU1pMNjdzUlFKdUtRaGVHd3EyZHo3M1JzNkRianlI?=
 =?utf-8?B?YUlwSEk0dzd3WDZSZ2d4dm1BLytKdDA0UXVHS3ZyR0NBRXY0d0U1djd4ZDNV?=
 =?utf-8?B?N09JbmFPVHNlVUpBT0Y2RzZTWnB6TDE3V0pRUWNzNXZ0WG5IVG1ycVJUWU1E?=
 =?utf-8?B?YVdBR1Rza25GUTZjOHRRWnVQU2xvelU2NnRGTGpWMHZuSDRwWnE0K0l2TlR1?=
 =?utf-8?B?NUptSG5aNTRxaDJ5MytsSVhzUzY5RXh0TVFLR1JqQ3MrSEZuWForZHNGcml0?=
 =?utf-8?B?bzQ5TVE4cmdscEEvYTBpZDB3MW1JaWRuVGJnSVQzeDBKS1hmSEtoazYxV3dW?=
 =?utf-8?B?VFBtZE5TbDc5NEdDaEhkU0Y1Y1RwanhtVUorbDViT2Q1VGpmM2h5TlZjTlhk?=
 =?utf-8?B?cW9Bc3ZCNXFIcE9Fb29VZ2VPUUs5M2JiVU02eVZqVjJUUWVlN2pQYWU5OHdW?=
 =?utf-8?B?WUp5RXZJcUU2a2ZHa1dxMkNjR0MwTDZ3aEtlMkZjbm9tSnV3STI5QT09?=
X-Exchange-RoutingPolicyChecked: XbR4Mw6GIsX5l0AvI/VjN/Wnx9MkCohk0MO80v8pQ+weEHN3TLonX0VZ+yv7eJLJHxu+zrCnM8VbDGEGnf3Mqg/f2JE+BpU8mP5zhIM4SmnCc3ofCHrs+BDNb8fKWi9a5cv7/4WV8fZUWm5TcAn9AGdz239zgjg+BX8f14P2Vdmw7iNG5a/ZjXWH9719pQbZ5ASmEK6QFiuHwTwmyuafwQClmItvMtuuWA9lkYeAPfu/PmVP4kF70WJK9X0UrtOMHMIJc6zTyrDp0lyovDQSfHiMnXX5zGzs+rMczhhm94sIXqugfXkie2FF81SHTwckUWFHWj6FeCcSJIdbxHk8Cw==
X-MS-Exchange-CrossTenant-Network-Message-Id: af92731e-b29f-4945-5e55-08de939cb486
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 05:23:58.7694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKm/JBY6UE/pqcJD/Q0u6/cSf8PJZ6sX3hSYtRSy2tlyde72cg5BC7ecVsd8DGjfopXBSW6RdjdzZMTF2OcWEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4692
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

It should be like:

drm-uapi/xe: Sync with Add UAPI support for purgeable buffer object

     Align with kernel commit f99a05cc0b85fadd109fb3250fceccc5eaad3830 
("drm/xe/uapi: Extend the DRM_XE_MADVISE ioctl to support purgeable 
buffer object
     management by adding DRM_XE_VMA_ATTR_PURGEABLE_STATE attribute typ").

In IGT you'll be using header from KMD so need to mention alignment with 
KMD commit.

On 3/25/2026 6:14 PM, Arvind Yadav wrote:
> Extend the DRM_XE_MADVISE ioctl
