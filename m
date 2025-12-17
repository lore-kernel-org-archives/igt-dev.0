Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37321D64082
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 07:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B698E10EB8D;
	Wed, 17 Dec 2025 07:02:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnHt0HAl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB810EB8D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 07:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765954932; x=1797490932;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=y7XM9+YuK0dv52XOy3Byy0ZJq3C7Eb3IxDC4kmFlH0M=;
 b=jnHt0HAl3YpzDh+9cR68G33mbkhAkIrFIQTKCu5PHK8li8nzgkUsP5So
 RFau9y3qYzqElF8ju8AgoYoTVCAuJuAXlbV/ejsqRaAm2IIFs6cDgNumx
 ydYEkKI0zKi8dOOmp+N8EqPktklVJ5ZNwOZ/9ZekcHEM/9LGHnSIeOVWm
 9Se4+BJ3VwJgfJB3p5L98aFjjP1T4Z52cx1OdvQ+ANEEyDZocruXFkvnM
 HAOxrezZ/gApMno3HuB1zvYrUhNYLYY1k4OYzXMwshv0QsQIfngEiHqNQ
 6QOodbcz6eDaYjC/mAXBM7UKodrIq64LkqI7UGhpYSSgDZSmTrQkUxEwT w==;
X-CSE-ConnectionGUID: b7iX3kBqTHuRXZ+uBo5WNg==
X-CSE-MsgGUID: ocGwqHbBTyG2pMyhuNzcvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="71516635"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="71516635"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:02:12 -0800
X-CSE-ConnectionGUID: 9YeVxKijTneG6OHUMJ4gaw==
X-CSE-MsgGUID: JGQ6XaiaTSeSurvmKUz8/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="199034964"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 23:02:12 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:02:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 16 Dec 2025 23:02:11 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 16 Dec 2025 23:02:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nqQwia+PAUgjNKf2pIUu5+ye5vSBxm2VzKSH/u7CZRg/oKvwhr9u3lf4+uy2JGsagaNjySL58QQylzPRapdjKUbrzvCgdadRch7gU5ckcIewgCiwy64V1PORYGSegHJsiKRh2cEcJcziKu3XGfpd+ewb2BwTxN+ytVdldFwWcS6CtuVXO/r55kSLiydY5i6pMX70A3xADG3BEbkIq11fX+bl+mMf2vFqD0A7evdbwbowpnNzWwXEIST9PvEKn3T8p2muml1EZWjStQA6HpQcgx7P0Et6t+fxj+B2u02B+tUX7E8TOWC8s9Nm9+pXJT8JDFw+/OWZfP5Alv6e38ONdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LPSvOTuT3Q51DL2sQC2F1Udu7fvDkgmSkSzwddys3Uw=;
 b=GccRTQ4oXPTiz3SRuIVEFCdvZplQB6UOJ/5I6+xa8Mu5zpaCDbwCeWHwCx077PdmSV+0vGl82/Fl63BpdOCP4m0/8nf3MC8EFklZPGQgEaeIFVbY0NMgCbtpmypIWf8F0aeIM/zTkTQp0Afg9i6CWln/fZdSA4waVMVvKgxZ6tRgN8gXPaXBRiLJNxzq4TIR5KFA4Vtd4EVorGAEqgUXXSJQ5deO6K+0dTaxLZukokKSm7n4Qf8j9Zca9uwB7vQgGmv1r97LUFJoyQvKaFiYKdwCfyDylV1JkhZ+ZSlc5XGm9Jtoit+m7JLxhdPSUF6XoUkFjilv0J7/Dao1OSMyXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH0PR11MB5141.namprd11.prod.outlook.com (2603:10b6:510:3c::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6; Wed, 17 Dec 2025 07:02:10 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::1cb8:b80d:4cae:5b17%5]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 07:02:09 +0000
Message-ID: <2a208e64-d718-46fb-9064-bb56a4852311@intel.com>
Date: Wed, 17 Dec 2025 12:32:03 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] lib/intel_pat: read Xe PAT config from debugfs
To: <igt-dev@lists.freedesktop.org>
References: <20251211193030.187174-1-x.wang@intel.com>
 <20251211193030.187174-2-x.wang@intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <20251211193030.187174-2-x.wang@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0035.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::6) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH0PR11MB5141:EE_
