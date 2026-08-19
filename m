Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ADFC5DF81
	for <igt-dev@archiver.kernel.org>; Wed, 19 Aug 2026 14:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF8910E551;
	Wed, 19 Aug 2026 14:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OmDdGARa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E48910E551
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2026 14:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787149628; x=1818685628;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lKQBhuR3E28exnYvaJEw+g83n5BlPsACBklMvcKkdYM=;
 b=OmDdGARajKsMRDRYkE5Qg2VPuDO/7EudPO/UxV4V2lHg8hkOkXc7NgIf
 EtDqEZSZvJAQGJfSK/cLUUiEUlcckte8uWvg/bSq4ClJLArRQz1NaOJ4x
 szEpk0gvDWNgNZZxMjlSkkYD2jLifIPPdlChkf67I0bY3aUZRBZ7x7ZXZ
 1Bn2IOZsBMP+TiXCAlfQZpY6V+23qvnbHm5Kzd+Nd4FdxITdSeEGPt2dy
 3MuLP1w7WQO7Q2KpNPf90HwvnG6GDzld56TDsaYmodF0NgmT6j0bDbXJM
 TrjoWXagQXpCV6Dyy1H+NCo0IwGP+++3XN+MREW/F2DeO+Iq2c8Xhb+PR A==;
X-CSE-ConnectionGUID: aewhXG/PRdeSCCH8QmD1lQ==
X-CSE-MsgGUID: eCzlHxwFRgGjo+itGOaJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11880"; a="87689682"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="87689682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:27:08 -0700
X-CSE-ConnectionGUID: XS4P1pcQT4+XP1GtqO1mNw==
X-CSE-MsgGUID: DeVS0XYcTViUyrQtjuUxog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; d="scan'208";a="266170160"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2026 07:27:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:27:07 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 19 Aug 2026 07:27:07 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.7) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 19 Aug 2026 07:27:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZG6K6p/+Vcc5sRhuhc+fFOB0M+3Gc75d70y8MFw3BtQL1IJOo9zBS6p8BTB2XeV009JYS22OZgO5WxPstkXmzwrnH4PIVZLBY5j5YsB5fCL+FzUqUxa4pADbrJj3qsTbEyabEaBqYekaUeq2irS7vh/vjV5TmMaLsDN6OKEzTlV449R0BYVsZVbMWAQToJ3dXhioAVT3NupG774hcssy4NfBg0tzUVkK+Dqux4gWjod4ttr2kmFji02BY+nnCC6PNreX4T/vydDv0WkeSfRRcQuOJ3IBhyC8HY1NtkCoHN/FMtfdu7QgrXeKL6kZ2dLLHd6ZZRXVLrzyTp0g7CxhBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ztvq5tC20IuTph+OMshb/YzYqDnLRAGyfXP+1v67PDw=;
 b=hH7PM7lYNacQpoLKzn5h+rCtG1Cf77LKqFcbZzLo1MGjg1hXLqVL+SYBbyPmrGv3Rvs7IrTKbSsXUl170JjlI8+e5MNURk/nn467imftLdezcbs/U1Vf06UgdGM+uu2KWsgNYZ3HUnubHL9OI5b0K/UW+AGcJVSPqv73U/FlqF64PtEnlz20JZlg39LISJaplf4rx3elfGlZ1hkdpXN47Gpbc7g5cLiy/kLlm0YHh1ky/V3jx/+beCfMZjCOkSNv3KxMfNVSeKq5OnHMWm0+FzRyfzXR18OgG7lXNNFDim3ixvPdEx1wsBf1UJcvxrv17YP/aZPRCZebCliLRsTC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:27:04 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:27:04 +0000
Message-ID: <3b566fb8-c888-401c-9549-8373782812d9@intel.com>
Date: Wed, 19 Aug 2026 19:56:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/2] tests/intel/xe_prefetch_fault: refactor test
 to accept shader function pointer
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <priyanka.dandamudi@intel.com>,
 <andrzej.hajda@intel.com>
