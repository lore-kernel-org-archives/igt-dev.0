Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A14C3ABB6
	for <igt-dev@archiver.kernel.org>; Mon,  5 May 2025 09:10:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5472C10E398;
	Mon,  5 May 2025 09:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LxBp8ojN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF7810E398
 for <igt-dev@lists.freedesktop.org>; Mon,  5 May 2025 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746436203; x=1777972203;
 h=message-id:date:subject:references:to:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=eHCcmzt331C+pyibQJXmY4XJtK/GnjNZ/ByrsywkCuQ=;
 b=LxBp8ojNncqMChABNMzR9ncj4dw/vX068yYnExlN/3i+H7UY2DSkV/Nd
 e4T2TXAUJWEs5IW+Pbzjm1YcGTIZWs6VoExLKU3O+gPYNF/XIksEQnthc
 Bjcv5atudLteZZK+196PGV0n8zNwOr4sQ/I+wLI/eyKACSQsda10hgJxZ
 efkMHC04h09+yPXELFt56CKrPdBHCxBzMUdMn4hIwC9nXRg6TYEFxDCcx
 /2G8KJwcogbwqnsJGo76a9KsHWf78xDf/PhBC0grPsde8Hqb2f0XO/3fE
 H1CNsXps5rl4GnTwIcJ6+W6cGLvZcAwnjp58ByNuExkrQEVk712T3ObZY w==;
X-CSE-ConnectionGUID: tZVYALCjQRuZlzVwx5NUrg==
X-CSE-MsgGUID: U02LgHzqQEi8rcJQIbrXqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="58243422"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="58243422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 02:10:03 -0700
X-CSE-ConnectionGUID: daZknaBFS4aTmHDSmLAPaQ==
X-CSE-MsgGUID: J58j2ykwSXu9tYUPoLFIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208";a="135715256"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 02:10:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 02:10:02 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 02:10:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 02:10:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOY14ChUWLSEfR/uINwAv/v0J3D9SlxKu0949PKt3XMd2oVxSQzuaUrZ0HXDBIrxjVKTBFBT47HGSdNUXfD17Uta16D2b0LgPCoQXykr1x2pEMlOLyKknz1jOOIIT/eD7LCReTfa3F6y7Nxqi2ak1qj6r155JmHLNNei4bb9aCKVZtr3zE5oIdmxlyEtqlF/RVxO4/SUp0W6uKmOPKLf/gTp50olWC/DVTz76m4gAKuseADn00i+1gTtJum229YfN7V+p+SK4dKO8CgBbIaLLsMH0zSl/FLlzhY/rgAqk1Nr/WX13kVjJOHIy2AOq5zHOJ2XGwZmqRd4UFABhmR/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1ujtqAPLr5UTIZkB5iFWSl/2pydF/RH3Wd8lEhcx3w=;
 b=dTI07VgRKfS0+zcVgs//QCRQ35B/VD7N/hRcy4Sa1gvuMa4/ZXnjfkaJuvpMCV1mX73+aw48Qut+oOo9ThlRL0W+zbnr5rC+O84fq50M7odmYcDGicNvM7/ttIqFXEP/6rwCHv9TDt2c6p/qA3Bh+NeyfbFdF7hFFSTxWC4fnTS5j9LFlYv6893FZb7ffSnI0OUwJ4MwGoAiStHWhhobdI3ur0OlOkh+M/X6HhGakUup+63MBF0K7sqtwSvTQ4Yr0dxpaATZ9KFau7yZQDXbQvmYxRmk60yHkzXMEoZz/r5ZMyG9bntd8uH7e2jgvaBibjieVWvzhf9gVHLwx99KNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB4806.namprd11.prod.outlook.com (2603:10b6:510:31::21)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 09:09:58 +0000
Received: from PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c]) by PH0PR11MB4806.namprd11.prod.outlook.com
 ([fe80::c37b:a730:acc7:479c%4]) with mapi id 15.20.8699.026; Mon, 5 May 2025
 09:09:58 +0000