X-MS-Office365-Filtering-Correlation-Id: 315dfec0-8a12-45e2-4146-08de3d3a3267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ckxJTWxwb1IvSnJ3Y0xUUFBMZFBTekllZzE0bll2a2Z6SjlNUmNhVXpYbXhv?=
 =?utf-8?B?b3pnMXFYOHhJWWNLVTFveTlWVGNvTFV1VGFxbFBSV0kwcC9yVjZqRGdmN2Jv?=
 =?utf-8?B?Qng1dWNKZlpzTGdzaGl4di8xeEhoRXlEKzl5NXRma045VTdZRlF2L29xRHMv?=
 =?utf-8?B?SWIrcWxCYmVRTVBRbE1BTU50aU9FSDBPNWJDZjNremE5M2wvYTFKTThzaWt0?=
 =?utf-8?B?YWZPcFJRb3ovcEE1SG1BZStTQUVzTnhjcXp2WVZ2VEd6QW8xRmNwdEFjOFAw?=
 =?utf-8?B?RVl5YXIrZ0I4bEdTK1Z5LzVBSWJuMHJVZ2llSDRBQktEWEVjMTdjU2huVktr?=
 =?utf-8?B?RSs4cG5IakJFU3p6dEp1RUs2UytKVTlpaFBxOTlVakN0SXBDMHJuQ3IySExk?=
 =?utf-8?B?QVpyM1lDQkdKNVg3YnErVThSd0ZxQXlobVJveHRYY2N0bjBqQXZnUmt3YlVI?=
 =?utf-8?B?N2oreGZoSjNBWjUzS21KL3UxNm1QYVJTZGczUmF1aVNxZFNSazlURzRDODJv?=
 =?utf-8?B?aWV3dzREQ1VmNVdvMktQWU9pUDNPSzRwNkJsVE5MeFpSZTR4ZDhnYzJjc0pt?=
 =?utf-8?B?NGxtdzQ1aEVVMWNuTnJwcStFd0dSRkQ3YTNJL3B0MUVkd3E0VkFJZTIzMUl5?=
 =?utf-8?B?UUswR09xRDNXeGUrZElMM2cwVkRuL0FwVkxnS0NZREpyTGYwNkVxTVB6UkVF?=
 =?utf-8?B?dUowdnh3UkNiU25kM1VUQkpiS0NCMXNqTTFheGgyOCtMZVRySzBCY1RiU1Z4?=
 =?utf-8?B?aUdGNUxreWhPcmpPcEI4dHE4OTVqSmZZN25rSTFDYzFOS3ZVODJOVC9iWitp?=
 =?utf-8?B?d2M1Z3EwZUtDUEE4MTBFTFNTSUFJV0U4RUZvK1hBVm5IelpGc29ySXZPYkc5?=
 =?utf-8?B?b2pKNS80YXFyMnJFYURlOXVvZ29sbC9vSUpOa1F6YjRtYTRIbDA4TEhBVHlM?=
 =?utf-8?B?b3VLb0g1V0pjZjc2T0xoRzNidFZNVWNzWnVlRU1mSmYxNUY1K3V6cDFRS2RB?=
 =?utf-8?B?KzJCY2w2R20xdWcwVmFXU21zWEpNd1gxaExIVVJ1azdnVkpPUC8rOGV1cXYv?=
 =?utf-8?B?eTI0Q2RxTjhpQ1UzZGJhNHhDSU5Wd29jRktDek1JSW5DeVR5eG11VnZYUlBy?=
 =?utf-8?B?amZOMkFxUEFaa29sSmkxRyt3MFNZdmJDYUczc0sxVjduM281Zk9ENkc5SHdk?=
 =?utf-8?B?c0hNQUEyV1pVNnFGMkxpaWRWaG1iakdNZ2NQODhqbC9MNGx0ZG5IM1pXY0s0?=
 =?utf-8?B?dFJaUFF2TVA0QzZUZi92TjBzV3RTcUtWNmUzVjhQcU1VV1JpS25aQWl4OGxU?=
 =?utf-8?B?alg1VHAyZkYwaHpWa0FtTVEvYVhqZWdwdGRaNmlxakEwdGRWdllKNkpnZTFW?=
 =?utf-8?B?bDhQRWRSQkRva1RHbTFpdlRlQmQ5YXJ4MFJuK2F3NVAyenVCRUMwbDhJRWhy?=
 =?utf-8?B?TElTWkwrTDJyMUJjNktZdEx1cVQyUmgwNWViM2J3NXNVK05oMFpJeElReWRC?=
 =?utf-8?B?YldVMGswanA5YlgxK2tHeU9kU254cDVPRDBlN0ZoUWZlNGNMV2xCKzRsdHRG?=
 =?utf-8?B?ZHhxcGx6VGJVYlUxcXJ2akx1em52ekJSRGZlR1pLdUpjU21XNGVxUm5YOGwx?=
 =?utf-8?B?eXp2YUdHR3hGVG1vdUxha3loMHNVZmo2b3RiajR6UWVGYjBpRFNwMHk1MWMv?=
 =?utf-8?B?TFFIVldQT3hxVDQ1NjB3ZG1XbjM1cHJtZ05GTi82Um1iRlJjSGM4ZkZNRzdT?=
 =?utf-8?B?dktGSGI0RFRZS0hmckxIYXBidktDdHRyNXJnSVo3K2RHcFc4VTROL2lZeStP?=
 =?utf-8?B?QmZXUm9QNyt1cmtycFB6VzRoQUNlNWt0d1gvcmwvKzVSL1l1QlRYTm9TS1JS?=
 =?utf-8?B?REhpamlFY0U5Q0I3RzJUaytWamRlMjA2NjFuTUxqK1k1VkJ5cU9nTHVaOFRX?=
 =?utf-8?Q?vjiju5vEzoqCiVbgIrgaO2YPPuYtS4up?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVczWSsxanE3cEM4M1ZZY243KzQ4aDEzaXNOSmFlc1c0bWdQNXdjamVMZ3c2?=
 =?utf-8?B?cjJPbTF0Wnh0Tlc2aTNkTXhKZFJXSUFja05mN3ZobUViWUdFanRBTWRiWFJJ?=
 =?utf-8?B?Y0wzMWtud2piS0twQXpjZEZkMCszVExKd09SQ01hQStOM25uTEZoajhUd1N3?=
 =?utf-8?B?MHo0Wk1lZWVNay9tbG9ocTJQd1RURGI2Qytaa09NbGxuZFpQYkJlQUVCNEFh?=
 =?utf-8?B?U28waytiVkowT0xsZEZSdldRYVJXQTVhcWFFYmFTbE9xSEVBNlUwZ1V3VmhX?=
 =?utf-8?B?Tnl3N1hLQ0RpQ0tRMWNEM1NuSFF1SVVQKzZBclFibDd4eGo4ek05L3g1andI?=
 =?utf-8?B?NmxuWklxSkNmbnhwR0Q2RnQwaEJKRTc5WGh6ajF0TkpFMm4vNFplamVUem41?=
 =?utf-8?B?VHZQZytEdU8xd0FDOFQ0RUxxNk1yUnhmK1RRM3EyYS9mT2ZuMFByVk5UZlE0?=
 =?utf-8?B?T3NZZWw4d3ZvdG5GbEtRMGZaenl4YjhwSWcvbTRxQkxVcWpEeWtyOUY5TnBv?=
 =?utf-8?B?NC9tUmRCU3hBQ2VyM0p0OWswdHdObUJ2K3FWTVJTRTRJVGg4L0tscGFzRjVy?=
 =?utf-8?B?UDB5TmxUZXlUT0hGTVRJNjU1UFk4eDNJNUJ3ZGxtVWJ2OGtFbS9WaVM4NmNY?=
 =?utf-8?B?TG1EVytQeHpHdFNPUGs1OFhMd2pMa3pXeVdPYm9PSy9vVVU4L2lTTEY1Y0pF?=
 =?utf-8?B?aVF3OW53MkJ2QWJCeHJ4d20xVkR1eHlxamFha2Z0eFNXVmhHdDB3anA2SWhp?=
 =?utf-8?B?S3hiamRlK0tWUzN3bkV0bXprTGsvVjJrUkxzY2hmd1czSmtvMTlmaVVIcVI1?=
 =?utf-8?B?TVcyUUZ6OU5vZnlIaDJFcXdDZ3UvOEdGSmN6YWIzeW40T2pFQmE2V2JVeVo5?=
 =?utf-8?B?N2lVQ3crdDBHNWF5dGNaRzFTamFsNVE2bVhqNDhLVVpiT1hNcXBkWEUrYUc2?=
 =?utf-8?B?eUdZWVQ0YnM3WmllYXVUTkdXY2dZdzRLS3BNS05ZZ1dFbVpaOVY0Ym5FZEdi?=
 =?utf-8?B?dktNUE1haEQ2eC8rZytQM1U2YTBxRXR3U3JCOUlUa1BlS201RHFKK1VaaUZT?=
 =?utf-8?B?UzVtME82em1LeDBlakU0d1ZwT2dMa3ZaZTBTZ0xHZU4vak0vYytlWjU0amlH?=
 =?utf-8?B?YzBGQ2hsRkhlTFJKUVRvWEszVzU5OXJaRTYzTlA2R0p3djNQYnphUjBWL2dH?=
 =?utf-8?B?d1E5c25YdHE1R3B6ZnI0UEhIMW9oMzhhaUN5WTVpZjBFUG9qRlNVVGhnVlgy?=
 =?utf-8?B?anFMdVBXSWU0L3VGS3UvMDcrL2p3eDRtSmtkT2V1QmhkeVd3QVd4Z05LaElr?=
 =?utf-8?B?dWowZGQ0V1dqdjk5S0h1Q3ZGM2RIZXdkNGIrWTZsZ1piaGw5SjNQOCtWVlBm?=
 =?utf-8?B?T3BTWjl5RHJ6dnZpMGdZYlZ0T1pQVTZJd2dRSnlBamgxYXBOSGpKUnFQb1dq?=
 =?utf-8?B?UHBKZWN4clRtTUF4NjZzZlEyYXFlanpoOS9HSVZqSjVYd0pIMkpFaFpqWHc4?=
 =?utf-8?B?ZmFSNEVJNk9GM0h4N2F1SU96eFl2UmJvbmNiS3kwYk5DRldXWTUrQzJpQ3ZI?=
 =?utf-8?B?dzl3R1N2YUdrdFo2YklJMFdSM3FrcHVHVE56dUJ5WmFJYWRodVpqZHFsUkZh?=
 =?utf-8?B?OE5ETk9SS050TkJ3Ykt2SjVaQzdPbUVId3lSMEtWci9yQWxoSE1rSFQvdnd0?=
 =?utf-8?B?aUNUdmtXYk96VHNrMWp4WThhNGl1WVBzbEFSQjYyaHdZTFJIL2RBcjM4OTV0?=
 =?utf-8?B?ZnlWcjB3YlphZXFCVnhkeVl0Y0pNclIycHd1clFWV1paa2pQRytRMjV2bERF?=
 =?utf-8?B?M0hvWUtqbi8rVmNOcWRiOEdXQmNRbmJ4TVhWNk9qWTI3OGNOSitDaWl6Sllp?=
 =?utf-8?B?b0ptOUZXVG1RYWUvWDRNQU9nOE5naXJnTUF6UzRXbTNXK2UrNTd3Y3MxeFcv?=
 =?utf-8?B?cENwRG5IM05kdjJXNW1SUGhRNUUxY0xjNWxOV1RQbXhScVByRjJyUkc4MEFs?=
 =?utf-8?B?U3FVbFowZVVEQUFaVEI0L1NxUVhYK3ZpbUMxcVI5aCtQR1c3UGR1NGRGL1Mz?=
 =?utf-8?B?UStoTGNJQThyaU13c1M3MC9vbXM2ejVxL2cxamd5cGJNekoycXNIUVF5c3p2?=
 =?utf-8?B?SjVWQ1lud3pvRnBVeHZSbk8rb0VyK21ibjFEbGR4ZlNWQTBUOWw2RnpSY1pu?=
 =?utf-8?Q?4hN5wDi7yMLNGKATMpm6Adk=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 315dfec0-8a12-45e2-4146-08de3d3a3267
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 07:02:09.9303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FccHtzTuzSOzK4Or50mgu+38gy0qONu7rC/1oApPXu/WZMd7iNfURl24zIxmhgUQv9VzLVo6fehbCPNReHpRPFs/npFEN46Ac++yLU6xq0U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5141
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



