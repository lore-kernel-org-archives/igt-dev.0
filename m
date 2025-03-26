Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215ABC3600E
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 22:28:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C927010E0B5;
	Wed, 26 Mar 2025 22:28:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlWH0VxX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8FF10E0B5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 22:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743028099; x=1774564099;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=zlh2L8lxemU+foqz7MA5v/bPv3hyL7fbRxA6rtcQfjY=;
 b=PlWH0VxX+PJenXQc0LIG/mxFKNDiLOhKFrXu9K4oOaD0AN7MA3i2Ggky
 tI3u0pM4zC+GzbuwJZ3WWY+TeUx3U3dyfycd/ldhZJDkVTZC86fcgxJIa
 J7zs88U5PErplcvmLIcUQn+EYxXbRPUhrfm54smHUDGFLtJZRfKlxFV39
 BY2t4Eln4QxFiH8/5ffp1Sa6fiz5515XbUM6ZFVdeyNKaK3IvTU+h/Sd3
 37Px1+ls67B9CM13Qec4jpSoQwrmfOh9KVmilIhphDSgTWiEIzSuySdzB
 gPv8Hb58kWeXWBHo4mIj7vewQD1zA4XTizctPXJhMALsrhsLZ9iKoON5a w==;
X-CSE-ConnectionGUID: lfXD1geuRrG3qA5b1yIZLA==
X-CSE-MsgGUID: cs/j+Aw3TRuixF3beD1uxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61863893"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61863893"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:28:11 -0700
X-CSE-ConnectionGUID: 8eB6D/tAR2uzW5A9lS6zcA==
X-CSE-MsgGUID: IX+VIDrMSnSYH5/z9thq+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="124872049"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 15:28:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Wed, 26 Mar 2025 15:28:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 26 Mar 2025 15:28:10 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Mar 2025 15:28:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ojW72QgrwqYXSkXyNxBlIOJ+JAHx9gDrFL5sDfCmsxFw65fqVFhay+oSHkvhQutgZQND/LAbuBrxaDluA+uG5ahB9gjGYzFwv460pAUfl0gPvlu3jUcAJULtPXoOcxC6XGEgsYFZAxQiRShu3cA0BRKjgqwXp0NRsyGAaZIOCvLEiTaJVNKMbkT6eBcPG/CpiAe6vLa2tJ5W/WwBR5AXQee5Fs7W/tTmYsDW+Yw30mBjWpDIVpdlktr4wnFlKnPpq3Tt4FSM7SREvzE9Bf1JhFYa8ymhuxrLexZPdmmKqTPPm/QMmqDaKNjRZmTjCdOmpMqsJmT+y+ZSciO8OkbM/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9WjLgqupnCgse0GS36S5O1bDP7PGRwxl/JV8cQlWPo=;
 b=RxM8edGjOKz/axm0eW0/fJfU88UwzURFCO1LaiEH3BS7gIsddQO5C4M5ljGgW+J2nZgshLCPB2wTT5AXvcOf9lkoGNL6v5uIpkeAwE5wUJg0CLb3DySGn6K/dIWUPTL176wHNCHfqvEj1+CQMR3Bk22FESvI+E3PHPGeLxZSnlmvavJb+mqPtXq9RR+3wjXfeHobb+Jkk9j/dDvgAuR572Bg9fnwvU8trKxGLrcy7yFNNdEWyZO7MRz53tH0KlMYVDf8+8gN1VRlT0cSZmvihsX/buLIDHoPJxbGQeKtNO1YGiA4wYSNN2dlcXRBqdvOpmbnZiUkx9e5e7wLWpLXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 22:28:08 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8534.043; Wed, 26 Mar 2025
 22:28:08 +0000
Date: Wed, 26 Mar 2025 15:28:02 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tests/intel/xe_oa: Print oa_status value in the
 helper
