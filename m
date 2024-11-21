Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D0FD6E2CA
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 10:18:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6585C10E3EE;
	Thu, 21 Nov 2024 10:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LJtdwnqj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591F810E3EE
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 10:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732184325; x=1763720325;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=0zc712h7f4Mdgmz+ZhissQK3w3qHGEJXV0ftaS9JbSw=;
 b=LJtdwnqjjQ1zuwB8SkkJDYWD0gb63tPFcKb/Truo6zS4vD+Y9gMDYkQK
 eIAUtVegkStJFJDWqdjVd9ZeBC8GTOA5TLDotauyspPJPDnsXdQH9rJXt
 H84Z8/guBGfx2V28WHOWOzK8ZEJOAO63uXm/1yNxmcpM4irhZzOeKN8xl
 QnX4NWP0qMs4eKDjUcugG5Ka7XmTyhA8CmLbAipfBT+dEqnS2T9xgAv7+
 PMoVUyz7xWtl4g5pv3PuVkswW5hN5tp4ffFqJg47x+GyX1CrdurLhvyLB
 iyaFYiA94bgzxh0CrRBFsmMc8oWkix3ErxdovG1DLlOJJXpXizwrQYmEj A==;
X-CSE-ConnectionGUID: 5k7lDtijR92DDpwIlLyY1A==
X-CSE-MsgGUID: BmpZBrgtRT2vCAQxu1LvUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43683269"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43683269"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 02:18:44 -0800
X-CSE-ConnectionGUID: 18imFDInTv2NHQaPuuI+XA==
X-CSE-MsgGUID: 4LHrVLtTTV+6cDZ91f+uCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="90153792"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 02:18:44 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 02:18:43 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 02:18:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 02:18:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpC+p1Pqa0GoD91bZqjvV6hcsLIfZQtoU6GJ/tT8IH5gSVNjRdIgWJM4WTUV3IeaP2EqwZZU8lhdLUO1fO3xV2Sfpg83dlvUHYVR0UN5Vakemez1vZLi5PoORz6aJPqgha8yM1uV02/1OzznQkjg0ghErJKPIQVv+mS0Cr2ZSINyyNRz2Klib929NXuopdQ63F0cbMJ9y/sIPuMgJ/YTmO9KoRLxmACE/7GgJEIHfmC+De8SMv5Ifo238DaNQ9/joz34zR6NjFjYfEuUt1Qo0pnEvVY9kJxyi1McksVfO7l+bq2A7HdbCm+4//g/TPk1xBMxOPjPExMXvdJLLBZQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0zc712h7f4Mdgmz+ZhissQK3w3qHGEJXV0ftaS9JbSw=;
 b=Gkxj0MYNdvt5pZ+DFJyQcBrxd9jLKqurwqVf3pld0zimTYAYiK/CWbiq8Wuu1gRMlZ+IAcgRjbWk7ITzgbuxxQkQ/EzhcvRfYsKR0Q/R6X2uMYTp+1vG30k0rQlDqRq7ln3UgVNGj6ps+R+o5rHMfwKa5Pm69ey1JwtXbhu7rwW+/VXPwAHiMacE3ls+2rUr8c3ybJMiNFVis4wjVjOsQP9KMWUuqe+wofziKsSW2cCESEKsbOV59NSU2CknmILS1hUTCILptLFo3keSgU2D7+Jh/2uQSnOyAwo3ROkxsrKnB72zL+1yPQbq+yMu+4Blawso+PDoRJRvnULycR7y1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 10:18:40 +0000
