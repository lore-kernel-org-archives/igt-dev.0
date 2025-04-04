Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F0DC36010
	for <igt-dev@archiver.kernel.org>; Fri,  4 Apr 2025 06:05:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08AD10E309;
	Fri,  4 Apr 2025 06:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZBpUMWTn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF18010E309
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Apr 2025 06:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743746747; x=1775282747;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uA34aRtkxzT2ZVy7QFEG++1uSdm/3YcSkFiO/cLtzeY=;
 b=ZBpUMWTn/FJeK3r1HCBCsLSKzl/GW2egVEGQFdKiytvGAXBRM6UptCY0
 afNPDt8zbuTCe4mvwV72DliRnSqCCxCx6Nt+eFvZ+oOLFNETq3kNMQ9Ay
 LxMOVApKz9d2Bw+I8qEIzzIL4zlk5ohIFwfICW+kpuyChmuzAnj7wFoDR
 THQjiB4a12lyDMJEfg1AQ7MKCKZ20sNAOuWiXGfXEd4/c1MOY+FCjBhB2
 ta8IpVQ+myupjKkwib4C3IFYOSmluBwKHSGa88L9M9Fn8pXp0XWfFDez3
 Z4KR3FQpvNWLNDV78JMU8F9J/ehyInF8xXRzdpF2NGthnn0NIruHZ3fhj w==;
X-CSE-ConnectionGUID: GJIgOjhXShCyxPMDYthOwQ==
X-CSE-MsgGUID: 5tUrvP8qSw+lCauE8DcIDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70550449"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="70550449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 23:05:46 -0700
X-CSE-ConnectionGUID: Pzb2ZeX2SOCfQor+dtFF3g==
X-CSE-MsgGUID: vpStDRSLRY6iA8vdItoPfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; d="scan'208";a="127173899"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 23:05:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 3 Apr 2025 23:05:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 3 Apr 2025 23:05:45 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 23:05:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqbUX8lJeeSDj6rbFhpoaJWfKCYtyQ/mm2hEfe0nN3AUpRMqbtxluuO/vR1ASLJe3Kd5fzjHZXmEvWC9F6ncL4cmCkBZl1SmMW3viD+Frf8dE4sZLRJ9mmECwu8hRiHy/XIHoGKaCEl/L4IJN8IXqRH/RPJ4PIYsbdnT6K/QO3sckudMB68Lqb4XBe3JrkOtrK7DZSesEBNSjROfGWJr0xGQFE844V9v8RTRD+RbtcjinjsuL+RcV+NbMh7H1MnTJs4O1l8V/hhLQb3bGn8HbFWAMaVans6xCLy1B6uofxBDFWWElbGighKYV1bKXQBmrmBxl3xMmLlKlI8RUm1YVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uA34aRtkxzT2ZVy7QFEG++1uSdm/3YcSkFiO/cLtzeY=;
 b=MH3XzNQaTWeWk2nXPJDYAKfb2wXzgbl2rLz0qXWkS2PkG2FhMbJBMMwEbdoo4KDx19I/JSGbqRzd5IYuUvTehLdb/oyTSHwlrRCAdZ4WL8wAMbsnUn2CqfcptQSZwO3PfGVOwlPShKucCGwkaSC6rbGcH3wnVl82vI64zM+09+O4QcUCRB6Y8WvokoDdzWHp19QbhMRgS5ZkaHndXWVlGgQq/hVoa0LO9viFZxuaFV5H++38huTtgBnR9FJxMfrEC41DhnJhpPBzLt1bX7K8g5yh2y8FPK2jLcy0+y/SHdJYiYtvrTB7tsQlxdW4A/ILK/AcZHT2hQY+ZCN3WHtOCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SA3PR11MB7415.namprd11.prod.outlook.com (2603:10b6:806:318::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 4 Apr
 2025 06:04:59 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%7]) with mapi id 15.20.8534.052; Fri, 4 Apr 2025
 06:04:59 +0000
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>, 
 "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Subject: RE: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Thread-Topic: [i-g-t,v4,2/3] tests/intel/xe_fault_injection: Inject errors
 during xe_guc_ct_send_recv & xe_guc_mmio_send_recv.
Thread-Index: AQHbpJ0rV2AjoCuy40aHqujf2aWujrOTBEtw
Date: Fri, 4 Apr 2025 06:04:59 +0000
Message-ID: <LV3PR11MB86951576818F866D55D961D7F9A92@LV3PR11MB8695.namprd11.prod.outlook.com>
References: <20250328111532.16620-3-satyanarayana.k.v.p@intel.com>
 <1b95cae9-33c2-47b5-b4e5-d9000543cd8c@intel.com>
