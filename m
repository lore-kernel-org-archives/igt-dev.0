Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD326C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 19:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B36F10E079;
	Fri, 14 Feb 2025 19:08:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n64UO2yh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516F110E079
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 19:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739560124; x=1771096124;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/C3F/9+MAtKEs3v56IXNFIZDzG/SVbG+nim0tlxFIng=;
 b=n64UO2yhJe9UIIJkUcAameU/cNF+mKhzEck9//GkMTgxUJ6AmPgEipTt
 qnLwg6Nz6NX+DQOOXJ9e52gNLx0cMZ9qA+RrYp/lLKvrmft1IkxrMaJ6n
 8zh8qy8My/ZEE84ifOcf+tXC/llN7a1C/QizlbF0Lb6WPteZTTcD5rBq8
 aG/6z0Sjnr3AfgvjX3V7/Is2Fzadzvpb0HkW7yYJufsKMiRoCD4lOZoLz
 BeBeiLojTiTkoo4NOc08EWyIq5mzOeiEpNL7WmS6ZJVJl76sg7Pflh5cw
 MzJDyUt+tgz8VS47pxVcrcf1Gz4qPSVpF0SpNivZy7Y/5VCHBfFUEy6O6 A==;
X-CSE-ConnectionGUID: exWPg31nSxSRPtDle54h7g==
X-CSE-MsgGUID: IcediP2ZTRy4zkWUzhsiIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40587660"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40587660"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:08:44 -0800
X-CSE-ConnectionGUID: mTslGNVLSkq/vazVqYHrSg==
X-CSE-MsgGUID: ZQf64nXqTEWcJVliTx/3xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="113262101"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 11:08:43 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 14 Feb 2025 11:08:43 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 11:08:43 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 11:08:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1lT7fbNwryVAcserSaXK69utOdRPg4K5ulLEr89Jq6kvz/jP6yDriB9wsjEHSiJ8TLvzUnzKCEOXCnmUDCUwGblJzjf+raVVxBk26VsdKdUDkyc3IkY2MZAIY4ABcX2Mg6KUOHIRZX3RfMKXTmE5gxRNK8EKpEyioxIxGrsnEiaip8bJGfaSBs5oCYWz8PxupeMAfeusyEBKmDTjwrTtj9dgDbZ5YzM4ZLtgZIfQUSXrXynVIVkFXnDHPwhCX+TndVjAeF0B71lP2exN9pkNg+TWlrqKAzdLd6joxj/M4J9lxlBwzmyV+JE/9PuyYG2FSS61lPVBcOv3PO69fZPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZU8ilYzHgo+deXEuiY8I07erJt8SPOICld1SYVmyej0=;
 b=jM9A6f96aTi2Yr4bRQyVc5leLAPZrpWQOP338rgvHT5Qkxn/+BbPWtymjsZSXRj3mYPAy3OqaCWzqOmr+t7XDkQdQc7om6RJBMcPSL0bIyjymRK56mRJPVX2lGtTYIcdao+NAaJyLz2uCeDH2oVqovjRmNAJnYhqKKHkQk2l9w36NBM3UVKhpP/JGrEStErR8dncBgrbhFiBkWcQlZUKdXME80+Kt9M4P0OFuVLRvNN/ZMTuQhPRl953x3/vovKgMJrvnUEQpE1ciDsIXPQ4wxgOQoD4UnnmsdF3upsG8fE13IPjXESluW/LP92afMhjy71Be9kwWcr2+xdboUWOWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV3PR11MB8484.namprd11.prod.outlook.com (2603:10b6:408:1b4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Fri, 14 Feb
 2025 19:08:14 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8445.015; Fri, 14 Feb 2025
 19:08:14 +0000
Date: Fri, 14 Feb 2025 11:08:12 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <vinay.belgaumkar@intel.com>, <soham.purkait@intel.com>
Subject: Re: [PATCH i-g-t 3/3] tests/intel/xe_pmu: Add idle engine activity
 test
Message-ID: <Z6+UnNfsGcQ3QkFf@orsosgc001>
References: <20250212095834.384508-1-riana.tauro@intel.com>
 <20250212095834.384508-4-riana.tauro@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250212095834.384508-4-riana.tauro@intel.com>
X-ClientProxiedBy: MW4PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:303:b8::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV3PR11MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 61a7436d-5182-42f1-b4a1-08dd4d2aee39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnhFL3pYbVdBWUpqTm9hbDhlV2lXQ05BUGJra0xYTW1uNExTcUpzajFlQmUx?=
 =?utf-8?B?T1E1bS9kcGh2Z01CNGNvTTFvNFZ1bXp6d1ZKbG9LelV3UjhpbERRREhvcDYy?=
 =?utf-8?B?YXZNbDNSN3Ezakd5TTd3SzZLN2RhOGxadVJrZnJOSWx4cDkrWjFNRWZJTkFN?=
 =?utf-8?B?a3EvbnZ2YnQwVFM4enh6azJuUkdJSGNGbm93SGZjampLMnZGOEhCY1hBdC82?=
 =?utf-8?B?allvNk5vM3M1QWFMa1lleGMzRUJkVDArMjR0OVR3UVFRSWtFQ2xNK2pZRXd3?=
 =?utf-8?B?MmlSSER0RTNTL05UVUEyK3ZlaWw4d2duN3J5TmNnQlVoZmZBU2hCZ3dGZVV3?=
 =?utf-8?B?czJQV2VPa1Y0K3cyUjVFakMyOVNPcm94dXBQSWMrMWRTQXZTU2I0RTJFUTF5?=
 =?utf-8?B?L3JoSWEwOXV4Q1FVclZRN3RtY1A3dTQ5YkpNWlpJVXpqSUxkbXdUVXNsc1FP?=
 =?utf-8?B?aE9NaTFjdjhPWXhwaFU3azhRcDRabUVjRkdIZ200VGxDNXNGOXBoVjZLdG1q?=
 =?utf-8?B?a1UxZFVhc2N2NEN3T2FmV3N3U1VDcTFTNk9GVkdjaUJxdGlPWlU5S3p4SXVa?=
 =?utf-8?B?R1FHMlBQc0xORTNjdlczdVlUd1IrVzZXaVR4RllnUWk3cUpvWWFxRUVMcGZs?=
 =?utf-8?B?VVNHRG9TelpBNEhqY29yOUVFK2xEaDd4NnVsQTJReDlueDBmZEpBVUhQLzlp?=
 =?utf-8?B?cXYvVmppTDMxWGp5Qkt3MVhrMFRHeE5zWmJOUFRTL0h1QXlWRFFBdjYyRWFM?=
 =?utf-8?B?aEsweU5ldks1bE1nRmhucHpyQVpLbkhBemVoQ0xuM05QbjEvenhLbUdXUzJG?=
 =?utf-8?B?c3JHejFlcmNSa1ZiWllJZnp4bUc0cjFRZXpadjB0Y3FKUzdEc2w5MC9qNkE2?=
 =?utf-8?B?Nm5FN0ZiZDdaSjhXUGFNbzk3WWs2VG1pSnoremRvMjg0dkFMMmRldWZ1Y0R3?=
 =?utf-8?B?Q2I4OElpN3lhVCswd1FZR2RpZ21HQ0ZLeHFlQXcvWEZLb1RzMDRXNWQwVGoz?=
 =?utf-8?B?NXZCVFd4Q3QyamVSb1graVpUand4WGMvdDZ0SVRUSGlOaEp5WEpEcHVuaFVp?=
 =?utf-8?B?VXFMQnFSejViZHM0dE05QW14a011d25DbnRUZEg4MW9OQ1RoeE9uUUdld2h4?=
 =?utf-8?B?K0ZxcTlCRi94emNiMnFwNWdXQnlVM3pFOWE2LzhTL05vTXRDVVZUb0dxMkc3?=
 =?utf-8?B?WlJGS2JqUjM5VE5aenBVU3VLQW8yK2hNS0djdnhNVkp0cU00UUo0ck4xeGtW?=
 =?utf-8?B?VnV0UlNZSjJrWG9LNjR0dTBIa2tuK2F0M2xtNGNhalZvR3ZWcHdXODdsOThP?=
 =?utf-8?B?ZHU3d0V0YnJFZnhpRUZkYnYxTWpkU2xKY25OWTg5dXYzeXdONk5EL2tpQ1g2?=
 =?utf-8?B?WWd2TDArYXdPcmx6T3NXQTM3dk5yV2N1dUF4MjVDV2xBekJMYjBJaXhFSnI4?=
 =?utf-8?B?dXdvaDluK0dtR3dqbmwvMzR0Tzlua1RVdWxFcTVRQTFsUkxJWFcxeFdoa203?=
 =?utf-8?B?TEtZcklqTCtjM285QVM0d1BlOE51UkJER3NCMGQvckVZYjI5anlNTkM2QkI2?=
 =?utf-8?B?eDU1U0trdlRGMCtvU21tQ21OSlpBYzk3U1VXcHpabzVONUJqWXdORXowc253?=
 =?utf-8?B?ZFVmdEs1TTRpdXQ4Nk95aDhQSWhidGp0aDJuVk1aemJEYXg3T3JmOVF3N2Jk?=
 =?utf-8?B?QVV1NzlTTTJvejJ1NlFBR1pmaDhUQnRYS1NhN0djQXNUd0pCdWRiT3VPb0l6?=
 =?utf-8?B?RVdEY2NEVE1YNFdrNm1Xcmp5TEJ5eG8rQWluWEhWYm1LUDhHbzJpbER6anZW?=
 =?utf-8?B?U2lqVjA3dnZpd2JNYmYvTnZ3aFJtRHduUmUvcnc3VEZIOGNLMjJUc2tnZTJE?=
 =?utf-8?Q?xunyX7pcLxF1Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHA5QmFzNm12YlFDbXI5c0FtVUhMbUV6L1BMaEVBc2c1YkpqR3pIQWljU3lP?=
 =?utf-8?B?Y2pBMFBFOThLb3VYNlRCNWl2VkJXRSs0NFh1MUZUUWNjckJBN0VpUElHREVV?=
 =?utf-8?B?QVhibTRWY3orVUN4QWRoSTMxU2dKSThKS3hjUFBZUk0wVXYvbTZCZHl4b1Mz?=
 =?utf-8?B?UnhCa2c2Y2F0MkY2NVJKQXZSVTB1cE1UYm1QZGtPSlBQUyt1eW9ZdUNzckRm?=
 =?utf-8?B?SGQ4TkdNUmVDSVVvaEsrdkN6UXJobkZrVFRhZXhtMEZSQitZL0FYcTNMWGk2?=
 =?utf-8?B?RWV2bXVYUnEyY2pDK0RvOWh3aDg5SkkwampLYysxMitUcU5PQ2JOd05lRDZk?=
 =?utf-8?B?bEtCQVZvYkNRQUJIMVJxUkZia2JkY2FUQ0FocmtqZzdhQW8vYlJ5OE1OM0w2?=
 =?utf-8?B?TEliYmdZWXFVdTFlL0c2bHBmeUV5bnZVYnhycHBUdXd1YlVSQ1JTTU5Xd1ZO?=
 =?utf-8?B?S2ZaK2pYeWhIMUl3VUIvZ29oYXRXZXZyZ2xzQ1pWck8wREY5dXh2S0NlRW54?=
 =?utf-8?B?QVhRZFFmUllSWHRKTkdPS3dyY1NHVktMeHJFSHNlYVNvRkRrdVk4WWNyWXNT?=
 =?utf-8?B?MXAzSDVDVE83Z0F5OXRXSlgzRitnYzJVejN0Tm85L3lwTURsUUlCNE9RUCtu?=
 =?utf-8?B?dVM0TExpbGMwNDUxZGh2bUF1bk5ySmIwWnZ3S3pqK2pBUkNJOCtsWmpsQlZY?=
 =?utf-8?B?QW1uc1VoMFFLcjVJS0YwNHdObUVHQ0ZMcmMrcGJ1M0N0TlRKYklXTDk4a1dv?=
 =?utf-8?B?bnJJMDYrS0UwYkMxUVVuVGxYMEgyZ29uVlFla29ZeDZ3TDJRK0w2R1VCZXpX?=
 =?utf-8?B?RGVXYTlJWnNwY0tYN3JqQjE1aWh6VlU0eUIvU1VlaVRDOHlXQTlydTRtdXZi?=
 =?utf-8?B?Z1lEZDFON1luVWZ5em02ei9SZnYvVXE4VXlycnYwQUlqNm5FZUVmVHoyMDJ2?=
 =?utf-8?B?bUVVYldrUlF4ZVRWNkRQNnlxNUU3RHZRekpaQko4enREWkNZWmNkTUd5MTlT?=
 =?utf-8?B?RGd6VlJCcEE3VHN4ZVdoT0FRVU1QNEhxWTU5cnVxL2lsZ3ZudnBSdGFPZ1J3?=
 =?utf-8?B?Qnk2cnVCZjYwS2ZyMytoOUE4eWl5U1hrcW1nMThpV0FCVmF3aUIwblpOL3Q0?=
 =?utf-8?B?aDlxdlUwQnR2MU8yaHBvQlRSS2EwamlpUGo3YklmWVJVQ0tqZmN6NTQxcEpi?=
 =?utf-8?B?TFVjcDg5NE1IeGE0SnpMV3JzN2s0UlBWUEJsUFBRVjJXdEZmem1OcFF0Mzgz?=
 =?utf-8?B?UnRPNnRXbGd1d2l2MlBSMmdxcnJqbEYzSHVyckd3VGpZUXdMWmJKMlgrMG5L?=
 =?utf-8?B?V2RLQ2ZjSG5TY0liUXVZcTRSNEhma0l1M1FsbGVlUm9pZERVQk1yUW1Wb0cx?=
 =?utf-8?B?blJJMmFubWxZeG1ycGNEazArSnhiSWJFRFZDOEUyMUpvNU9pSXNJZXhqQXZq?=
 =?utf-8?B?c0FZNC9id1JsN1VQYmJBZ3pvZnNMallta2VUaU9WandaTkpic2NtUWdSVmh5?=
 =?utf-8?B?ZkRNeEJVdnV0eWhJUWV3SDRBN2NxNDMwbzVNSW9EMG9TL2tqK1dML29SS290?=
 =?utf-8?B?SHNXdkdvaTIxZE42a1RVRGxGVVZtMTYzYnFCM0gwbXoyOHBrZXVldUlZVUZ6?=
 =?utf-8?B?dWx6Y1RoeTFmZUo5a1RVSTEzNHBDSUZINGd2VS92NWJVdm5ucHFtNGZsTWhy?=
 =?utf-8?B?ZXhSdkVXZVh4TnhSWTNialZtaDdRL2ltMnBtbjJGZC9jUWlrNXVoWlppZFF1?=
 =?utf-8?B?Zkx1YW1oalRuYjMvS09hNHJhT1p0aVhMc0ovOGhKT2NyTFptb1BQOHRvSzE3?=
 =?utf-8?B?elAreEdOQUV4Y2t4bG9PZEx6cloxUUZxMXR5Ry9KR3lqaDc1N2lXRzFUWExr?=
 =?utf-8?B?Q0UzODNubWhYSUc4cUMvUE5RWWFFZjByQmVYL1VDMzhnRzV6b2VnMzNpUXRD?=
 =?utf-8?B?ZTdEMXRxK3ZXRk1vSzgrS05jTm5OZCtTNU5qWnRFbW42ZzFXQ3JZbFVoTUxy?=
 =?utf-8?B?WDBNTktlN3BhbUdIS054N2ZTNVFQbFc1R2ljU1RZK3VKWUdKS3RQM0J5L2sv?=
 =?utf-8?B?dk5RZG8vc1VGNjBjSjg1ZG9ScktZbFFqRmI3alUwSk56NjNubHBkTWZ3cEg5?=
 =?utf-8?B?RzJramlzVHEwZll0VmU1d3BhYTNNSFk0L3ZOYTVocW55OEt5MGZmNFQ4aG5n?=
 =?utf-8?Q?HAg2WtgHQ0xlRsDplXpiTpc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 61a7436d-5182-42f1-b4a1-08dd4d2aee39
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 19:08:13.9162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXnroIVcDzSOcPH1c1jhSfrcH5by7DX6B9MgfN1qRlrVBx6m+qxKDmFAWJVaozPR3N4skmHtXWUozxC7CkuMzoO/IW/gwJvG4Yc4y3OAY2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8484
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

On Wed, Feb 12, 2025 at 03:28:29PM +0530, Riana Tauro wrote:
>Add a test to validate engine is idle by reading PMU counters
>(engine-active-ticks, engine-total-ticks) when idle
>
>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>---
> tests/intel/xe_pmu.c | 35 +++++++++++++++++++++++++++--------
> 1 file changed, 27 insertions(+), 8 deletions(-)
>
>diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>index cbb825755..b47be23ac 100644
>--- a/tests/intel/xe_pmu.c
>+++ b/tests/intel/xe_pmu.c
>@@ -21,6 +21,9 @@
> #define SLEEP_DURATION 2 /* in seconds */
> const double tolerance = 0.1;
>
>+/* flag masks */
>+#define TEST_BUSY	BIT(0)

s/BUSY/ACTIVE/

>+
> #define assert_within_epsilon(x, ref, tolerance) \
> 	igt_assert_f((double)(x) <= (1.0 + (tolerance)) * (double)(ref) && \
> 		     (double)(x) >= (1.0 - (tolerance)) * (double)(ref), \
>@@ -79,11 +82,13 @@ static uint64_t get_event_config(int xe, unsigned int gt, struct drm_xe_engine_c
> }
>
> /**
>+ * SUBTEST: engine-activity-idle
>+ * Description: Test to validate engine activity shows no load when idle
>+ *
>  * SUBTEST: engine-activity
>- * Description: Test to validate engine activity stats by running a workload and
>- *              reading the active ticks and total ticks PMU counters
>+ * Description: Test to validate engine activity stats by running full load
>  */
>-static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
>+static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci, unsigned int flags)
> {
> 	uint64_t config, busy_ticks, total_ticks, before[2], after[2];
> 	struct xe_cork *cork = NULL;
>@@ -97,14 +102,18 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
> 	pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>
> 	vm = xe_vm_create(fd, 0, 0);
>-	cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>-	xe_cork_sync_start(fd, cork);
>+
>+	if (flags & TEST_BUSY) {
>+		cork = xe_cork_create_opts(fd, eci, vm, 1, 1);
>+		xe_cork_sync_start(fd, cork);
>+	}
>
> 	pmu_read_multi(pmu_fd[0], 2, before);
> 	usleep(SLEEP_DURATION * USEC_PER_SEC);

Usually, I see 3 cases for a single type of test

1) idle (no spinner is run)
2) active (spinner is run, both samples are captured while running).
3) active, then idle (spinner is run, capture second sample after ending 
spinner)

