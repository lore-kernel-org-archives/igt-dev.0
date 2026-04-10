Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C760DE99052
	for <igt-dev@archiver.kernel.org>; Fri, 10 Apr 2026 08:06:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7818D10E8E9;
	Fri, 10 Apr 2026 08:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DEJRYnZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5986B10E8E6
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Apr 2026 08:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775808396; x=1807344396;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dgOSCBp/KCPaiN++UlMUuLOdNaRWbDWiQhi2AIdfFd8=;
 b=DEJRYnZezlqrdHmu1bdlhYtuz7WtgErTeS7JL5LqSIs9flacKH0dL9Ui
 /02xuFZ/K6ZYYCn7lf9mg25eixzCUye7JSg23QVflJzuRTAD0YjMKXB6B
 vBDnnDNDkAEvg7IPSBdbxSbbzTrp2ba1K7MVGYseve1QuvmVbOLMTtu0a
 YiCuAimgfIFtYI3yZx+fP+BWcwV/cM2bLYlKD95GsARmegFS7yxoe4oMu
 0hwjU63/9CGMMgmO9cqQqmTVbTDdyD1ISWvExwSpBgPUcTe7eV63J9tRX
 2XfuZfAgmDj8H5nXCshFNiwj90sP5/14hDUZNp77tDgau708yLT/KTqig g==;
X-CSE-ConnectionGUID: hRS4XrXCTGWA0wGbSt3EMQ==
X-CSE-MsgGUID: mx7y+0DARuqDCO3NTjiWCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="102280391"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="102280391"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:06:36 -0700
X-CSE-ConnectionGUID: acnKitjFTN+8UDiPIDQoag==
X-CSE-MsgGUID: x/XfplhfQp26ynXRQi4RcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; d="scan'208";a="252378504"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2026 01:06:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:06:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 10 Apr 2026 01:06:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 10 Apr 2026 01:06:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OGeLV24LAzzT65jvpfIymRbzcQzxISEoHO+nGXd+3E38TNpUWIizSLDjS2CYsh+sBp275PNBQg99v/BRT/s0Cm2V3lMJwQR9QWavCpQ4wogmN6juiTsHkFcYshJjp/m+72ti0x2V7TrFKmrnc1iUaAX/qsWhIUubU0xnxjMmVEo6LwKZZAHJOECigPbIr1JJ3zOM7tZxcQxvDNLwTpZ2qfl4YTvNB2fcyUpZdm38lPPGe4PFpxjH44gCIOZXrRxxHjBeADxihx1RIu9WkVNVFIaex4KDj3wYkZqRJLHnxcCPs/4j9Mcoyw3at9zOG3xIZwqkImP1z2+GLMMuXINvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XKZ0F4F6yx36s2NkBmk9qB9+rcCpwfdCvWvj3Hd79FY=;
 b=kOIkwSuPFQ/ah1X9nULr5YJW/snsdbpWWRbqOu7Ofjr6694fziQcKxcNlk2QIFKZxQgU3wHooQX66Zfy5PQyJsvPSGqpWzvbbQ9fg8Qcf1ljBQyLAHYGjAyDM0KAeJqS817B0t3P/R5OpEDx5KB2Q92EuROyfCWUk7K6iWIF1HFm5zSrVQtfGpMpKWyrXmXEQ0qrYzVSxQKDy9EunCaoeJMsXfq3gPMXCsuTgYuNC1jsP/M2d14qA7dMykAUOo4PWhU6lu4Wi4SkCaYCCpO02bVCVuHblBNCHpyzp1CLLS6woXYrOh5Qpuf2ydB0X+Gc62F/utXqUcQSjGSXwmXq0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7151.namprd11.prod.outlook.com (2603:10b6:303:220::5)
 by SN7PR11MB7973.namprd11.prod.outlook.com (2603:10b6:806:2e6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9791.34; Fri, 10 Apr
 2026 08:06:27 +0000
Received: from MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8]) by MW4PR11MB7151.namprd11.prod.outlook.com
 ([fe80::5263:1353:4122:ddb8%7]) with mapi id 15.20.9791.032; Fri, 10 Apr 2026
 08:06:27 +0000
Message-ID: <c5279cbd-a85f-4ae4-81ae-e259307bbd57@intel.com>
Date: Fri, 10 Apr 2026 13:36:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v7 4/9] tests/intel/xe_madvise: Add
 purged-mmap-blocked subtest
