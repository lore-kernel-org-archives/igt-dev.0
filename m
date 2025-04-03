Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BA2C3600C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Apr 2025 06:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C3E10E209;
	Thu,  3 Apr 2025 06:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MR2oemsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C0C10E209
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Apr 2025 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743662497; x=1775198497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NKTQNd6oWw7/4Cjkx6t5nVrNpb6W2bl+D+ZY46DA8o4=;
 b=MR2oemsX8KayuDTh+wXgwkiatvxJnnzyyGFvigQseSI+xKMSEjvv4twu
 af7H/vnuEpkden1w9tgtxXvthbhNaPQSujuZ8PpQQTemNDSq/epC9WmHx
 GsKLq/gmwW08TTR8gnIEpT8g0tCmw6qNWWec9uNAgaGuYiuCimE/XrdBU
 FFknMIi4tOagZCcTrF4Q5sJ6dh1SkuFkqjUT/oDZ7fyETW0qpA+gRNGdw
 8eeoySrWxF/1X7odLgeu51Vffjrs0Mv5g3zX5QQqDmlhw1Xlo8HDOAnB8
 lOxcZs/78gQ13DQxfUOVCBcprrDtNXmHJIuioalCakPUVsBEH0FuXJAPT Q==;
X-CSE-ConnectionGUID: 88t6GzfFT7yxY2aShNBqTQ==
X-CSE-MsgGUID: fQWyax0mQ36a12NJqH5hkQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56418565"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="56418565"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 23:41:37 -0700
X-CSE-ConnectionGUID: xmcgFopRQrOZhumuV5QlOw==
X-CSE-MsgGUID: PaEbsifuTvaoVEn9Xe5gNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="157872473"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 23:41:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 2 Apr 2025 23:41:36 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 2 Apr 2025 23:41:36 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 2 Apr 2025 23:41:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcrVuLjKSYevgL7y7tiJ90dt6SSSupJnAKmXcaInRWh++HyzA5vpJBBl21I3lOh2weJ0+tuHcJ2q1N5BVBRhE3lULN1aBNy+qphMu4CURdIfrnhsP4ghIMgOmYPuzYuXsbqwC6DaeteC9faxVspz74xRgOKq4aR/sHC/HwzXhudo5Zf5q3ppP55W7CvG/o88kzrfv3JUo9bMnPHupWAArGSej8U2CEACJVMrqwGW4NfXPf4ZiHyu/wEfl5JqbVpncZeKeHle93BSPCpv2KTippThcyyKY3/fEC8tJfkS+peWV3E98U6MdZ3s3HBUDT4Wiec58knPQZLtTEzx2gFJjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ouV06WUsqk20UHL7AziKOb4YdxfikhLpRtOlEpofp+0=;
 b=fAbjf39XMk9eAnxM1DbBuA3/z0hYEgqoLeGaDaLSRa78zrsT1glYaDi40RMzSAqdVSq5qmdSO/TRCfDG+WLguu94lw4Ci/bZ5NxyRp4kgU+dK9h/PgM+/S9nnRk/8lsmo40j7J5fDruewpapdX1qbx91lvjuJkRZIEow1hTeNlkYZ4FqbFR9SrxnQJiHJbsLH/X+tnxWD352yMnJ56Fcoum8nn3uEWTNKIEzebVNBi4Dh2q03rx7/pc94O5M9SUhfkaQcDStakXaefaM8IDlWHDswxX9c1a8EwCYaiiuxKxVybZAvLZA3wMMLbZtv8AJCVoUYSihow3CIk0UP7RwNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by SA2PR11MB4940.namprd11.prod.outlook.com (2603:10b6:806:fa::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 06:41:34 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 06:41:34 +0000
Message-ID: <ea765776-41a3-4eac-8392-f4857dcb70d8@intel.com>
Date: Thu, 3 Apr 2025 12:11:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V7 03/37] lib/igt_kms: Move get_writeback_formats_blob to
 lib
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
 <20250326233609.2980110-4-alex.hung@amd.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250326233609.2980110-4-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|SA2PR11MB4940:EE_