References: <20260818171239.277897-4-varun.gupta@intel.com>
 <20260818171239.277897-5-varun.gupta@intel.com>
 <20260819103011.vjuqvptpc6coig2q@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <20260819103011.vjuqvptpc6coig2q@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0220.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::12) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: f80f238e-31dc-4560-c7ce-08defdfdf0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|6133799003|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: SadDKJl4wGJ1MKes82ZG3Wbr4erPQRgElDIhOVC7A9CrmI63URIj9Mu9SY2pejXtuR1Yg2qzbXLq4JAH2RFaPhgjNBCs/FJ3qrlDvRnbr1EZNJsFD3rX6YjcUZLsfLwwXkqggw4DjoJ+LEHsTe3Ri3YhqMWu1wf5gDafI8ZG9yhU8lkcNP7ulcu5TmtJuw7o2CyOXQqP8p+DeoPnNLolkxqkzXJNUzr6sKA1evW+f6SsH/0sjH52q4Jr8k6khj3CFJB4ThbMSrztiiTQHBL3lK3f5tGHFm2bcG57XocqnapTrKCJ4mCn561JuTacDLlnrZ3TSm7/qGszz5C9ZxqlZANtbTTG1xaV4V3pkYu1hQ5qRVd0sCLel/P6BzdPRL8WWtCRzPghZ4bOQmp1nWxKqMtAWMd6kflv8cLD7sGo2aCkg8tJWRTv87WQFhaAiFToP5QbPiWU3qoknEZIJ9jykf+2kqx11t+1uPY8TOtItMnWFdnQYk8DVOCfyDnrb4xiMGMlyiO9Hr1R9NzGinCGK5w3LWbaochi9MQCf+qjQpCoPMNkXF0p6f4mSv05DgIolow2gvk3yrDlrilCJZuQWKBVnBIh72NNGAjZTy1SjJufhck+okhmxONM1ZRouGaGZXbCKmHR99ebfje/fb8GrtkrgGy1gltAGURrnqPrh9g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVdFRkFTc2pHNkZRUldGWG50Y3o1V2FzbmhWKzZqZTlnc25Od2VjWmxYMHBW?=
 =?utf-8?B?Q1Fjbk1IbTdIQk5UU3dPU2J6NW8rZ0RJU3ZxVEg5R0VTYkh4S2tKQWlVSTlv?=
 =?utf-8?B?UjQwUlBaaGNWcHRTVVhLbm1vMC9GTENWdGhFbTYrUm55VTJWRFllc0xZOXFZ?=
 =?utf-8?B?RlVPbWI1OERrU096Qjg2bGRBWE8zTVo3SGd2Mlh0N3orbWxZL3VwQkNmUmJu?=
 =?utf-8?B?dmQrVUhDekoveDdXN2RnbnV4dE9JRGMzcGliWDF6UHpxNlBYeG84emt2QlB2?=
 =?utf-8?B?M1kwSC80QjZ3aE14TTNscmpJbVlPTHFkcGx5MytxVkZXVW9ncEpQb2swcG1H?=
 =?utf-8?B?VnVSNjhFV05OY2FrYyt1YXphSFFyRjRDb2l3aFBSaW9RdFBRVWlVempUVnpn?=
 =?utf-8?B?Q1F2MndDbDM1ZzFTVGtJaHg2czdrYkx1NllTTS9OUzl3bGhjSlBsZkdCOFZZ?=
 =?utf-8?B?SktVbGxrMTRVSnNHa0FOWWsxakxtLzdVamdJeTRNdjlBeGltR2doRHdwaHRY?=
 =?utf-8?B?M1hpeHhTRFpvN21kUXFUYkh3V0Rzclgzazg5OGhLbUV4MGdxcVNYY3FXNEFO?=
 =?utf-8?B?TE1uODNuU3hNMGQxNzdaS08xdzJjZ1NoUDEzVWdnblhOUFV6ZnEwK0J4QW13?=
 =?utf-8?B?NlRHaXpGZWRCbjEyWmNrR0NiaU9JRW9reU94NFR6QjBKeENPd2FCN3JEUEZE?=
 =?utf-8?B?QXNYbEZUZjlydjhmOCtYYWMzdTJXd0NzcGg0aGREWFNManJraDlZblQ5VHpr?=
 =?utf-8?B?Tm41ZlJUTlBKNkV4NXFTMGtnQUE2OS9UL081blV6Q0E2TjgwOUIxelcvK1R3?=
 =?utf-8?B?WW5FMGE1WXpaRDNLd3RvLzFpb2I5bjJMc0o1ajRDSWgwU3d3bWo4cXdVcllh?=
 =?utf-8?B?Ty9wU1lTNTkxVVRmN1ZyY0ZCdWNqZk9icWRwNG4zWVRTZXExQXMvRmlIWVBm?=
 =?utf-8?B?M3piMlVCbExEK1A5WmE3TTMyc05Ha2FzWCt0TTJRd1dLaTFtV3dtdVEra0Jk?=
 =?utf-8?B?bDVrWUN4VDZrTmQ1a0JOVnVUc3lrblNySDhIZytoaVI4VmxhOVE5Y0FWRWpY?=
 =?utf-8?B?ZCsxU0ZkMVZRTGRtNnkzaE9kSzNicERtZnh4WnBib01OK0UrZlVCWW5pQWtL?=
 =?utf-8?B?YS9mVUNsL2dYNUdKNld2MjhDNlVBalB1ajUxWkdQN1Q2RU1hbmRKeEZYV1hI?=
 =?utf-8?B?MWdDa3RHMmFCN2Q4TGJEVmVQKyt5NEVwVXJxZkZhcjdVdms2Wm03YjdBL2xH?=
 =?utf-8?B?bGFBVWI4V1dHSytDUThBZnhIM3ZXalRmNW9wN3hpMnN2RStSZkhQZUxMZlkw?=
 =?utf-8?B?VmVBRjN5bXJjamlzZ2l6K3NuRjZVaDN2ajZTR1JDaW1KMTVaZE5iZFE0aFFj?=
 =?utf-8?B?ekhBU2ZPVmdGR1JRS2JnczZEWEduZHp0RzE1R1NUWTRqNVcxMDJiUmhCRThY?=
 =?utf-8?B?dlh6NWRVbkQvZmRlYXhobktXTE1VNXFpNnE5K2RaWmlaM0RKMHVFNW82SXlh?=
 =?utf-8?B?QWZoY2NwakZQSkF4aE93N3pPVUxpcStieG5tL3R6Ym5WYm13ZGNwbWN5M2hw?=
 =?utf-8?B?bTBSNVpQb3lKUDVtY0lTa3ZrcmRaMFdUWG9SL0xEZ3NUc3lGMjZiYnZndzI5?=
 =?utf-8?B?N1ZyT2JoRXAyVTBJWXdyRkRIaEJneE0ycXBBeHNwSWJjODh0V3I3aGozYXh3?=
 =?utf-8?B?blhmaWwvcXJNSklTd2o2UEZpdGVUMGNIK2lFZ1VrQi9zWWVMSDlndmljczhx?=
 =?utf-8?B?bWMxNjYyUXE2aUFwbXBCN2tyTVhEQUpQQ1lWSUQ5UjV2KzhKMHdjVklxaHFx?=
 =?utf-8?B?TjFFcTlhZkdwamdrNVd4dEpHaGM3MjAxU1MyK0VrUm1lZStQcTFlRG9TN1NX?=
 =?utf-8?B?RjRHazBTV29VeXJDN2o1a2xTR0d5NnBJSUUxd0d5TERmV3BFVS9MaDZVYWl5?=
 =?utf-8?B?WGZFYVU4MzBoNmY1MXZZdFdOMlFzVzU1VDIxU1NkY20vYXNZNE1WUkJqZVdT?=
 =?utf-8?B?TEIxV2s3WjZuVzN0U0p5Y2VEdmZYMmNCU1pVYTZsOHZjWHFXR1N6UkRrN2pS?=
 =?utf-8?B?THpUQlNadm9Qc3ZVYkErT2k5SG5hYjcrK1FaZjZjdmg2NE1VWXgveFhuVnZt?=
 =?utf-8?B?YUZIakIrT2krRlYybEN6Y3FHMmR1Qys3OWtrNTdremJ2b0RLREVQS0xUaEJP?=
 =?utf-8?B?cHFXRjRHbDRwS0t1dDhvYzY0ZTVtU09tYktSMzUwNm5IY05xMkRFaExEUTZN?=
 =?utf-8?B?UWovakk4dnU0dGl4dHpBZUdMTXBnR255R3Y0bFBmdlhKRER3dHpCYW1nVzR1?=
 =?utf-8?B?aEx1RDdmVXFET2swbDBwUkdwNzFGbWt4cHh5N3ZKRytCMzBxTGZRQT09?=
