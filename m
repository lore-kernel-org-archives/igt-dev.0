Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C4C83F26
	for <igt-dev@archiver.kernel.org>; Fri, 25 Jul 2025 09:57:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAE310E17E;
	Fri, 25 Jul 2025 09:57:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kBBapD2h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9862310E179
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jul 2025 09:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753437431; x=1784973431;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jwU1luUHYJMYg9VqYWLTsP/5+/Isds4fc5dxn2bn3hs=;
 b=kBBapD2hIKaq0bP8UFfJRa6Bd5o9LblwqCkzNpRFEbBfdV8PKIhPBKJx
 JTfdkFGOvNU+LgX4xVQ6n5gkxGTNv065Dn12d7z3+cqoB3gB9HAJyqUsr
 US4toyeDSXkiPwiYOtgum/rrXxlYpcYlGL4eAjIymrfMjfQsv7BHSOnDn
 EdFB7Hq1wpm/8Uy3f+/D15lRDgaQoHz7KDVLia8cwb5Khj2V+bmBUjGek
 pP1i7QBXwrgw2zDibndl4OYkqBAiyLkGDGUk9/M1nuhaduLYGO/vEzepe
 LMhBmT+ke9Jfrku8jf7xYKapODQ3zB77JhhSb+RzLQkkDB2rtgjxuGuH4 A==;
X-CSE-ConnectionGUID: 78/U4zb2SDGidotNP0dxuA==
X-CSE-MsgGUID: cCRk5TwmSKumB+mcX97Dsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="59423143"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="59423143"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:57:10 -0700
X-CSE-ConnectionGUID: 8vNs8x4PQbONSNte4fc9tQ==
X-CSE-MsgGUID: LEyBOZ/NQweqwvdANvO7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="197976602"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2025 02:57:10 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 02:57:09 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 25 Jul 2025 02:57:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 25 Jul 2025 02:57:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGO30SPLvBrAUCX/3a4rYMg90H1u/HOItgcmbH/MwI8kS4ryVLuGDsTZY5gJyqs16iH1ssJQxWkRBTu3h4bad0zOVfYVrKUzOiBL3CaKBI0uT+zqkoVcxQDLkh6RDJ4WwGDhXLQilHmXq2h5e7OAzAgE9pyBFDRkrxwa12ziFGzhqTtZGdHpv9AC3v/fWWlVcGUm5/gyEn8LEpeH0pDkOMfB5g2ZvDbfGPalkpi0DHtiWvD13tZDutXiJYZkx+krjZufmEJeHvYCNpyV38WE4z52jhsjzKp5s8oy2/laKpmPy7uhC9lC7+A1/jBsOt78T2yYwpeRtGwtPW4gyYPctA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QAYZw+6jLJpGtU0qXco+MBNnOD6X8ElWIbwQOPkx28=;
 b=IA+YO4nsX0j/OWGGBp/IQa8bR5PXALkT4RoBCf1Sv6PWwa2d+hVVuP15DH+4dSoN+uYHxqFqB8Xt1bQS22bMdr5XWrog3yyKu9NEJPieSLXYD/wsM1oJILnkyodasyinXG6jsiYGSI1OJz+9/JC1rDf3h26gA9/BfatecFUqEkW/h3C7BLLVGSlkLSGLF3560Rkw9zLYMeY32iU5t2LW0C/gylRgOidQysSHL0n0dfIfmPG4O/wIF00LPfSZZx5fV8i5dEmMwrI4l3dOYXXOvawweI2hlLTPpEqmAqmrWeiueS/xrKmzmvWjvlKUx8d9JZ3SHhq4WtD0FjJu8rhgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5309.namprd11.prod.outlook.com (2603:10b6:5:390::5) by
 DM4PR11MB6190.namprd11.prod.outlook.com (2603:10b6:8:ad::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.29; Fri, 25 Jul 2025 09:56:21 +0000
Received: from DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848]) by DM4PR11MB5309.namprd11.prod.outlook.com
 ([fe80::90cc:99cc:2d53:d848%3]) with mapi id 15.20.8964.023; Fri, 25 Jul 2025
 09:56:21 +0000
