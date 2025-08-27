Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD63CA0FED
	for <igt-dev@archiver.kernel.org>; Wed, 27 Aug 2025 12:44:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C1710E811;
	Wed, 27 Aug 2025 12:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C4yvN0Rr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4138110E0E1
 for <igt-dev@lists.freedesktop.org>; Wed, 27 Aug 2025 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756298696; x=1787834696;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=XXzMQfqtxpPteI2i06KDJQopMB6FUa8e243gxu32G4U=;
 b=C4yvN0RrfDtZLaQCsHPdLcCvLeq/4G34d53AUvfakcHjt7GRGSu/sK/r
 8juDUS/ApFjEJ66VkFzEpNkqqzeulQE5JJlieHyNWx4zEuFQFHZtsWOJ2
 LEe+uPT8S5LfvEjlAY5aXN1v6pHnuBuHVSb06sRu0fkBCAOyMAuNEdL6e
 lVezsYkfXxyVp0zjhW0TWvKrFvIRAp56r0xtYj98dxUNC/2SdrlJt1QBk
 +CpkxpburSoRo1HsX87l6rV3Vw1Bty0Mm/SUpnZjRz8ydz34JUEj3u7Jc
 TjaG37H2CK1URpv8pS8nlXIuzNHadX+Hxa0T1kbpDdB8EsVV0rPN3UXaO A==;
