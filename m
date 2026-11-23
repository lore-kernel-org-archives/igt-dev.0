Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52409606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Nov 2026 02:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVsOoL18;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=ajObVnZK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3B6C10E134;
	Mon, 23 Nov 2026 01:59:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3E9810E134
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2026 01:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795399120; x=1826935120;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=HSzojIJNtXOswhXANZTTEzeMUUETlVqOKzS/BD+HN9M=;
 b=VVsOoL18K7S9hSdzAqZ9L4+BWVJcpci1f9U96FB/3O2GheQS3K7wRUll
 En0s9wM11pOeVVZ0bR1tDctUJQY5QuwbbDF0VnbuhnIh4rjvuZEC39mct
 MxkMblLakCtU1lp2Xsz8IXJtUdIgUQjLmqPAHZfM/KjxJ/x2pSAIOSXgv
 2AVCjwzxXQAz66k2xIXXgvGt/lji+IWxvytevrEb/sgD4CvDlOpopJv/o
 hS5WbWNd70sWJ6lkvw5IA6VZZirtqH5IVnXLpA+mDbwhck1EdofMxQmYO
 MXFt0lX1CXvGr+kqbbPU6GZJR2Dq/ylR7RKXgNmZgacS+EWRd+Qgo1BrG g==;
X-CSE-ConnectionGUID: g9GtC4O0QxWWGwCQi+VJFA==
X-CSE-MsgGUID: 84PwblH4QCmjzoiziZjGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4242105"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4242105"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 17:58:39 -0800
X-CSE-ConnectionGUID: TqSluZVWQqKutWeBh7e1pA==
X-CSE-MsgGUID: IJ6ldiE1S9+Y8cTcQOY/MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; d="scan'208";a="11114513"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 17:58:39 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 17:58:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 17:58:38 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.5) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 17:58:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InZK55YK+ir+IYTBfF3F53A0jEYk2xvfG9eVnGBMEj82wvM9BdVtxEdYFEMH8NULe/WD62TjrRWzXO9Qgd1Jo31AnK4E5e7ofVK8yNeAz25K6+TjZAvDP6jqssQPZSXCjYzXuIf3F/bxqBJ/TXg5/qSAeIvIgIlbTwrHoAvHMONiOSU8xNvgFMX/I4cdgzj1DPPPmCYgJoYr67An8HnL4ESyDt+5fF8n2VoKucp0eXdEjmXTYtooSmJB/yJkrv0sKs063MKEdpF5RLVAck3uA8GM/2QuxA02J7aVxJOjRGCMRG0DTZzGK+BQIq0Y4ngMoIjqaXJuG/BOkzZgGxV+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8iE6ZRhdnn0nHgS8/iGNEi1ey3R9eO8SoswON/GrA74=;
 b=D/6xkjMbxOPo/5IkOQsR2I0k3ZX/AcWlEFs5TzVWOn5gHA/xlYQYW6Xz3DxAxwn9sA/+hM0ikEcjJsciO+5A2/kGXDQ3XgNHLSKKPRtN+1cUqFySm3RwZhDM3T6CLosw6X9LEkMvyswrukh1lriEkK70ZFNXEcsUQt0XBL4+Cyhaekh0yUxcvP0WZeYDNZz1rn7E4xiM6zk0gaOMDx7PQ/IT+MA+EqDCjWeTfDpbqb9sEt4ZQIidtuUBoqXMSTnQHLQ3BOhimyJxsTU8DhPfipzjxQgHU3zm3sNb2/ErKz5P0h6DHn17cIiKjv6Yy6HLoMaJIO0Hlyftet04pTKZKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8iE6ZRhdnn0nHgS8/iGNEi1ey3R9eO8SoswON/GrA74=;
 b=ajObVnZKjNtYz/F9IfZiPYR7WhHHtKj9n/dekbHwXFCEKNGJWpUDgw6p39gQeyFG6kn9w1l5PT0nV2KIrCRrzIML9Rj47wFuniZw8uajB+rCCcZhfN6e4scMZsdrfMlkZHVzakDjiL5WwpFRTP5LYrlk3OKR309a5ZPyqhJ6q+E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7149.namprd11.prod.outlook.com (2603:10b6:303:221::14)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.13; Mon, 23 Nov 2026 01:58:31 +0000
