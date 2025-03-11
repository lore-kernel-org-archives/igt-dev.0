Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5A94C282EC
	for <igt-dev@archiver.kernel.org>; Tue, 11 Mar 2025 21:49:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E6D10E2C9;
	Tue, 11 Mar 2025 21:49:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PMouTxUp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31FF010E2C9
 for <igt-dev@lists.freedesktop.org>; Tue, 11 Mar 2025 21:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741729782; x=1773265782;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=40SVDIIBnWuJebGSUu/DzarNiSLZQrqdC+elvlRYRAA=;
 b=PMouTxUpU09lxUXPnmH5/dK6Bp2lryW5gE2qu8jN5oUmpef0QFaTmWx8
 X8bevnzOxkj3s9pZsLT1O3kUT2Ti7/ZdkPDyLDbvItAdtSjSviW8Qrsrw
 qxolgQzjz3UwxhHV4bOcPdoBzEvMO+wjzKE7YCBwALkVcXScqxJtK9wjR
 VOeBMDIHPt6vMug08SweRjdr3cBGXO3OiM1GEmbQxMGkS+XfoDKzWLnWQ
 KkCZcbf2iW1XoGTgb+UfzHxAfJ+xLoewvpVLKzP3U7cjIRS1pecJTu42N
 e2WdRc3/f8nouL9g57TOj3qwCS6TrkY0riqFouQr9s/WD5ejtHcU02gAd A==;
X-CSE-ConnectionGUID: hp43XJJ0TtGJdI+lDKNNYg==
X-CSE-MsgGUID: XFlrAEnSRJaLLC+2sLtuRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54173414"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; d="scan'208,217";a="54173414"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:49:41 -0700
X-CSE-ConnectionGUID: xK++uYO2SGaqyJsyj7VSgw==
X-CSE-MsgGUID: qDbiShQeTF23JWkmiy0xlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
 d="scan'208,217";a="120470815"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2025 14:49:40 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 11 Mar 2025 14:49:39 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 11 Mar 2025 14:49:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 11 Mar 2025 14:49:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZabwUxpqEqpY0dpbGTjQK4NjeeusLtDfXDEeakAQ4pzVakit9u7RIZy+PTby+0ij094WfqkhzZU3guO0nF+cLB6Dg9ucswRWj9MB5lKDgzx78VxGA8eYimcF16hyrf8HwlVKIR2b3sgmRWAgnmwxlM11aRnpa4NW4QFL21zePCnAoJhgdbwdewrENvrS/YvOFYZsOy2yZeeiwhRd7A9pldCEqW/lGoP6nt4e6LFKvZz4PqKlLSyYGKmJyJ9yCyh/UULcWtu5O9BkmBRyyARuXUmpzHgZKEHfBFVzMvmR4xG6P1CyrblEKizxSBR9AfvOGkjHm8kjAS2D1xPYyUQBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pB33q2ZkOdAtYdjIQ6Ph4gv2oRZh9Tx47sY0+Um8Gds=;
 b=DfK8nxH0x2ObAlnDCRQNBleB4HRaufMIvHOtCaNQ2KJOlegniGaGzPKpCd+6HfwMNCE7cR08CVKjaEeqTHPmOoBH9X7rFcu/qHgGQd6ImnUaVL2xmVX8SCxY23HkhXK4JbpLPz1bh5OH4zgySy+XDqm7FXt48tanLRZSJMwOwR2L6YxFBG1Em5DxJWzryVydO8EVJAfO5SNW9VER/XjDKnxbELd2RzV//Xdzmi4BxHKzy/X3og5qSgwUGR5lrAfeFcxHgAgXarf3S0jO9a8RgE93clPQTVMo8L+kgTG8a41GYh7z6MHTMQ+Xsl1WH0rMz428/7Q3BpGHnP5n21nsVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4738.namprd11.prod.outlook.com (2603:10b6:5:2a3::18)
 by IA0PR11MB7935.namprd11.prod.outlook.com (2603:10b6:208:40e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 21:49:37 +0000
Received: from DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1]) by DM6PR11MB4738.namprd11.prod.outlook.com
 ([fe80::7064:9c9a:d2ca:c6a1%2]) with mapi id 15.20.8511.026; Tue, 11 Mar 2025
 21:49:37 +0000