X-CSE-ConnectionGUID: ekynb/AlRqyVPS1SGxc9vQ==
X-CSE-MsgGUID: ip9Tm/5bRfiV1D86G/qDcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="76147323"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208,217";a="76147323"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 05:44:56 -0700
X-CSE-ConnectionGUID: SGNPPlP9SV6rhra7rqY35Q==
X-CSE-MsgGUID: 2KcSxg2zSFWXWx9oYb7Q2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
 d="scan'208,217";a="193484257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 05:44:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 05:44:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 05:44:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.75) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 05:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0551rkyWX2i06Xxfh86HlA+wowNWXE7wvjnyHdwnuFyPNllgV2mQ/dl93OWRNv9y3hxNzhuU+ZEq7Gf0Wvt8dNpqYmTppS+9G7DYgm0bwBuT1NaKsTBzaA3b6fd71YcvWp6DKipDmTgvF754peh1hfQs2fO/FJ2keJlzXk7+nSkWZcqsiEyb0lKHxlgkHTjzgwbuhVac00u4V9kOlfvkt1ykMYqH9IKDD5H3YZsiC/oZjlU+m3eZAApBgub+wyv7rlPx6x5qLeorGaRNO5T/wuBarrZRvNImE24VU//Cw43vBDwmuFDNopO69aix+qsA/eF8LXtI4gfcHsFY55WjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aBO2ZsaQx15pIl2lB7n+d2NAn8DTiSvca5Y53II8Szw=;
 b=DceBFn6G/uN3atdXtOaqppD1hdii9eUt+KGJzf5TNr4ykxRiKDUpCYRnn4Ln3J73Bv1lobDZLOmnzM5OmB2wiEI6DcWK7XpPU32K8AtlGO3fsG9K8tpUZyWX2uzo93cfFrltjU11x8LktrhS7Hha0Y00dIKYOqtil0yIfmSRambSVdKrQ4vEF6dc4PMAirq4zXCZQX9Wt4z5z88dzmWy/iV2yZwwlhA7lH7AW4xEm1tcnPX5MD9mfrpDDBWvv2iFIIk6V4WZ9m87+5RjPI/4qs3g/NOAtdpCh1SRmWUnS7E+28HPx6Hqp0/AvqhOcboNcrE8YJoYqVg3n1y30ut83g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by CYXPR11MB8710.namprd11.prod.outlook.com (2603:10b6:930:da::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 12:44:51 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 12:44:51 +0000
Content-Type: multipart/alternative;
 boundary="------------PHb4JDPubST1eKtiIAFMNOkH"
Message-ID: <d70603ff-7c0b-4b48-9791-02a704d1f471@intel.com>
Date: Wed, 27 Aug 2025 14:44:47 +0200
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_tests/intel?=
 =?UTF-8?Q?-ci/xe=2Ebmg=2Ecore=2Eblocklist=2Etxt=3A_Remove_SR-IOV_tests?=
To: <igt-dev@lists.freedesktop.org>
References: <20250822142425.491548-1-jakub1.kolakowski@intel.com>
 <175592974471.263401.12799742668102566612@1538d3639d33>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <175592974471.263401.12799742668102566612@1538d3639d33>
X-ClientProxiedBy: VI1PR04CA0095.eurprd04.prod.outlook.com
 (2603:10a6:803:64::30) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|CYXPR11MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 1899d678-ee77-4e37-e3da-08dde567837a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFlYOVYrNnM2aVVnQWpBS3BuVlZkbmwzZ3RKR0x2MXRVQnFLQkVXRml5ZlFR?=
 =?utf-8?B?YjkwbTNyYnhiM0UyRnFyUG5saVdsQ0RaM2NVa3pKb3hKaTV4d3RhcEZJWjFr?=
 =?utf-8?B?WnRlWTNhY2ZwRStHcFlpck1jczdSU1gvaCtLUmY5dTYvL000OUN3T0xqYk5a?=
 =?utf-8?B?YUd0QTdwWjhrTHpGWE9vek8zbnROSDhnVS9aWlVVbHlBc2tRNTBUT0RlOUtt?=
 =?utf-8?B?MlRBcmxYNUNrTGFUMFk4dkNJeGU0M3QyQmhXQkk0ZjZremNCbWVnNkFtclRJ?=
 =?utf-8?B?OHFDUjQzODVwblNSS1MrMGV6YjlES0FpZ0NqRURwbzBoaVdDdzBBYWdReGxn?=
 =?utf-8?B?ZWhtcjMxd0tPdkswTnB6cDVXd3NrVmtEamtCWEZiUlFzbVFkNGlWSnNNcmJZ?=
 =?utf-8?B?dXdncXUyRnNnQnNZWGcxWHdwRHlOL0FtQlg3T1UzL2lGUDZoTkFYQkJranBP?=
 =?utf-8?B?eFZHSFpsL3A4YnA4azFManEyVlB1ZEZDUkEzV1hzdTBqWWRZTGQ0YUhkNXYz?=
 =?utf-8?B?Tk9iUE92STdhL0ZPY25GNU54QnBla29ITHZ4Q0dxaldodTh6dHN0eVdtbkhY?=
 =?utf-8?B?dEVISDV1Z1lNZXJwZkhKTUs0Q0FDampxSzhkWlJxazJ6SjE0UWxTMGdlK1cz?=
 =?utf-8?B?QlJDakNIQ2l6NUduVGJrVDFCcC9jNGc5ZFFMRVNYRzQrZjY4dVNYM0JLdVRP?=
 =?utf-8?B?WnFRVGwyUUdERExJWHJvSG5OczUrcEFrbUlueGlOQlZSaFpPVURDQnFHQ0M1?=
 =?utf-8?B?WmlCLzFVc3FKZDBFU3YzSDB4ZFlpVVFXdjhVVEdNd0cxU2E3R3JpcENKK1ZI?=
 =?utf-8?B?T3V1QXZ5ellQTjN3TFVLUGpJQU5tZHdYMDF3NVFtQW9KcTJIUzlTaGJmL3Zq?=
 =?utf-8?B?L0RETlZhc01wSStUdkluc0UwcU5ER0lidFlTVU1YRkcvZ0xOMDRDUTF3V09w?=
 =?utf-8?B?bCtWUlUwbTJyNi95VU1TRlFQcVVISkZ4NUI0U1FXS0RSbndGdVFiOTBWTU5I?=
 =?utf-8?B?UGhscEcvT3EzbHp4bTk2cU9yYU95OUhxZ01kWlNOTEFxTVBNL1QzUjBCRGh4?=
 =?utf-8?B?OWR3bE1XT3Q4L25kQWRrNTQrQmRmVlNoZTRDOVJMeGRRY3pYN1RQeWF4NVh2?=
 =?utf-8?B?Z2tPTGxZRkRZWUljSFJQeThIQUNHM0x5V2lMV3RsK2R3SGpDLzBtaG1BQVA4?=
 =?utf-8?B?MEpsMld0eE5oZzEvY3cyUU5nVVQ5aDAyOFREN1B0Z0ZFMDN6ZHdBaEdtSnBV?=
 =?utf-8?B?SmNKelBETStQOHhYUFp5SU80ME9UWGtaLzhoZjVQajMraUpCRGxLV2pSVllK?=
 =?utf-8?B?N0VCcVJZR0g2ZUIwdE1qU2wrNW93MHZuUDMwVDAxSFVJZFBFQUNCOEt4dndE?=
 =?utf-8?B?c3VNOFgxWkMwSTZLb0JHTStwWk1LUlFFd3d2THllNDhlanpCdDlWaE9KREpX?=
 =?utf-8?B?anNzcE1ITHVsMDluWlN5azBUWXI5U0U2M25LYitrVEJ4alVUK0tXcTliYnYx?=
 =?utf-8?B?U0pwK2w0R0w2d2FSSFlqdWJnZHoyQmVTK1J6Nml4WSt1VVE2Y0xTUkhka0Js?=
 =?utf-8?B?dzAzcC9OcVg4OU1hRjNDcXgxU09RbHZDWmhvWU5nS3N1ODU5UFYwMHV4ZzQ2?=
 =?utf-8?B?K2FkZXlCWkVkUGdjelpKVHk2Q1Q1SHRvU3BxU2VobjV2RWhIWDBuWnJ2UDM5?=
 =?utf-8?B?eitxL3IzUTA2NkYyc2lrS0NSeHhzOStOTlhqaXdEZGprSTh0MDJPMTNHZU5w?=
 =?utf-8?B?b2ErMU5kaUVkVE1KTHd6UXByQXhxMUZVOXhndWlPNFFuZk1xa3pxMzRaUE1o?=
 =?utf-8?Q?CRc5FXcmLOLtJz0Xpi3pbxIRCbX4VqDCzMkJw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mkk5ai9PMjNKUm9vVlM1K2NSMnpaT0t6cE80ZmVnQjBQZUp2a3M5aVRsNUli?=
 =?utf-8?B?emViT1N4aDJIKy83Y0wxV3dSdDJhNG9MRFVJNkpTRHlzc2RvcitUdXBWNDZl?=
 =?utf-8?B?aWI2QlhWMEtzZmdxTjQ2TGxBQjBSSWhYblNwWWpkYTljd0hxMGFIYm5uUFpD?=
 =?utf-8?B?R2tnaC9MOTJLa3FiSVAwQTVlc2dLYUNhN2J4T2FKczJkbFNPMDQ3TkhQYWhz?=
 =?utf-8?B?TlVGbUVNeVRhdFFFRmFXNDFEZTF1aUh2Umc3K1BRQytITVY0blpyVDNNd1Ro?=
 =?utf-8?B?eUZtbzhFLzVzemxSSjlqU0ExdmVpMDhBSkhwaTFtcDhCWE1FRWFZUVFSbU1o?=
 =?utf-8?B?QVp0S3ppNHk1SkN3ZTZ3VXVWZGliNUNXZm5DTE0xVGpGa1FvRjdQbDhIcExX?=
 =?utf-8?B?VmJybDFFVGlLNmc0UW9BazlIcCs2NVp3ZURNbDNLOFdaVmRvbmR4bTNGREgy?=
 =?utf-8?B?NUU2Skl2UENMcm1SZ3Z6UUZjc3l2OXNrZDF3eG9ML0x5OCtSYm9PU0g3eHlR?=
 =?utf-8?B?OW1HQzNWS3VtSThrR1R2VSt1UkNheXdmVVFTaGlwSldIUHJkRWFiS09qVEQr?=
 =?utf-8?B?Z0lHNUpkTUFvcUZuMlBOUy91OXhoeFVDMFZ6SXZ4U2dYak1BQUZNeUVpaGx4?=
 =?utf-8?B?R3ZFZWlSRElTR3NKdFFpUi9YZ2RyREdPanVVREVUYi9JVGpRcG1mS1lZWVBW?=
 =?utf-8?B?VFAwdjVOZXF4TUg3Y0h3RTJKUXlvMHhsbXpQUHlyOXE5OE5vdmw5K0g2cFls?=
 =?utf-8?B?aDh1bDdickNZbnk3R041TFgxV0xrT3luQXRhY1lpdkFvcm5LMlRwNUppMEJF?=
 =?utf-8?B?Y3c0UG1TYjFFLzBzOWl1T0RRTUR5eVFnOGNKS3UxTG4yaHNOQnl1R1JwOFht?=
 =?utf-8?B?RGVxbzQ4NWp4bFRKQVFTV0drblhKMW9yRWdGbVRBV3JRRDRDb1IrS2tNNnNn?=
 =?utf-8?B?U1U4YXd2WG5jbnZ5TUtUSjVMNGozWUp2TGNoMzZjb2w2NTl6b2xyVHRLT3Q2?=
 =?utf-8?B?eWgzTXFCWmFMZHJiNTByVW1zeUdOWmZvM0V2QWQxQzNSeHJGOWJ6Mjd0Vm5p?=
 =?utf-8?B?ZTJYdXdDQXVaSWw4dThjbUJNb3VaRTlObFhUVmtNeXN0L0dEbFRlZUhEWnUx?=
 =?utf-8?B?WEsxclRQTEVpWVdUWCtrMzk4c3BKOXBoZ0Q1QnpxTEp4alNSUkxMdTdGaEQ4?=
 =?utf-8?B?Mk5aSEorc0swTTRUOGRKNXZXZHZ1eVM5djQ1Z0FZbmpMa3B0VUFONW5OOERG?=
 =?utf-8?B?QWF4bVNwSmMyRGV6c2JZdWRYLzZMa2cxT2pvNFIwUGo0c29rQVJBVU1lOVFp?=
 =?utf-8?B?K2Q5WEdxYzlrQmpNMlJUeFowY1NUVGhLTk4yVG1XZHdNcm5pbjEzTFdNQ2p4?=
 =?utf-8?B?SU9jaEVFL0V3aGV3akxNVXdpUTZDUmxPM0FOaE9TSnMza2llckkyM1NNUHR6?=
 =?utf-8?B?ZXpsY0NLaTBCYVdPUkJYaHZiRXQ3MmIwUjl5bndYU3JZUEJWMFc2S3QrUEJh?=
 =?utf-8?B?VTl0N0tKU2ptQkJXaXpLbHNpZ2MwWG43NzhPQjFGVjJBYTBzMTgrMjFuNUY3?=
 =?utf-8?B?UW9KcDBlK0p6VUd0R0Z2UDVhczM3bHNkWlBKcHRYdldaUDhWNGRPbGdrNWVZ?=
 =?utf-8?B?TVlsc0dEL1BKZmw5TUtwRnJCTEhsZ0Vvc2dSL2ZBUHRBQmxMTC9qa0xlclZk?=
 =?utf-8?B?eEhxQ2tNWWFYRHh4LzZPK2pTTkk4YlI4UmM0RGROajlvVDZBbUN4TjZxSk5p?=
 =?utf-8?B?UXZQYVovTWdPUkdOR1liUG9La0tDb2MzRjZIcjQyeUFwdFhUK1l1Nm51Ykkv?=
 =?utf-8?B?OCsvS3loNGk5djVtOFVNTlF0dXhvZFlTSmxobE4rTHpES21YRFYyZFlCMUVG?=
 =?utf-8?B?UnRLVTRNNUxJMnN0Vzl5d1didTY4RndjTFl1SnlzZzBYa1FqTnlHZkFKcnZ4?=
 =?utf-8?B?SEs2NGcrZmFrdko1VDVHK1hUazVBY0ZUSXhHV1kzZ0RrNGZvcHVTanpXaFBN?=
 =?utf-8?B?SXFJRlV5dk45SnBsRm1WMTQ2WWJmak5wZnZBN25JL1A3enVZbVlISGFPb2s4?=
 =?utf-8?B?OURUM09ZWXpFbjdHYjE5ajNDVHFrTVZhNitmVnpOMVpjdDFIR1U4SXVsUk95?=
 =?utf-8?B?cFdxdHM0RzZQbnRCcFFiRVNIWWZETjlyUzg1dDhkTGU3TmhhVlJMeVZsQ3ZI?=
 =?utf-8?B?U0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1899d678-ee77-4e37-e3da-08dde567837a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:44:51.1192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QWNREW1m4Jfibruln4FRyo+HxMycmFk/GUY0hKVYH6rHhlZ+hz3LpPQsvdYrmg25fUbYyXtJrfQDdWX5D8n4JYx+dvS3LgpKYfnUwWoarY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8710
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

--------------PHb4JDPubST1eKtiIAFMNOkH
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 8/23/2025 8:15 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	tests/intel-ci/xe.bmg.core.blocklist.txt: Remove SR-IOV tests
> *URL:* 	https://patchwork.freedesktop.org/series/153351/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/index.html
>
>
>   CI Bug Log - changes from XEIGT_8504_FULL -> XEIGTPW_13619_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_13619_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_13619_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (4 -> 3)
>
> Missing (1): shard-adlp
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_13619_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@fbdev@read:
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@fbdev@read.html>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@fbdev@read.html>
>
not related to this change, patch is removing iov tests from BMG 
blocklist, not fbdev
>
>  *
>
>
>     New tests
>
> New tests have been introduced between XEIGT_8504_FULL and 
> XEIGTPW_13619_FULL:
>
>
>       New IGT tests (9)
>
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.14] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.20] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.15] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-2:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.21] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-4:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.17] s
>  *
>
>     igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-6:
>
>       o Statuses : 1 pass(s)
>       o Exec time: [0.14] s
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_13619_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_async_flips@alternate-sync-async-flip:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html>
>         (Intel XE#827
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/827>) +1
>         other test fail
>  *
>
>     igt@kms_big_fb@4-tiled-16bpp-rotate-180:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_big_fb@4-tiled-16bpp-rotate-180.html>
>         (Intel XE#5643
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643>)
>  *
>
>     igt@kms_big_fb@4-tiled-8bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@linear-16bpp-rotate-90:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-90.html>
>         (Intel XE#316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/316>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-8bpp-rotate-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +9
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#619
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/619>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>)
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#1477
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477>)
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-1920x1080p:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2560x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-3840x2160p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html>
>         (Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>         +160 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +6
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1
>         other test incomplete
>  *
>
>     igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>)
>  *
>
>     igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +32
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
>
>       o shard-dg2-set2: NOTRUN -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2907
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +12
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_cdclk@mode-transition.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html>
>         (Intel XE#4417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition@pipe-d-dp-4:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html>
>         (Intel XE#4417
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417>) +3
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>) +2
>         other tests skip
>  *
>
>     igt@kms_chamelium_color@ctm-max:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_chamelium_color@ctm-max.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +8
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +6
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +3
>         other tests skip
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>)
>  *
>
>     igt@kms_content_protection@legacy@pipe-a-dp-2:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-onscreen-512x170:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x170:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html>
>         (Intel XE#308
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/308>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-64x21:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-64x21.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +4
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html>
>         (Intel XE#1475
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475>)
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         -> DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#323
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/323>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#5428
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5428>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats-with-bpc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_dsc@dsc-with-output-formats-with-bpc.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_flip@2x-blocking-wf_vblank:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +3
>         other tests skip
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +13
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>)
>  *
>
>     igt@kms_force_connector_basic@prune-stale-modes:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html>
>         (Intel XE#352
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +15 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +11
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +21
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html>
>         (Intel XE#653
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/653>) +30
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +16 other tests skip
>  *
>
>     igt@kms_hdr@static-toggle-dpms:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#346
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/346>)
>  *
>
>     igt@kms_joiner@basic-force-big-joiner:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html>
>         (Intel XE#3012
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2934
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#2925
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925>)
>  *
>
>     igt@kms_joiner@basic-ultra-joiner:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html>
>         (Intel XE#2927
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927>)
>  *
>
>     igt@kms_panel_fitting@atomic-fastset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_panel_fitting@atomic-fastset.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>)
>  *
>
>     igt@kms_plane_cursor@viewport:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-435/igt@kms_plane_cursor@viewport.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_plane_cursor@viewport.html>
>         (Intel XE#616
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/616>) +1
>         other test fail
>  *
>
>     igt@kms_plane_multiple@tiling-yf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_plane_multiple@tiling-yf.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +3
>         other tests skip
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html>
>         (Intel XE#2763
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763>) +4
>         other tests skip
>  *
>
>     igt@kms_pm_backlight@basic-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>) +1
>         other test skip
>  *
>
>     igt@kms_pm_dc@dc5-dpms:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>)
>  *
>
>     igt@kms_pm_dc@deep-pkgc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.html>
>         (Intel XE#908
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/908>)
>  *
>
>     igt@kms_pm_rpm@i2c:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_pm_rpm@i2c.html>
>         (Intel XE#5099
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099>)
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_pm_rpm@i2c.html>
>         (Intel XE#5099
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5099>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +6
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html>
>         (Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-pr-sprite-plane-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_psr@fbc-pr-sprite-plane-onoff.html>
>         (Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +5
>         other tests skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899> /
>         Intel XE#929
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/929>) +13
>         other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-move.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1.html>
>         (Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>)
>  *
>
>     igt@kms_psr@psr-cursor-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_psr@psr-cursor-render.html>
>         (Intel XE#5784
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5784> /
>         Intel XE#5899
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +3
>         other tests skip
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +3
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html>
>         (Intel XE#1127
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>)
>  *
>
>     igt@kms_setmode@clone-exclusive-crtc:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html>
>         (Intel XE#1435
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435>) +1
>         other test skip
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#1500
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500>)
>  *
>
>     igt@kms_tv_load_detect@load-detect:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_tv_load_detect@load-detect.html>
>         (Intel XE#330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/330>)
>  *
>
>     igt@kms_vrr@negative-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_vrr@negative-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html>
>         (Intel XE#1091
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> /
>         Intel XE#2849
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>)
>  *
>
>     igt@xe_compute@ccs-mode-compute-kernel:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#5963
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5963>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html>
>         (Intel XE#1447
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447>)
>  *
>
>     igt@xe_compute_preempt@compute-preempt:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_compute_preempt@compute-preempt.html>
>         (Intel XE#1280
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280> /
>         Intel XE#455
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/455>) +1
>         other test skip
>  *
>
>     igt@xe_eu_stall@invalid-event-report-count:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html>
>         (Intel XE#5626
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-metadata-discovery:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +7
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>         +12 other tests skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +4
>         other tests skip
>  *
>
>     igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>)
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>  *
>
>     igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_fault_mode@once-invalid-userptr-fault:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html>
>         (Intel XE#288
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/288>) +18
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-huge-nomemset:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-race-nomemset.html>
>         (Intel XE#4915
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915>)
>         +235 other tests skip
>  *
>
>     igt@xe_module_load@force-load:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_module_load@force-load.html>
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@xe_module_load@force-load.html>
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_module_load@reload-no-display:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-432/igt@xe_module_load@reload-no-display.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@xe_module_load@reload-no-display.html>
>         (Intel XE#5087
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087>)
>  *
>
>     igt@xe_oa@mi-rpc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_oa@mi-rpc.html>
>         (Intel XE#3573
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573>) +5
>         other tests skip
>  *
>
>     igt@xe_oa@mmio-triggered-reports-read:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_oa@mmio-triggered-reports-read.html>
>         (Intel XE#5103
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html>
>         (Intel XE#2838
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838> /
>         Intel XE#979
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#977
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pat@pat-index-xelp.html>
>         (Intel XE#2245
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245>)
>  *
>
>     igt@xe_peer2peer@read:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@xe_peer2peer@read.html>
>         (Intel XE#2427
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427>)
>  *
>
>     igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
>
>       o shard-dg2-set2: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html>
>         (Intel XE#1173
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173>) +1
>         other test fail
>  *
>
>     igt@xe_pm@d3cold-basic:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_pm@d3cold-basic.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>) +2
>         other tests skip
>  *
>
>     igt@xe_pm@vram-d3cold-threshold:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html>
>         (Intel XE#579
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/579>)
>  *
>
>     igt@xe_pmu@fn-engine-activity-sched-if-idle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#3970
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970>)
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@xe_pmu@fn-engine-activity-sched-if-idle.html>
>         (Intel XE#4650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650>)
>  *
>
>     igt@xe_pmu@gt-frequency:
>
>       o shard-dg2-set2: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-435/igt@xe_pmu@gt-frequency.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@xe_pmu@gt-frequency.html>
>         (Intel XE#4819
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4819>) +1
>         other test fail
>  *
>
>     igt@xe_pxp@display-pxp-fb:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +2
>         other tests skip
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-invalid-query:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_query@multigpu-query-invalid-query.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
>
>       o shard-dg2-set2: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>) +1
>         other test skip
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html>
>         (Intel XE#4130
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130>)
>
>
>         Possible fixes
>
>  *
>
>     igt@intel_hwmon@hwmon-write:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@intel_hwmon@hwmon-write.html>
>         (Intel XE#4665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@intel_hwmon@hwmon-write.html>
>  *
>
>     igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4.html>
>         (Intel XE#4912
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4912>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4.html>
>         +1 other test pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         (Intel XE#911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/911>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html>
>         +3 other tests pass
>  *
>
>     igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html>
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         +2 other tests pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-5/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>
>  *
>
>     igt@kms_plane_multiple@2x-tiling-4:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-4.html>
>  *
>
>     igt@kms_pm_dc@dc6-dpms:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html>
>         (Intel XE#718
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/718>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_pm_dc@dc6-dpms.html>
>         +1 other test pass
>  *
>
>     igt@kms_vrr@cmrr@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         (Intel XE#4459
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
>
>       o shard-dg2-set2: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html>
>         +4 other tests pass
>  *
>
>     igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-1/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html>
>  *
>
>     igt@xe_exec_threads@threads-hang-rebind:
>
>       o shard-bmg: DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html>
>  *
>
>     igt@xe_exec_threads@threads-mixed-fd-rebind:
>
>       o shard-bmg: DMESG-FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-8/igt@xe_exec_threads@threads-mixed-fd-rebind.html>
>         (Intel XE#3876
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@xe_exec_threads@threads-mixed-fd-rebind.html>
>
>
>         Warnings
>
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>)
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
>
>       o shard-dg2-set2: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124> /
>         Intel XE#4345
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345>) ->
>         INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html>
>         (Intel XE#1727
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727> /
>         Intel XE#3113
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113> /
>         Intel XE#3124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124>)
>  *
>
>     igt@kms_content_protection@atomic-dpms:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_flip@bo-too-big-interruptible@a-edp1:
>
>       o shard-lnl: TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html>
>         (Intel XE#1504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504>) ->
>         TIMEOUT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html>
>         (Intel XE#1504
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504> /
>         Intel XE#5737
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737>) +1
>         other test timeout
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#5390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +9
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +8
>         other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>)
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-lnl: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8504/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#4917
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917> /
>         Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466>)
>
> {name}: This element is suppressed. This means it is ignored when 
> computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
>
>
>     Build changes
>
>   * IGT: IGT_8504 -> IGTPW_13619
>   * Linux: xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f ->
>     xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66
>
> IGTPW_13619: 13619
> IGT_8504: 8504
> xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f: 
> cca87ca63e2f5b8a785dc59c23e526987530b27f
> xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66: 
> a9008af007ab96e23814e3248475e7a4f4aebe66
>
--------------PHb4JDPubST1eKtiIAFMNOkH
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 8/23/2025 8:15 AM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:175592974471.263401.1279974266810=
2566612@1538d3639d33">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>tests/intel-ci/xe.bmg.core.blocklist.txt: Remove SR-IOV
              tests</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/153351/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/153351/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
13619/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8504_FULL -&gt;
        XEIGTPW_13619_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_13619_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_13619_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (4 -&gt; 3)</h2>
      <p>Missing (1): shard-adlp </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_13619_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@fbdev@read:
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@fbdev@read.html" moz-d=
o-not-send=3D"true">FAIL</a></li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@fbdev@read.html" moz-do-not-s=
end=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    not related to this change, patch is removing iov tests from BMG
    blocklist, not fbdev
    <blockquote type=3D"cite" cite=3D"mid:175592974471.263401.1279974266810=
2566612@1538d3639d33">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>New tests</h2>
      <p>New tests have been introduced between XEIGT_8504_FULL and
        XEIGTPW_13619_FULL:</p>
      <h3>New IGT tests (9)</h3>
      <ul>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-a-hdmi-a-6:=
</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-b-hdmi-a-6:=
</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.14] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.20] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-c-hdmi-a-6:=
</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.15] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-2:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.21] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-dp-4:</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.17] s</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@invalid-async-flip-atomic@pipe-d-hdmi-a-6:=
</p>
          <ul>
            <li>Statuses : 1 pass(s)</li>
            <li>Exec time: [0.14] s</li>
          </ul>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_13619_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_async_flips@alternate-sync-async-flip:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_async_flips@alternate-=
sync-async-flip.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/827" moz-do-not-send=3D"true">=
Intel XE#827</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-16bpp-rotate-180:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-466/igt@kms_big_fb@4-tiled-16bpp-rotate-180.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_big_fb@4-tiled-16bp=
p-rotate-180.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5643" moz-do-not-send=3D"tr=
ue">Intel XE#5643</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#2=
327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_big_fb@linear-16bp=
p-rotate-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316" moz-do-not-send=3D"true">Inte=
l XE#316</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1407" moz-do-not-send=3D"true">Intel XE#1=
407</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_big_fb@y-tiled-max=
-hw-stride-32bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-n=
ot-send=3D"true">Intel XE#1124</a>) +9 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-se=
nd=3D"true">Intel XE#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-se=
nd=3D"true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2328" moz-do-not-send=3D"true">Intel XE#2328</a>)=
</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@kms_big_fb@yf-tiled-ad=
dfb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/619" moz-do-not-send=3D"true">Intel XE#619=
</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1467" moz-do-not-send=3D"true">Intel XE#1467</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-send=3D"true=
">Intel XE#607</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_big_fb@yf-tiled-ad=
dfb-size-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607" moz-do-not-sen=
d=3D"true">Intel XE#607</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1477" moz-do-not-send=3D"tru=
e">Intel XE#1477</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=
=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_bw@connected-linea=
r-tiling-3-displays-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-no=
t-send=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_bw@linear-tiling-1=
-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"t=
rue">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_bw@linear-tiling-1-displa=
ys-2560x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_bw@linear-tiling-3-displa=
ys-3840x2160p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a=
-6:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_ccs@crc-primary-ba=
sic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" mo=
z-do-not-send=3D"true">Intel XE#787</a>) +160 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-s=
end=3D"true">Intel XE#2887</a>) +6 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-s=
end=3D"true">Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg=
2-mc-ccs.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_ccs@crc-=
primary-suspend-4-tiled-dg2-mc-ccs.html" moz-do-not-send=3D"true">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862"=
 moz-do-not-send=3D"true">Intel XE#3862</a>) +1 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"t=
rue">Intel XE#3432</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"t=
rue">Intel XE#3432</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_ccs@missing-ccs-bu=
ffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455" moz-d=
o-not-send=3D"true">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) =
+32 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_ccs@random-ccs-dat=
a-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html" moz-do-not-send=3D"true">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/172=
7" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel XE=
#3113</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6=
:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs@pipe-a-hdmi-a-6.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt=
@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html" moz-do-no=
t-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not=
-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3124" moz-do-not-send=3D"true">Intel XE#3124</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_ccs@random-ccs-dat=
a-4-tiled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2907" moz-do-not-send=3D"tru=
e">Intel XE#2907</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send=
=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +12 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_cdclk@mode-transition.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Intel XE#2724</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_cdclk@mode-transition@pip=
e-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4417" moz-do-not-send=3D"true">Intel=
 XE#4417</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_cdclk@mode-transit=
ion@pipe-d-dp-4.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4417" moz-do-not-send=3D"true"=
>Intel XE#4417</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_chamelium_color@ct=
m-0-50.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#=
306</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-max:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_chamelium_color@ctm-max.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>)=
</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_chamelium_color@ctm-max.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_chamelium_hpd@hdmi=
-hpd-for-each-pipe.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"tru=
e">Intel XE#373</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Int=
el XE#2252</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@vga-hpd-enable-disable-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_chamelium_hpd@vga-hpd-ena=
ble-disable-mode.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true"=
>Intel XE#373</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_content_protection@dp-mst=
-lic-type-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2390" moz-do-not-send=3D"true">Int=
el XE#2390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_content_protection=
@legacy@pipe-a-dp-2.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"t=
rue">Intel XE#1178</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_cursor_crc@cursor-onscree=
n-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel=
 XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_cursor_crc@cursor-=
