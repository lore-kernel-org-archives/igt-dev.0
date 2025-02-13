Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104C0C021A4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 22:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12B310E07D;
	Thu, 13 Feb 2025 22:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OPK8o/G6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3070E10E07D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 22:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739486854; x=1771022854;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=SY+CNaSEPJjubZThcDBM3xYUyZlTlDo6xXGFHxu1874=;
 b=OPK8o/G6PuL80ZcbPZIYHDmmxGUINju3lv2MphM3eg2uoOVr8D15StqG
 9rWI1+Ls7Zeidf2KBVRlr8Uu+UJ3dxCGyqufzjFdHsn+kdclTlGRv1h8T
 cqOfbW+6la++jP+0c8MxLR+mL3rT/BOOgFTcwnrSt8YK9hMOtk/c5PW1G
 lBoygNiH5/JUGcnj+mKcXBaC+RtD2sh3GeP2uqah042GN5p+HRskm5P5A
 cG2OU3Lh9vBW+Z3PFLTRb4rK9FgErRaRDMdIpwcYZKTcky0y22REkDI9H
 Y7MULVZxlfs0wivWEfY/hvoKcHittKyZ7bru9/irPrlz7a/saXdvLMUB4 g==;
X-CSE-ConnectionGUID: Vw2VHTFrRdCRL/5+516PWQ==
X-CSE-MsgGUID: cz0bQNFuTXqo7xvgfnNBUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40092448"
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; d="scan'208";a="40092448"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 14:47:34 -0800
X-CSE-ConnectionGUID: 0wH4KqoBRVuouQhwxvnvBg==
X-CSE-MsgGUID: DWTyzgMuQd6YD23wuK9zFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="136516058"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Feb 2025 14:47:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 13 Feb 2025 14:47:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Feb 2025 14:47:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Feb 2025 14:47:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CCycxZNyYLuQP3DCynOKqVtsAYgpgpRB+eEwXGZXOIuiSTAlcg6vqiyiqcWv7jBL5DhSyUp4mofQc4RFYiKLd2uHEOmoFjIwPWoE3QuphC2MtN29Lhz8ukBGx1ldKun3JRHnlLNVWkzWV65PqksY3wHFQsQnNeavFsgt+t1WE6VDZJJuDu7fJXao3DKNS4i6NfliEVWo3iKJ2sUAvITTO2Cdv45P42qoR/JAc+8hThTLYV5IALfIp2k3zHU54KhE+v07vH+6yD3g7ZABOBPMQIteGSR+cu8zi2PaexTjqYk7VBKe7xcMrepLZ9kDYmkBdK65/5FTjzgw/KedPgRUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SY+CNaSEPJjubZThcDBM3xYUyZlTlDo6xXGFHxu1874=;
 b=hCTpF9Z4f5BD3XAOz+ffXyAzE+FDRAOiOK9scGE7eoTjgTyePib7upnZoukaoIOSHFvsp9aqEixt63IXs0W7ZKcVHiUVZGbCe7l05rnS7ipIw7jxnuH5wc6UoMGLXi+j0etbG/yzseIUUF7VYUojHdCd6HCQSRpmd87JgstKsXrtuvqMTyd90vSoAEKyLTRv9Za1f15uVFm+dCgHJheeZtBs0EMfkRyr9jRrk9edPdCgqyMPEZXjfB7vbo/DL7jXp0SrQH6ySCUt+SnZsWDJzllA7mJNDH+wbhm+WPNcVf6H01zl043D9tcDoAaBZZbYFLZPboN+EGHfBHStaEjqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 CO1PR11MB5138.namprd11.prod.outlook.com (2603:10b6:303:94::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.14; Thu, 13 Feb 2025 22:47:00 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4046:430d:f16c:b842%5]) with mapi id 15.20.8445.008; Thu, 13 Feb 2025
 22:47:00 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Ceraolo
 Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH i-g-t v3 5/7] tests/intel/xe_pxp: Test PXP submissions
