Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A5C02198
	for <igt-dev@archiver.kernel.org>; Fri, 14 Feb 2025 18:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA8710ED34;
	Fri, 14 Feb 2025 18:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwsILgAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2B10ED34
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Feb 2025 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739557633; x=1771093633;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uvSbMKd9JR/Mk9kB0ScJpgC+yopRLsiFxhDDH8OUnLs=;
 b=nwsILgAr8IAxFj8mLj0E72gr21pC4c6zcL6b39g+DAtiqdHEkzPd3vSe
 t/I28G5DGhmAuKDjAF5Enj+wtBmvOlOn/RDXh+vGthi6q/ORzFxwhSZoM
 8sFnGRpiAutulDGcD2AjEoUz2T04kOn07HziwKQGyHPhJKgVJfl0zCjrc
 CbCJRmHjvGW8rQhaIEHSggxQK8k5Lfiax2/HLW8rofgL78bLy8LVY8uy2
 lo2Rpz9uI0iSYdU9XGFQidEIUL0+QS/iucP9pfPiLVGltmfAzAJSBkQwA
 NjsN+n1m48N8+tV4wO2Gub4NrkrEBQpOnsb+u3dQs4TxEvRJC8WVim4jD A==;
X-CSE-ConnectionGUID: Ms7yZK19QQCtIzqdu2TbWw==
X-CSE-MsgGUID: avASSNIzTRu2MpZ7p5dzdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40441285"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; d="scan'208";a="40441285"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 10:27:13 -0800
X-CSE-ConnectionGUID: reVHcOmjQ9u8zRGhihJrPQ==
X-CSE-MsgGUID: qkKwzS7fR7udE924qt4gTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="118728781"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Feb 2025 10:27:14 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Feb 2025 10:27:12 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Feb 2025 10:27:12 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Feb 2025 10:27:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHDNfBgg1NPswRwk79PelMST+z2NIpjZ8ZCcwmJWl+CWFFn8SXYaEd7hrV7VKxDAvHHtNRRRQZmRxCjVfEFLt3z3AOrAIjHBSyiIQgKq9yLL40kxGKlhXN1QtvCI3JRSgtOXrqqxIcAnsoGMjOJYDgACCzXkqHZGdxPHAkjQmGxsogAgxnr2+X1oP1KEVJaE060q6LvXFp5qqol5KWlsfCV63n9kvKI2VUUrYE4XtDRFAHBAPVNxIN3itgadNNyvriRArxKkgw7i1aZOVKCia/bjOZEKMjz48AgrTrv85XggN/5wIpT/MPcTIdK3nsxQtWuo/YnlhT5o/XGvV+RPEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nrjs5jdUEw1dESrS+ebt9HsO3AnnT3u1DI83Af8WHnM=;
 b=f83RaZpD8hauRxrOaVLp3PB7N4zwvkgwcvXGFx9NFxSHpCyauWfog0StDgZHOjdLpzDnRt2b3NEKwDL5pXLHcDbQt/xYNzy3pWQ03Y0bIUO5BdJo8ha9ytc9lFSOtjQPaXI8jo4uLR2C4TY+BLCE/2RhODJXYg4KDXvh0cZ1x0nJYaxSsJEE5rELFVy5T39VaZdGMdC9xkuiI47BqzlwO+ld5QwMkXcKmhOjGeibSxZwxjMMuzYe5peZycuQ7pRJsCU3BHuQKcTcNlN5+2QjDp3A7Hfcdgm708ujYNIF3U2bo/YdL9+BaLJSyq9GAleoBE4pwD1UWsnGfR9GWxXEQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB8132.namprd11.prod.outlook.com (2603:10b6:8:17e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Fri, 14 Feb
 2025 18:26:38 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.013; Fri, 14 Feb 2025
 18:26:38 +0000
Message-ID: <7f66b930-2061-4204-934c-fee454992ae9@intel.com>
Date: Fri, 14 Feb 2025 23:56:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_color: Enable ctm-limited-range subtest
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>
References: <20250214161011.363157-1-swati2.sharma@intel.com>
 <Z699roJnvD0kO4Ne@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <Z699roJnvD0kO4Ne@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0085.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::6) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d36dced-d4d9-4439-4367-08dd4d251e7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGhFaC9DMlp1elI1RWhCUmlSVGg3T1NiSVVPaGxKV2VNVE11K1Y2UHdwMm5R?=
 =?utf-8?B?dnorTDMvSWs3cVdYZDYwaU1wR2tGZzVTbTJxbnlCeWlJZ2pUeE83Y1Z1V3ZJ?=
 =?utf-8?B?OVhDY255SkwzQkNQUXpXdnQ0NFF6eVRLTXJQcE81Q0kybFg0VEpCZWNzTy8z?=
 =?utf-8?B?ck9KcnArSFU0VmRvNGllNjJGekJlcVFiczlUWmRITnpRQkVMdXVLYTNJMGIw?=
 =?utf-8?B?U2QwR3F3TXpBRGN3KzVMNGx6amlMRXBwcUxwOUdOU29YallkeVFrbXRNRmhE?=
 =?utf-8?B?bHptTEZ2dW8wOVpYaHBISzhzbTU2QmYyczA0cURRVlhVZ1NXMU4vOWEyS1BC?=
 =?utf-8?B?T3ZHY2lPR2hxYWFLUFRhSmhvNXV6QzVOMExaczI1aFJCR1RuSWtEdkNrTUhL?=
 =?utf-8?B?cmhmd1F5SzI5ZXlibjVuM013SUdtbi91dkNWcWF2ZUV0cEM5RzZDNG5FaGYw?=
 =?utf-8?B?cXk3eTNTdkRQU3lmZncwVUpaUXJmbGM2aHpSbXRkQlEwM1RVa1R2azRIQUxs?=
 =?utf-8?B?WHdTWnJVWlc1V3JmWWVZRU9NNEFHSUJwL3Fqb1ROZzhlWGNZRG1XdmlhTnI2?=
 =?utf-8?B?dzNnOXBHdnQ0UDI3Z3RCNnVVRVNNV0pxdVBXa0VBOUthUU1aSnFKOTJkVVF5?=
 =?utf-8?B?OTZ3Y25EUVFXeXlwbUU4QVdTMzR1Q21LZnYxbzNqNm9oOTNsRVJiUXhucUc4?=
 =?utf-8?B?NjRXL0p3bWo2WXgzV0lKUU9LWGJILzFKWUZDQmhrUEhOT0lnZTBXakxxZ2Vu?=
 =?utf-8?B?MlhaRkJ2UVRhSWpUYkRiRG5rSHVmU2ExR2grNkdocS84M0piOEJWMmViVXRz?=
 =?utf-8?B?NFIxU3VaTExsOUNlcGRES2EyUHFIQldzbVByaVE5c3BQVTNMdmNXOFRISVBN?=
 =?utf-8?B?Y1hVZ3R2cHBnK2hSTkpwdndpbTI1NEV6MDBTelNWUUQySHBRdjJNbVZ4SmNN?=
 =?utf-8?B?TkhITkdTelJqZm1BZFFkM1dCQXM3czQrRDMzZUpQeDFlNkdZODFGSTVNdXBO?=
 =?utf-8?B?Q2s5bVAvZ0pGOHBEclZFTnhFRDYxdmJrOCtQbGh4RHoxcW5jaDF4WVdNcjhN?=
 =?utf-8?B?a2plSnF1amhCaG1zMDJrSjFBM0JyZ2FIdUVRaFlFWFEySUxMQ3dpVG91UVlr?=
 =?utf-8?B?YU1WMm5VOWx1YndWNXNobXRpOCtGek9JdTFlTGc3Tzk3UUNFVGkyOVlqWThx?=
 =?utf-8?B?WEFaMWJsdDE3THcxcXZMdDl3K0VsMGpYazBOUzdsVjltNkoxWUhtV1JSRkRP?=
 =?utf-8?B?QmFXcnB2K1MzK3JsQlUvcno1UWN6KzVndExMb0Q2RnArdk11b3B0c1M3b2Vw?=
 =?utf-8?B?WlZjR3BHZjZodXA0SHdseTYzWDZ1YXVuT3ViQU12bjJvakxlOTFRWVVWTnhu?=
 =?utf-8?B?dW5QNzZXaHdwNUtNT2pITktJd0lXdk5GNXZndm5ocG5OVk1GNUNzcGNPaTVv?=
 =?utf-8?B?U3l1WnB1N3p0WmtERHVETEFKbm5kcmJwNUwwM1NqSjhSc2J0dUtSOCs0ZlVX?=
 =?utf-8?B?d3ZNNk52TG90MEtLc3V2WHdRNWJtZDhKdUY5WFRQcFE0bWZ0UHY2dFNFck9o?=
 =?utf-8?B?b1VEWnpoVUtLWFdnbnVUKzJrZnNLenc3dEtSc3B3ZFRSUEJ3eC80alBJTFds?=
 =?utf-8?B?cjhYNFNuMFZUMHV0ajhxSVlxcGxZekNjWVI5WExoVGFobEVyMEhKWEpnZStU?=
 =?utf-8?B?V2VLN1FnUm1Nc1pHMnVOUGVuSTBEVjJlYXh5elVkVXVCL2JSOUR0NWdGTmpp?=
 =?utf-8?B?RnpUdTF1ajZsUVdLcURIT015QmxuTU1DQTBRQjlaNnlBVURkVlZERjJ1NXBy?=
 =?utf-8?B?RzRrL0hxczJOYnp3TWlIRnJ2OVZFcDZKTnlxN2lIbHVMRmhyNzl0NGo1TUJH?=
 =?utf-8?Q?T5RjMS6kHsr5J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlNFVTJUUU5XL3Ezb0tPVVJFN1NwNW00R3VOQjUzQkRScU8xTktxblNCKzQz?=
 =?utf-8?B?eG1yeERteXRqcnl1b2VNZ3ZibC9sd3FvUSs5bDMwTHZxbWd3dTBuN1A0bDZT?=
 =?utf-8?B?c0dGaENnb3NjVW0xcGZITnV5dGlvbmZxQ3hROCtlRUswR3ZodysvbkVtTnBG?=
 =?utf-8?B?ZExTV2QxRnVWU1hFNTc3YVcvdTlSdmRmd0tuTk1nWjdvMngwK1czS0xIVVp3?=
 =?utf-8?B?SzRvL1creFlBSThzd3F4MTc0RVE4K0gwaExCMUowNHJJSzlOL3VNYWJDQkx2?=
 =?utf-8?B?dVJOVVNUS3NlNWxrU3FyUWlOcjJhaUpkeVUycktDSy96VVZMeXVKT3dYTjZJ?=
 =?utf-8?B?WFBwQll6ZHBOcW52Mm1LRm9lcmo4QjFmbXFvUy9uUGh0N3pud2xLYk5oZnNn?=
 =?utf-8?B?YUNJNElPNHR1bllFb0FOQ1ppR2NLTVIzY2Fpb0l1Z1FHZ1kwNUdPQmNlUUdm?=
 =?utf-8?B?cTh1ck11MTgvNk5tK3RFc1M3cFUwM0RocXBINTRjbGx3Rm9FMlZjVzBETjJi?=
 =?utf-8?B?TWU0M1NQM0pHWVRMVThZc2w1Z2ZxSUlsSFZibHdYYkx0TWJ2OUl3UW5CSUxp?=
 =?utf-8?B?T1R2bHphLysyaGkya2xzQmFqd1pVYTNRcUtDOTl4WG9HUGpYaVdSTDY3VUpm?=
 =?utf-8?B?dm4zcm5Pb1JLb0d4VEwva3pucERGR3h6ZmpGOVVNNVhoUmk3RkI3UWVPRVNR?=
 =?utf-8?B?QStaMHV4V0c4ZDdzdjN1YjFiakU4a0JDd1BvRTZUWXlUUFpJWkZOLzJWMjBv?=
 =?utf-8?B?aHJoNkR0cFM4R2wrUE9QcVMvT2lVdXVuUkw2WjIyL0dUbDZxNnJNbkUwVkxw?=
 =?utf-8?B?WXdDRjhGSUxCYWI2clhsQUdaS3g1L0xzVis3NkJOMExWVTNTaWwvd1BKaDdF?=
 =?utf-8?B?YzlEYVZRTHlyYTFRd0M5R1UwZklkSXdkcjJIVGNCeVNmQnZGMG1NekJxN3hQ?=
 =?utf-8?B?L1Z6UmZQZEUxK1dGekpFUGpjMm1Ic3I3dnZjeEpMUHZtc1N5dHJwaDNUWFJs?=
 =?utf-8?B?UGRjbFYvZnpWNlh6V09YaGlGdmhwQnlHZGlUOERwYkVvQnBMRHhnTXRQUXM2?=
 =?utf-8?B?ZmdienN2SHNlMVp2VzFuVWIrdEtKUGQ0OTZFWW16UUZPN0ZIQWtrVHI2bGtp?=
 =?utf-8?B?cEhNbGxxZ3RST25wZjkrU0Jab29vaWZzdS9LRUc2Z3oyVHRzKys5REdrc3FK?=
 =?utf-8?B?NjdKRjByTlgzbHpaeGJPM2QvbWxuZjVFOEI4UVhmYkpkRnE0VnIyVnVqZjls?=
 =?utf-8?B?d2hOL2NIZEJQNndJaDdEM2djRWNzc1RCV3F2TVZmQUdvUlhZODd6ODkzOGNm?=
 =?utf-8?B?ZHlwanRmVzVQMzQ2ZSthdis1WFhDeVpKSmRKMFBwVm9jbVRWS0hjbWQwS1V2?=
 =?utf-8?B?VUZYTTM1MWV1Slo1SnJCb1VjVzJYTHFaNFZKNXJvbXJGaEpaMkV0SjZYay9r?=
 =?utf-8?B?UTlqUkxSRVFMSUEzcmpYZURmZms0aVduR3BKelFSTGFGdmFGU1pRWmsya2FS?=
 =?utf-8?B?MW5MV00yNnJxcTJHYml6YXNqMlNGdzZCSXY5VGlTQmFjRGo4RENldVI4MGJW?=
 =?utf-8?B?MHIyMTJQVkx6ejcxem1sbllubjUySkJna29GZ0dSSThQc2MxMnh4bkhnSEhs?=
 =?utf-8?B?dEJ6V1NRMjI4SXcraU1sLzE5dDUvczFqa1hzOUZCdjhLL1J6eUVIUTVVc3la?=
 =?utf-8?B?WXpKR2JMK2w2VGlhYlM0M0RJNlZldzVSY09CNDBFTFJLMXZ2S003NFczZFNa?=
 =?utf-8?B?MVlzMlczdGN1ZEZ1eXJmNy93TTcrbkprWjA3ZWJPRXBxYWRucVdXalk1c1c4?=
 =?utf-8?B?ZVBaWFoxM3psTWNaMGRTWVBIRzd1TmNRUllyZ1M1Tnd3V3JrSzMvVk9aK0pu?=
 =?utf-8?B?aE9Eb2Q2bGFlSkNHRzBwQ1RCRkRhTVhiWTl3SmtUeHUwL2g0Qi8yVXZEeVhv?=
 =?utf-8?B?NkZab1JNc2dvRWdNOUtMYktOb3ZZMWFUZUQ0bmIwaUxOQ20xTGpMYzV2UVdQ?=
 =?utf-8?B?dVFIVTEybUdJaDluWm5CV1JpbWthQm9FUkwrWFpRdHF0Mmd2c0d1SXV6dHdn?=
 =?utf-8?B?NmVIRGdzMnpmMmFGSWk1TkpPZlEyN3VwM1AvcFdhbVMyQ05JdlZuV3NIcE05?=
 =?utf-8?B?NmVEMzVCRXc5RW5TVzNKUmxDUnpBaUluWkFpZnJHMFF4Nndjd1I1VWVVUTVh?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d36dced-d4d9-4439-4367-08dd4d251e7a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2025 18:26:38.0296 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlolxdTytA/1uTa0SPZyyfcCFWp/K64aRQHF0VoQ0Kgep7x/dUmCSFzS6GueJ9M/KYwWBH2deruWaEPPQe0T6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8132
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