sliding-512x170.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/308" moz-do-not-send=3D"true">=
Intel XE#308</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-64x21.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel XE=
#2320</a>) +2 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding=
-64x21.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true">Intel XE=
#1424</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@k=
ms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>) +4 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-sen=
d=3D"true">Intel XE#309</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-trans=
itions.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_cursor_legac=
y@flip-vs-cursor-atomic-transitions.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475" moz-=
do-not-send=3D"true">Intel XE#1475</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-varying-size=
.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_cursor_legacy@flip=
-vs-cursor-varying-size.html" moz-do-not-send=3D"true">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354" moz-do-not=
-send=3D"true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-tra=
nsitions:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_cursor_legacy@shor=
t-busy-flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
23" moz-do-not-send=3D"true">Intel XE#323</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323" moz=
-do-not-send=3D"true">Intel XE#323</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286" mo=
z-do-not-send=3D"true">Intel XE#2286</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5428" moz-do-not-send=3D"true">Intel XE#5428<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Int=
el XE#2244</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Int=
el XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</=
p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_fbc_dirty_rect@fbc=
-dirty-rectangle-out-visible-area.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do=
-not-send=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-blocking-wf_vblank:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html" moz-do-n=
ot-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) +3=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel=
 XE#1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true"=
>Intel XE#2316</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-d=
o-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downsc=
aling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downsc=
aling:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_flip_scaled_crc@fl=
ip-64bpp-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455"=
 moz-do-not-send=3D"true">Intel XE#455</a>) +13 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-d=
