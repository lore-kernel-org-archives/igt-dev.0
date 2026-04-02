Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF610D3943A
	for <igt-dev@archiver.kernel.org>; Thu,  2 Apr 2026 14:43:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7413310F2DC;
	Thu,  2 Apr 2026 14:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vv/B/cWa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3743010F2DC
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Apr 2026 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775140995; x=1806676995;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KtfMSTn1OjnP3w8o8drqOdVAzqyhMdvOVecTyZ7f0Os=;
 b=Vv/B/cWauklRzeT/P9yS2+2FOWaQd8YCiLv/mM3UYOuBcKcW6VOT45PT
 FhDUdUQvGcc+Yqq/7C1cFJ3gx1dlr/4SnDkyZGRINnHpUvnCz7N31pM6W
 cTnRahJPGjqdRSJmTKkEQwO/f8p+DRM9XLBYgqGzc5WpIcG1oWTQL3j3p
 hke+yeV5sBzV+ewkGx2EWWn3aRDayV3k+nSI8m6zfEOT5hzfDR2f9tlz2
 JLEB2IFAMSMcJKo8+52enLF4na1kA/6n8ZipkWi0PhQlt8r9QEoHCMCkh
 zZHsRNEGPWZlKcKrCvmzD+wWJmIJ5yeNE9dn3h4fBupSA2+qDGqRiZl1h w==;
X-CSE-ConnectionGUID: OSKb6ALTQXC/0T1UoxEdVg==
X-CSE-MsgGUID: LQOcFd63SFGpTCIdYzka0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="63751815"
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="63751815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:43:15 -0700
X-CSE-ConnectionGUID: NZRuXX3pTGG9gasPBjPfPA==
X-CSE-MsgGUID: IIMKzjfDSqapZDeWb6fu0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,156,1770624000"; d="scan'208";a="220342913"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2026 07:43:14 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 07:43:14 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 2 Apr 2026 07:43:14 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.48)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 2 Apr 2026 07:43:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eni8jxy2MBxi7O/9Yzg9rvUiL1yN5eDbZE7bPlkbLjo9mh4mvRvTE/FyHrWQAZb95ssELSzbOXH478mm30Z1h5LqF1CypmO3EbDerXhmR38dROh6iWhEMpP3Ga8QlG+DXVpwRhdul08MyC07zVgrLydHySS+lMMS/uGZ0KJgzPbpXGC61P/o/6jpncQFtHyhn4nfIOAaRH8VguYIdVQrh805xW6yXNAMDdx+cmLVCwszFDSzeHSXrPOzgp64OOhYgd7HLhfWVUrK6wO9G7Frq8Ctivzt3xtSVywqjSkhawWXAGGikvoqT9hQ3h3mqVZF3dMrFx/I4bAgUCn9bkktlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MQJ731DO4tXCmPRXvhjZndthMNKQQjbhTQ+f56iQRs=;
 b=kRtvdA69OEqhw+QUBtKKACIPoVlt4rgMHsNcExVhAnLyWylvjTikXcqKilk21qQ2BYwRE4/uJ4kw+TFTeiYDaUOPmmcyHWl4DfqNMV/9+r1IP57NealRDv+lDFu8cXvLj8myhLnTMadMYJ3hYoaGvet/NhUYaxwbJfhNikQNu7fZ2lDbHvJf6IUrkMt6NW8k/K44R6hZFEohm1bgfyQKTPs34mRjKO1UxVPZ+jo0FVsa/FQ6wIb2mTnN2V/LVN3TB5kfD42AZw00V5uqU+TL6DIE5it2imOIKvHWmeG6RwL36VCHQX1xb0w9ybry8RoYfxQWndVUSbRMNCqsDEkitQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM3PPFFCD58DF03.namprd11.prod.outlook.com (2603:10b6:f:fc00::f63) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 2 Apr
 2026 14:43:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9769.017; Thu, 2 Apr 2026
 14:43:10 +0000
