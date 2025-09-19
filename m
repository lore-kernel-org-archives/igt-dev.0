Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD05CA1013
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:22:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F4F210E0F8;
	Fri, 19 Sep 2025 03:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h7zugXUK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4BC10E0F8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758252141; x=1789788141;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MxXxZnMQUWQyTvjLLUa8UgpBiPO/DvBMp2zdgwWXaf8=;
 b=h7zugXUK6aVXeY0FFUfsBXIFO9xdl3M8bbKNzAVkaOMfHsDENACmoP2+
 UxuRTBVAr2e5oBOWublNTYZMgKKDdogwHQj8TqNC6OfweT5VSlIB7F42d
 XH1h6SZ+QjxW4OPADY25Tlqn09k6QsAkPlFOp0mi8HQMhrTAuUOCTd5he
 Pwgw6du7CQ6uGZTZ5org2tNdcXNsjicBa1b78D4Gi7c03ifG1mtoCYEE8
 f8mBNxF3ZxAop2sUtn9C8tdAmbS7qAMPWTACSpxCpcELYDxDiis/KCelL
 eJcoC20am4rBuB5WUslZcg2QcQdc8MCeCJedGDs/ze9sjcqzQwkVMsy0x Q==;
X-CSE-ConnectionGUID: RM4fKNn2RAKjfrGIAVDxyA==
X-CSE-MsgGUID: PL4ROSJEQjWW6t8BlvzWRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71969405"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="71969405"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:22:20 -0700
X-CSE-ConnectionGUID: Bmoz9vjJTl6V1G8MZoq/6A==
X-CSE-MsgGUID: FQGvWmMqQWOSkG8QNEGTgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="179730326"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:22:20 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 20:22:19 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 18 Sep 2025 20:22:19 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 20:22:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SP0j4X862PK3SPbDos0BhXVqEA1JkMb++GRgC2WYYKXlUCSywN7zuWmZwTN29KpLgPUHacn/WTFBQKKpNWUwsA/RxSKozzS8bKBkR988G/j9oxyn9kFo5VjeI8gN1VXewyyeYIBlt+5/vcUVVQxFI9NiNdPYmmXtaTy0PMy7oUBHTNFcdoz31SJ5qvJT+VAeYLv9t6EwOueYb/kUtEq8kud+3EIpmU1ElUVV3KkISIEwBHEVgvqLgmRmXN9OL/E0B1CfMmL1sD4MBMlQSOFqFUr+y9ht0rHwRON8nb9hyig97nwPNOsWngKvbBBLhSdy5/yEsF97ZrlqyL2GLv6Xhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOXptsyKatBaOYQxnFNDJv8oJ0s2JYFQo6eqvHtp+g8=;
 b=R6I0kF7oh5c8mQhFn3BRNJSkNQIs2h+pl551be2BmoSp1LkhggDzmyV1e/bXfAdGAyAdAAeN0p+sTrHEgCJ0jH9W3Bt3LP1xy6h1N7mA0zo8JmViwM8ZyDmGFEbH3IhUHeLUCYbHyiu0njCuQBfYni5G5DfqiUgMaMdRdmxZHDE1KeGZx+gNw3jb8TrqVy79m5BBrw1BALNNPZAXkllFxei7u/qcK/T4o0Kl6zfahfj/7XobA1VcZg3ku1a2Dmb3doAfV7ulZYKDdgeAph1iNQvRK+jVlelwOE/pDwVFFgFZreodEjv+C2nw8JjpE0oUOwzI7f41La2VmIOpsYDB7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SN7PR11MB6656.namprd11.prod.outlook.com (2603:10b6:806:26e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.23; Fri, 19 Sep
 2025 03:22:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 03:22:11 +0000
Message-ID: <b95fdda6-6f08-445b-a1cf-6c5613a16505@intel.com>
Date: Fri, 19 Sep 2025 08:52:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_pm_rpm: Add system suspend
 freeze test case
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Mohammed Thasleem
 <mohammed.thasleem@intel.com>, <igt-dev@lists.freedesktop.org>, Swati Sharma
 <swati2.sharma@intel.com>
References: <20250918105709.25093-1-mohammed.thasleem@intel.com>
 <20250918105709.25093-2-mohammed.thasleem@intel.com>
 <20250918130608.jq6mbuepr4gmjt2p@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250918130608.jq6mbuepr4gmjt2p@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SN7PR11MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: f9cfa839-ea38-4a47-143e-08ddf72bb8a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|42112799006|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q05wM2FUME1QUUVlSGtEYXh5emRpQXhNbTl1bkRIaUVkWUxPRExqM0ttSk8z?=
 =?utf-8?B?M3B1OVRUc280aTJPNTJLTk5MQUZWZHg0aGJnOVNvQ0ZXcjIzVldCc25LbFhm?=
 =?utf-8?B?SDR0MjErVUVCb1ZFUHpaaUtPUHRTZWIyYkFsdFIzTWJtcm0xWmJlNG5yUE5J?=
 =?utf-8?B?U2UvNUN3Um5SbXN5S0M4azh0N0VZazFsbldEMlVYRHZkSlcxNHdPRkJoYmpO?=
 =?utf-8?B?UXdJWTFTQzl0ZHdrK0lOYjQxVW1zdjcwZFFMbkxLRkxzSWU5QUFnZnkrcEo3?=
 =?utf-8?B?REd6WlFsNTFxTmNWdklWdlA2UG5JaHdJOThjS3ZQYUkySnVoU2JaN01Ic0tI?=
 =?utf-8?B?NTdkdDlNcFJXYXd5dmpRT0FrQUNTdlJ6M2djeUxPQXdBYnRnMFZic1Y4a0xu?=
 =?utf-8?B?SWxlOFBJQTE5TktnQ1JraU9mN280UTRNR1gvSTZtMGVna2FEQmRQTTRuc05J?=
 =?utf-8?B?MEZTeEpBWnNGbTdkQjc2cDR1bjRka3R3WEFIQ1pVV0NuVlJwSFBMb1pBYUlu?=
 =?utf-8?B?Tll3WU41Q0t0ajFURktGRm9XV2hZc3dydGZHaTZsWEVXYkFHSktrK2JXM0xi?=
 =?utf-8?B?WFNjMDRPekdSTmZXR3ZGUlErbG8yNjVobEN4VDBGczdTSzNITnVIdGsxa2Yw?=
 =?utf-8?B?MURSRkI2enJlQnh3Ri9YWGZZUVFxNXRRQnpvK3VZVldVdVUxK2tNYlluNHVG?=
 =?utf-8?B?VlVUVnZsV1lwYk54SHoxNEhxNWVZWHF5NXpoSVpoV3ZEc2t0TGc5NkFtTGIy?=
 =?utf-8?B?TzdYdnV4MHAwQnRqL092RFV1c204dFJiUC9qbnlWRzVRODV4bTM5WUNqeWx3?=
 =?utf-8?B?SlMvcTRydUJNUHV2cHVrV1daNmdwN0NqRDAwWUwyN3M2bTQwS0tSck9FdUwy?=
 =?utf-8?B?a3YwKzNHaDRZTjVOSFI4dW5na2FmOUhQTVpnMmVsYlBTcWtjVE81NGkrdmd2?=
 =?utf-8?B?eGNvZFJSY3k4SUdDNlJINm1VVVR5QVpJZHB3VHBGbmdqOFF0NlBNdkI5NEgx?=
 =?utf-8?B?eUFtbVl5K2RWNGRmWkdBUU1nS05id2EzTENzMDZacDFiYlNNNmRBN1ZRNEdj?=
 =?utf-8?B?R1BMT2ZBVHZSSGpRS0NpOHNrRFptZkZRSmQrNDdBeHZPcmNvTWpqd3F2dDBi?=
 =?utf-8?B?REVYZlpEM1lpcTNoZStLcnFsWENWTFdKSUNQRElmUlFLVWxRTkJ6eFY2czYr?=
 =?utf-8?B?L3BhT0p3SWZaMU1ZWFRTL2NuU3lod1JzUXlZK3ZaRnZXbzlicW9BOS8rbnBP?=
 =?utf-8?B?Unp1bVh4WDREbG5OMnZXeWRFYTQ0VDEvckZhVEd3eXEyUUZpRmpuN05vQ09u?=
 =?utf-8?B?aGRpRkFlRlA0NndMRkVnYVVObHUybXhKL0kxS2FzOFphUENlZlJQNVgrcmZ2?=
 =?utf-8?B?QnFoeHkwbWNhbHpVY2ZJYTZiMHEybWdMQjFDSUI3QVRLK01jTlorNnh0Q0xm?=
 =?utf-8?B?NzZiQURwbExlTGZ0TTNlL2FDek40cURhNkZvOTRzT2s1Q0ZlZ2ZPaHhQeDhr?=
 =?utf-8?B?NmVIMmJPeWN5ZFNTSUlNWmFQMTFTREQ3Qk02OExpWHovUXBuUiswWFE0cFp4?=
 =?utf-8?B?SmpscEVqNjRMaTVHMlVMMHBLMkxiYVVwWDh4bjZLK3pNQ0UrUXJrMzEyTm80?=
 =?utf-8?B?Q1ZPRjZsNi9VSFRuWnM1RmQyNVJvZE0vUEhiUFpPOTUxZms5TzFKbFZzRzI1?=
 =?utf-8?B?UGdrQ3FZSVMzQ1UybDZtNjEvVWVZc09TWmNqa3kzMHlVMElEQ3pKM0hMZzRY?=
 =?utf-8?B?ZDN4OVord2dpdThZdCtPNzRacnNyVTVvMjZudzhFV1Q3dkdueGJ5Z3k2bHZ0?=
 =?utf-8?B?S3ZqTkIwUUp6WTdETGFHOTJvdHcrSExjZmxpZ01kTEg2RWlKWUZESGZBbUdw?=
 =?utf-8?B?NzZOeHhyU3hVM3RZUlFJTlpWNmVKbFNERzdxVDUvUnBvV3JnYkFSYUV6RkVU?=
 =?utf-8?Q?FzO7NnNDwA8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Znl5ZktXWmJwMlBrZENFbEpHa3dMMlhhb0VqUU1STEtub2RnSXV6dzhaclcv?=
 =?utf-8?B?T25vVFNPK2s1cTBaOXdIVktWTjFwUURLZUtpd29WbXBuSysrZ01mQmRuYXRC?=
 =?utf-8?B?aEpFME43SHB0TEJWZzU4cjY0VUQ1cUF4V3NrazRoQmZuUWc2Q2JFNlBtUDZz?=
 =?utf-8?B?MGlJVDRvRXdhWjY0YXVZMUNIai9PMHdCaVptcVlyRWkrcnJUVVZzcnNBcVQz?=
 =?utf-8?B?ZTUyRWxENVdXS0IrQnBYUkx0T0NxRDFnKzQwQTlCQkd5M3FMWXQwVzZiUlVH?=
 =?utf-8?B?UlVBUnU5cmM2S1NQT3MxUEFBUTFqYmdSS21HeTBhN0xvbzhnckh1cHk0b0Fy?=
 =?utf-8?B?dkVRRUIrRG11L1dRUVVjZXJzRE5QSDlidUE1aTVmVlVjTTVNanIvRFFMbjln?=
 =?utf-8?B?MlF1RWdBNUJOZ3pONWd2QjRwOG10c0VDdE5IUm83Qm9vUTVXbVQrZkQxYzZU?=
 =?utf-8?B?ZTgxVHlodkhuNk1UTmIySTJVeFd3WVVnZXNxWk5pQkxiNXpmWmNBa0hZWitX?=
 =?utf-8?B?VHE4RHZpaWk4UTltWmNHbWYzL29hb2lVNnVoM2pwUTJKdUJQUWlIQnJ3dGpC?=
 =?utf-8?B?WXZ4S21qbXFsbTlDTURPZWhSTTJLNGovSkNCQk1ySDM0TUEvWGZ0UzNGUUxD?=
 =?utf-8?B?K29GMSs5OFFHcGlsV25zZXVXUCs2TnBBdGFhOWJQOENZWW9MUitIeklhcE5j?=
 =?utf-8?B?QmJqZXhVUVhaM2dzZ2t3dFJQZkJWSWV6Y2dyMnhGNlQ5QzFlSHVqcmxBRXJ2?=
 =?utf-8?B?TmZwM1psdDhEQmNST2NqSlJkei9CZVNsbWlqM21yTEpMS1RSYzgzS2h2Z21G?=
 =?utf-8?B?U2pxNVUyM1lna0l0SE1hRjc3Qm13M3FtbWJrY2lyZkR3dmFZMC93Um05R1NH?=
 =?utf-8?B?MlVvbkhla1ZpU2VsTEhpb0VDdU9PRHU2UmN3TFR4SzBGaTNtMW12TzArU0Nx?=
 =?utf-8?B?dlA0L3pNUVd1MHVwU3Zncm9xV1VNbUtiUzZXdlBBTmhSRnhscEVjS01Od2k1?=
 =?utf-8?B?RFJ3UCtWd3NVV3VQMVMrTGRCelUyQzJaa0xkS2tabmd5OXVtcDZEVFdnWGdx?=
 =?utf-8?B?ZHMyYWpOVVk1T0FRd0dBZXhqWkVCaTBwZlpXT3U5ODdEL2dyaTJMSVdReGR0?=
 =?utf-8?B?UUxyenhIRXdmMlFWYjNuZ2tWV1pKaGZXckdpRWNxdmdnMnFoS296SHRjQThO?=
 =?utf-8?B?Qm9XcnhNMXh5VXc2bDBETG1ONEJjR3VKUWVpM0JSeXZEMVJuMC85YUFLRnVQ?=
 =?utf-8?B?YkJqWlJSYjFrYmlXdVJLUEQxZGV2MkNiYzI4VFBJd1R0ZUtCS1RjWHUzQzNF?=
 =?utf-8?B?UnJ1ZWdkSzBKT3JNdG83L29YU1NqbnM5WjJmLytJbjZOODc2RHNrVDIxb21m?=
 =?utf-8?B?NDRIalVKaS9SbkF1ZkhrM1kzM015MjJjdVFhMkhHTlVQa0lRK0h0L1lIYmpJ?=
 =?utf-8?B?cm5pZXdPd1JwVU1Hbk01YWJlY2NmSlZFMi9SdVRvRUx5ZzErN3U4RmEyZDZZ?=
 =?utf-8?B?Q2ptU0oySXh4L1dpK2Jsb3ZJUm1UWUMxMUhiQS9qaGFNYnRDUnd0THlDbnNi?=
 =?utf-8?B?VFo2T2FMc0p4VWNrMmRqbHJ5d2pTdytRN1N5TzdMODdFdVRXVi9jbXhSUkRT?=
 =?utf-8?B?YTFob0FDaDQzY25lUDZva3VHWGpramZHYXNnN2czKytyUTJZeVJwaVlsYXFZ?=
 =?utf-8?B?M1FaVmVBb3RhUlRlQjBzTnVaY0JCL29LTWRJL3ZDa2g2T0h4dzdVT2NReDNI?=
 =?utf-8?B?aHJwNy9aRFJRYlhURUdaSEduaU5iT1BrdnZhT3N6OFF4cjJ4VksyUzE1TWhx?=
 =?utf-8?B?N3FvUEs2YlU3NTdJVE9wYTR4WUlXSHJIQ29zcmRZT2Zvb3V4MGxkTmFzQUQw?=
 =?utf-8?B?NVl0L3ZSOG9BZ1IxbFN6WHI5TU1ycld5akZjYU1GZTFEZWFYZ0drM3RrcUlL?=
 =?utf-8?B?TGhBQ1dXdllXNDZuc0s4ZHZQd3hHMGxtbXEwQklYR2xTeVo2NWk0UlBkQ3F1?=
 =?utf-8?B?djYyZXpjNEI3UmtjQ0U2Q3VLcWVzU043N0V2Y2lDUDBCc2U5aEdFc3VteXJa?=
 =?utf-8?B?QTdyWDJvZzVPZXZWalFHTzdmQzdSdDFjaW1TOWRGdVAwSjNYSVByYjBiWXBF?=
 =?utf-8?Q?C8ueD66F9/AGOv2m/UbqCBWYN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9cfa839-ea38-4a47-143e-08ddf72bb8a9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:22:11.4924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YAPRbLvISLivnp5aEwFt1om9fnrI6/aGKxnFDpidQcvBaUj7oyU5kHgQ12BasD/kpQ89VT2uI24nlyzCe67XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6656
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

Hi,

On 9/18/2025 6:36 PM, Kamil Konieczny wrote:
> Hi Mohammed,
> On 2025-09-18 at 16:27:09 +0530, Mohammed Thasleem wrote:
>> Added a new subtest that tests S0ix (suspend-to-idle/freeze state)
>> functionality using SUSPEND_STATE_FREEZE.
>>
>> This expands power management test coverage to include modern low-power
>> idle states for comprehensive suspend testing.
>>
>> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
>> ---
>>   tests/intel/kms_pm_rpm.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/tests/intel/kms_pm_rpm.c b/tests/intel/kms_pm_rpm.c
>> index 344ef8c94..3a91eda89 100644
>> --- a/tests/intel/kms_pm_rpm.c
>> +++ b/tests/intel/kms_pm_rpm.c
>> @@ -1685,6 +1685,9 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
>>   	igt_subtest("system-suspend-modeset")
>>   		system_suspend_modeset_subtest(SUSPEND_STATE_MEM,
>>   					       SUSPEND_TEST_NONE);
>> +	igt_subtest("system-suspend-freeze")
> Looks ok but maybe it should be named system-suspend-modeset-freeze?
> Or system-suspend-idle-modeset and rename old one to
> system-suspend-mem-modeset?

I agree on this and I would vote for the second option. Together please 
add description for the new subtest.

Also, any particular reason we're choosing to only use only 
'SUSPEND_STATE_FREEZE' and 'SUSPEND_STATE_MEM'? Should we just loop 
through all the possible states in 'igt_suspend_state()' so that it 
would give a basic coverage for all of them?

Regards,
Karthik.B.S
>
> +cc Swati and Karthik
>
> Regards,
> Kamil
>
>> +		system_suspend_modeset_subtest(SUSPEND_STATE_FREEZE,
>> +					       SUSPEND_TEST_NONE);
>>   
>>   	/* power-wake reference tests */
>>   	igt_subtest("pm-tiling") {
>> -- 
>> 2.25.1
>>