In-Reply-To: <1b95cae9-33c2-47b5-b4e5-d9000543cd8c@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR11MB8695:EE_|SA3PR11MB7415:EE_
x-ms-office365-filtering-correlation-id: c3530dfd-62bd-4cc8-22fa-08dd733ea1d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N1lGREFlOHRqTis4c2hkTVlja1FPcFdUY0tTc2NoRzJMRitFdjNJR1ZPY21B?=
 =?utf-8?B?NUcwaktXZkpIMlBySWF3NUEvbkhTUWMwVHZYNWJEVDBKUk5tVUlUSUpSa0Fl?=
 =?utf-8?B?ZXBpWkszaXVGRDljNFhXanFTc0x4S3BCbnMrU2tuclUxRC94Q3ovS21Fenp1?=
 =?utf-8?B?b3FuSEc5R1Z6RWJhQU1PU29VcHZtMDAwa1kvYzhKVFBmQTRUSHRXVWQvejJV?=
 =?utf-8?B?TDVTQnQxekRGbzVRc1dBaCtaS29lYzR3bWpaWTlDalpmNGgyMHZIZUNpVG5G?=
 =?utf-8?B?VkR2aWFlR21UNzZUbUYvWStSR0toczVFdWEreHFDNGFJMXk3L2NrT1MwNnpG?=
 =?utf-8?B?UWFPUWpyb1FJNWlCKzVlRWtKL25TZ2ZSaDZpZE9OUWVYS0o2RytXN0p2QTRq?=
 =?utf-8?B?bHFzOFNsWDlqUkw3aHJqZklLUkpKcUVFVjl2ZndRaGRtRWpyNjlyWjQwdlNO?=
 =?utf-8?B?bThBcnhpd2VVeDk4MXRVK1Zsd3llMENET0Z1WjBQSm9IWnhLVmhxdFNlbGt6?=
 =?utf-8?B?K2VqYmxCMTljU1krMVVPTDI0K0ppOTRyNU8rNEFoOTZLMlZ1RnBNZGNXMEVy?=
 =?utf-8?B?c2VJV1dNc2lDSVJGa1Vua1RJRTZFNVJOUDcvZHRFRHo3dFBGa0tGaFFFUyt6?=
 =?utf-8?B?MnhKL25WRFFIZThZZ3pjK0tRWnhwWDAwc1Y5VkpFdU5yNFNDMlVpZkw2ZWZw?=
 =?utf-8?B?UGhjamVNWHVrbVdPVmxCT1Q1elYzM0Zld3BPTmQ1U2FtRW9qOFVQUjQyR3cr?=
 =?utf-8?B?R0F4NExkSkMxclpad0VYN1B3SDR3THNBdFJBYkVyUFRLNHpJa0RpcEprK2ov?=
 =?utf-8?B?WWRLN1lFd1ZJRnhLZ2VaRU9admpkWFNpMkJ1RGR1K1prTHBjMS9zOS9QemZB?=
 =?utf-8?B?cWJrY3ZPU0QraUc2QXNjalpycm15MHZ0dmh4K0RJdmZBTm5hek93M0JlbzZH?=
 =?utf-8?B?WTFYNUtmSVVuY2E3V1FZYkxFWkwra1kyVStndG54czJadmx2aFBKSXhLVWpv?=
 =?utf-8?B?N29Dd00wVUFRenZhaGJWcnRRM2dkaXZ0VnlGWTYzcjZUOWNwVUpEZlF0UTg0?=
 =?utf-8?B?NUhUSWxBSEcvaHNMeUc0NnJPbWR5anEwbGdDMDNKRUZBUkNDOGpkd2g4djFh?=
 =?utf-8?B?ZjZyZWowLzNSdXdseE9TSytVMHhTa1E2eXJ0Mk5GeTh2UTlQQUxLTzRKbElt?=
 =?utf-8?B?NHZkbTJ2RllDTklvQWhSbExFNnIrbGxZV0dzRjdJSmlEWGdUWCt4WDN3VXhq?=
 =?utf-8?B?YTAvTktNQ2pnSWZVSGRHV2UwLyszZ0liOTk3UDRTMHRxK285ZUEyT25qd2th?=
 =?utf-8?B?dnQ3OXZyYzlqOTNMaTUyT0lZZ0YyaVV3bys4UU0waEgzTlhBUzYxajErN3pu?=
 =?utf-8?B?bHU3cytHQ20wMTNNL3ZkWCtqOVpyN0ZObDVOLzVzWFNmTHFCcGpXRkk1MjlZ?=
 =?utf-8?B?R2VEekVEdGNQaloydGxUSlBnelg4NUZFd0FpeWVkcTZWZ3YrN1NVVHFVMHNu?=
 =?utf-8?B?dTlYa0xpdERUd3psY2lrd2NXOGJtVlJyeldtQ2ZET3VvSlRTTVQyWlJzM0Iw?=
 =?utf-8?B?dFhJOHJscHRZL212M2QwT3RqOE81WVoycjJndEpzakRKMi9iOGk3eDh6dUkx?=
 =?utf-8?B?TzJMTmVzQ3pDR3o4cEI0TCsrU3p0R3ZFcnZlUHY4Zkg4VnlFUFI1QVEvNkUx?=
 =?utf-8?B?dnBnbEYvMlh3Q2NuUm1hQ2N0U0pBNllXeUtXbkx5L1NsUDVKZk5HZXFFSHA2?=
 =?utf-8?B?S052VmFhM2JOS1RiQytqWkI3Zld2VHhuTVBnSzZTQjNvTUI4NXYrdGE0aG1P?=
 =?utf-8?B?dnFpTWdIS2JCanRpU3ErQ0RVa2ZiaENUVzNBMitEZ3lzSVNFanpuVnpsdDBB?=
 =?utf-8?B?UEx6WHNhSEN3WkUzaks5djg3bVJGNmRwY1RNc2w0WTRkK3lZOEt0eUJwR29j?=
 =?utf-8?B?WXVvcmNkMXhsc25pdGdlQU9nWTI0Z2g2YmM3L3hhL1BlSGlDckpzZkxCaXlp?=
 =?utf-8?Q?g3SZ8GQKDZg7oDTAIdmZZ+X02ncGO8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NisvUjJQR1dneExieHo3aVlzMVA3RlIweFkrOGx3ZzVnR2o5NXBOS01McUhM?=
 =?utf-8?B?Zk1aWE9ObHpHUzZ5TXhITG42T2s5a0liYVIrNS9ZSlRhZGFEWkx1MDF1dHNO?=
 =?utf-8?B?YmFkcWtyM0pBUDRiRDliYVh5dVkyVlFpdzdTQ2RoaUpzbTR2cmlDOFZFSFRP?=
 =?utf-8?B?aWVYd0xvRjM5RG1ndlY5Znd5RDVjSUd5MUdDejg0SlJRTGxRZW1Lc2tVemhy?=
 =?utf-8?B?OFg2cDFZcit0L0pITUdlZ2VIdFErYis1MENWb0R6KzNxLy9xOTZBbzk5V3pW?=
 =?utf-8?B?alFlRlZqNThhODNPM09pQU8xWUpadE5QZ2JWOFhya0JIRCtVaytCRXlQNnda?=
 =?utf-8?B?TXJqdU9yN2FHM2h2ak8wNGtkcW5KcnBxT24wUS9wZElvOTVuVUZrS1NhYUww?=
 =?utf-8?B?R1ArMnE0ellzZW5OMG5WME41Rk1qZmtWWWRnVmlSbm5mZFZTVTF6S3RVMWtz?=
 =?utf-8?B?Zk5WWjJobWM5ZzA5K29LVDlEb243UW9OSWF2VGxZWGlsNnhlZjZiY2V0ckpP?=
 =?utf-8?B?MjNTdFVkOGZpYnFwSzU5MllPUG9QVFlLRmJVeFh0andsRDA2ckFueEtrZGJr?=
 =?utf-8?B?RmhmK25raW5qa1c4NzcxTXc0SENiblMwK3B0clh1ZG5KS01jRHFFYzBVVUpq?=
 =?utf-8?B?T2RmRTkwbWovbFlWOEVoaUE2L0grWGJjbkFYb0JBZnVFbW9NKzNyZjlFT2l3?=
 =?utf-8?B?bllxNHBqZU9rcXF2Z2FQM0V0d0FzUzlKSE9PYkZEbThVa2JGZ0Y3MW9hRk9D?=
 =?utf-8?B?Yml3K1d5RUVzZDlZNXY4RW9TYlV6RHRUS2VNeXlBM3ArL1Z0TndKa2Ezakta?=
 =?utf-8?B?WVBSblNhb1ViUEdnU2RQZ0IrWU4vMSt5YUNzSGg0bjArNnZuWVZPQjVCQVZm?=
 =?utf-8?B?blJSSm9xemVhZzVoR1RFdzRkVXROK2p5WkxDYjh1NDBtME5sSDZXSDN5Wkh6?=
 =?utf-8?B?bllFVnZOL1RkaEl6K04zSE1reW9wUDJRVm5FSjlwZ3QySTJtRk5aZTB2dWpL?=
 =?utf-8?B?bWplc0hqL3ZCcVhhWWMyRG1kYUdjcmdMYkU5OEgrL1o5bjBMckhyV1pEQ0lS?=
 =?utf-8?B?amxFeWpscEpMUUNhbnJ6TXNOQWovZXRlcWNUR21mSStOSm9raVk1WHpxcHJJ?=
 =?utf-8?B?QkRsVHRrdFgrcG5qbjB2OTU5dVdDd0habUJzeHBrbFpDOTlsOGlud0lsSlFL?=
 =?utf-8?B?bXViUENTNmpEYWpoTHh2L2pHdHhKNy9qQ21vNldjWDdjMG5GdHZ5enFnQTJz?=
 =?utf-8?B?YWZJWkRqZ0MxTThieVFISHZRN3hRaTBrL0xqbVpJaXNGOTB1eE1Bc0FkOHN3?=
 =?utf-8?B?bHNzY1BhQjJ1b1REaGNLNURtQVFwZVZLZWFZTldTVytTZHZ2WEJjQ2hTMDZi?=
 =?utf-8?B?OVZRVFBTUDRsQlZhYlJDV2s3cDdwQ3cwRkZObVdUNFRCQmZhd25hTjEzSnc0?=
 =?utf-8?B?RUQ2VDhMaG43MmhhbElIOUhJanJkbzErWC85aTFTbFl5TVBsREtKRERKekFp?=
 =?utf-8?B?MEhZVHZteGRpTGNUU0trNnpKY2poK09sSTI1K0NJU0xUVElDYjZ6RkpJU1pz?=
 =?utf-8?B?ZW1xTVVINE1tQ3FSN3hUTTREWnJMWmlsTjhjNFhKSS8yNE5TZnY1aWhmSzg3?=
 =?utf-8?B?a0VVdUVRSlRIWWd3SnF5enl3MS9zbktSdzhVU0t6bG8xVE9aT002ZEtOUmpB?=
 =?utf-8?B?Y01IMUlCL1VrNXg1U2J2WUVTUjFrcDF2ekk2K1VGZEtaKytWUWtidWlsaCtC?=
 =?utf-8?B?M0lCLy9UNU9xc2JpM2tORnd3c0xHUzZCYjA0bDZmUnNoNHJydTEvQmhNS1RK?=
 =?utf-8?B?Z3F4ck5XdzRUK084b3dOYkw0ektpYmU2QklNRG4wdXFLbnZPT0k2KzMweWdF?=
 =?utf-8?B?MGVML3hCblNVWlJKck5GdS9qQXVEMUpkdVI5aW51SE9CM3ZJWFN5ZE5kOWhB?=
 =?utf-8?B?R0pPZk0xWWZuSytpMDlBUHNUTXFQVHR6bURNUkpmSmRtb3V0TzhoSmNqZ1VR?=
 =?utf-8?B?ejExLzN5WHFBWFhHY1ZKYnE1YmdDbGFvdlJ5NE5oYld5bmswSTkrVFFyUmRC?=
 =?utf-8?B?alNIS3R4QnFLbmFlYVA3aDZNbDFKWGNzMU1SYXQrTnlmbmdjNXVydWJtZkY3?=
 =?utf-8?B?czlmZkV1ZXV3YTNrL2YvdWdhTG1zQmxBRCtKcy82Q2pHdS92YktlWW9ibGsw?=
 =?utf-8?B?eXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3530dfd-62bd-4cc8-22fa-08dd733ea1d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2025 06:04:59.6389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uDcxhrAxkqdEnEC5kkfq1YgecMSp9tH/pK50tus4JNkHTbwbfSIwiEDJ/Jwt/hzXzBF4CxNUsow6+fqruWgQ2VEEav9nywY63mZ360OwmJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7415
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

