Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE5ECA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 21:07:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC9C10EAE5;
	Thu,  4 Sep 2025 21:07:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/3aKj/i";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24E7010EAE5
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 21:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757020066; x=1788556066;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/IIl4sUHL4B7vzie3aG6LhxqlTqvcx2rp8i7DjC/3J4=;
 b=W/3aKj/iGJmNgSpDXCJhh+kkNU7xBhEDbBFYTWE84VuSG8VYL00yezOQ
 Xe6IUmmLpo+Ur+k14p+6++4kM175O/IuGVdiXl7PGqqXD2Qq4Td20JC4v
 ljydai+fP4opaOqKOfK6w1rnWhBmctYk5AAgkP0b1xY6aHig6HD0z+jFM
 yLgMBIKK1M5jXRWFEKGr9OpWKlDCSSuP9xyMZW/NtZx5Ua4qERgh4DtVE
 n/8eix/3ac9CAZ7LFnnBAxa4Scng7Lqv9bT51whkKTmBWnnhaACTB/IGp
 CG3W3uRJlFJMiJCI6OSZDlB0+H7p/GIEneEugqlumQoy5VWEy6Z9kpQZi Q==;
X-CSE-ConnectionGUID: //jSbhFhTiqjxRZBlhHWlQ==
X-CSE-MsgGUID: 07Bhedb4T8ipcuIelJCV5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="76980099"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="76980099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:07:45 -0700
X-CSE-ConnectionGUID: cVNJrR2VSt68yy2nUYGhNQ==
X-CSE-MsgGUID: 7X8G4I40QqaeOQwNAR01nQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="171285384"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 14:07:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:07:43 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 14:07:43 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.76)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 14:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RJXcEXSu8Ou9/qyoy/IpBuwXrwLcKN5Qcu3YXoZyZ69bKQuluGJdBT61RVnf8LWqw4wg4JSr1aOvAx3sIAhR/aKVX9m4BJnJU/D/q2PbDzz5qPI41Y3qilP9iLBRa+wcyrNOtVx/xiaZEUBwo3dw8OJjuuUqPNx1GvHHI7a5xdIlgUmZtUZGule8ko2AOu+JZ95jyVnmcFDHhz/RqaOIgAMwLBM3ypmwe+/HG7iAx4GFFpOkRtJIpBBHlN/2i41ENPYxboPukD6Hs3j5FOKQrOvgIvteNwU0ChGpdSdxkAVzQwS827DzIFwgGmd4P1uyqT+pOjHilKmT8faHcmZUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZedQY4fwqB6dX7PvPLZhk9aiIX0TqY+andtsP0bdnc=;
 b=YilzXQ83aF2T0ypnkEwhnU0OFmI8/GraLSB3zpbhj6xUxKEM9qhZYfFrI+ACI0E0gaQUJx6wImiSReWJ/LMeuQFUjZz747kDpBgrQMh5M7tpevJO/xQCGFIhD31X8C+ae8JEsE6WTbkVR3VHsKlTbT5C+whbDn7bXw3FSNtMHnD4NxuAKwsvItHx3Ca/k3hGeveOsYAs3CmBv3PGS+pIYOURboI8/HgVrJhKCe41+7OLqWWeaT4KIMuv3YLYgwJzw/P6+jJ4BBe6hJTh2ej4dyhnkoNlcKpIStDOmQ3hvQapFuLfHiWPIX4obYmcWWAAErldRIV2KBXiWGgGYJp/qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 by DM3PPF7C7D8332C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Thu, 4 Sep
 2025 21:07:41 +0000
