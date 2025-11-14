Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06BFCE7B1F
	for <igt-dev@archiver.kernel.org>; Fri, 14 Nov 2025 14:56:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1810EA9C;
	Fri, 14 Nov 2025 14:56:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NDXKKmau";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF6510EAA3;
 Fri, 14 Nov 2025 14:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763132214; x=1794668214;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=jxOEx+3g4z2OX/rnweyLF17+ouoSxrwxfctIlA/w3X0=;
 b=NDXKKmau4fdGjiQG+gIaWDhD3L85R08y8gIfrAUxyaGRhCSjQak7EZYs
 1yT4V2UJ/sML/dTTtf+bnjXVCVGRUbnHZsu5ou+hc21phIm5Pm5Ga6Hex
 Enij89W77WzcyyiONjFPY5zBqP15FjFs5FOAujfshftcogVfUA3SXsNFJ
 tOVWRweh1Nhd+af7f5dV8nTPfe4cbwQqRNMDKaHUwWOVwZtYazqDTnYYA
 cBR4Fdg4D3BbYVs1OanIiz24EPnvjvNVHFNB3KAAoP+ko10K597QadmcG
 bnrRKowuxZ1HRwSwQLSTvSVtJZlLtflYH01HcE2OmPf8bH3d9Vz5dnp0X A==;
