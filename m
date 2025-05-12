Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B829EC3ABC3
	for <igt-dev@archiver.kernel.org>; Mon, 12 May 2025 06:45:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B3AA10E2B3;
	Mon, 12 May 2025 06:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XHQ8Gf8c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F34B10E2B3
 for <igt-dev@lists.freedesktop.org>; Mon, 12 May 2025 06:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747032340; x=1778568340;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Q4CsTDAA4ZnJ7moePIZLxrUtwvGk/jcypT5pQa0z+Iw=;
 b=XHQ8Gf8c+vBLRGcYdSFIMIzkdUjOno1Pgzzq6f/uJ8yiLkbnCVqncmx1
 rAF01tVHlU3BxnxHhTkDipwKDQsAN9XRlOHEQBEwSdhMtJDRiVrx0W+QO
 EZRZDJJ2KIpMNIMrUqTyMNxunvdRpt1FjueCCwvOGS6zPtZAW/UIgOi/h
 3tcOANLIvgSFQso6CgBcGpsayGheHyUXP1yEdqQEh+cef1xEzLKdhVdPe
 9jTTPf8toFGqKebbhPhX+0Pp1jmYqS1yHPWOdy0S0rM1r5uaEyma/Fnua
 WfwfaWg6wCZCYUQQjkBLimQqWjb2pRVDoTYCG65DLCVTnDn0bkyZ8A+z7 w==;
X-CSE-ConnectionGUID: SnqNmu9RQ46LmKsGyMd1Rg==
X-CSE-MsgGUID: IIG2VRqcRtinhTwE1eT7aQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="74207459"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="74207459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:45:31 -0700
X-CSE-ConnectionGUID: 0Cq9ExUaS/+wpEKoa25wKg==
X-CSE-MsgGUID: z4mn1qc5RJqS3uszLK5X8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; d="scan'208";a="142029191"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2025 23:45:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 23:45:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 11 May 2025 23:45:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 11 May 2025 23:45:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R2OnxwiDCRkaWkfEQq+5T6yuMhKRogoxiwRKO9Nc0TmVaRz/GzSF57TtC/tVly59XwHEkhmrwJbHn17Or+Boyo1rj4wz4zZfqgYMhShgK4IQ0RObmOV88L8SvwgzWSrBeKwhj+E+CA+iRcxQLBPUUzRAwoxNrplz8HuB/sJAr5I2Jb674CwA4iGMVqbTxbUFdLxudaRQ45kkDXGFyYt500eYEpx9H46H2MvbkcisY/bvgpMVnCELG0u4iKq4BeICbpVqGPxAijdTngHKP+1E3kq4hZzGMVluyLagyulIj/pwcxtOLH+rLDP3i9+tCfwbsruTGCWg7SRjtbziuYYzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q4CsTDAA4ZnJ7moePIZLxrUtwvGk/jcypT5pQa0z+Iw=;
 b=htJPaQ+wuOJ61d2C0GcV9P6321se3MLmP2u4lsVDR7pKZ6qWeToIQL2VvkisUCns6Z7HJaiqjDuMzL+IB3SXWDcIduWwXdoiLa3Vtdn6jIqBo/oWVtxDMZWb0828qFTojWnqmEknfsVzrxxK4q/vEsDaLBavu50gCT0HvD58Pg1fZYMakuR4EAYDOCZY+DbTtK71qpPEmEEXBpaizJc3/G1aXJcXIJGjFSM7sApJsMCoGSlgTYimY3bxOPkabTiC1LudGGKNYlx6uRWRlOdtO43NToUm7nV1ASw5Qq7tbX15m3sTYdqega3RXNBbgP9g7Vxg9Eqe6tXCZVLe9gXw7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) by
 PH7PR11MB6555.namprd11.prod.outlook.com (2603:10b6:510:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Mon, 12 May
 2025 06:45:00 +0000
Received: from DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9]) by DM8PR11MB5655.namprd11.prod.outlook.com
 ([fe80::f6db:9044:ad81:33d9%7]) with mapi id 15.20.8722.027; Mon, 12 May 2025
 06:45:00 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "B, Jeevan" <jeevan.b@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "Deak, Imre" <imre.deak@intel.com>