Content-Type: multipart/alternative;
 boundary="------------0ybqSuuDt0qpzzE0qfEf9j76"
Message-ID: <98f90129-79a2-4bfc-9bd7-5f1385d7a9be@intel.com>
Date: Wed, 12 Mar 2025 03:19:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/5] data: Move PNG images to new data directory
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>, <swati2.sharma@intel.com>,
 <santhosh.reddy.guddati@intel.com>
References: <20250218215349.1063788-1-ramanaidu.naladala@intel.com>
 <20250218215349.1063788-2-ramanaidu.naladala@intel.com>
 <20250221164104.i7nqywrzydkzf36c@kamilkon-desk.igk.intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250221164104.i7nqywrzydkzf36c@kamilkon-desk.igk.intel.com>
X-ClientProxiedBy: MA0PR01CA0090.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::19) To DM6PR11MB4738.namprd11.prod.outlook.com
 (2603:10b6:5:2a3::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4738:EE_|IA0PR11MB7935:EE_
X-MS-Office365-Filtering-Correlation-Id: 359a7877-8cca-4888-dcbf-08dd60e69e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEZGSjFMMG5PTVVvQnVLY3pkY2ovcmNQRS9vRkpiZ0FDL1M0cEJkV3VXWk5i?=
 =?utf-8?B?MEpxZlVYamlNRkl5Q3EzbXVwczBIdEQ1K2NsSzFscE1YMGNiZUdycE9RL1FT?=
 =?utf-8?B?RGR4NFlKNkZZY3c1dHBjSm1YTmVONURkZUNuNFdRWjBKdHVvWktvRVlrL0hO?=
 =?utf-8?B?LzBUTHpQSkMydkU2ZisvQjR6OGRvVFJnQnhWTUNiTDdabXZWZTdSbXYxUC9X?=
 =?utf-8?B?TG1sOHQ1Qk1RVndJa0VPSmZMUUxMR3Q3eENBYnYrbEExaDFZOEF4SGdJcUE0?=
 =?utf-8?B?cDJTRXRGYmZFbnk0Y0Qza3RYQ3htQXIvVGsyRjA4ZnlZelM3VXRiU1JWYjV3?=
 =?utf-8?B?Rmdpai9qWWx0YlZVVkRlNjVGUkN3bWhnSy80Rm5OVG5zeGZob3ZZVTJma2tD?=
 =?utf-8?B?OEtIOTJ4Z3BsZVBNZjU3VFhVb1pjNXh1Unh6c0FXN2VWbUk4SzRXMm94NzJS?=
 =?utf-8?B?MVZPU1NxaDRVMHhzd01UbGxNMFVVK3l5VVVlelh1OGFHY0Zocks3ZE44SjA3?=
 =?utf-8?B?bUo4cUVzcU9HRDBIckFUZHQrdzBFQWNDWHdVaGwyblFmYUEwUTVxdXA0L0Ir?=
 =?utf-8?B?Y21KQ2dYRGh3Wmk5Q0tZMDFEb3dhU215OUZaNVFXOTBRRVBnV281clJ5SUdV?=
 =?utf-8?B?Z3BiZzdvdWcrM2VPMXJmK3BYTjZma285cVVXZDVNc2pNeHNSRFJ5THg0cmdk?=
 =?utf-8?B?cy9qcXIxWFI2amd2SW5icmd1NmkweUdmQ1IxV1FJZ2NsaVZMYjQxaHhScnNL?=
 =?utf-8?B?NXFLT2JrNnM2QW9ZWXFCVXRncGJHY1NidDJWZ05vWkhhWmdGb1crNlRuT1Ez?=
 =?utf-8?B?VTNJOUljQjhRRzYvQkpXUFZQTU9sV3Q5b2lkZkZQb05VSUtJUnJvMm1ZMy9X?=
 =?utf-8?B?cmFxM2U3WFJLcTJiL203Njhqc2lMU3BTaHMraGkyak4xQTNWeEtwZ2tqemp6?=
 =?utf-8?B?SExNMWtVQXVwZW01alAxT3pOVFlOajR6c0VNbTZndkFHS2JBRTc2RTBVNkNs?=
 =?utf-8?B?Zk1qTUFYd1d4QUwxMzhPd0RRMEtITzlCUks0eW81bUZ4Q3l5b21MbXpCUmlG?=
 =?utf-8?B?TGZYT3UwM0pqQjhWM0czK2FUS1gvSnZMRS9CWVRpcHh3L3pKYy9CSkt4TkNE?=
 =?utf-8?B?V3l3RjRlVE1rU3U4WDE2Yy9QTE01U0x4NEhGcWNZOU1xSnY2K25uZks5a0gw?=
 =?utf-8?B?L0lnQmhNK001bkdwT0hNSmtvejFDV2xYb3FENGJXWEY3NHpmaklwc1dSanVr?=
 =?utf-8?B?ZWtVeXdPQ0p0TzlOL2hTNXRHOUNJUEd4bVA3VzdmTHFrQW03Z0txMXMyUkVy?=
 =?utf-8?B?WnpXSG85MU5vUUVFcHE5UTIzMkRzczc5TjVVQ2k1NHdRM3NKZTZFa1lmRUJ5?=
 =?utf-8?B?bFM1NUE3YVpjNHRJUkI3c2VIOUg3cTkxaTI5RklPZzBjYWlTWkhHYTBmdmx2?=
 =?utf-8?B?Y2RQbllrQm9mSnpLa1VGT1pDRTNCK2wxRjZqVXFhM1A5eitrZEJQTFpiTUJP?=
 =?utf-8?B?Z1E1cUlSWXV5dmNBakJMTitaODh1NndDVlhIYmNkaG5wbjVtekRQNW4xM2lG?=
 =?utf-8?B?R0lMVUtKVGtDQ3lOb0liaWpTN2l3ZldDMXRVbnZ4anQ1Zm5pTDZJN0syNFFa?=
 =?utf-8?B?M3dXVmo2TnlsZlVXaU5pSDNnZ2NabWplY3VuTUJMeGxOMGVwUUs3Y1Y0Smtq?=
 =?utf-8?B?cVdDWHRNSkdkM2xyN0ZNWkhia1IvSk0xTFJvSTYvQ0VRQVF3cGV3V1FZcFJ3?=
 =?utf-8?B?eG00dCtSMUVVbHdLdmw4em10L09XR0trWHp5blE5RzBlRUhabGxFNm9vamdV?=
 =?utf-8?B?QzJwNUtkU1VxTVNHRXcwc2hzU1dPVURaVW5IYi9uZmRBVFpNRS9pYnZUSkgr?=
 =?utf-8?Q?ZbXwtv3fg0Sso?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4738.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBnbkRQNll1NlJuUXZCcWwwYnFMMmxMQWo0Qk1JK0p4ekwrTU40bllEM1Y5?=
 =?utf-8?B?RlpaZjdqaEdWd3JhUHBCRHRiVTR3bFlhbXEwdUg2cWxIRit5eGZRaHNyUmRl?=
 =?utf-8?B?djZzOEd3UTVGc1RHUVRwMXZBOXRidGdrb3JoYU1vbGx2RThMbVNkYWZlSzVS?=
 =?utf-8?B?azlXR1hYbUFmc3pieVhROCtJbm1MbFBjRXJ3c2UyTzNSQ3hha0tJNEVBMjd4?=
 =?utf-8?B?WUx3L2c0MGhvaFlIbmFoRTR5MDc3N2xFUEVKWjhHQVEra3RqQlBuaXdDU2Qw?=
 =?utf-8?B?a0pRQkFtbTYxY2ZidjU1Y09NcC8yQmFHdDdaa0ZRODRLS3ZNeCtWMHZSNlhY?=
 =?utf-8?B?NUM3VG1oeVJMS2VOSFBLeXhkd2tZRFFOa21sUW9Uenc1Q01SL2llTnZSTkgy?=
 =?utf-8?B?eUdoY2lGT3JzNUlDbWNHNXEyTm84WnFoOEVhQldSVVZ6cUd2L1Z1SnB6dmNM?=
 =?utf-8?B?endPSXJHZnBKZ2phN3ZoMzZ0ZXJkWEFkeWhqR3ZjTGZXTE9hMjVjbjdsQkl2?=
 =?utf-8?B?M3owZHJrYllDUVRwZjhvdFNtUnZxeWY1ZDVLZ2FyVnA1ck0vQXRtY2VodjM2?=
 =?utf-8?B?QzNISFdNZDc2UmtRQ2RXZyt4QjdIdUYxZnE0Q1lCZTZiM0RZU3YzNGlwNEJX?=
 =?utf-8?B?MGtFRGJMb2loUzRkZkxxbklTZ0lSYlljdG1vYTF5c3JkTE8xUmhlS3F0VkNO?=
 =?utf-8?B?MDFJVEc1K3Q0djcydzF6ME5pTFNMb0xCSlAzTk5iV2dNaW5rMndzVk1kdWRV?=
 =?utf-8?B?ckgxK0ZOZlFlWG9DOFhIc0psckkyQXVxMjIwWnNnTXlzL2l0TGhNOTVoY3VW?=
 =?utf-8?B?RE9NMVREeG1HOEtHaWphZ3dEUldkWW41TkR4cUNXbzVRQU5hVjBrQlc3dkxF?=
 =?utf-8?B?b3ZNNXM2NFpYMHgwc09keE8vaGZTSXRrcCtaaU5OcTJpVUVuYzNWRFpLUWY4?=
 =?utf-8?B?d3dtUEZxQno0WkFuME5kVjNxNktEdXdhY2Q0N0ZtZzQxVjRMUVVFYzVSYWhX?=
 =?utf-8?B?UjZ5T3FBektiTUI4LzllaTF3UmpzUnpLMHdlcWxDdEx2Q0pPeHVJQWMrNVMx?=
 =?utf-8?B?TGhTQXJORG5BdGhuU3VmaERkNy9FMWc5OHFRUXFFSXZ6STQ0RVF1bG1xNFZS?=
 =?utf-8?B?ZXZZRnhTcklXdTllam1wRnZybTJhNHFNREJ5K0hVeE9lbEhDclE1bDJvNW9u?=
 =?utf-8?B?SElSeUxGMlRxQnF2TkJ6c0RBK1R1Q3RaSUlnQUlwMzFIU2xXcDJ0QXVzcFZK?=
 =?utf-8?B?citFcEpCQUQ4MEVXUjc1Vm5teTlFRVpieGhUNE1zUjFGdHB3bDU2Q1hNb3lP?=
 =?utf-8?B?bC9PY2k4U1I3VE55blBRNEU5RlI2blVVWHhicUxmUHI4UFYzRndUVmFKUFlF?=
 =?utf-8?B?K29RMGdCcitrUWZIMVV5TzkxVWhXNnRvb0owTmVITWppNEJYVjE3bUp5SDgy?=
 =?utf-8?B?Tmg3MlR6bXBNOUJuN25QcjZRYUovTmk2K3RHazJvdGhhcHA0YW1tTUtoMHBY?=
 =?utf-8?B?dUhWTll5L0Z0ZEwwcXhlVVV6eEp5L3FtTDlHeGxmbUpjQlBMUDkza1c3TEFh?=
 =?utf-8?B?cmRKajl3UlJHWXFvZUcvRDFOcTMxR2YxY2tmK1h0QW5PdGFqOVZ3UVJaQWJZ?=
 =?utf-8?B?SzVGZzhXNGRmbzFETFRwYWw5ZEc0eTZFVm5TY0hidmp0bm9QMkRKTkZTbHFL?=
 =?utf-8?B?aEEyOWllWEVFaVh0eTdpS1gyNElJOHYwTDlvTHg1YjhhUEUxUU1xYXZXdkVO?=
 =?utf-8?B?Rmk1UGtsZXRKcGMyWHp0bEdGbnRNTWVsWkNlQlhFL2xQdHR1cFFjcWRsTEJY?=
 =?utf-8?B?VjhaV3lORzd2Ym1RY2pnTnptWFRVOFc3eklhNGRIOVFsS05aRk9uVnFwQngr?=
 =?utf-8?B?a0FHTGxEYi9kODFWdlhaZDlqV00wdHFaOWpGMFpHVkJqckpnanN0NW1HaEpG?=
 =?utf-8?B?b2ZWejU2UGJUNExleEEzMlAvbVU3cWFpTXRHTk5FRWhtUEFzNFRQbFU2OEp1?=
 =?utf-8?B?d25NMHJUVnMxend2dnF0UjFjelFxaHVQTkFMV0tUMFZwNkRFcjhJc2tSYVJY?=
 =?utf-8?B?ZjR3MjVaL01uRjFoWGtKMm9EMm00NjE2cFVMN0czVk9sUzJIOXRJOFpCdWRY?=
 =?utf-8?B?YVhmZW5BZnlvTkFWeXhBQWdrditFSUNBOG9paHpBRjBPZlU0MWxLb1Npd1dN?=
 =?utf-8?B?RHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 359a7877-8cca-4888-dcbf-08dd60e69e79
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4738.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 21:49:37.7622 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +aDPIzPv9MU+srIggdZcwwtv+U/P6hNRIUXktOtxSKqBMmsHxoglFkgWs87A5F5V9dPHgwWJqBIhwpvHvbLThv6MVgX1KMY3aPsWeSqpxrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7935
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

--------------0ybqSuuDt0qpzzE0qfEf9j76
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/21/2025 10:11 PM, Kamil Konieczny wrote:
> Hi Naladala,
> On 2025-02-19 at 03:23:45 +0530, Naladala Ramanaidu wrote:
>> Placing png images inside "tests/" directory seems wrong, as these
>> are not source files. These images should ideally be in a directory
>> with other non-exec files, so creating a new "data/" directory to
>> store such non-exec files.
>>
>> v2: Update commit message subject (Kamil)
>>
>> Signed-off-by: Naladala Ramanaidu<ramanaidu.naladala@intel.com>
>> Signed-off-by: Swati Sharma<swati2.sharma@intel.com>
>> ---
>>   {tests => data}/1080p-left.png  | Bin
>>   {tests => data}/1080p-right.png | Bin
>>   data/meson.build                |  11 +++++++++++
>>   {tests => data}/pass.png        | Bin
>>   lib/meson.build                 |   1 +
>>   meson.build                     |   2 ++
>>   tests/meson.build               |   7 -------
>>   7 files changed, 14 insertions(+), 7 deletions(-)
>>   rename {tests => data}/1080p-left.png (100%)
>>   rename {tests => data}/1080p-right.png (100%)
>>   create mode 100644 data/meson.build
>>   rename {tests => data}/pass.png (100%)
>>
>> diff --git a/tests/1080p-left.png b/data/1080p-left.png
>> similarity index 100%
>> rename from tests/1080p-left.png
>> rename to data/1080p-left.png
>> diff --git a/tests/1080p-right.png b/data/1080p-right.png
>> similarity index 100%
>> rename from tests/1080p-right.png
>> rename to data/1080p-right.png
>> diff --git a/data/meson.build b/data/meson.build
>> new file mode 100644
>> index 000000000..9490d20ac
>> --- /dev/null
>> +++ b/data/meson.build
>> @@ -0,0 +1,11 @@
>> +image_files = [
>> +  '1080p-left.png',
>> +  '1080p-right.png',
>> +  'pass.png',
>> +]
>> +
>> +foreach img : image_files
>> +      configure_file(output:img, input:img, copy:true)
>> +endforeach
>> +
>> +install_data(sources : image_files, install_dir : datadir)
> Are you sure this is ok? I tested it and PNG files where placed
> in /usr/local/share/igt-gpu-tools/
>
> while I would expect them in
> /usr/local/share/igt-gpu-tools/data/
>
> Please look for 'registers' folder used in intel_reg tools,
> it is installed as /usr/local/share/igt-gpu-tools/registers/
> and has there its files.
>
> Regards,
> Kamil

Hi Kamil,
Not to break the CI tools, Copy image files in both the places. When 
compile image files

will copy images in /usr/local/share/igt-gpu-tools/data/ and meson 
install will copy images

in /usr/local/share/igt-gpu-tools/. *Problem Case: *CI will compile and 
install in server and copy bin files to all target machines.

When CI extract tar file in /usr/local/ there is no issue. But when CI 
extracts files in other

paths tests are failing due to path hard coded.

>
>> diff --git a/tests/pass.png b/data/pass.png
>> similarity index 100%
>> rename from tests/pass.png
>> rename to data/pass.png
>> diff --git a/lib/meson.build b/lib/meson.build
>> index 9fffdd3c6..a248eb629 100644
>> --- a/lib/meson.build
>> +++ b/lib/meson.build
>> @@ -240,6 +240,7 @@ foreach f: lib_sources
>>   	    '-DIGT_DATADIR="@0@"'.format(join_paths(prefix, datadir)),
>>   	    '-DIGT_SRCDIR="@0@"'.format(srcdir),
>>   	    '-DIGT_LOG_DOMAIN="@0@"'.format(f.split('.')[0]),
>> +            '-DIGT_IMGDIR="@0@"'.format(imgdir),
>>   	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
>>   
>>       lib_intermediates += lib
>> diff --git a/meson.build b/meson.build
>> index 2f663dc03..38311f6e3 100644
>> --- a/meson.build
>> +++ b/meson.build
>> @@ -291,6 +291,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
>>   mandir = get_option('mandir')
>>   pkgconfigdir = join_paths(libdir, 'pkgconfig')
>>   python3 = find_program('python3', required : true)
>> +imgdir = join_paths(build_root, 'data')
>>   
>>   if get_option('use_rpath')
>>   	# Set up runpath for the test executables towards libigt.so.
>> @@ -386,6 +387,7 @@ endif
>>   subdir('overlay')
>>   subdir('man')
>>   subdir('docs')
>> +subdir('data')
>>   
>>   message('Build options')
>>   message('=============')
>> diff --git a/tests/meson.build b/tests/meson.build
>> index f8a0ab836..83986ee87 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -514,11 +514,4 @@ if not meson.is_cross_build()
>>   			output : 'gem_stress.testlist')
>>   endif
>>   
>> -image_files = [
>> -  '1080p-left.png',
>> -  '1080p-right.png',
>> -  'pass.png',
>> -]
>> -install_data(sources : image_files, install_dir : datadir)
>> -
>>   subdir('intel-ci')
>> -- 
>> 2.43.0
>>
--------------0ybqSuuDt0qpzzE0qfEf9j76
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/21/2025 10:11 PM, Kamil Konieczny
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20250221164104.i7nqywrzydkzf36c@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">Hi Naladala,
On 2025-02-19 at 03:23:45 +0530, Naladala Ramanaidu wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Placing png images inside &quot;tests/&quot; directory seems wrong, as these
are not source files. These images should ideally be in a directory
with other non-exec files, so creating a new &quot;data/&quot; directory to
store such non-exec files.

