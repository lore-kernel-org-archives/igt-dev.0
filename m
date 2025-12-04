Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 382FED29FB4
	for <igt-dev@archiver.kernel.org>; Thu,  4 Dec 2025 19:21:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6BA210E9B2;
	Thu,  4 Dec 2025 19:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BfSqNub5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA02710E036
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Dec 2025 19:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764876061; x=1796412061;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=XzDOdLnVyO4XTFmhufhIlUuXIOcbuu2+gdlboLvCt3A=;
 b=BfSqNub5ZTPMhJ8aciLw19bhVvmhUxib28RjOY0t1Si8greZlOr1p647
 /a/5jCwb9f4cPsa+lqyFlQiFeNqErN/n5Bvh9zHh7KV3Y0G6dyyRMDCw0
 hhwJqodESFaGJonUaNceAuY97ffG2k8BByP1vDqJ71yGktDhlLaywgfyA
 5BRTQwJk66tgdav+B2NyZLWDh18e/yJJ6zCw9na6CabeWLHKzNWO2vL4w
 gADAQyShLFD36LwKXydVCFnsPaCnC6mSv1B5VsHglJDue3mBau3nO47fb
 wzr2Xen5BQq5fXLHn6ieG9zBBEK6/U1t0S3JNmbGzIxKwWgE4ujzkVmIt w==;