Received: from MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c]) by MW4PR11MB7149.namprd11.prod.outlook.com
 ([fe80::75d3:519d:fced:5a6c%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 01:58:30 +0000
Message-ID: <5ad43161-d7a7-4805-8a75-66977aef2f50@intel.com>
Date: Mon, 23 Nov 2026 07:28:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] tests/kms_vrr: add support for full range refresh
 rate testing
To: Lee Shawn C <shawn.c.lee@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20261117135939.93225-1-shawn.c.lee@intel.com>
 <20261117135939.93225-3-shawn.c.lee@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20261117135939.93225-3-shawn.c.lee@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0057.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::15) To MW4PR11MB7149.namprd11.prod.outlook.com
 (2603:10b6:303:221::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7149:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: c3316de5-64c0-48b2-fb20-08df490545f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261026121527099003|261026140227099003|261028144727099003|261021123027099003|261021121427099003|261022075727099003|261022113327099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003|261009223027099003|261009221727099003|261009221227099003|6133799003|261009223327099003|261009220027099003|3023799007;
X-Microsoft-Antispam-Message-Info: p2AZRWgO/dT5wnQW5AzDmMdUbnYDysRYwCrKaLZ1MTG/5jlx8c5mYmQcvTQFXcyraptAeYbch4p/beefyzGls36Z0FtX6/wN9PeQIWY8C/RwtedBecnriOvWrw3wBYuqtUNziFl/PGi6g8yhHqD9fIxgy8tiNLAjCPJjTUIFUAfrV5ThemrHTntv7PoZPsWAscztNVXfXk8ZzntarTLQEUd9ZMl3lBnQ44E/WhOVtoBdV+c3BLFAvI1S3YlouWZRGuPByz3oRL7m6NYRl8VYwBH1La2u7vn1uvkw36wPUxCkJcyR2hcJhd4i+vEpUcUiSuwA+Mn4vxiKv/d69al8ESdK1EdtlTy0ZIY6dvoAsepdmZlXeQkuHQkw/7XtZUsXPzvHBeNwsDQJcBc+7dy/abIzEG2PAgh4UrSLrrdjZnvjnKRLLb2Ujqo0oIpYYPtuOfycrpIK/gj1lu52yP4+fYMXskWHmlAZNtK5SCysnd5GJc4LZIKPqhLUSzHVVdhKjRYWvSf+xO4u7lubrixcadkYGbsM5VAK9y/ERfOPiNib/SFX3K7tmFoZoQIfh5XhgGw1HAwrn1XuEHTa/ycFiXMdE1D6PqCalreVkSMgcwMezNGVvPzU1uatc+Jqee4ao6zY5fF3K5tyQdlc4mfza03pTz/eVEyASIYovDADq2o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7149.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261026121527099003)(261026140227099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022075727099003)(261022113327099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003)(261009223027099003)(261009221727099003)(261009221227099003)(6133799003)(261009223327099003)(261009220027099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStNOVhLaGp2T0RpQjVDUFBMK3RMbEkrNlhDcGZjQ1ZwcFlpZTlXTDJNUTZ0?=
 =?utf-8?B?MlVYSE5QQWgvcTVLMmZDSVhMbUw2NG9DRS9xdnNhNEcyeDFXYUFpR1oydE1p?=
 =?utf-8?B?Z2pON3JiYWUzT1UxN1pFckhrMmE4b2tMTm11Tk1kUk5wRnloeXhtazFFMnBo?=
 =?utf-8?B?QVZ4QTdQSWNqcW9CeldhUjVVM01iSnVsZmNCdXExZllYekRsNVlnRFdCRGdQ?=
 =?utf-8?B?eG1rZ3l4bFpPdllLM01VMnNPVERJeEZzdEVIZGIyMkNSMVRLRzZibE5ZMkJF?=
 =?utf-8?B?a2h2TEJ3dVB1NlRpTW5GNTdwNWdHUWwydnBJYUFsZS9mY3h5SDNsa3hKWUc5?=
 =?utf-8?B?dkxybWh6MVh1UXpBNjBmUXFENThwMUJFMDFGU1phUmRLZGt1Z3ZsaTQrMWw5?=
 =?utf-8?B?OHRGakliYW9sSXJvazF2dmdENlFlKzAxSHAreTRFNGFsUEY0MEdZaXRhTzg4?=
 =?utf-8?B?Vm4xN3Y3UzFKMWNpT24reFM3NHppWlBTdHVlZjc4ZzBFQTkyckpFT2JlS2R5?=
 =?utf-8?B?dkpJMFd2bEp3UU9lMGl0VzQrQlRaQTRhTEx1cHJYbnJUQ05KeTJnVm9EaXBp?=
 =?utf-8?B?eVR5dEN3d3pubTdKT0VCd0RTZ3hVd0pvTUlpeGdPb2pCMHdIdmUvMmxYMHQ3?=
 =?utf-8?B?OVJkSTlUNlJvaWpaOUFBWDVoL1FIdUtqc0hLclJhamxSWXI1Z3FDVEN6V1or?=
 =?utf-8?B?VjRTeGNsWHdwVkcxajlaS1luRndEZmFlL0VLOUxuMS9pTm5GeUJ5eVlCSTlZ?=
 =?utf-8?B?SUw2TEV4ME9kcVR4d2gyOVl0UXdzTEN1WVdDNU1FYWtUcVdkazFwWFRtQ3VD?=
 =?utf-8?B?eGZ2Wml1dXd4ZTUyZWcraFlJSndMR2cybGJWRTlKNytQc3cyWXlESFdLNWc2?=
 =?utf-8?B?elhlYmMrTlBFcTlodkt6cnZmVWUxVlZlSGhieWJsTks2Nkg2TTl0dU5sSVI4?=
 =?utf-8?B?S3VXYzNGNURnc1BsRmN3T2xNN3VPYzdLSDFXalhSb0VXYkNZUWlESVNLVkhS?=
 =?utf-8?B?cXE5aWZGQzFrVkI2bEtrRG1WWFlYOEtrVW9QZllQODQ3TFQ1NWpYenpsUXZE?=
 =?utf-8?B?R3M2T3lNZTVaaFVERk5DVVFHMkJGa2RxZWtiTEd4dHY0cERpTE1BREdpVjJz?=
 =?utf-8?B?RHQzeFZSOUVvQTZiNVpaU1YzdmduT2EvRHQvUkRXT1FwWm56ajRoTmJ1VHNE?=
 =?utf-8?B?TGoyRjJOZkpoTUpqRDkzckZYK2xudmhtM2N2V1hhc0tjRkhwUWd0bGE3TUhC?=
 =?utf-8?B?a3Z1VlJYNStwb3JuNlNFZ0p2dnkxSXI0Y0ovdUhyUHNxOEJJaE9aNEhnV3I1?=
 =?utf-8?B?eHdna3h0M1Evam1DTXVyalNPYmpaNDFIWW1sWDhYV0xrL3JrUndzZjhycllh?=
 =?utf-8?B?N1p1NUJhRndGRjJTY3cwc245T1VWOFNQWllCUXZoUy82eXNRTzI5bWJPbDdl?=
 =?utf-8?B?VmJOaHZQS2xSbVlRdkpRd3FVMUJ6eFlhRkhmQmxuTlZFeC9ldTdLNGozVVp3?=
 =?utf-8?B?b2ZBd0IrYTYyVWdXMUMya3Q4Vlh6SGhROGhQVnd6MDZ6WE13Q0R2SW9PZHRm?=
 =?utf-8?B?MmRKU2I1UFlHc2xKNHRQNUt3bzlGSnBjSzdVSVAxMHV4NVhPYmJYNWt6ZWRz?=
 =?utf-8?B?czVRTFE1K0cvY3hkQ0pEQXAwbVg5WFhKb0VFVlAzT3UveWFIVGtUa0FsVjMy?=
 =?utf-8?B?OC8wQnZEZG1XcVFSQ2xiS3NNeEd5bVJIelRPNnBzbHN2K1Q5dWV6OU10RkdO?=
 =?utf-8?B?bmlMNkVXOHlMM1lSMmJUNTNBdlM5LzhsbU0xZ1FqeGkxRlVBLzBXdllwTFE2?=
 =?utf-8?B?UUVST1pCL1k2ZUhldlFvZlZtTTA1aDJlY0NPMVlZOEwzKzUzV2plU2tVVGdV?=
 =?utf-8?B?TVNaejViRnJVa3c4WWVBbVc4NzBsbHdaNVNlNG14TDIxUXZPUGFOR0lFaTh6?=
 =?utf-8?B?TGdXR1VOY2RVemxyMnZ4a3dXSkJPZnVHUE4vRDZvVVFDWit4M3dZb2hhbENJ?=
 =?utf-8?B?QzJTQ3RsNXlWYWxVUnQ3MDZ5blUzZUtIMHZmOHRna3ZWdWJSV1NnL0ZKU2kv?=
 =?utf-8?B?YXJKTkJsQ2lEcEU0WVg3VzRDS0JXRGs5UzgwM2xPeEZGVHRHOTBIUnRXcUpF?=
 =?utf-8?B?NUNsT0NjTURZdU9STUo5NGJaYU9zVlhTMGU0VWo0ZXBrUi8wRk1ObWo2U3hZ?=
 =?utf-8?B?bithcW40QUVzTVc1MkI0SXE5U3Ayc0wrYWNVazdWYlFGQll0VGNYSjg4aWp1?=
 =?utf-8?B?OFpqdVFGWHZHVHdBTDV5dVhBd3I1YWhIdnE0NzBGYU1XR3F0bkJGQlhDS05Z?=
 =?utf-8?B?RyswR2dxNWVTcjNrWE9XOXRzSStiY1AvRWRtTVlXUnk2aG5ybUlodStmcGNR?=
 =?utf-8?Q?+8bepyFZkTnHnmKs=3D?=
X-Exchange-RoutingPolicyChecked: CNcBN5a3fdyjWYPgizyfXFzCgHkD583zphHxWoaEDe+qTOjJFqogVwBHc8QyaNfEtnf+aRjvx1kgIu46tA/jNBpkWzyq1u2nIAxSpWXqm8m5ShXDfg3v6RDKGE/ArT/dX81VjzLubFuyhVpzV1ICpncL/wVE91V9prIwtx64vtajFdNy+XXxgec4sLNPwCfimbLcorOhkicPtLjH2G8i+f9Gm0WfId0nIDjWyxfePTu0O15gEkO0hNX6B9LuMk2SL06gDCE5sOA6M7hiJ32oiTo1nYBFuUtM4svEzKsCvXZzsBC7CeC/nammXBz0FM0nMOJv1ml1rHMB+DPzPA5DuQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c3316de5-64c0-48b2-fb20-08df490545f3
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7149.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 01:58:30.8520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bL9bFoiE0mVhkXJmTKIO6WLbS4Jz6gSfdX12XePxK4Djej0TwuL3iApEJ3BSZJxaQUBOVZx3nmadNWvTIQk8EHObrOL4KrsX2P5XjH4OA44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
X-OriginatorOrg: intel.com
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Shawn,

On 11/17/2026 7:29 PM, Lee Shawn C wrote:
> Currently, kms_vrr tests fixed step increments within the VRR range.
> To better validate hardware stability and potential issues across the
> entire spectrum, this patch adds a 'full-range' testing mode.
>
> When the full-range flag is enabled, the test will:
> 1. Iterate from the maximum to the minimum refresh rate (stepping by 1).
> 2. For standard testing, maintain the existing behavior of incrementing
>     from minimum to maximum using the defined step size.
>
> v2: Fix build failure by adding documentation for the new subtest.
> v3: Remove unnecessary '!!' operator when assigning to bool.
> v4: Add full-range (top-down/bottom-up) subtests to verify all supported
>      RR within VRR range.
> v5: Fix build failure for the new subtest.
> v6: Revert commit 862eb176244f ("tests/kms_vrr: Start virtual RR test
>      above midpoint to avoid mode fallback").
> v7: Not allow to run full range test if eDP display did not support
>      multiple refresh rate.
> v8: Add is_pixel_clock_identical() helper.
> v9: Add ALLOW_MODESET flag to the initial commit request.
> v10: Rebase on top of latest upstream master (commit 05c13a14f7f8).
>
> Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> ---
>   tests/kms_vrr.c | 173 +++++++++++++++++++++++++++++++++++++++---------
>   1 file changed, 141 insertions(+), 32 deletions(-)
>
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 0102afe203dc..ac5b6d222208 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -64,9 +64,11 @@
>    * Description: Test to switch RR seamlessly without modeset.
>    * Mega feature: General Display Features
>    *
> - * SUBTEST: seamless-rr-switch-virtual
> - * Description: Test to create a Virtual Mode in VRR range and switch to it
> - * 		without a full modeset.
> + * SUBTEST: seamless-rr-switch-virtual-top-down
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
> + *
> + * SUBTEST: seamless-rr-switch-virtual-bottom-up
> + * Description: Vrr seamless refresh rate switch for virtual modes using full range
The two subtests currently use the same description, making it hard to 
distinguish between top-down and bottom-up traversal in the test output 
and documentation.
>    *
>    * SUBTEST: lobf
>    * Description: Test to validate link-off between active frames in non-psr
> @@ -115,9 +117,10 @@ enum {
>   	TEST_FLIPLINE = 1 << 3,
>   	TEST_SEAMLESS_VRR = 1 << 4,
>   	TEST_SEAMLESS_DRRS = 1 << 5,
> -	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
> -	TEST_FASTSET = 1 << 7,
> -	TEST_MAXMIN = 1 << 8,
> +	TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN = 1 << 6,
> +	TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP = 1 << 7,
> +	TEST_FASTSET = 1 << 8,
> +	TEST_MAXMIN = 1 << 9,
>   	TEST_LINK_OFF = 1 << 10,
>   	TEST_NEGATIVE = 1 << 11,
>   	TEST_FORCE_RR = 1 << 12,
> @@ -296,13 +299,93 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
>   	return mode;
>   }
>   
> -static void
> -virtual_rr_vrr_range_mode(drmModeModeInfo *mode, float virtual_refresh_rate)
> +static bool
> +virtual_rr_vrr_range_mode(data_t *data, drmModeModeInfo *mode, float virtual_refresh_rate)
>   {
>   	uint64_t clock_hz = mode->clock * 1000;
> +	uint16_t virtual_vtotal;
> +
> +	virtual_vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	if (is_intel_device(data->drm_fd) && virtual_vtotal > 8192) {
> +		igt_info("VTotal (%d) already exceed 8192 at %fHz\n",
> +			 virtual_vtotal, virtual_refresh_rate);
> +		return false;
> +	}
>   
> -	mode->vtotal = clock_hz / (mode->htotal * virtual_refresh_rate);
> +	mode->vsync_start = virtual_vtotal - (mode->vtotal - mode->vsync_start);
> +	mode->vsync_end   = virtual_vtotal - (mode->vtotal - mode->vsync_end);
> +	mode->vtotal = virtual_vtotal;
>   	mode->vrefresh = virtual_refresh_rate;
> +	return true;
> +}
> +
> +static bool
> +is_edp_multiple_rr_panel(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	uint32_t first_clock = 0, first_rr = 0;
> +	bool found_first = false;
> +
> +	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP) {
> +		igt_info("Connector %s is not eDP, skipping DRRS check\n",
> +			 output->name);
> +		return false;
> +	}
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode = &connector->modes[i];
> +
> +		if (!found_first) {
> +			first_clock = mode->clock;
> +			first_rr    = mode->vrefresh;
> +			found_first = true;
> +			continue;
> +		}
> +
> +		if (mode->vrefresh != first_rr &&
> +		    mode->clock == first_clock) {
> +			igt_info("Multiple RR panel detected (not DRRS): "
> +				 "same clock %d kHz, vrefresh %d vs %d Hz\n",
> +				 first_clock, first_rr, mode->vrefresh);
> +			return true;
> +		}
> +	}
> +
> +	return false;
> +}
> +
> +static drmModeModeInfo*
> +get_selected_fixed_mode(igt_output_t *output, bool lowest)
> +{
> +	drmModeConnectorPtr connector = output->config.connector;
> +	drmModeModeInfo *selected_mode = NULL;
> +
> +	for (int i = 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *m = &connector->modes[i];
> +
> +		if (m->type & (DRM_MODE_TYPE_PREFERRED | DRM_MODE_TYPE_DRIVER)) {
> +			if (!selected_mode) {
> +				selected_mode = m;
> +				continue;
> +			}
> +
> +			if (lowest) {
> +				if (m->vrefresh < selected_mode->vrefresh)
> +					selected_mode = m;
> +			} else {
> +				if (m->vrefresh > selected_mode->vrefresh)
> +					selected_mode = m;
> +			}
> +		}
> +	}
> +
> +	if (selected_mode) {
> +		igt_info("Found Target Fixed Mode: \"%s\" %dHz (vtotal: %d)\n",
> +			 selected_mode->name, selected_mode->vrefresh, selected_mode->vtotal);
> +		return selected_mode;
> +	}
> +
> +	return NULL;
>   }
>   
>   /* Read min and max vrr range from the connector debugfs. */
> @@ -991,45 +1074,65 @@ test_seamless_virtual_rr_basic(data_t *data, igt_crtc_t *crtc,
>   			       igt_output_t *output, uint32_t flags)
>   {
>   	uint32_t result;
> -	unsigned int vrefresh;
> +	int vrefresh;
>   	uint64_t rate[] = {0};
> -	uint32_t step_size;
> -	drmModeModeInfo virtual_mode;
> +	int start, end, step;
> +	drmModeModeInfo *virtual_mode = NULL;
> +	bool need_low_rr = flags & TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP;
>   
> -	igt_info("Use HIGH_RR Mode as default\n");
> -	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
> +	if (!is_edp_multiple_rr_panel(output)) {
> +		igt_info("This panel does not support this testing.\n");
> +		return;
> +	}
Returning silently makes the dynamic subtest appear to pass. Use igt_skip()
> +
> +	virtual_mode = get_selected_fixed_mode(output, need_low_rr);
> +	if (!virtual_mode)
> +		return;
> +
> +	igt_info("Use %s_RR Mode as default\n", need_low_rr ? "LOW" : "HIGH");
> +	kmstest_dump_mode(virtual_mode);
>   
>   	prepare_test(data, output, crtc);
> -	rate[0] = igt_kms_frame_time_from_vrefresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
> +	rate[0] = igt_kms_frame_time_from_vrefresh(virtual_mode->vrefresh);
>   
>   	/*
>   	 * Sink with DRR and VRR can be in downclock mode so
> -	 * switch to highest refresh rate mode.
> +	 * switch to desired requested rate mode.
>   	 */
> -	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> -	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
> +	igt_output_override_mode(output, virtual_mode);
> +	igt_assert(igt_display_try_commit_atomic(&data->display,
> +						 DRM_MODE_PAGE_FLIP_EVENT |
> +						 DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						 NULL) == 0);
>   
>   	result = flip_and_measure(data, output, rate, 1, TEST_DURATION_NS);
>   	igt_assert_f(result > 75,
>   		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
>   		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
>   
> -	/*
> -	 * Calculate step size by considering the no. of steps required to
> -	 * reach Vmin to Vmax as 5.
> -	 */
> -	step_size = (data->range.max - data->range.min) / 5;
> -
>   	/* Switch to Virtual RR */
> -	virtual_mode = *igt_output_get_mode(output);
> +	virtual_mode = igt_output_get_mode(output);
> +
> +	if (flags & TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN) {
> +		start = data->range.max;
> +		end = data->range.min;
> +		step = -1;
> +	} else {
> +		start = data->range.min;
> +		end = data->range.max;
> +		step = 1;
> +	}
>   
> -	for (vrefresh = data->range.min + step_size; vrefresh < data->range.max; vrefresh += step_size) {
> -		virtual_rr_vrr_range_mode(&virtual_mode, vrefresh);
> +	for (vrefresh = start; step > 0 ? vrefresh <= end : vrefresh >= end; vrefresh += step) {
> +		if (!virtual_rr_vrr_range_mode(data, virtual_mode, vrefresh))
> +			continue;
>   
>   		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
> -		kmstest_dump_mode(&virtual_mode);
> +		kmstest_dump_mode(virtual_mode);
> +
> +		igt_output_override_mode(output, virtual_mode);
>   
> -		igt_output_override_mode(output, &virtual_mode);
> +		igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_ATOMIC_TEST_ONLY, NULL) == 0);
>   		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
>   
>   		rate[0] = igt_kms_frame_time_from_vrefresh(vrefresh);
> @@ -1390,9 +1493,15 @@ int igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("flip-basic-fastset")
>   			run_vrr_test(&data, test_basic, TEST_FASTSET);
>   
> -		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
> -		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
> -			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-top-down")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,
> +				     TEST_SEAMLESS_VIRTUAL_RR_TOP_DOWN);
> +
> +		igt_describe("Test to switch to all virtual modes in VRR range without modeset.");
> +		igt_subtest_with_dynamic("seamless-rr-switch-virtual-bottom-up")
> +			run_vrr_test(&data, test_seamless_virtual_rr_basic,
> +				     TEST_SEAMLESS_VIRTUAL_RR_BOTTOM_UP);
>   
>   		igt_describe("Test to validate the link-off between active frames in "
>   			     "non-PSR operation.");
