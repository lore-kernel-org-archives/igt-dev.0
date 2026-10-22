Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2B606A326
	for <igt-dev@archiver.kernel.org>; Thu, 22 Oct 2026 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gg1CpgBc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F9C112501;
	Thu, 22 Oct 2026 11:57:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621610E3CA
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Oct 2026 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792670181; x=1824206181;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZkbLM6c8Otjpy2ywWtFap4/fUJIY4Qw1B3o9zmUa2NY=;
 b=gg1CpgBce7fAjLrp9kj53syXvd4kKHGCh6EZW7IRIkDKJXwgYmbRmTCB
 UQ17YfGaQHwopOUleoxknWlA+1B28uuvici5ajLPnTJ/iHGD9DC3TBxG/
 jL+XLfSLL3GRzcG5RZxHw1Unl0DtggqL/wCTh1nNvcjmbPJnnHW+WFZmh
 uGJMTfBVK21ly7/r+AGcjHth+HTRqoREhJa5okLWeGo4Icdq5Ol0BqNKY
 VNnlOE47odVfKLqjKZdan9iegdcQ6xRyiEucAjBFWmj5iYCMJTlESjuTl
 h7Q6z9XqebZjNcCZ4r/hEfKY9ReAaIf30lDoi06Fq5xhPmSkzj7Z9+T10 Q==;
X-CSE-ConnectionGUID: JSVouofdQcuRVrQ+4kdmNw==
X-CSE-MsgGUID: lRFR7nSrQnuJqP9V48LlEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1296634"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1296634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:20 -0700
X-CSE-ConnectionGUID: yNqMz5rxQymuMmkrYUk16w==
X-CSE-MsgGUID: 7BG6rALeSn6g8jEWIaQjJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3706501"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 04:56:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 04:56:19 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 04:56:19 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 04:56:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8R9pW8gS47T1EG117sj2VfvpJuP/u3G9zinB/w++WZkRU8Ba27NiM471Jf3Zr/9GJBbl/GfcJBA5a8nXRZquvBhyqass4oLkybIsalBN+AsDX3cNGPEm+E4O8oZ3Cf9xs6PbKunPS3qj390eOLcZD4W4VodPj132xTBwogqPKpUJLM80l9eEywDzOKk59wImJZxrwMGS4kmt9loAo7nihoG/RukeUHOz1bVrGYKbMWTJlXx6KEROjBuNWzK0UrpmMXB3SbXCS8+ac/zhtKAZufWHaNa0P04bND5KCJ2G455wGj6ErZ6IbESyV7Q4aqOIvT3ytht43XmjRkp+nehIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZD8X0M0JtEtjSYb6DgE5Jwwcu+fWIz3XiZd/dfLHMQ=;
 b=Q2GWggwtUQ0qTqi3uG2SIybNmBTLSpIVglu1Hi9zWmHXwZ3PyzGcMM7Ygtp2BAWfAiGvNkWlwSeUCx3VdZZNPguVjQTYj8JsXNcZ1O++A4Lw6Jfdpxhlin0yMFY5j/RtnGGUSsAnet4heN54yj875AJnYD90KFDSy/BT+85AYZDqRyap0NVqgFF85C3TBdi8TNpg+386ckiU9ASl3T+ELFxuubXjnpNO8VMjX1l5JMPYamuW8iVltkdvjGT1FZpEm9LUrx/iYd9Yqa0HzMQfx7Rq5v/LyBY0Zc0bzJcJAYceAdsMswatI8a0bOhnM5LAQyULrDp5bqwI+XGdqBRZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB087165.namprd11.prod.outlook.com (2603:10b6:8:4c4::7)
 by SA1PR11MB8328.namprd11.prod.outlook.com (2603:10b6:806:376::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Thu, 22 Oct
 2026 11:56:10 +0000
Received: from DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f]) by DS6PR11MB087165.namprd11.prod.outlook.com
 ([fe80::4223:7b03:1329:265f%5]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 11:56:10 +0000
Message-ID: <fd7e9ccc-5f7d-40e4-8e51-7cf813d8eaca@intel.com>
Date: Thu, 22 Oct 2026 17:26:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/10] drm-uapi/drm_ras: Sync with kernel b2207d4c4e84
To: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Riana Tauro <riana.tauro@intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Raag Jadav <raag.jadav@intel.com>, Badal Nilawar
 <badal.nilawar@intel.com>, Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 Harish Chegondi <harish.chegondi@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@intel.com>