Received: from CY8PR11MB7847.namprd11.prod.outlook.com
 ([fe80::c23f:2cdb:fc01:4f41]) by CY8PR11MB7847.namprd11.prod.outlook.com
 ([fe80::c23f:2cdb:fc01:4f41%2]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 10:18:40 +0000
From: "Grzegorzek, Dominik" <dominik.grzegorzek@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Maslak, 
 Jan" <jan.maslak@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 3/3] tests/xe_eudebug_online: update thread count handling
 in query_attention_bitmask_size()
Thread-Topic: [PATCH 3/3] tests/xe_eudebug_online: update thread count
 handling in query_attention_bitmask_size()
Thread-Index: AQHbO5ulwAKntGzV20K4HMWee9uC5bLBhj4A
Date: Thu, 21 Nov 2024 10:18:40 +0000
Message-ID: <bdd229fcbe8a8b7654776bf20577bb691f2b3999.camel@intel.com>
References: <20241120222850.1497784-1-jan.maslak@intel.com>
 <20241120222850.1497784-4-jan.maslak@intel.com>
In-Reply-To: <20241120222850.1497784-4-jan.maslak@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7847:EE_|CO1PR11MB4785:EE_
x-ms-office365-filtering-correlation-id: fb8b9b1a-4602-4c51-6b2b-08dd0a15dead
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M1NvUndVMHA2bktIY3JIeXcrQmZGNGp2M2pjZEZYSHQ0MHEyRlpmNWxyTTk2?=
 =?utf-8?B?THM0NFRwUXFjL1FudStTeDVEWkZablNCT1dWeFVFVitsQWwvMEgwQ2FOOW5a?=
 =?utf-8?B?QTVrL0tBNDN0YVN4Um1EUHFDYmdKQm5JdkR4QmFBQUw5RGlOVmw0S0kzOHBT?=
 =?utf-8?B?aENBajhZWHgwaGFLSkduNWJvMW9ZaVhNUmRReWZmeWtRTEdDckZmL0tkWE5h?=
 =?utf-8?B?UG9LbWNVNUR2WE15QTIzQ3czdmgrREtzYmRKZzAwUDZVK2hhdllwdzJhc2Jl?=
 =?utf-8?B?dmlTcGFyeGErb1RhUy9QNTM4YXNJZGtELzhlVlcxcXBXOUNQclpIYm1OM0kr?=
 =?utf-8?B?Z2ErY3ZoZEJSUjdTU2RLb3ozc21pTURRc3JVRGgvRW9hT3dsOFpEWHpxZDA1?=
 =?utf-8?B?NlA2ZHZpdmRnUStWdXE2eERjWGtnMWtCT0NYOG44bG1hVVdNUTlnWlhVN2dZ?=
 =?utf-8?B?YVRmVXNPeGd2VW9uekxzWDMwOUdOWUlzL2xJWHNJVTlhMlpvc0htWWQ2OGsx?=
 =?utf-8?B?WS9oQU9KNWRmS0J6VmNTOXIwWHVZQUcxQnJUUHZtQWdhelhGclFiWkQzQkpl?=
 =?utf-8?B?QlFlTHdYcUk0ZHVmTXZyYXVUZUwreGYvcTh5VWJKOTFoM1doY2xEcTAzOUQ4?=
 =?utf-8?B?ZlJUNFI5aVo1SiszZG95Y0s4VEUwSjUwTXlWaVRzMkx3NjgzOVM0bGJSOFNV?=
 =?utf-8?B?cUh1a1E1bGcvY2RKdHQ0VnJwOHVhOFl2ZmZjcE5yTW0yOU5yakVlUkxIelNa?=
 =?utf-8?B?eGVkYkxvNCtIOWUvcDNVRVhTZjc3K1ZhZzNUTk5nZUFCZmQvTDdNY2hYcWll?=
 =?utf-8?B?NHBiSllQWlN6NFJDR1J5Z09jbnM4TGp5ZEUrL0FRc1ZNQzF1QW4xQVh0TXBz?=
 =?utf-8?B?WTM2SFo4NUI2c0tLb3ZZSTBFODd3ZHdRZVQ3enVnREMrcFVwOUZVaXhLT3Mv?=
 =?utf-8?B?dVpKVmhNeG40Q25SMHlpU28xUmxnSXZOb0ZMS285QzJCQUpPUmcwcTRnZHlG?=
 =?utf-8?B?c3M0SDNHWEIzdnRBK1VGTEUyTXFBcGo4VGp1Q0FJOUF0cVNzYlQ5OUVRTWZ2?=
 =?utf-8?B?ZWlvWThNS29Ea0Z4ek5jWmp4SlNSRVlUS1RYNS9iSGdVWmxxeGFzZCtUODFn?=
 =?utf-8?B?VnZ4Z2JGS2hTdE1SZXJIZVkybE1STmlPTTNGVUgvcjRlV0hldkRZOVpSQ2Ns?=
 =?utf-8?B?dGhnb05Oc1ZmZXkxRFlCVmZKLy9lSEllbkt0VVQ3WTRNZXMwRnhCMGNtMW0r?=
 =?utf-8?B?ekJoM05DVHN4eXlNdVp4QUErbU0rd0Qya1NzVnovQ0lsalFMaGZLWElkNEUv?=
 =?utf-8?B?bCtiek5nTGMxOU1OUFhQdGhJRGNXTkJ5bC9iNVpDMXo2bWFKQzVvY21NUUV1?=
 =?utf-8?B?VGNzSVhjK0V3QkU4WGZhRnE1STY5cGN4ckVvSEZmYmRlS1NoTGtkQUhtdEk1?=
 =?utf-8?B?eExSaHd6ZjdSSHloSGRoQ0pGejVzNUpQakxWc1BFcG43VG1ndklWUUpiczA4?=
 =?utf-8?B?RUpLS1IwTjlMSlRQMWxhbVVzdlRGM1FLZTg5UW0zMkJySlR2ZTYzVFZUYjVC?=
 =?utf-8?B?UW5qaS9Wb2VUa3N5Q2w0dlV4VjF3UUk3NDhYNmRLai9wS0V6eXdYbG5IemdX?=
 =?utf-8?B?dkJlNklVcTE4VmRkRnRPaWJpQTdwU3dsTnNPVGlrRmhGanhjdkRoYndEcW1T?=
 =?utf-8?B?WVZteTVBbzAvdEJGN01BbHVjaDA5Rnc4K3pjb1pjdnVyZUhFSElHTGFsUnVu?=
 =?utf-8?B?SDltVzR5OTJ2LzkvazhwNDZhQ3BwdFVWenF3ZnZhYzUwdUYrbDl3QVQ2T05G?=
 =?utf-8?Q?UowaaAC/stZAU3PJjVhADZNajvgvARHwq/W0Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7847.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGtjRUZjMVZBZ3Z2S1d5ZUE1UmwzUkNvdTd0WEUxMGpBaEhjeVVDbGdJdHdD?=
 =?utf-8?B?dWFXZ05mUk5oSkVlVHMwZHNkRVRvZll6UEF0amlmQ21ONkd0MkQ4T1VjUEl6?=
 =?utf-8?B?V3NQT2FHaHpnMUhBM2x5anEvRWIzeDExQkYremhPdlkzTGZreE1QWm95dnRN?=
 =?utf-8?B?RDd1SE1keDV0VmRJb0cvWUN2WGRNRnlNbW5XdUF6cGhOUnNXQjdZVFpWaGg0?=
 =?utf-8?B?VlNIeEtkZ3JBejJlK2RlTzVEcGlFUVdlWlJDTSswQkQySWdIdllCalZXTVBq?=
 =?utf-8?B?WW1iYTFwNDlObWMxSWk0bHNnRDJUeVBMSE9xWjlsazZxbVArM1dqT0Qzckcv?=
 =?utf-8?B?UVVGbkZxazFxUW9oK0M1RHFzVEhTR2RZSUs2aFU4ejhQK3VETWoxeGZvQkc1?=
 =?utf-8?B?eGJaUDFXSDVvY1ZDblFMUnhCSVRzYlArMVhZcXRLYnFxc1IyQ2xvTzExQ2Fj?=
 =?utf-8?B?RlZwM3FQM2ZYWERoL203bm5BSWZFY3V4RHUwR1M0cEhUZjJSSzl1ZllTb2E5?=
 =?utf-8?B?NnA2WmlaU2x1VWQ4S3V4Y1g5aVRud25WWEZjVlFiRHloMWtabGN2MnhpM3A5?=
 =?utf-8?B?MURSTzVMbnNjaUxRbmRZa3p2R25Gbnc2YzVTbFVBUnBlYzhmTWlQSHJ6d3Ev?=
 =?utf-8?B?K2xuWkZMa1dOUWlOdkpSanhNQ3YzZlhSQml4NzJaNWVYRHh2TGhTSGxYbmxY?=
 =?utf-8?B?aHhCVUlwMjlTQ3NEOS92emhiZG9FL0lOcndhRUpDa1ZBUUFNcHhVekFjRVpk?=
 =?utf-8?B?akphSjRjWnNPQ3M2REY5WEh6TzVUVWkrRVFJekxMeFQ3STZCL2xUZ2IzTUJR?=
 =?utf-8?B?elZmWlZBSlJYMTVrcG9YMkRFS2wzSWZsU3NKNXV4aGU2ZHM3VlI0SG52NUhM?=
 =?utf-8?B?WDlGL1Y2amFwTGJHbmowUDJjOXJWSStEUEphS1M2NG5vQ3pOZ0p4VVRpNkZJ?=
 =?utf-8?B?ZWRmZkExMEpxblhQd2pJWllkLzZzUXJiWk95Um5sS1NYSVI3bWFqcDc1bTcv?=
 =?utf-8?B?R24zNzljbkpjUndOYmlrczBxcVo0eXlhVE1RbVdmUnJ6dnZOTk92V0tnS0Vn?=
 =?utf-8?B?Q0NPZm8zUmpMZ1c4Z3E5WkFhUlNHMkVKUHhpT0ZQSGdRaWdQK1psWElTZVhS?=
 =?utf-8?B?ck1aTVl0WjBHbnZKOEM0VzREWkRUSWZVWVRaTU5zWmk4R0ZwMTNrUUtkS1Fu?=
 =?utf-8?B?d0VRV2hHWHFlbmtKd1RnSDlONzdvR1NHZWNPdFVwNjE4U1h3eFpBVFRaS2p5?=
 =?utf-8?B?Yko5QURMUlk1dWJYTFRGM0FPbkhZMUNwK21WMWNQQ2dNR2hiV2NyelRMVllE?=
 =?utf-8?B?dTBSWFRmQUJJakdzdnJtay9ZWmFNWW9xUXR0ekhLbzE4dHhlNjg5bGFMTHpv?=
 =?utf-8?B?SmdWM2dDK0wwUkpSS1Y2NnBXblZvZ2JvMnFtcWdTamhDTnhMbHI2N08yZThr?=
 =?utf-8?B?MVlsa2VvZ2JFQUI1b21MOHJ5QkM3QmIwd2dVdDE4N21FRWppVEdzdUQxTFBt?=
 =?utf-8?B?bXVYOGZsY2NxUzY5bmxPU0RBVGJmSjI5V0Y0RGNieFVRYzdKLzlKb2FsUi9U?=
 =?utf-8?B?aGtJNDBIL1VmNG5IZnl2clY5Z1pQdzlGeEhIRW1PdWp0QmVxMVVyUEpqd05j?=
 =?utf-8?B?b2ltSHRnYnlUOFpORkF0M09PWGtkQ3RhTUZ5Wnp3UUl0Qi9sRzlDZzNjcFlJ?=
 =?utf-8?B?V2pVSWNoM1ZQWlRMc3NHZm50QWJBQUVoQWZTbHhZaENJUkZzNU9SRlFhc0tG?=
 =?utf-8?B?SGFCRm5kY2o1UVNMbGJjZzBseXdhNFdyM0JINi9TdWpCbmR4L1B6aFl4K2FS?=
 =?utf-8?B?MURKbStvcFdRbHlPSWcyZ2NJNVlkTHJTN3lHNmNod2NPZnR5amI2c0wrNGp1?=
 =?utf-8?B?RDdJdmM1RWZLVzBENUdqMzRUU3A2c2FrUE1vRFJEdjBPb01KK09mVzNRWmR5?=
 =?utf-8?B?bmJ2ME4reDNYQUFnRytGUS93dThKRGR6MHhBQmkvZ1ArVUpkMFczWlQ3ZGJx?=
 =?utf-8?B?TXdUaFZhekRXZk9vN09JeFRrcVpSR0o3V1J2S3BLMkh4K2VuMHk3d01CQ2JB?=
 =?utf-8?B?TU1PZll0R0MzaldnVUFLNnh2RkgxMzFIT0doSlJhZ1NFY3hFMVFvOUp4UlhM?=
 =?utf-8?B?OUtObTNzOGVGeXl4WC9rWTRmVXEzbVo5bGk5bEhOTUU0eFNXQ1ZtUlZYeHhI?=
 =?utf-8?Q?mIkHr5EWm6ZiUaiM8B2KSrw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <67B489E740D34E489CD3528D2228DDDC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7847.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8b9b1a-4602-4c51-6b2b-08dd0a15dead
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 10:18:40.2632 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SUmzTH0QNxPMMhmRG0UuMv2HMZr8rFcdELEmO6D2T+1GuleOtHmazO+q/xHp0g0r3mtpL4O4+yw00CGve/mG0xuO6a3CTLd7GwQzjCG6yZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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

T24gV2VkLCAyMDI0LTExLTIwIGF0IDIyOjI4ICswMDAwLCBKYW4gTWFzbGFrIHdyb3RlOg0KPiBV
cGRhdGUgcXVlcnlfYXR0ZW50aW9uX2JpdG1hc2tfc2l6ZSgpIGZ1bmN0aW9uIHRvIGZldGNoIHRo
ZSBFVSB0aHJlYWQNCj4gY291bnQgZnJvbSBod2NvbmZpZywgaW5zdGVhZCBvZiBiZWluZyBoYXJk
Y29kZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gTWFzbGFrIDxqYW4ubWFzbGFrQGludGVs
LmNvbT4NCj4gLS0tDQo+ICB0ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jIHwgMTIgKysr
KysrKysrKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5j
IGIvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0KPiBpbmRleCAwZWYwZDgwOTMuLjc4
ZDlkNGJjMyAxMDA2NDQNCj4gLS0tIGEvdGVzdHMvaW50ZWwveGVfZXVkZWJ1Z19vbmxpbmUuYw0K
PiArKysgYi90ZXN0cy9pbnRlbC94ZV9ldWRlYnVnX29ubGluZS5jDQo+IEBAIC0xMTE4LDcgKzEx
MTgsOSBAQCBzdGF0aWMgYm9vbCBpbnRlbF9nZW5faGFzX2xvY2tzdGVwX2V1cyhpbnQgZmQpDQo+
ICANCj4gIHN0YXRpYyBpbnQgcXVlcnlfYXR0ZW50aW9uX2JpdG1hc2tfc2l6ZShpbnQgZmQsIGlu
dCBndCkNCj4gIHsNCj4gLQljb25zdCB1bnNpZ25lZCBpbnQgdGhyZWFkcyA9IDg7DQo+ICsJdWlu
dDMyX3QgdGhyZWFkX2NvdW50X2xlbjsNCj4gKwl1aW50MzJfdCAqdGhyZWFkX2NvdW50X3B0cjsN
Cj4gKwl1aW50MzJfdCB0aHJlYWRfY291bnQ7DQo+ICAJc3RydWN0IGRybV94ZV9xdWVyeV90b3Bv
bG9neV9tYXNrICpjX2RzcyA9IE5VTEwsICpnX2RzcyA9IE5VTEwsICpldV9wZXJfZHNzID0gTlVM
TDsNCj4gIAlzdHJ1Y3QgZHJtX3hlX3F1ZXJ5X3RvcG9sb2d5X21hc2sgKnRvcG9sb2d5Ow0KPiAg
CXN0cnVjdCBkcm1feGVfZGV2aWNlX3F1ZXJ5IHF1ZXJ5ID0gew0KPiBAQCAtMTEzMCw2ICsxMTMy
LDExIEBAIHN0YXRpYyBpbnQgcXVlcnlfYXR0ZW50aW9uX2JpdG1hc2tfc2l6ZShpbnQgZmQsIGlu
dCBndCkNCj4gIAlpbnQgcG9zID0gMCwgZXVzOw0KPiAgCXVpbnQ4X3QgKmFueV9kc3M7DQo+ICAN
Cj4gKwl0aHJlYWRfY291bnRfcHRyID0geGVfaHdjb25maWdfbG9va3VwX3ZhbHVlKGZkLCBJTlRF
TF9IV0NPTkZJR19OVU1fVEhSRUFEU19QRVJfRVUsDQo+ICsJCQkJCQkgICAgJnRocmVhZF9jb3Vu
dF9sZW4pOw0KPiArCWlndF9hc3NlcnQodGhyZWFkX2NvdW50X3B0cik7DQpJIHdvdWxkIGFzc2Vy
dCBhcyB3ZWxsIHRocmVhZF9jb3VudF9sZW4gdG8gYmUgZGVzaXJlZCBzaXplLiBPdGhlciB0aGFu
IHRoYXQsIGl0IGlzOg0KDQpSZXZpZXdlZC1ieTogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlr
LmdyemVnb3J6ZWtAaW50ZWwuY29tPg0KDQpSZWdhcmRzLCANCkRvbWluaWsNCj4gKwl0aHJlYWRf
Y291bnQgPSAqdGhyZWFkX2NvdW50X3B0cjsNCj4gKw0KPiAgCWlndF9hc3NlcnRfZXEoaWd0X2lv
Y3RsKGZkLCBEUk1fSU9DVExfWEVfREVWSUNFX1FVRVJZLCAmcXVlcnkpLCAwKTsNCj4gIAlpZ3Rf
YXNzZXJ0X25lcShxdWVyeS5zaXplLCAwKTsNCj4gIA0KPiBAQCAtMTE3OCw4ICsxMTg1LDkgQEAg
c3RhdGljIGludCBxdWVyeV9hdHRlbnRpb25fYml0bWFza19zaXplKGludCBmZCwgaW50IGd0KQ0K
PiAgDQo+ICAJZnJlZShhbnlfZHNzKTsNCj4gIAlmcmVlKHRvcG9sb2d5KTsNCj4gKwlmcmVlKHRo
cmVhZF9jb3VudF9wdHIpOw0KPiAgDQo+IC0JcmV0dXJuIGV1cyAqIHRocmVhZHMgLyA4Ow0KPiAr
CXJldHVybiBldXMgKiBESVZfUk9VTkRfVVAodGhyZWFkX2NvdW50LCA4KTsNCj4gIH0NCj4gIA0K
PiAgc3RhdGljIHN0cnVjdCBkcm1feGVfZXVkZWJ1Z19ldmVudF9leGVjX3F1ZXVlICoNCg0K