o-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@prune-stale-modes:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_force_connector_basic@pru=
ne-stale-modes.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/352" moz-do-not-send=3D"true">I=
ntel XE#352</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-indfb-pgflip-blt=
:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not=
-send=3D"true">Intel XE#2311</a>) +15 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt=
:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-plflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do-not-=
send=3D"true">Intel XE#656</a>) +11 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_frontbuffer_tracki=
ng@drrs-rgb101010-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not=
-send=3D"true">Intel XE#651</a>) +21 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:<=
/p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-s=
end=3D"true">Intel XE#5390</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-send=3D=
"true">Intel XE#651</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw=
-mmap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" mo=
z-do-not-send=3D"true">Intel XE#2312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_frontbuffer_tracki=
ng@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653" =
moz-do-not-send=3D"true">Intel XE#653</a>) +30 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-spr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-no=
t-send=3D"true">Intel XE#2313</a>) +16 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle-dpms:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-3/igt@kms_hdr@static-toggle-dpms.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>=
)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_joiner@basic-big-joiner.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#346</a>)=
</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_joiner@basic-big-j=
oiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/346" moz-do-not-send=3D"true">Intel XE#3=
46</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-big-joiner:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html" moz-d=
o-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3012" moz-do-not-send=3D"true">Intel XE#3012</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_joiner@basic-force-ultra-=
joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2934" moz-do-not-send=3D"true">Intel XE=
#2934</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_joiner@basic-force-ultra-=
joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2925" moz-do-not-send=3D"true">Intel XE=
#2925</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-ultra-joiner:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_joiner@basic-ultra=
-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2927" moz-do-not-send=3D"true">Intel X=
E#2927</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@atomic-fastset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_panel_fitting@atomic-fast=
set.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2486" moz-do-not-send=3D"true">Intel XE#24=
86</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_cursor@viewport:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-435/igt@kms_plane_cursor@viewport.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_plane_cursor@viewport.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/616" moz-do-not-send=3D"true">Intel XE#616</a>) +1 ot=
her test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-yf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_plane_multiple@til=
ing-yf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE=
#5020</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-=
5@pipe-a:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
5@pipe-b:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763" mo=
z-do-not-send=3D"true">Intel XE#2763</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@basic-brightness:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_pm_backlight@basic-bright=
ness.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Intel XE#87=
0</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_pm_backlight@fade.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Intel XE#870</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send=3D"t=
rue">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_13619/shard-lnl-1/igt@kms_pm_dc@dc5-dpms.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
18" moz-do-not-send=3D"true">Intel XE#718</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@deep-pkgc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_pm_dc@deep-pkgc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/908" moz-do-not-send=3D"true">Intel XE#908</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@i2c:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@kms_pm_rpm@i2c.html" moz-do-n=
ot-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/5099" moz-do-not-send=3D"true">Intel XE#5099</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_pm_rpm@i2c.html" m=
oz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5099" moz-do-not-send=3D"true">Intel XE#5099</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-exceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893" moz-do-not-=
send=3D"true">Intel XE#2893</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cur=
sor-plane-update-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do-not-send=3D"t=
rue">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>) +6 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-full=
y-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489" moz-do=
-not-send=3D"true">Intel XE#1489</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>=
) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_psr@fbc-pr-sprite-plane-o=
noff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">Intel XE#2=
234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
50" moz-do-not-send=3D"true">Intel XE#2850</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5899" moz-do-not-send=3D"true">Intel X=
E#5899</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@kms_psr@fbc-psr2-sprit=
e-plane-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">In=
tel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5899" moz-do-not-send=3D"true">Intel XE#5899</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/929" moz-do-not-send=3D"true">=
Intel XE#929</a>) +13 other tests
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane=
-move.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#=
1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
899" moz-do-not-send=3D"true">Intel XE#5899</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-sprite-plane-move@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@kms_psr@fbc-psr2-sprite-plane=
-move@edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4609" moz-do-not-send=3D"true">Int=
el XE#4609</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5899" moz-do-not-send=3D"true">Intel XE#5899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-cursor-render:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_psr@psr-cursor-render.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5784" moz-do-not-send=3D"true">Intel XE#5784</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899" moz-=
do-not-send=3D"true">Intel XE#5899</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_rotation_crc@primary-rota=
tion-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel =
XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +3 other tests
              skip</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@kms_rotation_crc@prima=