Message-ID: <Z+R/cu2yqFBss4tT@soc-5CG1426VCC.clients.intel.com>
References: <20250326221729.884253-1-umesh.nerlige.ramappa@intel.com>
 <87cye3ig6j.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87cye3ig6j.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0305.namprd04.prod.outlook.com
 (2603:10b6:303:82::10) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 18fa3520-b435-4cb9-057a-08dd6cb57bde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NmFXbURoakVnY3NFdzUwTmtiWmlYL1ZpYng2dmoyMWZuOHE2UURqZURWUG12?=
 =?utf-8?B?ZUlESjhsT0dhcVI2ZzJkcXExSWQrV1NUakxkRGZtUlZWRGo5akFVSDh0TGVW?=
 =?utf-8?B?d2d4ejhONlZyRm9YY1pQVjMrdDljNiswOG1KdFZxRlBIZjNCZkN2bEJDK0Nq?=
 =?utf-8?B?eXhCa2t1c2txNk5XU2ZDMlRLTTBFdnBGaTI3RG00MTFqY1dsRTltRGRUNWhM?=
 =?utf-8?B?V3ZlM3BNRE1aZDQ2OThIOGRrbzdZeDR6Ly8vVUtIS09rdUYxeGZBdmVUZldN?=
 =?utf-8?B?M2diTS8vekNxV0NQUEcvcnIrRnp6WEdOc1N5MFhEMGlweGRubWRsdExpRXpF?=
 =?utf-8?B?MWdkNnVSamNLZjhnNnZudytMVlVPQ29RWUdUODJ1NDhBWkxZVTVLQzkxcEZT?=
 =?utf-8?B?VTBiT3JUbS9XMGVtODFNN01tQmJTbDZmZFFOaXgvQnJ0VlpSYUFqd21xU3Bi?=
 =?utf-8?B?aGd3YVIvajcrbDF1eUc0eUZyY29HL3FWVnY2ejVNNXlXWHNqVU9VTGc2WEdX?=
 =?utf-8?B?QVY3cklaTGN1UmRBY1l5a3UxUG1zSnp4TFRhVGQrTXlwQ0phMnZRS2ZzMERQ?=
 =?utf-8?B?eS9oNGNmdmI0MWJRZTk0V1d4VGIzakVPR253cDFCUUNlL0p3RkRGdGlmUHRK?=
 =?utf-8?B?Z2hkZThPYkNpaXFXQjIrWWRDTVBDVzVhTFErbk9GeDhZRlJScWJWbHFBVDNh?=
 =?utf-8?B?NDRmWDh5K29Lc1ZZeXYvbVdUQ2xyZURxMktTUlVlUUVUM2g3Wk83MVpuZnNj?=
 =?utf-8?B?clp5U2Q2cm5VRnZOYlRqNFNYMVNINmVoUm43UzJXakR3eFRJb3lVTVpKdDN4?=
 =?utf-8?B?blZXQlRFYlROS3plMWJadTNNVFFMY0tXUnUrQjgxbk83LythM3hQZjB2S1dC?=
 =?utf-8?B?MnYyUVVwU2w5OXhNaDdRdUVkR1IrNEhvb2QzWEJCc1JXKzdvSG14UG1zb2Iz?=
 =?utf-8?B?U2p6dWdEdXRDWnFFRlN3SS9JOGVYODJaeVVVMWlvZ2JINkRnZWZJcE52K3k0?=
 =?utf-8?B?STdKWXluRHg3QzJ6UGYxVTB2OG5raUI4RTExS3I4YWNKdC9PU0piQ1lpKytT?=
 =?utf-8?B?bUUvZnZBdjRUa2NnUmtpcjcwTWw4VlZjUkU1bW9ndWg5UC94L25QMVhTclVX?=
 =?utf-8?B?Ym9WVE13Z0xNMHFsNjREM3JrNUkwZzAxWDIyVkxPMkdKM0hoNkFyOHU5ZVZp?=
 =?utf-8?B?bklyc3Q3MmtodXlnY0JYSFE1NWxxa0xTbVN2MlJUanJuNFVFSzZuYUtRTWRL?=
 =?utf-8?B?VmN3UkFoLzMrRjQzd2lVUE82TVdjL1VsOG5RVVlFSVBGa3VVRW50K0wweXJt?=
 =?utf-8?B?RWx2aXBFY3Z4Y0xQZTFXdVhhakhuMDNsdnp3WmoydzRuT3BCMTcvbmZxOHI0?=
 =?utf-8?B?QTluY1RUYXpkdHpkNGZhRnZBczRUN3QyTm1DZGZiSTFVVVVtNjIyaStBSGZB?=
 =?utf-8?B?Y0tmS243djVaRENPdno0QzRvdnNYcVZmQ2VUV1BxNGpTZldGZDdyeUxFMFJs?=
 =?utf-8?B?cTZJdnBCdTFNWGprK2ZRKzJMbkQ4d0FCRnJZQnVHSnp0TGJFYWFQR3hKUUky?=
 =?utf-8?B?dlRmaGY4dVBIN1J3ODNGaG1pSXZRNWpEM3llWVl1Mnk2aVRJWjFzUVh3Z2c2?=
 =?utf-8?B?eXVuNXR5V3gxMzkzUXU3S3A2QmFsQ1BqZkIwSGliWHJ6WXVReHN0aGUvMzE1?=
 =?utf-8?B?UHBvTHFycnZXamNEbVAvem9ObHhGYzNwVE0xcXJpbTI5V2NsalVjdGJvTjFa?=
 =?utf-8?B?SElaNnVHVlNPN0lxTjRwS3hWQVlPSEpQWVFCdlJvWWpFV29vZHBWTEtseHF5?=
 =?utf-8?B?RGt2a0czMTZzN0RVWHB4TzlRMzF0YVJEaG1URlE0YzN4L1ErNlY5eFQwZjdZ?=
 =?utf-8?B?M3c2WER2djJtaERxQXcwNHQ1bmQyeVZuS3B2QTk3cjloUWN1N1VkcGpwTHVE?=
 =?utf-8?Q?gQK0Kj3lTAg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk43Q0l1M3JvdFEyemx1Q1dVeDl4TFF5dUo2czFNaHZKTmRLaGxhYldVY3RM?=
 =?utf-8?B?S3o1MWlBdDRCYTRKempZaGhkbkVGZ0NNMnI0ODNTYUd0Y3BOVFlFaTUxNGQy?=
 =?utf-8?B?T3c3UHNRNE9RaGRDS2JMQzlGS0pZZnN5Y0Z0WElyZU9wbU0yMEF2VGlUcWx6?=
 =?utf-8?B?L2V1enVBS2ZJYU5HUUtBMmVPbFhoOHlmWStNallyWjlHcWtkMDNMMDVxMXVQ?=
 =?utf-8?B?bWszZlVRYUVSdmkydkRaZ2V4UDMyN0RCQVJCVWdSa3NYNFk0T2Z4anNpTlFt?=
 =?utf-8?B?NnR3Vmdla1JjOUZ3VVNLYnA4dk9zZnJmeEo4NldiYWcxWlVreGdlM3RFa0oy?=
 =?utf-8?B?Y0REdTFBRjZaVEx6WmYvNHlaUXNucDlKMFBobGJwZGg5R2NWQVhVd2ZuTnM0?=
 =?utf-8?B?WUY5THJhNDZTWUxRQ1NpalR3NUE1dHNmc2wwVk5vMFNiQVJlTE5EeXEwRHBC?=
 =?utf-8?B?MXZvOEZIWi9oQXE4ZktlMUpJZ2FOY05TVGJQd3FlSlZvbDUza0RDR0RkWmNy?=
 =?utf-8?B?dkp4NGhYK1NsTWNmaGpZNDNBbnV2Wm1PWit6T3BZZTZKOXA4VmZRSi8wZ3JI?=
 =?utf-8?B?UzVERTdZMEhUVlppTjR3eGdKYnRYc1lscjB4MXQxRHUyRXh1Tk44WVovSmVl?=
 =?utf-8?B?VnFrZWJkb1VLUS8xWWFBOERhbXZoQUVoWWtRVSs4MGh3N0JvdzRtRHlnOEFq?=
 =?utf-8?B?dFRzcEE4V3RkbzdSQjRjUkdwbk9Nc0pKWmYza3RtcE9qYjJOa2JqRGVMVXVj?=
 =?utf-8?B?TnBmY2psSmM1Y28xNmJ2bXdtRnhoMEVpMlhnR2NlZ3VHZVdVOVpaZVZVQ3FK?=
 =?utf-8?B?VnBCS2t6NHRJK3phQVZHcDVBQzduZGZuTUozRjNiQVhNV0wxcVI5OXZRNDBy?=
 =?utf-8?B?YWlDOGRCdWFnSjZhYUpnWC9jeUpWYTRlVXloWXRGUlBmd2prOVFMZ2Nia2Jk?=
 =?utf-8?B?L296UExxanN4MC93RTNkbEs4YnFWUTFRZjU2elZnVUNOSy94c25vMW14Mm1S?=
 =?utf-8?B?bS9oeHdEV3dWUkVLMzNrdFRQbXZOYThYT1ZmQ05LaUl2Rjh6TDlWVUFBUFE3?=
 =?utf-8?B?Ujk4K1dKRXpPclcySStvVUVZM1VHVUoza0lQd0N2K1ZpenY5cHNmMXp6STNy?=
 =?utf-8?B?UUdOUmRFVDk0VjZQdlh5TTlnMzJLcjd3WU91c2p1R29JWlJRYllxNURBOVVE?=
 =?utf-8?B?QW0vZ04wVVA2TWxqR0paMGJHV2FsZXFzMHhZcDVhN001RGJOenFuQXlwcnBh?=
 =?utf-8?B?dlpDeUVIa2NHWHdkWE5pVHhMeWJYMUcvanYrZmovb3NPSVE5N1ZLWTNzVVo1?=
 =?utf-8?B?b2FMMkFaYmlqNUxGT1Y0cmRWZnphMEpBY2VoSUgvMHMvSE5YZFJnOUhkUWdZ?=
 =?utf-8?B?TTIwQXp5V1pJWTVVcmJIYXFaYnJyVTNqY3RKT2tLMzJTOVZLUDZMSVFNaUE4?=
 =?utf-8?B?OWoyMDQyWkFPY3ZvbTJxSDdNZmVqQ0RTOXByT1V3NmFkQzJ6cWNaSE5wNmxG?=
 =?utf-8?B?OWhFRGhacHVzRVYxbWFwdjFvc1J0NzZRZmR5NXlNYmUvVEZVeGlWMWFrUmZl?=
 =?utf-8?B?RWpmVkdDenJTODV4WVZTU3hURm10Zm80M0tJd1NqTksrdEV4MGF3YVBnRE04?=
 =?utf-8?B?cVFVeFJjakU4STBTMmI0Ti9QblBtTSs2SHIzelpEQjc2Z3BtZ2xVWXl3eHRs?=
 =?utf-8?B?MTNsVW80aGZXUXBxK3o3RCs1bHZZMjBEMXNiSlk5a0p3ajVqb1Zic081YUtQ?=
 =?utf-8?B?RkRtbG54TWJ1eW5CUzllVk9NMTRZZ0tkcjdpSVhLNVI5ckNady9STGRNVTh6?=
 =?utf-8?B?QW1Pb1lGblllbXRibHJ4NmZVWXRPeDM4Rkc5Qk5VN2tQellpNmcwT3d4WUtD?=
 =?utf-8?B?b2NqMm5MT2VvblNHOSthQ2dKblg0ZWdxdmtSWHE2MSt5eWw5c2k2Um90ZW9J?=
 =?utf-8?B?SCtOQ2J5TTk0cWdlb3hoZWp2MjdLZlk4dFBjL2dpTUdZWU1MNGRPZVVWbFJX?=
 =?utf-8?B?QzBFVGNrNVlLNDAzK3ZqVHhwd05JakxrSnF3V29CVmdsb3ozU1kvNWVTcnR0?=
 =?utf-8?B?OHRkd25iNzRia2Z3bnFkZ0pLS1RhZW9qNHZ5WGgyUXViRVVXc2V4TktYT1NT?=
 =?utf-8?B?UllGM1FJZzZUWDVYNFBJTVpJckRETzc0bnB4YWtHcnU4U1F6T01mMUZQeExD?=
 =?utf-8?Q?fNpP+R8BIPB5x3MmV+D3P6o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18fa3520-b435-4cb9-057a-08dd6cb57bde
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 22:28:08.1071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC63eBcWBtL1hgsoAz0qBM0RQf3B3OMFMXSWy1DoRWhI+QDtKv0ZH4iYjdB3CC1RLnEMyl1xs0CSUFA9VWs34VxpUUdEximibn1xVX7hchY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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