Subject: =?utf-8?B?UkU6IOKclyBpOTE1LkNJLkJBVDogZmFpbHVyZSBmb3IgdGVzdHMva21zX2Rp?=
 =?utf-8?B?c3BsYXlfbW9kZXM6IEZpdCBtb2RlcyB3aXRoaW4gTVNUIGJhbmR3aWR0aCBj?=
 =?utf-8?Q?onstraints_(rev7)?=
Thread-Topic: =?utf-8?B?4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0ZXN0cy9rbXNfZGlzcGxh?=
 =?utf-8?B?eV9tb2RlczogRml0IG1vZGVzIHdpdGhpbiBNU1QgYmFuZHdpZHRoIGNvbnN0?=
 =?utf-8?Q?raints_(rev7)?=
Thread-Index: AQHbwwUYnGsP4ZvsHEm/OIkRpYx9/bPOhboAgAAGf3A=
Date: Mon, 12 May 2025 06:45:00 +0000
Message-ID: <DM8PR11MB56559040C2DB42E8127B4136E097A@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20250505161217.484268-1-jeevan.b@intel.com>
 <174703044021.67539.4153090071917892715@c664b1dc75d1>
 <DM4PR11MB63120B63F29AAB2E0772BAFF9097A@DM4PR11MB6312.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63120B63F29AAB2E0772BAFF9097A@DM4PR11MB6312.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: imre.deak@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5655:EE_|PH7PR11MB6555:EE_