ry-rotation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true"=
>Intel XE#3414</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true=
">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@kms_rotation_crc@prima=
ry-yf-tiled-reflect-x-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127" moz-do-not-send=
=3D"true">Intel XE#1127</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-center.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">Intel =
XE#2413</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_setmode@clone-exclusive-crtc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/IGTPW_13619/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435" moz-do-not-send=3D"true">Intel XE#1435</a>=
) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@kms_tiled_display@basi=
c-test-pattern-with-chamelium.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500" moz-do-not=
-send=3D"true">Intel XE#1500</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tv_load_detect@load-detect:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@kms_tv_load_detect@loa=
d-detect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/330" moz-do-not-send=3D"true">Intel X=
E#330</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@negative-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@kms_vrr@negative-basic.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@sriov_basic@enable-vfs=
-bind-unbind-each-numvfs-all.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091" moz-do-not-=
send=3D"true">Intel XE#1091</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2849" moz-do-not-send=3D"true">Intel XE#2849</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-compute-kernel:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-1/igt@xe_compute@ccs-mode-compute-k=
ernel.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5963" moz-do-not-send=3D"true">Intel XE#=
5963</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_compute@ccs-mode-compute-k=
ernel.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1447" moz-do-not-send=3D"true">Intel XE#=
1447</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute_preempt@compute-preempt:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_compute_preempt@com=
pute-preempt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1280" moz-do-not-send=3D"true">In=
tel XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455" moz-do-not-send=3D"true">Intel XE#455</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eu_stall@invalid-event-report-count:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_eu_stall@invalid-ev=
ent-report-count.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5626" moz-do-not-send=3D"true=
">Intel XE#5626</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">=
Intel XE#4837</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:=
</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@xe_eudebug_online@writ=
es-caching-sram-bb-vram-target-sram.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-=
do-not-send=3D"true">Intel XE#4837</a>) +12 other
              tests skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-4/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-vram-target-sram.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-=