References: <20261013190651.897241-1-ravi.kishore.koppuravuri@intel.com>
 <20261013190651.897241-2-ravi.kishore.koppuravuri@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20261013190651.897241-2-ravi.kishore.koppuravuri@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0141.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::6) To DS6PR11MB087165.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB087165:EE_|SA1PR11MB8328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f021a61-fe88-4b4f-d9bc-08df3033765e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|261021121427099003|11063799006|4143699003|261009223027099003|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: BCNx5Sy4+NsLkjI6fo4OBUzGxdoOfpzPkzW7RaxluwejyvuXrohb3lEhaQV6oQ1MOxOb7w9XIWOzIwLKIFbSPJP4Nq/ozM/fobfkJ3rgi9VfZjjaGtQQbmBlYxSMTfyp+kNNEnvg2QI0t+/cZQwVRxxdWTH1h2lU12Q4XsC5zWvbqoCE3b7kEhj0P9zWmFRx9QCyO8MSOoTU25jFLQh5f5J8btm5vtBZ3pj/39z2icIofNdDeCgjTUPeS33OJIhsx51WlRHqkuZkGNOmKq9RiSEfSkrGsCKujm+9yjk1d0K9l5U4HDrTKlWpE4M0zStvbCJ0UVXu527ZCSen/gp6QXZzeeSHAFgdWtySPRJDmOJ2GLXcLemOG37DDff8lMeJalVt3YkQHW0abd6LH1E8KsbT4+3Og1PN3mUTfbs2uZTjOOxecX1XFAX1/OwJZKYApWWK7l6SPdh1DaQ6THNKg2mnDZkMc1wT+nkssZbXPTSCq6zOt1rV0IL/RBQlVjEOqYfcyZPdKg5G5HMNUO2PxmsxLC/Rq2audTaiLEKtuQtxA4tSRxrWa4Kg0awJZoUFguI9yqxqQvwUi/Elvg3RzWd19T6rPBbnIldqRrPFCH2dn/hkpHhWA1PXCO7HfkIjTEhmZsb+5vnOufLWockVyveR8FAJLhhqGzXuH/ca1rE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB087165.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(261021121427099003)(11063799006)(4143699003)(261009223027099003)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vy9Eb2dTcDQxU1ByOTBWUmNxbmhneVI1cGtwRUxtSG0zZEVaQ3EwRjgxeTBO?=
 =?utf-8?B?dXlhRVVLL0JjTmVoWUV2TDY1ZkM2Y0pwNWZwUEx3UkdDbFp0ay82VzFkNTlH?=
 =?utf-8?B?a3hXUnFKMEpjZEUvUGZ6eUlSRDJRSm9meUlFRVhYRkN4ZkNjTGFxSjIyTk82?=
 =?utf-8?B?bVVLbGZrN0hjUzE0N2RlVXpmSXNobSsvNkRIdlZhNXFmMmQ4ZkYrUkNDeE5s?=
 =?utf-8?B?bFhmdTNnNmc1dzdmUTEzSjVPUGhOUnBNOTBWZCs2T2I2dWlyRUNDWitaZDM2?=
 =?utf-8?B?U1R1UkhJc3d6akdpZDlQSHI2MXpoNHdtUnlrd21tWW13Vnk5Rmo0bmNRNGho?=
 =?utf-8?B?b2l0QnhvSFdOcFdrekdXWjdSMVltaXFhTmsxWE8xZjUyUkNIMEZzZEY1UFA0?=
 =?utf-8?B?K01zODVYY0pZYkEwN2wxbXhUTTRhQ0V6N3ByU2JVZ200Zk1qMzNyMnZFbzJa?=
 =?utf-8?B?MEM3K1R6MnQzZ0R0KzZDcmQzMTFzY0tIMFRiTlo3RG05ZElOZFl3ZURrWVJG?=
 =?utf-8?B?OVQ0UmxzcytUT1F1M3BaSHo3OTRaMERZYmFGdVZvKzNxaVEvZkpXdU5YMDJ4?=
 =?utf-8?B?OXkzRDFHa0s5cDFuY0wzL3VKSUl1cjQ1OFJHUHdLTWszVXQ0VThFOFo5Vktq?=
 =?utf-8?B?YUdoS282TE5LZHcyb2hoa2VCQnZOUDRiMXRJcHZ3c0pvak9RWEp5MGwxUG5h?=
 =?utf-8?B?ZWptRlpINjB6NVAwUWRnWlRnazBwR0hITWRhRVRYRHdYak5TRGRzTzlwTVNZ?=
 =?utf-8?B?R0hYSGpGa3RmRDM3akJvc3c2MWtzOTRxcWU0eUpqdDQ2MHUwSGkxbjYreXlE?=
 =?utf-8?B?UXRsVU5iRWtTY2padkd2dzMxQkQ1QllwK1dJWGxPZFc3OWNXQ3dsMTE3QU8r?=
 =?utf-8?B?dUJmVEF2MEVkY0NyUGQ2RXJCcjVWME1qc3h2Vm1pZVoxOG13SGtwYk5pRWQy?=
 =?utf-8?B?Mmo2T0ZIOStVU3F1RFBpeDEyL1EvRVF4WDRMMjJXMzF1VlRiemJmNDBaYWF2?=
 =?utf-8?B?NkRyUm1RME5ORStVdUxmbFNXaXdkZ3hGU24xMHZQelNHelBGTyt0K2hUOVc0?=
 =?utf-8?B?VGVFWkk2N3hmV3dsK1ZLN0dNTWhNMFpoNWl2clBnd1NPZGUyaE1vVERLUkhO?=
 =?utf-8?B?aU1HVFV6b3d4dWVwQXhuRFRqMDM1OW04MDBROFRaVldmQ2o1RHhrOWNSbHNt?=
 =?utf-8?B?WS9DUENUU2lYUGphMGZHKzBRcXhlVEVpcWloMCt6WkZYcEFmcmhiWVM0VGRx?=
 =?utf-8?B?ZnA5V1ZYZU9FVHZBc0lqdTJhOEdEYy94MGNDUUd2aklod1g1NEtobndHeEdu?=
 =?utf-8?B?RkpUUURDWElaUGx3di8rOUp0b2FPVUtYUkVBT21QNVBTQkpoMmtwSFRkU3ZQ?=
 =?utf-8?B?UjlXODdRcnMrVXoyUGlOdVJmKzdDTEhwZG9xQ1hoVFg4SGxJU2dvNUhHc0pn?=
 =?utf-8?B?dG9NTWduYnlVSy9ublVDWjZyOSs0Nm5ZV2p5Y05GR3kvNGdIT25rK1BGL1d5?=
 =?utf-8?B?bWdicDdjRk1wM29mUEowV1lISlU1UTYxeXZlaGZpM3o1bytzREorcVg4dDFv?=
 =?utf-8?B?UnFwTjdlSFArNXZvRmxqcndQVjBBQVRaY2pxOHN3cVlGSW11WmFaV2NNUnBD?=
 =?utf-8?B?WlIwTlFyYytLTjlyTG5mR3MxNzZjM1JaYkQ3Nmk3cVNhbXEySnl1UURDNVli?=
 =?utf-8?B?cnAzY1RDenRzT3MxNFYwcm85MHNnRis1dWl3WElMMnJLY3JENndJd3BuZXZa?=
 =?utf-8?B?OGpDRkhnKzdDNlNvOUVMK3JteGsvWVFUZnRjRE95S3RCRjY4OFVFZy9FejBX?=
 =?utf-8?B?enhJSTd4ZVAvUHlvbmJtU3VqdzBxVlVqeFJxOEtta0djZWJUWFhnbUNBUGVN?=
 =?utf-8?B?R0pkWUE4UTJHMm41angrSGlGQktDdmQwSzJNSGpIeE1qWklRSjlpbGJydENh?=
 =?utf-8?B?bkh4bDRCYnZheWU4azZKemVyeW5BVWpLaUdjVytmQnd5Vm5YNGFYY0hKR0hS?=
 =?utf-8?B?M3graEF4V1paRmU2RzRBelNubno2RnFxTXdJYjRCbVZmVFFBWW12ekw4ZXQv?=
 =?utf-8?B?ZW45Mzc3WElDKyt5WFRCd2lESC9mdjZjRW9ObWtVeFlBSzdJWjNSeHpvcGVQ?=
 =?utf-8?B?cktSTEU4cXc5M3Rld3VJZDM3Q2M4QmdDbTNtd0wwQUtmUHdvbDRvaTQyeW5v?=
 =?utf-8?B?NHE0c3hrY05hZ01mai9KMTY5SVI3Vk1ZNnVkREkvWkNPRE9ad25lZzMvVS9l?=
 =?utf-8?B?R2x4RmtzMTBUYmZ3RmU0NkVyNmtWbURxcmh0OUtNNldES3V1T1JkUmtJSG13?=
 =?utf-8?B?QlNQU1N0cEx1UkZXdkxLb3F6ekdGUTYxWE1jRXRqRWlGakNFd25qUT09?=