Message-ID: <b3ff97fa-b66a-4db0-9b81-5256234e6ccd@intel.com>
Date: Mon, 5 May 2025 14:39:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Fwd: FW: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST
 bandwidth constraints
Content-Language: en-US
References: <PH0PR11MB48067E4F18268F82CD523EF8E48E2@PH0PR11MB4806.namprd11.prod.outlook.com>
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>, "B, Jeevan"
 <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
From: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>
In-Reply-To: <PH0PR11MB48067E4F18268F82CD523EF8E48E2@PH0PR11MB4806.namprd11.prod.outlook.com>
X-Forwarded-Message-Id: <PH0PR11MB48067E4F18268F82CD523EF8E48E2@PH0PR11MB4806.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::15) To PH0PR11MB4806.namprd11.prod.outlook.com
 (2603:10b6:510:31::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB4806:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 39ab26d6-755e-425b-d0e3-08dd8bb49bbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVRKbUczTGt3cGxDazZqaUdwb0xlNGw5VkJhTG1NU3FHVE15QitXaU5wNDJL?=
 =?utf-8?B?N2NUTDVMc0JoM1Avd29kNlFJMFp6VXhxN25XZ0NuNVVldS84ZnNrSWVTODBS?=
 =?utf-8?B?eDZrYWZ3T2d3UUd3QkE5TnZ0eGVKK2x1Z3ovQWk2amxJUnhZaUU3eTlIZ3Ev?=
 =?utf-8?B?SFQvT25xTnFTNDVqUWJBRGc3ZWg3VkFoTUpNaHcyRDdNZ1N3bFF0RmRqeGZK?=
 =?utf-8?B?eE9IaVJJS1YrY0VrbkdqQk12eHRldDZ2dzJCVC9vYUhjWC9WaU1OeXdtaHdZ?=
 =?utf-8?B?eW15dWF3b0Fsc2JseWFIcjZ4aDBlY0x5WkFWeUNKb0hlRzZuYVhIMlBTUkdq?=
 =?utf-8?B?OVoxNkpoSGxYTTZwMmFCaVVwaVVEQ2xwZkg2aTR2eEx2dFZDWUtqOERIZ0Y3?=
 =?utf-8?B?WmFpdUZuTGtxQkg1YzJSTW0zWTdhRXBnK2s3TXRFbmxnWVlIV2VsSTRFSmFh?=
 =?utf-8?B?bWNGbmp0dktRQWpZdXNXNEpEU1pRcGxlT3RiY0hnNnIycC80MFVCRXVoS2VK?=
 =?utf-8?B?VjJDMC9MZTNkdTRjMUQreG9wTUh4aWtWLzAwRzdRUG1aUmY0MWJiVTFIbDhR?=
 =?utf-8?B?ZDZNblRBSjZKZXVqNlVWV0grSjc0bkZuT2hXUkRWMGpTeVFUTitoTDB0eExY?=
 =?utf-8?B?Tzh0K0kvZG9NZUZ3alBDUm1TbGFhVm1qbkxlaUkrb2QySjc1cVhydXB1dy9F?=
 =?utf-8?B?MEY1dHp3ZEdFV2cxSncxWVBpUS9SRTRWZ1BXWkFJTU9LbzJMVkV4czg2cEkx?=
 =?utf-8?B?K0dRcjd1a2ROUzJ6SlRrWERJdWRNSVFZN1hRM3Zxb25WTUhOMGFFTkV1a3Q3?=
 =?utf-8?B?SUlPZWYrc3ZKdnI3V2hwcFA3SDF1Zm9WWFlYUmFsMTlyQndwMjRjT1JRRHVV?=
 =?utf-8?B?bmJYVWZkUXhYU09hQThFa2lIdkdVNW54VE13MjlmeWlnUG83Zm95RVJmTG9w?=
 =?utf-8?B?OHE3QlpiTVBRalJTU3RjUUlReFE5RFBzR05hRGFhVzdsVUV4WGtKOFhUK1Jn?=
 =?utf-8?B?TDBUaWM2a0VVTmtGTEp4OWU0U0N3T2NIemFGNlpKamo0SjBzYVZCckZXOGtM?=
 =?utf-8?B?RTVPcS9vSnFoczBMKzdSRk1RQUxndFkzVXltVGZaT1kvSUhKRHJnOUFzQVMz?=
 =?utf-8?B?YWlxVHczbys1dUZWTGtoVjhONmpleFVleVhEc1ZuMFlVdHh1UllvMEZHeW9G?=
 =?utf-8?B?amJPUHlUcjJhc1VtWHVGZEd1NEFrQlFLYUw3SHdjK0ZnUDVnRnFYa3BsU1hu?=
 =?utf-8?B?SUt2UHIyL3dYVFZQcG5MZGw4UE5QQjhEUVFrZzJuQkp5UW1xd2YwT2VWcURK?=
 =?utf-8?B?ZVc3aU1LN1JnQnUyWmpJQVdGcks0Vzl2L1J5U1ZpT3pYcGk1bXgycGQ4OVNx?=
 =?utf-8?B?TndoYzZReVlXNlhzYXJPTm5lcnRoNmdWVG40azRXNzFPUll0SVdYbiszdGpN?=
 =?utf-8?B?ZU95Z0dUbXhMVHpDNHg3Y3N2d3lqQTRybEJlZkRwTmVuSi94dFNDTElPUEtt?=
 =?utf-8?B?cUo5K29DVC9XTVc2UGJudm9zNitoSkxwQXRUUDJTQjZGSnVETUVBSVpmc1ZK?=
 =?utf-8?B?OHYxdDZVbTVPZWtTZ1dqcnloQjE1cjJnK0NkK3JZdDVQM3RGazNDUG9oVWZY?=
 =?utf-8?B?aGFVbG9oL2o5endKSlJRUjFOMTJjUG9LQ3E0eGJ1ZDc4RW0xZGxhWmRHUDZq?=
 =?utf-8?B?UTg3NXh1emVmT2tWQ2tlMUYvM1VFTWhHZzl2NXc5Sk12NnJ2OHgzc0FjeWZx?=
 =?utf-8?B?QVJadktQa1R0QWtYQk5ZQkFwa3c3RkJTbXV3NVJITUlDM3gxdENPMWtLdTRy?=
 =?utf-8?Q?N9tndWDPxsehuiucYpVbftZstMD6ikbgdt7gs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4806.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUpmd1ZmZGtvdWkrWFNUWDYwemIrWWQ1cXNDdEFHQXdZY1oyME0wcXhoSVVx?=
 =?utf-8?B?TVhVTFV0UUJBaWo2ajlhc2hwdzI2Y0tINHlTRTZXcWNDWlBPVHk5NWo4NVVD?=
 =?utf-8?B?V0NTSmN5UmhMOHhEcGhoNGxJakh5eXZXSXlNaHh2aFAwVXAwdVhyRHQwZjZT?=
 =?utf-8?B?cnNvR3p6TFo5OXBtaDFsQS9sT2dIVUp2Y055aERLMTRaWk5mRWhxcFFXNWFa?=
 =?utf-8?B?MEhwQ3JKTWk4M2tQWU9tSnNYanR1a3NhdVZvUUtYamlOcGdLbnBIY3QxVmNi?=
 =?utf-8?B?T2tjK0NKZHkybUZPRExrOGVhaVMzZ0IxQ3loZjFVd3dvV2t5bmkzdTk1dmpo?=
 =?utf-8?B?aGRxbGYrb2owUFl1VndtUCtWdTFwRHBZeDhYOEV4MEFQUUNDYWFlWUNnQVNy?=
 =?utf-8?B?ZmNOZ3gvd2MreC9hNEsreHdwWW8zTFZjTk9SNXQwSms1czZOYnZMN3hUUUt5?=
 =?utf-8?B?UmZ5aWNJRndjTHE1Y2ZBNWNLbUoybjhuVy9aZW9Yc2l4NzYzYVNZVVloRU84?=
 =?utf-8?B?cENrU0FjejNkeTF5SjB5Q1RHVnJ1cmtTcFU3ZXZDbmY5OTd2d3duYURYNlMx?=
 =?utf-8?B?SE5vTVNzYWFXRGhpVFd2R2hSelA3MnczWTBQNHVNejVBMkVVZHZvQXVDaU9P?=
 =?utf-8?B?dWV0a1g2RG4wQnp5MFU4eUszTWp3TTViVUMwV2xKNFZ3ZnFDcE45UmJwS04x?=
 =?utf-8?B?aERhakVuN1l1am9Yc3IxM2s1a0cxbVdOYjRSYU1XWGZTaHF6VERvRW4yV3dR?=
 =?utf-8?B?T0dDbHoreHEvY3NWeE94WEhWSGtBbUZMMXdBQUlRL0ZHUkJFK0dMc2Q0RTRp?=
 =?utf-8?B?S2VFNnppb05KZ3ZEK2lURmZ5clh3QndUSU9odFd1R0EyUkNzUUhDQ25ZOFdJ?=
 =?utf-8?B?NnorK2crbGJQQ1JUak9Sb3FFNVp0VFJLMHR2UWFDam8yRU1McVRNMG1qdVY1?=
 =?utf-8?B?M2oyVVdHWmIzbllOWGNPMzdETkNzcW9wNEdXN1BSbVN2T3FuWWRvQ1lSQmZK?=
 =?utf-8?B?OE1vZUhRdGlYVzdYd0Jxdlp0aDJmWTVZN21kamFobWJlUUl5eW9iYy9tWmR2?=
 =?utf-8?B?Uy9teTl0TXBjdFN2WTQvM09vTmtSY0VDTENTT3crT050azVvZXNHWFhxRFdx?=
 =?utf-8?B?dVJUNUpVRGRYM0J5K0FZQmlHSEFWY1lFTmhPTWlzZnZqNXQwN0hKdEdWVUpS?=
 =?utf-8?B?ZWtpWElZZnVoZDc3YUFwaWFDM2gwMVpvTVVhWlR0akhiMllsM21sWG5oTUw2?=
 =?utf-8?B?Rzd0cW15UjhtLzM3NFozaFBUbi9WZnJrNlNOekRCMndaT3paUWNKYUZRQXhz?=
 =?utf-8?B?OG9sZ0pYR2JiODI3ZzVUQU1rU1YreWVubnJoTEo5MU1tdjBUY3lNU0diMkZs?=
 =?utf-8?B?TmRKS0lReFNBZ2RCcktHOTVvdS9ZYUZBVTFKbTlQa0ptRWdNOHNDbWJ2UU9U?=
 =?utf-8?B?MHlZSTRteld2eVRQblV1WTg2Uys0Q0J1Z0RQeDFmSFFhUUxjRndURnlFSW93?=
 =?utf-8?B?Z1B1bGJpUTNYRnR6VmFtWURNc1Q1Zmo5czE3MlJCOXh1clpEQkZOb01pWlZM?=
 =?utf-8?B?VFQrbFN4WkY1TUUvZlhNQjRocGt5a2crZ0FZenNhdFd3M01QSkpEOVdjY1A1?=
 =?utf-8?B?ZW1nMmt4VUJwRmwwalByN08yMGVEcXNRdjJJYlNzTnY3cUhmRjlKMXhVM2Jn?=
 =?utf-8?B?bm5IcWNIOUpCYWNXaWE3UzF6cW9GRGw5U2cwMWpkRis3YWkzU0V2OC9qMmV6?=
 =?utf-8?B?Qld1OTdNNzJtVHJIOEJQc29ZQU1mVjc2THpVUGJsR2p6M1RZREl1K3owdmVV?=
 =?utf-8?B?VW1mRmNtYXJRdkR0K1lXYkJpdGdINy9lYjVIdUFRK0JNcUhJWGYzc0IyTkxF?=
 =?utf-8?B?SHFiZitlZDk1ZGpUWFNWRi81UVJtSWVOVnhWNWVMRGZTeU9UWDB1NHZpQWlz?=
 =?utf-8?B?ODVURWcxOWM2a0t4RURXL0taQlN2cHNaUkEraEFOZEJCUXRHdHUvZDR4MWJT?=
 =?utf-8?B?VGNISXJveGpFZkhLUXRHTjdrN0daUWpaL0tSR09iWlZ4VStYeE82cmloK0xO?=
 =?utf-8?B?VHNnUmx2SDF3SUFleHBXOUh6REZtNlFjTWJFTjJqRFU4Z2hoTml6V1VvcjdK?=
 =?utf-8?B?bXdMWHlTbk5vVzZmeU5meUo1NDdUQlFmZHdyT05nRFhVZG9zSEpCdlM1b2xG?=
 =?utf-8?B?dGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39ab26d6-755e-425b-d0e3-08dd8bb49bbb
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4806.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 09:09:58.2961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 13zB1yiwavhXD2RE6tvMjKys6MOjBGysER3ddsZX34YXlRYbIZ1sT8U2gcVw6KJ7RFGgDKRt/BoMYZf0ayWhMQpXuRXXZGQcO1xRe2LAlEg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
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



-----Original Message-----
From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Reddy 
Guddati, Santhosh
Sent: Monday, May 5, 2025 9:55 AM
To: B, Jeevan <jeevan.b@intel.com>; igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] tests/kms_display_modes: Fit modes within MST 
bandwidth constraints