Message-ID: <9c2c87fa-191c-45a1-a4b3-26563c97d17e@intel.com>
Date: Fri, 25 Jul 2025 15:26:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 5/5] tests/kms_async_flips: Add DPMS subtest
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <jeevan.b@intel.com>
References: <20250723055353.1137242-1-karthik.b.s@intel.com>
 <20250723055353.1137242-5-karthik.b.s@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20250723055353.1137242-5-karthik.b.s@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0115.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::13) To DM4PR11MB5309.namprd11.prod.outlook.com
 (2603:10b6:5:390::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5309:EE_|DM4PR11MB6190:EE_
X-MS-Office365-Filtering-Correlation-Id: dd48adf8-e3d5-4976-7c3f-08ddcb618152
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXY3Mk9xME9DV0ptblRhYmlrZkhSZjFoRzR0NzVhRkQ0eVN2V3k3dDNISXFk?=
 =?utf-8?B?bm5yYTNzaGE2Q21reDhuM3lUMFgyTlpaT2tOamlUNGcxa0ZUdnR5RXRHWWt2?=
 =?utf-8?B?Qmh1d08ySnhXdUlYUG5OVCtLdVFRQVd6c2ZpTzFUNDhmeTR5NzhOVmVPS3Z5?=
 =?utf-8?B?SGw3cXJHUndYUUJFQXhnRTJ5TmVRVGl3Szc0Tm5YS1RpcThEQ1F1N2o4dHpN?=
 =?utf-8?B?YUJSODRnYTZNQjVVcVBzdk85cWNWWVNBWXM5eDZQYWRJS2R0elpSbE05M0Rk?=
 =?utf-8?B?TW9iSFgrWDNabHhCMG1tNzE2VUVGWWdneFBSM3dPYXhJMHJJMCtoVndXQU1i?=
 =?utf-8?B?OFBXZHl5RkFQVzB4UlFvbnZFN3U4UUFWbXNiT3h0R1RYYk1tbk01QVp2L1B1?=
 =?utf-8?B?YlQydGtkZHZuUjBDUmIycVdvYWJrYVVYTlduNWl1ZEJ0MFpBUnQ5UTM1b2J2?=
 =?utf-8?B?bThBUlBOUWowOXk5MEdXYytBU2dObHZRTnUrellUKzJ0Wm5WdmxacWN5UTk2?=
 =?utf-8?B?L0luMXczMkRtMmRmMmE1TGJoemZldnJwLzNTbjJEYWF2cVoxVDRRakNqNXoy?=
 =?utf-8?B?U1ZkUDN2bWNzbXZoK2Z2eHMxOTV4Vzd0dnMvT21GNG4vYTAvVUJrVi9Wc3h3?=
 =?utf-8?B?VExkWnJmS0MwdnJQTXhrcHZpUjVuUnA1MVppbjlGMXQ3Ykh4NlArR0xOcjJy?=
 =?utf-8?B?SklkV2svSHRaeGhLRk05blJ6bTVDaVBSZzZmNHZMYlY2U25MdVNnN2czMVpF?=
 =?utf-8?B?VW1iMEY1VEZHOG1wTEQ4OHYxT3I2UzJvRjBFVUJpdG5hVmxlTEJ1cTRNRmxO?=
 =?utf-8?B?VnRxdTIvYTl0NjNSVWFlWEFnbVdOYzc2M25CSzl4aW45amd1MVp4NDAzU1Fp?=
 =?utf-8?B?Wmg2L2xuR3dWeURNVVZ1ODdSSWxNblpYbmtzd0JDajM2MmVHTjRxdyt4YWtZ?=
 =?utf-8?B?VDFCVUpnbzB1SmY0Qk1mRXFPWUVSMWtBY3FDNE1MSHRPa3JRd3JYcTlBRmhG?=
 =?utf-8?B?amtmclZSUWZDcU1lWFBhOTZJZXJXZEhmU0ZpNGJxSTlwdWUxcmtKTEMreXor?=
 =?utf-8?B?bHRsNTl0S2JoL3JJSXl1L3hkR3d1NmFvd3l6WHYvMTg3K2pqUDg5MlVTRjBK?=
 =?utf-8?B?R0JNUGV6bUlFWWRXVXdwcE84L2ZDVTljY2hKLzdzWkErZndjY3FXQ3c2TCtC?=
 =?utf-8?B?STVSdHNpdEh0SVRtV1RTT1prT25LZ040VGNuOTZ5SU1vRks0WHZkbWo0Tkdk?=
 =?utf-8?B?ZVFNTG51ZmNjN0xoMkJrRXBsbXhhazJHSS9OV3FVMWhJSWV4WWpDRTlzcXIr?=
 =?utf-8?B?dmJFMVIvd1MzSGFxck9tR2F1TCtXVm1hTiszeFBsZkg1SE9Tc1NLUUNJTlNB?=
 =?utf-8?B?SjA5bGFWNTdVeDZmRGQrcllkaXRsczZoMlpmNXlpQzNBaE5IWHNSV3ZRekM5?=
 =?utf-8?B?ekViNlpLelQ3QXJCMVVUMnNCNkIwRUxvSzJXWjNWaU1zVVNEQW1DRnI5WG1O?=
 =?utf-8?B?OXZ0UGhVNEc5NkdnelZXWDA1ZFpiMCtMUHhkbkRvL0tLc3JVREVCaVoxVnEy?=
 =?utf-8?B?V29JWjd4N21HMzk5SHEzVVA3S3Y5S09rZ0ltOEU1ODhCVFNuMUkyYUJPVXZW?=
 =?utf-8?B?VVpCQzkvRGJZZnkzQTUzaUNESGtPS2RISDFEa1BySkRBL1BOV25lMEV1ZmNR?=
 =?utf-8?B?QTZib01Ld1pMekdFTVBWYmZhcHFoQ3J4dTlwTUJlRnJsdC9qYURrL0FGbWQ0?=
 =?utf-8?B?Q09lSElYbVBWL2tjOGV0em5kK2ZqREFybzdlUXF1bjhkK2Q5ZzNod0VIRHJM?=
 =?utf-8?B?WWVEekpob2VoWExWVUJLMTdJZG4zQUJFbGFnYTF3NkJGTkU4M0tLZGdNb2xL?=
 =?utf-8?B?QUEwYm1UdVp3MzZDclJwMjZ0blorWnVpTmZzTWJ3c2E3ZTl4U28rOWYwemto?=
 =?utf-8?Q?ZNIlEMOfOtQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5309.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTl5M2FXMkhldXB5L1lVa0tZKzJFb0xEU3pNRHNlUFYyWTF2OFczY053M1Vq?=
 =?utf-8?B?VHI5UFA3OEEwcEFkUVJuRDNIUWJIR0t0ZUxwYTlOQ3E1Rk04c2p4Qm5kYjhM?=
 =?utf-8?B?S2p0cE01TEk0aW5jblVNcTFpamRXUFJhSjVwbGdPUmV1UUJ0TDd0YWJ6cEZ4?=
 =?utf-8?B?UEVHV2VnaXJYSHAxTkhqbllia3M2bmVmUFBuZjMxL1J0WFVISmo2U2NJOTM2?=
 =?utf-8?B?S2JnZ3lDbWtvYWJkemVLdktGSkxWYU8vVEttNmlTc0JJTEpGKzlCdkF0bmZD?=
 =?utf-8?B?VC9lYkNJVTIyVUczNXNmOExiZHlvYWpkdHA2RDFBV3FPT0FsMktCVHhsekdV?=
 =?utf-8?B?Qjg3dkwxenZoV2VSREphejg2RXJXUW1reGhpQUoxQ0VyZXc3dDNMSWJzUDlE?=
 =?utf-8?B?aFBtMkFXWjEveEZlOTRFb0cweXpHSDFGS2phaTBobGVrWktGTC9OcWVjbUps?=
 =?utf-8?B?ejkrd09lWXJRVjZNZEptQzErRW5reVI1RENWam5RTmtxODRMdlRTK2pibTRE?=
 =?utf-8?B?Z1hMUFBHOEdxWW5PZ202WWpiOWlWakxpb2dKamR4UExJQUFmQWNvMVJSdVVz?=
 =?utf-8?B?VXZlSEFBSnF0ZFNsSzZ0Yk1UQXkxdTNHY0lUNnkzZXZvSnlrSjBNVjFzZVFx?=
 =?utf-8?B?eFZaeFMwREN1OG9XMC9VNHk2UXpaRWtaLzNpOHJpVkc0MkFwZkRBekFnS0U3?=
 =?utf-8?B?UzY5WVplbEoxMFdvYVRKWTJ1MXVVMXArT0o1RGhiNzlnVWdyR3ZqUVBYYURG?=
 =?utf-8?B?azNKZUhRa05zZ2tYbXFRWFZuay9DcFJ4d2hvekJCcTk4R1EwaUUyN0pyUXA2?=
 =?utf-8?B?Q20vQ1JtNG9wZzdYVDlUTWJsNlh3STR1WFcxUzVBTERpM2JvQ3RZaVNqWDhC?=
 =?utf-8?B?N25MSU5CZEpVbVlicVVEOGNBMU1acU90WXp3N1pBb29RK3kvazlueHV2VVdJ?=
 =?utf-8?B?NGw4UkE0bFIrRWxPcmVzWTJtNHdZOTJwUkovSTRvc25HUTI5Yytia1Erem91?=
 =?utf-8?B?bGRCLytVY0JMWFZxRk95dGo3T2FvZzZBY051ZEkzL3h5UmlyV2hsQUJ0dCtv?=
 =?utf-8?B?MU1Wck5uemJtVVd6YkRvaTZvTmg5VWVWK3NERDJWYkhQYjN3QytiSnhzTmgw?=
 =?utf-8?B?eFltTEt0bDVLL1BJOFJmODVhRDROYTJKWXExNVdjR3FKcHE0ZWNyZlg2aFQ4?=
 =?utf-8?B?QjRXN0h3T1V1UXQ2eVRnVzRockgvUGhlWTBWRUFZei9HVy9sR3BYd2FRMDY2?=
 =?utf-8?B?VTVxOWphTHh3S0ovVEk2YVEwRWhhZy8yT3VIcUszZHRuOHU5ODBSZFJjTjdo?=
 =?utf-8?B?MGUrOWNoK2NGUjBBdjJ4QzBCQ2wxRW9lMU92NDdBQi9PeG94MEw3anQ4V3pl?=
 =?utf-8?B?bHV1bTM4M0ZlcFNtM3NZTVdTNFFrSjMvZEt2SEU4YWZSYUE0d29LNCszYTVC?=
 =?utf-8?B?K0ZOanBYLzRCbC9aTjI2NXZnTTRNazJkWDRnZVExNVE1dmVJQkZaanRheE5U?=
 =?utf-8?B?Z1hJbTRKazdScVNBQTFjbitrWHZQbFhNd2ZMT1dPRmt3eFREN3RSVW1vL01u?=
 =?utf-8?B?Mk9ZZTJLNTl5VWt5THo4aCtYVzl6ckFDWVFqaGFYQXN0ZjVGV1p0OGRTc3dz?=
 =?utf-8?B?M3V5M3NHeGo3QUhTWWFNZUJ1MUpmdzk0dDlKOWRIRlNnNjdCcmR3dDYxNzNP?=
 =?utf-8?B?M1BXUlhsODRlM01FM0FuQzhsNVlGNXdDR3cxRytFcmVFQnZFSStuUjl5OWFJ?=
 =?utf-8?B?U3dFQk5DdUF0ZEpPM3VDRVJ6cXVwT1JidFBiSEFNRys4ZE11a3hqMzZaVksz?=
 =?utf-8?B?bis5Ulo2S0VzSW1rVlFPUVB1MzlLdXZTTWtNdm1qdGtweTVvOEgwQkdPOFlP?=
 =?utf-8?B?Qno1VHI0ajQzMzdSY2x1NURNRWRFSVVjbW00dUtHU2sxTzB4bUVhM1o2SWlG?=
 =?utf-8?B?L3NiYnlkbURwa2JFUWNTMnQwRnVUY3VET2VpaHFZTktKdG1BSnBEK2Uwdlgx?=
 =?utf-8?B?Ti9TZVJXeEZJc2FsODdVbXBldW5sbFpYdWF4a3RENHlyU0x1RGdFSU9Ha0R1?=
 =?utf-8?B?NCtleEloY2RFM0t0TjV4QTFBVG5tK3REM1dzaFd5RXJ5d1hsWDYxWHhML1Bj?=
 =?utf-8?B?NWhYWEtyS2lPamo3RzI5ajFmUUpCWWc4N3dKNUtjVEpWbHpNQjlDalM1bVVa?=
 =?utf-8?Q?/pV6lDvTRjYhK0W+MYLMTd8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dd48adf8-e3d5-4976-7c3f-08ddcb618152
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5309.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:56:21.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yv0u9VW1wVzxw0KTy/n/HKf8QSG6DO3a49TxyCCpwPj0NTxwpGYm/Jy2TXLqJXhpCqD+g62fX0TinQ44vUFJbcwOnM7cl+BmJbS+FYLZNttMD7GSg+PUiLWcaVI/M0p3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6190
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

Hi Karthik,

On 23-07-2025 11:23, Karthik B S wrote:
> Test functionality of async flips with DPMS.
> 
> v2: Update runtime to accomodate for first flip after DPMS (Arun)
> 
> v3: Rebase.
> 
> Signed-off-by: Karthik B S <karthik.b.s@intel.com>

LGTM,
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>> ---
>   tests/kms_async_flips.c | 36 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 1d8ee10a9..8a943fe01 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -90,6 +90,9 @@
>    * SUBTEST: async-flip-hang
>    * Description: Verify the async flip functionality with hang cycle
>    *
> + * SUBTEST: async-flip-dpms
> + * Description: Verify the async flip functionality with dpms cycle
> + *
>    * SUBTEST: overlay-atomic
>    * Description: Verify overlay planes with async flips in atomic API
>    *
> @@ -141,6 +144,7 @@ typedef struct {
>   	bool alternate_sync_async;
>   	bool suspend_resume;
>   	bool hang;
> +	bool dpms;
>   	struct buf_ops *bops;
>   	bool atomic_path;
>   	bool overlay_path;
> @@ -386,6 +390,21 @@ static int perform_flip(data_t *data, int frame, int flags)
>   	return ret;
>   }
>   
> +static void check_dpms(igt_output_t *output)
> +{
> +	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_OFF);
> +	igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
> +
> +	kmstest_set_connector_dpms(output->display->drm_fd,
> +				   output->config.connector,
> +				   DRM_MODE_DPMS_ON);
> +	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_ACTIVE));
> +}
> +
>   static void test_async_flip(data_t *data)
>   {
>   	int ret, frame;
> @@ -395,7 +414,7 @@ static void test_async_flip(data_t *data)
>   	uint64_t ahnd = 0;
>   	int mid_time = RUN_TIME / 2;
>   	float run_time;
> -	bool temp = data->suspend_resume || data->hang;
> +	bool temp = data->suspend_resume || data->hang || data->dpms;
>   
>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>   
> @@ -488,10 +507,15 @@ static void test_async_flip(data_t *data)
>   			break;
>   		}
>   
> +		if (data->dpms && diff.tv_sec == mid_time && temp) {
> +			temp = false;
> +			check_dpms(data->output);
> +		}
> +
>   		frame++;
>   	} while (diff.tv_sec < RUN_TIME);
>   
> -	if (data->suspend_resume)
> +	if (data->suspend_resume || data->dpms)
>   		run_time = RUN_TIME - (1.0 / data->refresh_rate);
>   	else
>   		run_time = RUN_TIME;
> @@ -1206,6 +1230,14 @@ igt_main
>   		data.hang = false;
>   	}
>   
> +	igt_describe("Verify the async flip functionality after dpms cycle");
> +	igt_subtest_with_dynamic("async-flip-dpms") {
> +		test_init_ops(&data);
> +		data.dpms = true;
> +		run_test(&data, test_async_flip);
> +		data.dpms = false;
> +	}
> +
>   	igt_fixture {
>   		for (i = 0; i < NUM_FBS; i++) {
>   			igt_remove_fb(data.drm_fd, &data.bufs[i]);