Received: from CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2]) by CY5PR11MB6391.namprd11.prod.outlook.com
 ([fe80::d1d5:6fa6:9a2d:92e2%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 21:07:41 +0000
Message-ID: <3e67789f-ba94-4778-b83f-b27261180f17@intel.com>
Date: Thu, 4 Sep 2025 14:07:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/xe_fault_injection: Add test for
 xe_pxp_exec_queue_add
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250819005622.2970399-3-daniele.ceraolospurio@intel.com>
 <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250819005622.2970399-4-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0141.namprd04.prod.outlook.com
 (2603:10b6:303:84::26) To CY5PR11MB6391.namprd11.prod.outlook.com
 (2603:10b6:930:38::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6391:EE_|DM3PPF7C7D8332C:EE_
X-MS-Office365-Filtering-Correlation-Id: bba87d8a-462d-476e-b127-08ddebf715c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDZEYU83Z09pZHdPTjRPU0ZCdEZZMTdUNmEyQkFrNm45cnVRWkN1K1VnSEhi?=
 =?utf-8?B?RTZ2SE5OOE1UemlzbE1QVzcxT1FQOGxzQ0FZeDB4cXN5VTNVWWNxS21FU1Rt?=
 =?utf-8?B?SUZuMTZzUFplNDhVTzZOTlBvNmtDMEM1bm5QQmxDMzA1ZmF0WE0wRWh3SENz?=
 =?utf-8?B?QTNpTmJvTlNTeXNvbWUyTDdkZkdEQ05Lb052TGVGcUFsZnkzL3JxNGJ2akxx?=
 =?utf-8?B?ZGE1UW0vQkdqeUdIbGhpa1B4TGM3MkpvMnl1clQwT05FamFoVytPTDF0VmFo?=
 =?utf-8?B?WGk5RTNVaXRVUTF0MlRnMGJmeVg4TkljYWswSzI3VXozMFRiNVVTTmJ6L1kz?=
 =?utf-8?B?UE1SUUVyRnJ1Mmd2S1puVTFmaS93QkhERkFiTjNhZmxpK2s0QWpraWVSMldl?=
 =?utf-8?B?Z3ppZHRndnpEVjJISzF2eVlSblFzc3lJZDR6Z1YrbnEzak1zdnNPRTNNVHBh?=
 =?utf-8?B?YitTZHF4WXlSK3ZoUlFrcUs0QVlDNTlsOG1zaXlNSFBsVllYMXg1eXNydWJs?=
 =?utf-8?B?Nytoei9mMUZtenY5OTZWb1RJNmgxVVNXWURvQUNQdmRWUERlTTJJRnRSbk0w?=
 =?utf-8?B?T2JXSFZIckM1TmRzb0M1WEliYTNmMXZPOWxuYzBES0UxRlVnQmhPa2EwUXNq?=
 =?utf-8?B?S2FJZ2RQdlJ0TjM1dEtnM3JuMWQ2WjlHUTRrRnpNZG83VmRWTWRLTWpnT3JD?=
 =?utf-8?B?K3VidXk1OW9nTnJJRkg1NDIwc0JZTU9jK0VyVU1BL0hyT24vbmIrajB1Vmpn?=
 =?utf-8?B?MWVIajZEYjVBOGNnOEVVdFErN1l4RjVzcU0yOGxmT3VLRUJJam1QcUlkQ0V1?=
 =?utf-8?B?NGNtVWRZQXIyWU9pVEdRdFVyR28vRkVuRVlMK2UwS0MyMUdSOHZVSE1hdkFO?=
 =?utf-8?B?YlpPbDZvajNZQ1QvWXd5aWI4TFoyRDZFcmVzNXhoblEyL0ZmOVJwOXg2Ny9Q?=
 =?utf-8?B?bmlyOU5MTjljRXloM05sekxPL2xMcGxDRk9qQ3BkTzEwYnY4QXJVMWlTbDJC?=
 =?utf-8?B?U20xU1ZjWnUzbU5seG5KZjJYaFd5SXpPRVhObmR4c2ZGVmo4ZDR6eDVsWWph?=
 =?utf-8?B?bkxtNU1zWis5KytaQzZWclJTTGwzMyt1Z1A0MkJOTFE4bStkdnJEYmZ6T0s4?=
 =?utf-8?B?RytYMzdtMEowTm5IVUpTVndtTW1VOFk2dkV0Y3JKdTJhUXlRWDFONWEzWlZn?=
 =?utf-8?B?bjRzNHdnNlF1UzA1aDdNWktJOVBSNzZzNFpndzJ1TjRvUElQTzUyQ2tFM1E2?=
 =?utf-8?B?b1RkREZJMmdIQTN6Q0ZWOThwdm52ZlR4VjcyekFWYlBBM2loUW04RCtwSGVH?=
 =?utf-8?B?WHFZUmxZajVKK3pROVRMcnpjeWhBV0NDc09BM1Z1Z0RQcFc5Unl2eC92cGlF?=
 =?utf-8?B?N25pNmF4cC9rTDlQeWYvV09JY2h0d29va0c2eTRiYUk4cHRTZkdvaVlIaG5G?=
 =?utf-8?B?dXlnWW5GRHFTTzV3OWU0YTRGVTBpUVoybFhWTXIxVG5NYjEzWlhsNjQxM0tZ?=
 =?utf-8?B?SGdhZHFUUVdGOWdWdGJacDRkV3JSMHdsMlFLSlBqT1lGMlRGMStBbDdvNC9Z?=
 =?utf-8?B?RkxsVEpkYzJicGthQWM0c0NzaXRXZ3pEeEdnd2x4MUhPdEdBanN4SVNQSVhZ?=
 =?utf-8?B?YzVrUHdPekx0ampRVFpPRkNvOHYyTU4vajgranFHYy9tOEkzZkN0WFRoK3Zr?=
 =?utf-8?B?YjduRlloc1lJMkdxbnMvVUdWSmkwZVRNR2oweHdJcmxxeG1MdU9pVlVPVXcx?=
 =?utf-8?B?dTVzQ0FEQVdNRFpZT1I1ZVFtQ3NNYVZyZkpuQUI1Y0dpNWZVREIzSnRIc2l1?=
 =?utf-8?Q?M0Pdxwsut7PcWMet3ETatLE0h0jlMBIKLPDyU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6391.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhxcUs0dHlhRlJ0OVN1MitkNE1rN1dJbkVwM2NhTXNVUXR1Rms3c09yUlhn?=
 =?utf-8?B?NjZ5V2V4dFVMQTd3dDJrSGwyYmkrdGc3c1hJTDFlcHZOenZNMlkwK1psRExC?=
 =?utf-8?B?R1RlWUlDNnlGQmpFN1Z3aWtKZEtEcnFCaHdpNDNBWjN0MWpDa0dwc2VuRTIz?=
 =?utf-8?B?dzhNQkIxUGVobGc5ZnRaa3pvdFM2cytDY1poSEZQV3hybWoyTS9mVTBUbkxz?=
 =?utf-8?B?TXh4OTBYNS9LbE95VlBES2dKM0hFc1FxdlFnOFVsbU1xRWNQQ01jbUFvcHJI?=
 =?utf-8?B?MUdrNmlYNHZHY0hhdk05dC83SVNaS2lnVXlkK25LblRkMUFVcXBOQWtuSHQv?=
 =?utf-8?B?WC9VekVoQWhBMG91UnRiemk2Y1F4ajZOY3ByVmVrNkFOL0dyUExBcUVZZGFB?=
 =?utf-8?B?c2ovdWRzcWpTWWtLSWN1elFEK3ppbGlCVEphTDdFUlRpTU81RlNrLzhVZEhJ?=
 =?utf-8?B?ZEZCT0ZVZzRLR21xWk11UlNBaDU0N2NubUxFd2hvUnF0eTdsYlY1NERvSzNG?=
 =?utf-8?B?UHFxZDFveVpsSWxucFozOXhpSGdIUGVqd1pCRHlWcjFGcG0yQ2JDY0lBaW9O?=
 =?utf-8?B?dTdaUG05cG9jazFodXBuWTRjUXNWMG5kd1ZUUlRPN1N3ZHVmMkxuaUtnNW5w?=
 =?utf-8?B?R29HTThDbnNHMm1KdDliclN6M2I0R0xaaVlTU1Jnd0szOVdpazZzYW1meGF4?=
 =?utf-8?B?NmN2UnJmSzIyR0ZDZVRHQTBqQXI1TGhoS1FGZUtNZkNURVVhTWFXZ0duZXMw?=
 =?utf-8?B?bmlZNTNIaW84bHF6eSsxR1hCOFZLSTVTNE5tcytuNkYyUHhlWDRHRXRxQk5h?=
 =?utf-8?B?ZzhuUHVUbUFKdW9yT1Nsd1lUckRUa0dTOFpMbTE2Nm1rdFNEMEtvclhoMm45?=
 =?utf-8?B?cU1vZDZpZWlwTVZ0QjllRFozb0tRT1JHSTVBQWdsVFA1WlI1bGVydHNSNjNF?=
 =?utf-8?B?aFR0U0pKYUU0NUl0WVJVMXc5N0tsK0M3OStRUFN3VFo5YmpLS3pKOEU2VEFC?=
 =?utf-8?B?WEU0cTd3RWppYmRadzQ0eU8zV0w3S1oveU9aK1EwQ216YmRPSk5zTzNJWUlS?=
 =?utf-8?B?VlRIaDJleUZIUFdvRjhZaDZ0SnFBdS8vdXpnbktzT0NWMjdQOG4ydVFwUHFJ?=
 =?utf-8?B?b0NZczE3ZEdaU0VkOTlaOTZNazBlSURzSXdTRTltbUxCZG1mWWNPRTk2Wldj?=
 =?utf-8?B?L0FwaUVrM0J6ZkpOQ3lYZUNlZlprRjRjdFQ1YnZXNlRhZy9MSFY3RmVVNWla?=
 =?utf-8?B?SjNIeTJFNHRQbGQzenE2elo4N1J0eVhqTktUUXU0UGExTEhxYWN3K1VMSlRn?=
 =?utf-8?B?N0QrM3BzL0pQN25TTlViZ2pKWTlpZDhsRDJLTTJLNysybmF1OUMzTjkzYU41?=
 =?utf-8?B?TlJwdFJMdllxa01CclRaR21wZkF6WHZINTI2dENTN2RlRzJ3dEFhY2ZHcTJV?=
 =?utf-8?B?R0FEQUx4VzBjb053eTlIamVNZkJuZFZ4bnRsTFhQRkdPWE5qQ0ZFbHZnWUl5?=
 =?utf-8?B?UWpUaWF2dTkzNFdyVm9PRTllRlMrL0JlcGRmRVE5UUdnQzNsbUFSN0NqcVhH?=
 =?utf-8?B?TzB3TXpHRE5KWThYNTZITHZ3TmpDT3VIc3h2Q3JSNUpmN2tQY0g3OVlFaUov?=
 =?utf-8?B?eDRVRm1uVkdQZG1zaE5HQ2h0VFcyNEZkTklXRlBBUXJTNTl4a21wcDVqV2RQ?=
 =?utf-8?B?UXBtTWkwYnlvZG9qMnp2ajN5aWJPbFYrUkpMZDNJTlpOYWZjcXo1eXBldFNm?=
 =?utf-8?B?dWEyZXFxM2s3T2VOeDJ1Qkg3cnZ2OWtFUUg5dVBJQjFxMDQ5T3lOd1c1dmhP?=
 =?utf-8?B?WnR0ZDBrVmxybFNhZXo5U21NZ2ZSaDQzbEdDUkZtTTRncENkR3lEVS94WmNS?=
 =?utf-8?B?RW5jbkwvdTJRUFVzNFE4OVMxUmN4ZEx6WjNNd1VUdmpEQUtLb21vQU5TOFhw?=
 =?utf-8?B?NE5hRmdkOTErVzlEWWExWTRuNm9BZnNwcVBjNEpKVTV5eGdQTmU5SERxSkFr?=
 =?utf-8?B?UGRUaEJ6bEowUW9hdXpYbnZQaHJKNjNxWlV6VTZLcWU1aXZmTkNDYjZ4NEQw?=
 =?utf-8?B?ODVSSUpIK2pLcmNBdEpzOUNOQlVXbnRwVzZPZHZzRE50Vy8wSGUrMnNscEdB?=
 =?utf-8?B?TkpCc2dqYUwxaEcvYVFFV3Y2czZhNVo3SDkveVlzWTlibmxvUjgvZnNKbWUv?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bba87d8a-462d-476e-b127-08ddebf715c9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6391.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 21:07:41.2876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RjAuBByLgrBzd2akb6yEHEciPOSEvhZ78VgEMyUq6N6y4k0CMux9oBN2bIUJ9/FWz1CcGpN5BkqO6RlbJ+w//Kxh8/qlebmH19MfK0PvTDI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7C7D8332C
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

On 8/18/2025 5:56 PM, Daniele Ceraolo Spurio wrote:
> This test will make sure that the error path in the exec_queue creation
> code works correctly if there is a PXP error.
>
> Since this is the first queue creation case that requires an extension,
> the code has been updated to add support for that
>
> This patch requires the matching kernel code [1] to be merged first.
>
> [1] https://patchwork.freedesktop.org/series/153095/
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   tests/intel/xe_fault_injection.c | 29 ++++++++++++++++++++++++-----
>   1 file changed, 24 insertions(+), 5 deletions(-)
>
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 00d045cd8..778148766 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -339,25 +339,43 @@ static void probe_fail_guc(int fd, const char pci_slot[], const char function_na
>    * @xe_hw_engine_group_add_exec_queue:    xe_hw_engine_group_add_exec_queue
>    * @xe_vm_add_compute_exec_queue:         xe_vm_add_compute_exec_queue
>    * @xe_exec_queue_create_bind:            xe_exec_queue_create_bind
> + * @xe_pxp_exec_queue_add:                xe_pxp_exec_queue_add
>    */
> +
> +#define EXEC_QUEUE_LR	BIT(0)
> +#define EXEC_QUEUE_PXP	BIT(1)
>   static void
>   exec_queue_create_fail(int fd, struct drm_xe_engine_class_instance *instance,
>   		       const char pci_slot[], const char function_name[],
>   		       unsigned int flags)
>   {
>   	uint32_t exec_queue_id;
> -	uint32_t vm = xe_vm_create(fd, flags, 0);
> +	struct drm_xe_ext_set_property ext = { 0 };
> +	uint64_t ext_ptr = 0;
> +	uint32_t vm;
> +
> +	if (flags & EXEC_QUEUE_PXP) {
> +		igt_require(xe_wait_for_pxp_init(fd) == 0);
> +
> +		ext.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> +		ext.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE,
> +		ext.value = DRM_XE_PXP_TYPE_HWDRM;
> +		ext_ptr = to_user_pointer(&ext);
> +	}
> +
> +	vm = xe_vm_create(fd, flags & EXEC_QUEUE_LR ? DRM_XE_VM_CREATE_FLAG_LR_MODE : 0, 0);
> +
>   	/* sanity check */
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>   	xe_exec_queue_destroy(fd, exec_queue_id);
>   
>   	ignore_dmesg_errors_from_dut(pci_slot);
>   	injection_list_add(function_name);
>   	set_retval(function_name, INJECT_ERRNO);
> -	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id) != 0);
> +	igt_assert(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id) != 0);
>   	injection_list_remove(function_name);
>   
> -	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, 0, &exec_queue_id), 0);
> +	igt_assert_eq(__xe_exec_queue_create(fd, vm, 1, 1, instance, ext_ptr, &exec_queue_id), 0);
>   	xe_exec_queue_destroy(fd, exec_queue_id);
>   }
>   
> @@ -585,7 +603,8 @@ igt_main_args("I:", NULL, help_str, opt_handler, NULL)
>   	const struct section exec_queue_create_fail_functions[] = {
>   		{ "xe_exec_queue_create", 0 },
>   		{ "xe_hw_engine_group_add_exec_queue", 0 },
> -		{ "xe_vm_add_compute_exec_queue", DRM_XE_VM_CREATE_FLAG_LR_MODE },
> +		{ "xe_vm_add_compute_exec_queue", EXEC_QUEUE_LR },
> +		{ "xe_pxp_exec_queue_add", EXEC_QUEUE_PXP },
>   		{ }
>   	};
>   

