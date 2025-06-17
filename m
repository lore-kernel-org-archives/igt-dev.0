Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8950BC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 03:43:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB9610E49D;
	Tue, 17 Jun 2025 03:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cGOWYp+N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8CC10E49D
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 03:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750131820; x=1781667820;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cTOJd2GMtZcV9nRHy7kRjrM2U3D0THY7XLaLsZ1cRE4=;
 b=cGOWYp+Nr1cV3pF5DtdVfFVgFD5HC8maZAqVDad3p0TkvkInf1FOmrAl
 4cFfzQGb2sXDSdjw8fRcHqr/pz9/301i2/j5BVgu/U5j8kI3e7IMp4e4D
 qX2Q3d6hQ8n3PNDOzzZIz//NpdunxrWGO1ZgNQO6IoQ6Dbb0NRifZFuA8
 HdGBu7fRrWJ/Ggc4nJ9EFH17HT3+KTyAdu2BpOS11yIDn0DYYpGxp0upE
 0lIgAhl7wqa70WPVW1tSCNjMFu9F3H3/fDO0QJT/DuBLvpEodbZU2DvRj
 Ceg0IaSYLUrqejVHTo+qkqRp+JogF66O7Pwl5iIATrff7rp2udDri6MDK g==;
X-CSE-ConnectionGUID: BO/FGHFkRnmKJrOPoblVlA==
X-CSE-MsgGUID: Ap6akYUCTAGI5xz9NHmcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52273792"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="52273792"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:43:39 -0700
X-CSE-ConnectionGUID: wXCdGruBRfeYflNcljSe0A==
X-CSE-MsgGUID: DRLV/xYcRPqPSdI0FYwivw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="153613927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 20:43:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:43:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 20:43:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 20:43:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdlq7jOr55qv5tmnLpJTobmDzWxB9Y0SMoohePy4ssyKjDxbB2rGTjDo1992EX7CgIJkMKoABOlHKusdYlVCLJCO/KKhauolo4PGne9be1ipkuiTcPtMavJCaXenI5t9k1ysk/I7NxUkNfIkU6dOjJt6PL0tgxXEcX1P9+UPnUhVbQ95jpRmC2hoAmM5iGd4+dUzBFvUdDKqmLA4D9y7ueSFDeswqtdAhdL+NjwV9b7y4GIKkc5JAU3uSTYCsMWRJXzuZ5j9IqKzXvc7cc/nGPChAKENmvNopeFnJwSB2X7YHYgJVrlPaocpBQyadG/p8JzdMFS1jfzGqXv/fmUEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1Wyicy2AIbwCThRuE5NlyMoRKMIEQtkNkIwAoq3UGY=;
 b=c1l1xPSHjpQtBtSpMF+VI1Ugei4LMnPQiagDcRtwAOHHAEjNmsfGEoyqCb2f9H9FSEJETxD7e6XiJwcVJ2V/MbeGLTzWrwEib/UQDlvmkdfM94ejzBrnCEteboZNKMaBK1FZWTXNXMJcNZ9ZGJBrEPmvd/NuGNygJ5xUz5Kg2KFyyVWMrrZ4jHc9o+akkLL6sIhUx+CqxoyCOltGr9bQIgsAeryVtNRYhLC5rQDY2UXp/rbh5Vmv3IIY/Fu/qHTwgn1+rlmgTJuf3lsx2CrXPDFBBALX1etgY/VOUwTetW9dO+PVzMCNgiSRYopKb53rotozWFTCea9aP6UjyvkzEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Tue, 17 Jun
 2025 03:43:35 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8769.029; Tue, 17 Jun 2025
 03:43:34 +0000
