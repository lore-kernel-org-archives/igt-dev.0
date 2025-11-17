Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E153CCE8D6B
	for <igt-dev@archiver.kernel.org>; Mon, 17 Nov 2025 23:34:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C7410E1DC;
	Mon, 17 Nov 2025 23:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lXqKkzLH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD3310E1DC
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Nov 2025 23:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763422493; x=1794958493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tiEA8c/13JEJ2m3/8dtfdlmzCO/wIKckoBtC9LK3a4k=;
 b=lXqKkzLHYu1nRuiqoyLdV+XyI0M4u2JyT34Q0TYSzYrMZz8NZsEr1OjU
 6894EFPsEyX5vjA+pXvO5wgb7dU/WLVmNyvq7RJ4h6gjfBawpEdpmO+7T
 unqdoYGPUvKvLXDpXZAtPtThkrLaPTX+tlIvtGeokh6NvhnQqoN3t/OTF
 sLap38MK8cwxFGxptwrSaaFq1C53Ugm+dHXwbyyRN8eRTQCqmlJy7OVeh
 vTsjCety8XzgnhUKi3nU+83hHpld1ok1uDznmtpk3gn+ShKy512+LsyIr
 ZET+n/qv5myY0iHxfEE0gEJDK3BaM6wCTrwV48Zp+Rvz7c0GGmbLpZE7X g==;