X-Exchange-RoutingPolicyChecked: qmKNKsd2hq73Cy1/rD9jQpLGpIcWl2ADE1CTNIrmis0YkMRxrt4f5sy5hv4ZQE7KmXjIIOp+vH/6brvqAGqWTe3l5y+zN3CcU2x7tq5qbCrveT9nSKWfNTXAYZRl+qrnYSmbg+J64dOXxBnabsywVxrAcucDsyAyp5cXv9llfBzWzhhBNdPzNKxuLDlprsevIps4v3zBc4HQBbhhjojyz/ajHSt9uHMXCM9y7gWsJOhjRS+ebrHpAof/xNRgwkTOA1HD/GpIau8Mb6Z6OKJlGWqG9d+3bMk2CZRIiLstWozKnGpLpYY+YLyXtJpmH1Qpq8Zni203dE1mECEhQfmkYQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: f80f238e-31dc-4560-c7ce-08defdfdf0b8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:27:04.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VkOBdXCKGPuUtQXwsqI28xAKquO+Hvw4sdP0xOU/VVckSv5XXVJr1whCcxNUv7rllZoVWffgIPvOH5XC6s/z0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
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


On 19-Aug-26 4:00 PM, Kamil Konieczny wrote:
> Hi Varun,
> On 2026-08-18 at 22:42:41 +0530, Varun Gupta wrote:
>> Parameterize test_prefetch_fault() to accept a shader getter function
>> pointer instead of hardcoding get_prefetch_shader(). This enables reuse
>> of the same test logic with different shader configurations (e.g., L2
>> prefetch fault shaders) without duplicating the test function.
>>
>> No functional change for existing subtests.
>>
>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> Did you changed anything here from v1? If not, then r-b from
> Priyanka should be added. No need for sending series again, it
> could be applied at merge time.
>
> Regards,
> Kamil