send=3D"true">Intel XE#4837</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-samefd.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=
=3D"true">Intel XE#688</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@xe_exec_basic@multigpu=
-no-exec-basic-defer-bind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-se=
nd=3D"true">Intel XE#1392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-basic-d=
efer-mmap.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-432/igt@xe_exec_bas=
ic@multigpu-no-exec-basic-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz=
-do-not-send=3D"true">Intel XE#1392</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true"=
>Intel XE#2322</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_exec_basic@multigpu-once-b=
indexecqueue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"true">In=
tel XE#1392</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_exec_fault_mode@onc=
e-invalid-userptr-fault.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288" moz-do-not-send=
=3D"true">Intel XE#288</a>) +18 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@xe_exec_system_allocator@once=
-mmap-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=3D"t=
rue">Intel XE#4943</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-exec=
queues-mmap-new-huge:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-mmap-new-huge.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4943" moz-do-not-send=3D"true">Intel XE#4943</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new=
-race-nomemset:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-stride-new-race-nomemset.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4915" moz-do-not-send=3D"true">Intel XE#4915</a>) +235 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@force-load:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_module_load@force-load.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>)=
</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@xe_module_load@force-l=
oad.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378=
</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@xe_module_load@force-load.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/378" moz-do-not-send=3D"true">Intel XE#378</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@reload-no-display:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-432/igt@xe_module_load@reload-no-display.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_13619/shard-dg2-436/igt@xe_module_load@reload-no-d=
isplay.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5087" moz-do-not-send=3D"true">Intel X=
E#5087</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mi-rpc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_oa@mi-rpc.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3573" moz-do-not-send=3D"true">Intel XE#3573</a>) +5 ot=
her tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@mmio-triggered-reports-read:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_oa@mmio-triggered-r=
eports-read.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5103" moz-do-not-send=3D"true">Int=
el XE#5103</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_pat@pat-index-xehpc=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2838" moz-do-not-send=3D"true">Intel XE#2838<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/979" m=
oz-do-not-send=3D"true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_pat@pat-index-xelp.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/977" moz-do-not-send=3D"true">Intel XE#977</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pat@pat-index-xelp.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2245" moz-do-not-send=3D"true">Intel XE#2245</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-2/igt@xe_peer2peer@read.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2427" moz-do-not-send=3D"true">Intel XE#2427</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-435/igt@xe_peer2peer@read@read=
-gpua-vram01-gpub-system-p2p.html" moz-do-not-send=3D"true">FAIL</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173" moz-do-not-=
send=3D"true">Intel XE#1173</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-basic:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-8/igt@xe_pm@d3cold-basic.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do-not-s=
end=3D"true">Intel XE#366</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_pm@d3cold-basic.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-433/igt@xe_pm@s2idle-d3cold-ba=
sic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel =
XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/366" moz-do-not-send=3D"true">Intel XE#366</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@vram-d3cold-threshold:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_pm@vram-d3cold-thre=
shold.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel XE#5=
79</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/579" moz-do-not-send=3D"true">Intel XE#579</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4650" moz-do-not-send=3D"true">Inte=
l XE#4650</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sch=
ed-if-idle.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3970" moz-do-not-send=3D"true">Int=
el XE#3970</a>)</li>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-466/igt@xe_pmu@fn-engine-activ=
ity-sched-if-idle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4650" moz-do-not-send=3D"tru=
e">Intel XE#4650</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@gt-frequency:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-435/igt@xe_pmu@gt-frequency.html" moz-do-not-s=
end=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13619/shard-dg2-432/igt@xe_pmu@gt-frequency.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4819" moz-do-not-send=3D"true">Intel XE#4819</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-pxp-fb:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@xe_pxp@display-pxp-fb.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE#4733</a>) +2 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bi=
nd-post-suspend.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true"=
>Intel XE#4733</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-invalid-query:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_query@multigpu-quer=
y-invalid-query.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">=
Intel XE#944</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-5/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true"=
>Intel XE#944</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true"=
>Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-n=
umvfs:</p>
          <ul>
            <li>shard-dg2-set2: NOTRUN -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-434/igt@xe_sriov_auto_provisio=