X-CSE-ConnectionGUID: J9N7M1V7Q96f4+ZTDOy1Tg==
X-CSE-MsgGUID: y1vv9qOBQYGuQkWw9LfWQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="76327049"
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="76327049"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:56:54 -0800
X-CSE-ConnectionGUID: gntBND5gRKu5FwfYVcgSHg==
X-CSE-MsgGUID: ngIl3ebOTkucX53NxFCyqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,305,1754982000"; d="scan'208";a="189440564"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 06:56:53 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:56:53 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 06:56:53 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 06:56:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KyII5PvFAYlAT8OiOpLnJvAc7l1KlCcyK6EXZ4cCWMo1XB8vdhfR06kT/WxYd3RqwtCnVp2SZe5+9FRS1dGfI4ZGfpQhaDatHlCw3aWVOJL4SrzNI/ETRuPWFgvGc3DWUIbAgLLJRWp5jz5oIbWxooG9Nq7pFYlmtFc/abquwMksmR+0qHO9EkfAuRqquYTe59yS7ICNy5wdhSao8/Wy2M4s7qFMNOmtES7o6bzbQyJQPbuUiNmO2BPx8wExe8yUhs3mePn6MJFF5C7f5jaP4vWQu5zI6QLme63qkUAck0E10KjuCoBXdyCHh6MdPZv6PVTymdJwc+FIgcEDP44haw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZdHByxSnaD5qnNnG5cKwKoIwhFPH86mwjN5uSr2u5k=;
 b=mHwRVuVTM296N78itfF0GLHXfg1uRmqK/Aw6iyAaAApXidfnPqnO86GhcwL6WuCslZzaRFsINLkQIOlceZ4Iy6arjwHrNepOJNGaXW3o5TLOYxua/GAox315YMVxFMDLm8dIMuEWlrgW7hwI/fPcclQSBoktqSR7HdGfNTaMqlqJQ5OWo6rSPHyG76FK1OBDnrL8tf4XaxeXUO2Iy0+9IpbdZT8L8QSBwIykx8bHeyis5JdhUel0zM63GWTxeZqfsBPixo8HoKEYCPyaAvnbmN1WjugqFuSImf1TI3F4zLxJyrWUDHiQ7eebM0dDveeP0AwoX1D7VndX0PS/hgeSFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by CO1PR11MB5060.namprd11.prod.outlook.com (2603:10b6:303:93::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 14:56:50 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.018; Fri, 14 Nov 2025
 14:56:50 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176186038232.2568.380549967889151370@10055242dc62>
References: <20251029-rename-igt_pipe-dot-enabled-to-valid-v1-1-2aea1e009732@intel.com>
 <176186038232.2568.380549967889151370@10055242dc62>
Subject: Re: =?utf-8?b?4pyX?= i915.CI.Full: failure for igt_kms: Rename
 igt_pipe member enabled to valid
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <igt-dev@lists.freedesktop.org>
To: <I915-ci-infra@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Fri, 14 Nov 2025 11:56:21 -0300
Message-ID: <176313218179.3698.1415632116141477214@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|CO1PR11MB5060:EE_
X-MS-Office365-Filtering-Correlation-Id: 074e6a1e-8279-4cce-bdda-08de238e0a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y25POVU3M0t5Rlh0N0g2VkpJUW0vS014V1FHd3FhZng1L0gwZHdLZWxoZzF4?=
 =?utf-8?B?WGdOUlFUR2dJMDhsY2U4Wis1OFdTM2pqTmJXT0ZCMkg0MUFyaGJmVnJiN3Zx?=
 =?utf-8?B?ZDgySUhhUlFrQTZTcFg0K3dOMlMzWno0Qkl3U1Z4dWVxeXNmZzlSZy8weE82?=
 =?utf-8?B?YXlaTHAzU3BKeFZzS3p2ZVZKd20vbXhQaGx3UmVxZEZOUVV5cVdWc3JvRE9X?=
 =?utf-8?B?c3I3MWRXL0pySHF5SVJVbmp4SmlzdUZIRnBpWnUvSllkQ0duVjRWdW04QkdO?=
 =?utf-8?B?Z3dDdzUxNVc3RmVYenRFTnBodmxLRmNzdGlTcVh6enVMM2todHVuUDBlRnFF?=
 =?utf-8?B?cHAzRjA1SmV1bnZmSUVnVUJhcVZYMGFNT29ia2hWZnpvT2ZXR2JpcVdLVC94?=
 =?utf-8?B?RHE2N1hTWVFDWU5TVEtKODUySmdlNnFpYVN6ODJ4SklKcE5aTFNOMG94aHh4?=
 =?utf-8?B?amZLZm14cG5rYUNlSUNYRndqQlZWejZPdlRmb0M4cjB4bUxYRkNTRnpwdnFo?=
 =?utf-8?B?bFBkQTlMeE5DSTNnalAzSjJaTVQ3bUhkNFlZZDNNRm80ZmRsS0lyZlFFNFBW?=
 =?utf-8?B?WEluSEFzNlpia000MnVMdnRRcFlhZVpkYlp2bzFlRHRxcTZJdDBzOVlYMUts?=
 =?utf-8?B?OTNreFRGVUhhOXMvM3pwY3JBUEV2RUs5dUxKRmlxalNuS3lJanQxeHhCYzZG?=
 =?utf-8?B?aHhGSENNUFplWDAvM2I4aS9EZElBWnRJMFFDc1ZiZDU5a2ZPM1NJckxhL2kw?=
 =?utf-8?B?aXhVWmkweHlxUENYcnBRNW8wUWZQNklVaksraGl5Q0EyWHQvTjY5ZXJUNnFn?=
 =?utf-8?B?R0kxSHFvanRTTmpVVDRXTGtKcjlkR1NabVBta0NWV3pDbmZ6UlBFVDBSMFJP?=
 =?utf-8?B?c3RLdzlFWnRHZlRmT2kzWWYrZFA2VXFaVTVRNHFDKzRISGlDT2k2T1VkRDVz?=
 =?utf-8?B?VnBzZ3owWkxhMGdYLzdxME56WW1xZTRBZzNkYzZ1UHUyQjJZWFBiR3cxS05Q?=
 =?utf-8?B?MnNjUm4xUFdEQkQ2dTdPSUN5aTlJeEdadjJoc2hhaXkwMFJRc2RnMXVwd0Zk?=
 =?utf-8?B?ckFoUlNBTVg3empVR2pia1dlZ2lCZG5hZVF2ZGV1VnpqVzUxN0dNV3pHU0F4?=
 =?utf-8?B?UXU3YUdyZVlsbFVBclFMTHpLOE5VSDROVUwyRTVPQW8zelp0cUxPVzFyWjFw?=
 =?utf-8?B?MlFwT2hEYk9mNktsREhaaGQwVmd4YWJqZ3F6QjBVdndla1Q3ZHFaRDgwUEpE?=
 =?utf-8?B?cjZKSWZPMXZ1VG1WdUNkSExKSmVDai9jTllGQWxDQytEeEg5cHE3V2dEY3FN?=
 =?utf-8?B?MkNXbnJGUkdsdlRLc21pRnc5cE1ZbEY3aGF2TDkybmpOcUJXVVY0TklqSTB3?=
 =?utf-8?B?MWZBd0M4L3lKV0ovYmJ5VGwzblIvdXhPcmV2amNGalFpWTB1WkYxOWJFRCsx?=
 =?utf-8?B?YWczakhZVGtLYjVNclJWT3dESDhXK2Y5VHRid2dFR3pnNWI5L0dUL0o3ZHVH?=
 =?utf-8?B?Y1FMOUpnZ3dLOWN6bGFpVmZaM1prMmR0QmlKY0R4MEtYbnFKUFZsZjZzUnBv?=
 =?utf-8?B?MVpYbFJRd3lmNVBFTENFdVh3bzNzTzgxTkJsQzdVTncydkVYVnMzcFNXSnZt?=
 =?utf-8?B?NHQvUEt4dm9wQ3VEcVVzTWFkV1FWQVJ4UVd5K0dJZS9WcXBVZGtvSTJuYjJ1?=
 =?utf-8?B?a0NTMTBLRkxyRkw5NW1KMFBrZEFDMGtIeTdXMkhqdFhNbmIvQktwNzdzWmFE?=
 =?utf-8?B?czZHSHRFVy9tSHNqQ1B2TWN4R1hNUmttNlk3TmZ2N0luTW9JYVM4blNBWG9G?=
 =?utf-8?B?bXEvdWZ1NERNelNMLzFFbDRXQ1g3aFFkWkg3K3kvRmMwMEtoNUVhRXVxSVNJ?=
 =?utf-8?B?U2ZtalE3UWNmcWZRNnlMQ3RNb0dTNG5OWlRTeCt6b0tOb0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEFCUG1TS2h0V1I2TmVVWUlSNzFFOFh2NnVJd2lMRmc0NU5QOVlPMG40TFNQ?=
 =?utf-8?B?bWZDVlp5Yms3UUczYmJ1TU5yOXBmdithTnVEWTh6YjNsSDBBcGhtQncxVVNV?=
 =?utf-8?B?RU1uMkZhWWFlNnFCa1NoUzdTRkIvV0JKc2RoNFhiaDBWc0NUdVVaTEt1bStj?=
 =?utf-8?B?WTNWR2gwNnI2WkV4Zzd6OXRZSWxJa3BlcEpCeFhhTXk1V0svbTZXZHZWTm5v?=
 =?utf-8?B?NTRlNVhUWkQyMkNjYWZjVVVYU3RnMGNsM0dPamx5MHFHdGZNMi9pQ3JGSE5W?=
 =?utf-8?B?TjNjUjVQUmVOeGxUZFlvWmZSemNvSWZsTHdBaVdsaVAvejhLYnNCQit4TWJX?=
 =?utf-8?B?bDlHQlNsczdJdjNPcUtnclVQWlplR3NCMFpUN3NpSW5weXVrb0RGNnJCN0Jm?=
 =?utf-8?B?VUhBWjF5bHBESFFEb250aXdxV3YrS2hPQ3dtOUQydW1Qb2s3OCt4YXhpUkE5?=
 =?utf-8?B?ZW5CRERMS1piYUxWMFBGSTMxTk5pNUl2RXNncW5oU2k2V2g1RFliaGpJckRE?=
 =?utf-8?B?em5wa0Rzb29WOTREMnhuSE01T0Zsa051R3YyRFN5NXVMdDllTmd4dUljR0pY?=
 =?utf-8?B?YXBwSHpudTFRT3RneDRUVGtmVC85SFlxNjVzcnFCeUVwZzRMVjBRQUQxS1Nv?=
 =?utf-8?B?M0NFdEhDV1BDQ0dhWnAxbnpKRFpJaTVBMzJCNmNuOXdTWG5WUENic0p0ekVI?=
 =?utf-8?B?U2lZUGs3cDJjNkJPZ00vU1JJbmxUMFFWWkpjemVkVnRaSHlMRDhud3dsaFJr?=
 =?utf-8?B?b1J6S0NDdGVxL05mRDhVUU9vb2wvSHVqSFk2NkJZVWJPd2RBMFV2dWV5ckFP?=
 =?utf-8?B?bTlrZFFqQ0lhS2FkNDk3UnBhT3o5dXhWNENQR2wyMG5HeWRFaDEralQ0MENJ?=
 =?utf-8?B?MWUvelI4WnphTDQ0MXYzZE1HQ2pROXpTcVNCTnIrUnc3bFk1M1RPM2ZCejRv?=
 =?utf-8?B?QkVSK0RCYTltckpUb1llaCtUWXhhNmkxUVVldUdFM2lrQWtocDRTZXF3UFow?=
 =?utf-8?B?NmovU01QL3VDdk5SSU9NMkpHZHduczd5ZVIzTnphWVQ3Q0drZnNlaDJEayt4?=
 =?utf-8?B?ZU9EeklTMnZ4b01hSUMxRVZIcHhBL3VwTUdGSGExZExZNlVDRG9WdlVqWVNo?=
 =?utf-8?B?cnRCSDVyV2pYOTNyaGtZOUdMV1gyQmJpMnJoOElvTUE2K3RCN09QdlY3cUxE?=
 =?utf-8?B?R2lTRDRMTVFnUXQ5RnY0akp4Qy9EZDR0YTJGcU1aSzEvUEJCKy9wUEVib0tk?=
 =?utf-8?B?Wldwa3dLbU1DVXV6ZzBkTyszcVVwSVc4c2NhUXdmY1d4d3hmZmFVbFpiL1Fw?=
 =?utf-8?B?MEtaenVnbm9lZVArYSsyZVg2OTdEZ1B5SlZqNkRhbWRwVHZDM3dTTGo5ZXpN?=
 =?utf-8?B?dkV3Q1A4dGZQd0NINVRpRU5HYXZ0aUNrYTV4N3hxLzJVVGp5RHM1RFI3TlpY?=
 =?utf-8?B?WW14c0gyeVNiMEVmUEVzUnk1ck1kazhBd2FMZnFGVVh0cHhkN0FqV3BoeUpM?=
 =?utf-8?B?UlN3bDVhRHB1b1Y4ZmZ1V2ROVXNIb3NTNXV2cC9QTTZQaE9iQkxMLzdXV0xF?=
 =?utf-8?B?VXhYN01CRDd5TEhKUTdGNFFIdlROQStycnhPR2RyODErZEQzZFovbTNKb2FY?=
 =?utf-8?B?ZHJFRk9tdXRiVDNIaUpkTk9iNFZBTkZlb3V6U0NPNTIzQUIyWE5CMm1zY09K?=
 =?utf-8?B?ZlZ3Smdnc1NzUDNKTGphWTlMSm5NQkhQYWd0dytsUTVUU0VLTkdXMnZxQklI?=
 =?utf-8?B?b2w2RVY3d3BzeWw2TE9SNEkydUh1Q212ZjkzV3dpNlhlRnlhUnllbDlJMmEr?=
 =?utf-8?B?QWFNcCtyV09YTkxBcUp2ZWNMVVRPL0g1czVzMThaTzlySUdwL0RRdGZMRUcy?=
 =?utf-8?B?Y1BXY2w5Nmg5Q2VrWjA2UVBXMm1rK2FRYXA3aXpSdWtmRGl2SHdlNCsvZktE?=
 =?utf-8?B?TlgyZWo5NzRlZ0NwVmpXSjc3clJKbkNjNHVsYjRPaXpOSy81eE1JSTZBaEhT?=
 =?utf-8?B?NW5xZExKcG1jR0NrWEhOQ0k2cTMwQy9BYVhsWEtvOG9LajFCTUw1VXJzcHF3?=
 =?utf-8?B?Zk5MbENUbnlSbVpMT21iOEkxOHJlMExXQUFjWkVYTWdzUlo1ZHJTKzlUUUEy?=
 =?utf-8?B?Zll5VWRmK1NGRllGc1F2UXVKdFNsd0NGVFk4cDk4dkNUYWNuZVJkcWJWMmsv?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 074e6a1e-8279-4cce-bdda-08de238e0a6a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 14:56:50.2767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nUB5haD87cq42H9R9/jtzw/i+IMdIRAUKneqo25G9Aiq15xC3ZVYBCN71KjYZ9o7hIeeSZc6tEaO6N++yz/wxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
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

Quoting Patchwork (2025-10-30 18:39:42-03:00)
>=3D=3D Series Details =3D=3D
>
>Series: igt_kms: Rename igt_pipe member enabled to valid
>URL   : https://patchwork.freedesktop.org/series/156749/
>State : failure
>
>=3D=3D Summary =3D=3D
>
>CI Bug Log - changes from IGT_8603_full -> IGTPW_13964_full
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
>
>Summary
>-------
>
>  **FAILURE**
>
>  Serious unknown changes coming with IGTPW_13964_full absolutely need to =
be
>  verified manually.
> =20
>  If you think the reported changes have nothing to do with the changes
>  introduced in IGTPW_13964_full, please notify your bug team (I915-ci-inf=
ra@lists.freedesktop.org) to allow them
>  to document this new failure mode, which will reduce false positives in =
CI.
>
>  External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/index=
.html
>
>Participating hosts (11 -> 11)
>------------------------------
>
>  No changes in participating hosts
>
>Possible new issues
>-------------------
>
>  Here are the unknown changes that may have been introduced in IGTPW_1396=
4_full:
>
>### IGT changes ###
>
>#### Possible regressions ####
>
>  * igt@kms_cursor_crc:
>    - shard-mtlp:         NOTRUN -> [INCOMPLETE][1]
>   [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-mtlp-5/=
igt@kms_cursor_crc.html
>
>  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>    - shard-dg2-9:        [PASS][2] -> [FAIL][3]
>   [2]: https://intel-gfx-ci.01.org/tree/drm-tip/IGT_8603/shard-dg2-9/igt@=
kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
>   [3]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_13964/shard-dg2-9/i=
gt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

This patch is a non-functional refactor that renames a struct member.
The failures above are unrelated.

--
Gustavo Sousa