On 12/12/2025 1:00 AM, Xin Wang wrote:
> Parse the PAT software configuration from gt0/pat_sw_config instead
> of relying on hard-coded indices.
>
> V2: (Kamil)
> - Show a detailed skip info when opening the debugfs file fails.
> V3:
> - Save the Xe PAT software configuration into the xe_dev structure
> to prevent scenarios where certain test cases drop root privileges
> after execution begins, which could block access to debugfs.
> V4:
> - Cache the parsed PAT table the first time we read pat_sw_config
> and reuse it for subsequent calls. This avoids repeated debugfs
> opens (and failures) in tests that drop root between steps, while
> still returning the correct PAT layout.
>
> CC: Shuicheng Lin <shuicheng.lin@intel.com>
> CC: Kamil Konieczny <kamil.konieczny@intel.com>
> CC: Matt Roper <matthew.d.roper@intel.com>
> CC: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Ravi Kumar V  <ravi.kumar.vodapalli@intel.com>

Regards,
Ravi Kumar V
> ---
>   lib/intel_pat.c   | 121 +++++++++++++++++++++++++++++++++++++---------
>   lib/intel_pat.h   |  20 ++++++++
>   lib/xe/xe_query.c |   4 ++
>   lib/xe/xe_query.h |   4 ++
>   4 files changed, 126 insertions(+), 23 deletions(-)
>
> diff --git a/lib/intel_pat.c b/lib/intel_pat.c
> index e3588110a..6a16d34cc 100644
> --- a/lib/intel_pat.c
> +++ b/lib/intel_pat.c
> @@ -3,37 +3,112 @@
>    * Copyright © 2023 Intel Corporation
>    */
>   
> +#include "igt.h"
>   #include "intel_pat.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * xe_get_pat_sw_config - Helper to read PAT (Page Attribute Table) software configuration
> + * from debugfs
> + *
> + * @drm_fd: DRM device fd to use with igt_debugfs_open
> + * @xe_pat_cache: Pointer to a struct that will receive the parsed PAT configuration
> + *
> + * Returns: The number of PAT entries successfully read on success, or a negative error
> + *          code on failure (-ENOENT if debugfs is missing, -errno otherwise)
> + */
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache)
> +{
> +	char *line = NULL;
> +	size_t line_len = 0;
> +	ssize_t nread;
> +	int32_t parsed = 0;
> +	int dbgfs_fd;
> +	FILE *dbgfs_file = NULL;
> +	static __thread struct intel_pat_cache cached_pat;
> +
> +	/* Return cached value if already read for this thread */
> +	if (cached_pat.max_index != 0) {
> +		*xe_pat_cache = cached_pat;
> +		return cached_pat.max_index + 1;
> +	}
>   
> -#include "igt.h"
> +	dbgfs_fd = igt_debugfs_open(drm_fd, "gt0/pat_sw_config", O_RDONLY);
> +	if (dbgfs_fd < 0)
> +		return -ENOENT;
> +	dbgfs_file = fdopen(dbgfs_fd, "r");
> +	if (!dbgfs_file) {
> +		close(dbgfs_fd);
> +		return -errno;
> +	}
>   
> -struct intel_pat_cache {
> -	uint8_t uc; /* UC + COH_NONE */
> -	uint8_t wt; /* WT + COH_NONE */
> -	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> -	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> -	uint8_t max_index;
> -};
> +	memset(xe_pat_cache, 0, sizeof(*xe_pat_cache));
> +	while ((nread = getline(&line, &line_len, dbgfs_file)) != -1) {
> +		uint32_t value = 0;
> +		char *p = NULL;
> +
> +		/* Expect patterns like: PAT[ 0] = [ 0, 0, 0, 0, 0 ]  (     0x0) */
> +		if (strncmp(line, "PAT[", 4) == 0) {
> +			bool is_reserved;
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1) {
> +				if (parsed < XE_PAT_MAX_ENTRIES) {
> +					is_reserved = strchr(line, '*') != NULL;
> +					xe_pat_cache->entries[parsed].pat = value;
> +					xe_pat_cache->entries[parsed].rsvd = is_reserved;
> +					xe_pat_cache->max_index = parsed;
> +					parsed++;
> +
> +					igt_debug("Parsed PAT entry %d: 0x%08x%s\n",
> +						  parsed - 1, value,
> +						  is_reserved ? " (reserved)" : "");
> +				} else {
> +					igt_warn("Too many PAT entries, line ignored: %s\n", line);
> +				}
> +			} else {
> +				igt_warn("Failed to parse PAT entry line: %s\n", line);
> +			}
> +		} else if (strncmp(line, "PAT_MODE", 8) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_mode = value;
> +		} else if (strncmp(line, "PAT_ATS", 7) == 0) {
> +			p = strstr(line, "(");
> +			if (p && sscanf(p, "(%x", &value) == 1)
> +				xe_pat_cache->pat_ats = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE]", 18) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WT]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wt = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_WB]", 16) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->wb = value;
> +		} else if (strncmp(line, "IDX[XE_CACHE_NONE_COMPRESSION]", 28) == 0) {
> +			p = strstr(line, "=");
> +			if (p && sscanf(p, "= %d", &value) == 1)
> +				xe_pat_cache->uc_comp = value;
> +		}
> +	}
> +
> +	free(line);
> +	fclose(dbgfs_file);
> +	cached_pat = *xe_pat_cache;
> +
> +	return parsed;
> +}
>   
>   static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
>   {
>   	uint16_t dev_id = intel_get_drm_devid(fd);
>   
> -	if (intel_graphics_ver(dev_id) == IP_VER(35, 11)) {
> -		pat->uc = 3;
> -		pat->wb = 2;
> -		pat->max_index = 31;
> -	} else if (intel_get_device_info(dev_id)->graphics_ver == 30 ||
> -		   intel_get_device_info(dev_id)->graphics_ver == 20) {
> -		pat->uc = 3;
> -		pat->wt = 15; /* Compressed + WB-transient */
> -		pat->wb = 2;
> -		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
> -		pat->max_index = 31;
> -
> -		/* Wa_16023588340: CLOS3 entries at end of table are unusable */
> -		if (intel_graphics_ver(dev_id) == IP_VER(20, 1))
> -			pat->max_index -= 4;
> +	if (intel_graphics_ver(dev_id) >= IP_VER(20, 0)) {
> +		struct xe_device *xe_dev = xe_device_get(fd);
> +		*pat = xe_dev->pat_sw_config;
>   	} else if (IS_METEORLAKE(dev_id)) {
>   		pat->uc = 2;
>   		pat->wt = 1;
> diff --git a/lib/intel_pat.h b/lib/intel_pat.h
> index eb48cbc65..e9ade2e2e 100644
> --- a/lib/intel_pat.h
> +++ b/lib/intel_pat.h
> @@ -6,9 +6,27 @@
>   #ifndef INTEL_PAT_H
>   #define INTEL_PAT_H
>   
> +#include <stdbool.h>
>   #include <stdint.h>
>   
>   #define DEFAULT_PAT_INDEX ((uint8_t)-1) /* igt-core can pick 1way or better */
> +#define XE_PAT_MAX_ENTRIES 32
> +
> +struct xe_pat_entry {
> +	uint32_t pat;
> +	bool rsvd;
> +};
> +
> +struct intel_pat_cache {
> +	uint8_t uc; /* UC + COH_NONE */
> +	uint8_t wt; /* WT + COH_NONE */
> +	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
> +	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
> +	uint8_t max_index;
> +	struct xe_pat_entry entries[XE_PAT_MAX_ENTRIES];
> +	uint32_t pat_mode;
> +	uint32_t pat_ats;
> +};
>   
>   uint8_t intel_get_max_pat_index(int fd);
>   
> @@ -18,4 +36,6 @@ uint8_t intel_get_pat_idx_wb(int fd);
>   
>   uint8_t intel_get_pat_idx_uc_comp(int fd);
>   
> +int32_t xe_get_pat_sw_config(int drm_fd, struct intel_pat_cache *xe_pat_cache);
> +
>   #endif /* INTEL_PAT_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> index 53af86a99..ba4ca8aac 100644
> --- a/lib/xe/xe_query.c
> +++ b/lib/xe/xe_query.c
> @@ -408,6 +408,10 @@ struct xe_device *xe_device_get(int fd)
>   	xe_dev->default_alignment = __mem_default_alignment(xe_dev->mem_regions);
>   	xe_dev->has_vram = __mem_has_vram(xe_dev->mem_regions);
>   
> +	/* Populate PAT software configuration */
> +	igt_require_f(xe_get_pat_sw_config(fd, &xe_dev->pat_sw_config) > 0,
> +		      "Unable to open the pat_sw_config file in debugfs.\n");
> +
>   	/* We may get here from multiple threads, use first cached xe_dev */
>   	pthread_mutex_lock(&cache.cache_mutex);
>   	prev = find_in_cache_unlocked(fd);
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> index 6a97d384a..8cf947a52 100644
> --- a/lib/xe/xe_query.h
> +++ b/lib/xe/xe_query.h
> @@ -12,6 +12,7 @@
>   #include <stdint.h>
>   #include <xe_drm.h>
>   
> +#include "intel_pat.h"
>   #include "igt_aux.h"
>   #include "igt_list.h"
>   #include "igt_sizes.h"
> @@ -74,6 +75,9 @@ struct xe_device {
>   
>   	/** @dev_id: Device id of xe device */
>   	uint16_t dev_id;
> +
> +	/** @pat_sw_config: Xe PAT software configuration */
> +	struct intel_pat_cache pat_sw_config;
>   };
>   
>   #define xe_for_each_engine(__fd, __hwe) \