On Wed, Mar 26, 2025 at 03:24:20PM -0700, Dixit, Ashutosh wrote:
>On Wed, 26 Mar 2025 15:17:29 -0700, Umesh Nerlige Ramappa wrote:
>>
>> OA status value is useful when any bits are set. Print the value in the
>> helper, so that each call to fetch the oa_status does not need to print
>> the debug message explicitly.
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> ---
>>  tests/intel/xe_oa.c | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
>> index caf713c2a6df..0e9fa966464a 100644
>> --- a/tests/intel/xe_oa.c
>> +++ b/tests/intel/xe_oa.c
>> @@ -383,6 +383,9 @@ static u32 get_stream_status(int fd)
>>
>>	do_ioctl(fd, DRM_XE_OBSERVATION_IOCTL_STATUS, &status);
>>
>> +	if (status.oa_status)
>
>Maybe we should even delete this if, just print unconditionally? Can do it
>while merging, no need to resend patch. In any case:

I was thinking there's no point printing 0 status, but looks like this 
is called only when needed, so I can drop the condition.

>
>Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Thanks,
Umesh

>
>> +		igt_debug("oa status %llx\n", status.oa_status);
>> +
>>	return status.oa_status;
>>  }
>>
>> @@ -1337,7 +1340,6 @@ read_2_oa_reports(int format_id,
>>			;
>>		if (errno == EIO) {
>>			oa_status = get_stream_status(stream_fd);
>> -			igt_debug("oa_status %#x\n", oa_status);
>>			continue;
>>		}
>>
>> @@ -1773,7 +1775,6 @@ static void test_oa_exponents(const struct drm_xe_engine_class_instance *hwe)
>>				;
>>			if (errno == EIO) {
>>				oa_status = get_stream_status(stream_fd);
>> -				igt_debug("oa_status %#x\n", oa_status);
>>				continue;
>>			}
>>
>> @@ -2505,7 +2506,6 @@ test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_b
>>		(len == -1 && (errno == EINTR || errno == EIO)))) {
>>		if (errno == EIO) {
>>			oa_status = get_stream_status(stream_fd);
>> -			igt_debug("oa_status %#x\n", oa_status);
>>			igt_assert(!(oa_status & DRM_XE_OASTATUS_BUFFER_OVERFLOW));
>>		}
>>		if (len > 0)
>> --
>> 2.43.0
>>
