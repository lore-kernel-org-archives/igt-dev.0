Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE27E77194
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jan 2025 04:15:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEC1B10E1DD;
	Thu,  2 Jan 2025 04:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="anJbbmJ9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE1B910E071;
 Mon, 23 Dec 2024 12:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734957620; x=1766493620;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=BijWkNy9YJ2FCLA5J0n9E/iTVjN5NWWFQDErgWL229k=;
 b=anJbbmJ9kkl/dJFTYY2c7Y5ZqeSQ1zSxoq+aNEu7UX6tDCcj2NHv/K8i
 cKMQ0vK5BNRooMobAq1DNdH+J6LucIBKORd1W+E8IFi/T9stKXtPISnlW
 5Jguttus8iB80PJ1A5q21Q6LoJ3BonWlnAXbVpK3tc8CPEzHsgs5u6OTN
 8mqzY/TnjZozHwDDDOZwrYTi5uu/Dv4bnsJnDUxc/pPRrMjY4gP1Bs9GH
 FgOGmlidkpVQba8g784LLZLb7BoQMg6ecxnLJRLJ0GaJxsq/p8SaL1mnE
 Y6ndLbpQ/kPaLf+McWArHSHB4bft48K9XLQoPe+cdrF6C5g5duiEAWn1+ Q==;
X-CSE-ConnectionGUID: Fve2mMLkQ4Cv3xAhpykfpg==
X-CSE-MsgGUID: lUwZT7ACRI+nrPBQmHjppA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="57885661"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="57885661"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 04:40:19 -0800
X-CSE-ConnectionGUID: sZi3aGrnTYeAv0h63IvzyA==
X-CSE-MsgGUID: yYLSUuY0TL6tMRm1M7SYOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; d="scan'208";a="99716415"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 04:40:19 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 04:40:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 04:40:18 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 04:40:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lq+tHhK35WF2u8NfsTaEoKGfDGy9z0xcLpjLbkEF/dbhXCjvRImSI+XVLn9baKGI2EdxkS6JlgtiV/scYoKP1LM0cT0oT6VphjX7qRoFqFtz9f0tokAUIuKNk3CPV/6quxBNx/MiKIOPNGArPnb8w1BnWZoPuU6zvllG5/FCAKFUMmyw8ksVZ1Y6npanHCJ85tKFORfkplSyj+j/SrVcPlFk1X9jJbzaV7zl5hNu1EhdwXvnFiFRLlr8W4zW2rR/KrruWUCOAFpjKznPIfCTRzqCv0tXlzJFWmXVIHzsj37aNBrb+1jlEJQCMWr7U0R96fnhnJKzOs7tjMzf9ZJilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BijWkNy9YJ2FCLA5J0n9E/iTVjN5NWWFQDErgWL229k=;
 b=sZmyme93623awHKEVUXRq0va7F5KmLy9tTtK2yJgIG97BLaD8t54Maozils8km5ue2+72nZYVTq94oYUmmOhH6fFw7YD74TkbIxvqgREuZs8V+rW5CJRGV513qoMDx8GD+XZMBjPxI/UdDnLSYbFHIaH8ilkUPJ4dQ5oUT+7TN2inEgbMbo5OEzTnY5E0pCTGwK3hzRKTYVIFXd3OSwa7zXLyZ0cZESx1Kq3L0BydRY+XUVjpOo+NbXIwgSJa+K2PupIZTFVtq27B8CY/+vtPbYQMHJcT04c9gX5MKOO69g44GObbYXQ0LBCbp5z316ZDNPoixOAT7dSGkqeqS/CPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5491.namprd11.prod.outlook.com (2603:10b6:610:d6::19)
 by MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Mon, 23 Dec
 2024 12:39:58 +0000
