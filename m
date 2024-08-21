Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3839C52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 17:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6122810E67E;
	Wed, 21 Aug 2024 17:20:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jyRTeM60";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFD210E67E
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 17:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724260801; x=1755796801;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ekmMyKIlp4Orvl1hdLfjeUkiMoYksVHsyBN4nFFSoEw=;
 b=jyRTeM60hxjarHMrmbmMNA6kvGRwhkqzOfY6bMHWy2bFCPplOKFPCarJ
 3ahfQpqUpL94ZK9D4S75FFuAhImu+Mz7e0Vxr5+S2wMAf6qwvnaUpcEdM
 OV9BTaRnfgPwHb4/GY0a4vY5wZ9mEl8LVIMrCwfwKW6vs3jcs89gPHvBA
 6tG28e6pq4P3gnsfeaEPd4x90JbUotncEnCierxqfHKyZbHTOf4zU1Jm7
 YbFvOYIVKD79JQvsatzmvyMO2xqu2G/auwYcIFMpt20EyWqfT8V3v2Ism
 9cZtcNgfHctRBOJLhDgZ7dm45w/YNKK0vgWsh+C9D356mUcCvkgsFggKT Q==;
X-CSE-ConnectionGUID: xB1DYvzBRyGUG8TgZYzr5Q==
X-CSE-MsgGUID: YtSNk830RYCOTH7X8oi8cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33786960"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33786960"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 10:19:55 -0700
X-CSE-ConnectionGUID: H5HaCoPASkq+EzJsNsRCEA==
X-CSE-MsgGUID: Z95LjkZ0Q66xn499DwzYnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="60816012"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 10:19:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:19:53 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 10:19:53 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 10:19:53 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 10:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uAuNML6eNipSNIqbweLYRfRYdXQd4NF5fwhYwG8OhqlZnS0ryqFk2mtZf0umJlHSrOlXY0lgsi6CcarK6iVkvrIUHQpPHU6nAxPzzYlCRKxhDHmsR5okbHCdopRG5kBlXBc9ceE3+iWSalcV1CysZf6Pvw3UHBOKN05K98eVloX2KwxCTg67pt+ahS1cL37DCsXSza4CMIs9xIkjsrQl+ZG83cdHL/sdzHixWpMhtrUG6gwDatndIurio12ZpR5BmSqwyrEozenpyHbVr/Ei7zQoN45k1O0yCwMefD89cWCppi0lDqzQ8+LsW2szFCJn5TROyBvZk1ihRIQfL8bXXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pplZWueX8ey9aj09VPBUogciR1BIhY9BihrWcWC+abk=;
 b=FFvVPKf7v23Zq2wwoqrKa7rbOHPE7MoTEXYfQzrTUV2D/YyLx4VGX6DslZomnu4iB12yPLLzecq/dF56mY44qkkuUUr8kLEBCetSgGmcJ0IJ1IEs5OrH/V1sGWsH8udQBdi+dZ5lx/MPGwbbCsNAJHhPEH89zPJSXykutp9pedRH9+bZQwIzsRdfJPRcybPdOA/68s37Fp5bW2Ks2COL+FVyufIXXdh7pbfK93DyBZ96NbCcEWdjhcXAE3+8MyqN4FYmVMUn7HmwrIxqpEjdE5V1NoYvVuivsbVspzA5G6bHP6RfWzFW1MWDPqXQuGgXC3zf1vIELL/yXP+KpSA8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SA2PR11MB5097.namprd11.prod.outlook.com (2603:10b6:806:11a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 17:19:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7897.014; Wed, 21 Aug 2024
 17:19:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240820232928.458248-7-lucas.demarchi@intel.com>
References: <20240820232928.458248-1-lucas.demarchi@intel.com>
 <20240820232928.458248-7-lucas.demarchi@intel.com>
Subject: Re: [PATCH i-g-t v2 6/6] tools/intel-gfx-fw-info: do not use bare
 'except'
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, <igt-dev@lists.freedesktop.org>
Date: Wed, 21 Aug 2024 14:19:48 -0300
Message-ID: <172426078858.2071.4336985003438744192@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0336.namprd03.prod.outlook.com
 (2603:10b6:303:dc::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SA2PR11MB5097:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb09883-31a3-4526-a42e-08dcc20576fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWZWK0owbGFqL2Y4NlRCVTFYSTIvdWtYdURUUFdPVmZHZlRENlZDWXV1WWxz?=
 =?utf-8?B?KzZOVFVFOW1IQklsRkU2ZTZRbTM0VTJsNWxEQS81OVhTNjhEbDdNRTlicFps?=
 =?utf-8?B?eWRZMTFmTmNXL1Z4eUxaSlJPTVpwR3lyTTNMbmsyRi9JeXk5aHQ5amRzVG5D?=
 =?utf-8?B?UHZiTDRRVGpZNmMrNnRGVVV1Tk9ES292WHFpMUhKdm9VS0RZMmdSaVZvSEgw?=
 =?utf-8?B?NmkvN1RUUlV1UFk1b0tTMklJY0lIZktkSGNXVUY3WGFYdHNxNGVQWldPQUYy?=
 =?utf-8?B?Rm4xSkZIZlZJcExGZjNtRHViSjFLUjY0ZGNnK3o5S3Z3WFRDb1lZZmcwNHRV?=
 =?utf-8?B?aVZSY05jOW9tYStVMFJ4VjFEUjI3STVVRndHcEMyN1lUbWpXdDlKTWJLNTdS?=
 =?utf-8?B?R2ZETTFiWWV4MTFJZmd0c3lCMWJ2THcwSEhaWHR2MzdFYTN4QzY2a3pTZ2hv?=
 =?utf-8?B?SnRYOXgrYzNuTE95WW4rbjJsNGV5MllCMUFjTVBEUHpRMFZIZTVsSEZGTVBV?=
 =?utf-8?B?enA0ZUIyeFlTWDljbUtXeTFQZDY5ZUFBWGRuK2JNL1ltUjM3eWc5dlYvcG5m?=
 =?utf-8?B?U0MwQTdLclBqNzU1MTFoRG5qTFVaeTB2NHZjbjVyS1NkVENYN0YxOFVQQXF0?=
 =?utf-8?B?aTVpYWg2UndoeHZOTjZlLzEvRlBQQ1VnUTBLNlhoVk9SanJGSVZUcjNaTGVs?=
 =?utf-8?B?U1hYNldYRUp2bDZYTXJIRDlGdU1TdDRuTFRJTVV5SFB5UGplU1Yyb3F0Sjd6?=
 =?utf-8?B?NWJTTW1NMmJNWXp5bUswYW4vNnpqcnlXSlJ1S2xhNlZsZGxjak0weTFCQTV5?=
 =?utf-8?B?RW1LYmZhT1Boa1JyeU5SemEwWkRUN2NDRkJXSkNZRkpzL21RSzJVdXJNSHdR?=
 =?utf-8?B?blpmZG1VU3BSL0dMMGxZV3NueGk4ekgzcGROek9pcThpQSt5dDJXWjRLWWM5?=
 =?utf-8?B?UjcwNmgxWEpLZ1IvVTdTbGxIUnhid1o3RVpNd3ZybTJreGZoUXRNcjZOWk1U?=
 =?utf-8?B?UGVncTZTNUZDK1RsaHRtWmFKd0pkMHdrNG10S0szZU9MNm1mdFVrekdPc1N1?=
 =?utf-8?B?c0cvWGpMNTZ5aDhMWGl4NWQ3RnBTcStnK0NXVThCcUxmeVNsMDBMWVRYWmp1?=
 =?utf-8?B?UWJ3K3VIUzF3c29USkpvNEQ3WjBWcTJPWXV4YUVkMzdqeHE2RGlLckl4cmpk?=
 =?utf-8?B?QVU5N3NBQUlpNVhqWWhLUGl5NG5VUFIxcHR4MlBCVlVJNENTV1NsWnZsYUJ3?=
 =?utf-8?B?RHpCMVBLQW5scllSWHJvVXRUZExTMU1FV3F0SWFRdWtwakd3RTVscFRkWTZs?=
 =?utf-8?B?TjNIUlVYTlZCL0tYbUFGOHgwTXdNVTJZREovZGZHU2w3KzdOOXZrSEtXL1RQ?=
 =?utf-8?B?b2VISE8vcnZDSnU2dUsvbDQ2OHRGaVp0d0xRMWpZNnpWN29oOE5ScStMZDBK?=
 =?utf-8?B?c25jZHBudXFrUXVCRzUrLzc4UVFTeE9reGx1MzFVSjZ3U2FhTDRaL1VBdDRl?=
 =?utf-8?B?ZWFRZ2RsUktNelRVVUcwcEs1VExid2lqSjlNQnpsdFl0RWJXdnNXN2hiNEVp?=
 =?utf-8?B?V3RxS21zdkpPL3ZSbVl3cEU3TnNRditrcmc4NXJtYjJxdWtUcnZwWjNwendZ?=
 =?utf-8?B?ZEdUcFYvTDcwZHVpQjkzWXJJSVhMNnFYY3NlVFYvOFlWbDRFUkFSQWY3N0Ir?=
 =?utf-8?B?bUdocE5nZTFjWXFBTW9iRVZJVHA2VzQ4cjRCaWcwUTNFWWM2K01rOFNzYzVp?=
 =?utf-8?Q?eEqVXUPwQcTF6C7AbU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDNJZ2dOdFd6N1BOMWNSZ0oyMzFTV1JuT3ZRRTE2akYwZDVvWXpKWVpETFhn?=
 =?utf-8?B?cTdsWVJKUGFaODdsRTVDNGExenRDQmQyNmFBMDAwKzF3bDhjMjRjRE9oWXBh?=
 =?utf-8?B?eWo0T3Zjcm5jdWhUQW4vZTJNb21NazlpbmZiYVdZOHZVTG1JY1plNUVxOTJK?=
 =?utf-8?B?b01oS2MrdGJDR0VLbnNnZVNsbGloNE5ieU5NWnVRVUwvTll6cnNOeUphZTJ2?=
 =?utf-8?B?Uy9uanQxZDdpYmYrV1pBZVVzUHJhVVR2UFFTWXo3M3VKUVFuYjN0dmFQdmpL?=
 =?utf-8?B?bmNSdGFxaVkvQmFJT0d2MHE5QTVVV1VHUXRXbDdMZkFFY3Z2dlU5NENFem9X?=
 =?utf-8?B?SFBGQzhmamdneks4RG5tcHd1ZFMxME5HOGluOFFZVzhnWTRuL3BtZHVrZHAy?=
 =?utf-8?B?bklBdWZIcGdYampVSlV5STRmTWtMcVNuZ0YvRDBLRUJjc3pPS3p2WmFHa2pJ?=
 =?utf-8?B?WEFPMFYvQzZmZ0lReVFmSnByOFhCSEhKOUdRYVllS29la3Bwc3JQVjQvNXVu?=
 =?utf-8?B?anlXa2hIU2UvdXYwTUMrMFBrK25HY2NTQWdsUXVMS3RLOUVGS2FLRVhQZXVL?=
 =?utf-8?B?anZYSWppaCtmbW5LUk5FcmVTbFRZQzMvMU9wTDVvcnFMdDd3blFiT2JFYVdW?=
 =?utf-8?B?cU5pVVI4N29OVHJaYkx3NTJVSjhLSFNBRUNuMFZUWWpmVlkyMXNINVR5N3E5?=
 =?utf-8?B?QVg5cXVlcE1HM3BEc3BoOGNUaVJGOHV6ME1aSTJmSVdsSlFBbmVQSmtpUCtt?=
 =?utf-8?B?SEM1bGtMWURMVWliZ2hOQklyMHdCa3J3TDRJcUNQQ1RidDBLSkwrRVhrQmNh?=
 =?utf-8?B?TDhTMDRNZXQ0MkkxTDhyQk9EcUtiWS95SVpHRXpSaFV0UThjYmNtbU5NeWRS?=
 =?utf-8?B?eEJraGRDc0F5czhEYmxnYk5TZTZXM01vYit3Yk4zVjVtUDFLaHlGaHJnUnRJ?=
 =?utf-8?B?Z2pnWEVyenVRbGJOUlJIYXc4eVVodUlqQWEvOXZMRit4cTRtM3Z6ckF4VThY?=
 =?utf-8?B?OStZMy9UZ0crTll5eERNRnhueDZTUDJRNmNuVGQzUmRwckNMQUNZUlE2ckRD?=
 =?utf-8?B?MFpVdVhvS01QaUtGWC9UWnNYeHpDNXNhUVd0eXBHK0l5cmU1a25TQnFRam4x?=
 =?utf-8?B?R1VKKzc0dXA5a2d1TkI0Yml2YTMwWE9Ccjd0enAxbHJYUHlla3RyNlZZUTNC?=
 =?utf-8?B?WWQrR3prdHVFYVk4b2xybWgyWjF6Sk1MdWk3THdzRTNuTDlIeFNTUk1YZmhT?=
 =?utf-8?B?TGltL2dwZGxUcFlqdTdXVDVWV1NvRWpHRU5VcnBlQ243dWNxQnNrckVScHVo?=
 =?utf-8?B?Vm9TNUkzaGkzSUNtandPdTJyeXVLbDhINUpzT1hPY0FXak81ZDN1aGVKRTYy?=
 =?utf-8?B?M1A1bXpodURYRHhzUW1VZ2U0dmxUQUVDczRuWkZaMmNOM1hkQUVzZUIzTTZC?=
 =?utf-8?B?S1o4SkdmSnkzMnI3anN3bFVPYm5LamFmTENOUHVRMW1SREFQS01lRmdqbnNQ?=
 =?utf-8?B?LzAyT1ZYaFFuVXl0d3ZZSkpZZ3NxRk1UQkNpVDZnbUd0aFJESCtCbzJjcW10?=
 =?utf-8?B?YkpTdXBtOTZXaVYxV1dFSXM5UlYyWjlCRWord1dyd3dmMkl1Q3hLcFl6QXU4?=
 =?utf-8?B?RUN0NmRFU1cwNktRUzBlMmVqN0ErMXhRZ2hPUlJWNFJRUkEzTlpSL1VITGV3?=
 =?utf-8?B?UGlBdDdrSEJUemIzblFPcmd2U1VDMFN2bjlDY0h3S1R3aURyVlhZUHdTR1ZG?=
 =?utf-8?B?WXk3eHR3TVA2MHUrNVU0UDlsZ01kOWhtVWJ4UXJxejB0WnJTbTNxZ09ucmdT?=
 =?utf-8?B?UEErZFVSYjdGOExWL2VYSi9IdUNxNlZnM0txVHBNNWJMdkVnYTRoemdxTml6?=
 =?utf-8?B?MzJKT282SHRkYWgyTm9iNk1sMFRQdzRKakdqVzltWnlLUDJDTDdQTkdiUkQy?=
 =?utf-8?B?T2lkMG8rcnBYMXlPTzlHTDFDOUxNYmVnKy9ZQ2hYbTZkVzFuYkZLQVhkSTNY?=
 =?utf-8?B?eUQwcXBXQkYzOHJFVVg0TXFQZjAraFpRY3NpTkY4UXZ0MzRLbVl0MWNCV3JI?=
 =?utf-8?B?YzNEK2p1RHJlMUdxdU0xcThmWWIxQjYrOTJMODh2dkZjbTd1UDQxVVBhMXBQ?=
 =?utf-8?B?NHJFSjZrRzRsbGdpd3o2OVJPbzhZeXNNY0liYXpSb1had1h4VEFqTDdRUVJC?=
 =?utf-8?B?aXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb09883-31a3-4526-a42e-08dcc20576fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 17:19:50.7613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UgBdNoo0UDMKxQ3iubuH+RvrclISvXgfRMdA1g3W3x7mQ0o5QWoNLwF5pZB4Sb9zRZpQNC7YDm6C1Zwji22k7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5097
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

Quoting Lucas De Marchi (2024-08-20 20:29:28-03:00)
>From flake8:
>
>        tools/intel-gfx-fw-info:137:1: E722 do not use bare 'except'
>
>Now it passes clean with --ignore=3DE101,E501,W191 - those ignores are
>needed because they are triggering in the C string we use, CDEF, and
>flake8 can't bother enabling/disabling warnings per block.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> tools/intel-gfx-fw-info | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
>diff --git a/tools/intel-gfx-fw-info b/tools/intel-gfx-fw-info
>index cbabda913..3c9b47809 100755
>--- a/tools/intel-gfx-fw-info
>+++ b/tools/intel-gfx-fw-info
>@@ -133,11 +133,11 @@ logging.basicConfig(format=3D"%(levelname)s: %(messa=
ge)s")
>=20
> try:
>     from dissect import cstruct
>-except:
>+except ImportError as e:
>     logging.critical(
>         "Could not import dissect.cstruct module. See https://github.com/=
fox-it/dissect.cstruct for installation options"
>     )
>-    raise SystemExit(1)
>+    raise SystemExit(1) from e
>=20
>=20
> GSC_CPD_ENTRY_OFFSET_MASK =3D 0x1FFFFFF
>--=20
>2.43.0
>