Can you also please add case (3). Rest looks good.

Thanks,
Umesh
> 	pmu_read_multi(pmu_fd[0], 2, after);
>
>-	xe_cork_sync_end(fd, cork);
>+	if (flags & TEST_BUSY)
>+		xe_cork_sync_end(fd, cork);
>
> 	busy_ticks = after[0] - before[0];
> 	total_ticks = after[1] - before[1];
>@@ -122,7 +131,10 @@ static void engine_activity(int fd, struct drm_xe_engine_class_instance *eci)
> 	close(pmu_fd[0]);
> 	close(pmu_fd[1]);
>
>-	assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>+	if (flags & TEST_BUSY)
>+		assert_within_epsilon(busy_ticks, total_ticks, tolerance);
>+	else
>+		igt_assert(!busy_ticks);
> }
>
> igt_main
>@@ -134,12 +146,19 @@ igt_main
> 		fd = drm_open_driver(DRIVER_XE);
> 	}
>
>+	igt_describe("Validate there is no engine activity when idle");
>+	igt_subtest_with_dynamic("engine-activity-idle")
>+		xe_for_each_engine(fd, hwe)
>+			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
>+				      hwe->engine_instance)
>+				engine_activity(fd, hwe, 0);
>+
> 	igt_describe("Validate engine activity with workload running by reading pmu counters");
> 	igt_subtest_with_dynamic("engine-activity")
> 		xe_for_each_engine(fd, hwe)
> 			igt_dynamic_f("engine-%s%d", xe_engine_class_string(hwe->engine_class),
> 				      hwe->engine_instance)
>-				engine_activity(fd, hwe);
>+				engine_activity(fd, hwe, TEST_BUSY);
>
> 	igt_fixture {
> 		close(fd);
>-- 
>2.47.1
>
