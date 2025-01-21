Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA60C02182
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jan 2025 14:23:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ED0610E1F2;
	Tue, 21 Jan 2025 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNZJ95dw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FE310E1F2
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jan 2025 14:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737469389; x=1769005389;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oCJofgsQQ1UBd1KGvbciZl5L6nTQu8HDqygK4vTFQDE=;
 b=UNZJ95dwBbiCWZ9PvtttIzHUnboR9AWjRrI0eh4khvwb+4GQr2xHK+Df
 iG4C2EOynGQPtew2Xa+93dG0Bk4R5k2G9ET1KST/zfzUDA1kW8OnBsHoC
 6qExG2+8BSOKrePV/Pqoqr++8nz0QXl7/nzFTHR7mya27VmrStdviuTtL
 /F8TOBdk8aDvXPRExpYxeHNeXP2mr7ps/XnLXWgYSjmfsdg1fvVwySnZK
 YWSelfAcdg8PqQR2aHCt0C5rsm93BMaNbWUbzKLeBzesOphlGjVPtwmlc
 tts+xhGFoZJvakTaHQxFusPdn4pLfXjORhMicJUlgthhukUTk3bll8SrP Q==;
X-CSE-ConnectionGUID: 8oYpMj2kTyShEy6TVaZDWw==
X-CSE-MsgGUID: oPV9CE7tQySq61XSD/BcCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="49280485"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="49280485"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 06:23:08 -0800
X-CSE-ConnectionGUID: 7nfs05PqTGuggamr4xXDHg==
X-CSE-MsgGUID: sg6uJFfhT76eH/se0jDstQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="106835982"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Jan 2025 06:23:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 21 Jan 2025 06:23:07 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 21 Jan 2025 06:23:07 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 21 Jan 2025 06:23:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tje/kP1+EXGxH85ZQ1JVBNvDSKTYTgqEdAglrg5iCoFCdxThv6prvI0V/qIPch4rE/zURj4g1DcHQ+vS3fvmCRJC2QZWYGkNsMKNiP7f5eGoE2c9+55A0/BZNmekeYQ4DFQicD4/XQ7ucy1xcv3uLQEyNZPv9ocsOraOExSeGZ18sAc7mVcTKd+mewmbBkWQhfTWafVoikHBapgLgGxaB489ZN9/1dipBalVRYfzKsWQx+yV6Pe/n/HKLtcFbRruKaaP3PfqruZ3gHBg0r2JyJFtSBPNkzskDUPJYeCaMq2nRevAquCmkX8sqa5jUarvd5Yhj3oiutPom025JulPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb3L8OUxCCGSLpTBqjC7IjW/9a2jFuRfA0dtMO2DipI=;
 b=YmumsKx8uqQnFL3FE8qAcxo4CfLrkjwAxIxFd5sPj0Jx1Fdj3jp9y2JrtvTf4vjjdMHp+Ags9+9MGPSlHHRPQkexq20UzZ0Ze79/NcN2L70W0ATy8yXEC3Ed5L2zQdrlwguQ20M1WsPfk1QMbxkoCSU5FGpoKB+4QjibkC3gcD/3tTs9SrCzuMH9k1LwHop/uH4Lds1HAjPlJMTbROFRC/R+x7sQoPVOUO04BtgXXHWrJQ9z4cTza5xuci3mTxBSL3//9Z4TSkg3+1OQBySRroD7vh/3NyJ+0Mz2ofRIZryJoyX3jLEJKaSulpY17mPDZhOiPHWJyfOz+x9VxXPE6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3238.namprd11.prod.outlook.com (2603:10b6:a03:7e::30)
 by SA0PR11MB4669.namprd11.prod.outlook.com (2603:10b6:806:99::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.22; Tue, 21 Jan
 2025 14:23:05 +0000
Received: from BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03]) by BYAPR11MB3238.namprd11.prod.outlook.com
 ([fe80::ba3:e9e3:27c2:bd03%6]) with mapi id 15.20.8356.017; Tue, 21 Jan 2025
 14:23:05 +0000
