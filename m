Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 612D8C3DA4A
	for <igt-dev@archiver.kernel.org>; Tue, 20 Aug 2024 04:44:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDFD10E4A5;
	Tue, 20 Aug 2024 04:44:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNW1/fD/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166FF10E4A5
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Aug 2024 04:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724129094; x=1755665094;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2W0UJ+yyOi2INCOWQDeTivdiC0weCC9bjgHxE2oQf0g=;
 b=DNW1/fD/DsBNO62Bxjyy1iiJDPiG6sXv9Da7lR1e0e1/zCIyi3jXgrOg
 0EjJK4OddNx9Y6L9k9dZtWtEZFOGu9xWoX5Y4275p1THAnoKgiuukhTUl
 +jOAOcYF9GjE7/S8aFgE488pXWQjyTMWNEE8hCSA/OGNVQ3iQAKnE2kfB
 1k2ugK0sF/FNXcTyMQeYbK/K8excA/BSEAnGjOgYFuTC4hwauivek8yLm
 rmqQymYQSBfJx2+bHfYl2Klqq0ttGALHnb1IJhcnNVmwkhp/5C+A+Vard
 ieMbeApTqAnUDkJLfy0vLGwgrenoZ+9gQZ+Fm9lGV9mFsIHHtIsZb3P0P w==;
X-CSE-ConnectionGUID: cBqFD8ptQfGGvDFWgwWhJw==
X-CSE-MsgGUID: PIiFVXzyRdKhQDAw0j9GSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22548895"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="22548895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2024 21:44:54 -0700
X-CSE-ConnectionGUID: j7o4Ev4uQ6C4VMRNh/f9fw==
X-CSE-MsgGUID: WFoDBjLgR2eKV/mMWHkorQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; d="scan'208";a="64969696"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Aug 2024 21:44:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 19 Aug 2024 21:44:51 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 19 Aug 2024 21:44:51 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 19 Aug 2024 21:44:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akgN1OlODc0/WacUhXC6GlQ+j0pCi9z+EQWWY3jujytVjNYi8hX9YWxh/x/UahYknee9GqMbdwas8+NlMaY7zQE8REBbTiEyFKoAsGl6qczaN/vxwgEL+TyR6fBH4SiMMU19y9EAECCeoiiEaBBhVRWIzOV9bTqqJlP+JwPO0HfT7oJB5A/bwOoWu3FFqa9LAMRhkSg484SZSmLNybuagXaeWoQE2SynGlOrkr0jQQr7durAytyZJM/XCgt1XIVwPI97GILeCYxIwt8aVU+Z/DQOxunzSNQJuov077OQ2ZhYZR8htWkWBFVuBR8DFwaxzYyxiuJn1ZzoZ25JGtWYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ul96PBvLxG1vWKwAjrUYEMhQ84Z4qc6WgzNrm6qYI8Y=;
 b=s4SRZs9vW9JLTE7oHDLIoZsrp7unyG7JD32qAZLabfudIIoEoOJ2ibT5CI53hK+2Tg+43kEKuTUdnR3Dqp3s8FiFqySjezGyUf5RPTEYDI88o4pxsbnh0nzrVrHQE4tBqulSlwWfWFBwxdEMYwYqeqP5Lk+kQrnYKvVi8HHU24NGqeAsjzNfLgkkS7wKzUf/EtJhwSOsQr2M4jzFxb19+ag5eQ1muz3Im+KQ0GQ+A+zIUAHzzicR4bZMikOoV1dl56qVs6Dp0SCs1ptW+nkaESfRTcCz1NNW1e/XJjER9bIG3yj4M/8J+eBKGG8noeBo/OxAezJYbfb6gx+1554/+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.16; Tue, 20 Aug
 2024 04:44:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 04:44:48 +0000
Message-ID: <117ff2a9-da0f-4cd1-bdd3-3404b75f6092@intel.com>
Date: Tue, 20 Aug 2024 10:14:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] tests/intel/xe_gt_freq: Add a wait after gt
 reset