Thread-Topic: [PATCH i-g-t v3 5/7] tests/intel/xe_pxp: Test PXP submissions
Thread-Index: AQHbfa++91rwFNaUDEu9sWrxiAth57NF1v4A
Date: Thu, 13 Feb 2025 22:47:00 +0000
Message-ID: <52fca5c57e86ed5f18f0489b643be3e0b8ef54d2.camel@intel.com>
References: <20250213003904.2059770-1-daniele.ceraolospurio@intel.com>
 <20250213003904.2059770-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250213003904.2059770-6-daniele.ceraolospurio@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|CO1PR11MB5138:EE_
x-ms-office365-filtering-correlation-id: c17ab13b-bfde-4557-2e13-08dd4c805430
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUlaMHA4cHoyRUowREIrMVpFYndmc2FObjlmcEFCTXNSK3p3d0dNS2xUczNz?=
 =?utf-8?B?Z216d0pNWk9iNmI2aVYwWHYyK0RDdGdOL1ZWaElTaHh1cVdSbVdmY1p3Zm40?=
 =?utf-8?B?Q05DQjhrTHdPZnpjdXVrMjlWaEJRbXk2cm1KQkh0eFJjOE1RVlhSdkNhWHMx?=
 =?utf-8?B?RXo0ZU1KemZzQTlaYThQUENsVlZlZXY1UDhBM1FxRURrazVPcTl4bGsyUWNz?=
 =?utf-8?B?SFp6cFg3QmRrWG9LcXV1eUdWeVVSNVhaWDU1R0oxN2c3YW9qaGVUeGlaNFRJ?=
 =?utf-8?B?Zm5ra2RQVWdHNWlUKzN5WnVhd0JHdm9FNVdTZzNXSHZIcmhoNmJNTWV6Q2hl?=
 =?utf-8?B?dmpQcTZGSHRSRnFEK1NyZmFCazNNSnN3REs4Mms2UUxyNUduTUJ4SEdyV3JL?=
 =?utf-8?B?MDBPT21raDhSRlhORkk5Tldzck1aQWV2c2FnVy96bmxnenBJcS90bk0vMjNU?=
 =?utf-8?B?N25aT2xBb05yTkxxRVhCS1lqREdPQXBXV0lsV0xad3Y3RHNzUGszU2tOT3A2?=
 =?utf-8?B?MnB5NE4vSjZ4ejRjMCtDYTFveWJVclJNRnJYTXl2YlJkeVNyc1JGWXhmUU13?=
 =?utf-8?B?TFlhQkMremFuTnNRb0wzcitnQWFCUWRIZGRCRzBRQStUQUpkdTJZNC94eFg1?=
 =?utf-8?B?bUNiMXg3c0R4Wk03VW1EdlUyMmNRWmRjSnFYajFiUDl5ekE4UXl6Z29haDNy?=
 =?utf-8?B?a0tQd08yL3lLeXpFTUI0bzlySTdwVzBySGdWZ2ZHY0xpc1lYeFFqSVE1cGR4?=
 =?utf-8?B?dThCbHdqTGthL3ZrVUg2Y2JGSjJNVy9COG9oVE9RRHNWREdUckNGYVdNOThz?=
 =?utf-8?B?aHRMRnJWRzBRMjZCMlUxVVUwLzMzangxU0FObTNyRE5DOWJsanYrK0IrWC9V?=
 =?utf-8?B?OWlwLzRyMkkrdkdhNURScWJmaDEwTzFvNk0xczUyY0tCenpoeHlDc2FCUHlw?=
 =?utf-8?B?M1hnakU3b05DME5hSk5vc1VwL2ZhNWV5MnlRM1kxbmZuVmltRnh0VVFDU3E0?=
 =?utf-8?B?WVhRTFFOZWF2TGtnenVjaTNVTEZpRU04RlhxYVlYN25pZ1lKaTBTS0dueFFk?=
 =?utf-8?B?NEFSR0t5emxJNUxiQkRwNmxRclhRL043Q0F1MSsvSWRkSnNIbUd0OEE5VWUz?=
 =?utf-8?B?Z0tPb2p3NDIzMHFNa3J4UFlCZDRBZzVzZStiNXJoc0VOcElNelhwNDY3Q1ZI?=
 =?utf-8?B?YUkzS0dDYmpCbFh2a0dEa0ZmRTZ3cE5DZmdvbTQrU25kRi9KNCswVGdGS1Br?=
 =?utf-8?B?SWxRK2Q4MmlkSkVweUJDb0pBVExWR25aSWdkNWgzbWRUZm5mZlpRRHJrbWdV?=
 =?utf-8?B?S0RyQTh0WmwrMmMycVZ5bS9kUHc5d29tVlZkcFZYMkhBczBMTEpTNkVlbXQ2?=
 =?utf-8?B?U3I1Y0RnTlV0b2I1TmNxa3paTDdydkI4djFLOGprT2ttbEkzQlAyenlDOGM5?=
 =?utf-8?B?S201ekFoRnAyMDM0TkNQSVpsNVIzcXV4ZVQyWFN5UUVDT3JtR1dybWJrU1BS?=
 =?utf-8?B?UmdsUDJPUWtRSUdQMHI1WnF5OUQxRmVNbHBEZjlYcHRBZXo4RHNVVGpNYk1Z?=
 =?utf-8?B?b3FXSUhQVUpSU2poVURLR2lRUmtvK0Nra3QrNG90aFRMbHFLRTRLUDF4YktK?=
 =?utf-8?B?TGNaZm1TNHpobzBHdTZobFJEaXhNTitYNlhtWFhMUmdjOS9ic1hpN2gzNG8v?=
 =?utf-8?B?a2FOQ2JnN0I4Ni80WHhtRzNGcUZiSU9jUWxhRWl1WlpYbEd2QlJLNW5PME5o?=
 =?utf-8?B?OGNJV1lCR2RseUFPbml5MFJWNDI5Y0EzRUE4SEtGOHlzUU9KOS9meXNQUFkv?=
 =?utf-8?B?Vzdnd1dXd3BPbUVwRkNENjljRFNwQ0Z4TDF3UTJ2VWRWQjkyU2NvclZrZzYz?=
 =?utf-8?B?ZFJBS2VTRG94M0Rjc3hqQitkSjB5UXNXdHk1NkRLM0hBd1VVbW1PTUZpQVlO?=
 =?utf-8?Q?S7XVR+xi7WP10ttQdPNBJeCNoBY2E4F8?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dHdNZDBicWRiRDcxbitPQWFORmgwSDFzVk1pdTJ4UVNWMmlMNGhvUVpPVi9j?=
 =?utf-8?B?L2F0YTM0RkZxanBJRzV6Z0YyVGRlS3VQK2ZjaWM5Z0JwQ0hWNUNON0lpUk9E?=
 =?utf-8?B?VGpnL3dzZ2pCYWpOcWd3MDVhTnBUaTJVdXlJRFU4U1BOM2UrVnpNcitLanZP?=
 =?utf-8?B?Rjl1bXVLYW9kbUlRcUZWbnZYR2VURm15eTB2S3EvM1RiTU1SRHIxcGU2ckxt?=
 =?utf-8?B?S0R0N2tvNXJ2dzQ5dGcvamlOc0lvYWtkZFl3Ky9UMjFvZTdJdzZQQm5PdnF4?=
 =?utf-8?B?aDgzNE5sbHQrRVBQd2VuUHZKZzVXYnJ3b2dRNnR6dXp2ZnIvTVMxa2NoNjdv?=
 =?utf-8?B?YnIxeFR4YzhqelovY1lEU2gvM1hlcEljOGR2V09QS3VlMU0xOGZmRXVXK0Fn?=
 =?utf-8?B?RnNWbDN6UE0rUEx4L09MTXoraGZFUXY0OTRlODE5cGpCTDA4VUcwSVc5SVB2?=
 =?utf-8?B?TzcrL3kzU2lhRHhQSGpxQk5JdWFPY3BXMWJZTnYrbjg2ZGZUOXc2VktCbit6?=
 =?utf-8?B?eXMvOEQxWGNFSDlyM2pzcTZWQVJ5bFk5L0lKdTZpTzMrMGNKYjAzaGR1UDhF?=
 =?utf-8?B?dVNwZHJFcWFCdkl4aWpiNzdtSlB6TjFnQkloQ0xyNFNhYzRPNFVuTUVOYlJS?=
 =?utf-8?B?QUZxUHpoYVBnbTlpZ0lKNzM1M1cwbzByU0pCL21iYmgxYUNsNDFGYW84MEhh?=
 =?utf-8?B?K3hKQ2I0cUFWRmFueE9UWnk5WUZKRnNzOEg3YlE5ODFnb0NjSHVyalJhN2xl?=
 =?utf-8?B?Rmg2RlR6TFRTNzRPbThWYkNGUEp0by9zUS9TeUFaZjVUdmt4N2lxSnBETDVt?=
 =?utf-8?B?cGFWN0NkUnNYWEVKRm5LY2xnOWJoRGVid3J5NWxmbjlNdzZQNTk1TFdVaHI2?=
 =?utf-8?B?YURxMHdoM1dlaUExeXpiaUUvWnZSK3o2aTByR2NNUWFuTW11ZmFyUUZ2Qmtj?=
 =?utf-8?B?eTF0dnUwUjhvZUxXdDF5SzEwc3hJaW5rMzliT2lqckhxU1dUZlJ0R0Nib25P?=
 =?utf-8?B?STV1ZVdTOWFJMGJoNGdCdGVkWjlxTzhYYi9TWmtEMHJIdHRDS1plQkFrVHZr?=
 =?utf-8?B?T0k0OHRleUZqVmdkYlpRcHBFQmF0NVdGWWU3LzF4Y3QvaUlxVDgyMVVnY1FC?=
 =?utf-8?B?bm02bXZILzVidlNRSmVuQXR4Z1MwSlhUTHpmWHlQZWl1SE5OcTduWXV1Zzlj?=
 =?utf-8?B?eDNmcnpNbCt2eVFSSVNqTTdTT25HTWtSMkdGWU1GL3l0ZUJCTFVwd2hSZ3V5?=
 =?utf-8?B?UitKVWxWY09IaHdxUnVlVEFHUTZQL0RpNnVuYzRNOGQ1SW9DcWFyUnFyNGt6?=
 =?utf-8?B?TWsyUGdxbWJ5UFRNWGRUcUJkN3puWkRhWkNZeTdpbFNnTWYybHo3a1h5Vmw1?=
 =?utf-8?B?K0I3WWQ4RWRXU29SVWx3ODRXaExidDdYQlhrNVY5Q3BVSDc2eGF5ek83OFpN?=
 =?utf-8?B?QmxLbDZEeGRZbDlvcXppZFNubVNOUDVTd09zbEFNcFNLZkx3TmhWNitqZVVX?=
 =?utf-8?B?QVhnVERHR0dBUy93aXpwREhxbDdzVE1UWEJVd2dMekJHcWxBLyt3Z0RMNjJT?=
 =?utf-8?B?akUxem9yNnVUSjAwaVNCWU5NaHp4VGpSWThXR3ZwUGVGVjcvVXFLZit3Qy9x?=
 =?utf-8?B?N3hINVBaTnVmUlVUNS84Ujdld0pDVStrQkNSSFJPQkkzZFFvd0g5V3VTK0lr?=
 =?utf-8?B?ZE8vZDJmNzl4MmxVTlpsQ3FGdXRDbklHR0dJQTdUOHErcXRKSkFGamJaSCto?=
 =?utf-8?B?c1dhTmZjdGdVUEpCbnpYaGNYWFJlQllRWTN3NXd5bk94RXg1U3Y5cEQyMTZy?=
 =?utf-8?B?Yklzd012N045YnUzR3c3Wk1KeFB2OVZSYkQ2bWcvZ2I1a2ZKUFgyb29DL2FB?=
 =?utf-8?B?M1Q2ZTJKMFhROUZud2FUSEJrS09jYWdmK3o0aFlLcmZoaDZpeFR6SzNZSzJB?=
 =?utf-8?B?QTlyalJWaytkMm5lOU52VFZOVDNNZDdsbnNsQ3Y3bUM1d2I2SVJQVkorUDlP?=
 =?utf-8?B?RUd5cVF3ekI2R1NkaFBEa1pxdXZPaG44OFpCL3U5TVQ4ZFZwUnVIbnFrRDlV?=
 =?utf-8?B?OWJFV21rcVpoSEw2Z08ydUM1YnQ0c1hVcU0wdlRqRnBwbXF0cE5JZGhYdk1B?=
 =?utf-8?B?R3BPRnArdWJnR3BZcVFDTXoxc29RS3h1R05mcGM2Y2NTejE2NFAzNjNFdXdS?=
 =?utf-8?Q?SlnBaqpfdZd8RfgOalLnMaU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <614EBBA80034F1419655FF15F5777341@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17ab13b-bfde-4557-2e13-08dd4c805430
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2025 22:47:00.8121 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 89gAOwiTe2bwd9jMTQLyuQYTInEIBeNyXUjFTNL0URIsS5nhu3lvXnROE8pwoQGDEi5UabjuBjbCSNIZAY/sKoyUpjIEgDd94msDoy3plU/cOaduAICptACukIt8dDph
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5138
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