Message-ID: <105dcb0e-95bc-45b4-907e-150a00c30dab@intel.com>
Date: Tue, 21 Jan 2025 19:52:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/1] tests/intel/xe_oa: Extend non-zero-reason
 test
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250116135456.4066677-1-sai.teja.pottumuttu@intel.com>
 <20250116135456.4066677-2-sai.teja.pottumuttu@intel.com>
 <85o706dzns.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>
In-Reply-To: <85o706dzns.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0242.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::8) To BYAPR11MB3238.namprd11.prod.outlook.com
 (2603:10b6:a03:7e::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3238:EE_|SA0PR11MB4669:EE_
X-MS-Office365-Filtering-Correlation-Id: 845da7e4-b87e-4b47-9e2f-08dd3a271e77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K25vQWlpZlBaUnM5TTdpM3lVK2NJM1NXWXNFSW44SEFJNUthWk02VXNVZENr?=
 =?utf-8?B?KzJ4SnlDOFhPT3dYTjNTWFJTTkJ4ZlhwQ2RDWDlXN294L1RQdkV4K09PbGtw?=
 =?utf-8?B?VnVPc0E5bUpRMHZoZmtwSndtejVJSDVyQ3dyVGlXQjNkV3hiNmFJWDdRcnFP?=
 =?utf-8?B?dDQwb29wZ2JkMWFReEdIdVFKWGcwUXFIMXNNU05waXpmd3FhZEVza2E5Zk9t?=
 =?utf-8?B?YURuK3ozUU1MdWlTd0VHQjNKUEEwNWNtZHhVdFNWSTd1cXhnSXhZTGt5UW5h?=
 =?utf-8?B?TVMzOC9HWnYwdkdtZ2JuWDNVeXB2dEhsZENCUVhKTU5qUlp2ZnVMdTc2ZVNH?=
 =?utf-8?B?dTYyTit2M1lPKzhJQlIrblp0dUEza1NtaitqU3J2anR3NnhhTEQ3bW1WcEIx?=
 =?utf-8?B?WU9OM2xodFpOeTIzaHphQS9iZkIvWnpCT01JdW9hVS9tREFQeUp1Z3ZsYW1r?=
 =?utf-8?B?d1dEbkVMUFJRSWJON0RIS0szWWk0MGlhM0huMHk1bWJTMEF0SEd1Z2d4ODJQ?=
 =?utf-8?B?Sk1SRUNrMU82WmRlZWpDTU1Oa1JLYVpyUGl3SkwzVldlQVJWZ2N1Z0Y5NTM4?=
 =?utf-8?B?TEZaNW9hNnhnUUhlQm5LU3l6dFBVbWJIeGVNakhOTm9xeU4xa1ZmM0IzWU1Y?=
 =?utf-8?B?TEZiaTB2N055c3kvVVpRT3BIRWRsR0V4ektLOGZuSkloVklJWFlrcjJHZGwy?=
 =?utf-8?B?emw1L0tKYU5POGpSWERwTGdQTkFlM1FSR245ZkNKMHZ0SnROczE0VDBBYkNM?=
 =?utf-8?B?ZDZsWXJac3hTeS9pM2dFSUFreFpGZURaclRVa3Rtb1l4R1JvWUlOcFF0anB5?=
 =?utf-8?B?L0MxUHhNaHhod0xHN1VtNUVkS1U1blNNQllXY3lmVXdEL3V3SEhuaTN0dFYx?=
 =?utf-8?B?VWdqY1FVRUR5RVB6Z2drZ3RMSW5uOGRHNEx1WHhBVmRKcTdQU3ZwanREanBt?=
 =?utf-8?B?MFpWYjF4TmpTVlZ4dVFCdkJkbTdzRHZqTzM3R0dld3ZkdmRrT3VjeHdjRmt2?=
 =?utf-8?B?T1BxVmJ2aG1GSlNIRE9VdkUzVytNeDg5aitES3Q3dmYxalNXWFZIT0NrcGp0?=
 =?utf-8?B?NnRtRzVMZThxQnBBdk1BZVpNZWNCZStDbHp1VkFnR0FvcWIwWFYweWkzalJO?=
 =?utf-8?B?UWFyUTFNV2lWbzV0R3ZhZ2VHR1ptT2c2VElvaWtsRjc5MC9jYWtaNlhiTXl0?=
 =?utf-8?B?TXhvcTFXR2luZE9TWExDY2xqeUV1UWkwQzNoNTUvUGcxVnRXUDB6SExQUkhv?=
 =?utf-8?B?dFVybGhYeisvakdXWks3NDZUZSthUmtMN2VUVWVDU29YSm5CR1hyOERqYytX?=
 =?utf-8?B?MTV2RXFRNGpRcVU1RG9tWUxnOC93T1FaWDZ1dHJ5WitucWhHUmw2YVpJdDZJ?=
 =?utf-8?B?RWJ2bmxjMEUvbVZiWHl3bjlRL2RRTGV5UFF5U3JzRzlvSXdxR0VodTFGQ0lS?=
 =?utf-8?B?eGluMW81NWljK1NtdHg2UXdrZE9hSWdwcHY0eWRFRThKWGFyL0ROaUV1azJ5?=
 =?utf-8?B?YjQ2elBSOVd4RFZJZ1MrMXhoeUFqVjYxSDVTSk02TU5pK2VqMmlMRUdaaTF6?=
 =?utf-8?B?WDg0NjY1dVh1WEl3T21PN2VLa2ZqMldCV1hhWTA2Z2Y4b2Jqc0RLa00vTER1?=
 =?utf-8?B?eDAvY1VIdStvTUxVV2lNUDBYcVZBR2d6M1hGTmJ4K1RhNzQ3ditxQ1czakRU?=
 =?utf-8?B?NmpWMmZuZTNMd2lrMmRFc3I1amVPVWhaMzhzUGRrQVNhRXlGWjJzYTBzVHY2?=
 =?utf-8?B?NkZTaHBlOWw3N2lOcUw1S282Ry9oL0cwM3hwUmtQalFkQmhHUmdJVDkvRmdU?=
 =?utf-8?B?QURRTGZraXpPVDhIUnFudz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3238.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhXTGQxS3Q4d2JQOTN0bmdWU0lPNndZUlF1OWFtNDFhTXZtZzV0N29OTTZV?=
 =?utf-8?B?MnFaQ1loSkRhWHFaUXhVY3FkckxOQ24vTkVUUEFBNm5wVUQrUDJzWGdINCsr?=
 =?utf-8?B?ZlZmZHNPWlhxWjVKRm56VFFVakZsL0hlQjhXMzVQVEtJMWJlWTRBT0hVSkR5?=
 =?utf-8?B?MHRhUkhxUW5ESUJJYjYxalFkWEpDQUY4emZHOFJyaU5VdENhb1RTRkUvMC9C?=
 =?utf-8?B?VHVrQzBMbmFLVEZ4cnhsTWQwcldXYjlWVWRDQXlVT0o5QkZHZUlOdkNUa0x5?=
 =?utf-8?B?WGVvRW1DbDFXSUxFSUFNcUJ6SWxneTBydEtydVlVVU1PUzZzZDVnUHFrbHBa?=
 =?utf-8?B?bnVSMEszTHJ0LzVPOTloMG53OWFjS1RocUdsbGhiVmVFRmhlVWhZK1p3cElo?=
 =?utf-8?B?YU5ML0lQbU5COTZsdFlxMGRFcmU2RHFBdGRKM21CeFdxMUYzSUlibHVUUHZD?=
 =?utf-8?B?TE9mQkhXT3R0bFVRb1UvNlpmeGhKMEhHeEU5T00yWnNNTWFlZHRadUFnR3RT?=
 =?utf-8?B?ckQ0VjhjOVVxNVF1c0FUcnJxQWtCL3YwODFHK3J2RElENExsNGkxdjBRRWxz?=
 =?utf-8?B?V1J0aytRUXJyWXZMSEJFUGNOOXRBUG5NU241WjNOVFFRK1FVaHN1Qm9GVXpE?=
 =?utf-8?B?ZUI0dWkvelNSRnNlVVVEa0h1Ry9lMHJWdDgrZ2RMdXg1OUFxWlFFb1U1QlBL?=
 =?utf-8?B?QWlNdnFySXpmTTVTZEE3WWswRDk5cHYwU1JnNiszOGd2Uzg2WWwyeVV6aTQ2?=
 =?utf-8?B?MWhHR29zTmlzbGIzY2JsOE96dFRPUnlIdTA4RXhqN1I5dWVxcUd5VHVEWGlZ?=
 =?utf-8?B?dWZCZ255NGZ1WWt3czI4THE3M3FBUHZ6OENoRzhtaEMxeHUzRFlKMWExQmg0?=
 =?utf-8?B?VUs4QnhzZGlUWmNVcHRrSHB6SUVyaFBxbzV1clVqaExlL2J1SzVSbERvT0ll?=
 =?utf-8?B?eGZNNDNDQWhkcFhLdkgwazVaYnNYRTJZWkxabzZEbXBaME5Pd1NmWkthT1Ri?=
 =?utf-8?B?UzJmK21tbUpvalhEemI3NkNYa0g4WDNJTm40bGFXcEdxdmdUQ2ZEV2ZOSjlH?=
 =?utf-8?B?ak9KczBhaVpQRDRsRHZTRUF3TERETG4xd2E2NmVxbUFNeVorc2FuVDBnSXBD?=
 =?utf-8?B?SHhFcEtyb2tXQ3FXR1FvdVBKSjdRSFNBR2VsWjZDZUF3NUJGU1VTR0FNaXFH?=
 =?utf-8?B?WkFpQ0dZN1o3ZWQ1M0JoaXRrbms2ZllCZUtDVFByeTBHZnRWVkw4VGFwUHVk?=
 =?utf-8?B?RWlpWHBHVFQwaitpSStvdHNGYjVyaTlYbG5lK0NqNVpFNHJTdHVRU0YwbDRV?=
 =?utf-8?B?WkZzUHRCMmhhMThGTXlsY1hSa0Fld1RUNm5QOTArN29lcXlxRW0rU1V5Slp1?=
 =?utf-8?B?b05sb1BGdzBGZW42ZVJFU3dYNGxTWHRnN1NBNmNnUmtDMUZXVXFYMldLeVRk?=
 =?utf-8?B?R002ZUxFdWVQWWcxZkQ3UXVBM1R1dWhCODIwVFNBWFh4a283NE84VE9lbEJ0?=
 =?utf-8?B?V2JML0hPeC9aNGNZWkJoUThxc3QyTnFFaDlUTmJjQ1ZpUG92TGVHMTFBSzBs?=
 =?utf-8?B?c3JVVk8yUUVlT0o4alo1bVppQ0Y3OERFZ25DSzI3MnRyK2lRQ2JpcU5WL2Fa?=
 =?utf-8?B?anRYdnI5MjJmY21QWXZhUWMrYjBXcHl5VnVtTG5wV2UzRncyKzdkMFc0aDFU?=
 =?utf-8?B?K3NBNDRNRk5jV05SM2krRjYyd3FZL3hMMFZ4VnI2ZVMyREZwSkNUZzNyZlZX?=
 =?utf-8?B?UTgxZGpzWnA3dm1sU3NIU29JVm1LTjRMcng2R29xRFdhQ3JpOWVLOWJRb0Q0?=
 =?utf-8?B?RmVOd3kydWp0UFI2NGdQQ04vQ21yL2k0S2wvcmVRUFVaUkVyN3V2VEorS3hY?=
 =?utf-8?B?d3RlMmVyN1hFUGVIalhzTWlKeDhUTEdOQlZDSmlLOGRMS2g1NUsvaHFsQjkx?=
 =?utf-8?B?Z0tHaFF0VmpqN05jNUpKcEdJUnEvV0VVN243aTJXWEVkL0l5Rk9lT2VqVEFE?=
 =?utf-8?B?NXBhRGdsb3pkejJIV25GL00vK3ZzejJKNnZKaTExS3ZBbEM4ckc5dWxlaXlK?=
 =?utf-8?B?bFJBTGtZdFBaRFRiVkF2cC9uVVFFQldTQmNwcWlhaFJrMkI3RkUvcmhSbWFp?=
 =?utf-8?B?NFhyODBaN2FiSUhMWndJRkQ3VytzNk9IUDlraUlHNW9tSHhCQm1Xait2OGd1?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 845da7e4-b87e-4b47-9e2f-08dd3a271e77
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3238.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 14:23:04.9924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b9pEpvnUq1AP8SjFfnE76lChZHSb1WSxHszahVQYY8Dj71VPcZA4S8Wj/FBg6H/UhSOpxdiNo/IE8F+dhAJbXOdnQ/kRFn8GIBBOKMIsme4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4669
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

On 17-01-2025 06:28, Dixit, Ashutosh wrote:
> On Thu, 16 Jan 2025 05:54:56 -0800, Sai Teja Pottumuttu wrote:
>>
> 
> Hi Sai Teja,
> 
>> Extend non-zero-reason test to use configurable OA buffer sizes and
>> execute the test for three different sizes 8,16 and 32MB.
> 
> I made a few changes to the patch and posted a v2. Please take a look. I
> have tested these changes, so no need to test again.

Hello Ashutosh,

Thanks for the changes. As discussed, I have posted a v3 with the changes.
Link: https://patchwork.freedesktop.org/series/142128/#rev3


> 
> A single patch generally doesn't need a cover letter.

I just thought that it would be good to have all these patch variants 
grouped together, so had the cover letter.

> 
> I am seeing consistent failures with 32 MB OA buffer size (reason seems to
> 0 somehow) on Xe1. Did you see these failures on Xe2? So I think we should
> drop the 32 MB size test.

Yeah, looks like there is a consistent failure for 32MB size especially 
with Xe1 integrated platforms, we will look into this.

I didn't see any failures with Xe2 though.

> 
> Rest looks good and I have R-b'd the v2. If you like my changes you can R-b
> v2 too :-)