X-CSE-ConnectionGUID: zZEuzJNfSOqh4btNbEeyWQ==
X-CSE-MsgGUID: yDzydrJ9Q/K/i9A0v4cUGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="92386983"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="92386983"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:21:00 -0800
X-CSE-ConnectionGUID: moJh6KIZROeyN9iZaWOHEQ==
X-CSE-MsgGUID: Xzdus2AmRb6QsyoVFq5M6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; d="scan'208";a="194141314"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 11:21:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:20:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 11:20:59 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 11:20:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nHAKoJJ+Doz6cVLHggGZo7q170VNtPldwJelVm9sZeNYs6+svSIt12d9nFsBnSBZRTH8Ud2Z+SPjlxpoDgNYqWxDfbbjfBJvOlxEz62GZk8xJCbWnRsX+R9zP8W5XX8OibgXjOV/uEnRxW/OKzNS9wvxz60DMPIS9XC3oJ6GMEFWhKu/SkDdjZM9MevavBSbbvaxmto4q4dliDf0UGpd6EWEWfPsy1Q2vHBuPc1zNt1tNZGjPN0wsCK9HKR236qA70xegAEfUc8IHCBz1U4TvDLt1/g3CZi7/HrO3nYtSr2I4TTyEJ09LsN/b247zg2OeFNhW/9URl0aXB9wdZJtdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XzDOdLnVyO4XTFmhufhIlUuXIOcbuu2+gdlboLvCt3A=;
 b=hSn0phGNPtsxolNWZP2iaZrDSQilEnZ6zoBV5VVaykygmBQw6YXq1ZQVNRhzRRDYgbkofrtzDaQElL116HSI+47DKaWjw/iUoxBk20J6rx/nvMobDjo1Y4IbGveuCO8UdkfqloAH9SuyxkZ+vLBQsp1qAeXLFfqHUXRsJ1rlDRDKho6mYhFnQJaOmNZ/zYDWIDQxi3RLb/RkLN/k11BDKp31PwgC95V5ar07THhoaCchkE5dANNMvDCk9OqXIU66Sc6dGzs6hy7YR00tC3tDOjyOFl+3aimzGPnJQxFcZoFxcbxAMgeO43iCuLLGjkzCMtQfjGoapKB4waUDcZZipQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 CO1PR11MB4915.namprd11.prod.outlook.com (2603:10b6:303:93::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 19:20:55 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 19:20:55 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
CC: "Ch, Sai Gowtham" <sai.gowtham.ch@intel.com>, "Dandamudi, Priyanka"
 <priyanka.dandamudi@intel.com>, "kamil.konieczny@linux.intel.com"
 <kamil.konieczny@linux.intel.com>
Subject: Re: [PATCH v2 02/19] lib/xe: Add multi-queue helper routines
Thread-Topic: [PATCH v2 02/19] lib/xe: Add multi-queue helper routines
Thread-Index: AQHcWpsLbm0Nb27Nd0qYKwmHwv0BRLUR8QCA
Date: Thu, 4 Dec 2025 19:20:55 +0000
Message-ID: <b386089188f3b93b61744f5856541b250b38393f.camel@intel.com>
References: <20251121035715.767226-21-niranjana.vishwanathapura@intel.com>
 <20251121035715.767226-23-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20251121035715.767226-23-niranjana.vishwanathapura@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|CO1PR11MB4915:EE_
x-ms-office365-filtering-correlation-id: 14f090fc-c61b-4e57-c580-08de336a3f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Y1VXQWlObzNqNXFmZjNpUGorSmhjSWZJSk53THB0Wnk0b0hyNlMvK1BDUDQx?=
 =?utf-8?B?NUFXZDZmL1dsbis1U1FtQVN6T0gvOUxTdndIL0NLSnNZTEZlSmRDS2tJWDlv?=
 =?utf-8?B?OHJxREhlTmhpQUtXVFNnMlBqc1lPTVYwWE9XUzBtcEJYZS9EUGRVN0toUWdq?=
 =?utf-8?B?OHFRaEV4SEVKaGJrOGJ0cGs0ZnE4QzZyR01CcGJDSkZLb2ZNaUxPazJFVEpF?=
 =?utf-8?B?dTlDRmw1V285ZERMbk9Qa2dHdUpGRXo1cEU2elVJT2tGMzhKd3Y4RTMvTzdv?=
 =?utf-8?B?K0Y1WmlPNnNSdUZHaWUrd3NDUkg1OHVkOVBvN1MwYTh3dk5kWEJXZmlUTlk3?=
 =?utf-8?B?M3pldmFWRUo4V2taVnF5d1lJMFM5OUZocHFudWxiRjIrWjQ4SjZVMXFPOUQ2?=
 =?utf-8?B?WnBGYmtTN3pCZVNiL1hNOFVaTjdWcFYxR3VRVkROVXJrN296NW9yNHVQTExx?=
 =?utf-8?B?akJwSUh6Ky95cW4xK2QyTEdxTVNEd3dQbk5PNVRWdHNyNFl1K2t0VkN1TVFQ?=
 =?utf-8?B?a3VDVVAvcnR3Vml5WmE3MVNYaU5qekxMMHlaTDV6bGRMR05BUFlzUDJqVmJ2?=
 =?utf-8?B?cW1IMlpwSC9GUUJhekJCMWxQMENWZGRXWmYyTHlCTm91Z2FiV0tNamMyQmtk?=
 =?utf-8?B?cG94SWwreWNCRGg3WkFPRWZ0MlBHTVFEQTlDMFNuOXY3ZkgrMXJUYmFPdWlq?=
 =?utf-8?B?TjJlT011T3krdnByWkhGREhVWmhKNVhnL2JsZ1l0T0VNRFhwbFdFZzRYWUc1?=
 =?utf-8?B?OGxHdERFZ0NCS0oxUFIzVGJjS3psNzhMdjNINkJHbjZZNjJuTWpCcWsxNy9n?=
 =?utf-8?B?dnJoUDZhcmJrZmVjYXBLYlFYL1J4TzhIRXV1MVJTOHNvdGpoYzAwR0JabXd4?=
 =?utf-8?B?bDFwcGgxZiszVldVeUVDMXpMblRRR1Jwbm1YQ1hjaHpiNDU2cXhPY0JnWmJs?=
 =?utf-8?B?L2pYSGIzb2FlazZXMFlEbWJqRzJmMmUycHFMSU0zS01NSXRIcDk0cGtmWFpP?=
 =?utf-8?B?MGZCSWtLa3QwanV3V01kaFYvazY4TFNaQldGWXVhMEJjQW8zV2V1cWd2d3VD?=
 =?utf-8?B?YVpibVZZcmhMSWRHYVRTNCtpOHBTWWpKdG5iWXdpbXRPbGRVQTgrRFZvZE9N?=
 =?utf-8?B?dU5IYTRDUU9acmYzMzNpdWJ0eU44RUE4enpiT0hEc1U0OU4rN2pSWmJmOC9I?=
 =?utf-8?B?U2pURGhPVXM5cGIvSHlKVDhFbS9CTVZwaG9Ia0hmTERXUHRMcXJLUVE0SEcw?=
 =?utf-8?B?UStreWZYZjc4RStGTU9uR0NTMUUyMktvbURyZU5GbVZHQkQ2RDRmRGU0SjR6?=
 =?utf-8?B?RitzOGRmd2gxYVdDVkZwNVg5dVBqREFyWEg5MENGeDhxMWFXOGZDRU1iWlBJ?=
 =?utf-8?B?MUgweVg4YnFCUi9JYjZySTM3bGNYMDF5TTh2NTREV3VpRFdJdW10QjdvK2pY?=
 =?utf-8?B?Z3A2ancydW9KQmtHaXVVZVZhRTVGOE9iVi9CR0U3czc2WFkxNnRONkxROHRK?=
 =?utf-8?B?OVJIdU9FbC9sL0ZWUzVrMEIwL0Qwa21EazYxcmJzR2xBL3VyblVzQzA0TVJF?=
 =?utf-8?B?U0xFZEZCY2k5ODBsNHRGME5WdEpQeTB1OFpiUHVIUVkwcjBFS1ZXY0hsaEtu?=
 =?utf-8?B?d3RTb0ZWN3pkemZlckwzQ2pMTU9hL2dBRVNoTUtkR1pNeWRsVVJSR2M0RjZ4?=
 =?utf-8?B?anZRVURpRHZvdFVYb0NUQ3k5UlUrL3VGUlF4UlFpZmtkeG00cC8vZnZqTExs?=
 =?utf-8?B?L0Nzdk9VTlVucE1tOGUwMitBb29LVU5FOXowdDlFVGhmbC9UN0grNTlvYUtr?=
 =?utf-8?B?cjgvK0x6ODdYQXF2SDg2RmFuRVBXaVVwNkpkekwyejdySzlzeXZMWVJ3Qjdy?=
 =?utf-8?B?MHkyYlFqUFRQUlIvS0xiK0VBcGt2bFE1VVc1Uk1Ma0RaN0orbGc2aGxkaUtl?=
 =?utf-8?B?VDVvVzhNNGVubGtqQzROZ1NJV2JSelU1bmdrU1RXNWJFSWR1SWpVaVFzanZE?=
 =?utf-8?B?WGhXTmR6b3ZBdllEMHV0UUplOVZlZHBiYm9TckVGby9GbFM5Ym8wOVdlcHJp?=
 =?utf-8?Q?3ljLZ1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?blRzR2JIQWFHcTdrZGpsMUxOOGlQeGUzcXhReitCNG01V2g3dGFUeVprS21S?=
 =?utf-8?B?ZE8rQmpaekFUQldpSFZwTFZ5eUJ1Q2dDcEFoOGVZcmQ0b2dEUVlWQmJHaWVW?=
 =?utf-8?B?NUxYaFZRWTBDOHVnYyttNjU1NHBTM0o3RVpBQXhRdE9GVmcyUWl4a2VINlpH?=
 =?utf-8?B?WUh3ci9MRFBmWk41TitOc2l0Nzh5enQ3YWQyb3VmelF3cWR1aU9FVlA3ZkFK?=
 =?utf-8?B?NEZDVC9pS0NJWmw0bVI2bEd6ZE5zU1h0aENQc0NOdGJnemVUQ0VSSCtTOEpr?=
 =?utf-8?B?ZEN2cHl1d3ZNcG5zRnMzSDlMa3lKMFJlQ000bVFibldLUkZoMVAzMjhzeWVu?=
 =?utf-8?B?Q1VrVDhJbnNQNk9udnFMTHNqRjFuTFBteFRKU3FsS0Z6V09YYkpQTzVpSUVC?=
 =?utf-8?B?aEFFS3ZIUUpLTlpWdHAxU1RtVGhBN2MwVEpFK2ZFZE5VRTFQR3h1T3BiRWVt?=
 =?utf-8?B?U1hjVmFCM2xTYWxyTGFFQW9LU2UxUEdURVpmb0xTV0Q3SnhMRHBIYnZSS3pj?=
 =?utf-8?B?NWFZZTIva3BKTnJUOExRWEppR3BseW83SjhpSHNCcmFCNjZrM2dFNmY3ai9M?=
 =?utf-8?B?TkZkUzZEcXFra0w4OURJdGcxeDBGL21LSGpLdEFlSE5VK1hZblAzam01Rnkw?=
 =?utf-8?B?NFdaRW9SQzJmSWpWUUZScUdrQTZzdm5UTXBHRWVsdHdPV2kvQkJCWFQ1dnpv?=
 =?utf-8?B?WDJib0RCaTBwdGtyUzVIRWl4dVp5dEFvcWhZN0JWL05PUllrNmR0T0FMNldm?=
 =?utf-8?B?dTdUQWtmTUpzeEFLKzMzKzFVK1FvQ1NaN2JtdWxyK01vUm9kNnlTZGZPWURQ?=
 =?utf-8?B?N0dVS3RvVGdYUGY4TktlYXhYSFZEaER0SlFJWDZEZ3hVaFZpR0M4cGQwaUxi?=
 =?utf-8?B?eXQ5V0dLUWllNHdmSDV2YUllK2RlVXFwdDNHUHE3T0dNQTRKdjRZaE9vOStW?=
 =?utf-8?B?cExHTGxya0Q1NkdVL3FuWWVmSXA0TXpGTmtoRUdwbEJ4S2JwSWdSK0FqL0ZK?=
 =?utf-8?B?WC84a1B5QSswZW0yblpZTmtQbEprdzZ6YzVwTE5maW9JdzliZTNMRi9RUklM?=
 =?utf-8?B?N05XaCtyaG82KzhKaUNoSjNkRW5qRURTMnBRVGRuVTFBdnUwLytTQitaMGkx?=
 =?utf-8?B?Q1dpcFk0c2xxYkhBSXN4MWR6NE5FS3IvWmpnckVqZnhybS9yRmxMZE5iaXl1?=
 =?utf-8?B?dFg1Q1dEOHVmU3YzNTE4cEhvZ0VnU2Z1M21IT3ArMldXTzlUYWxtVGhhbHRV?=
 =?utf-8?B?eUhrOEVBYkhnRDBabkNFVmtNZnExanNVZjJ1YzljeGFJK3J3a0dXR2xTemMr?=
 =?utf-8?B?S29xK1cwWktZUGpYajllbGRFK0EzUUxQc1ZrcFlTbHdpVnBlUjZtcWlqc0Q1?=
 =?utf-8?B?VVorWVErb2E0TFVXNnZvTEY0Y0xHT1ZmR2xZTUllR3h0MGR0Y0FDT0pGSXBG?=
 =?utf-8?B?NUVtV1QxWk11K00zQ2puMHUwVm9ESXpLQktyV0NMQnFOeW5IYXRTbUh0VmlW?=
 =?utf-8?B?RjlTWm5FeWFTcGFra3JhbjV2QjFRWitZejdqNG5zb3NhS0liY2Rqempsd0ps?=
 =?utf-8?B?cVJqaE9PMVhYaGczT0U5TmVjd09RdTh2eUJVMFhmS3NjaUo5a3JRWnN4SFVH?=
 =?utf-8?B?N0cxZXZQYnkvSmtNWElxSGNQeXphQUNuVHVXTU81Yml6NkJ4RTNVTG1HMjBM?=
 =?utf-8?B?YmxKaGFIbkdEQ3RZanpYM0RPQVUwUFA4TElxS3FLQjNNeGdjSEdSdmhlS2Z5?=
 =?utf-8?B?MGhrZ3Q0WTRWdndKZ2hKZDhVWXRSOHkraVE1VkJSa3E5amFFZXRoSkgvTmRX?=
 =?utf-8?B?dk1tSjVxUzROd3EyMWJDVHNmdFRYVWZwczd3SU9OWHBVbWNsMng5cFBlUDR1?=
 =?utf-8?B?WmRibVVDdDlDR3pRdXNwRkgzMkJJUGUvYVdFT21UMVVjRWxwZmIrWVl5TzZx?=
 =?utf-8?B?aklOcG4vMnliaEUzTHBPR05wdjV4cytIT1FadjVVa0NpKy9oQ0tZRkFBbXRC?=
 =?utf-8?B?cVVnenpFS0xjTWNMcGQxcE1wV2RRak55OGQwWG5IS2w4ZDJCWXc3b1VqTzV0?=
 =?utf-8?B?N2J2OHZMdFpaTnplSFZmNEZoUUx4SGtFUGI4SXdTMVFlTlZlY3c0UG5YTUZm?=
 =?utf-8?B?b05aZTd4RldvZ0t1ZDA2eWlnTGJnd0ZNb0J2ZXVMYW4yUVkzVGF3K2JwMFQ4?=
 =?utf-8?B?MFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9990F2477717364FABDCD96294E8D547@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f090fc-c61b-4e57-c580-08de336a3f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 19:20:55.1734 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o+4qF1U1Q7j5CcgN/ze/km1ai2PQwjNzl0H32CeDk4YKPJ9+xf709Gu4Ac5zTLfkeK8wNjBVgIgD5xwfFY8a+Oy9I1sN/EqPg6siBQCfYvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4915
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

T24gVGh1LCAyMDI1LTExLTIwIGF0IDE5OjU3IC0wODAwLCBOaXJhbmphbmEgVmlzaHdhbmF0aGFw
dXJhIHdyb3RlOgo+IEZyb206IE5pc2hpdCBTaGFybWEgPG5pc2hpdC5zaGFybWFAaW50ZWwuY29t
Pgo+IAo+IEFkZCB4ZV9lbmdpbmVfY2xhc3Nfc3VwcG9ydHNfbXVsdGlfcXVldWUoKSBmdW5jdGlv
biB0byBkZXRlcm1pbmUgaWYKPiBhbgo+IGVuZ2luZSBjbGFzcyBzdXBwb3J0cyBtdWx0aS1xdWV1
ZSBvcGVyYXRpb25zLgo+IEFkZCB4ZV9mb3JfZWFjaF9tdWx0aV9xdWV1ZV9lbmdpbmUoKSBoZWxw
ZXIgbWFjcm8gZm9yIGl0ZXJhdGluZyBvdmVyCj4gZW5naW5lcyB0aGF0IHN1cHBvcnQgbXVsdGkt
cXVldWUuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmlzaGl0IFNoYXJtYSA8bmlzaGl0LnNoYXJtYUBp
bnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTmlyYW5qYW5hIFZpc2h3YW5hdGhhcHVyYQo+IDxu
aXJhbmphbmEudmlzaHdhbmF0aGFwdXJhQGludGVsLmNvbT4KPiAtLS0KPiDCoGxpYi94ZS94ZV9x
dWVyeS5jIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+IMKgbGliL3hlL3hlX3F1ZXJ5Lmgg
fMKgIDggKysrKysrKysKPiDCoDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQo+IAo+
IGRpZmYgLS1naXQgYS9saWIveGUveGVfcXVlcnkuYyBiL2xpYi94ZS94ZV9xdWVyeS5jCj4gaW5k
ZXggNTNhZjg2YTk5Li44YTY3ZGI2YTkgMTAwNjQ0Cj4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmMK
PiArKysgYi9saWIveGUveGVfcXVlcnkuYwo+IEBAIC0yNjQsNiArMjY0LDI4IEBAIHN0YXRpYyB1
aW50MzJfdCBfX21lbV9kZWZhdWx0X2FsaWdubWVudChzdHJ1Y3QKPiBkcm1feGVfcXVlcnlfbWVt
X3JlZ2lvbnMgKm1lbV9yZWcKPiDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGFsaWdubWVudDsKPiDC
oH0KPiDCoAo+ICsvKioKPiArICogeGVfZW5naW5lX2NsYXNzX3N1cHBvcnRzX211bHRpX3F1ZXVl
Ogo+ICsgKiBAZW5naW5lX2NsYXNzOiBlbmdpbmUgY2xhc3MKPiArICoKPiArICogUmV0dXJucyB0
cnVlIGlmIG11bHRpIHF1ZXVlIHN1cHBvcnRlZCBieSBlbmdpbmUgY2xhc3Mgb3IgZmFsc2UuCj4g
KyAqLwo+ICtib29sIHhlX2VuZ2luZV9jbGFzc19zdXBwb3J0c19tdWx0aV9xdWV1ZSh1aW50MzJf
dCBlbmdpbmVfY2xhc3MpCj4gK3sKPiArwqDCoMKgwqDCoMKgwqBzd2l0Y2ggKGVuZ2luZV9jbGFz
cykgewo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBjYXNlIERSTV9YRV9FTkdJTkVf
Q0xBU1NfQ09QWToKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBEUk1fWEVf
RU5HSU5FX0NMQVNTX0NPTVBVVEU6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqByZXR1cm4gdHJ1ZTsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgY2FzZSBEUk1fWEVfRU5HSU5FX0NMQVNTX1JFTkRFUjoKPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgY2FzZSBEUk1fWEVfRU5HSU5FX0NMQVNTX1ZJREVPX0RFQ09ERToKPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgY2FzZSBEUk1fWEVfRU5HSU5FX0NMQVNTX1ZJREVP
X0VOSEFOQ0U6Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqByZXR1cm4gZmFsc2U7CgpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1t
ZXJzQGludGVsLmNvbT4KCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRlZmF1bHQ6
Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZ3Rfd2Fy
bigiRW5naW5lIGNsYXNzIDB4JXggdW5rbm93blxuIiwKPiBlbmdpbmVfY2xhc3MpOwo+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJuIGZhbHNlOwo+
ICvCoMKgwqDCoMKgwqDCoH0KPiArfQo+ICsKPiDCoC8qKgo+IMKgICogeGVfZW5naW5lX2NsYXNz
X3N0cmluZzoKPiDCoCAqIEBlbmdpbmVfY2xhc3M6IGVuZ2luZSBjbGFzcwo+IGRpZmYgLS1naXQg
YS9saWIveGUveGVfcXVlcnkuaCBiL2xpYi94ZS94ZV9xdWVyeS5oCj4gaW5kZXggNmE5N2QzODRh
Li40M2RiODk2MTcgMTAwNjQ0Cj4gLS0tIGEvbGliL3hlL3hlX3F1ZXJ5LmgKPiArKysgYi9saWIv
eGUveGVfcXVlcnkuaAo+IEBAIC05NCw2ICs5NCwxMyBAQCBzdHJ1Y3QgeGVfZGV2aWNlIHsKPiDC
oMKgwqDCoMKgwqDCoMKgZm9yICh1aW50NjRfdCBpZ3RfdW5pcXVlKF9faSkgPSAwOyBpZ3RfdW5p
cXVlKF9faSkgPAo+IGlndF9mbHMoX19tZW1yZWcpOyBpZ3RfdW5pcXVlKF9faSkrKykgXAo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZm9yX2lmKF9fciA9IChfX21lbXJlZyAmICgx
dWxsIDw8IGlndF91bmlxdWUoX19pKSkpKQo+IMKgCj4gKyNkZWZpbmUgeGVfZm9yX2VhY2hfbXVs
dGlfcXVldWVfZW5naW5lKF9fZmQsIF9faHdlKcKgwqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoHhl
X2Zvcl9lYWNoX2VuZ2luZShfX2ZkLCBfX2h3ZSnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgXAo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBmb3JfaWYoeGVfZW5naW5l
X2NsYXNzX3N1cHBvcnRzX211bHRpX3F1ZXVlKChfX2h3ZSktCj4gPmVuZ2luZV9jbGFzcykpCj4g
KyNkZWZpbmUKPiB4ZV9mb3JfZWFjaF9tdWx0aV9xdWV1ZV9lbmdpbmVfY2xhc3MoX19jbGFzcynC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBcCj4gK8KgwqDCoMKgwqDCoMKgeGVf
Zm9yX2VhY2hfZW5naW5lX2NsYXNzKF9fY2xhc3MpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAKPiDCoMKgwqBcCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGZvcl9pZih4ZV9lbmdpbmVfY2xhc3Nfc3VwcG9ydHNfbXVsdGlfcXVl
dWUoX19jbGFzcykpCj4gKwo+IMKgI2RlZmluZSBYRV9JU19DTEFTU19TWVNNRU0oX19yZWdpb24p
ICgoX19yZWdpb24pLT5tZW1fY2xhc3MgPT0KPiBEUk1fWEVfTUVNX1JFR0lPTl9DTEFTU19TWVNN
RU0pCj4gwqAjZGVmaW5lIFhFX0lTX0NMQVNTX1ZSQU0oX19yZWdpb24pICgoX19yZWdpb24pLT5t
ZW1fY2xhc3MgPT0KPiBEUk1fWEVfTUVNX1JFR0lPTl9DTEFTU19WUkFNKQo+IMKgCj4gQEAgLTEz
MSw2ICsxMzgsNyBAQCB1aW50MzJfdCB4ZV9nZXRfZGVmYXVsdF9hbGlnbm1lbnQoaW50IGZkKTsK
PiDCoHVpbnQzMl90IHhlX3ZhX2JpdHMoaW50IGZkKTsKPiDCoHVpbnQxNl90IHhlX2Rldl9pZChp
bnQgZmQpOwo+IMKgaW50IHhlX3N1cHBvcnRzX2ZhdWx0cyhpbnQgZmQpOwo+ICtib29sIHhlX2Vu
Z2luZV9jbGFzc19zdXBwb3J0c19tdWx0aV9xdWV1ZSh1aW50MzJfdCBlbmdpbmVfY2xhc3MpOwo+
IMKgY29uc3QgY2hhciAqeGVfZW5naW5lX2NsYXNzX3N0cmluZyh1aW50MzJfdCBlbmdpbmVfY2xh
c3MpOwo+IMKgY29uc3QgY2hhciAqeGVfZW5naW5lX2NsYXNzX3Nob3J0X3N0cmluZyh1aW50MzJf
dCBlbmdpbmVfY2xhc3MpOwo+IMKgYm9vbCB4ZV9oYXNfZW5naW5lX2NsYXNzKGludCBmZCwgdWlu
dDE2X3QgZW5naW5lX2NsYXNzKTsKCg==