ning@selfconfig-reprovision-reduce-numvfs.html" moz-do-not-send=3D"true">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130=
" moz-do-not-send=3D"true">Intel XE#4130</a>) +1 other test
              skip</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130" moz-d=
o-not-send=3D"true">Intel XE#4130</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@intel_hwmon@hwmon-write:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@intel_hwmon@hwmon-write.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4665" moz-do-not-send=3D"true">Intel XE#4665</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-7/igt@intel=
_hwmon@hwmon-write.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-4:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-res=
ume@pipe-a-dp-4.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4912" moz-do-not-send=3D=
"true">Intel XE#4912</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_13619/shard-dg2-433/igt@kms_async_flips@async-flip-suspend-=
resume@pipe-a-dp-4.html" moz-do-not-send=3D"true">PASS</a> +1 other test pa=
ss</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-at=
omic@pipe-c-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear-atomic@pipe-c-edp-1.html" moz-do-not-send=3D"true">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911" moz-do-not=
-send=3D"true">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_async_flips@async-flip-wit=
h-page-flip-events-linear-atomic@pipe-c-edp-1.html" moz-do-not-send=3D"true=
">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-256=
0x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel X=
E#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-4/igt@kms_bw@conne=
cted-linear-tiling-2-displays-2560x1440p.html" moz-do-not-send=3D"true">PAS=
S</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs-cc.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send=3D"true=
">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13619/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-c=
cs-cc.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#2291</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/sha=
rd-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html" moz-do-not-sen=
d=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-inter=
ruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel =
XE#2316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT=
PW_13619/shard-bmg-7/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interrupti=
ble.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" =
moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-ln=
l-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send=3D"tru=
e">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-5/igt@kms_hdr@invalid-hdr.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@kms_hdr@i=
nvalid-hdr.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-4:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-4.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4596" moz-do-not-send=3D"true">Intel XE#4596</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-1/ig=
t@kms_plane_multiple@2x-tiling-4.html" moz-do-not-send=3D"true">PASS</a></l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-dpms:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html" moz-do-not-send=3D"t=
rue">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/718" moz-do-not-send=3D"true">Intel XE#718</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-1/igt@kms_pm_dc@dc=
6-dpms.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-3/igt@kms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-se=
nd=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4459" moz-do-not-send=3D"true">Intel XE#4459</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-7/igt@k=
ms_vrr@cmrr@pipe-a-edp-1.html" moz-do-not-send=3D"true">PASS</a> +1 other t=
est pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:<=
/p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqu=
eue-userptr-rebind.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392" moz-do-not-send=3D"tr=
ue">Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13619/shard-dg2-466/igt@xe_exec_basic@multigpu-once-bindexecqu=
eue-userptr-rebind.html" moz-do-not-send=3D"true">PASS</a> +4 other tests p=
ass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:</p=
>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-1/igt@xe_exec_compute_mode@many-bindexecqueue-userp=
tr-rebind.html" moz-do-not-send=3D"true">FAIL</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-8/igt@xe_exec_compu=
te_mode@many-bindexecqueue-userptr-rebind.html" moz-do-not-send=3D"true">PA=
SS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-hang-rebind:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html" moz=
-do-not-send=3D"true">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3876" moz-do-not-send=3D"true">Intel XE#3876</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/sha=
rd-bmg-2/igt@xe_exec_threads@threads-hang-rebind.html" moz-do-not-send=3D"t=
rue">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-8/igt@xe_exec_threads@threads-mixed-fd-rebind.html"=
 moz-do-not-send=3D"true">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3876" moz-do-not-send=3D"true">Intel XE#3876<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619=
