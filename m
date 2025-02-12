Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355FBC02198
	for <igt-dev@archiver.kernel.org>; Wed, 12 Feb 2025 13:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DD410E276;
	Wed, 12 Feb 2025 13:40:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mw3ljjbf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9977610E276
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Feb 2025 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739367628; x=1770903628;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=A9gxXMC7E0TtZJ0DHhxCCBK2q0bKMfw8+KWn+tge0m0=;
 b=mw3ljjbfY8fhZ+sUfEX002KbFH0rl53iAnCMVb1kZYH8JoR+DRQnYJY5
 iu0NG1v62qA4jcusWgd/M7Vu3Umycrk6jzyIX/BlZBOacELGCcOChaUQ8
 GC8o9YOzKELnBlMD8uqNoqplLPY3XsMvPMOCyZCNm95vJsJwoAlJMQZ0B
 kHFm2NnYje7/XoKsKmJua9+8iai0y37Jh7nhqDj1M7K2eH192qREiX/ub
 4BgetxSxDFqHs7Klgb7BPAy7KyAcBBkoIkS5n6eCaVaveN4cDq4ox7njP
 8lPHVeL70CEqGj8GZv14c/P3kgMKhWoMPdLPU9rsBFh0CGEj7phHaFOL5 w==;
X-CSE-ConnectionGUID: TjZUb6X8Qj+DARGRfKifmA==
X-CSE-MsgGUID: BsKkmIWZQ3yABBJvKjDHsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57427737"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="57427737"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 05:40:28 -0800
X-CSE-ConnectionGUID: O2CdmLrrRpiVRgekqj345Q==
X-CSE-MsgGUID: o4ZuiGG3RzSziHilV1Jk1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="112657348"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Feb 2025 05:40:28 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 05:40:27 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 05:40:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 05:40:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ge4kogaEXH6TPk8UDyvb0n/TBLBgX82HS3lL4PfNXLFx/gvxoebpQVa1+N+2sgkb9gUcJJFDoIHrK+PLnrr2jnhdiSY8dHN4anJ4zDbvCNhRyeQjD1zF6Er9vKqnTN5+VZOC6ltjxqV59c5tZ2O8digdFyF2EyfVQvYpWqTvm2GCbJw344NtLNfufK0jN0sZ1rCX2VlmOjkrBCvGbn6XawyVatFTfgFYs1OdW5RbUr2O0NsfponqTAiuTVNxBrGSEzGorTIv60M+ZbizzBoKPvIYJA6lliQ5qk7EKIV9XDI6TAv6JdNLXbW3csLfN/YoLrhBWnjQiZ0nSI/OosunIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2BI0M6D8X5kj+Zb6KcjaUO6oT9NKsiQaGWuMgLqqQNQ=;
 b=nhEK9RXAJXml+zMLOwoPpkppsNLfYosts9Hii9wragDMwn/+LnNObEBULOher2gqQaMNvLLOho47mabuVlCqyRWLrOP1GtB+HpWvwvbK3xlBxo1lFJKaK7iiBuhmcPpMXKpZLbOcXG9XYbfyK78HvYAU5SW6vHDmFrCMnWxOKtl8pAUeFMneR7RwcGyZZE3MOb+JqXW/ayBgCz50e7Ag6Sp4P2cDbfPROtHA3Iq6aesWlCfQo77g2YW0OBXN/i2OTjMWQ6zs0B6g3lz4BfStq2d3VKQ16+pWEBmkwmIg46O16PrwytPA86EWw1RnW8hG63gMCcLm+OdN+UkLE1nDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by LV2PR11MB5998.namprd11.prod.outlook.com (2603:10b6:408:17e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 13:40:24 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::4610:6d6c:9af6:2548%5]) with mapi id 15.20.8445.013; Wed, 12 Feb 2025
 13:40:24 +0000