Hi Jeevan,

On 30-04-2025 15:16, Jeevan B wrote:
> Instead of checking only the current modes, find a combination of 
> modes in the MST topology that can be accommodated within the 
> available link bandwidth.
> 
> v2: move fit_modes_in_bw to lib/igt_kms
> v3: update tag from fixes to closes
> v4: remove igt_assert from fit_modes_in_bw call.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1542
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
LGTM
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> ---
>   lib/igt_kms.c                           | 30 +++++++++++++++++++++++++
>   lib/igt_kms.h                           |  1 +
>   tests/intel/kms_dp_link_training.c      | 24 +-------------------
>   tests/intel/kms_dp_linktrain_fallback.c | 18 +--------------
>   tests/kms_display_modes.c               |  4 ++++
>   5 files changed, 37 insertions(+), 40 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c index f3bc481f2..7c7738844 
> 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -5046,6 +5046,36 @@ bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t *display)
>   	return __override_all_active_output_modes_to_fit_bw(display, outputs, n_outputs, 0);
>   }
>   
> +/*
> + * fit_modes_in_bw :
> + * @display: a pointer to an #igt_display_t structure
> + *
> + * Tries atomic TEST_ONLY commit; if it fails, overrides
> + * output modes to fit bandwidth.
> + *
> + * Returns: true if a valid mode combination is found or the commit 
> +succeeds,
> + * false otherwise.
> + */
> +bool fit_modes_in_bw(igt_display_t *display) {

	 -->Please have "igt_" before function name..

> +	int ret;
> +
> +	ret = igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	if (ret != 0) {
> +		bool found;
> +
> +		found = igt_override_all_active_output_modes_to_fit_bw(display);
> +		if (!found) {
> +			igt_debug("No valid mode combo found for modeset\n");
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>   /**
>    * igt_pipe_refresh:
>    * @display: a pointer to an #igt_display_t structure diff --git 
> a/lib/igt_kms.h b/lib/igt_kms.h index 0381c82ad..fe01eaf3f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1226,6 +1226,7 @@ void igt_require_pipe(igt_display_t *display,
>   void igt_dump_connectors_fd(int drmfd);
>   void igt_dump_crtcs_fd(int drmfd);
>   bool igt_override_all_active_output_modes_to_fit_bw(igt_display_t 
> *display);
> +bool fit_modes_in_bw(igt_display_t *display);
>   bool igt_get_i915_edp_lobf_status(int drmfd, char *connector_name);
>   unsigned int igt_get_output_max_bpc(int drmfd, char *connector_name);
>   unsigned int igt_get_pipe_current_bpc(int drmfd, enum pipe pipe); 
> diff --git a/tests/intel/kms_dp_link_training.c 
> b/tests/intel/kms_dp_link_training.c
> index 9e9b1e6db..0152b7401 100644
> --- a/tests/intel/kms_dp_link_training.c
> +++ b/tests/intel/kms_dp_link_training.c
> @@ -140,28 +140,6 @@ static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
>   	}
>   }
>   
> -/*
> - * fit_modes_in_bw - Tries atomic TEST_ONLY commit; if it fails, 
> overrides
> - * output modes to fit bandwidth.
> - */
> -static bool fit_modes_in_bw(data_t *data) -{
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> -					    NULL);
> -	if (ret != 0) {
> -		bool found;
> -
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found, "No valid mode combo found for modeset\n");
> -	}
> -
> -	return true;
> -}
> -
>   static void do_modeset(data_t *data, bool mst)
>   {
>   	uint32_t master_pipes_mask = 0;
> @@ -204,7 +182,7 @@ static void do_modeset(data_t *data, bool mst)
>   						  "Unable to assign pipes for outputs\n");
>   
>   	setup_planes_fbs(data, outs, out_count, modes, fbs, planes);
> -	fit_modes_in_bw(data);
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes 
> +in bw\n");
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   }
>   
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c 
> b/tests/intel/kms_dp_linktrain_fallback.c
> index 6a872efd2..64f21ec6f 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -151,22 +151,6 @@ static void set_connector_link_status_good(data_t *data, igt_output_t *outputs[]
>   							  DRM_MODE_LINK_STATUS_GOOD);
>   }
>   
> -static bool fit_modes_in_bw(data_t *data) -{
> -	bool found;
> -	int ret;
> -
> -	ret = igt_display_try_commit_atomic(&data->display,
> -					    DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	if (ret != 0) {
> -		found = igt_override_all_active_output_modes_to_fit_bw(&data->display);
> -		igt_require_f(found,
> -			      "No valid mode combo found for modeset\n");
> -	}
> -	return true;
> -}
> -
>   static bool validate_modeset_for_outputs(data_t *data,
>   					igt_output_t *outputs[],
>   					int *output_count,
> @@ -176,7 +160,7 @@ static bool validate_modeset_for_outputs(data_t *data,
>   {
>   	igt_require_f(*output_count > 0, "Require at least 1 output\n");
>   	setup_pipe_on_outputs(data, outputs, output_count);
> -	igt_assert_f(fit_modes_in_bw(data), "Unable to fit modes in bw\n");
> +	igt_assert_f(fit_modes_in_bw(&data->display), "Unable to fit modes 
> +in bw\n");
>   	setup_modeset_on_outputs(data, outputs,
>   				 output_count,
>   				 mode, fb, primary);
> diff --git a/tests/kms_display_modes.c b/tests/kms_display_modes.c 
> index d53b83a86..19df03e92 100644
> --- a/tests/kms_display_modes.c
> +++ b/tests/kms_display_modes.c
> @@ -93,6 +93,8 @@ static void run_extendedmode_basic(data_t *data,
>   	mode[0] = igt_output_get_mode(output1);
>   	mode[1] = igt_output_get_mode(output2);
>   
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in 
> +bw\n");
> +
>   	pipe_crc[0] = igt_pipe_crc_new(data->drm_fd, pipe1, IGT_PIPE_CRC_SOURCE_AUTO);
>   	pipe_crc[1] = igt_pipe_crc_new(data->drm_fd, pipe2, 
> IGT_PIPE_CRC_SOURCE_AUTO);
>   
> @@ -138,6 +140,7 @@ static void run_extendedmode_basic(data_t *data,
>   	igt_fb_set_size(&fb, plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   	igt_plane_set_size(plane[1], mode[1]->hdisplay, mode[1]->vdisplay);
>   
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in 
> +bw\n");
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc[0], &crc[0]); @@ -158,6 +161,7 @@ 
> static void run_extendedmode_basic(data_t *data,
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
>   	igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe2],
>   			  DRM_PLANE_TYPE_PRIMARY), NULL);
> +	igt_assert_f(fit_modes_in_bw(display), "Unable to fit modes in 
> +bw\n");
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   
>   	/*Compare CRC*/