Message-ID: <cc27d577-365d-4fa6-ae7b-c21aa6d77549@intel.com>
Date: Thu, 2 Apr 2026 20:13:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/amdgpu/amd_fuzzing: Remove unused variable
To: vitaly prosyak <vprosyak@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>, <kunal1.joshi@intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
References: <20260402085039.1655070-1-karthik.b.s@intel.com>
 <9ad5da9e-2671-4b3d-b1a3-d65beca63834@amd.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <9ad5da9e-2671-4b3d-b1a3-d65beca63834@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM3PPFFCD58DF03:EE_
X-MS-Office365-Filtering-Correlation-Id: 16df2fd1-669c-4feb-22b5-08de90c62946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|376014|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: gBMiKd+pEy33ryn7mWevLTmR/fxQBppdHvKZXbKPBYCNktTyc+Bo07vtmWjkawZclMLWz1vnjSh0AtYdqDBAsc3ZLInB4+28QZGxsGweqm7NOOIit5VwtAYW9039ql5Owf/wTZNXOZYdRIvm5hzKIMe/AmZQS56ZIVK2zNNPYZpftLvVgPGrGKZu4BsQsTnTMs0Qi+lE+fiqwDBCQKM7DX6jPoITXd6UbuO+mzSk58iJW5Ob77nwLJv3SslQiXX/MQ23eOSbWX7wgGqfe/ZJGnn+vLJFeZ6INDOuPmbPgcxXUDBAqiBjn5t16tsrA38leDn1wLYST7oZh3OSD/vO+rz8+sbwLU4VinpHJUWPqCWepbfrK+k3HdDDCm4PcYR87rL1GUBy9XbZr6VzvkN2ZLO9HMuzXc2VaTBw5ZSvpngzKSRAoJFFUBaxKl6MmoVmFR15UK0/2DNo6laoOi4HsOS4zTawTb98+3bT47L9DNisc01ly4z3bNMtWLLfWjRDtvVUU4dpmFA9HaXIWNPbiDhmBIRfK8m5gv8LwnYvtBpHkUEmgyMZV3TUyzNtbcfvEdlpxnQVegavY91UVc1Cvf9txsT3CKp33/NAD7m0JGFLBD39vbN60VMqtaQffbifF3A/335B2+yAOtSKgS8G2UwzLPyYv1mM3DqrfYQUhUhl6cOK11VGTl7OAyycQ/tYoBU+Cfdn7FsRh+c/CHv6AFpTgJQQrIbbEL4C7vf/HhQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(376014)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NERuZ0pJYlF0UStRMzhscHppdUZWWm5FWEh1WThENXdLbHU3VUV0WXdGUGU0?=
 =?utf-8?B?dFNaUnU1N2wxa2VVOFYxaDFsQnV3dklIQitBWW8va3Y3VTQ1V0xyNm90a2ZY?=
 =?utf-8?B?Y3Izc05oOFE1NWZ6anZBL0RpSlBLRjRhY3A4QjBXS1hOZDgwem00TkdqNVF0?=
 =?utf-8?B?VG4yYXlxbTl2aXVGWWwwR1VYYWJuMngvN2Q5cHArdng2ZkxuMERWdU0zVy8r?=
 =?utf-8?B?enpnYjhaZk1Eb3NuQUFMSFFYYUthU1Y4TUpFZlFVN2dkMkZDK1JhaVNLUGxP?=
 =?utf-8?B?Q0E1bDNScHZacDlzQzZXbEEyUXB3UVRmdFM0SG5yYzV4ZU5wOW5QL3hBZTBR?=
 =?utf-8?B?TFRDN3hzRC8yOEtQNW1MU3BGcHhSTkdHKytycTBLc2lZK2x2MHFtZGJ6cXE3?=
 =?utf-8?B?VmFNcE9aT3dXanJUamtiRFBYemFyS1hzUXpkL2ZCWUIzRGdWRDdJR0VTNmNY?=
 =?utf-8?B?ZkJmMVV1UU9jQXh1ZlMrYXROaXFDWUlmM0tKSVhKWitwcTNyQUp1MmU1dEVD?=
 =?utf-8?B?dWdRcVV2SzlucURWamxmYkZaY2dkM3dMdXRXK3dVeFBSbEpnSTBOU0g1QVlz?=
 =?utf-8?B?SHl6THB1OFFqV1N5NkhxaFVlMlB5MnlRNi9uRDZVTlViMThTWXYzMlE4clZS?=
 =?utf-8?B?bHcvM1cxLzV2RGp6NFFwZ1Y0eTNCLy83TVFXSEowdEF6YnkvclRaU3g4TnIz?=
 =?utf-8?B?YlcxbXlIUVhhOVJoVTNobWI1VUNQWVQvdjZDZStyd2o1MEJkdG50QnZRUHUv?=
 =?utf-8?B?OWlvR1hLRXVCc3NrdW5XTjRDL24zbVh6VW01dThxekdBNkhxQWVWVDU5dXR6?=
 =?utf-8?B?U2dldG9iZmRtYytFZFNlVFVVYmtCbzFacndXczl4TUcxNEpqZStkYkZDb2I5?=
 =?utf-8?B?T1ZzVW8ybVUwUzdKSkIzUHE4WjV1WWMybEdabjd1bXNmY1ZhZ2R4bXAvME9N?=
 =?utf-8?B?Z085MnM2eTMybXBjSVRMTnhoWXlQNFhqVjQ1cjc3UWhFUU5LMTRNQUhOOGNa?=
 =?utf-8?B?RUd4azZNbURaTWRHZ0dtZXFMNHdwVTdBU0RiTjgwWnJKNFdaZGxYZ29yd3Z4?=
 =?utf-8?B?a3FoTVJsbW9xT09la1QyaEZ1eFhIck9GL0VSYndpRVpnakF6ZnlBOFhSWW13?=
 =?utf-8?B?YmRSYXd1d0VtaCswc0QrTDdRdHVtbFl6ZFZFWS9NQXdITUFFL0ZXdkh6TWQz?=
 =?utf-8?B?Tjhjck50ZHF5MmYvRmdZWktUZnV4eTE0V2NpdFhKYWFVUkZSdFBRSllZeEdS?=
 =?utf-8?B?a0M4cU5mc3VCZW9LVW1rRnNUV2RMVXRRb3Z3YUNEb205Mlo5elJ0TWVpakpF?=
 =?utf-8?B?UFVZbW5pQW5jTFBCODBRQ1JjNW1KQTQxeEw0ejFtR3ZYZEZXRG1YS2hZdnZk?=
 =?utf-8?B?K2lJR3UveFJGWjFxVlloKytyUFNyTHNxRW82UFFGbTlYN0M5TW5SMURkb3Ux?=
 =?utf-8?B?cEFJSWhZOUdsYmJPQXphbER0V1k3NGlja1VVWHU0M1pGUVh1cWRUQ3pqUjBu?=
 =?utf-8?B?L3ZoTHBFcHJOMllrT0tiTkI5VDY3eXpVOVFIc1hLNHVoTWtyOXZ0WTd4OWMw?=
 =?utf-8?B?VGhyK1RVWDgzWUFETFRZVFQ0NEw5MmhIcnF0UUNjRFgzN0tpMVE3ai9VQ3Ev?=
 =?utf-8?B?bzVlTk42Y1hHcS9LWXRxWTNidDFqck45eDdVdUZzZEUyQkJqT25xcTJCUGMx?=
 =?utf-8?B?Z1RTMmFpNldLK2FMV3dsaVM5bmRSb1ArUHh0K2h1Z2pDY1Z6czliL3A2d2xn?=
 =?utf-8?B?aGRVaUVwbVp1aGlteHV3bUUvTkpuMS9ENlhvYU5mWEJrYU5wUkFNamdBYktI?=
 =?utf-8?B?dVFRbUpYV0hZMHBMRlJGZ3JidWU1blR6N1pEN2wweXhtUkFiZ0Nud3U0akcz?=
 =?utf-8?B?MTcrNzhLZXJTZUpwYmRETzRELzEyc3VVb1VPL0hqaWREeU8wVU11aHpPbVlV?=
 =?utf-8?B?U1VoR0p3empndk5pZHF4YWtwVXdaODc3dk9nS3E0TFV6ZlA1emxDdmJmODJq?=
 =?utf-8?B?aWhRZmtNTkFLaGh2TTU2b1EwL0I5Y1hKbHhlU1UwMVJUN2NpaFJUTGFmdG9W?=
 =?utf-8?B?NVY0OU1ybkFMeUMrbWtLZXE1akFza1JYdGtZYzE5ZVY5VkV0N1A4RVBuNXBM?=
 =?utf-8?B?UXNoQXBRUGRxdlNFYlE1OVBrcGJ4ckVpNDJNM0hDZlc5dkl5Y1YvdlFLYi9E?=
 =?utf-8?B?UHpwdC9XVWcyWWp3TUcwemg3dmtTN1FSOE9HdUc4NW5CakovZ2pWNWNnaHYy?=
 =?utf-8?B?MWR0MHcvaVc0ZDVZajNXd0lNenpwQnB3SlQ3T3VtVXIrTm1nWnI1akk5Qko3?=
 =?utf-8?B?cGkrK2pJcjJZeC9RUDlmZm1VY2s3RTcraCtmMFNZa1lSOTdGU3JSZz09?=