Date: Wed, 12 Feb 2025 13:40:15 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t] tools/intel_reg: Add --pci-slot option
Message-ID: <xc6requiewswst7w4vpl5beezwwotlqqrg4efy34ynvyexk6jk@bqndrc7rgmla>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20250131213733.142894-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250131213733.142894-1-kamil.konieczny@linux.intel.com>
X-ClientProxiedBy: MI1P293CA0028.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:3::20) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|LV2PR11MB5998:EE_
X-MS-Office365-Filtering-Correlation-Id: a608db5b-9474-4449-f346-08dd4b6acd58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U25mTGNSZVhtN0t0anJBMHp6d3krRkl3dllYQUppNm9WWmhuTWRzc2crck53?=
 =?utf-8?B?V0xTSUdXNnlWbjUwUmxYeDJlTStTUitqS3AwTUVPMzY2WnBwbDhsSzNXN0ts?=
 =?utf-8?B?MEFobStqcXpqaFBCeisxVzZvUmdyRGYydjdCVnRyS0EySmlnR0tPL0xPeWFR?=
 =?utf-8?B?ajNYQTZBQVZpZWU2eVRCVW5SSHVFRUkzVkNkSUpZQzdmVjFKazFzMFVYODJR?=
 =?utf-8?B?T0o5emlFVGFuUUw1L2tRUjlKa0xac2E1b0pEaS9IQ2pFWjl4NFcrTjFzRkxp?=
 =?utf-8?B?ZmN6WGhOYW5xRGJpT2dOLzdUd2F6YXBuc013TC9QQ2RsZ0RXUnZ1VzBOTTRJ?=
 =?utf-8?B?a1JyUXZld1EzZmUzNHBrVnpNTzUyWmI4Szd2SU9jOW5ENnpxY2MvOXBwZ211?=
 =?utf-8?B?dEt3cDRFMkRZMFdzSU9WNnd4bHlLdU5lTUc5WlFUZHJkWnpWZlY4SVN2cXZR?=
 =?utf-8?B?K2FIRDVnKyttcDdnZWNuSkVpUW0rOTgyVFo3TktTbzZvUWJudTZMVkozQWx0?=
 =?utf-8?B?YVhRNDArNFErNVhrbXV0NGc3L2s0RmdiT1lKSEdIOUtNRGpkdEFRVlNkT3RJ?=
 =?utf-8?B?Z1F2ZTJNSnJKTnpnVVFjdk1PeDMyWnlURzRzclNxSXB1VVZ1ajdRcjBKYVov?=
 =?utf-8?B?cEZJT2N1cW1lZCszYTZtL2x4VTJGUTZ1d0o3T0tOaWpFWjhWUjBVcmw4ekNB?=
 =?utf-8?B?T09RcUZIdW1jQ1VEQk1hRVhFMzdlRmlJOWhvYzhxdmVCOGdZWGxYUVhzZ2tJ?=
 =?utf-8?B?K29PKzYyMjRRNDNYMjVxOVhnOEx1VDBmOS9PNkY0elYzdjJzZ3UwTDdSMjE4?=
 =?utf-8?B?YWJuNWcrMVFOOU1PN0RaSi8wUmZDYnhwMXZ1cUZnQlZqQ3F1a2JDbExEczZB?=
 =?utf-8?B?eE9pMU9qSXU4ZVc1eHdZYTg4Q3hxQUlYS3ptNWFZYUNjOUN0OFlhN2ZGMVJZ?=
 =?utf-8?B?Y2lJeTRoZlNjc3RvaGFBbTg0Mjc4eEl0MVlVdXJFaThuY04reFBIcXEzVlNL?=
 =?utf-8?B?Zk92cHB6Z3NlcEVJSXBjTFZwY1RaZ2kxeWFFUkt6MlZpWW9iWW1zTGdNc2xp?=
 =?utf-8?B?MXpYd3VhZks3UllBRHV1elJ4ejBGb0w4NjdPSWNJd1JBTXFZSEp6Nlh5UVE3?=
 =?utf-8?B?dWJQdm1MWG41alNkR2d4NzZTOWpmb1JlZHRBUTRQb2VkZm1uUERWeTExS010?=
 =?utf-8?B?dkhWY09LT2RKakljT3FRcXRmMkVJVkx0MkdvRk9xWUg5Z0FBd0NvbXNxWjM4?=
 =?utf-8?B?c1hmSVFodE9rcEVheCtIeU1nWXJGMmcvaDI4TzF0TVVqRi9mYTJkOG1LTGVP?=
 =?utf-8?B?dG9STmtVSDNtbFNiTDFJMkgwZlhGei9lNk02Yll0M0ZhMGtrNUY2bjVaZkZ4?=
 =?utf-8?B?Mit0WWRPTXVLemM5bkRpQkk2VktYTVNlMnloeTVUSlJUT1p6eWF4NE1HbEdV?=
 =?utf-8?B?cVE1elRCSUl5ZmN6eE0xSDZuNW1vcmhHWjRKSjA2NmZ1UkZZd1FlR3JTaSs1?=
 =?utf-8?B?cGNidFB5N1dhdWk1SGhwT2ZkK09OalJBTGw0aUdsVW5mSU9udmtaRk5vSDU4?=
 =?utf-8?B?bkNMR2dXK0tYSHA4SHQ5OVdaVnBWd3hqYWF6MU1NT0ljbC9xUHQ4YWhicndG?=
 =?utf-8?B?YUVnQ1ZxM1pwd3ZLM1JUNStYY0RyTDR2ZjRwNWNZZERnT0d4djhaYW16OCtV?=
 =?utf-8?B?Rllnb29UZXNQbFJhNUEzcVNLVSt0REJqbHFKWjczNkdUNWhRZU5pVkhTSDVV?=
 =?utf-8?B?Q0NVMFVkMXVreHIrbHpxMXpYZWhEb014WUxLWnh2VHRjQXdFanN3c295MG9H?=
 =?utf-8?B?U2U5cDVlZ25RNUFyOTZJNUFKRzZjbFFFSklPRDBMWWduaDNlOW9vUHU5WGd5?=
 =?utf-8?Q?us5bjnXQM/Oj+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmhWSzRxN1NMWWJSVmZZY05UbTFaeE4wWEZZVTVrMzRsMHpzTDF5NnhDUWFW?=
 =?utf-8?B?ZVQvbjZTdzFFNGxwN1BieklRUDhvb2JYSzIzZGxEZDI3ZnV6VUhuQnphM2lV?=
 =?utf-8?B?a0hEbUFUcUgyaDVUa0xiNWNGdnd5ckVkbTJsdk1nSWUzYWZYY3dmNTYwRjFC?=
 =?utf-8?B?YlJzODhSQWNscStVdlpJRi8xTlg1WXNSUTloOVFpR1EwalV0QTdodmhwVFlr?=
 =?utf-8?B?RUVyMlFLN2xPWm1PWGtKU1B4bVRqSXk5US92STBXNUhpdmhQblhxZytrWnVj?=
 =?utf-8?B?cnJnbDArdjY3ZjN6TkxkcHpqUW5oOFQrT3Y0SlMvbmg4YUlJY0FQdE45SEw3?=
 =?utf-8?B?MG94ZkJma0VXVHJkOXp1ZDgrVkFNT0RRYmd1dGxWR3pLWlhjaEVpZ0s2K2VD?=
 =?utf-8?B?d3B4NFZ0czRIQm14OWZ0UmFtcUlUL2trYVVRQXJqZ0FkMnBtcXJja1h3UEFS?=
 =?utf-8?B?Q05DYU8wcmlYTVBmMGY2cTUrWXdsTXJ0OUxzYXh0N0ZuTzlsajFkQmZoaE1B?=
 =?utf-8?B?N2NVbHFNeWNHODFyU2gvUTh0eU1VRkF2TU1oY1UwQkZEV3Z0b05LR3FROW15?=
 =?utf-8?B?VUs4NEk5VlNidk9xTlZHQ3kwcVZVMUd2ck9vOFpHdUFqRnFoWEVyQXYxZ3Qx?=
 =?utf-8?B?em52SHhvTDk3aitiTk5xY0VUSXBNWUQ0alFSWHpuK092bi82VmkzdlhhK2xn?=
 =?utf-8?B?SmZ6bTFQeE5sVWdINnlRd3NMRlU3d0Z1V0V2QzZsNUo0TGVxeFJDeElVN2pM?=
 =?utf-8?B?V0tkdFpmM3lXUzllOGdaWWxrVEtkWGZYNlVFdklnY0dBZDJTNXgrTUJhS2FD?=
 =?utf-8?B?bFNiZUhjekdzZmtDbFRXdjViUVVpeGkyT3JoTVNnMFk2WVJ0aTNuT3l6aFkx?=
 =?utf-8?B?azgzZi94VXh4ZGl2a1IvQnNLSy9tZnpxamRma3Bsck1RMVQ0RFA4eXB6Qllp?=
 =?utf-8?B?K0JNbWZ6dnQzbVdqdUZVMmdocmNwZVJYTkNrMmRYb1ZNVVZwSEl4NmxzYjEv?=
 =?utf-8?B?bGliRlR0ZldUb0kyQ3RwOEZBek9JUTN2YUpzMXRZUitHWSs2OTAxQ2hVSnpE?=
 =?utf-8?B?dGtrcFZDLzhHVWdnME85WCs4MWdqa3pCNnRiS0tZNHNHQmliNXMza1c2NDVL?=
 =?utf-8?B?YWFOcVJzenZISTkxUGx1c1R6dmQyUUZaUlU2aXYrZU9qVjR5RVJGN2E5R0pT?=
 =?utf-8?B?d3Rhc1RMY1JTN08xRWkyMkpRVklwQW9zT05LLzhyWXdqRExOUEFXbS9Fb2Fz?=
 =?utf-8?B?Tlp5V2s3a1lJMzN1bVlwbm1VNXlNcnR2eFIzYzVQd1VmMzJqVnczMmc1c0Z3?=
 =?utf-8?B?bU5Fbm9FQWtXQ3h2eTFkZ3ptWnIraWdQRGxSbjgya3A3ZzhPVXVyUDFRTG9w?=
 =?utf-8?B?bkxoQTViNit6OENIbVZwOUdaRGxJYUxiekVBYnlwaFpxS1A4SmR3NUJuYjQ4?=
 =?utf-8?B?UlR0eE41RjViRVE1bnhTSG1Ua1IrWTVReGhBS3FUODlVWVhiVXYrVk1GVXNj?=
 =?utf-8?B?N096a3hub3VuQTVPQWF2dXAvUE5NdzJYT1dWQzlIblYvWXlJdXdHVndWVThy?=
 =?utf-8?B?NjdwUFdxWjFtb3EwWWwrRHI5WHhZY2dMM0pJTFF5MjVxSFd4Qy9Ia0ptNHJ1?=
 =?utf-8?B?L3Nua2RzK0FZU2NrNHNmSXJzOVBqRTJ0RzVyN3kxLzNmcnNvVFV0YnQrRThj?=
 =?utf-8?B?RzhkTFFmMDM0Wks5RGpHcm84aWdIOTdZa0o5cjA4NkN0V2dweEg0eHRFN0Vk?=
 =?utf-8?B?MjUwVSt0RGdyd2VVeHZJeVMyK0tDNWwyREhuMGJDVStuby9tNFdsdWJxMmNH?=
 =?utf-8?B?ay9wTjlsdnp1K3E3R2VrUmoxQm5yU0dITjg1TGdYSXovVDZ4SEIwckxreWd4?=
 =?utf-8?B?bFhPWEkybFFXTUdjNUhLY25RdklwRXZhVGZNcHVnTzZSOE9Vb3JFNzNyTkdk?=
 =?utf-8?B?ZDFSRWVjYnlQalBwa3FpYTVMV2VUL2pUdlRqV0NFQ2I3bUpRQmRrc0RjU1lt?=
 =?utf-8?B?OE1pa2ZodUVLZlpRdWo4Y1pHclk2c2VDVHhLTVNYNkZkWGxPeHlTMlJTa0tu?=
 =?utf-8?B?dkZ0SFcwSW9nTjFad09HNmNwejQ4RldQZ0RSd3dnZFlGNzJsbHgwQ25HWVVl?=
 =?utf-8?B?cjFUL2ZqMW16YnBVdGxJQ3ROSWFuQlc5YzgxWUtPbS94Qmk5eDlKb2FzZmZS?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a608db5b-9474-4449-f346-08dd4b6acd58
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 13:40:24.3592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0GUdoFgAaxMImjmuOsbV+i1PLCMsA01ODhz1OoiN9PHa22zG6svNYB33G6dvPFryRrhAZR32pZNDDZxjJm88I8IKiZjywgVYp7cXCZQtEo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5998
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