x-ms-office365-filtering-correlation-id: 10eae7b4-a415-46aa-6868-08dd912084ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|13003099007|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?MHVtbGlDSXFPbitzQUtoaUZLN1M1cXNCNGN1bWxoL204VEc4Zms2Q3I1UVlJ?=
 =?utf-8?B?RXVPcHlXNHBLcG9OTnNiMU1CdnBsQkRzS3g4bktUSS9BYU1qdzhpdW1wWURT?=
 =?utf-8?B?QjMxOGRuSjBPdk15OGpuNE15NmhGbG9KZlFtVk1ISWdjV1M5bnoycHE5YitC?=
 =?utf-8?B?QnRlRWpqd2YyRUVTK1ZSb01yMWhGdCtTdndvdmNQaVhVeTB5NDlubFdmdHZh?=
 =?utf-8?B?Sm1QNXVPaDVNQUhOcCs1bWNSTzAvNGo3ckxYOStldlo3SGJ4YzZyRjRtNEpU?=
 =?utf-8?B?dk1qN2JzMnNZY2tkSitzZVFGc3VXc0J3ek9sbE5DaXlaYkJwTGFFbUFzVnRa?=
 =?utf-8?B?WDllcExJVjVOMVo2d0N5WnE3dVE4L0lIdXB2SGgwb2FxRkY2eXc4WFc2UjU3?=
 =?utf-8?B?OVh3ay9YaVVkclhuajJIODJreWd1MnNyQklpbll6L0V4S2RLYzg3Si9UTkxq?=
 =?utf-8?B?bjlJWUdubDAyR0M1YzJyeXdOeGE5UnhvY1pMRzV1Vml4blM3TWZJUDdjYUN5?=
 =?utf-8?B?RXY2LzJzUnVCUWJ5M3ZKYWVzN3ViT2h6UFA3Um9YUCtGUm1zYkVQTWc4b3Uv?=
 =?utf-8?B?Q2h2MXZPVm1IdVZEWjFPdWg5anVBaGJoUTJ6MkdaSFR4QWlURjkxUFYxdXRp?=
 =?utf-8?B?aUV1NUpjdFFBdWdXU3k5MXlNeUFKMVFoOXN2cUhreW1DZHB1NnljOHdzdEUr?=
 =?utf-8?B?eFQrZUs3dTV3bWM3ZjRNdVlUNTkyWlZoK1BVdis2ZHRiWDhzRzJUdmFVVkdw?=
 =?utf-8?B?dkUxWlFVcFpyZVRPbW9qNUVWV2Y5Y3JxcWhUbU12VWJqbkhEZnc0WEtTK2du?=
 =?utf-8?B?aG9PS3phUytUTnNWMzNJaStZeHZ1TXAyT2NUTWNwc1NNNVQxSk1XQW01THBu?=
 =?utf-8?B?dnZwVkd4NHJSS010cjNXdm50NFk0eEd6VnI4OWllQjdveVdxdjFuNGtZSGNR?=
 =?utf-8?B?OW5rNjZRaDdIT0U1YVpYY2MyWURDdjhiU1k4SG1oMnk5WWV1eVV2aWkxUXpV?=
 =?utf-8?B?eTlwekVsTEUzdmF4dUFlWWkzb2U5eXdCRkV5V2pQK29lZjdxSTlIaHk3TDZj?=
 =?utf-8?B?Snh3SVpGTGRhbWdkdXNIanF2NnYweDR5UmtWQTlRMUxOR0hBYUphWlhmWUho?=
 =?utf-8?B?cmc2N3Ftem10a1hGSTJCeW9nM1pNaTM0MXRSbGhieVlFTU56UjhDK2pZYW03?=
 =?utf-8?B?a0dXYjR6emJ0ZTQzOFBrWGExWC94T0llZ0FDT25lRjR4TGhRK25ZdFYvNDQx?=
 =?utf-8?B?eG95Ly9CK3ZvYUc2ZmRpNldSdE1pMGl0SWFhWFNRdjhuVU0wRVAyM2d5WkMr?=
 =?utf-8?B?dWtCMXdtOTE1R2RCcWJvMjFBQWFlNWU2a2NnNEZ1L2RvbmZtQkNsN2w5S0hq?=
 =?utf-8?B?SzdHVkZwbThBNHdITk5TNTgwQzVzMTgrK3RpeGVrUE9jaVppblVwQUorVUxw?=
 =?utf-8?B?WmM5S2w5YjBYdERCWXQra1JTZGhDOGQ1b3JJUW4vck9oNXBUekdtYzlPODVP?=
 =?utf-8?B?SUpnZElZeFVpU1FFRjNGUVNMTysraU1aR01WbzBQV0I3ZVplUEVjekhsbGk2?=
 =?utf-8?B?UTMrZGc1LzhmT01uN2JEeW91UWhvNlZlUDM4V0dtTzdQczR2U1l3V2xtZVA1?=
 =?utf-8?B?OTNxS3dISjRpNkVtc3VQNmtjOW9oNGlxajY1R3grWjVkckkyK09HM0JTNkMw?=
 =?utf-8?B?MktoV1FIR0NlZGRNR2hFU3d0MXQ4OXQ0dnNqVVk4Uno5aXd6Vm9Tb1dTdjNC?=
 =?utf-8?B?bnp5M2J4VCtlbGJOWGk4QkpUZmR4M205b1Q2M2U2QVcyVjVzMGhYYlVGbEl6?=
 =?utf-8?B?R1ZERjRWRjMydlowb2NUcXZOSlhXQmRqekhoZkxTYnF3aVBqK0I2OVZwOVVS?=
 =?utf-8?B?MmM2YmN5V0RDRFpXOExJR1N0UmJNN1dRdjFaTVlML2hTN0dRdEZFeHhDNHFo?=
 =?utf-8?Q?H38W/kO3BUE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5655.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(13003099007)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UG1BNGVtWE51d0Z2U09Jb2l1ODBCU1hBWTcySFRNcXJTajVGaDZRY01UWWhX?=
 =?utf-8?B?YW1sMllhbXZHQ2V0bDl5Q3E2U1lrcDVtNklIblVOTDBGQWdwM0FpMnVuNVVM?=
 =?utf-8?B?WlFmd0JxcHY1WmlRcDBOc01VMjJxYnAyQU5ZL1RLWVdMc3FYdTNuaGlycmdJ?=
 =?utf-8?B?WE9zSmZZbkN5c3l3SmdSa2FyU3Z4d3JGS2JtZ3pXRXArWU9jN2RIcEVCd1Jk?=
 =?utf-8?B?YVkydWt0ekhSVEpuQ2p3b1R1UHdBYmJlOXhvenNUYSs5Y1JWMW5WYkI1SWxM?=
 =?utf-8?B?Mm5UbnFHdTdrUVJ0UHRiWllnSnloeWlCam1GTjVtbzdoZ0VFM1c3WWxYam80?=
 =?utf-8?B?dE9pS0hQRTNrZ3dpMElEczE3WjhCY2VjbUo3NkY1NXo4V1BCYlVSNG1tT2ds?=
 =?utf-8?B?S3ZNQTQ1WTFOT0QxZGlyQm1iVTBUbkwwSjExRnM0WElVZDQvWGF0eWxxTmJ3?=
 =?utf-8?B?ZUZzQnZJQlhPN0hack5jcklEdmhYcDdXN1c4eEJka01UcEY1ZG1WaVkyWW8x?=
 =?utf-8?B?ZHZrUWphYitacWZldkprRXlvdGcva3Exc0VIeFNhTDNzZWNxZnVnd05IMHB2?=
 =?utf-8?B?cmVaYm5JVTFSbUwxeFRPYStDREU2SldwdHYxaDgzWWdrUk5SWGtDVG00ck4y?=
 =?utf-8?B?cTZvSFd2VFEwMlhmWlFvZ2ZPRW04d2F4VmJyZDBkcm1TbGRVSWFhRVp6UC9G?=
 =?utf-8?B?N0FaamE5eWduZnY3K3FKTGxIblN3L3FONTBDQ0V6emhFQzM4UDd3QklmQVhv?=
 =?utf-8?B?MnZ0Z0dGc0dmTTZDVFFjdloyTUhBa212WmdDNC9qWlg3L2R3azZxTGhkL3pM?=
 =?utf-8?B?QXc2YmhDb1VYWHNnd0NyaEJzTnZqWlZNc3RXSXR6QmN5dGp1K1U0SEpqYW5O?=
 =?utf-8?B?UU5OMTU2QWdBZ2R5N3ZNVFBucjlFYVZwSTgwUldMTmNqdGR6cSs2Y3QycTZF?=
 =?utf-8?B?WEUrRkI5eUUxcEs0MHBpNHJEWTF5R0RBNENhMWpKRXZZYkZyczZSdDJwc09t?=
 =?utf-8?B?V0NjMitLWWo5bkRyR3NvK3lQcUh4SjFBdGxHWTdkd0dCVEp0eU1IQkhsVkpi?=
 =?utf-8?B?SFhzUVFlUzBtanhBb1F3VGhXd2FFL3Rja0hFb1JxQWhEclFhOVUyK2lLRmo5?=
 =?utf-8?B?RDY4S2REbjI4K253QWdMZkdiZHZJWG1pWmVVQW1vNzZMWmtFZzhpM3U1alow?=
 =?utf-8?B?WXFZMlNPdTlvT1JTYlpTVU0rL1ZvbUx2ZjdldnQyRGQ0UFFuNGo1bEl1YVMx?=
 =?utf-8?B?S0xVTzVnMWt2bmRpQWlrSGgwRzlpNG1DdVBIZGlVeHV4cXVxR1NZR2REL2pB?=
 =?utf-8?B?cFBuWW9CSkw1YmlQL2k4NU9PTWdTa281eS9rbmJnYzdlOEo3Tnp2NDdRY2JV?=
 =?utf-8?B?ZlR4MGRFMTZDZityTTI2SGhXQS9HTlhQZ3Q3UmZtWjAvTVQwM1BLdU1FV2Rz?=
 =?utf-8?B?dTk4R3lzTG1xMlA1Q2d2TG95WkFxMWhCVU9ja2tDd0srd3BOWVMvV0NRejdJ?=
 =?utf-8?B?V2RaZkdTdmVGMUVqMzkvaHlUOTdGOTM4bHRUbHNHZUFudSt5V0JGMVBMa0ND?=
 =?utf-8?B?VHRZaTN1eUUvSGdSdmRBN2dvNW9FblpLbHQ4akZWTUswUzMrWmZNOElxbHVP?=
 =?utf-8?B?ajIzMk9JQ3UvcXpWVERXQVZtakJ4T3B0MjlnKzBrdExQbGpsOEY5bzVwek5J?=
 =?utf-8?B?WVpsaEkvRXczM01nZjQ3SnEzUGVocVpEMmdQcWlhOFV2czFyaVdRUHRrOWZT?=
 =?utf-8?B?amE3cUFsby9HQjVDaFIyNlh1Q1UrMXlLcVZ2NGczcVErSFQ0M2syRHc4VDQ1?=
 =?utf-8?B?WFB4bEtvRFYzbzhDOS9VL09LdSttVTFXczdpZ1dQN3pDNlpzTk5QZmdPcmpp?=
 =?utf-8?B?aVZTd01JL3czTkdvenFxdCtLMS8yWWYzd0lqc1pSdnpTUEk5NzJ0eWE4cHJ0?=
 =?utf-8?B?Rk0rbTNwYlJ4M1ovNGlJb2FSNHN0UDlVQUNZV3NPVStDY1RvVlVpd1lUZmU4?=
 =?utf-8?B?cHU0TmJDQ3RIZFFRdjYzM0FjQlB3MWVSQ1J6b29oczFDTUFyN2F4dzJZODha?=
 =?utf-8?B?K3RsVndXWkZnVjF4OFV2WWRMaGpoNlloTXhZa2RrOWpxVGhyZHNJRVV3QlZB?=
 =?utf-8?Q?A2Ae3ZnF10Trraw9LcKFC5/7s?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5655.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10eae7b4-a415-46aa-6868-08dd912084ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 06:45:00.7255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L+n4fsSH/AM8KK8OxB7F4lzr/L4QMnpOuNJO0OFUcBd+IMawEa+myO0iXEwbmxcuCAgr1f6mibxxvi7DYl2Hdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6555
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

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGln
dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBCLA0KPiBK
ZWV2YW4NCj4gU2VudDogTW9uZGF5LCAxMiBNYXkgMjAyNSA5LjIwDQo+IFRvOiBpZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSRTog4pyXIGk5MTUuQ0kuQkFUOiBmYWls
dXJlIGZvciB0ZXN0cy9rbXNfZGlzcGxheV9tb2RlczogRml0IG1vZGVzDQo+IHdpdGhpbiBNU1Qg
YmFuZHdpZHRoIGNvbnN0cmFpbnRzIChyZXY3KQ0KPiANCj4gRmFpbHVyZSBpcyBub3QgcmVsYXRl
ZCB0byBwYXRjaCBwbGVhc2UgcmUtcmVwb3J0IHRoaXMuDQogDQo+IFRoYW5rcw0KPiANCj4gSmVl
dmFuIEINCj4gDQo+IA0KPiANCj4gRnJvbTogUGF0Y2h3b3JrIDxwYXRjaHdvcmtAZW1lcmlsLmZy
ZWVkZXNrdG9wLm9yZz4NCj4gU2VudDogTW9uZGF5LCBNYXkgMTIsIDIwMjUgMTE6NDQgQU0NCj4g
VG86IEIsIEplZXZhbiA8amVldmFuLmJAaW50ZWwuY29tPg0KPiBDYzogaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gU3ViamVjdDog4pyXIGk5MTUuQ0kuQkFUOiBmYWlsdXJlIGZvciB0
ZXN0cy9rbXNfZGlzcGxheV9tb2RlczogRml0IG1vZGVzDQo+IHdpdGhpbiBNU1QgYmFuZHdpZHRo
IGNvbnN0cmFpbnRzIChyZXY3KQ0KPiANCj4gDQo+IA0KPiBQYXRjaCBEZXRhaWxzDQo+IA0KPiBT
ZXJpZXM6DQo+IA0KPiB0ZXN0cy9rbXNfZGlzcGxheV9tb2RlczogRml0IG1vZGVzIHdpdGhpbiBN
U1QgYmFuZHdpZHRoIGNvbnN0cmFpbnRzDQo+IChyZXY3KQ0KPiANCj4gVVJMOg0KPiANCj4gaHR0
cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy8xNDY2NTMvDQo+IA0KPiBTdGF0
ZToNCj4gDQo+IGZhaWx1cmUNCj4gDQo+IERldGFpbHM6DQo+IA0KPiBodHRwczovL2ludGVsLWdm
eC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBXXzEzMTA5L2luZGV4Lmh0bWwNCj4gDQo+IA0K
PiBDSSBCdWcgTG9nIC0gY2hhbmdlcyBmcm9tIElHVF84MzYxIC0+IElHVFBXXzEzMTA5DQo+IA0K
PiANCj4gU3VtbWFyeQ0KPiANCj4gDQo+IEZBSUxVUkUNCj4gDQo+IFNlcmlvdXMgdW5rbm93biBj
aGFuZ2VzIGNvbWluZyB3aXRoIElHVFBXXzEzMTA5IGFic29sdXRlbHkgbmVlZCB0byBiZQ0KPiB2
ZXJpZmllZCBtYW51YWxseS4NCj4gDQo+IElmIHlvdSB0aGluayB0aGUgcmVwb3J0ZWQgY2hhbmdl
cyBoYXZlIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgY2hhbmdlcw0KPiBpbnRyb2R1Y2VkIGluIElH
VFBXXzEzMTA5LCBwbGVhc2Ugbm90aWZ5IHlvdXIgYnVnIHRlYW0gKEk5MTUtY2ktDQo+IGluZnJh
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyA8bWFpbHRvOkk5MTUtY2ktaW5mcmFAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnPiApIHRvDQo+IGFsbG93IHRoZW0gdG8gZG9jdW1lbnQgdGhpcyBuZXcgZmFpbHVy
ZSBtb2RlLCB3aGljaCB3aWxsIHJlZHVjZSBmYWxzZQ0KPiBwb3NpdGl2ZXMgaW4gQ0kuDQo+IA0K
PiBFeHRlcm5hbCBVUkw6IGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS0NCj4g
dGlwL0lHVFBXXzEzMTA5L2luZGV4Lmh0bWwgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS0NCj4gdGlwL0lHVFBXXzEzMTA5L2luZGV4Lmh0bWw+DQo+IA0KPiANCj4gUGFydGlj
aXBhdGluZyBob3N0cyAoNDMgLT4gNDMpDQo+IA0KPiANCj4gTm8gY2hhbmdlcyBpbiBwYXJ0aWNp
cGF0aW5nIGhvc3RzDQo+IA0KPiANCj4gUG9zc2libGUgbmV3IGlzc3Vlcw0KPiANCj4gDQo+IEhl
cmUgYXJlIHRoZSB1bmtub3duIGNoYW5nZXMgdGhhdCBtYXkgaGF2ZSBiZWVuIGludHJvZHVjZWQg
aW4NCj4gSUdUUFdfMTMxMDk6DQo+IA0KPiANCj4gSUdUIGNoYW5nZXMNCj4gDQo+IA0KPiBQb3Nz
aWJsZSByZWdyZXNzaW9ucw0KPiANCj4gDQo+ICoJaWd0QGk5MTVfbW9kdWxlX2xvYWRAbG9hZDoN
Cj4gDQo+IAkqCWJhdC1tdGxwLTk6IFBBU1MgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90
cmVlL2RybS0NCj4gdGlwL0lHVF84MzYxL2JhdC1tdGxwLTkvaWd0QGk5MTVfbW9kdWxlX2xvYWRA
bG9hZC5odG1sPiAgLT4gQUJPUlQNCj4gPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVl
L2RybS10aXAvSUdUUFdfMTMxMDkvYmF0LW10bHAtDQo+IDkvaWd0QGk5MTVfbW9kdWxlX2xvYWRA
bG9hZC5odG1sPg0KDQpMb29rcyBsaWtlIHRoaXMgaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL2RybS9pOTE1L2tlcm5lbC8tL2lzc3Vlcy8xMzQ5NCAsIEBEZWFrLCBJbXJlIHNob3VsZCB0
aGlzIGFib3J0PyANCg0KPiANCj4gDQo+IEtub3duIGlzc3Vlcw0KPiANCj4gDQo+IEhlcmUgYXJl
IHRoZSBjaGFuZ2VzIGZvdW5kIGluIElHVFBXXzEzMTA5IHRoYXQgY29tZSBmcm9tIGtub3duIGlz
c3VlczoNCj4gDQo+IA0KPiBJR1QgY2hhbmdlcw0KPiANCj4gDQo+IElzc3VlcyBoaXQNCj4gDQo+
IA0KPiAqCWlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+IA0KPiAJKgliYXQtYXJsaC0zOiBQQVNT
IDxodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9JR1RfODM2MS9i
YXQtYXJsaC0zL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbD4gIC0+IERNRVNHLUZBSUwNCj4g
PGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTMxMDkvYmF0
LWFybGgtDQo+IDMvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZS5odG1sPiAgKGk5MTUjMTQyNDMNCj4g
PGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
MTQyNDM+ICkgKzEgb3RoZXINCj4gdGVzdCBkbWVzZy1mYWlsDQo+IA0KPiAqCWlndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAbW1hbjoNCj4gDQo+IAkqCWJhdC1hdHNtLTE6IE5PVFJVTiAtPiBETUVTRy1G
QUlMIDxodHRwczovL2ludGVsLWdmeC0NCj4gY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9JR1RQV18x
MzEwOS9iYXQtYXRzbS0NCj4gMS9pZ3RAaTkxNV9zZWxmdGVzdEBsaXZlQG1tYW4uaHRtbD4gIChp
OTE1IzE0MjA0DQo+IDxodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2Vy
bmVsLy0vaXNzdWVzLzE0MjA0PiApDQo+IA0KPiAqCWlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29y
a2Fyb3VuZHM6DQo+IA0KPiAJKgliYXQtZGcyLTE0OiBQQVNTIDxodHRwczovL2ludGVsLWdmeC1j
aS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9JR1RfODM2MS9iYXQtZGcyLTE0L2lndEBpOTE1X3Nl
bGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbD4gIC0+DQo+IERNRVNHLUZBSUwgPGh0dHBzOi8v
aW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUUFdfMTMxMDkvYmF0LWRnMi0NCj4g
MTQvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJvdW5kcy5odG1sPiAgKGk5MTUjMTIwNjEN
Cj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1
ZXMvMTIwNjE+ICkgKzEgb3RoZXINCj4gdGVzdCBkbWVzZy1mYWlsDQo+IA0KPiANCj4gUG9zc2li
bGUgZml4ZXMNCj4gDQo+IA0KPiAqCWlndEBkbWFidWZAYWxsLXRlc3RzQGRtYV9mZW5jZV9jaGFp
bjoNCj4gDQo+IAkqCWZpLWJzdy1uMzA1MDogSU5DT01QTEVURSA8aHR0cHM6Ly9pbnRlbC1nZngt
DQo+IGNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgzNjEvZmktYnN3LW4zMDUwL2lndEBkbWFi
dWZAYWxsLQ0KPiB0ZXN0c0BkbWFfZmVuY2VfY2hhaW4uaHRtbD4gIChpOTE1IzEyOTA0DQo+IDxo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2k5MTUva2VybmVsLy0vaXNzdWVzLzEy
OTA0PiApIC0+IFBBU1MNCj4gPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS10
aXAvSUdUUFdfMTMxMDkvZmktYnN3LQ0KPiBuMzA1MC9pZ3RAZG1hYnVmQGFsbC10ZXN0c0BkbWFf
ZmVuY2VfY2hhaW4uaHRtbD4gICsxIG90aGVyIHRlc3QgcGFzcw0KPiANCj4gKglpZ3RAaTkxNV9z
ZWxmdGVzdEBsaXZlQHJlcXVlc3RzOg0KPiANCj4gCSoJYmF0LWF0c20tMTogSU5DT01QTEVURSA8
aHR0cHM6Ly9pbnRlbC1nZngtDQo+IGNpLjAxLm9yZy90cmVlL2RybS10aXAvSUdUXzgzNjEvYmF0
LWF0c20tDQo+IDEvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUByZXF1ZXN0cy5odG1sPiAgKGk5MTUj
MTQxMjkNCj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwv
LS9pc3N1ZXMvMTQxMjk+ICkgLT4gUEFTUw0KPiA8aHR0cHM6Ly9pbnRlbC1nZngtY2kuMDEub3Jn
L3RyZWUvZHJtLXRpcC9JR1RQV18xMzEwOS9iYXQtYXRzbS0NCj4gMS9pZ3RAaTkxNV9zZWxmdGVz
dEBsaXZlQHJlcXVlc3RzLmh0bWw+DQo+IA0KPiAqCWlndEBpOTE1X3NlbGZ0ZXN0QGxpdmVAd29y
a2Fyb3VuZHM6DQo+IA0KPiAJKgliYXQtYXJscy02OiBETUVTRy1GQUlMIDxodHRwczovL2ludGVs
LWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tDQo+IHRpcC9JR1RfODM2MS9iYXQtYXJscy02L2lndEBp
OTE1X3NlbGZ0ZXN0QGxpdmVAd29ya2Fyb3VuZHMuaHRtbD4NCj4gKGk5MTUjMTIwNjEgPGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLQ0KPiAvaXNzdWVzLzEy
MDYxPiApIC0+IFBBU1MgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAxLm9yZy90cmVlL2RybS0NCj4g
dGlwL0lHVFBXXzEzMTA5L2JhdC1hcmxzLTYvaWd0QGk5MTVfc2VsZnRlc3RAbGl2ZUB3b3JrYXJv
dW5kcy5odG1sPiAgKzENCj4gb3RoZXIgdGVzdCBwYXNzDQo+IA0KPiANCj4gV2FybmluZ3MNCj4g
DQo+IA0KPiAqCWlndEBpOTE1X3NlbGZ0ZXN0QGxpdmU6DQo+IA0KPiAJKgliYXQtYXRzbS0xOiBJ
TkNPTVBMRVRFIDxodHRwczovL2ludGVsLWdmeC0NCj4gY2kuMDEub3JnL3RyZWUvZHJtLXRpcC9J
R1RfODM2MS9iYXQtYXRzbS0xL2lndEBpOTE1X3NlbGZ0ZXN0QGxpdmUuaHRtbD4NCj4gKGk5MTUj
MTQxMjkgPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLQ0K
PiAvaXNzdWVzLzE0MTI5PiApIC0+IERNRVNHLUZBSUwgPGh0dHBzOi8vaW50ZWwtZ2Z4LWNpLjAx
Lm9yZy90cmVlL2RybS0NCj4gdGlwL0lHVFBXXzEzMTA5L2JhdC1hdHNtLTEvaWd0QGk5MTVfc2Vs
ZnRlc3RAbGl2ZS5odG1sPiAgKGk5MTUjMTIwNjENCj4gPGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMvMTIwNjE+ICAvDQo+IGk5MTUjMTQyMDQg
PGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vaTkxNS9rZXJuZWwvLS9pc3N1ZXMv
MTQyMDQ+DQo+ICkNCj4gDQo+IA0KPiBCdWlsZCBjaGFuZ2VzDQo+IA0KPiANCj4gKglDSTogQ0kt
MjAxOTA1MjkgLT4gTm9uZQ0KPiAqCUlHVDogSUdUXzgzNjEgLT4gSUdUUFdfMTMxMDkNCj4gKglM
aW51eDogQ0lfRFJNXzE2NTI4IC0+IENJX0RSTV8xNjUyOQ0KPiANCj4gQ0ktMjAxOTA1Mjk6IDIw
MTkwNTI5DQo+IENJX0RSTV8xNjUyODogNDQ0NzcxODc3NjY3ZGQ5YWQyY2E2OTVmNDE5NWRjNDQ3
MDY0NGYzOSBADQo+IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Aub3JnL2dmeC1jaS9saW51eA0K
PiBDSV9EUk1fMTY1Mjk6IGUwNTQ5MmU5MjZmZjYyNDcwYzAzNTk4YzBhYzBkN2MzZjM1M2I4Y2Yg
QA0KPiBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9nZngtY2kvbGludXgNCj4gSUdUUFdf
MTMxMDk6IGY4NjFjMzhlYjlmYzY2OGRiMDJjMzRkYjU3NzU0Y2ZiNDMzYTc2YWMgQA0KPiBodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0DQo+IDxodHRw
czovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1ncHUtdG9vbHMuZ2l0Pg0KPiBJR1Rf
ODM2MTogODM2MQ0KDQo=