X-Exchange-RoutingPolicyChecked: GJhuxftX+mNHrgDIV7MCKlWp1L4JvKayagbm/uXRBBwxwqd54K6ut9Waff+EZT16SKDHId3v1QS6Tnwdl1ftt6BWqn8FPaOLi3vSzpk2WWyp9z6t4Dvd0isSIjsx3PKzla8GFvI+KdtGpFUop8cvK/mXc4mlOmKVsyNIgzZXW93Jk6FXAD142kOaBF3U4I8W39BbEVQ6gmtN/1d46goiN47PG3FNtkzGT7T3zzNbKdQOXOTih0NU2qNbW6HbywSLpVqOLHOcdqW39b1wi+nwgS6h9ziOURjpSxpYuQRognbPWLjKM4IgcaZ1La8dOoXUkd8+sTEDiuihBkWfTS66og==
X-MS-Exchange-CrossTenant-Network-Message-Id: 16df2fd1-669c-4feb-22b5-08de90c62946
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 14:43:10.8308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2GaMfz/CoXP0TRU6Y/kS+U/KdcSbaU3v6vhogr8+IZ4+8kngnYLVd9sHLO9w1Pjh5VQ9cDMzX1UxxFI9LTwa6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFFCD58DF03
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

Hi Vitaly,