Hi Ville,

On 14-02-2025 11:00 pm, Ville Syrjälä wrote:
> On Fri, Feb 14, 2025 at 09:40:11PM +0530, Swati Sharma wrote:
>> This tests is currently disabled since CRC computed on Intel
>> hardware seems to include data on the lower bits, this is
>> preventing us to CRC checks.
>>
>> Let's try to enable it back and check behavior on newer Intel
>> platforms.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/kms_color.c | 166 ++++++++++++++++++++++++++--------------------
>>   1 file changed, 93 insertions(+), 73 deletions(-)
>>
>> diff --git a/tests/kms_color.c b/tests/kms_color.c
>> index 4b71d3dd3..c3b285b4e 100644
>> --- a/tests/kms_color.c
>> +++ b/tests/kms_color.c
>> @@ -58,6 +58,7 @@
>>    * @0-75:           for 0.75 transparency
>>    * @blue-to-red:    from blue to red
>>    * @green-to-red:   from green to red
>> + * @limited-range:  with identity matrix
>>    * @max:            for maximum transparency
>>    * @negative:       for negative transparency
>>    * @red-to-blue:    from red to blue
>> @@ -623,107 +624,97 @@ static bool test_pipe_ctm(data_t *data,
>>    * This test is currently disabled as the CRC computed on Intel hardware seems
>>    * to include data on the lower bits, this is preventing us to CRC checks.
>>    */
>> -#if 0
>> -static void test_pipe_limited_range_ctm(data_t *data,
>> +static bool test_pipe_limited_range_ctm(data_t *data,
>>   					igt_plane_t *primary)
>>   {
>>   	double limited_result = 235.0 / 255.0;
>> -	static const color_t red_green_blue_limited[] = {
>> +	color_t red_green_blue_limited[] = {
>>   		{ limited_result, 0.0, 0.0 },
>>   		{ 0.0, limited_result, 0.0 },
>> -		{ 0.0, 0.0, limited_result },
>> +		{ 0.0, 0.0, limited_result }
>>   	};
> This whole thing is fundementally broken. We can't generate
> limited range output without using the CSC post offsets,
> which are not exposed via the current CTM uapi.
We do have its equivalent test in kms_color_chamelium
and it seems its passing 
https://gfx-ci.igk.intel.com/cibuglog-ng/results/all?query_key=af49bc8e4e7d1c69ce04f9a1196c167456e8344a
Is it wrong?
>
>> -	static const color_t red_green_blue_full[] = {
>> +	color_t red_green_blue_full[] = {
>>   		{ 0.5, 0.0, 0.0 },
>>   		{ 0.0, 0.5, 0.0 },
>> -		{ 0.0, 0.0, 0.5 },
>> -	};
>> -	static const double ctm[] = {
>> -		1.0, 0.0, 0.0,
>> -		0.0, 1.0, 0.0,
>> -		0.0, 0.0, 1.0,
>> +		{ 0.0, 0.0, 0.5 }
>>   	};
>> +	double ctm[] = { 1.0, 0.0, 0.0,
>> +			0.0, 1.0, 0.0,
>> +			0.0, 0.0, 1.0 };
>>   	gamma_lut_t *degamma_linear, *gamma_linear;
>> -	igt_output_t *output;
>> -	bool has_broadcast_rgb_output = false;
>> +	igt_output_t *output = data->output;
>> +	drmModeModeInfo *mode = data->mode;
>> +	struct igt_fb fb_modeset, fb;
>> +	int fb_id, fb_modeset_id;
>> +	igt_crc_t crc_full, crc_limited;
>>   	igt_display_t *display = &data->display;
>> +	bool ret = false;
>> +
>> +	igt_require(igt_pipe_obj_has_prop(primary->pipe, IGT_CRTC_CTM));
>>   
>>   	degamma_linear = generate_table(data->degamma_lut_size, 1.0);
>>   	gamma_linear = generate_table(data->gamma_lut_size, 1.0);
>>   
>> -	for_each_valid_output_on_pipe(&data->display, primary->pipe->pipe, output) {
>> -		drmModeModeInfo *mode;
>> -		struct igt_fb fb_modeset, fb;
>> -		igt_crc_t crc_full, crc_limited;
>> -		int fb_id, fb_modeset_id;
>> -
>> -		if (!igt_output_has_prop(output, IGT_CONNECTOR_BROADCAST_RGB))
>> -			continue;
>> -
>> -		has_broadcast_rgb_output = true;
>> +	igt_output_set_pipe(output, primary->pipe->pipe);
>>   
>> -		igt_output_set_pipe(output, primary->pipe->pipe);
>> -		mode = igt_output_get_mode(output);
>> +	/* Create a framebuffer at the size of the output. */
>> +	fb_id = igt_create_fb(data->drm_fd,
>> +			      mode->hdisplay,
>> +			      mode->vdisplay,
>> +			      DRM_FORMAT_XRGB8888,
>> +			      DRM_FORMAT_MOD_LINEAR,
>> +			      &fb);
>> +	igt_assert(fb_id);
>>   
>> -		/* Create a framebuffer at the size of the output. */
>> -		fb_id = igt_create_fb(data->drm_fd,
>> +	fb_modeset_id = igt_create_fb(data->drm_fd,
>>   				      mode->hdisplay,
>>   				      mode->vdisplay,
>>   				      DRM_FORMAT_XRGB8888,
>>   				      DRM_FORMAT_MOD_LINEAR,
>> -				      &fb);
>> -		igt_assert(fb_id);
>> -
>> -		fb_modeset_id = igt_create_fb(data->drm_fd,
>> -					      mode->hdisplay,
>> -					      mode->vdisplay,
>> -					      DRM_FORMAT_XRGB8888,
>> -					      DRM_FORMAT_MOD_LINEAR,
>> -					      &fb_modeset);
>> -		igt_assert(fb_modeset_id);
>> -		igt_plane_set_fb(primary, &fb_modeset);
>> +				      &fb_modeset);
>> +	igt_assert(fb_modeset_id);
>> +	igt_plane_set_fb(primary, &fb_modeset);
>>   
>> -		set_degamma(data, primary->pipe, degamma_linear);
>> -		set_gamma(data, primary->pipe, gamma_linear);
>> -		set_ctm(primary->pipe, ctm);
>> -
>> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>> -		paint_rectangles(data, mode, red_green_blue_limited, &fb);
>> -		igt_plane_set_fb(primary, &fb);
>> -		igt_display_commit(&data->display);
>> -		igt_wait_for_vblank(data->drm_fd,
>> -				display->pipes[primary->pipe->pipe].crtc_offset);
>> -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
>> -
>> -		/* Set the output into limited range. */
>> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_16_235);
>> -		paint_rectangles(data, mode, red_green_blue_full, &fb);
>> -		igt_plane_set_fb(primary, &fb);
>> -		igt_display_commit(&data->display);
>> -		igt_wait_for_vblank(data->drm_fd,
>> -				display->pipes[primary->pipe->pipe].crtc_offset);
>> -		igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
>> -
>> -		/* And reset.. */
>> -		igt_output_set_prop_value(output, IGT_CONNECTOR_BROADCAST_RGB, BROADCAST_RGB_FULL);
>> -		igt_plane_set_fb(primary, NULL);
>> -		igt_output_set_pipe(output, PIPE_NONE);
>> -
>> -		/* Verify that the CRC of the software computed output is
>> -		 * equal to the CRC of the CTM matrix transformation output.
>> -		 */
>> -		igt_assert_crc_equal(&crc_full, &crc_limited);
>> +	set_degamma(data, primary->pipe, degamma_linear);
>> +	set_gamma(data, primary->pipe, gamma_linear);
>> +	set_ctm(primary->pipe, ctm);
>>   
>> -		igt_remove_fb(data->drm_fd, &fb);
>> -		igt_remove_fb(data->drm_fd, &fb_modeset);
>> -	}
>> +	igt_output_set_prop_value(output,
>> +				  IGT_CONNECTOR_BROADCAST_RGB,
>> +				  BROADCAST_RGB_FULL);
>> +	paint_rectangles(data, mode, red_green_blue_limited, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_display_commit(&data->display);
>> +	igt_wait_for_vblank(data->drm_fd,
>> +			display->pipes[primary->pipe->pipe].crtc_offset);
>> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_full);
>> +
>> +	/* Set the output into limited range. */
>> +	igt_output_set_prop_value(output,
>> +				  IGT_CONNECTOR_BROADCAST_RGB,
>> +				  BROADCAST_RGB_16_235);
>> +	paint_rectangles(data, mode, red_green_blue_full, &fb);
>> +	igt_plane_set_fb(primary, &fb);
>> +	igt_display_commit(&data->display);
>> +	igt_wait_for_vblank(data->drm_fd,
>> +			display->pipes[primary->pipe->pipe].crtc_offset);
>> +	igt_pipe_crc_collect_crc(data->pipe_crc, &crc_limited);
>> +
>> +	/* And reset.. */
>> +	igt_output_set_prop_value(output,
>> +				  IGT_CONNECTOR_BROADCAST_RGB,
>> +				  BROADCAST_RGB_FULL);
>> +	igt_plane_set_fb(primary, NULL);
>> +	igt_output_set_pipe(output, PIPE_NONE);
>> +	igt_display_commit(&data->display);
>> +
>> +	ret = igt_skip_crc_compare || igt_check_crc_equal(&crc_full, &crc_limited);
>>   
>>   	free_lut(gamma_linear);
>>   	free_lut(degamma_linear);
>>   
>> -	igt_require(has_broadcast_rgb_output);
>> +	return ret;
>>   }
>> -#endif
>>   
>>   static void
>>   prep_pipe(data_t *data, enum pipe p)
>> @@ -1000,6 +991,25 @@ run_invalid_tests_for_pipe(data_t *data)
>>   	}
>>   }
>>   
>> +static void
>> +run_limited_range_ctm_test_for_pipe(data_t *data, enum pipe p,
>> +		bool (*test_t)(data_t*, igt_plane_t*))
>> +{
>> +	test_setup(data, p);
>> +
>> +	igt_require(igt_output_has_prop(data->output, IGT_CONNECTOR_BROADCAST_RGB));
>> +
>> +	data->color_depth = 8;
>> +	data->drm_format = DRM_FORMAT_XRGB8888;
>> +	data->mode = igt_output_get_mode(data->output);
>> +
>> +	igt_require(pipe_output_combo_valid(data, p));
>> +
>> +	igt_assert(test_t(data, data->primary));
>> +
>> +	test_cleanup(data);
>> +}
>> +
>>   static void
>>   run_tests_for_pipe(data_t *data)
>>   {
>> @@ -1156,6 +1166,16 @@ run_tests_for_pipe(data_t *data)
>>   		}
>>   	}
>>   
>> +	igt_describe("Compare after applying ctm matrix & identity matrix");
>> +	igt_subtest_with_dynamic("ctm-limited-range") {
>> +		for_each_pipe_with_valid_output(&data->display, pipe, data->output) {
>> +			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
>> +				       igt_output_name(data->output))
>> +				run_limited_range_ctm_test_for_pipe(data, pipe,
>> +								    test_pipe_limited_range_ctm);
>> +			}
>> +		}
>> +
>>   	igt_fixture
>>   		igt_require(data->display.is_atomic);
>>   
>> -- 
>> 2.25.1