X-MS-Office365-Filtering-Correlation-Id: b80242ac-a984-415b-266d-08dd727a9323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHNYK3FpZEQ4cUVFeVFaZXF1dlJTbWJmUjdoaVZlMElLR28rOFNBdnJGcENK?=
 =?utf-8?B?MHFYZk55N2xFRS9UMUV2OWI0NTQ2UkdJb3FtSFhiak1qZ0o3NUVjUUF3aHU1?=
 =?utf-8?B?Um0zRXpzeUErcG0zUkh3ZTBUbFRyWWZUT2hmd3hzOUdzQ3BCT1N2TXJtWjdE?=
 =?utf-8?B?K3V2a2JtU1J5ZUVFZStKSGgvck9jSkdHMlFLT3FnWUwwZmhFRGw3bXVhQ1lv?=
 =?utf-8?B?TkpPOHJBcjZ6TEc1eHg5QVNwMWZydGxKbzFOY0FWeDMvUU9aNFFraWhnNDI5?=
 =?utf-8?B?anloT05ZWUZnNk5peUhSaEJFVWZlWkVEalQzM0ZUaDY4MXlOKzYrNHp3Yll2?=
 =?utf-8?B?bmdNQng3RStzZzcvMzZhUEl6SzJ1YkYrZG5ocGl3dmJnS3JPcE51QjdIeTFo?=
 =?utf-8?B?RzU0SFZla1VlOUk2cm8zQ0FEOS9KcDZ0c1Nrd0FVZVJxUXl4YzNUQ0h1THNN?=
 =?utf-8?B?dXk2ZHBhLzFkeUpjbGFSMXhHRU5jTExJOXJRbFQzTkt3MUJjTmVnTjFWdG84?=
 =?utf-8?B?Um15dXF4elNnalpHQzV5YWYyZEtQdEhXWU15b3pXU0tEQVdmQ2NkdUhVekZ0?=
 =?utf-8?B?aXdobExScjVFN3lkRlY5dUt4d053MzludVFTN3A4YnhPZ2lSd2NGcGVVY0hT?=
 =?utf-8?B?R01HWkJDeDBGbFNacXg2am5YTHgraUkrVE9JckdMY09DaGpBMDEvUUZYcmNM?=
 =?utf-8?B?OU4wZ0tZZkZUVEZFd3BueS8rSE1sVDMxdWR3S1VPSlQ1ZkhWb3lJdTVuN0dI?=
 =?utf-8?B?SjdwUGlhUk5QQ01OY29jSDExYWpCT3JWdW1XNkFFYXlpZWxRQXNzenZiVjRU?=
 =?utf-8?B?dFNoSWUvaWZzSFgzNjN3c0hlT3lNZThRUGRIaVBJekl2MFlSQWZ1RzB5RnBP?=
 =?utf-8?B?RkdCaDk4T012ckMzMU9qWDcwMDRlZnBvZStzRFpwSnpQaTZaOTF4Q2RNZW5Z?=
 =?utf-8?B?WXEwS29FaGJoUllNa0dtVDBQaWJ5Uyt5WWR3SGFmcDNkMWFQcWNScXZCL2tS?=
 =?utf-8?B?YjN3UzBkNkZUdlhDc3d3YXBVK1FtYnhENDZUU0RCeW1ra0VDUStmbE1TbXBN?=
 =?utf-8?B?SGdNNzhISWdJbXhtOHJUUWEwMzI4eWdNNDJpMGFoV2lqVm00TkxRR2h2a09Y?=
 =?utf-8?B?aitWOWk0YlZWWE9nMnJwRkl5Y1V6T0JqUnJnTWNaWkFSK2t0N2I3NnNDY2Fw?=
 =?utf-8?B?UHpoOVY4anlHcE1YSUJTYTlZQ0Zxdit0dHYrb0owRXhIUDh1emZCVXRaNjda?=
 =?utf-8?B?S0x5VThmN2NKUHBvYTIwbDlkZmNCS0VZWG1IR1cwY0NWQTJ1d2crbFNCb0dX?=
 =?utf-8?B?Z3g4QjQxVzZzRXA4ZkRCLzdISWVkVjRYYlV0d2FkM21QYlNPREdmRDVIUEZ4?=
 =?utf-8?B?bE90SHdrOSt4eHFYdEtYRmxsTHovOVFzZ1VGV2ZkQ2RWTTFlY3FxWmxVTlRB?=
 =?utf-8?B?ZEp4ZzZYak5VV1NVSGp2M2h0TmhNNmZLcjRDYzkvV29KODBIM0QrME85SEdz?=
 =?utf-8?B?ZWZ2ZFNjSHU0TVVFMktteTU5Sm1TUTUza0JoUVE2Yi9oM3JtRk96eTBBTHla?=
 =?utf-8?B?NHJpYWtmRXlwYlhZZkR3b1pMZVVjL3JRWlBZbVQwbHB2anRvRXhkODYwaGtK?=
 =?utf-8?B?U2ZFODViRzZvNUlQcWhPUWFlZXo2ZTNWM1U2UGwzK2hQY2RxaG5MQjFPM3dC?=
 =?utf-8?B?c3ArZVdJUHZDYUdSc1o5WjlnUC9CK2NlalJ5Y3FldmdWMHR0TmZCaEhtQ1oy?=
 =?utf-8?B?MmpCTmFpcE1MS1A3UWZQSjhiM2dWeEVta0VIYmU1dy9MWW83Tlo4WUo1dit2?=
 =?utf-8?B?bjljZ2NWSUtIWHg5cUdCSCt1YXlEVjkrU08wWUdlZmFmb3VXWC9JVGtScnFh?=
 =?utf-8?Q?POjtZSGvezzWq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2x0YTJSRGRJZlY1OVI2R05iWCt2VG9Ma2pSRm5oZDB2bGZhM052bUVpcDAv?=
 =?utf-8?B?RzlrcGc3eUo2eitKQyt2QzRWTnVUcUJ4OWo0RFhyYmoreXNUZjBGTlJ1ZTlt?=
 =?utf-8?B?VHE3WWxmN2IyYzM1cUVsWWtlNDlUMk81MmcwODRnSklKanhFa3JSMzliSEE3?=
 =?utf-8?B?aVAvUzM5d3JkN2pBOTVuRVNmQXk0VWVQZEhvMm5KUWJPYmduRHkxaWZRYmhT?=
 =?utf-8?B?RGY4SDF3bkQ0Ty9XWkVqNVg1S0pJYnorait1Mk94bUt1V2tUMGp6YVBXSFNN?=
 =?utf-8?B?NlJ5c3hLY3VTVmFFOHp2TTFMSktrMmV3QVljYjVLTG5vWGIwMHRmdll6d2Nm?=
 =?utf-8?B?MmxXL2c5MjVvL2NkbTYxdFRSbEdjVFF0SnZBL2lYVkxZVUVMWnBHSFVRUWt1?=
 =?utf-8?B?WkxuSS8vM1VDOVFiNlZWbnY3Y2JGWTF5a3FhcWtxM0xGL0FPVHJVZ2tic1FY?=
 =?utf-8?B?V2hSTlBkWlBvYmFHTSs1REYzUTIzdGFFSldaeThidW9FdHA2VXFLays1ZGF5?=
 =?utf-8?B?L1Irb2tLZEhpUnJwaFgzaTd2NFlMd2tCdnh0VFZtalVWL2VVOC92UFp3bkZv?=
 =?utf-8?B?bVc2VWZvK1hvYXMyOXpaNGpRNlc5cWIzZUd2RitUZG9FMDBhZ0RMQVQ5d1N0?=
 =?utf-8?B?MnF1Q1BKSnA1V2wvTnRvWjJVZGs0KzRyZlRyU09rK25PK0NXR3lHMjM0YVpr?=
 =?utf-8?B?RzZIQ1cxYU9vZEsyYWNoL0lmZ2FtbUtzRWNMbEZzL0Jhb3pYTVhadm1DdkJm?=
 =?utf-8?B?VW50NGFGVDNDSnZPL0JxUXAzUEQ0Q2pXSG5SOTkrdlNUM0ErZ1c0eWhFS0xL?=
 =?utf-8?B?T21Zd2NwNEJsK042S1U5SkRCTVQ1NHg2MWNaaG5SMzBRTFA1Qk9DWGd1QlV1?=
 =?utf-8?B?SU1VRVVINDNrZDluZ1VsSkgxTGF3V0lobW5Nb0VPMi9tNEVvczFYQkprZ3hQ?=
 =?utf-8?B?SXBKeUw1eGw1SDFSVmNTSzlvWHEyQURGS0RGcGFoaUZ4clV4SVZEN3BwNWhn?=
 =?utf-8?B?Yk10TEZsT0FPWTBGSGdFSWQ5OXV1Z1BHQU5xQXkyNDA4ZVB6bWlOR091Q1Bj?=
 =?utf-8?B?elFhTHd1ZGNBK3dsYUdQWk1XaVdHdHNmU1RKK3VKaFlEUm9uTVl6UXozeUpI?=
 =?utf-8?B?WElPRC92dXdRaUV5T1pIUVVNbGEwL1g5ZUVuWkZJb1lDQmp2dFNpMkhZcjVx?=
 =?utf-8?B?MUF4bndjUzRjaG1kNjRGUlFlemlKZTFkcWZkY09XUHlKenluM2RWdHVEWHVJ?=
 =?utf-8?B?YlNraTQxZFBSVTNrNzNnTjR0SDhTUDJkTXBDd0Izdjh4bDhmcjlDK3lmUkFH?=
 =?utf-8?B?SFdwM2JxMThieWhBVUJqWndscjhOQXg3bXZJVmdTUWd1N0d6SHh6UXZSMGhJ?=
 =?utf-8?B?R1crMGxVeDdsV2NoYXZTSGFWbzVIUlVFZjluaWtwM3JxcWZUdG5IOGs0M21I?=
 =?utf-8?B?SWlVUDB4N0JvTUZjMEVSR2xpQ2VEK2lQU2pRUjBMMGZPc1hLejhJc25pc3V5?=
 =?utf-8?B?eDQ1TkRFMjVnYzVWbUZVekhxc3pFN0xGazE5NGtjcWFrUVRUM0JPeGhmei9q?=
 =?utf-8?B?UW9sQmRyVmNiTklqRGxpWFlDM3VRQXIxVTJTTDRrcnkvbnRhNitpakNSQUFa?=
 =?utf-8?B?anMybUFIMzZIR2FVaGQxSmsyY25JSkczQ3NGOU9KZGFiVDRZUXppTVJVYlVB?=
 =?utf-8?B?anpxRFJWWHRHbmZLeUxHMm1wRnhkYXJaYXlRS2lwaDFFcmFITDIwYWs2VXp1?=
 =?utf-8?B?eG1sY0c2VDQxVU8zanV0eE9KMzdpZVcwdTNBVnZiYUNwY3UwVWtWRE11ODJ3?=
 =?utf-8?B?VlQvYlRyWmhzellVcjd5OE1LTUVGNnlqVzVsdjlsVG5UZ1hBNVRYZFB2SEIv?=
 =?utf-8?B?amtOQXBKRUtldXNBVHVSNW5PV2tvK2NrL1lDb2tHTEVXS1JzNXlIZlg0MTAz?=
 =?utf-8?B?dHZ5eFdXK2VFVWtIcWpOQ2x6YllZZnJFUGpNWmx6UFFEZ0xVZmJVNkhudzJW?=
 =?utf-8?B?aWtMa3A5WVZUOEtjL3VLYjNjZjg3M3pTQzdKa0RhOThOdkk1MUVFOEtPdkRQ?=
 =?utf-8?B?Q0VkT3V3WlJIY2o4VVVPT2pLSWtNZVNIL1VkSHh2Qm1UTEpkcFk3NVYxbjAv?=
 =?utf-8?B?M2EyNzFxQ3lLaHd2OHIveno5OWJoTEhENjRTMWVqcm9DSHJjWjVnMk1VU0Vi?=
 =?utf-8?B?Umc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b80242ac-a984-415b-266d-08dd727a9323
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 06:41:33.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfJFxdWOMjlO9NKAekeNtLzFporLmV/bjaIgr/esY5J2Bl5FD11XZD6JyLRX1klsmEhUkF2OCWZDoo2H5XUCYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4940
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

