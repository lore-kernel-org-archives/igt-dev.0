Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFFDCE8D55
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 17:15:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4DA10EACC;
	Fri, 14 Nov 2025 17:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YxX2TKW9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793EE10EACC
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Nov 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763140522; x=1794676522;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=I78bA4xPN/5dFRs+lqu59cyg9/eoVWkDLOO67y2dbAw=;
 b=YxX2TKW9k1xATyQRq3EOWnamj7dQsATLwzy0E6nqZTyCNk8zadcCQksP
 r2Mg1zupbA4cAmZL5F32L40SXJBjdZCHeHm/o6l5/vmHjZFZVVpcZYAvD
 diFLEn7kaKMw/vC0thShnreZaeIgBqogL+PL3gF/Ok+SmWg6esqLytLIk
 32dgZUJf/xk5BRMj5bSHaDV/VQuEeg6hcNET647z1IHmmWdh98WCvezjY
 OjZ6OcR8mRbiLK8WvqZm4B/cXCCq4WPjrTb3NG1I0CCMFlv4glviKYjN1
 pSy2t6L7roqsBnMDw/zdMOQDamScLkwJp2WUXMqsGrw/uYdaWuk90IPM5 Q==;
X-CSE-ConnectionGUID: 4HwIsKfyR9yQI+BSLLd55g==
X-CSE-MsgGUID: Vv9mXIRcSImTXyjWTWcECQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="69107859"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="69107859"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:15:22 -0800
X-CSE-ConnectionGUID: VU+eeor2SweVvpAIZuNMmA==
X-CSE-MsgGUID: Qdmii8TqT228NexttdhUTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189658613"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 09:15:22 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 09:15:21 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 09:15:21 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 09:15:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riQksDPxcy+kSg+tT3lkIrA7ExpWE14rluFLlXCCNSVTw7SIsj1Djx4mMzsJ1GCjwozUTWsaOFt4+68q4d9pcenjiMBVk8o4+PgtkWPSDlxTy9gpi/LHAWhkd1Rp0FyeNLyn5iATlW4WhTRwTlxKRQ4C7gztud6JxKVXGjOOa4n0PMtKzwhwZzFcRgxp1h0JpUIH6Vo33jOz8MVJgqXQhJIBf3DxF0frhPs6L4PQJpe5tXFQKNKpOfySCDo6F7dFXuoRl9r6SoLRLCw/o6ApvatePxnw/RNDyKnVdDCc4vr3I4zs5jlIeVL0cZk7Z1O1g84bBpfI3ytqlXOr7/boWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sExB38TkMLN0m4lKKeHEC/qhO/biDQ7DBCF/h30aE+E=;
 b=F40rTFZDhR5yLgKezViNvy9t+MHEIgoydFAWCyZCTITby1B8HHDimDmf6gh2R+6hcAgpoOP15NroS2E2dRWWZkwZNAzNzKMBYbzZQBqrxn7hnk26s/ZPo6++x8tDAcEgHYZg7cDJqNI7P6hpEwIehUw8HbYt+n87lzpzAoDigIaaNntu0cji4om734AfuNpI/YbyyB+cNovRzpaNIJkXgQelhGlt9wwSGywUHl0zUnd9GrdvYgemLFypU8U51nczRyCBIQx46Zn9ouJID3hz9BuOfjgfusWcPTB7qT2lxgy3zbrm6uYftA4xmmQZqZ1NXo5lo7q5pfJj1pv0mQ9NFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB4943.namprd11.prod.outlook.com (2603:10b6:a03:2ad::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 17:15:19 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 17:15:19 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251113142304.404065-1-priyanka.dandamudi@intel.com>
References: <20251113142304.404065-1-priyanka.dandamudi@intel.com>
Subject: Re: [PATCH i-g-t] tests/intel/xe_configfs:  Test gt_types_allowed
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <igt-dev@lists.freedesktop.org>, <priyanka.dandamudi@intel.com>
Date: Fri, 14 Nov 2025 14:14:26 -0300
Message-ID: <176314046645.3698.17726359842974078447@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::29) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB4943:EE_
X-MS-Office365-Filtering-Correlation-Id: a5af92fe-6e2a-40c8-3b73-08de23a1634d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmJpeUwzU1I3azdIcDdkaTdIalczMmhEalNoOEdjaFFSTE9rMlg3YmdNaWVx?=
 =?utf-8?B?STNhbHp3SEMvUUJTOHZiRDNTaForaUsraFYzQ1F0K2xESXRyWEsza1VycWp0?=
 =?utf-8?B?RHBsYjdJNHZkMDliVTlrbFBod3B0MEJuTU1GSzJmLzM2MWVCaktaUUxqVTRn?=
 =?utf-8?B?dlM4citzUlhNczdOSGltQnJqbk9PdVorUWJEdUU4VjdoWkJyK3ZNYnhtZmlI?=
 =?utf-8?B?aiswWkRXZTBaMEhQWEJsSldkMmNnMHNpYUEyNkxnaHFNSmkwb0JTdnBhU0Z2?=
 =?utf-8?B?RjFaZnZPM2NVTUUvMkV6TUNEalBpYXNJck04WlNiWFlsZEV3Wm5hVC9BaFlr?=
 =?utf-8?B?L2lML0x6eVlzQ3lVd2tRS0FvMUdnNWNkRzVFajN6eHJJczhQMWswMGRjbGRS?=
 =?utf-8?B?SG5YU3BmNUlIZ095SHF5aGc2ZElUNjlWVUZxcWRFNGVpRTZvVkNoSTJzOWpL?=
 =?utf-8?B?Z1lrNE1xNGhmK1BxTFNwNkg4TkJtM2FlTE9lOTVJYitxUkVoNmd5T0Q3aGd3?=
 =?utf-8?B?QUxhaWl2UUlMZkx0WDFIRVpZbEFWTkxNQnpzYzZndzZ0TlRTWEhKamx0RW1l?=
 =?utf-8?B?L1BlMHQ0VW43b2YwNmFSSTJqRDI5Vk1Cb1RZakh0SHRyeG04M1B3VmhkbUpm?=
 =?utf-8?B?N3ZTNXRpdlNxckY0ZTl3U21HdmtGRFpRZGZtZVp0MlFWQ2ZFQW9MRHNqRFRh?=
 =?utf-8?B?K1Y3cm1XM1g5Um1jdFdWSmVmbDdpTE00S3FNS1RUbmQ0UG96dkRhMVpzQjNQ?=
 =?utf-8?B?MlNqdlFGRG1iUVlobTVGdkJQcHZsZ2c5NDkrWVV0MzVqOU50U1A2aTFtVnhk?=
 =?utf-8?B?NEI0dzZFbjF6U3Zrd21VK1RPK2QzK3NlNVlzWXhZN0JabWtwczVON2NsNzg0?=
 =?utf-8?B?RmJ0VXE1ME9NZ2JBaGRNZHpLQmphclI3dVZLM0RaZmsxT21JYnkxWktySmNk?=
 =?utf-8?B?dWY1aXU4Zm1NR2c2Z2VmbjhSU3lZY3dWeERPT1czTmFodzFuZXcvMlNaZXUv?=
 =?utf-8?B?eENyMDBIZHVFTzlwTXMwSThaVWYrRVcyUkNUSWxyRVhmTjg0aGg0TnE4NmU3?=
 =?utf-8?B?eHJVN2hrQ3hmME5IcWxIQjZBbnIxS28yWlk2RjFBaWs0eEJRdnRZclFIMit6?=
 =?utf-8?B?aU1taGpMUlQreXZTV3p1ZTM2QjA3S1VjYlFUdWlEN2JIcTdvK2NoRzJlWVBU?=
 =?utf-8?B?M3VkVW0wV0ZzWTJ5UjhNa0hSeTZ5dDhMS3NvRFZ0WHBIUlk3V1g3NGlTbXlr?=
 =?utf-8?B?dHFTSHJwQlllcHdXU3I1cEpqVE9DbXl0T3pqczA2Ung5SHBKbFVUOFZjQ1c2?=
 =?utf-8?B?aXFvbjNLRjhLRVVKaW1zZWhLQlIvM29wY1U2QjZBSWZiK0pKNXFKNnJiclVk?=
 =?utf-8?B?aCtPSEpra2hCVzhJKzgrNjllOXYvaWtoYzI4ejZyeHR5MjR0NTJuSmpVeHFk?=
 =?utf-8?B?Yjl2Wlo0NGxidjFUTVo0eTJyYWNVSHFxckZIWGpFd3JybGRtTEMyOW1sWVdL?=
 =?utf-8?B?WWNwUlduMWxNdFlCZjNVNmV4eUFxZkcwQTkybHpoNUNQUkZONEtkYy9JaFoz?=
 =?utf-8?B?SnF5RVZFTDh5UDFvaEJncjFNeVpQSXRadE5kRS9KK0twQ1hiOGtPa0VnQTNZ?=
 =?utf-8?B?Z2ZwTTkrTkJNSERWSkhYVlBMM1pXMnNMRHZLMDE0MnlqQXZlTnMyUnhYWDlE?=
 =?utf-8?B?SnptS0NySjhiVTMzMHRUc1NRTmthRzY3bzdqTDJNczhiWmZ5NkN0ZTNSOUVu?=
 =?utf-8?B?d2xxREZ4Z3RkbHNGSFhnTDRFY0ZraSswbVhaa3BkV2w5cDhHbXppbjd3YzV1?=
 =?utf-8?B?c201RTVaeDZCS3RYeElGZmYvSzNwd21TNHA1SFFySE10ald0dGFiUFczb3ZB?=
 =?utf-8?B?UmMrVjlSNS96UXFmQ0NCalBORWxlSnlheDNScG1ja0JRQlMzdHhzOStWcFpY?=
 =?utf-8?Q?NDicYaUy6RoYAPZLK3bWbCZMYepgbDDp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bHp6R0wvUDdZd3I4ZUd1VlU0cTRxVHFaNTdmcnEyY1NjWk9MTzRLajRmdGdN?=
 =?utf-8?B?UUpyejVUVnNESjFrckxuaklxUHZSVXJtRDVrcHVKbHRraUFkZmVCcHErUE9i?=
 =?utf-8?B?cTloaE5iQ0ZGYTR3Q3Y1Y0VTdWdOdk1FRzlIWEUrT3I5eVlIYnRBcWRoSG81?=
 =?utf-8?B?Y0lqRHF5aE9zUmpZVXc2TkRyRFlCM0x1UThBcGJyTi82NkR6Y0hHbi9rdlE5?=
 =?utf-8?B?ZFM5TGd4QmdsUFdxeUV2UkU1ODNDZzVzWWJjaWNlMHJyMzV1U3F4aGRrV0I3?=
 =?utf-8?B?SXZ4YjFkdzN3aldlWWhYazFrTjUxUXlOTGM1dUdvSC92L3NBQ0d4ZGhuQm9r?=
 =?utf-8?B?dEVWdkduc2t4TTVjNGVxMTl4TG5oMU9QVzJZQ2ZuT25kQ3EvRE4rcHNpeXRZ?=
 =?utf-8?B?cVFHMUVOa252eXl6ekcyYUNSSkJwREhNWXZQWTNyRWZITnU4R3Q5bjd5bEdF?=
 =?utf-8?B?MVloSE1hS0lVdk9HR3hwcTBhVnR3bXZYeWxUVjN4RFh0ZTdWbit3Vjh6V01h?=
 =?utf-8?B?QUIvaGo2WkNjN2p5TjRPc0NNeis3WEswWGlndzQvNThDYUdyS1FySndMTURr?=
 =?utf-8?B?eC9BMXhJc3RHR3E2b09zNGM0UUR6dmYwUU5JT3FYc3NZSUV4YXRhSEFXRGlv?=
 =?utf-8?B?TTBVK0NkeU42K1lOb1lMSkpyM0pqMzdiV2QycG4zdTRoci9wYitZQXd5dW5N?=
 =?utf-8?B?L2htTlNvSWtNdFJBbHdkNXcxUElVVkNXUE4rY1daaHpHYm5zOVp2QzY2Z3Vz?=
 =?utf-8?B?VXB4ZXUvYUppU2F4UUkwTlFCVFp6dHVmT1pKSnpnWDVQeU0xVXZPVjY2RlVU?=
 =?utf-8?B?bk5vUTdhajVhVEF5YXI4UStvcUhkbS9JUTVCTjBaYXF4RG1PU3JYWEFRZjdh?=
 =?utf-8?B?ZHpEcXh1N01nZHVPUjdTcXJjbHJNcmh4UkcraDljKzJLekVpeERxSEdmNWJZ?=
 =?utf-8?B?QllHQXRHekNNbjhZR1lIL2JlcXBnNHpvYktkeS8zWTdOVk5TTXRESlRYTEwz?=
 =?utf-8?B?TmlNUlJJUHJxOUg0MzNYeUdsbnVGeDlJQVpyYkVONUlWVVVGWkM2ZVJUbVlJ?=
 =?utf-8?B?dXVWM0ZDaE4rL2kzUGtPWHRkZkF5dnhVeW5hZE5Bbk5UMW9kaFpUeE5EZ0lB?=
 =?utf-8?B?WTNEQ2EycXJUTFl5bmU0aDIxcUVINVlaU0FvMS84eE12VTZTQ1l2QXZ1Q3FE?=
 =?utf-8?B?aEllVEhwSVNya0dYYmQ1RFdMVkV6aFB0NEkzQXZNS3dZdWdjZU1taFV0OXFy?=
 =?utf-8?B?OWJibHl3L2NUQjVXcUpnZGs3SXJUWjhvVHh1c1M5ZVg3KzVHTTRpV0pHRGpM?=
 =?utf-8?B?bmUyMDk1RjFtb3RYZE5rK2NtdS9FNk9XaEkyOXdFTzI2WGJSa2V6cmpSV013?=
 =?utf-8?B?cHFBT29YSHQyVXJ6Y1N5Q2RxTEduWUhxMVErbFJGOW9lMFZmRFRhL0NSdm5C?=
 =?utf-8?B?Ym0yYVdEWUNNQmIwN3E3R3ZkM1V0dG90R2w3anFGdlNGL2cxUWhjd010bytJ?=
 =?utf-8?B?ZkVjWmdjZ1dNZ3BmQ0ovTFJjb09JdWtISjBHVlJQYkx3TDVoMlRXeklFS2Js?=
 =?utf-8?B?UUVmeXBVd3pqeXY5WVBCTHdLOERKMWtGRFNrTWlabXJ2TDdvMGdWaGZnL3FB?=
 =?utf-8?B?c1dCcW1YK1MvRS9nUWU0bFM3eTFkQWRlT25VRGZWdEREMHo4M2hsZDdGUjdG?=
 =?utf-8?B?NUxVS05CeElsdUlHU3FCdHBEMzVBZEtId1VkemhsYjZEc3lLaWRFVkRWTENL?=
 =?utf-8?B?L3NQc3l3VXpUbnRxQ1M1SlZVL3FqcmY0NlJxNE9xaXJ4WmYySC9vYklvNWwr?=
 =?utf-8?B?dWY4blRZZ0ZqZnBGSHdxc0E5NllGRk8rRTJnNGdiekEvTWtpMVBRUTFVeFZm?=
 =?utf-8?B?RE9LNnVOeFZUbWhLaGVCZ2pCV2lwcmo4ckh5UGY5ZDJicWtxVDVKS1pZblo2?=
 =?utf-8?B?d3NmSWl0UW5PamV1Y2ZYbWJYNVk0bkRpbzRBQzI1VDFIeFpMZVRYRlBGZE1B?=
 =?utf-8?B?Q1VYZ1VlMDBzNjRxOWl5RDJhYll5eElCcnZhUHFFNFVFSjVPc3dxS1RrN2JU?=
 =?utf-8?B?TmNNKzF3bkZnSFRXS1NVS2ZMenV4bXpKQ05TWXRhL2pNb1J6UHBMdElnVHZL?=
 =?utf-8?B?c09Nd3R3Z3d5VlZxTkpCNWU5K0E0Mk9zSzZ4Q1QyZktTK1ZlcnhOYnZBZlJL?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5af92fe-6e2a-40c8-3b73-08de23a1634d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 17:15:19.7834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sNQBDBpqC4o5cSTkDJIGV2uhXPxqY8zHHWP9Tp7wSo83/XquOxHEJH6pkK2449on0eCzay/bNkZHUGAb9/KDhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4943
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