To: Arvind Yadav <arvind.yadav@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <pravalika.gurram@intel.com>
References: <20260409070118.2211602-1-arvind.yadav@intel.com>
 <20260409070118.2211602-5-arvind.yadav@intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260409070118.2211602-5-arvind.yadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To MW4PR11MB7151.namprd11.prod.outlook.com
 (2603:10b6:303:220::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7151:EE_|SN7PR11MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ff62e7-a138-4174-b0bf-08de96d810a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|22082099003|18002099003|56012099003; 
X-Microsoft-Antispam-Message-Info: de8eVYwoALFEHRNTse0gZcfXQYBSsDRJ2tpAbA8OF9hQgMV8Oooh/uBioIeoew/AUVq7CR3dX98ed2JNZ75mZlXXZLHYRz6Tjaamxhfx/MQLQS5ctRA+r9RGTQ/cA9ijXgwx0US/s3hj85Z5iIOKD7FCBowmRnqzxbXiKn80zAp2P9+AHSvpT8qW+Ouo9OytVJJe1BZhnydX6CY6QgaB4RI5pLSPKXHoQjaERLnRHARsnVxVGhGKHL0iSEO0+rdxw26YKsQBU2bh+/grdxvEXIqMlQ7yOpRNgKIPvFjAWuBCsGN4D46FrMjgZVI9Z31rMVKM56DiegEtL0MiTT+bqBUWD7YdsG1PhKzOcKMyAWzq/jNLrBRJQ4GR3AcwUDL4vg2v8u53BmRYxZbrASD9wmk6rOR1J81NPpcejc6ZU0ymtSnmB41Cfv0XqHoBz/jGc7hB4Wtr/OfTziZ1u6BUHWyTiwa43RxnFvVgR3pjEBZF5yy2gNtwpI2ByUwLya+ZxMqfj9rtrcdcH/4WhqNFnhHCI1vfxNXBMi4WKp00mF7bbN/XS64yDqBF3wvPwjDALV2anWgXPpA4y9AO4/F1rQQgV7/RRjOzPTuKGQ4GQrMUmtaO2EipavjVXuxXxTFYrx8Rix0q+RPrW07xpj5kd2SvTqRNe8pS58bq8/6a9xDkV5JIhw8MInBW6FDr7S6XEeB7H3JrcWeDuFn0zYM944km/6LT1AH4pnhWYn21OMw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7151.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0FjL0plU0c3Y0k1aG1KUndBT1NKZVd6VnN2cVNWQVNVZ1k0SDh2aDVPMDdL?=
 =?utf-8?B?VUNOWndxOVNTUmtJQ0N0cFVydm9kZGJUYTd5RzA3Zi9ibmkxdXRqeXlZbkg3?=
 =?utf-8?B?MlJaTzZVbnlRWjR2cUptQWpsdnU1ampEZVZPT0tjVlhJYUtQdmhkdGlQUHJQ?=
 =?utf-8?B?enZDdFRWL0pjVmFpdHN1anZ5dGxPS1lUM2M0VUdiRUdxTW8ycmdTOGd4RHNz?=
 =?utf-8?B?K1FsSmpUTDJTeFZVMXhibm0vcjYwN3JZd0M1OEphUkRLZXFkL29DNmxMYWpR?=
 =?utf-8?B?UDcwNlkxTXJsTzdNYWk4Tmowa2dQT2ZPbElyOVcweThKeStTUjRKbHo2Y3Zl?=
 =?utf-8?B?SU9yM1QyVkhjTDBmbC91VDgwWkRIT3NvZnc2SHkwU3NROEx1TDlEbHZQNERy?=
 =?utf-8?B?WjNLTUppQXVWZ280eDZzOWFqUjFGWHUreWFxMUxjQTZOU3VMYXJ1YVFnN0ZM?=
 =?utf-8?B?Y3lIbjlkeWJhb1RUYkI0QjBsckUyRzh5c3YvS1dHNWwra3hzaUtKaTNoNXp2?=
 =?utf-8?B?V25QcXpyVkJ2dk1LSzlGc3NYMlp5dThuOS9TcDNIdHRvejlXMXdzMXl5VnlP?=
 =?utf-8?B?eU1VWElDZmlCY3hUb2MzZ2U4SUlYUnMzSW43ek1WVEhVRUxKRDBCUHJkTkN4?=
 =?utf-8?B?amFHK3Q0aGw5ejg5WEtIczVBNXhDTWFmYSt4K2tJMEs4UDNzV3B1dHFVR3hY?=
 =?utf-8?B?NDFkak5vYkMyY210WU1QMnVWSjhCQ0VLeUxDeCtJVUw4WlhQc2VSNlpEb3Ix?=
 =?utf-8?B?ZjNIUTlMMDdhRmtna1cvVHFuZW42WFhldEtUUTRwQTBPcjZWbzI0Q08va0c3?=
 =?utf-8?B?VGZvVTlEY1BuQUk2cmNDSTNPQ3dNaEw0UU16czlJL3cwUnhsZFF5MW1TYTNO?=
 =?utf-8?B?cXFnR2YvQnFMYkVjdXdWMEFpQ2dhcmFud2JXSGNub0FKZC9EMWVKaENpU01q?=
 =?utf-8?B?djdBbzhUdGsrdGQ4b0J3Ti9iVHBNeEQxK2thV1NTQ2pnK21kWVNTZ1kwV2li?=
 =?utf-8?B?dUMvdm1kcm0wbFVKbFdtRzBGT0VGMVdTZHAwSzIrU2RhcUpxM3hyTVJrY2Zh?=
 =?utf-8?B?UnJtVk85bk9raUtYaTVndlRtN0NaYlQvM1FVeEFZMFRvWWwzcHZzUDJrS2RU?=
 =?utf-8?B?emlkSW1HQUgxYzhsYUpKVkZJRWgzMmRrSmdDeDdIUU1FVjF2OFVGTkQzK1lx?=
 =?utf-8?B?dWN6LzNTdzh5NFhMbGd4RzgveUlsN2QrdmFreDFVOUozcGlQOUNmR3BmVHRP?=
 =?utf-8?B?aVFlTy91dG1KTUhvamg4R3lDRzl5SU84cC83dGg3RnhPbXg0VVh5TThhRHdp?=
 =?utf-8?B?OWVWR3NybXhMNndkRzVseUlxQ1d5VU9QSDVmd2dwMXA0RzJ5Y2g5cGVZUThX?=
 =?utf-8?B?a2hWODUwdTR5K0ttbFZPdmRNQXFSSEZxenN0elJYalhaMldCUHRhM2cwSFpn?=
 =?utf-8?B?SmJKTWFYVktsb0kwKy9JSCtGV1Rxcyt5Q2p5VFJNbG54ekJrOCsxY1JORGd6?=
 =?utf-8?B?VXlJY2xWYlBKQ3NSOVhqeWVnNUk2NlVQUXpqVFgrK2FxTWNZVUhmR0RTak84?=
 =?utf-8?B?ZFh1MzlNZmJXQmRobTFFZm5NQ0F0S0x0Z1R6dmtFejBMam1MdDBoZmUyOWZ1?=
 =?utf-8?B?Skk1VjJIekZSR3JvNXc1RzVNRVR3aEhvRTI5RjBpQ0FMc1hBWTBRRjZ6Q1Nl?=
 =?utf-8?B?Wm53dURDTEh4aEFWMklYalBCUzdtQWNZWVFXdU50YWFvQUNIcVpsMGFYZ0VG?=
 =?utf-8?B?V3dIaGtORU9MKzkzQVJPZkxBUFltYWdSRWtDOEEwZ1VNNnAxRVZLcm81SWhF?=
 =?utf-8?B?SkJKVFpMdVhja0w2Z3lmcWl0QlN6d09maTBocUwrTy9mMDU2bG0yVFBBeHVD?=
 =?utf-8?B?dHo1Y0t6V3VvSHFGV3Z6bjV6emYvSXh4Nm02dnd1YmxiK1J6b01EczZJZWJp?=
 =?utf-8?B?bjVsRmlPYTcwTll3TGNDS2VLMkZzbzNPV2Q2ZHUybVFxcjZDSXpENmhqdmVh?=
 =?utf-8?B?b0RzbmhYNHhNWThQZDJuc0VHOTVaNW9aeXorQkJINWlOUHNsOVFsYjNiOWUz?=
 =?utf-8?B?eE00Yk9YNE1XekJNeFNKbEVCVTA2T2ZwbEF4MHlWcTd1MXFoblQybUVKRDdE?=
 =?utf-8?B?M0l1QURheDdFcHg5elhtUEdhb0sxcE1yZFY3SWJPWkJCU0lpREtxMjlzKy9q?=
 =?utf-8?B?QjhQR2hNV1JGSlhIVmZCM2JhZmhSUy9MMW1GK05FUVBXU09vWm5IdEsvNlpj?=
 =?utf-8?B?OXdiRWd1OVZYODA4Q1ZRN2o5V05pTnVZdTU1bGtDREFCbGsvNEJHQ1JWUEhV?=
 =?utf-8?B?VFZxRGtXOXlraHpxdERIdFEwMm44K1lTU21sQVZxQWhOVmNkMk5ndz09?=
X-Exchange-RoutingPolicyChecked: J6kgqNE989DXt4qsSwStTZuszz0wg6LQuwYoB5jwQq1no7/yBLtmzlCjql//f77uvqwVac3gwMJPABiMF2tO8AkQVBOwFhQCQU+cjM86PbKzEDjanPedvZEWoHlPfbVs5ugbKxvcmn0ehfViRnx7bCsF3OsZQZc81OR8iPvMDP5YjJJzxJ5oGR2qsr/VhXusxArFEH8UXon2zqGvNiQWA/SDIif5YUnKDpRF/f9ELfH4wGVSqPcsAgsnfxPwHxVpTOiYFi6FqtEMPNZ/a864loBYq9X3n8wvFcdvRmp3YopdClbdXlRXfcstdLnZE+UidyaRp6Sp4U6p1DyrK2nl8w==
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ff62e7-a138-4174-b0bf-08de96d810a3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7151.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 08:06:27.1325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtPDUKCkw1UHX8rfNEOUkqmOPZqnsdx4zxowQpcbs3e6Kq/ann9Ld91peFok2n5L08UJgArLFJc2apFvP6x36w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7973
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


On 4/9/2026 12:31 PM, Arvind Yadav wrote:
> Add a new purged-mmap-blocked subtest that triggers an actual purge
> via memory pressure and verifies that mmap() fails with -EINVAL once
> the BO backing store has been permanently discarded.
>
> The purgeable check moved from xe_gem_mmap_offset_ioctl()
> into a new xe_gem_object_mmap() callback, so the blocking point is now
> mmap() itself rather than the mmap offset ioctl:
>
>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET: always succeeds regardless of
>      purgeable state (just returns the pre-allocated offset)
>    - mmap() on DONTNEED BO: fails with -EBUSY (temporary state)
>    - mmap() on purged BO: fails with -EINVAL (permanent, no backing store)
>
> v5:
>    - Add purged-mmap-blocked subtest to verify mmap is blocked after
>      BO backing store is permanently purged.
>
> v6:
>    - DRM_IOCTL_XE_GEM_MMAP_OFFSET always succeeds; the purgeable check
>      now happens in xe_gem_object_mmap() at mmap() time. For purged BOs,
>      assert mmap() fails with -EINVAL.
>
> v7:
>    - Moved trigger_memory_pressure() and purgeable_mark_and_verify_purged()
>      here. (Nishit)
>    - Use xe_has_vram() instead of checking xe_visible_vram_size() > 0 for
>      clearer dGPU/iGPU detection. (Nishit)
>    - Fix purgeable_mark_and_verify_purged(): handle retained == 0 from
>      DONTNEED (BO already purged) as success instead of incorrectly
>      returning false. (Nishit)
>    - Drop unused vm parameter from trigger_memory_pressure(). (Nishit)
>
> Cc: Nishit Sharma <nishit.sharma@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>   tests/intel/xe_madvise.c | 136 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 136 insertions(+)
>
> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c
> index 2c8c27fa9..619d64b46 100644
> --- a/tests/intel/xe_madvise.c
> +++ b/tests/intel/xe_madvise.c
> @@ -59,6 +59,136 @@ static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>   	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>   }
>   
> +/**
> + * trigger_memory_pressure - Fill VRAM/RAM + 50% to force purgeable reclaim
> + * @fd: DRM file descriptor
> + *
> + * Allocates BOs in a temporary VM until memory is overcommitted by 50%,
> + * forcing the kernel to purge DONTNEED-marked BOs.
> + */
> +static void trigger_memory_pressure(int fd)
> +{
> +	uint64_t mem_size, overpressure;
> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
> +	int max_objs, n = 0;
> +	uint32_t *handles;
> +	uint64_t total;
> +	void *p;
> +	uint32_t handle, vm;
> +
> +	/* Use a separate VM so pressure BOs don't affect the test VM */
> +	vm = xe_vm_create(fd, 0, 0);
> +
> +	/* Purgeable BOs reside in VRAM (dGPU) or system memory (iGPU) */
> +	mem_size = xe_has_vram(fd) ? xe_visible_vram_size(fd, 0) :
> +		   igt_get_total_ram_mb() << 20;
> +
> +	/* Scale overpressure to 50% of memory, minimum 64MB */
> +	overpressure = mem_size / 2;
> +	if (overpressure < (64 << 20))
> +		overpressure = 64 << 20;
> +
> +	max_objs = (mem_size + overpressure) / chunk + 1;
> +	handles = malloc(max_objs * sizeof(*handles));
> +	igt_assert(handles);
> +
> +	total = 0;
> +	while (total < mem_size + overpressure && n < max_objs) {
> +		uint32_t err;
> +
> +		err = __xe_bo_create(fd, vm, chunk,
> +				     vram_if_possible(fd, 0),
> +				     DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
> +				     NULL, &handle);
> +		if (err) /* Out of memory — sufficient pressure achieved */
> +			break;
> +
> +		handles[n++] = handle;
> +		total += chunk;
> +
> +		p = xe_bo_map(fd, handle, chunk);
> +		igt_assert(p != MAP_FAILED);
> +
> +		/* Fault in all pages so they actually consume memory */
> +		memset(p, 0xCD, chunk);
> +		munmap(p, chunk);
> +	}
> +
> +	/* Allow shrinker time to process pressure */
> +	usleep(100000);
> +
> +	for (int i = 0; i < n; i++)
> +		gem_close(fd, handles[i]);
> +
> +	free(handles);
> +
> +	xe_vm_destroy(fd, vm);
> +}
> +
> +/**
> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check purged
> + * @fd: DRM file descriptor
> + * @vm: VM handle
> + * @addr: Virtual address of the BO
> + * @size: Size of the BO
> + *
> + * Returns true if the BO was purged under memory pressure.
> + */
> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm, uint64_t addr, size_t size)
> +{
> +	uint32_t retained;
> +
> +	/* Mark as DONTNEED */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
> +	if (retained == 0)
> +		return true; /* Already purged */
> +
> +	/* Trigger memory pressure */
> +	trigger_memory_pressure(fd);
> +
> +	/* Verify purged */
> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
> +					   DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
> +	return retained == 0;
> +}
> +
> +/**
> + * SUBTEST: purged-mmap-blocked
> + * Description: After BO is purged, verify mmap() fails with -EINVAL
> + * Test category: functionality test
> + */
> +static void test_purged_mmap_blocked(int fd)
> +{
> +	uint32_t bo, vm;
> +	uint64_t addr = PURGEABLE_ADDR;
> +	size_t bo_size = PURGEABLE_BO_SIZE;
> +	struct drm_xe_gem_mmap_offset mmo = {};
> +	void *ptr;
> +
> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size)) {
> +		gem_close(fd, bo);
> +		xe_vm_destroy(fd, vm);
> +		igt_skip("Unable to induce purge on this platform/config");
small nit: here skip message reflecting purge support unavailability in 
platform/config, Simple mention Unable to induce purge.
> +	}
> +
> +	/*
> +	 * Getting the mmap offset is always allowed regardless of purgeable
> +	 * state - the blocking happens at mmap() time (xe_gem_object_mmap).
> +	 * For a purged BO, mmap() must fail with -EINVAL (no backing store).
> +	 */
> +	mmo.handle = bo;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	ptr = mmap(NULL, bo_size, PROT_READ | PROT_WRITE, MAP_SHARED, fd, mmo.offset);
> +	igt_assert_eq_u64((uint64_t)ptr, (uint64_t)MAP_FAILED);
> +	igt_assert_eq(errno, EINVAL);
> +
> +	gem_close(fd, bo);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>   /**
>    * SUBTEST: dontneed-before-mmap
>    * Description: Mark BO as DONTNEED before mmap, verify mmap() fails with -EBUSY
> @@ -115,6 +245,12 @@ int igt_main()
>   			break;
>   		}
>   
> +	igt_subtest("purged-mmap-blocked")
> +		xe_for_each_engine(fd, hwe) {
> +			test_purged_mmap_blocked(fd);
> +			break;
> +		}
> +
>   	igt_fixture() {
>   		xe_device_put(fd);
>   		drm_close_driver(fd);

With above Nit change LGTM:

Reviewed-by: Nishit Sharma <nishit.sharma@intel.com>