Hi Alex,

On 27-03-2025 05:05 am, Alex Hung wrote:
> From: Harry Wentland <harry.wentland@amd.com>
>
> We'll need it in other tests
>
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_kms.c         | 19 +++++++++++++++++++
>   lib/igt_kms.h         |  2 ++
>   tests/kms_writeback.c | 19 -------------------
>   3 files changed, 21 insertions(+), 19 deletions(-)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 99c8707c7..884d78749 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7434,3 +7434,22 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
>   
>   	return 0;
>   }
> +
> +drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
Please write function documentation comment.
> +{
> +	drmModePropertyBlobRes *blob = NULL;
> +	uint64_t blob_id;
> +	int ret;
> +
> +	ret = kmstest_get_property(output->display->drm_fd,
> +				   output->config.connector->connector_id,
> +				   DRM_MODE_OBJECT_CONNECTOR,
> +				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
> +				   NULL, &blob_id, NULL);
> +	if (ret)
> +		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> +
> +	igt_assert(blob);
> +
> +	return blob;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 0381c82ad..9b5a940f7 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1280,4 +1280,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
>   
> +drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output);
> +
>   #endif /* __IGT_KMS_H__ */
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index e3671c59b..f733f3ce6 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -92,25 +92,6 @@ enum {
>   	XRGB2101010 = 1 << 1,
>   };
>   
> -static drmModePropertyBlobRes *get_writeback_formats_blob(igt_output_t *output)
> -{
> -	drmModePropertyBlobRes *blob = NULL;
> -	uint64_t blob_id;
> -	int ret;
> -
> -	ret = kmstest_get_property(output->display->drm_fd,
> -				   output->config.connector->connector_id,
> -				   DRM_MODE_OBJECT_CONNECTOR,
> -				   igt_connector_prop_names[IGT_CONNECTOR_WRITEBACK_PIXEL_FORMATS],
> -				   NULL, &blob_id, NULL);
> -	if (ret)
> -		blob = drmModeGetPropertyBlob(output->display->drm_fd, blob_id);
> -
> -	igt_assert(blob);
> -
> -	return blob;
> -}
> -
>   static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>   				    drmModeModeInfo override_mode)
>   {

