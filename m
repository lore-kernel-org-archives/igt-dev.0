Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218D6CCF9EB
	for <igt-dev@archiver.kernel.org>; Mon, 27 Oct 2025 16:14:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE5A10E4EE;
	Mon, 27 Oct 2025 16:14:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NavPRkFm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D481910E4F6
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761581696; x=1793117696;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=F1LnlddYJRPkpuqykhPbXGHlzsWjFdp8bQdwt9XcyWU=;
 b=NavPRkFmQgoNX9Bb4zc791smcl3vVW710tmnzq0q6zsczYEFSAyPpNa4
 L0mlNLOGL20r7VoWT9tV/eoXjLPMZVRYigVB663Ypz8dSFmci9mNEHbYK
 jDlxFVBhu9RLXshE/kIwyXCCTiAJmy3I9/d0S6Y+ecEJ55p6vaxhrLLh2
 X03BdNjK/ilj9SCEslQnC8JIhNTVyHSAbLD7uA0Hhk/e+WSgViiC9Dpjn
 G/gYyBU5JBfjEcCazUJNBPxwRUEfH3kW9YECuqMrmkr3eZ+5Dxig3b6qy
 Sq85uUmu2UYTePczYUg1u+bz5I8/f6kxL46t2qHrWE98oQve/Y3X7AI7g Q==;
X-CSE-ConnectionGUID: 3Rwk5AuXSkW1DxXE5I1YGw==
X-CSE-MsgGUID: d2ysJwhhR7q9f0IQcf8DOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63703250"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="63703250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:14:55 -0700
X-CSE-ConnectionGUID: P4WB1CvIRDSPkbX/pgevow==
X-CSE-MsgGUID: dtKrnyP1Ql6u+GOlcpERtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="190294056"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:14:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:14:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:14:54 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:14:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pv+ObyO8A2dSn+l44VUVtykI5wUu6xBkaLPPd+1W3PtuNi8ttsNOd1N7h2s6ddV5cKBrW7HbvU2P80QgY1fOXV5XEYiYYu5IPbSU8d8M53C1QKYoM6my2vsSEvFR8OXUB/d9BHeRP1qjQFtcQahq0sZw6/MosL5ei4dj3NmjR1ThezhGSPn+rA8Bh1mGDITLJKOAsAoYiqdcoAwQ3JCTMXOgODudrJ23xD65yjUXmji0LXmNNFwHPJx0zvCaU3uPUkSO3pnw+prb6JGuUDFIrvvU1DsBNKJ0GPO2LJuxL4wyMO0r5lHfTke0BLWTpNalcGdB31ZKjhkOx0+QL6r5oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9H3elBAi25sw4zr507CPVkkjm3EZTOsKW4NNwggCBZI=;
 b=mRtYAZ/ecEbcwL0G8LrVBRldaFQkV4sNDCS2A5aRj5cPilOaq5b3B+T6k3SJTy+7IzGeed+qJFnaNKmus4BkyLmEskz48I+MJhxI2PlOfuc6Z816AA6RSl+7lggM5Pu4CF+H7Dy/y0L7C3sycbjQ86uqFb4SQ/pEcTauTRSNWIgH8FFH0JifqiZ5VpyzdyICsBxvhf0O+f/951wIIPdLBBExasfsPMbEWACJgWr8xnY+1UFAnTvr22HsieXfNuiM2Vxi/TUXzE2UdM06rjnerKF1QW6zoRgG3sY41E/p6YmW4+ZBpF0FD3iukLe6vkmcj7DUQfujQiTk4iR1xVCx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.17; Mon, 27 Oct
 2025 16:14:52 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:14:52 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <igt-dev@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 0/3] Multi-tile support for xe_sriov_flr and other MMIO
 improvements