X-CSE-ConnectionGUID: XLDDMHERRrylXbZ8MfsW9Q==
X-CSE-MsgGUID: 3ZfCTiGLRVi/tqM2hykaCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76112255"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="76112255"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:34:52 -0800
X-CSE-ConnectionGUID: UnJ0BH+4TDaVVqz0hlHlRw==
X-CSE-MsgGUID: f5gXIPxFSWGA7AC5DxzZjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; d="scan'208";a="190741884"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 15:34:53 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 15:34:52 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 15:34:52 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 15:34:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbV1W3fa7o1QJoLvCswAxiTbN+Q/uNoX1i6oP8CLvcPu3dtxUiVUlJ0MZ8OoV171+kJarVxByKWUcZ4xyjimq8505cwf/eVjROv0VzzKI+pvvtBIKpD6LAg1T7sYzD7oqFDw6yMOPBv1hLGgTZhAdZ/fVaelwqZyAd3DGqvZxwMV613F+7QJWhv8DmF3BZPRqqNBxNImhKobWXRq1AdSso1dD7bhawcgo7KMFnXHV9EXwD8IyNn+ks/Td4c3J7NSlvH3i2l6wm9D1fyOP6lLJUylpOpjRat7a1T25oDviYJPDUUzLEy/sfTh1L7lS6eXYuOkh2kpPqN+s0yDIhZVrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ct4ww2drB9kMhROTi02nVgpfWWDC9T53RiwoeIFIYcA=;
 b=uas/7x6t2TNw5JqwOoMqsoHjoGkBHdhr+m7+qTAK3/ONJzXf2vW3gpWRNhaMsFSxDZLtVnTH24n+opHulne1EOqIdpQm0jOEl8AuzNeWG+yXS47NSij9hHC0TNaV++ELVfDmexemZyoh4upkNGhVPDumMcbIe+Yj41waDGnFzp+z42gPKj1s9oUXU3YOQTMXdsM/jotaSXXLPNJBhNav45OgelQXE7qo647HxuZ5ir3zbHnF/vca4Mi/uEJCus4VaYmKZVegOAyXCYaGeqePW0tKu6SIfuTQzsB5clQVH7UanP67VwyDkDKTK812jpk5VWwPN2t+uoGs3mAmFK3FIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS4PPFE70B31BEF.namprd11.prod.outlook.com (2603:10b6:f:fc02::5a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Mon, 17 Nov
 2025 23:34:49 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9320.018; Mon, 17 Nov 2025
 23:34:46 +0000
Message-ID: <cdf236c4-600a-4a02-86c5-e301651dfa19@intel.com>
Date: Mon, 17 Nov 2025 15:34:45 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [v14 i-g-t 2/2] tests/intel/i915_pm_rps: Extend Multi-GT support
 to waitboost and reset tests
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>
References: <20251117052506.578422-4-mallesh.koujalagi@intel.com>
 <20251117052506.578422-6-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20251117052506.578422-6-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR10CA0022.namprd10.prod.outlook.com
 (2603:10b6:a03:255::27) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS4PPFE70B31BEF:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e7eb9cd-2d65-4b5c-a839-08de2631e43c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFNpUCtlN05pMWl2aXB2YlErV3RVZ09rZE1INEJXSHpySksxbnlNbHQwTkw2?=
 =?utf-8?B?Qk5kaTRNTVg5NWVobGxEekJZTzlPeU04MU9jWlJBS1NuUGgwTm0zS2tDV3Ji?=
 =?utf-8?B?Z3laaWRFRU50d3FrRS9XTXYxZHRQZHJuRXlMUGdTYjZsb1AwUjZHVVdScllM?=
 =?utf-8?B?N1Y3dzZXSUtPMU5tZWdZbTBXcC91eUhtTHVDSGhlVGIvK216V0s5QXp6YVdr?=
 =?utf-8?B?b2w1WndTbFNoeDBtWkRzTXk4bE9taCt2Smw4bDhyMWtjbUdJSmhRUzVhZU4z?=
 =?utf-8?B?OFI1YittWDhjQmcxVHlITkZMWndCcU4xbGh1bDJad2l0alVHcVd3VEFaNVRw?=
 =?utf-8?B?UmtBUnV1aVVna2pOSzhzN2VMWVp4UFVIQUlBNnFtVTNobmtMY2ZXNU1YblE2?=
 =?utf-8?B?eW1JdVR6TEVhM1hiY3lCMkhmWjJweTd4Tlh5L0JPcUtieGlPOVI5NDMxRE9t?=
 =?utf-8?B?ZlNFNW9EZlUrOEhSbCtOUHRmSW1YT2gwbnJNY3hzNm8vSGkrd0Y1cklBakNQ?=
 =?utf-8?B?eXIybWd3MUpvL3FyNmFDZlJ4UkVGVFBpWnptNTFjRkYwS2FZN0dlYVdqVkZW?=
 =?utf-8?B?V2t6S3V1UW4vUmZXc0xuSkZBNmxtUVo2RDVxSW1tclZteUZwZWRGMmxxMjR6?=
 =?utf-8?B?N1lZanJ4bjFtSHdjWVNEZ3hxZC9BaUsySVpNdFR4b1lvVnRTSUZYRGhHWmRx?=
 =?utf-8?B?Slg2RXVXenNKdG1tVVlIclZuWFgwUVgxRGErYjY5djlsTmpxMHR5anpPSkRY?=
 =?utf-8?B?U0NpQnFlMU4xU1hNUVhmRzhvbzRKNWlaUWxUREpRVUYrQjc5MWpjazl4eEZX?=
 =?utf-8?B?Mk95Q0ZOZUlMQWVnUHhtc3ZPS3czRHRUZ1hWRzQyNVpVU29tUGl6YXgrWUM4?=
 =?utf-8?B?enJzL1VIemxvSWtjOENjRTVsZ3p5c2h4b00rZDZJNE44M3BpYVhqdzB2WlV4?=
 =?utf-8?B?eG5KNUVFTWFlNFh1K1dCN3F1eHBkYUlIRGdmTlJSNmxNTy9yMEVQY0NJSkxn?=
 =?utf-8?B?ZFJVSGpTbjBMUlVnU3ZYTmM0dDdLWWxTZ1BHYmdYdDRBV3pCMEwxQlp4Zzkv?=
 =?utf-8?B?SFhiRDJtWHVqNUFGYXRZM3FEMDhwbitnaHRLUkszcXV4Wlo1di9XOENDakhL?=
 =?utf-8?B?UGFaR2ZQSlF2TEZDTUtVWUV1U0VrQUZIYUc0N0Y3dlNBYnZHeWNTc3Rpa1V4?=
 =?utf-8?B?V2ZlOUkrQlJWNHlGS25nc21zTjI2WmhFVU1aaytNV0VtMy9scTkvUmIyRzNt?=
 =?utf-8?B?cHo1RFNrS3F4ZkZrdnhKSXBYdVZrbFNaWWdDV3JVM3FhVnc0U1crR3ZTRjVt?=
 =?utf-8?B?VkI5ZlFyZGtoZEpPc0k0elA4RjBaWTBJV1NlYlpmK0cwQ0tFc3JqdWtuTTJ1?=
 =?utf-8?B?RjlQaXJHdGkvUUdoUUs3ZUtZRG81WDdhcGw3QnJaaUMxNytPa3J1WDdiaGwr?=
 =?utf-8?B?RmdVTHNxNXkzUGdvb3B6VTJvS3N1eG8zSWxPcG5XZDI0aXBZM0NvTGIzYkV6?=
 =?utf-8?B?UTJYRTliZ1JTdkE5aDFrWXJRSDlSNllPaGQzdmw0c0RvZmZwaDErbDUzNWFv?=
 =?utf-8?B?eGNxK2JveFp2TDhsS3BCOW9BWjBxYjBlUVpETVhpSm91S2tBWHZadVhpMlpp?=
 =?utf-8?B?Zjg4SFNNNGRWRVcvVG9tT1hMVkdFQ2FwQUc4SFdWekhPUDRtbmw5N29yNEx5?=
 =?utf-8?B?b3B4V0ZOcEtvd1Q0c0d3SUhDcVRrQ0tZZkZ2dktMYS9Najg1b3pmUnBOQ3Jt?=
 =?utf-8?B?VHgvVUtTSWtvU3VOcTdYcFpIa0g5UXMvRlpHVWRoTDcza1FEcmNjN1hsN2dK?=
 =?utf-8?B?d25PQ0dFbEtEcnpjblc3RjdnaDlUMGxMVVhYK1k4SUw0a01EWG4yY0ttZjNv?=
 =?utf-8?B?d2ZhdHZIOUZlSXMzTjV1dHNRc0ZaNmt4VFh4NDlOTVI3Wm1GWGwrZ0RsZG1u?=
 =?utf-8?Q?PPYSqnZ3LvTXd4tXLIpJSQaO2zfNHKWt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eDlYL0l6dDlIdmFhcVNJeWVuVVFNRkZSQUg0a1BDOTd6clY2dlRkRDVncFJY?=
 =?utf-8?B?NVlNeENPbjVqK0l2TjFReHhhUmRqSnYzVjRJZEV5RXRWUmt1dFY3bnRmRW9N?=
 =?utf-8?B?Z2JMMnkxanRDb25MYVRMRnhLYnkyb1RnMk4wRTVlN2JvZXk0K2lvSHdJcGpM?=
 =?utf-8?B?a09kcVJ0Q2MxK3R0RFN3aUxxTCtJY2hXR3ppTDFXOWFoY00wWjQ2bkdnaHFD?=
 =?utf-8?B?N0dMd0V4M3ErektqOFJLYWJMRXliWDgrNzJOVkg5NGRLRlVDQjN1ZkJTN1JY?=
 =?utf-8?B?NWRpVHJOaUtjOVBzSU43aEk5VjlmL3NQbnhJNlFZZFdHVzJwTFJJVlRLbVFl?=
 =?utf-8?B?ZkZIcEMzTnJpV29EZkJ4a2pKUmE0YU41V2w3V1dZV2dwdVNsQVp4bFJVVzly?=
 =?utf-8?B?aEJhY1JvYUtxbmt0UzRrN1lVYkpyZjhBMlFJQUF4SWdmTklzN2FoZ2FObE9p?=
 =?utf-8?B?QmljYlVydyt4U0hpQ3NXbTlDWGlTYzhKb0Y4SUdpYm9CYmo0TXJoMDBDMEt1?=
 =?utf-8?B?bUJwSlBreVB1RVkvTk1yMnZ4RkN1Zy9zb1lHcWVHNzJ6ZG1odjlwK0VZNzNn?=
 =?utf-8?B?SjZjaDRBU21xWGFvbXNYQnh3Q2lPWmZrVXZJUXdGZTg4Slh4M2pDS1A0TUNt?=
 =?utf-8?B?aWUzN1libUxRZHJWNXBlRjlCWEt2c0xhWVJ0RysrdVFWTitmNEhTc2c1aUFU?=
 =?utf-8?B?VVJCdVUxNGxiWGx0WVpTMlZqTmJ2Y2RaUWhjSVlnRmJjdEE0dzFBYmlZZVIz?=
 =?utf-8?B?a3hzOUVXM3FZL2tEdU4wVWgwcVRQakRwSGF4d0NnWGlrSXhRRjVNbk5ORjN0?=
 =?utf-8?B?WFU4WUVFaDkzZmlxaFZ0SXpYcGhIMzZnT2cyVlZLL0xIdGlpVmZoY29aL1dr?=
 =?utf-8?B?MFVBY2JCMUx2a3ZSR2tVQzFXWnQrUXErRTcweU1NRWw5dG41V2Npb2txaHlO?=
 =?utf-8?B?L1pOTFZTdU5md2FnNkM2cE1kS1daT241NDlrelMxeXI1blRYU24vNE9pMWZT?=
 =?utf-8?B?dXNTbUdpY0dBOXVhQytROTcyK2JjUjREVVBGNFhiZUVsRDlMRFN1VGhoZENw?=
 =?utf-8?B?VFFQTXBoeGViY1VPRzV5TmpQdzVTVFB6d2J0NVZxOWtQbGRhOVhqTDY1bFFC?=
 =?utf-8?B?aGRyUHpOZzduenlzbWMyREVXdDhSVW5JVy9ydVZUTjdQZ1dxbVNrblJtaGhl?=
 =?utf-8?B?Y0o3TkxaVk5PR0dBWVo3anJjeDlQL0YwbFNaMDBidUF0aVRFN2pMMEZ3WjFI?=
 =?utf-8?B?NE1NUnhqOWg2N3VmbXVwaVdpbXlFT0IyWVVvazJkNUNJa25IOFhPTEFKakRR?=
 =?utf-8?B?TUhvK0lDMkpaSVpCNkVxeS8yMysxaFdjT3FQaHJJZFhjL1V5bXJxRXVLL3V5?=
 =?utf-8?B?QW9GckMyYzhWc2I1WFFMUDY0RFlheWVKNVRYdk1idTVHQm5PWWJiK1J2aHVC?=
 =?utf-8?B?NStEQUl1OWNwRERXV25wTXJlMkdldXE5aGhJenlGZGRSWGVVSnM5Q3RrR25x?=
 =?utf-8?B?RWNXaFZmODI1Y1JQeGw4bE5qVUwxL3pONWZHS1E1aHpEN2MvbkZWc0w3ZHhp?=
 =?utf-8?B?STZQc2V1VnY4ZjgrOHBjQUY5TFlxTDBndkQxNmo1Um16WUtFRDZhMzhoUUNs?=
 =?utf-8?B?UDhJWFFhSFgra1JkbHV3Vk1ONEd4a2NhaENmdnQ4SStQNWZ2TzlPVm9IL2hy?=
 =?utf-8?B?cXBqYm1XcHBjRE9uRTlLSlVETHVPTWJtbEFVTGxIRGYwT09KS215L0RDd0cx?=
 =?utf-8?B?TXEycnJuVWMyK0VDV0MwOVJCbVVZMzF1emNOeTNDSVF1NWtXRk5pdkQwVk1P?=
 =?utf-8?B?Tzd6Z3dwSERkRUdtZkhZZWlKOU5vN3dlVVFwamhSclpUYmg2WDRxeTZUaGVm?=
 =?utf-8?B?TlFiQ3VZRWs1L05XYm0yTFhHVjhzTzZ2OWFSNjVPMnhYcmdLbTNJMHhKV3J6?=
 =?utf-8?B?Qy9EbS93VHFBWkpXVEdaQzJWYkJiMnd6dDg3Q25BUDlkbFZtMktGUkk2OXk3?=
 =?utf-8?B?U2lmNVJJb1prUzJ2SVp6N1RaYlR5WnRDYndJRzVSRjFUa3krdW5QZFNud2ls?=
 =?utf-8?B?K3l6QXhGS1FvL25SVjZ6T2ZuVTZjendaN0theWJNc2xGSHU2VisvQkgyejFV?=
 =?utf-8?B?Wll2TEVBN2FWQUFFOVpNNStWLzRFbU9UKzBkYm4yMng4dUN5V0dyOEFvUDM2?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e7eb9cd-2d65-4b5c-a839-08de2631e43c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 23:34:45.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GJS7hc7syfDw6aEx/DJXvCf6JPSd99tfrQ8JuUI//HRUWe1WTZLlkxULi0omBjFB7dygLu4PQB2O6fwRAyS2VTlTr2LzHC33oRdl8wQyopM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE70B31BEF
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


On 11/16/2025 9:25 PM, Mallesh Koujalagi wrote:
> Builds upon the Multi-GT infrastructure to extend support for RPS test
> scenarios including waitboost functionality and reset recovery testing
> across Multi-GT.
>
> This patch enhances the multi-GT test framework by:
>
> - Adding Multi-GT support for waitboost functionality validation
> - Extending reset test case to ensure compatibility with multi-GT setups
>
> Waitboost and reset test cases validate that GPU frequency boosting and
> reset recovery mechanism work correctly across Multi-GT configuration.
>
> v11: Remove expected_val variable. (Vinay)
>     - The restore_sysfs_on_each_gt function required for waitboost
>       and reset test cases only.
>
> v12: Use Single spinner in boost_freq function. (Vinay)
>
> v13: Add the 4 spinners back since freq was not ramping.
>
> v14: Revert igt_spin_free function. (Vinay).
>     - Add GT-specific context binding to properly trigger
>       waitboost mechanism in multi-GT scenarios.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 61 +++++++++++++++++++++++++++++++++++----
>   1 file changed, 55 insertions(+), 6 deletions(-)
>
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index 9a1af20c9..359776a6d 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -629,17 +629,58 @@ static void stabilize_check(int *out, int gt_id)
>   	igt_debug("Waited %d msec to stabilize cur\n", wait);
>   }
>   
> +static void verify_sysfs_values(int gt)
> +{
> +	int current_val;
> +
> +	/* Verify MIN frequency */
> +	current_val = readval(sysfs_files[gt][MIN].filp);
> +	if (current_val != origfreqs[gt][MIN]) {
> +		igt_warn("GT%d MIN freq verification failed: expected %d, got %d\n",
> +			 gt, origfreqs[gt][MIN], current_val);
> +	}
> +
> +	/* Verify MAX frequency */
> +	current_val = readval(sysfs_files[gt][MAX].filp);
> +	if (current_val != origfreqs[gt][MAX]) {
> +		igt_warn("GT%d MAX freq verification failed: expected %d, got %d\n",
> +			 gt, origfreqs[gt][MAX], current_val);
> +	}
> +
> +	/* Verify BOOST frequency */
> +	current_val = readval(sysfs_files[gt][BOOST].filp);
> +	if (current_val != origfreqs[gt][BOOST]) {
> +		igt_warn("GT%d BOOST freq verification failed: expected %d, got %d\n",
> +			 gt, origfreqs[gt][BOOST], current_val);
> +	}
> +}
> +
> +static void restore_sysfs_on_each_gt(void)
> +{
> +	int tmp, gt;
> +
> +	i915_for_each_gt(drm_fd, tmp, gt) {
> +		writeval(sysfs_files[gt][MIN].filp, origfreqs[gt][MIN], gt);
> +		writeval(sysfs_files[gt][MAX].filp, origfreqs[gt][MAX], gt);
> +		writeval(sysfs_files[gt][BOOST].filp, origfreqs[gt][BOOST], gt);
> +		verify_sysfs_values(gt);
> +	}
> +}
> +
>   static void boost_freq(int fd, int *boost_freqs, int gt_id)
>   {
> +	const intel_ctx_t *ctx;
>   	int64_t timeout = 1;
>   	igt_spin_t *load;
> -	/* We need to keep dependency spin offset for load->handle */
> -	uint64_t ahnd = get_simple_l2h_ahnd(fd, 0);
> +	uint64_t ahnd;
> +
> +	ctx = intel_ctx_create_for_gt(fd, gt_id);
> +	ahnd = get_reloc_ahnd(fd, ctx->id);
>   
> -	load = igt_spin_new(fd, .ahnd = ahnd);
> +	load = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx);
>   
>   	/* Strip off extra fences from the object, and keep it from starting */
> -	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .dependency = load->handle));
> +	igt_spin_free(fd, igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .dependency = load->handle));
>   
>   	/* Waiting will grant us a boost to maximum */
>   	gem_wait(fd, load->handle, &timeout);
> @@ -652,6 +693,7 @@ static void boost_freq(int fd, int *boost_freqs, int gt_id)
>   	gem_sync(fd, load->handle);
>   	igt_spin_free(fd, load);
>   	put_ahnd(ahnd);
> +	intel_ctx_destroy(fd, ctx);
>   }
>   
>   static void waitboost(int fd, bool reset, int gt_id)
> @@ -696,9 +738,9 @@ static void waitboost(int fd, bool reset, int gt_id)
>   	load_helper_stop();
>   	idle_check(gt_id);
>   
> -	igt_assert_lt(pre_freqs[CUR], pre_freqs[MAX]);
> +	igt_assert_lte(pre_freqs[CUR], pre_freqs[MAX]);
>   	igt_assert_eq(boost_freqs[CUR], boost_freqs[BOOST]);
> -	igt_assert_lt(post_freqs[CUR], post_freqs[MAX]);
> +	igt_assert_lte(post_freqs[CUR], post_freqs[MAX]);
>   }
>   
>   static uint32_t batch_create(int i915, uint64_t sz)
> @@ -1208,7 +1250,10 @@ igt_main
>   
>   	/* Checks if we achieve boost using gem_wait */
>   	igt_subtest("waitboost") {
> +		restore_sysfs_on_each_gt();
> +		sleep(1);
>   		i915_for_each_gt(drm_fd, tmp, gt) {
> +			igt_info("gt%u\n", gt);
>   			waitboost(drm_fd, false, gt);
>   		}
>   	}
> @@ -1226,8 +1271,12 @@ igt_main
>   	/* Test boost frequency after GPU reset */
>   	igt_subtest("reset") {
>   		igt_hang_t hang;
> +
> +		restore_sysfs_on_each_gt();
> +		sleep(1);
>   		hang = igt_allow_hang(drm_fd, 0, 0);
>   		i915_for_each_gt(drm_fd, tmp, gt) {
> +			igt_info("gt%u\n", gt);
>   			waitboost(drm_fd, true, gt);
>   		}
>   		igt_disallow_hang(drm_fd, hang);