No problem. Thanks for the rb. Pushed.

Regards,
Karthik.B.S

On 4/2/2026 5:53 PM, vitaly prosyak wrote:
> Hi Karthik,
>
> Thanks for fixing this, and apologies for the warning introduced by my earlier patch.
>
> Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>
>
> Vitaly
>
> On 2026-04-02 04:50, Karthik B S wrote:
>> Fix compilation warning:
>>
>> [1694/2119] Compiling C object tests/amdgpu/amd_fuzzing.p/amd_fuzzing.c.o
>> ../tests/amdgpu/amd_fuzzing.c: In function ‘amd_kgd_multi_ioctl_field_fuzzing’:
>> ../tests/amdgpu/amd_fuzzing.c:298:14: warning: unused variable ‘have_amdgpu_dev’ [-Wunused-variable]
>>    298 |         bool have_amdgpu_dev = (amdgpu_dev != NULL);
>>        |              ^~~~~~~~~~~~~~~
>>
>> Cc: Jesse Zhang <jesse.zhang@amd.com>
>> Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
>> Fixes: 49cf0900dd23 ("tests/amdgpu: add field-level negative ioctl fuzzing tests")
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/amdgpu/amd_fuzzing.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
>> index 21dab4afe..00717e593 100644
>> --- a/tests/amdgpu/amd_fuzzing.c
>> +++ b/tests/amdgpu/amd_fuzzing.c
>> @@ -295,7 +295,6 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
>>   	uint32_t valid_bo_handle = 0;
>>   	bool have_valid_ctx = false;
>>   	bool have_valid_bo = false;
>> -	bool have_amdgpu_dev = (amdgpu_dev != NULL);
>>   
>>   	memset(&valid_ctx, 0, sizeof(valid_ctx));
>>   	valid_ctx.in.op = AMDGPU_CTX_OP_ALLOC_CTX;