Received: from CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a]) by CH0PR11MB5491.namprd11.prod.outlook.com
 ([fe80::fc35:d6ce:8908:ef2a%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 12:39:58 +0000
From: "Ravali, JupallyX" <jupallyx.ravali@intel.com>
To: "i915-ci-infra@lists.freedesktop.org"
 <i915-ci-infra@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMvaW50ZWwv?=
 =?utf-8?B?Z2VtX2V4ZWNfYmFsYW5jZXI6IERlY3JlYXNlIGV4cGVjdGVkIGxvYWQgdmFs?=
 =?utf-8?Q?ue_(rev4)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9pbnRlbC9nZW1f?=
 =?utf-8?B?ZXhlY19iYWxhbmNlcjogRGVjcmVhc2UgZXhwZWN0ZWQgbG9hZCB2YWx1ZSAo?=
 =?utf-8?Q?rev4)?=
Thread-Index: AQHbUsz83uGsvDiu90q13r1PPKqhQbLzyhZQ
Date: Mon, 23 Dec 2024 12:39:58 +0000
Message-ID: <CH0PR11MB54911F50F957E525FB468857EF022@CH0PR11MB5491.namprd11.prod.outlook.com>
References: <fjysvvdi7wbyamul3gxnaitsbnsbme27ikteqelhk6ukih75vs@cynz3yfs5gmx>
 <173454331175.124020.12529213239565895722@b555e5b46a47>
 <s6pbr7flish45pwtysim7kwqyfmexnu3o3qbduqikzuai3cmtd@bs7nvrdqmg3d>
In-Reply-To: <s6pbr7flish45pwtysim7kwqyfmexnu3o3qbduqikzuai3cmtd@bs7nvrdqmg3d>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5491:EE_|MW4PR11MB6837:EE_
x-ms-office365-filtering-correlation-id: 497e80e2-3e82-4165-5bca-08dd234ee918
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?V3N0MzBrNi9CWmZ3b2ZQeUIwb0lNYlRoQVhPQmZaNUV4L2JTY1I1UGJ6eG5N?=
 =?utf-8?B?dnRSL3U3OU94akpXUUlZVkJhaG83OUMrZGdpdWJvUkZRbGlwb0JiL21nL3pv?=
 =?utf-8?B?MVJHWjlJRWVha1Q4d21SWEpmN0RKenJzWG1KL2V1TTJMQzZvTm13bTR5Mk5P?=
 =?utf-8?B?QVZkQ0dlZFNpc09VVmg2RUJIOHlsQmpuSm04S3Z5L3M2RTU1NVUrL0hYT2tC?=
 =?utf-8?B?cXlJU0dTQ2FhQzVuVUVIbnpSTXpyOGVRTGl1ZVE1aks2akt0OHlwU0gwQkVw?=
 =?utf-8?B?WU8zSDNEcXozSWJSNXFDWkJlZ3d3WFJyNkVPeDdpNkhNaHlXQjlGR2l6Vncv?=
 =?utf-8?B?eGM0S1Q2NXlQZ1BreUhOcndZZUd3enhNUHlNbEp4SnBZajdqSUdzS0JnZ3ZT?=
 =?utf-8?B?eFBHNHdWOUtnTnFjdUhnVENTYTVmVjM2V1BYSGVHem1NRUdGNGJtQjdVdEY4?=
 =?utf-8?B?OGswVk90NzJQM0I5eTZTVDlIblF0Z2pMMEtTUC9YZGtnN3Q2YWVUL3ZVNFc2?=
 =?utf-8?B?MER0cXNRYUFzVkV3bk1wbndRbDlUaXpMN3dlTmt0b1NWWG9PUnFoWXBuT3NZ?=
 =?utf-8?B?M3V6V1BYRzRKNXhkb3AvZkIrbjh4Q1NoRVFtbEorK1dKQnhCdWtPM2htR2hJ?=
 =?utf-8?B?OWhNd2JET2ZOVmJJMTVnTHdoKzZsd0RlT1F6aEtYdnZ3WnVHMTJFV3p2SVFO?=
 =?utf-8?B?czN4aFdVSDhwMThEQ21kS0d1Q3AxWnRiOHZEbjFFc1hXNS90ME5kYktKQnAx?=
 =?utf-8?B?dEs2WG5YcFBMVWFZZmJUYk95OTB3ZjZVVTFvUStERnpVbE5DL1NYZUxkdHRS?=
 =?utf-8?B?UUtpY2IyK3czdkJQUmg3YkFqRXZHaktIMTM5eS9YbXZhT0FPbiswdTdreEpN?=
 =?utf-8?B?RUtVb3JvOXN5T0RRRWVaQ24vTGVlTTFBWi9CbnZ1eThGdlpPT0pKS1gxR0kv?=
 =?utf-8?B?WFVTR0VmT0krYlVQME9TM1lHZzRzNXN3eHo3UHdLa2IxMUJHZGdiOFBucFpB?=
 =?utf-8?B?V0ljRm9wV1hLanJxTFgvRFNubmM3L2NRdnY3S2diUVg4Q1d2Sk5DSmZXOXlP?=
 =?utf-8?B?Q0NXcmU1Vzlnc2NHVkZuZjRYSDlsSzU0eDZTSzZiZ0dRQ3R0WXU3c00rUWt1?=
 =?utf-8?B?U0NyQ1dmTkhDNUpBRkVYblRUSGlRMHhqdWloVkFGam85Z1BoQWNDRDJFT0p1?=
 =?utf-8?B?ZG85YkZQRmMzenc1NnZ3bHRZeTM2Q0dNKzl6UjdMbGpEays0akJaOS90eVlR?=
 =?utf-8?B?TGhyUFFKMGxhc250SVFyTDVDUlMwZjhmcENqQ3NiSXk1cmVmd2dBR284cVlT?=
 =?utf-8?B?YzEzanhyZ2xaQy80WENDTWFUT1JsNmhqODFzQTI2bFQ1VUcvM3VlS0NvQVdl?=
 =?utf-8?B?SHhyZVJhQXNoYVdPYnBUbHVnV0JqKzIrOGt6Mkh3ZEw2enVUNVZNVGQ5Qm91?=
 =?utf-8?B?Qnl4REFZNEpLTitaeDNrOUJkOVd6RnlRMENZSHJPSHFCb2FFS1BFczNLanhy?=
 =?utf-8?B?VXpGQ0dpVUxoY1BhQjc2NlpxdjA5dFczbGIxMnVESW90THozOWlkYzd5VnV3?=
 =?utf-8?B?SWlwQ0E1K2hESVgwS2NYL1FzblFaMjBiRzZkRTF2TExNQ1lPVlBvTWhIQmJJ?=
 =?utf-8?B?ejZveS91TWo1ZU5iMWpWUHdCMWhuZ254cnJ1clUzenhUSEZOaFBpN09TaW5V?=
 =?utf-8?B?TUFaOVhSRnNZWjhOTDhCRkZFVExReE5leVhPSmZ5ZUh5N05TWXdGdkFMUHZj?=
 =?utf-8?B?WUh6UXpXM0FtSWJ6L3p0QVJENzU2TFJSdmhUMFJkcURJbE1raVBSRDJMVDIv?=
 =?utf-8?B?NEFxRFZaMEdnbkZ5ODVGNHhXakhvaW4ycDlzcE9ZZ24ySE9XcHI5T3lZOEFH?=
 =?utf-8?B?YWRodjVJdityYVhlYXFyMmtNOFI5YTJaU1FmTnV4UnZvbHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5491.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0l6QzdkZWFLQjlrY3BMZjB1NXpHT2xzK3E5a0dnVmkwY256RE9uRjZ0ZCs3?=
 =?utf-8?B?QWRIUWM2RUUram5CalBDTnFwMm82RnJwdUthVFJVYlhqbDNpMTJVODdvT3h1?=
 =?utf-8?B?OURWdHhjSWVpcGhGWHM0T1hkM004WDdvYWxYQ3RyQmJoZXJES0VSaEhYa2V2?=
 =?utf-8?B?elEzcHlQam40UDBxZUJNUDNHSVhQcG5wYW8vTUxSMzVwaVQwU3RHTHZDZGtE?=
 =?utf-8?B?SDIra3JOSWhLekZQS1F3WmsvWkFKM3hKYi9KVVJORUFuc0dUM1l3YzBhU1c4?=
 =?utf-8?B?UzRiUlVQckhXdXgraU9rVTVFbHU0YXFEcjgwQmJWRkd3bGE4dzl2cmxKR3R0?=
 =?utf-8?B?VHVaWEZQMVR5S3UzcVFoRXJzb3dMNjJHTjZOSTgycXhDTnc4WkZndGRiUWJl?=
 =?utf-8?B?cWNjTFA1K1d0UXZQU255VGRvSERvOG91dXA1SDlzSnQ5dVBMSzNUMUcyWXJN?=
 =?utf-8?B?bDdNNUxrN1RjbnYxS3dRYnVFQlRrYU92RERGZkxtRGt3STkzQ2hENktqb2FP?=
 =?utf-8?B?MW4vblorMDBDS0JHNEt4OWpML2lBQWsxeGE5cVVGQkZkL0hoQWRiQ0tNZjI1?=
 =?utf-8?B?RFZ6bnVPSGlHOUZsN2Y5b1pLZkF1bzBCZUZNTVNiU3Iyem5NQWdESWZ1cFdQ?=
 =?utf-8?B?UG1DK2hRcjIveUl6Smloa01oMEtZZnY2SUZEb2F2bmpGS1VwYmdqN3U1S3BQ?=
 =?utf-8?B?eWN6cjRHamlMeWZnVzFjQXJLRWU0aDFhb0UrRDB5V0lBSXNzNnQydXRRUlNC?=
 =?utf-8?B?OHZ6cTN5UWdBUHJuREpyNkthMzROcnRIQUNvRFgyWHRVaERzcWhISGwxWkU4?=
 =?utf-8?B?cms5aDJVUlJMSTN5RkQrb0MrT1FkOXc0QkhLV1FmVEw5UUpOTWs1amt2Sm40?=
 =?utf-8?B?UUliRElrckZqUWt3bC8wNTBKWHY4THFxdlZsK3hRdFh5VVptRHA5Z0JsS0t2?=
 =?utf-8?B?U0I0dDIvRnZaSzZzWWZ2eXI2SmI1MjJjQ1hVbDBwdVlLMGJacUU4SW4wOGJZ?=
 =?utf-8?B?WlRsc2w0cFl2T2VBNU5JNWhjWW5jd1kzTER5aUUxOHljS0dnb1k5VVRaSGY4?=
 =?utf-8?B?WC9UeWhCSzBOSTdZUnhkZEcyeThDa2UwWkZTWEQxY3IwWlZzakE3QUJ3ckZS?=
 =?utf-8?B?Um1KbFBNSEg0SlVZR3ZjU3NrUjRzRlgrY21iQVJLU2QrR1QrKy9FUStuMGEx?=
 =?utf-8?B?T3VqckpDdUxRMkJvYnkxMi9oalVURkFhVG5WTWRpSm91aUc3VTlXNmJxZkVY?=
 =?utf-8?B?aURZTzVPMnNBRTY2WGxBOUNFQ1E5U3Y2S2ZrZzVOaWVZUEpESVpvNVF3TWM3?=
 =?utf-8?B?d1k0Q3Z4cVlHWC9Ud2pLU0J0SSsvN1BFNWtISkE0TGs1bUR3TDNrdEJaOUpU?=
 =?utf-8?B?cGpkY0MybjJvZzNJbldNbWRyUzBoZjVYbnJLTkkrdm5Kd2Q4VVVSeE5ZVjhh?=
 =?utf-8?B?c3dZWVRydHJpNU5ZVTJOSGcxQ3FoNkxScmdBNFRrV0JhbWZKTHhVdGZzeHMx?=
 =?utf-8?B?Ung1Snc1U1E0RkVOYTNpZ1k5VlI3REJobW9TSE9paktWMlFjY0lXVVRHeC9m?=
 =?utf-8?B?aGFWTWFodUtYV2VkSk9DbXJ2b2ZNSDBBVGlEcCtOeWJEbmFQOHpvaWJMM2Mz?=
 =?utf-8?B?VHJQVmY3R2VheWJUcTlaalJPczJ2Sm11OHNXSFB4cHhsMW5mb1o5RXdwZ05T?=
 =?utf-8?B?d0xROHFueHRQcEF5dkFSZFFXVDR4dkZaaGsxWkw0OEVuclFoR0U5NWVFQTY4?=
 =?utf-8?B?K0FIZis4L3pmY0JESkR1NU5VV3k0SVUra1MyS0Q1bUhONTMyY1V4UTNPTjFi?=
 =?utf-8?B?a3diMGJpeE8ybkVUQ0xFejJPSzZHb1V4Zk9aZEdXdFB1dzBMU3BiNDIrY2JG?=
 =?utf-8?B?dEZONlNadjFiTGswd3F4Y0NOMENwd21aYzB6UDkvZlh3NG9XaDRUd0xuTk5a?=
 =?utf-8?B?NmVyVGdSUW1UTWxqWjZSQUdXR3o2WU9jK3c5WnF4TFBoSi81enBTSDdxL202?=
 =?utf-8?B?Nk5ZUzBNYnNiZmxxZXdZZzJ4YWIvN2RKd0pqTmFobFlTdTZTUGlJWVBXTDE2?=
 =?utf-8?B?OG9xUEpHbHF1TExCYVRmQlowTU03WGYveEFVMUl6VEk4bTNIYmpuN1R6Rm9p?=
 =?utf-8?B?SjR2UXdjZFQ5eGsybERUbno0M2ovdFpyNTdRNDhrQzhTT2g5S09MaHNzNjVP?=
 =?utf-8?Q?j0/dUcl6AxEiOKlKnU8d+FvRPm8NieRe5FOiG60ezel9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5491.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 497e80e2-3e82-4165-5bca-08dd234ee918
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2024 12:39:58.1477 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3kpoN0iGcA83twNG7LbgXwNtKjfNzCwBDJfgdHOTNWbALHKcUHZhgjsy+22GXPKKfsw55oBAnH5b0mJWD7m+j309JOdkYEyAaSsS0dWLM4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
X-OriginatorOrg: intel.com
X-Mailman-Approved-At: Thu, 02 Jan 2025 04:15:35 +0000
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

SGksDQogDQogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDIxNTAv
LSBSZS1yZXBvcnRlZC4NCiANClhlLkNJLkZ1bGwgLSBBZGRyZXNzZWQgZmFpbHVyZXMsIFhlIGNh
bm5vdCBiZSByZS1yZXBvcnRlZC4NCmk5MTUuQ0kuQkFUIC0gUmUtcmVwb3J0ZWQuDQoNClRoYW5r
cywNClJhdmFsaS4NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEk5MTUtY2kt
aW5mcmEgPGk5MTUtY2ktaW5mcmEtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJl
aGFsZiBPZiBTZWJhc3RpYW4gQnJ6ZXppbmthDQpTZW50OiAyMCBEZWNlbWJlciAyMDI0IDE2OjE5
DQpUbzogaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCkNjOiBJOTE1LWNpLWluZnJhQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KU3ViamVjdDogUmU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVy
ZSBmb3IgdGVzdHMvaW50ZWwvZ2VtX2V4ZWNfYmFsYW5jZXI6IERlY3JlYXNlIGV4cGVjdGVkIGxv
YWQgdmFsdWUgKHJldjQpDQoNCk9uIDIwMjQtMTItMTggYXQgMTc6MzU6MTEgKzAwMDAsIFBhdGNo
d29yayB3cm90ZToNCj4gPT0gU2VyaWVzIERldGFpbHMgPT0NCj4gDQo+IFNlcmllczogdGVzdHMv
aW50ZWwvZ2VtX2V4ZWNfYmFsYW5jZXI6IERlY3JlYXNlIGV4cGVjdGVkIGxvYWQgdmFsdWUgKHJl
djQpDQo+IFVSTCAgIDogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8x
NDIxNTAvDQo+IFN0YXRlIDogZmFpbHVyZQ0KPiANCj4gPT0gU3VtbWFyeSA9PQ0KPiANCj4gQ0kg
QnVnIExvZyAtIGNoYW5nZXMgZnJvbSBJR1RfODE2MyAtPiBJR1RQV18xMjMzNyANCj4gPT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiANCj4gU3Vt
bWFyeQ0KPiAtLS0tLS0tDQo+IA0KPiAgICoqRkFJTFVSRSoqDQo+IA0KPiAgIFNlcmlvdXMgdW5r
bm93biBjaGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEyMzM3IGFic29sdXRlbHkgbmVlZCB0byBi
ZQ0KPiAgIHZlcmlmaWVkIG1hbnVhbGx5Lg0KPiAgIA0KPiAgIElmIHlvdSB0aGluayB0aGUgcmVw
b3J0ZWQgY2hhbmdlcyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiAgIGlu
dHJvZHVjZWQgaW4gSUdUUFdfMTIzMzcsIHBsZWFzZSBub3RpZnkgeW91ciBidWcgdGVhbSAoSTkx
NS1jaS1pbmZyYUBsaXN0cy5mcmVlZGVza3RvcC5vcmcpIHRvIGFsbG93IHRoZW0NCj4gICB0byBk
b2N1bWVudCB0aGlzIG5ldyBmYWlsdXJlIG1vZGUsIHdoaWNoIHdpbGwgcmVkdWNlIGZhbHNlIHBv
c2l0aXZlcyBpbiBDSS4NCj4gDQo+ICAgRXh0ZXJuYWwgVVJMOiANCj4gaHR0cHM6Ly9pbnRlbC1n
ZngtY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18xMjMzNy9pbmRleC5odG1sDQo+IA0KPiBQ
YXJ0aWNpcGF0aW5nIGhvc3RzICg0NSAtPiA0NCkNCj4gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQo+IA0KPiAgIE1pc3NpbmcgICAgKDEpOiBmaS1zbmItMjUyMG0gDQo+IA0KPiBQb3Nz
aWJsZSBuZXcgaXNzdWVzDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gDQo+ICAgSGVyZSBhcmUg
dGhlIHVua25vd24gY2hhbmdlcyB0aGF0IG1heSBoYXZlIGJlZW4gaW50cm9kdWNlZCBpbiBJR1RQ
V18xMjMzNzoNCj4gDQo+ICMjIyBJR1QgY2hhbmdlcyAjIyMNCj4gDQo+ICMjIyMgUG9zc2libGUg
cmVncmVzc2lvbnMgIyMjIw0KPiANCj4gICAqIGlndEBpOTE1X21vZHVsZV9sb2FkQHJlbG9hZDoN
Cj4gICAgIC0gYmF0LXJwbHMtNDogICAgICAgICBbUEFTU11bMV0gLT4gW0FCT1JUXVsyXQ0KPiAg
ICBbMV06IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgxNjMv
YmF0LXJwbHMtNC9pZ3RAaTkxNV9tb2R1bGVfbG9hZEByZWxvYWQuaHRtbA0KPiAgICBbMl06IA0K
PiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEyMzM3L2Jh
dC1ycGxzLTQvaWd0QGk5DQo+IDE1X21vZHVsZV9sb2FkQHJlbG9hZC5odG1sDQo+IA0KPiAgIA0K
DQpUaGVzZSBhcmUgbm90IHJlbGF0ZWQgdG8gbXkgY2hhbmdlLCBQbGVhc2UgcmUtcnVuLg0KVGhh
bmsgeW91Lg0KDQotLQ0KQmVzdCByZWdhcmRzLA0KU2ViYXN0aWFuIEJyemV6aW5rYQ0K