v2: Update commit message subject (Kamil)

Signed-off-by: Naladala Ramanaidu <a class="moz-txt-link-rfc2396E" href="mailto:ramanaidu.naladala@intel.com">&lt;ramanaidu.naladala@intel.com&gt;</a>
Signed-off-by: Swati Sharma <a class="moz-txt-link-rfc2396E" href="mailto:swati2.sharma@intel.com">&lt;swati2.sharma@intel.com&gt;</a>
---
 {tests =&gt; data}/1080p-left.png  | Bin
 {tests =&gt; data}/1080p-right.png | Bin
 data/meson.build                |  11 +++++++++++
 {tests =&gt; data}/pass.png        | Bin
 lib/meson.build                 |   1 +
 meson.build                     |   2 ++
 tests/meson.build               |   7 -------
 7 files changed, 14 insertions(+), 7 deletions(-)
 rename {tests =&gt; data}/1080p-left.png (100%)
 rename {tests =&gt; data}/1080p-right.png (100%)
 create mode 100644 data/meson.build
 rename {tests =&gt; data}/pass.png (100%)

diff --git a/tests/1080p-left.png b/data/1080p-left.png
similarity index 100%
rename from tests/1080p-left.png
rename to data/1080p-left.png
diff --git a/tests/1080p-right.png b/data/1080p-right.png
similarity index 100%
rename from tests/1080p-right.png
rename to data/1080p-right.png
diff --git a/data/meson.build b/data/meson.build
new file mode 100644
index 000000000..9490d20ac
--- /dev/null
+++ b/data/meson.build
@@ -0,0 +1,11 @@
+image_files = [
+  '1080p-left.png',
+  '1080p-right.png',
+  'pass.png',
+]
+
+foreach img : image_files
+      configure_file(output:img, input:img, copy:true)
+endforeach
+
+install_data(sources : image_files, install_dir : datadir)
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are you sure this is ok? I tested it and PNG files where placed
in /usr/local/share/igt-gpu-tools/