PiBGcm9tOiBMYWd1bmEsIEx1a2FzeiA8bHVrYXN6LmxhZ3VuYUBpbnRlbC5jb20+DQo+IFNlbnQ6
IFRodXJzZGF5LCBBcHJpbCAzLCAyMDI1IDc6MDUgUE0NCj4gVG86IEsgViBQLCBTYXR5YW5hcmF5
YW5hIDxzYXR5YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT47IGlndC0NCj4gZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KPiBDYzogRGUgTWFyY2hpLCBMdWNhcyA8bHVjYXMuZGVtYXJjaGlAaW50
ZWwuY29tPjsgV2FqZGVjemtvLCBNaWNoYWwNCj4gPE1pY2hhbC5XYWpkZWN6a29AaW50ZWwuY29t
PjsgRHVnYXN0LCBGcmFuY29pcw0KPiA8ZnJhbmNvaXMuZHVnYXN0QGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IFtpLWctdCx2NCwyLzNdIHRlc3RzL2ludGVsL3hlX2ZhdWx0X2luamVjdGlvbjog
SW5qZWN0IGVycm9ycyBkdXJpbmcNCj4geGVfZ3VjX2N0X3NlbmRfcmVjdiAmIHhlX2d1Y19tbWlv
X3NlbmRfcmVjdi4NCj4gDQo+IA0KPiBPbiAzLzI4LzIwMjUgMTI6MTUsIFNhdHlhbmFyYXlhbmEg
SyBWIFAgd3JvdGU6DQo+ID4gVXNlIHRoZSBrZXJuZWwgZmF1bHQgaW5qZWN0aW9uIGluZnJhc3Ry
dWN0dXJlIHRvIHRlc3QgZXJyb3IgaGFuZGxpbmcNCj4gPiBvZiB4ZSBkdXJpbmcgZHJpdmVyIHBy
b2JlIHdoZW4gZXhlY3V0aW5nIHhlX2d1Y19jdF9zZW5kX3JlY3YoKSAvDQo+ID4geGVfZ3VjX21t
aW9fc2VuZF9yZWN2KCkgc28gdGhhdCBtb3JlIGNvZGUgcGF0aHMgYXJlIHRlc3RlZCwgc3VjaCBh
cw0KPiA+IGVycm9yIGhhbmRsaW5nIGFuZCB1bndpbmRpbmcuDQo+ID4NCj4gPiBBbGwgeGVfaW5p
dCgpIGtpbmQgb2YgZnVuY3Rpb25zIGFyZSBjYWxsZWQganVzdCBvbmNlIGR1cmluZyBkcml2ZXIg
cHJvYmUsDQo+ID4gc28gaXQgaXMgc3VmZmljaWVudCB0byBmYWlsIGZpcnN0L2FsbCBjYWxscyB0
byB0aGVtLiBEcml2ZXIgY29tbXVuaWNhdGVzDQo+ID4gd2l0aCB0aGUgR3VDIG11bHRpcGxlIHRp
bWVzLCBhbmQgdGhlIHJlYWwgZmFpbHVyZSBjYW4gaGFwcGVuIGF0IGRpZmZlcmVudA0KPiA+IGNh
bGwsIGhlbmNlIHRoZSBuZWVkIHRvIGluamVjdCBmYWlsdXJlIGluIEd1QyBjb21tdW5pY2F0aW9u
IGZ1bmN0aW9ucywNCj4gPiBsaWtlIGd1Y19tbWlvX3NlbmQoKSBvciBndWNfY3Rfc2VuZCgpLCBi
dXQgaXQgY2FuJ3QgYmUganVzdCBmaXJzdCBjYWxsIG9yDQo+ID4gYWxsIGNhbGxzLCBidXQgd2Ug
bmVlZCB0byBiZSBhYmxlIHRvIHNlbGVjdCBzcGVjaWZpYyBpdGVyYXRpb24gdG8gZmFpbC4NCj4g
Pg0KPiA+IFRvIGFkZHJlc3MgdGhpcyBwcm9ibGVtLCB0aGUgZW52aXJvbm1lbnRhbCB2YXJpYWJs
ZQ0KPiBJR1RfRkFVTFRfSU5KRUNUX0lURVJBVElPTg0KPiANCj4gSSB0aGluayBpdCdkIGJlIGJl
dHRlciB0byB1c2UgdGVzdCBwYXJhbWV0ZXIgaW5zdGVhZCBvZiBlbnZpcm9ubWVudA0KPiB2YXJp
YWJsZS4gUGxlYXNlIGNoZWNrIGlndF9tYWluX2FyZ3MoKSBhbmQgY29uc2lkZXIgdXNpbmcgaXQu
DQo+DQpIaSBMdWthc3osDQogVGhlIGludGVudGlvbiBvZiB0ZXN0IGlzIHRvIGluamVjdCBlcnJv
ciAwLTEwMCBpdGVyYXRpb25zIGZvciBndWNfY3QgYW5kIGd1Y19tbWlvIGZ1bmN0aW9ucy4NClRo
ZSBlbnZpcm9ubWVudCB2YXJpYWJsZSBpcyB1c2VkIHRvIGluamVjdCBlcnJvciBhdCBzcGVjaWZp
YyBpdGVyYXRpb24gaW4gY2FzZSB3ZSB3YW50IHRvIGRlYnVnIA0KSXNzdWUgaW4gY2FzZSBvZiBh
bnkgZmFpbHVyZS4gU28sIG5vdCB1c2VkIHRlc3QgcGFyYW1ldGVyLg0KDQotU2F0eWEuDQoNCiAN
Cj4gPiBpcyB1c2VkLiBJZiB0aGUgSUdUX0ZBVUxUX0lOSkVDVF9JVEVSQVRJT04gaXMgbm90IGV4
cG9ydGVkLCBhbiBlcnJvciB3aWxsDQo+ID4gYmUgaW5qZWN0ZWQgaW4gZXZlcnkgcG9zc2libGUg
ZnVuY3Rpb24gY2FsbCBzdGFydGluZyBmcm9tIGZpcnN0IHVwIHRvIHRoZQ0KPiA+IG1heCBudW1i
ZXIgb2YgaXRlcmF0aW9uIGRlZmluZWQgYnkgSU5KRUNUX0lURVJBVElPTlMsIGN1cnJlbnRseQ0K
PiBoYXJkY29kZWQNCj4gPiBhcyAxMDAuIEFsc28sIHVzaW5nIElHVF9GQVVMVF9JTkpFQ1RfSVRF
UkFUSU9OLCBhbiBlcnJvciBjYW4gYmUgaW5qZWN0ZWQNCj4gYXQNCj4gPiBzcGVjaWZpYyBmdW5j
dGlvbiBjYWxsLg0KPiA+DQo+ID4gRXJyb3IgY2FuIGJlIGluamVjdGVkIHVzaW5nOg0KPiA+IGln
dEB4ZV9mYXVsdF9pbmplY3Rpb25AcHJvYmUtZmFpbC1ndWMteGVfZ3VjX2N0X3NlbmRfcmVjdg0K
PiA+IGlndEB4ZV9mYXVsdF9pbmplY3Rpb25AcHJvYmUtZmFpbC1ndWMteGVfZ3VjX21taW9fc2Vu
ZF9yZWN2DQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBTYXR5YW5hcmF5YW5hIEsgViBQIDxzYXR5
YW5hcmF5YW5hLmsudi5wQGludGVsLmNvbT4NCj4gPiBDYzogTWljaGHFgiBXYWpkZWN6a28gPG1p
Y2hhbC53YWpkZWN6a29AaW50ZWwuY29tPg0KPiA+IENjOiBGcmFuY29pcyBEdWdhc3QgPGZyYW5j
b2lzLmR1Z2FzdEBpbnRlbC5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEx1Y2FzIERlIE1hcmNoaSA8
bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICAgdGVzdHMvaW50ZWwveGVf
ZmF1bHRfaW5qZWN0aW9uLmMgfCA2MQ0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDYxIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS90ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYyBiL3Rlc3RzL2ludGVsL3hl
X2ZhdWx0X2luamVjdGlvbi5jDQo+ID4gaW5kZXggMTMyNWExNzE2Li5hNDkwNzBiNGQgMTAwNjQ0
DQo+ID4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZmF1bHRfaW5qZWN0aW9uLmMNCj4gPiArKysgYi90
ZXN0cy9pbnRlbC94ZV9mYXVsdF9pbmplY3Rpb24uYw0KPiA+IEBAIC0yNiw2ICsyNiw3IEBADQo+
ID4gICAjZGVmaW5lIElOSkVDVF9FUlJOTwktRU5PTUVNDQo+ID4gICAjZGVmaW5lIEJPX0FERFIJ
CTB4MWEwMDAwDQo+ID4gICAjZGVmaW5lIEJPX1NJWkUJCSgxMDI0KjEwMjQpDQo+ID4gKyNkZWZp
bmUgSU5KRUNUX0lURVJBVElPTlMJMTAwDQo+ID4NCj4gPiAgIGVudW0gaW5qZWN0aW9uX2xpc3Rf
YWN0aW9uIHsNCj4gPiAgIAlJTkpFQ1RJT05fTElTVF9BREQsDQo+ID4gQEAgLTQzLDYgKzQ0LDI0
IEBAIHN0cnVjdCBmYXVsdF9pbmplY3Rpb25fcGFyYW1zIHsNCj4gPiAgIAl1aW50MzJfdCBzcGFj
ZTsNCj4gPiAgIH07DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqICBJbnRyb2R1Y2UgYSBuZXcgZW52
aXJvbm1lbnRhbCB2YXJpYWJsZSBJR1RfRkFVTFRfSU5KRUNUX0lURVJBVElPTg0KPiA+ICsgKiAg
dXNpbmcgd2hpY2ggYW4gZXJyb3IgY2FuIGJlIGluamVjdGVkIGF0IHNwZWNpZmljIGZ1bmN0aW9u
IGNhbGwuDQo+ID4gKyAqICBXaGVuIHVuc2V0IHRlc3Qgd2lsbCBydW4gZm9yIElOSkVDVF9JVEVS
QVRJT05TIGl0ZXJhdGlvbnMuDQo+ID4gKyAqICBXaGVuIHNldCB0byA8PTAgb3IgbWFsZm9ybWVk
IC0gc2FtZSBhcyB1bnNldC4NCj4gPiArICogIFdoZW4gc2V0IHRvID4wIGl0IHdpbGwgcnVuIHNp
bmdsZSBuLXRoIGl0ZXJhdGlvbiBvbmx5Lg0KPiA+ICsgKi8NCj4gPiArc3RhdGljIGludCBnZXRf
ZmF1bHRfaW5qZWN0X2l0ZXIodm9pZCkNCj4gPiArew0KPiA+ICsJY29uc3QgY2hhciAqZW52ID0g
Z2V0ZW52KCJJR1RfRkFVTFRfSU5KRUNUX0lURVJBVElPTiIpOw0KPiA+ICsNCj4gPiArCS8qIFJl
dHVybiAwIGlmIG5vdCBleHBvcnRlZCAvIC12ZSB2YWx1ZSAqLw0KPiA+ICsJaWYgKCFlbnYgfHwg
YXRvaShlbnYpIDw9IDApDQo+ID4gKwkJcmV0dXJuIDA7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIGF0
b2koZW52KTsNCj4gPiArfQ0KPiA+ICsNCj4gPiAgIHN0YXRpYyBpbnQgZmFpbF9mdW5jdGlvbl9v
cGVuKHZvaWQpDQo+ID4gICB7DQo+ID4gICAJaW50IGRlYnVnZnNfZmFpbF9mdW5jdGlvbl9kaXJf
ZmQ7DQo+ID4gQEAgLTIyOCw2ICsyNDcsMzQgQEAgaW5qZWN0X2ZhdWx0X3Byb2JlKGludCBmZCwg
Y2hhciBwY2lfc2xvdFtdLCBjb25zdA0KPiBjaGFyIGZ1bmN0aW9uX25hbWVbXSkNCj4gPiAgIAlp
bmplY3Rpb25fbGlzdF9kbyhJTkpFQ1RJT05fTElTVF9SRU1PVkUsIGZ1bmN0aW9uX25hbWUpOw0K
PiA+ICAgfQ0KPiA+DQo+ID4gKy8qKg0KPiA+ICsgKiBTVUJURVNUOiBwcm9iZS1mYWlsLWd1Yy0l
cw0KPiA+ICsgKiBEZXNjcmlwdGlvbjogaW5qZWN0IGFuIGVycm9yIGluIHRoZSBpbmplY3RhYmxl
IGZ1bmN0aW9uICVhcmdbMV0gdGhlbg0KPiByZXByb2JlIGRyaXZlcg0KPiA+ICsgKiBGdW5jdGlv
bmFsaXR5OiBmYXVsdA0KPiA+ICsgKg0KPiA+ICsgKiBhcmdbMV06DQo+ID4gKyAqIEB4ZV9ndWNf
bW1pb19zZW5kX3JlY3Y6ICAgICBJbmplY3QgYW4gZXJyb3Igd2hlbiBjYWxsaW5nDQo+IHhlX2d1
Y19tbWlvX3NlbmRfcmVjdg0KPiA+ICsgKiBAeGVfZ3VjX2N0X3NlbmRfcmVjdjogICAgICAgSW5q
ZWN0IGFuIGVycm9yIHdoZW4gY2FsbGluZw0KPiB4ZV9ndWNfY3Rfc2VuZF9yZWN2DQo+ID4gKyAq
Lw0KPiA+ICtzdGF0aWMgdm9pZCBwcm9iZV9mYWlsX2d1YyhpbnQgZmQsIGNoYXIgcGNpX3Nsb3Rb
XSwgY29uc3QgY2hhcg0KPiBmdW5jdGlvbl9uYW1lW10sDQo+ID4gKyAgICAgICAgICAgICAgIHN0
cnVjdCBmYXVsdF9pbmplY3Rpb25fcGFyYW1zICpmYXVsdF9wYXJhbXMpDQo+ID4gK3sNCj4gPiAr
CWludCBpdGVyX3N0YXJ0ID0gMCwgaXRlcl9lbmQgPSAwLCBpdGVyID0gMDsNCj4gPiArDQo+ID4g
KwlpZ3RfYXNzZXJ0KGZhdWx0X3BhcmFtcyk7DQo+ID4gKw0KPiA+ICsJLyogR2V0IHRoZSBpdGVy
YXRpb24gY291bnQgZnJvbSBlbnZpcm9ubWVudCAqLw0KPiA+ICsJaXRlciA9IGdldF9mYXVsdF9p
bmplY3RfaXRlcigpOw0KPiA+ICsJaXRlcl9zdGFydCA9IGl0ZXIgPyA6IDA7DQo+IA0KPiBDYW4n
dCBpdCBiZSBqdXN0IGl0ZXJfc3RhcnQgPSBpdGVyOyA/DQo+IA0KPiA+ICsJaXRlcl9lbmQgPSBp
dGVyID8gaXRlciArIDEgOiBJTkpFQ1RfSVRFUkFUSU9OUzsNCj4gPiArCWZvciAoaW50IGkgPSBp
dGVyX3N0YXJ0OyBpIDwgaXRlcl9lbmQ7IGkrKykgew0KPiA+ICsJCWZhdWx0X3BhcmFtcy0+c3Bh
Y2UgPSBpOw0KPiA+ICsJCXNldHVwX2luamVjdGlvbl9mYXVsdChmYXVsdF9wYXJhbXMpOw0KPiA+
ICsJCWluamVjdF9mYXVsdF9wcm9iZShmZCwgcGNpX3Nsb3QsIGZ1bmN0aW9uX25hbWUpOw0KPiA+
ICsJCWlndF9rbW9kX3VuYmluZCgieGUiLCBwY2lfc2xvdCk7DQo+ID4gKwl9DQo+ID4gK30NCj4g
PiArDQo+ID4gICAvKioNCj4gPiAgICAqIFNVQlRFU1Q6IGV4ZWMtcXVldWUtY3JlYXRlLWZhaWwt
JXMNCj4gPiAgICAqIERlc2NyaXB0aW9uOiBpbmplY3QgYW4gZXJyb3IgaW4gZnVuY3Rpb24gJWFy
Z1sxXSB1c2VkIGluIGV4ZWMgcXVldWUgY3JlYXRlDQo+IElPQ1RMIHRvIG1ha2UgaXQgZmFpbA0K
PiA+IEBAIC00MDYsNiArNDUzLDcgQEAgaWd0X21haW4NCj4gPiAgIHsNCj4gPiAgIAlpbnQgZmQs
IHN5c2ZzOw0KPiA+ICAgCXN0cnVjdCBkcm1feGVfZW5naW5lX2NsYXNzX2luc3RhbmNlICpod2U7
DQo+ID4gKwlzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFtcyBmYXVsdF9wYXJhbXM7DQo+ID4g
ICAJc3RhdGljIHVpbnQzMl90IGRldmlkOw0KPiA+ICAgCWNoYXIgcGNpX3Nsb3RbTkFNRV9NQVhd
Ow0KPiA+ICAgCWNvbnN0IHN0cnVjdCBzZWN0aW9uIHsNCj4gPiBAQCAtNDYzLDYgKzUxMSwxMiBA
QCBpZ3RfbWFpbg0KPiA+ICAgCQl7IH0NCj4gPiAgIAl9Ow0KPiA+DQo+ID4gKwljb25zdCBzdHJ1
Y3Qgc2VjdGlvbiBndWNfZmFpbF9mdW5jdGlvbnNbXSA9IHsNCj4gPiArCQl7ICJ4ZV9ndWNfbW1p
b19zZW5kX3JlY3YiIH0sDQo+ID4gKwkJeyAieGVfZ3VjX2N0X3NlbmRfcmVjdiIgfSwNCj4gPiAr
CQl7IH0NCj4gPiArCX07DQo+ID4gKw0KPiA+ICAgCWlndF9maXh0dXJlIHsNCj4gPiAgIAkJaWd0
X3JlcXVpcmUoZmFpbF9mdW5jdGlvbl9pbmplY3Rpb25fZW5hYmxlZCgpKTsNCj4gPiAgIAkJZmQg
PSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX1hFKTsNCj4gPiBAQCAtNTA1LDYgKzU1OSwxMyBAQCBp
Z3RfbWFpbg0KPiA+ICAgCQlpZ3Rfc3VidGVzdF9mKCJpbmplY3QtZmF1bHQtcHJvYmUtZnVuY3Rp
b24tJXMiLCBzLT5uYW1lKQ0KPiA+ICAgCQkJaW5qZWN0X2ZhdWx0X3Byb2JlKGZkLCBwY2lfc2xv
dCwgcy0+bmFtZSk7DQo+ID4NCj4gPiArICAgZm9yIChjb25zdCBzdHJ1Y3Qgc2VjdGlvbiAqcyA9
IGd1Y19mYWlsX2Z1bmN0aW9uczsgcy0+bmFtZTsgcysrKQ0KPiA+ICsgICAgICAgaWd0X3N1YnRl
c3RfZigicHJvYmUtZmFpbC1ndWMtJXMiLCBzLT5uYW1lKSB7DQo+ID4gKyAgICAgICAgICAgbWVt
Y3B5KCZmYXVsdF9wYXJhbXMsICZkZWZhdWx0X2ZhdWx0X3BhcmFtcywNCj4gPiArICAgICAgICAg
ICAgICAgICAgIHNpemVvZihzdHJ1Y3QgZmF1bHRfaW5qZWN0aW9uX3BhcmFtcykpOw0KPiA+ICsg
ICAgICAgICAgIHByb2JlX2ZhaWxfZ3VjKGZkLCBwY2lfc2xvdCwgcy0+bmFtZSwgJmZhdWx0X3Bh
cmFtcyk7DQo+ID4gKyAgICAgICB9DQo+ID4gKw0KPiA+ICAgCWlndF9maXh0dXJlIHsNCj4gPiAg
IAkJY2xvc2Uoc3lzZnMpOw0KPiA+ICAgCQlkcm1fY2xvc2VfZHJpdmVyKGZkKTsNCg==