To: Karthik Poosa <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>
References: <20240819100146.3130945-1-karthik.poosa@intel.com>
 <20240819100146.3130945-3-karthik.poosa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240819100146.3130945-3-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c8e430-63a4-49ae-e295-08dcc0d2d1ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0ViN3JsalJOdis5SEVURHE0NXI3Q3JvMlk1VGY4OWxZUmV1L3dRTHVXT1lJ?=
 =?utf-8?B?dmlZNFE4MkZxbTRGY3RJSzZNVHJlRFNmclNLQUxOUE9iaHYyYzgrQmpUZFl4?=
 =?utf-8?B?bW14cnF2ekRZbXF5N1hIc3lybVZER3lKMkJlb2lDbUZSZVhuOWc0cWZETmhO?=
 =?utf-8?B?MXFQU3VDVzVDdFNCN3VzMXNmRU1WUURLdndEVERqWXdXVCtyRXBHTjhkV0Jz?=
 =?utf-8?B?ZmNqWGRwWVBMRVVKdTIzYWUyWGRiUFpSczMzZCtSWGFCZythbm1waFRKaEpM?=
 =?utf-8?B?Zll2VmFBbEZWRjlacXJ5RkxsZTVVMU40aE1IRWFjZ0NhemtrZmdQUDZXZ0hY?=
 =?utf-8?B?dG5MM1NQeTZCOVNsSGluT0lXV2FNMXcwbCtaczNER1hmaVI3RGo4NmRKbCta?=
 =?utf-8?B?dENMS3RTdU5la3JlejdSK29EaEIzUW9sbno0a25KVURVSzJmLzZBOFpEdnZE?=
 =?utf-8?B?NUtld2M4Z0o4cXZTYXBNTUx0Qm1ScEFkWjR1b083TkxTOEEwaUNKWXFKcmlw?=
 =?utf-8?B?QTZHa0FINXRqQlhIS1NjVDFvYW5SRjQ4RzY2OE50THBhZWJ1YnlybTI0eWhn?=
 =?utf-8?B?SUt5SXpuaDZXUFpXbThzbks1Uk5helVjK2tyU0ZUa09hMFdkTWxTSm16SnBH?=
 =?utf-8?B?Skh3eEx6ZHhRbzNLalhjZ3Q5Sm0xelJ1K1Y4SjJkUmJVcys1bytqSktrUlEz?=
 =?utf-8?B?QWFCZ2RyemFHVWVUaGk5Wk1TQjRVZW5uQ0c3L2txdlZsWWUwaUlaeG5JaXY4?=
 =?utf-8?B?eTZJdXJSY2laTFpqL3hBbWRWaVc3UGRYV1I2OXFIUERCMmpZeCtLd3FQYUw3?=
 =?utf-8?B?a0F4SkkyQU12MHFBSmFuZWIvS1VnQ1FhL213NlB0SHAzM2tpQ3lYOWQzQWwz?=
 =?utf-8?B?MjVGbkJJeTJJcTB6SStHQmxjd1dNRzQ1SXUxWHQvOWdMWWlzazVkcC9DM1R2?=
 =?utf-8?B?RjBWUUVvTXJmNksrNW5pcW0rcUxUTjRGQWMrRWY0MjBpOEdkYWVJZFlJazEx?=
 =?utf-8?B?VUhBZ3k2bkZpVHNmT3ZYM3hETTdMZEtkQWNmcUtFSUVPbE12MVBOYU9BNTJZ?=
 =?utf-8?B?WnN0eXJaalYyZXAwaUVwVFJVNnFzQlJhNzFMRnE1WDB3OGVUVnlwNGt5d1FL?=
 =?utf-8?B?K0lNQVlWRnZvYUNDSUZCcEZhM3RJS05icU05Q3NFdmNqMlVBNyt6ZU1HUGtJ?=
 =?utf-8?B?dHYyMVVoM1ZIVkF4bTN5M3RucGpxbDlnRFZxWlZrT2NFdno0MXArb2xqVmhL?=
 =?utf-8?B?VDUxczA5Q0lkY2d1QnI4MGZyd1JsNStraDU1MlJzNnlZaUNUYmdBRXNjOGR4?=
 =?utf-8?B?cElmVmVWRGF0azJCc0JQbVdGM2V2bitlNWNDQmt2TnBOSmhsdU4vZmREbVd3?=
 =?utf-8?B?NndLUW9ZaWF2U3JDVXdhVVAvR3htTmt3Zk9mcnpiTnRzVkxDcFpMKzhsR2xT?=
 =?utf-8?B?TGxqUEVFN2NSZEl5UFp5WXBVT05GRkRudVl5d3NGdWpPWkFlVitrOW56TldU?=
 =?utf-8?B?MXFPcFU2WWxmUTNhT0lrbmlUcVpyRlllc3lYaFZNMFQ2ZmNYMFgwTzB6ckp6?=
 =?utf-8?B?Mm9hSjdzVzF0OVhkZ2RlWE5idktUNldENFFrZGhaTnBFOU9Ca2xyVDY3eDRI?=
 =?utf-8?B?cHl4aUhQZWhPZW94WWk1Y2pnSnZSUTFCWjJWSEtjWC9uMWVHOEc2MUE2S25z?=
 =?utf-8?B?TVJqR2lxMkM1RDZ0YjY3N1UydlZTaE9VamE3NUlUeXlqRTRoVWpHQjg1K0xh?=
 =?utf-8?B?clFYOWkzZE5HQW5oK3FTMUNMUSs4d2dXTU9kTjFEV2hDUllOV29jR1JPc1JW?=
 =?utf-8?B?MWdOWmlZaTFuRGlVVkkxZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1U3VGVsTk1BeHpLTWRYTUl1ZHA4QzdEZ2ZhRml5Wlo2eUhmY3JiZFpVNkpE?=
 =?utf-8?B?Y2J5d1pVV0h3ZTRUdjdJU0NGdFpTNkdOTTNlYVBPV3ZkSkM0VWpOdnhMUzhR?=
 =?utf-8?B?OGVnek9NMlR3dG1Xbnl5bk52M284S0Raa09POUdzSENiVmUxNzR1WkE0dGFJ?=
 =?utf-8?B?a3BmaTdwcnRJRFdwRXFGaGIwZVZXUllualR2bUd0aVUyWUNILzVMVXNtOUgx?=
 =?utf-8?B?RmJQR1l0UmFvTHl3RThLUzlOQzlXVVdtUzRvTnR2UW9HM1JsY0pMT1lGV3BW?=
 =?utf-8?B?NEJTaldLenVZb1NpNGdIbjc5K1c5MVRlK2QxMXVkbUVraFhRbkVxbUw5Smlk?=
 =?utf-8?B?YnNybnYwL2lGU1NVRHNRNGQ2SUpoM2hubU5mcnJ4YVFFbzg0RG4xMXJ6bWR6?=
 =?utf-8?B?cWJNU3QxckV5ZnYyY0tmZTRiQmpEWkVveG5LY0VSMW1aaHhYZTZZNE9QWnlR?=
 =?utf-8?B?eGRIZ1B2ejhNUzN1OVNPc3NYYm5mcTEvYXJBTUpzaEFaT081aWU0TC81czdo?=
 =?utf-8?B?NCs5alhsT0xHTFNDQlFjTXRvZEFwOWFvOHdhVm5GcWM4Z3I1cXVSdCtpWUJR?=
 =?utf-8?B?WEFuWVZ3eTk5aXUrVjNMeWw5QlhuSUlHQ2YrbUhXRmRPZHJKa2pUekZNbkZj?=
 =?utf-8?B?ejhiWFcwTFE4Vm1mSGlOOW1sRjRkb0dKZnV1dkZzL2dqMHF4NnVuVE5xTlho?=
 =?utf-8?B?Z1lwVlVoNjRxenR5VnE5T1NScG9tNTlIWjFCelNuRmJoOTliZk9TQU5sMXMw?=
 =?utf-8?B?dVVBYndiOG1aeE45MDVoeWhpYzZHbEJtYXZrd1lhVEVLc1VBNUFEZm1oME5h?=
 =?utf-8?B?T2lkRjZYK0JPWEdtRU5NRzE2YVIyNnpNOGFUS0haV0Z3dGp4eDJHWlp1YWZs?=
 =?utf-8?B?VzhndjR1NmJXYVREYXJWbkJsMjJPczVUZm9CZVAydzhyWDdaenFNOWZOdFB2?=
 =?utf-8?B?R2JyWm4waE9MaVBpMVBMYTMwdFFpd2F5eFliZDZMWmIzWG1mSVErMVhDb2hu?=
 =?utf-8?B?WWdyT0JibkgrZXJPMi9vK2ExdTcrY1J3OUxwaWxlVjZyZXJNTVN3UDl0VTFD?=
 =?utf-8?B?R2Ribk5kc3lhbUE2dVdzNndhT3l1d3dOV0ppZGFxYTEyMFh1b2sxM1RlSnB6?=
 =?utf-8?B?SmlhdWltcjB6Q1puSzVkRExmek9LWlNOVlE5RHpKRnJFc1hQZzcvSmcwS1Z5?=
 =?utf-8?B?Wm9ncmlGb3UzT01iZUUyakJzb0swazBFMUNSU3JxdFlDMlVONmNraGlqZXdw?=
 =?utf-8?B?Ri9ZWUFPbzM3SEZEYzhIbG1JZTViV09admRKclFkL1kyaXlacEhkbG9SRkp0?=
 =?utf-8?B?VnRkSG1rVVRudGJBZUc2cG00VmF6YjZ4cHYwT2p6cDNMaExhUzdFVHU5SlBQ?=
 =?utf-8?B?MkxtWWR6KzJMS0RXYnlNMWlUYjZpNDVQQXdnZ3VoZ3UwRWdNVjRXeEFMdFgw?=
 =?utf-8?B?NlBXMnhmSkNVOXowVVNGR0RFQlJvVy83OHE2Z0pvbGovTGplUXpXWHoreHlZ?=
 =?utf-8?B?K0k2Z0thK2NHcCsvY2N4THZRWEpxNC9aSDdMREhVNWhlZEpFM1UwNFd2MTZJ?=
 =?utf-8?B?QzhyK3hBMUJRaEpUMllwSktYSlFwdFd6NmRnR3FlUllKOUcvb2M1a0RiSlV2?=
 =?utf-8?B?N1N0YldvdG1BUTBlblNFd09LejJlaTNPbSt5K3dudmhPM3RtajdxY3BjTlQy?=
 =?utf-8?B?aVlRSERxNkdNOGsrZ3JCMElGZm1iV1BlcmJuZ0hJbG5mTURzcTFnQWo1cURt?=
 =?utf-8?B?ZElXcDZnSzdQN1MxYUNpOXY4bmxnMmU5dDRpaHQ4SldlZGlKNVVXUlMxOXJ5?=
 =?utf-8?B?MjFMR29pOWd5VU9GNjMyK1dtRTlsbG02Q3BGWXVKVTBCNFZmNC9kQnd2em4x?=
 =?utf-8?B?L3hOWUFhQzl0ekI3T254Yzg0MlNXNGd2eVIvQXd6SHhZMi9QdE83MnZPaTh2?=
 =?utf-8?B?VXZtMThSYzRla3pDZHM4eHJqYmFjR1ZGa1BDNkpJMmNpZzlEbmNLV2dFUXhF?=
 =?utf-8?B?VVpSdnZEblA5YmVkZHN6bUNRWW9oTkFiTXBqekRkc3FoQTNJdERGMG50ZWVJ?=
 =?utf-8?B?SlRzNlFKTk5wTGR1VTJzTzlmVDZQQjMzcVVQYjhpbUxBUC9qU2NtYmpDQ1Ra?=
 =?utf-8?Q?TCasGEJokk1faoW/DLR6sc6Mq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c8e430-63a4-49ae-e295-08dcc0d2d1ea
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 04:44:48.0548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z1DKtSFL0jQ1jJ+7+8rTh3KfBACcmTbiWQs0RSewXtMiRSbk/VGU8YKd/dpL+OX9rvt5wKdMpZpIuN4WYtrI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
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



On 8/19/2024 3:31 PM, Karthik Poosa wrote:
> After reset min and max takes sometime to get set.
min and max frequencies
> So add a wait of 100ms after gt reset before reading
> 5min and max frequencies.
5 min? typo?

With the commit message fixes
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
>   tests/intel/xe_gt_freq.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tests/intel/xe_gt_freq.c b/tests/intel/xe_gt_freq.c
> index 56cc10ade..427e12c55 100644
> --- a/tests/intel/xe_gt_freq.c
> +++ b/tests/intel/xe_gt_freq.c
> @@ -342,6 +342,7 @@ static void test_reset(int fd, int gt_id, int cycles)
>   			     "Failed after %d good cycles\n", i);
>   
>   		xe_force_gt_reset_async(fd, gt_id);
> +		usleep(SLPC_FREQ_LATENCY_US);
>   
>   		igt_assert_f(get_freq(fd, gt_id, "min") == rpn,
>   			     "Failed after %d good cycles\n", i);