while I would expect them in
/usr/local/share/igt-gpu-tools/data/

Please look for 'registers' folder used in intel_reg tools,
it is installed as /usr/local/share/igt-gpu-tools/registers/
and has there its files.

Regards,
Kamil</pre>
    </blockquote>
    <p>Hi Kamil,<br>
      Not to break the CI tools, Copy image files in both the places.
      When compile image files</p>
    <p>will copy <span style="white-space: pre-wrap">images in /usr/local/share/igt-gpu-tools/data/ and meson install will copy images</span></p>
    <p><span style="white-space: pre-wrap">in  </span><span style="white-space: pre-wrap">/usr/local/share/igt-gpu-tools/. 

<b>Problem Case: </b>CI will compile and install in server and copy bin files to all target machines.</span></p>
    <p><span style="white-space: pre-wrap">When CI extract tar file in </span><span style="white-space: pre-wrap"> </span><span style="white-space: pre-wrap">/usr/local/ there is no issue. But when CI extracts files in other</span></p>
    <p><span style="white-space: pre-wrap">paths tests are failing due to path hard coded</span><span style="white-space: pre-wrap">.
</span></p>
    <p></p>
    <blockquote type="cite" cite="mid:20250221164104.i7nqywrzydkzf36c@kamilkon-desk.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">diff --git a/tests/pass.png b/data/pass.png