X-Exchange-RoutingPolicyChecked: g1OQcMX2LAVWsVO5d/d+vAkwPhyrUvOqJIHFimuGiSD0FNEiLkRlaEjqHOOX4HZanRNsv4N1xVwMZbdOtQPMPiJpQdl4MLNGhzGxN1XnkpFNvHTm/3a38UJ28eWXiXBmvZY0gGC5phPXwZX0QeztuVWGErfxpdUtbcwbaFRyO6dqEWn4VQbwZOmuAo+I2VyJUsFn6+f7bT8v1qLq+y02vpv+Qzm9PlmUdCbYtAdhmhIvNa8zZBWpg0X3fhUseRdAfqfd0+4/zFBCgqEBv2uFPom58gMTh+vNmKDAh6uem8rYmehGAkZLjRVJDt3nuIS3zmiGWOyGKwdEmEHFprvhYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f021a61-fe88-4b4f-d9bc-08df3033765e
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB087165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 11:56:10.0458 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXtmoUBZ/bFNLxDaK2qqgqQAA9n/NxzYl96wfuvmNWFcpKs2yuSgcAR6/r5HCSHzwrea7BZpoSylxq4NzYZliQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8328
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

Hi Ravi,

On 14-10-2026 00:36, Ravi Kishore Koppuravuri wrote:
> Sync Xe drm uapi up to commit b2207d4c4e84, this will bring following
> changes:
>
> b2207d4c4e84 ("drm/ras: Introduce error threshold")
> 6fdbfc75eaa1 ("drm/drm_ras: Add drm_ras netlink error event")
> ee18d39a0877 ("drm/drm_ras: Add clear-error-counter netlink command to
> drm_ras")
> c36218dc49f5 ("drm/ras: Introduce the DRM RAS infrastructure over
> generic netlink")
>
> Cc: Soham Purkait <soham.purkait@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Harish Chegondi <harish.chegondi@intel.com>
> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Ravi Kishore Koppuravuri <ravi.kishore.koppuravuri@intel.com>
> ---
>   include/drm-uapi/drm_ras.h | 67 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 67 insertions(+)
>   create mode 100644 include/drm-uapi/drm_ras.h
>
> diff --git a/include/drm-uapi/drm_ras.h b/include/drm-uapi/drm_ras.h
> new file mode 100644
> index 000000000..6b504faeb
> --- /dev/null
> +++ b/include/drm-uapi/drm_ras.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _UAPI_LINUX_DRM_RAS_H
> +#define _UAPI_LINUX_DRM_RAS_H
> +
> +#define DRM_RAS_FAMILY_NAME	"drm-ras"
> +#define DRM_RAS_FAMILY_VERSION	1
> +
> +/*
> + * Type of the node. Currently, only error-counter nodes are supported, which
> + * expose reliability counters for a hardware/software component.
> + */
> +enum drm_ras_node_type {
> +	DRM_RAS_NODE_TYPE_ERROR_COUNTER = 1,
> +};
> +
> +enum {
> +	DRM_RAS_A_NODE_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_NODE_ATTRS_DEVICE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_NAME,
> +	DRM_RAS_A_NODE_ATTRS_NODE_TYPE,
> +
> +	__DRM_RAS_A_NODE_ATTRS_MAX,
> +	DRM_RAS_A_NODE_ATTRS_MAX = (__DRM_RAS_A_NODE_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_NODE_ID = 1,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_VALUE,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX = (__DRM_RAS_A_ERROR_COUNTER_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_DEVICE_NAME = 1,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_NODE_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_ID,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_NAME,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_ERROR_VALUE,
> +
> +	__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX,
> +	DRM_RAS_A_ERROR_EVENT_ATTRS_MAX = (__DRM_RAS_A_ERROR_EVENT_ATTRS_MAX - 1)
> +};
> +
> +enum {
> +	DRM_RAS_CMD_LIST_NODES = 1,
> +	DRM_RAS_CMD_GET_ERROR_COUNTER,
> +	DRM_RAS_CMD_CLEAR_ERROR_COUNTER,
> +	DRM_RAS_CMD_ERROR_EVENT,
> +	DRM_RAS_CMD_GET_ERROR_THRESHOLD,
> +	DRM_RAS_CMD_SET_ERROR_THRESHOLD,
> +
> +	__DRM_RAS_CMD_MAX,
> +	DRM_RAS_CMD_MAX = (__DRM_RAS_CMD_MAX - 1)
> +};
> +
> +#define DRM_RAS_MCGRP_ERROR_REPORT	"error-report"
> +
> +#endif /* _UAPI_LINUX_DRM_RAS_H */
LGTM
Reviewed-by: Soham Purkait <soham.purkait@intel.com>

Regards,
Soham