Yes, there are no changes to patch 1 after v1, retaining Priyanka's RB
in that patch, and on 2nd patch will add Andrzej's RB.

Varun

>> ---
>>   tests/intel/xe_prefetch_fault.c | 23 +++++++++++++++--------
>>   1 file changed, 15 insertions(+), 8 deletions(-)
>>
>> diff --git a/tests/intel/xe_prefetch_fault.c b/tests/intel/xe_prefetch_fault.c
>> index d3b5aff47..e86cd68d9 100644
>> --- a/tests/intel/xe_prefetch_fault.c
>> +++ b/tests/intel/xe_prefetch_fault.c
>> @@ -117,9 +117,11 @@ static struct intel_bb *xe_bb_create_on_offset(int fd, uint32_t exec_queue, uint
>>   	return ibb;
>>   }
>>   
>> +typedef struct gpgpu_shader *(*get_shader_fn)(int fd);
>> +
>>   static struct gpgpu_shader *get_prefetch_shader(int fd)
>>   {
>> -	static struct gpgpu_shader *shader;
>> +	struct gpgpu_shader *shader;
>>   
>>   	shader = gpgpu_shader_create(fd);
>>   	gpgpu_shader__prefetch_fault(shader, xe_canonical_va(fd, PREFETCH_ADDR));
>> @@ -130,14 +132,17 @@ static struct gpgpu_shader *get_prefetch_shader(int fd)
>>   
>>   /**
>>    * SUBTEST: prefetch-fault
>> - * Description: Validate prefetch fault and hit-under-miss behavior
>> + * Description: Validate L1 prefetch fault and hit-under-miss behavior with
>> + *		L1 cached, L2 cached cache policy (fault source: LSC)
>>    * Run type: FULL
>>    *
>>    * SUBTEST: prefetch-fault-svm
>> - * Description: Validate prefetch fault and hit-under-miss behavior in SVM mode
>> + * Description: Validate L1 prefetch fault and hit-under-miss behavior in SVM
>> + *		mode with L1 cached, L2 cached cache policy (fault source: LSC)
>>    * Run type: FULL
>>    */
>> -static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe, bool svm)
>> +static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe,
>> +				bool svm, get_shader_fn get_shader)
>>   {
>>   	uint64_t bb_offset = BB_OFFSET;
>>   	/*
>> @@ -191,7 +196,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
>>   	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset, bb_size);
>>   	intel_bb_set_lr_mode(ibb, true);
>>   
>> -	shader = get_prefetch_shader(fd);
>> +	shader = get_shader(fd);
>>   	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>>   	gpgpu_shader_destroy(shader);
>>   	intel_bb_sync(ibb);
>> @@ -225,7 +230,7 @@ static void test_prefetch_fault(int fd, struct drm_xe_engine_class_instance *hwe
>>   	ibb = xe_bb_create_on_offset(fd, exec_queue_id, vm, bb_offset2, bb_size);
>>   	intel_bb_set_lr_mode(ibb, true);
>>   
>> -	shader = get_prefetch_shader(fd);
>> +	shader = get_shader(fd);
>>   	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, shader, NULL, 0, 0);
>>   	gpgpu_shader_destroy(shader);
>>   	intel_bb_sync(ibb);
>> @@ -271,7 +276,8 @@ int igt_main()
>>   			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>>   				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>>   					      hwe->engine_instance)
>> -					test_prefetch_fault(fd, hwe, false);
>> +					test_prefetch_fault(fd, hwe, false,
>> +							    get_prefetch_shader);
>>   			}
>>   		}
>>   	}
>> @@ -284,7 +290,8 @@ int igt_main()
>>   			    hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) {
>>   				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
>>   					      hwe->engine_instance)
>> -					test_prefetch_fault(fd, hwe, true);
>> +					test_prefetch_fault(fd, hwe, true,
>> +							    get_prefetch_shader);
>>   			}
>>   		}
>>   	}
>> -- 
>> 2.43.0
>>