Date: Mon, 27 Oct 2025 17:14:37 +0100
Message-ID: <20251027161440.2906378-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0432.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:81::25) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM6PR11MB4659:EE_
X-MS-Office365-Filtering-Correlation-Id: c4e1a452-61cc-4524-f95b-08de1573f5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlRid25mOXZiUXdXdW80ck1KWTFXUlV1RHl4OGdueHZNcnZyVUdRY3FaTXBo?=
 =?utf-8?B?WmpTV3UzOHBWVEtUY255OWdKY21Cb3VOYlozR0k1cHhoWFZOcUZKV1JNcXZY?=
 =?utf-8?B?b3B2UWtXMmcxL3IzQjA0VlBiQUltVjI4WkNxSUdZWi8weGxvWTI1TzdqeHNv?=
 =?utf-8?B?d1FpQzVLa1ZERUV2TE5wS1BlSU5rdDFOSGt2T0lkTmZISStsdUN5NEQwMzha?=
 =?utf-8?B?aW9QS0JWdmQrcnVidE1ZUlZnd3kvV2p2ZWRrTlUzalEvUnQxVlNQVFF1QnN2?=
 =?utf-8?B?U29wN3VrYnRYYVZnZ0lWNHBRYUlpbk5CdUljc0V5emc1Y0tuNVZJYTFhM1FK?=
 =?utf-8?B?QUI5cEYwYVpQZUxKdVdGUmowYzBBT0d4aDdtOWFtc0V0UFFxU1BFa2hUdmlp?=
 =?utf-8?B?THVNMzFEcExVY0xHQVRJWHZvcHp3UUVVQjlYK1Y1eG9BV056VG9QRXE0K1Nv?=
 =?utf-8?B?T2lHVUphMDBHN0RENXhFV0pPc040ekU2eGk3eXhLeUJRUVRDOUx4U29FSHYz?=
 =?utf-8?B?QjkxNXp5TTZ0Vkd3bndyTndIT1N0S3VBaC9LMjJEVk9EejY1VGRLR091UDBU?=
 =?utf-8?B?WCtSMnRxc3REZ0I5MjBvcjIxZ2laSDNPNEpQNUg2dTY2eFdmZ0lKYkt4VmZ5?=
 =?utf-8?B?TlVTbWhqaFFQQTFwOFVPNXVhUU84RFVueFBvUDVJVURoYWYvdUJEdjhFa3Rw?=
 =?utf-8?B?UFE3WEdEVjlUY0RNeHNCTE1XS1o4ME5BOFV5OFVZRjhJUjZha2NZMmE5TmdO?=
 =?utf-8?B?WjVsSnRkK01jZTdUUkdud29XUmtYSlR5S1NkUHNDL2hWb0pkOHdvSEw4YlJx?=
 =?utf-8?B?aDFUclNOSVhJWTkzWEtndHBOZFRJSWpKVmtnajZUUEtZS2N6Q2RPZm12blNE?=
 =?utf-8?B?cEpSSUU3cmtENE5RZ0xqMUduT3B6VjFRU051K3J1Lyt2bFNMZUdiN0JXdHBW?=
 =?utf-8?B?b21CRVN5bllYb2lEWFphWnFxb0xHM3BSZFF5THBhSGV1L2ZpZnZqU0ZOUHFw?=
 =?utf-8?B?SkpyY28ycXVxdjlWTE9ZczNDNHpIaExoNStlelFPNjVXZytyNkNjTHp0aFBp?=
 =?utf-8?B?c2o5RHljS0hNdzFDT2lDOUtjMEV2cUkyQXAzTzVQOC9ra3BwTEllNkFaOHhF?=
 =?utf-8?B?cmp5TnBBUnRLQzR3Y0J4OXFhelpjTWFlTnMyVmdTOS9nRHlaTS9JMWdHTnVz?=
 =?utf-8?B?T2dvbjRENDk4Vlk3ZVRjS2tCc0gvUVk2WjU5RExUNmFYWm5nUGdKbll5TThS?=
 =?utf-8?B?ZE1PdzJLOVJxUGpiODNpZ2J3eG4wYUllR0dGdzFsV2c0ZmExWjkrWVY0MmR3?=
 =?utf-8?B?aU9kWEpHOThHZVZQY2ZKZG9pUy9zOHBDWmdrQUJOKzdYTVlRRUcyQkR1aFBC?=
 =?utf-8?B?WHl5UHROcVRESE8wM0c4cE9CYitpR05xejB1eENYMmlpbU9zOERyV05VcGVh?=
 =?utf-8?B?LzIyM2JKWkkrYVJycGpRb29OdUptL0RrYjhJWjJ5MktaeCtZOG1yVU00M1FM?=
 =?utf-8?B?bFVuUW8rZzlOa21BdWJjSllPMm4vZFcwQUVpNmFEQktja3pFWW94ek5PZWMr?=
 =?utf-8?B?K01KcklTcmt4SGR0ZW1rTnVTQWFrWXh4R0JoNEFSbXBsdnJOZ3dBZW56Y0Mz?=
 =?utf-8?B?T3NmWGI0cE8zL0did3ptZkpORjRVTC9MTnFqWG5yWWFzU3VHWCtyTGQvZU1w?=
 =?utf-8?B?NFA2K1NnOUN4L2QwYUlIOGZIOVdlMW15QndHSHE1aHA2RGVVYUhyaDJCVUVB?=
 =?utf-8?B?RmEzRmcvUDdOVUZ4ZUxrZzYvdDRYekl4UnRKNHR6Z00vbFlCZHFJVUZCRkhx?=
 =?utf-8?B?U1BNTENoY2FzVEh2VEdPVy9BdUFUaFhrMjE1SWRydXVJUGZublZIRlpkWG4z?=
 =?utf-8?B?c0tRQmZ4Wk9TekVFK3BOKzBYRW1hTW43ZTNkSWQyaVVvM0Z3RVlKL1RzMk5G?=
 =?utf-8?Q?ufta1wTy3IV5CRFufhu5jllXzYr2WKsA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjJ0Um9BMnoxQktHZ09pK294WlNTaDN0T0dHenlUWlJxN2JIK1JjNjV4Wi9a?=
 =?utf-8?B?RUsvQnJLaWRBQlUxZ1RSYkl1ZWpiQ3M4U21lY3kzU0hJa2lnb25BWnhuN1Z2?=
 =?utf-8?B?TU8rYVV4Ti8yazlxUDFpaEZzT3Zid09ZbWRDeURrbjBhbmZuR1BSWFc3NDhz?=
 =?utf-8?B?RE9YK3lwSEFJVC9mcHc2eXlxQVlzOWNhak52SnpoUDk2a0VWYUtwK3Bzc2R1?=
 =?utf-8?B?SlJTNjVsUU9VUysydFNYRkNmazJhWmxhNW9ROUxyR2tWaE41cXJuSTBscUhz?=
 =?utf-8?B?VTJ0OHIwUnVDcjFHNEkxOC8rNGtEY0w0cXVOYmVNbFIveWlRZlNoV0dDRmNN?=
 =?utf-8?B?OThZQTFOSGNrUW9xdWNWcHB6cGRreTkxQUhDV3pMY2xtUmc1bkVUaGY2NE9h?=
 =?utf-8?B?UU96b3VlR2c5aDBjcXZSQ0VGN21MZDJUaUpFZ2Jwa0VhUldtdFhFTjNwY3M0?=
 =?utf-8?B?T0VudlA3aUhNaXhENnNYQlk4K0c5TmE0bEdMZTRFem9ienNOUVc0OEpaaFJk?=
 =?utf-8?B?Rml5MlZmamIvWHMzcnczSWRQdEt3dzl5RklrYU1PZTduamphd3RxdXFwS2My?=
 =?utf-8?B?VnNVUDVKcyt4TW1tSktrNHh0ZHZXWG55K2h6ajBUMU9sd1NJQXZ2eHNnV29T?=
 =?utf-8?B?WU14NHV3a2M0T0RxdEJDd1BSNExEMFpqcVBoTXhKamJPM3BaZmwxeTF2aHZF?=
 =?utf-8?B?M3RhNyt0SEFTVHNaZ2pMSmdKbzliTk93eFRSQnV3UFo4UVNLend1V1JNZXpK?=
 =?utf-8?B?RWY1bTFZSUd5dXltYkxDeDR4eGNvOXVBdEd2RkNpazdib1ZrQTNsRmRydm1M?=
 =?utf-8?B?QXozU3dUMW9jdVVPdUNpTDR6YmE0MEZ1dDE5NU5ZMlFLUDRkeXFqNGQweEZD?=
 =?utf-8?B?TXNUY3VYcmUxVFJUYkxlU3BFSHdlZW1kZGYwRlBUQlNQTllVeW5kRGNEOEJw?=
 =?utf-8?B?ZWdJZWticE9JK09OQmhDOCtWbzh2WG9OdXg1V2hiV3QweG1FenZnR084NHBX?=
 =?utf-8?B?NWQ2QXNvbi9qNXc1UTZjbUVoMno1TlBWRS83VlJZYWZLazZXcDZlbFo0bSt0?=
 =?utf-8?B?Q0lSL3d0cEhqUXp6c3RiRXloVjNwOHMrZTRxeEtuZFJOTWgxQU1rTVpvazht?=
 =?utf-8?B?bk1CUjRtK0pmUW8yRnFSdEtXcHlHMUdZRVFUSXZETHgvR1puaWQwZ2tXNHVw?=
 =?utf-8?B?bTdkRUV6N2dJWGtsNUlGbDFZWDNxTXlqVE5hTldZUGFnNkhSMTlsYVBNT2NM?=
 =?utf-8?B?MnpEcWlDbzVyRHpRVUpHWjBwelVZVmI1a3NEVys1WHRybHIrOThqNTh1RG92?=
 =?utf-8?B?cE1EdGtIUW8vY1ZNQURBR0E0RVRsaW0zNlM1SS9tajkvdzRBUVBrY3IxT1lM?=
 =?utf-8?B?U01GSVFvQUtCT0d6YUlLY3JHWkV1UDZua1gzakc4aXp2dHNraGZKWFVKYUZR?=
 =?utf-8?B?bnJBd0pyWkI3S2pMK2txQXIycU1rQTJwK2w0c2N4QnMyRUgvN3JnWkZ4Wjll?=
 =?utf-8?B?YmsvTis3QXFVaWFzQis4TFFLTHVLUGV6MW40c0ZFeUlweC9HVUY3RFU5UVpY?=
 =?utf-8?B?eElId2ViYThIbjZZZ1IxSWdYTmJ3bVF1UG5SVjV4YXlUa2dMMmFWMGZMQytP?=
 =?utf-8?B?KzVTcTQyVVRjUENQVXJxZUlsLytCdnY0TTZqWks5U2REblF5ZDBXVGdPUEZH?=
 =?utf-8?B?R1ZrVDczNjY2cDlBTVdkYlZGZHpFRms4a3A1YkliWXlEdDVaU0YrWWpJU2cx?=
 =?utf-8?B?RUx2cjFwVlRkd1BOd2dmb3AzY2NwSVdGaDh2eHNiMVZwbmVJVThDODF2ZHV3?=
 =?utf-8?B?cHI3OG1GUEcvdGt6TkpuOTEzL2ZyOVNPaFZ5dUJoY2tRbUNKcnVjZnZkbDRD?=
 =?utf-8?B?WHZONU5hUkdWdGN3ekhNZ1cvUHNsZS81WGRRTXA5cVc3L3FveDVLdCtpL2M0?=
 =?utf-8?B?d2Y0M3B5Um4vN3R5NnZLOEJaRDEwSmMrMVV5Q0dqSjVpVE9WVWFvQ1I0SzQw?=
 =?utf-8?B?QkQ1L0F6WFZSMlhPd20vWE1NYzV6ODdEWHVoak1JeHRvTnVCOHp5eG1jNjNr?=
 =?utf-8?B?VXlXSTdzdnd3cmhvZGJROGNoejEzS2J1MWsyQkVMNUJJK2NQK1ViSXNTV0RW?=
 =?utf-8?B?blBncW9LMW83dTVlODNwN2lkdk9ZdmR4eXRQK2FJYzlHeXdBZ09BcFJ3WlJG?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c4e1a452-61cc-4524-f95b-08de1573f5b2
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:52.3131 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YM44lUVF+iwuOUluP5EcCu3k3Dfl2wWBG6Mu8aUHkMD/9GmLai2Jl9AeNrugJtrgoiUtOr9bxMF2q56bs0pwc7VicC89waLDuiRbsZUGHR4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

This series extends SR-IOV VF FLR tests to properly handle multi-tile Xe
devices and refactors related MMIO access layers for tile-level awareness

Piotr Piórkowski (3):
  lib/xe_mmio: Introduce tile-level XE MMIO access helpers
  lib/xe_mmio: Add init flag and helper to check initialization
  tests/xe_sriov_flr: extend VF FLR test for multi-tile Xe devices

 lib/xe/xe_mmio.c               | 108 +++++--
 lib/xe/xe_mmio.h               |  18 +-
 lib/xe/xe_query.c              |  45 +++
 lib/xe/xe_query.h              |   6 +
 lib/xe/xe_sriov_provisioning.c |   6 +-
 lib/xe/xe_sriov_provisioning.h |   2 +-
 tests/intel/xe_sriov_flr.c     | 558 ++++++++++++++++++---------------
 7 files changed, 463 insertions(+), 280 deletions(-)

-- 
2.34.1