Quoting priyanka.dandamudi@intel.com (2025-11-13 11:23:04-03:00)
>From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
>
>Add test for the parsing of gt_types_allowed configfs.
>Validate different gt types like primary, media gt types
>and check if it can be set or not. Also try to set invalid values.
>
>Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>`
>---
> tests/intel/xe_configfs.c | 40 +++++++++++++++++++++++++++++++++++++++
> 1 file changed, 40 insertions(+)
>
>diff --git a/tests/intel/xe_configfs.c b/tests/intel/xe_configfs.c
>index 911e18965..85e5c6d51 100644
>--- a/tests/intel/xe_configfs.c
>+++ b/tests/intel/xe_configfs.c
>@@ -149,6 +149,42 @@ static void test_engines_allowed(int configfs_device_=
fd)
>         }
> }
>=20
>+/**
>+ * SUBTEST: gt-types-allowed
>+ * Description: Validate gt_types_allowed attribute
>+ */
>+static void test_gt_types_allowed(int configfs_device_fd)
>+{
>+        static const char *values[] =3D {
>+                "primary,media", "primary", "media", "",

We could include newline-separated input as well:

    "primary\nmedia", "primary\nmedia"

maybe also validate stuff in reverse order:

    "media,primary"

and with trailing separators:

    "primary\n", "media,"

>+        };
>+
>+        static const char *invalid_values[] =3D {
>+                "check",
>+        };
>+
>+        /*
>+         * These only test if gt type parsing is correct, so just make su=
re
>+         * there's no device bound
>+         */
>+        igt_kmod_unbind("xe", bus_addr);
>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(values); i++) {
>+                const char *v =3D values[i];
>+
>+                igt_debug("Writing '%s' to gt_types_allowed\n", v);
>+                igt_assert(igt_sysfs_set(configfs_device_fd, "gt_types_al=
lowed", v));
>+        }
>+        igt_kmod_unbind("xe", bus_addr);

I believe there is no need to call igt_kmod_unbind() again here.

--
Gustavo Sousa

>+
>+        for (size_t i =3D 0; i < ARRAY_SIZE(invalid_values); i++) {
>+                const char *v =3D invalid_values[i];
>+
>+                igt_debug("Writing '%s' to gt_types_allowed\n", v);
>+                igt_assert(!igt_sysfs_set(configfs_device_fd, "gt_types_a=
llowed", v));
>+        }
>+}
>+
> /**
>  * SUBTEST: ctx-restore-post-bb-invalid
>  * Description: Validate ctx_restore_post_bb attribute for invalid values
>@@ -343,6 +379,10 @@ igt_main
>         igt_subtest("engines-allowed")
>                 test_engines_allowed(configfs_device_fd);
>=20
>+        igt_describe("Validate gt_types_allowed");
>+        igt_subtest("gt-types-allowed")
>+                test_gt_types_allowed(configfs_device_fd);
>+
>         igt_describe("Validate ctx_restore_post_bb with invalid options")=
;
>         igt_subtest("ctx-restore-post-bb-invalid")
>                 test_ctx_restore_invalid(configfs_device_fd, "post");
>--=20
>2.43.0
>