/shard-bmg-5/igt@xe_exec_threads@threads-mixed-fd-rebind.html" moz-do-not-s=
end=3D"true">PASS</a></li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc=
-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send=3D"true">I=
ntel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_13619/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.=
html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Intel XE#=
1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345" moz-do-not-send=3D"true">Intel =
XE#4345</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
          <ul>
            <li>shard-dg2-set2: <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGT_8504/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc=
-ccs.html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1727" moz-do-not-send=3D"true">Inte=
l XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3113" moz-do-not-send=3D"true">Intel XE#3113</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3124" moz-do-not-send=3D"true">I=
ntel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4345" moz-do-not-send=3D"true">Intel XE#4345</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-dg2-464/igt@kms_=
ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html" moz-do-not-send=3D"true">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
727" moz-do-not-send=3D"true">Intel XE#1727</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3113" moz-do-not-send=3D"true">Intel =
XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3124" moz-do-not-send=3D"true">Intel XE#3124</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic-dpms:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html" moz-=
do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-=
6/igt@kms_content_protection@atomic-dpms.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341"=
 moz-do-not-send=3D"true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-8/igt@kms_flip@bo-too-big-interruptible@a-edp1.html=
" moz-do-not-send=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1504" moz-do-not-send=3D"true">Intel XE#1504</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/s=
hard-lnl-5/igt@kms_flip@bo-too-big-interruptible@a-edp1.html" moz-do-not-se=
nd=3D"true">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1504" moz-do-not-send=3D"true">Intel XE#1504</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5737" moz-do-not-send=
=3D"true">Intel XE#5737</a>) +1 other test
              timeout</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-=
shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tr=
ue">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_13619/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn=
-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=
=3D"true">Intel XE#5390</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5390" moz-do-not-send=3D"true">In=
tel XE#5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb=
-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Int=
el XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-=
indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true=
">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primsc=
rn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"t=
rue">Intel XE#2312</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-dra=
w-mmap-wc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=
=3D"true">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_13619/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2=
p-scndscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do=
-not-send=3D"true">Intel XE#2311</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-s=
pr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"tru=
e">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_13619/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-spr-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D=
"true">Intel XE#2313</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:<=
/p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-=
indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Int=
el XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_13619/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-in=
dfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">Intel=
 XE#2312</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bmg-3/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-se=
nd=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel XE#2426</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-bm=
g-1/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=3D"true"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
729" moz-do-not-send=3D"true">Intel XE#1729</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8504/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4917" moz-do-not-send=3D"true">Intel=
 XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/5466" moz-do-not-send=3D"true">Intel XE#5466</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_13619/shard-lnl-2/igt@xe_fault_i=
njection@probe-fail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"true">=
ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
466" moz-do-not-send=3D"true">Intel XE#5466</a>)</li>
          </ul>
        </li>
      </ul>
      <p>{name}: This element is suppressed. This means it is ignored
        when computing<br>
        the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8504 -&gt; IGTPW_13619</li>
        <li>Linux: xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f
          -&gt; xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66</li>
      </ul>
      <p>IGTPW_13619: 13619<br>
        IGT_8504: 8504<br>
        xe-3597-cca87ca63e2f5b8a785dc59c23e526987530b27f:
        cca87ca63e2f5b8a785dc59c23e526987530b27f<br>
        xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66:
        a9008af007ab96e23814e3248475e7a4f4aebe66</p>
    </blockquote>
  </body>
</html>

--------------PHb4JDPubST1eKtiIAFMNOkH--