Message-ID: <017c1445-b316-4aaa-a869-62c8be7299d5@intel.com>
Date: Tue, 17 Jun 2025 09:13:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/5] tests/kms_flip: Modify check_state to return
 true on unexpected sequence
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <uma.shankar@intel.com>
References: <20250616063831.3332042-1-ramanaidu.naladala@intel.com>
 <20250616063831.3332042-3-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250616063831.3332042-3-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0032.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::19) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|LV8PR11MB8680:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c4a81b1-dd87-49a7-2076-08ddad5122cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0wwdGdVekhpNjdkN01tYkdXWGJlMnF3OE5jOVVJZmE5U3EyN1ZjM2w0VU1r?=
 =?utf-8?B?dElkekVMOC83N2lZNzJCRStYaG5ibFF0SVBveVpUUVlsQkVuU0pmeTdGcGVy?=
 =?utf-8?B?TkVUQVArenV4Q09WWFI5NEFIRSs1c2NtekI4cWpyRklRd1doVCtQaHNSamY1?=
 =?utf-8?B?QXJOb0FzQUFLUUZ2WW5CdjZRZHdCRncveFF3eXhzUUdMVWUxMUJUekoxOWZL?=
 =?utf-8?B?bTFqV3FRVVhJSWs5akZESm9iMG5YeUpqbHA1T2x6OXpiU0RMWDBrNzBhTmRS?=
 =?utf-8?B?M1JtUnF5dXM1WkdXVUV1MlllL1VkcW1pektuYWtJb0xabjRySEhRY1lWbXpR?=
 =?utf-8?B?NHdvRmJlRGhtVzFsUU1lNGxhSVpWWEZnd2ZibUhQNlFTSHlEUW1Kb3BpSURU?=
 =?utf-8?B?eGRoK3BaYnVIeXE1ZDhrL1k4VUhlSjNRaVpKam1WcVJBZ0F5S1VQek5FcDB3?=
 =?utf-8?B?RnBZcE1uZXh6bkJla3lTdWVqaEdrQUs4bmpkdUU1bEhxMFV6T0ZwNmQvdFZM?=
 =?utf-8?B?SWlOMHBnSXhQV2lRcjRabDBiOXdick1XVmFLOFhlek40aW5ybzZvalcxR1B5?=
 =?utf-8?B?cTRBbUEweFhGUGtqV3Nqd0xEZnRHOE9hcVNLcTFtOGNOTDV6RzcrTUk2bUk1?=
 =?utf-8?B?aGwxQ3N1dk9mbFZlcTQ5VEU0eTRKWEowSlJwOVZvNDRqc09walFZKzJ6cjJJ?=
 =?utf-8?B?UVRvYWxiRndxL0VQeXFTKzBKY1pqcGNTMUpEZjNVN1Z2Ym1neEg2TGo2b3RD?=
 =?utf-8?B?UnNuWW1RRm5IYVNiZytIbDRaYmluWEdZQmlpT054QVZSOEVwKy9yVWExOG9o?=
 =?utf-8?B?RGZ4eVRSZjdtaXRuRWtnZnZwK0VkY25LN2tpbHNUZUVrbUM4ZkxEVDJ1S0hn?=
 =?utf-8?B?OHpmbzdwNGFuRFlTN1ZWN0dxbFBReHRZYWVmbUJTUytPNWJneEFPRmVsY3po?=
 =?utf-8?B?d1hwdjRSeGlUVWtEcGYweVlpS2Y1SGJpL1BMb0JBWXQ0ZU92dDBPWE1JRURK?=
 =?utf-8?B?bTBHUUVLN3Jhc05FT05yWXNRbWg0WTltajQ3ZXhZTm53SEVDeC9pdUsxTm9P?=
 =?utf-8?B?QWRTblIzUFVEa05OT1VHT29OWFRsS2QvTjN0Mm5sK1M3UjZhTnI0SlJPZnlq?=
 =?utf-8?B?eVRSbUo1Rk9GVWd0cUZhaTl5M1Y3Qk1CaDMzL0h3bmxMM1FSUjF6V0QvUzhL?=
 =?utf-8?B?L0Y4NTFKNkV4dVZPUmlFMURXY3dCMzJCcXBxVnE4eFdrdU0zdzBwamhhN2tw?=
 =?utf-8?B?aHJpbUdOMGVEa2VqdHhkVGo4UTFkYWxjU0FiampZRVNiam1pZmo4cFJ6QjJT?=
 =?utf-8?B?NVlUUUM4S1BNY3N5dzU0OVZkbEY0OVlEL3J1K0lVR2FtZmJPbjkvVEYyWVhQ?=
 =?utf-8?B?TWxuNERtaUlkUTV4N2dvNHpQYXZYU2FtcEErblRVSzBtcm5RdEEvZXdYS2tU?=
 =?utf-8?B?QzBqc243aktZbjZycDJRNTg4YlZMNTk5VWxKK0Y1aUViR3kvQzZ2SHpIMjRv?=
 =?utf-8?B?UVlDRTkxaXU3ZnhJb1p0NHYwaU5vVlgwOXIybDhvUXFCdWVHdGRoMVFYam5T?=
 =?utf-8?B?b1lNbWtvZ3l5NnZVVy95em9OMVk1U0ZkUWpBYkVDa01LTDlYNUM1c21vLzFs?=
 =?utf-8?B?Y0grc0JmYm5nQmFNV2tnVllkdkUwMkNlVkc2OFV5RCtVbjlGcUt5V2xTR3Mz?=
 =?utf-8?B?cEhyTHVhczdySjlONUM5ZWxza3ZvenlONUxBUXFZL1JacUZXQzg1Z3pvS1ZX?=
 =?utf-8?B?S2pxNmdoU3lHRWpid1B0UHFzUHRjU2gvYk5YenpIcGJmbFJaUGQ2UnR4eDF4?=
 =?utf-8?B?UFpVVmlhL2N2WkpkaXl6WVNLdjIxRW9UQkxGSUVQSDNVQlFwd2tKMWYybVVS?=
 =?utf-8?B?bUdPemNHdTJNQUZ6T2pHSXlIREhhcmprYUJhZU1NN04zTjNEN0lrWnlBdlVx?=
 =?utf-8?Q?Tl06C/+VHSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRKSG5BSmNFaWJ0WlBKL2xQbVFwK0plWTdnQjVaazhZNzBGdDE0blQ4ZzEr?=
 =?utf-8?B?NloyNk9CTUMrdENiUisvdEVSNGppbm0rM3krS3BUbHZRNFpIWEhzSm9TODZY?=
 =?utf-8?B?azlkNjVQcTl1c010dE5zZkNEMW56YUpTem5BTU1YU2J6aDVwVVlJSmRWSEZk?=
 =?utf-8?B?RXY3Qkw4YW9pN1psMDJmM3pGSW9jM1pzVDA4VUlXdER6MHgyY2pPVW9HKzZL?=
 =?utf-8?B?aVltTG1VWWYxYmhlZ1BRb1dBTmh1akxoTDc5VGJpSHY4R2ZMNkp6M2Q4cGdM?=
 =?utf-8?B?NmJYWE13cUtRTUVLQzVVN3RzU2RiK3FtNmFiajVWSWpMeTZ6d2Z4RFcxSEF2?=
 =?utf-8?B?SWdwTG9oNDZ0SzFHdXh2d0YzVzZYby93ZTNXbGRKN2NCOGZXNDlaOXV1TDcx?=
 =?utf-8?B?VHMxN0VubGdtRnhaNXI5czltRGxjWjUvSlBYMXE3SnMzbEN5b2Q4SXVPMVFT?=
 =?utf-8?B?QzhnMUdWcVlSbk1UTmlPY0xWYjQwejl4REVwVUsxYVRzYmZkOGhOa1JacWtW?=
 =?utf-8?B?V1Z2VE5xSWpDMXZEZ3RXaEVWaHU0UTAzR0dYd0Naa1c3M2hHK28xYXY2REJ5?=
 =?utf-8?B?SWtpV2M3MFhYRFU3blZHUm53UTczMW1SdHJ3MTJNTCtGYThNazBLaUVKSE05?=
 =?utf-8?B?RmtxajAwejI3TWQ5dEFUM3BwTWs0Q0grSHdheHMrSGhHd0VxZTB2NGpUZlNk?=
 =?utf-8?B?T0JjQnJyWEY2WktkQTM1R0VsVFg4cENydXlKNzk0MUJUOW8wZ2dldGNIMmtP?=
 =?utf-8?B?Qm1xSkNxK05ST1dOUU5GSXFTNGtlQlRUL2JsVWxLV0g0WmlIWk41TE1TRktW?=
 =?utf-8?B?MXZJM3cvOTJMWGlxTEpqL0c4Tk5mbzg1RlNoNGo2TmVoRTJtUFZqOEIyTUQ5?=
 =?utf-8?B?aVBoM2E3Y1Eza2JRZ3pHZlpXL2E0WWVtQUZHOXFLeDRjN2Y0RXBMaUtFcFI1?=
 =?utf-8?B?Y1Q3WnF1ak9pWnFqUU1Jc1luUE50U1lFUFFkV2tHQXg1MWpINVcwTXd5ZkRw?=
 =?utf-8?B?NFgrUFZ5NTJMNnUrRFdyaUxMV0NDYXNETEtoaUt4K3Q3NHFDVExwaFBlM2V6?=
 =?utf-8?B?a2EvMDFGTHNadHI4bzVQekhXZzBFYUNES0RKd0dmcFZvU0NpcXBiUUxwVWZ1?=
 =?utf-8?B?MW00WXhHYTQzKys2by9tNVIvUkdhaE50WExEaVJEa3BhYkRONzFKR1pnVFJv?=
 =?utf-8?B?aUp4TUhLMjhVdHA0T3ZvRXNxU3lmSjMxTlNsTGRNTmt2ODE4cDVKbW45QmJh?=
 =?utf-8?B?d2lDem5mUHpyVUJlQWRDUlJOaDRQV0lIaWEzMUNjZ25HSmxTWFVzd09XdEg2?=
 =?utf-8?B?Q2lqU2lPZU9wa3BneFVIRTUzYUtpM2JrR0VFRVNSRkVwWDZjNjBhc2ZYWUFq?=
 =?utf-8?B?VzVlRld0KzFidGdWYWhENTIwRlI5Zm1RZjBBY29UTzdGekxOSU1aYzdpSTN6?=
 =?utf-8?B?UVZqTElPaUpRd0Q0SlF3S2lQdzd6UW44aGIxNmhpYzdrNVR6WTZQU0Y3WTFZ?=
 =?utf-8?B?VkJEMytra0JPNlVOc05TMXpmUFBCU0FvbDhVSk1TVis5dFRqalhrTFFvZ1pC?=
 =?utf-8?B?WnVMS3EvLytncWU4ajBROUpzb0Zmem9VUlViTmllcGxTbENvMUJ1VDYyMklv?=
 =?utf-8?B?Wk5LL21OTFJtWEtQLzI5RnRKT3dicFpya0FLUCt6Sm5RMStRU3RLZTFjOHp4?=
 =?utf-8?B?ajdBbER5RGR3dlR5Y1dhNmRyWXRIMHdsTXFaR1ZJTlFxOEdwaGNjK1ozZHhZ?=
 =?utf-8?B?TEhqTE9zd3hNdWw1ekY0MXFNbUg5TCt5TE9lcm9YcHk3Yno1dVNFcGk1ZHVM?=
 =?utf-8?B?amh1dmhtSFgxMGxsVDQrWGlZTDBUb0IyU3ZUbEFjdmtYelRLcVJEc2g4MHpC?=
 =?utf-8?B?MmR4cUxXbkhTQXc2ZjZTdHpJVGJ3cEZyYzY2Z3hGQWttV2xxdFR5alZMbEVy?=
 =?utf-8?B?R3N1YkZIUms0aFZwVW02OXBXeU1VZFFuUFgwUzJPdjZCV3V5bTNpeDRsbFZt?=
 =?utf-8?B?Q0tWbzEwVWhjRHBzRTBOekRnUnE4NldNUDZ3Y1JESTB5cTVFWm5PdDhrWlFV?=
 =?utf-8?B?aWYwTlhtNnhCaGZiZmtHOVNUWmFwb0R6UytmU2RqR21UeVNnRW1uaVBBOGVG?=
 =?utf-8?Q?qFSxAWVoITgQVukaR9sWy0AV7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c4a81b1-dd87-49a7-2076-08ddad5122cc
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 03:43:34.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+wjv4CheWxYSpkp0Db0ZoIJaFxQh99yiIhRopwJjW07kfDYrNWHGujhh3N2bPQyR2j/8EiAYHX6m3elmG34jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
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

I feel it would be better to combine this with patch 4 of the series as 
that justifies changing the return from 'false' to 'true'

Thanks,
Karthik.B.S


On 6/16/2025 12:08 PM, Naladala Ramanaidu wrote:
> Ensure function execution continues despite unexpected sequences
> or timestamps due to shorter frame times in higher refresh rate
> panels.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_flip.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/kms_flip.c b/tests/kms_flip.c
> index ca31ef7dd..2328259ba 100755
> --- a/tests/kms_flip.c
> +++ b/tests/kms_flip.c
> @@ -706,7 +706,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   	    es->current_seq - (es->last_seq + o->seq_step) > 1UL << 23) {
>   		igt_debug("unexpected %s seq %u, should be >= %u\n",
>   			  es->name, es->current_seq, es->last_seq + o->seq_step);
> -		return false;
> +		return true;
>   	}
>   
>   	if (o->flags & TEST_CHECK_TS) {
> @@ -736,7 +736,7 @@ static bool check_state(const struct test_output *o, const struct event_state *e
>   				  es->name, es->current_seq,
>   				  es->last_seq + o->seq_step);
>   
> -			return false;
> +			return true;
>   		}
>   	}
>   