bG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IEFsYW4gUHJldmluIDxhbGFuLnByZXZpbi50ZXJl
cy5hbGV4aXNAaW50ZWwuY29tPg0KDQpPbiBXZWQsIDIwMjUtMDItMTIgYXQgMTY6MzggLTA4MDAs
IENlcmFvbG8gU3B1cmlvLCBEYW5pZWxlIHdyb3RlOg0KPiBUaGUgcmVuZGVyIHN1cHBvcnRzIFBY
UCB1c2FnZSB2aWEgcmVuZGVyY29weS4gV2UgY2FuIHVzZSB0aGlzIHRvIHRlc3QNCj4gdGhhdCBh
IHVzZXIgaXMgYWJsZSB0byBjb3JyZWN0bHkgZW5jcnlwdCB0aGVpciBkYXRhLiBJbiBwYXJ0aWN1
bGFyLCB3ZQ0KPiBjb3ZlciB0aGVzZSAyIHNjZW5hcmlvczoNCj4gDQo+IDEpIGNvcHkgZnJvbSBj
bGVhciB0byBlbmNyeXB0ZWQgLSB3ZSBleHBlY3QgdGhlIGRlc3QgYnVmZmVyIHRvIG5vdCBtYXRj
aA0KPiDCoMKgIHRoZSBzcmMgb25lIGR1ZSB0byB0aGUgZW5jcnlwdGlvbi4NCj4gDQo+IDIpIGNv
cHkgZnJvbSBlbmNyeXB0ZWQgdG8gZW5jcnlwdGVkID0gd2UgZXhwZWN0IHRoZSAyIEJPcyB0byBt
YXRjaCBzaW5jZQ0KPiDCoMKgIHRoZXkgaG9sZCB0aGUgc2FtZSBkYXRhIGVuY3J5cHRlZCB3aXRo
IHRoZSBzYW1lIGtleS4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgY2xlYXIgdG8gY2xlYXIgY29weSBp
cyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlDQo+IHhlX3JlbmRlcl9jb3B5IHRlc3QsIHdoaWxlIGVu
Y3J5cHRlZCB0byBjbGVhciBpcyBvYnZpb3VzbHkgbm90IGENCj4gc3VwcG9ydGVkIGNhc2UuDQo+
IA0KPiBTaW5jZSB0aGUgcmVuZGVyX2NvcHkgdXNlcyB0aGUgaW50ZWxfYmF0Y2hidWZmZXIgaGVs
cGVycywgdGhvc2UgaGVscGVycw0KPiBoYXZlIGJlZW4gdXBkYXRlZCB0byBzdXBwb3J0IHZtIGJp
bmQgb2YgcHJvdGVjdGVkIG9iamVjdHMuDQo+IA0KPiB2MjogbW92ZSBpZ3RfcmVxdWlyZSBjYWxs
cyBpbnNpZGUgdGhlIHN1YnRlc3QNCj4gdjM6IEJldHRlciBjb21tZW50cyBmb3IgcnN2ZDEgb3Zl
cmxvYWQsIHJlbmFtZSB2YXJpYWJsZXMgZm9yIGNsYXJpdHksDQo+IHVwZGF0ZWQgY29tbWl0IG1z
Zy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbGUgQ2VyYW9sbyBTcHVyaW8gPGRhbmllbGUu
Y2VyYW9sb3NwdXJpb0BpbnRlbC5jb20+DQo+IENjOiBBbGFuIFByZXZpbiA8YWxhbi5wcmV2aW4u
dGVyZXMuYWxleGlzQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgbGliL2ludGVsX2JhdGNoYnVmZmVy
LmMgfMKgIDM3ICsrKystLQ0KDQphbGFuOnNuaXANCg==
