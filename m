Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD9DC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 09:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5D110E7F5;
	Wed, 26 Jun 2024 09:14:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L5Lo8e+b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9980710E7F5
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 09:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719393272; x=1750929272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YLy9BeJw6x3mRFa24SykzRd/5uiDmCsFSzKIjG2pyLM=;
 b=L5Lo8e+bcTc9AlU1q/XCcF0bfh1PzKAYv8QPD7k8m3E/uxVv2/9qoQPs
 VCBHa6SnR2LJDVlSp6ovOeo1mnzDY2jbQFOmnQ38TSLXY3De7dCTr17jf
 Yu0gIjYFD7riOrAvXk1ddN1pzz6LA4lvvaaj0sZxjCWLeGUBUL8exkUqf
 +5qyX8PjftAqgqiZWOtPP45ps6nO9Zja2MCxwFPs5CxFS76F3eGdJY43A
 LpT2h5IItYJsXKLl3Loqm7X6wr/9yIa3aSWj5yPFgPhzKTaXNxJ4dlliG
 /yUHghoCcfIfpel2n3NKFPe9xLdcFcyyotwzgRweDxhgtgv7ZGSFYHxkG Q==;
X-CSE-ConnectionGUID: ASZCGrVhS+a2IO1NjPXnpA==
X-CSE-MsgGUID: xvbJi00tTaSBAij9UYJnYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16600078"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16600078"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 02:14:32 -0700
X-CSE-ConnectionGUID: 77GPu3YgTlKyY5nlLsw7+Q==
X-CSE-MsgGUID: nTN8ch8ZQhmfd97DZ/cQbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="48541129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 02:14:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 02:14:31 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 02:14:31 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 02:14:31 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 02:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iT2oyKVyHV5K2Fk0o6nuDDjxfT/TIt+0mZkta6PDkUEDG01DpsVtOPEU79lhXXDTAqytW9+k+OR/whq8LKZaXn76mgFdIq0upBjOb9h0GlSwuPKaNeNeSx3aERpf9Vfk49+kytyDhh/GGdNCla42eSJWHHUTHVofbKFdS1q1FlsOWLW3QcR11JxU5RKwSrRHzCbe87D9GIhWGBYI7EPCEsv+X96XBq7rF2v9+C7e9V3eDwFx6apEmvRFrcUtwjU1tK9Lzk2GPEcE1auWrPbWY7fSnwUZZvH/rkVXgZezY+bR6X+nQjH+NkqpWYW0TtrQhJJt/YYSG5Gxr4yc+XeSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOZyVqgfrPvHWg7/9usteKIrHoDbVFE9vgd4CpjVYqk=;
 b=PhQNW8MB4sjjC6rNaqLchg4dloc0gsn2MxktvDfixVBoxnLu+fkCCOFnjqyCExHTZ7EC6L276BgcUEqbHSpDKuXEDLNAMCb3WYOlNcYMD2aaVeZyFRRqX7W8c6cGEk/C6l0ZpzB6pie0GK+R+1f+FD6/viXwzRcdxUb7cTLcrNfced0rBDRIEh6McWaqbQuuCOy6feVquGD4joj26C6hU6tJdp3s38BiUx2z1cR7jxrwGv61xLQGhYOSUxWjoVAmsTYu192AOL3AX1A6DVj3lBohAOMMOubTt1hNNwyobyPj/DLlpYdJGYwjWxwmnHwAx5HCB5snCcL8cB4+j7ZD3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by IA1PR11MB8174.namprd11.prod.outlook.com (2603:10b6:208:450::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 09:14:28 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 09:14:28 +0000
Message-ID: <a4aa8722-90e6-46ca-98a7-89c4b2c6e423@intel.com>
Date: Wed, 26 Jun 2024 14:44:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_getfb: Skip getfb2-accept-ccs subtest on
 Xe2 platforms
To: <juhapekka.heikkila@gmail.com>, Pranay Samala <pranay.samala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>
References: <20240621043248.612664-1-pranay.samala@intel.com>
 <d3770d78-3334-47a3-a439-a6b1e4f684a3@intel.com>
 <1b38d6c4-1adc-4ada-b822-09a3af94c9be@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <1b38d6c4-1adc-4ada-b822-09a3af94c9be@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0045.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|IA1PR11MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: 24da117f-65fc-4955-4298-08dc95c06123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|366014|1800799022|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cm1JOS9YblJRUmNHZ0FOSUkwWWdjSlBndHFHTGc4QVNjcnVJZ2ZMNUlzNHlR?=
 =?utf-8?B?THdsRXFVNElhR2YzdTM2WTZZZEdreWZwRlVlSUFObDRZSUR3Yk1uT3h2bTJm?=
 =?utf-8?B?NElSQTUyVk93aVIwK2RETWMwTDNnL0JkZDRzcnh4K3dRcWhYM0oxdmU3VWlw?=
 =?utf-8?B?L2duQ0lPWFdJclo3YjNWckZuZGlneS9RWi85dk1ZVWtSdHNsb2tLeXp1dHNp?=
 =?utf-8?B?a01wM3JUa0w1ZS9MSWJQOFlWL0I5SWcyeHR6U3JQV0tSV1Z1TzdRVXRlZTRT?=
 =?utf-8?B?NXo1YWg3dTNOSWRaRE9QYWZ0QURGTDJRVEVQS3FPaWRyczFzdk9rOFJONkRG?=
 =?utf-8?B?Q1crVlAwcTJmRkZGU1ppTVhjL2xKZUIrT1h5aHI1T25NZkpWMFVGR3lORmhp?=
 =?utf-8?B?WWY4VG5OOUR2UEVGekdTMldUUXV3bVFrQ1lUVWFUazYvamtHY0dqNlpYS20x?=
 =?utf-8?B?M3hRMXJLdlR0TVM3eWxRVnNWQlNxeWNCNVM3R3M4US84MmMvSWFHdTRxRktI?=
 =?utf-8?B?ZXhLNzJMd1JrUWlQQXpQMHlrMUgweGpDdCtnenI0WUhQd3RrU1VKQUh0Y0hV?=
 =?utf-8?B?ZDJycUJnTzZyNDg2elMyTzI5eGdZU05kc3RjanVsVnIxeVEyZTN2cXNOWkdo?=
 =?utf-8?B?cFNUeTNtWDJtZ2h4YkprMkNNeWdmTWFrL0xERmtac09DU2xrMzVnalFSOWhG?=
 =?utf-8?B?NHY2YmdodmFjQ3p0YWRveXVTNllLVWh1LzkzUzlLbnJzRUhvR090ZTBCeHZV?=
 =?utf-8?B?clVmZjRWTnhncURZVm5pRXgyOUZMRmUxUkdaOUZ5NzdlbFI0WWlyaUQxTjZ5?=
 =?utf-8?B?WDgxL1AvemI1NC96aEliR3h6azd0SXhFamV5cnRNdDRVTWtiQzkzYUFyZUw2?=
 =?utf-8?B?bzBhM3FLMHRQMGk2NHBQTG1lRURvcld1cDBZRGxFVXJ4V21XUTYwK2VPM252?=
 =?utf-8?B?L0ZjY2pYejZldlFJMitFU01MY2MxT1pRQmRNZklTWHJCcGJLRG4wZzVvb3Br?=
 =?utf-8?B?bm9vT1BGRFpvNTAyeG1LWTl6MjZ5R2t2Wmk5ZkNoV2RCOHVJZyt0U2VMMlpE?=
 =?utf-8?B?Mi9nZHFVNnpyekxUeDdQK25yUGY3Lzlaa3R4OTU1cUx2cGdOVlpHb2FIRjB2?=
 =?utf-8?B?N0VZTjhaSGJYVm9KaExXRGhjK2NOSmY4QThKajgvRDEvc0xQdVhDU0doN3c0?=
 =?utf-8?B?TmRTTmMySC83RzVxUEpTTkVkczFCcEtZQUZoUHNQMEswZXVmbVdHRGFNWHRk?=
 =?utf-8?B?OEh0QURNNnExZUVmWG0ycUtPSlpUOWtZMGtxVWREWkpwa0g4bzh2OVhBci81?=
 =?utf-8?B?YTFmWDl6b3lTNkY5Yi9kTkNGdlJOWHRwMjJxSnMvRXQ4Zy9mVUNXeGVKSHM2?=
 =?utf-8?B?V1pwckUzMTlEYTBDLzFhZEF6eVA3SHpIdk9wQjUwbTRVYjJlZ09BMnE5cGJp?=
 =?utf-8?B?ZDBZM1ZqdTF3MFVXdWtOajMrY3hZZndFSnphbmNOZHZVYm1ESDdzZndzN1NF?=
 =?utf-8?B?V0lUN3gyc3VoeW13TzF2QlJka0luemljSDlZMllJWTdURXMxajhEVXBRVFRB?=
 =?utf-8?B?SXU4K0J5SE8zWDA5MUQwVmVsSmVVMHVmc1RLOUVBejB1OTRyTXZ6a0F3OVpD?=
 =?utf-8?B?N1VaWTJYSzRSdU85L0NWSUtzanUrNkpDbkRNWlE2a1l1N2VlTy9YQ28zNml3?=
 =?utf-8?B?cTFRQ09QRFRWVTJYYkoxQUk2cWR0a0kxOHNqQzZ4NW5sNVRaTkRWMVlGYy9I?=
 =?utf-8?Q?xiD1TEMaawW86UhN2o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(366014)(1800799022)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGp3UVFCM3NvNFVsUzk5WTRPQS9EbVB0eTFJc3RCQ1l0d0ZlSFdndGlDR3M0?=
 =?utf-8?B?Nzl5TUY2ajFKTGRHQ2tUMVhoUGk2S2J2TWNVZDBPZVUxQyt5SlFDQWNreVF3?=
 =?utf-8?B?S0x3ZGlrUUR2bUNBUlUycXFqbmgxL3JUbG0vc0dneHRBT01Rd0V0czF3M2t4?=
 =?utf-8?B?S3h5VEk2VEt4blRVK1hwRkdLZzRNVVZBRlpsc2Jmcll4a2pXZUd6NE1QQStU?=
 =?utf-8?B?MWY3N0ZWOVNJektHM2U1OWpUVE4yNERmNjFBWE1PeVVCUWJSUER1UkV4V1RZ?=
 =?utf-8?B?azNLWWRkT1NNbFB1NXNTRnNwMzFncWlnYXoveUZScFlUR2M0SWNHSUZOMXQz?=
 =?utf-8?B?aEF2OUVFSEd0UnA5ZEh3SDVZVXc1bnhhOWVJck80NVA5eW5FUC9neVhvb3JI?=
 =?utf-8?B?TFRZNUpGdmpPQmZBM0RKNU9SaE9qTkFod2Mwa3VCWjJTdC9rd2JzSkdDRWZR?=
 =?utf-8?B?TnlUb1g4UGNSbnlqdnNjQ3BSeWx4TnVodk1FWmU5M2Y0bVluMk8wMFF5K0Vs?=
 =?utf-8?B?N0pMZHJuTWViOUVqT3Y4SUlCV0VZa3lncWNyUjJBSXZZMEV4WTJRU3hwMW1t?=
 =?utf-8?B?eE1RalljUnhQRTNGbkFiQS9pQVllY3Z2blVqcVhZc1VtZUFQMGEzSDZSU3dr?=
 =?utf-8?B?SHN5VFUwWTBqUmNpck5IK3VtbWY0Z0ZPMHEvalVXRThlL0F1WlBzVU1VV0xL?=
 =?utf-8?B?VHQ4eDZoTVVOL0V1V3l4TFkzTnN1THNwSTZVdm9ZZ0JKb3I4NitNREV6R0JS?=
 =?utf-8?B?UWlKNW4wdmFma1FkNTVBY3V1RWZsZ0dZa3NNYmI2U2NFaGVFblJlbTE1R3E4?=
 =?utf-8?B?aElrd0M5Z2hVRXhDNTJrbWhLTkljOGZabERYOVBEMWJ1VHR3MDNka2grRllM?=
 =?utf-8?B?b09iT2RERmR0T3NjZWlBeStLcXBINTdncWhPTGZPaEFtbXFuU2FlQXpHSHA1?=
 =?utf-8?B?VjBUTWYzTUMxK04xNlFyb2cvQVF1clVJTkFKMG5KWCtXczNXSTBpckJ3ampt?=
 =?utf-8?B?NEdLNnBOSEI4NU05V0ZXT24yZHIxWDluQkxYTEl4S2RGSFowc3grRElRRTBO?=
 =?utf-8?B?MVRpWVFNMFR1d2EraHVsQ3RKOFViWGNaeXlvbmVDODBMU21QY2pXYWJnNFQr?=
 =?utf-8?B?djBrRm41cjIxdzhNSXJsb29BTjVpN05qTCtoZ3JzSXVZYk0vWW9xb1NJOWcv?=
 =?utf-8?B?U05mamVYU0lRNnhiT2srT1hZckRVaFRnajZEVUgzZ1VwUlMxMkhmZnVVN2Zv?=
 =?utf-8?B?aU90UW9LdUUrRnJoK2VRVVA2OFFvU3VOd0xuRndKUVRsV3B4MGl3VnpabFlW?=
 =?utf-8?B?czFzdzZEMW83blVNWG9zN29RWHBhTkxMa2I4WFd2c3ZVQTJLNVZ0OTJmVDJt?=
 =?utf-8?B?Q0Z6eE9McHhVWVR3cmNCNityZnZzanBqMGtxMjMyQXAxQks4ZHlCazQyUWxl?=
 =?utf-8?B?M1FYR2F4Z3BJeUNlcnhhZlpoYU40WmEyUHQvYnVsRTVHQlpRaVpPZ0tJLzhk?=
 =?utf-8?B?NjI3eXdROFJJd0ZRUFBPNS9FM2RWZGlXUVNURk9ydTg2ZXVUSHJLeXVVQkxB?=
 =?utf-8?B?cXBDTVROdW1MdnZQSUttM29XamltRXRMNVB2dGtyR25aWEZjVXlndWd4MSti?=
 =?utf-8?B?OFBYWVN3MHR1cHAwK3hmcFptNk1tN0Y4MlNOVVZlOU1Jd3lSd3B5cTlBZFkv?=
 =?utf-8?B?NjlFR1V1bDdNTFFLSS80RXd3TmNKZEZyaGM4T0tSRys2T0FaMlZ4ZS93TlI5?=
 =?utf-8?B?V2xuTkpTL3pzZ2V5aytyMXNBQkVSZEVXZ0Z4ZkdPcnpvbUJPSDAzWXNLSWNz?=
 =?utf-8?B?N0lJLzVmbjZRWVErblYybjJGd0NZejN5bzRWemxiRlV2WE4xajJxeDkrSk5j?=
 =?utf-8?B?WFBHbm1FRUNZc056YXQxVWpobU5jTXdaQnlFbzJuT2xlMzV2bWN2VnorMWJW?=
 =?utf-8?B?ajFjbVpxSDl0RTdwYU5QSEVWQjB6ZCs1QW9wditzWkRDY082cTNEaG1OZisz?=
 =?utf-8?B?MWsySlUyVXUyenFaaU9IUlhJWjZwWmt0UjBNNVUvYUdkZnVKRkpTRnVnQTgv?=
 =?utf-8?B?U3RYcjlzaGZ1UEJpdHBqRFFFVEk2M1B5QmpUMTNHQVV0dnRrYjJRSjZBWnNj?=
 =?utf-8?Q?78bxdPnV1uxhvyPQg9ehiSFbb?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24da117f-65fc-4955-4298-08dc95c06123
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 09:14:27.9093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l0kvyadHSTN5uskj/wbNQAMoAwnAPaHgy6nharR1jnROYz6Nhw+GHgRoNccDN+yoTa+iFQXXarhJNBUx7nsWVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8174
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


On 6/26/2024 2:13 PM, Juha-Pekka Heikkila wrote:
> On 26.6.2024 8.43, Karthik B S wrote:
>>
>> On 6/21/2024 10:02 AM, Pranay Samala wrote:
>>> The getfb2-accept-ccs subtest tests on ccs modifiers.
>>> With Xe2 platforms we no more have the ccs modifiers.
>>>
>>> Adding a check to verify the platform. If it is
>>> Xe2 platform then test will skip, otherwise it
>>> will execute further.
>>>
>>> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
>>> ---
>>>   tests/kms_getfb.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
>>> index bb9679bc9..81829ca3b 100644
>>> --- a/tests/kms_getfb.c
>>> +++ b/tests/kms_getfb.c
>>> @@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct 
>>> drm_mode_fb_cmd2 *ret)
>>>       igt_require(has_addfb2_iface(fd));
>>>       devid = intel_get_drm_devid(fd);
>>>   +    igt_require_f(intel_graphics_ver(devid) < 20,
>>> +              "No ccs modifiers on Xe2\n");
>>> +
>>
>> Hi Pranay,
>>
>> I see that getfb tests are skipping on legacy platforms with this patch.
>> https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11292/index.html?testfilter=kms_getfb 
>>
>>
>> This should be resolved by replacing 'intel_graphics_ver' with 
>> 'intel_display_ver'. Could you please update this.
>
> intel_display_ver will not help here, that would lead to detecting 
> each machine individually because xe2 vs older platforms have 
> overlapping display versions.
Ah right, this won't work on xe2 platforms with overlapping display 
versions.
>
> Seems Pranay's patch is almost right. That comparison probably should 
> be something like intel_graphics_ver(devid) < IP_VER(20, 0)

Agreed, this should fix to avoid the skips on older platforms. Thanks JP 
for the input.

Thanks,
Karthik.B.S
>
> /Juha-Pekka