I didn't retain the R-b on my v3 as there were changes, it would be 
great if you can take a look and R-b again

Thank You,
Sai Teja

> 
> Thanks.
> --
> Ashutosh
> 
> 
>>
>> Signed-off-by: Sai Teja Pottumuttu <sai.teja.pottumuttu@intel.com>
>> ---
>>   tests/intel/xe_oa.c | 30 +++++++++++++++++++++++++++---
>>   1 file changed, 27 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index 492a6b5d6..f28156a66 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -2504,7 +2504,7 @@ again_1:
>>    * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
>>    */
>>   static void
>> -test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>> +test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
>>   {
>> 	/* ~20 micro second period */
>> 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
>> @@ -2522,6 +2522,7 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>> 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
>> 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent,
>> 		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
>> +		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, oa_buffer_size,
>> 	};
>> 	struct intel_xe_oa_open_prop param = {
>> 		.num_properties = ARRAY_SIZE(properties) / 2,
>> @@ -2541,6 +2542,9 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe)
>> 	load_helper_init();
>> 	load_helper_run(HIGH);
>>
>> +	if (!oa_buffer_size)
>> +		param.num_properties = param.num_properties - 1;
>> +
>> 	stream_fd = __perf_open(drm_fd, &param, true /* prevent_pm */);
>>           set_fd_flags(stream_fd, O_CLOEXEC);
>>
>> @@ -4867,8 +4871,28 @@ igt_main
>> 			test_buffer_fill(hwe);
>>
>> 	igt_subtest_with_dynamic("non-zero-reason") {
>> -		__for_one_hwe_in_oag(hwe)
>> -			test_non_zero_reason(hwe);
>> +		struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
>> +		struct drm_xe_oa_unit *oau = (struct drm_xe_oa_unit *)&qoa->oa_units[0];
>> +
>> +		if (oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE) {
>> +			hwe = oa_unit_engine(drm_fd, 0);
>> +			if (hwe) {
>> +				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
>> +					      hwe->engine_instance, "8MB")
>> +					test_non_zero_reason(hwe, SZ_8M);
>> +
>> +				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
>> +					      hwe->engine_instance, "16MB")
>> +					test_non_zero_reason(hwe, SZ_16M);
>> +
>> +				igt_dynamic_f("%s-%d-%s", xe_engine_class_name(hwe->engine_class),
>> +					      hwe->engine_instance, "32MB")
>> +					test_non_zero_reason(hwe, SZ_32M);
>> +			}
>> +		} else {
>> +			__for_one_hwe_in_oag(hwe)
>> +				test_non_zero_reason(hwe, 0);
>> +		}
>> 	}
>>
>> 	igt_subtest("disabled-read-error")
>> --
>> 2.34.1
>>