similarity index 100%
rename from tests/pass.png
rename to data/pass.png
diff --git a/lib/meson.build b/lib/meson.build
index 9fffdd3c6..a248eb629 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -240,6 +240,7 @@ foreach f: lib_sources
 	    '-DIGT_DATADIR=&quot;@0@&quot;'.format(join_paths(prefix, datadir)),
 	    '-DIGT_SRCDIR=&quot;@0@&quot;'.format(srcdir),
 	    '-DIGT_LOG_DOMAIN=&quot;@0@&quot;'.format(f.split('.')[0]),
+            '-DIGT_IMGDIR=&quot;@0@&quot;'.format(imgdir),
 	] + (iga64_assembly_sources.contains(f) ? [ '-ffat-lto-objects' ] : []))
 
     lib_intermediates += lib
diff --git a/meson.build b/meson.build
index 2f663dc03..38311f6e3 100644
--- a/meson.build
+++ b/meson.build
@@ -291,6 +291,7 @@ vmwgfxdir = join_paths(libexecdir, 'vmwgfx')
 mandir = get_option('mandir')
 pkgconfigdir = join_paths(libdir, 'pkgconfig')
 python3 = find_program('python3', required : true)
+imgdir = join_paths(build_root, 'data')
 
 if get_option('use_rpath')
 	# Set up runpath for the test executables towards libigt.so.
@@ -386,6 +387,7 @@ endif
 subdir('overlay')
 subdir('man')
 subdir('docs')
+subdir('data')
 
 message('Build options')
 message('=============')
diff --git a/tests/meson.build b/tests/meson.build
index f8a0ab836..83986ee87 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -514,11 +514,4 @@ if not meson.is_cross_build()
 			output : 'gem_stress.testlist')
 endif
 
-image_files = [
-  '1080p-left.png',
-  '1080p-right.png',
-  'pass.png',
-]
-install_data(sources : image_files, install_dir : datadir)
-
 subdir('intel-ci')
-- 
2.43.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------0ybqSuuDt0qpzzE0qfEf9j76--