Hi Kamil,

[...]
>  	printf(" --all          Decode registers for all known platforms. Implies --decode\n");
> +	printf(" --pci-slot     Decode registers for platform described by PCI slot\n"
> +	       "		<domain>:<bus>:<device>[.<func>]\n");
You could include information that if PCI slot is not provided,
then the first matching Intel device (starting with 0000:00:02.0)
will be chosen.

[...]
> +static int parse_pci_slot_name(struct igt_pci_slot *st, const char *slot_name)
> +{
> +	int i;
> +
> +	st->domain = 0;
> +	st->bus = 0;
> +	st->dev = 0;
> +	st->func = 0;
If you zeroed bdf: struct igt_pci_slot bdf = {}; before calling
parse_pci_slot_name(), then it could become:

return sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);

> +	i = sscanf(slot_name, "%x:%x:%x.%x", &st->domain, &st->bus, &st->dev, &st->func);
> +
> +	return i;
> +}
> +
> +static bool is_graphics_card_valid(struct pci_device *pci_dev)
> +{
> +	if (!pci_dev) {
> +		fprintf(stderr, "Graphics card not found\n");
> +		return false;
> +	}
> +	if (pci_device_probe(pci_dev) != 0) {
> +		fprintf(stderr, "Couldn't probe graphics card\n");
> +		return false;
> +	}
> +	if (pci_dev->vendor_id != 0x8086) {
> +		fprintf(stderr, "Graphics card is non-intel\n");
> +		return false;
> +	}
> +	return true;
> +}
This function checks whether a pci_dev can be found, probed and
has Intel as vendor - there technically is no information about
this device being a GPU. You could change the name to something
like: "is_pci_device_valid" (unless there is a way to determine
a device is a GPU, then that addition would be better).

[...]
>  int main(int argc, char *argv[])
>  {
> -	int ret, i, index;
> +	int i, index;
>  	char *endp;
> +	char *opt_slot = NULL;
>  	enum opt opt;
>  	const struct command *command = NULL;
>  	struct config config = {
> @@ -1191,6 +1264,7 @@ int main(int argc, char *argv[])
>  		.fd = -1,
>  	};
>  	bool help = false;
> +	int ret = EXIT_FAILURE;
this ret variable is not used up till ret = command->function(),
so I don't think there is a benefit to adding a certain error
code to it, unless you'd change all "return EXIT_FAILURE;"
to "return ret;".

[...]
> -	if (read_reg_spec(&config) < 0)
> -		return EXIT_FAILURE;
> -
> -	ret = command->function(&config, argc, argv);
> +	if (read_reg_spec(&config) >= 0)
> +		ret = command->function(&config, argc, argv);
This is unrelated to adding "--pci-slot" - it could be placed in
a separate patch or mentioned in commit message as a cleanup.

I also noticed that the intel_reg program is not very resistant
to user misinput: if you attempt to use "read" option with
a device that does not have a certain register, then the program
crashes with assestion failures.

Best regards,
Krzysztof
